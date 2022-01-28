Content-Type: multipart/mixed; boundary="===============1296225595203551503=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 07/13] module: Move extra signature support out of core code
Date: Fri, 28 Jan 2022 13:23:15 +0000
Message-ID: <20220128132321.529594-8-atomlin@redhat.com>
In-Reply-To: <20220128132321.529594-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1296225595203551503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates additional module signature check
code from core module code into kernel/module/signing.c.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 include/linux/module.h   |  5 ++-
 kernel/module/internal.h |  9 +++++
 kernel/module/main.c     | 87 ----------------------------------------
 kernel/module/signing.c  | 75 ++++++++++++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 89 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 7bf93c0d87e6..68dabc036100 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -758,8 +758,8 @@ static inline bool set_livepatch_module(struct module *=
mod)
 }
 #endif /* CONFIG_LIVEPATCH */
 =

-bool is_module_sig_enforced(void);
-void set_module_sig_enforced(void);
+extern bool is_module_sig_enforced(void);
+extern void set_module_sig_enforced(void);
 =

 #else /* !CONFIG_MODULES... */
 =

@@ -949,6 +949,7 @@ static inline bool module_sig_ok(struct module *module)
 {
 	return true;
 }
+#define sig_enforce false
 #endif	/* CONFIG_MODULE_SIG */
 =

 int module_kallsyms_on_each_symbol(int (*fn)(void *, const char *,
diff --git a/kernel/module/internal.h b/kernel/module/internal.h
index 0cd624179545..5aab87716d9f 100644
--- a/kernel/module/internal.h
+++ b/kernel/module/internal.h
@@ -80,3 +80,12 @@ static inline void module_decompress_cleanup(struct load=
_info *info)
 {
 }
 #endif
+
+#ifdef CONFIG_MODULE_SIG
+extern int module_sig_check(struct load_info *info, int flags);
+#else /* !CONFIG_MODULE_SIG */
+static int module_sig_check(struct load_info *info, int flags)
+{
+	return 0;
+}
+#endif /* !CONFIG_MODULE_SIG */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 4f590b0c7aca..36ed4dd64cac 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -22,7 +22,6 @@
 #include <linux/vmalloc.h>
 #include <linux/elf.h>
 #include <linux/proc_fs.h>
-#include <linux/security.h>
 #include <linux/seq_file.h>
 #include <linux/syscalls.h>
 #include <linux/fcntl.h>
@@ -114,28 +113,6 @@ static void module_assert_mutex_or_preempt(void)
 #endif
 }
 =

-#ifdef CONFIG_MODULE_SIG
-static bool sig_enforce =3D IS_ENABLED(CONFIG_MODULE_SIG_FORCE);
-module_param(sig_enforce, bool_enable_only, 0644);
-
-void set_module_sig_enforced(void)
-{
-	sig_enforce =3D true;
-}
-#else
-#define sig_enforce false
-#endif
-
-/*
- * Export sig_enforce kernel cmdline parameter to allow other subsystems r=
ely
- * on that instead of directly to CONFIG_MODULE_SIG_FORCE config.
- */
-bool is_module_sig_enforced(void)
-{
-	return sig_enforce;
-}
-EXPORT_SYMBOL(is_module_sig_enforced);
-
 /* Block module loading/unloading? */
 int modules_disabled =3D 0;
 core_param(nomodule, modules_disabled, bint, 0);
@@ -2516,70 +2493,6 @@ static inline void kmemleak_load_module(const struct=
 module *mod,
 }
 #endif
 =

-#ifdef CONFIG_MODULE_SIG
-static int module_sig_check(struct load_info *info, int flags)
-{
-	int err =3D -ENODATA;
-	const unsigned long markerlen =3D sizeof(MODULE_SIG_STRING) - 1;
-	const char *reason;
-	const void *mod =3D info->hdr;
-	bool mangled_module =3D flags & (MODULE_INIT_IGNORE_MODVERSIONS |
-				       MODULE_INIT_IGNORE_VERMAGIC);
-	/*
-	 * Do not allow mangled modules as a module with version information
-	 * removed is no longer the module that was signed.
-	 */
-	if (!mangled_module &&
-	    info->len > markerlen &&
-	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) =3D=
=3D 0) {
-		/* We truncate the module to discard the signature */
-		info->len -=3D markerlen;
-		err =3D mod_verify_sig(mod, info);
-		if (!err) {
-			info->sig_ok =3D true;
-			return 0;
-		}
-	}
-
-	/*
-	 * We don't permit modules to be loaded into the trusted kernels
-	 * without a valid signature on them, but if we're not enforcing,
-	 * certain errors are non-fatal.
-	 */
-	switch (err) {
-	case -ENODATA:
-		reason =3D "unsigned module";
-		break;
-	case -ENOPKG:
-		reason =3D "module with unsupported crypto";
-		break;
-	case -ENOKEY:
-		reason =3D "module with unavailable key";
-		break;
-
-	default:
-		/*
-		 * All other errors are fatal, including lack of memory,
-		 * unparseable signatures, and signature check failures --
-		 * even if signatures aren't required.
-		 */
-		return err;
-	}
-
-	if (is_module_sig_enforced()) {
-		pr_notice("Loading of %s is rejected\n", reason);
-		return -EKEYREJECTED;
-	}
-
-	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
-}
-#else /* !CONFIG_MODULE_SIG */
-static int module_sig_check(struct load_info *info, int flags)
-{
-	return 0;
-}
-#endif /* !CONFIG_MODULE_SIG */
-
 static int validate_section_offset(struct load_info *info, Elf_Shdr *shdr)
 {
 #if defined(CONFIG_64BIT)
diff --git a/kernel/module/signing.c b/kernel/module/signing.c
index 8aeb6d2ee94b..ff41541e982a 100644
--- a/kernel/module/signing.c
+++ b/kernel/module/signing.c
@@ -11,9 +11,28 @@
 #include <linux/module_signature.h>
 #include <linux/string.h>
 #include <linux/verification.h>
+#include <linux/security.h>
 #include <crypto/public_key.h>
 #include "internal.h"
 =

+static bool sig_enforce =3D IS_ENABLED(CONFIG_MODULE_SIG_FORCE);
+module_param(sig_enforce, bool_enable_only, 0644);
+
+/*
+ * Export sig_enforce kernel cmdline parameter to allow other subsystems r=
ely
+ * on that instead of directly to CONFIG_MODULE_SIG_FORCE config.
+ */
+bool is_module_sig_enforced(void)
+{
+	return sig_enforce;
+}
+EXPORT_SYMBOL(is_module_sig_enforced);
+
+void set_module_sig_enforced(void)
+{
+	sig_enforce =3D true;
+}
+
 /*
  * Verify the signature on a module.
  */
@@ -43,3 +62,59 @@ int mod_verify_sig(const void *mod, struct load_info *in=
fo)
 				      VERIFYING_MODULE_SIGNATURE,
 				      NULL, NULL);
 }
+
+int module_sig_check(struct load_info *info, int flags)
+{
+	int err =3D -ENODATA;
+	const unsigned long markerlen =3D sizeof(MODULE_SIG_STRING) - 1;
+	const char *reason;
+	const void *mod =3D info->hdr;
+
+	/*
+	 * Require flags =3D=3D 0, as a module with version information
+	 * removed is no longer the module that was signed
+	 */
+	if (flags =3D=3D 0 &&
+	    info->len > markerlen &&
+	    memcmp(mod + info->len - markerlen, MODULE_SIG_STRING, markerlen) =3D=
=3D 0) {
+		/* We truncate the module to discard the signature */
+		info->len -=3D markerlen;
+		err =3D mod_verify_sig(mod, info);
+		if (!err) {
+			info->sig_ok =3D true;
+			return 0;
+		}
+	}
+
+	/*
+	 * We don't permit modules to be loaded into the trusted kernels
+	 * without a valid signature on them, but if we're not enforcing,
+	 * certain errors are non-fatal.
+	 */
+	switch (err) {
+	case -ENODATA:
+		reason =3D "unsigned module";
+		break;
+	case -ENOPKG:
+		reason =3D "module with unsupported crypto";
+		break;
+	case -ENOKEY:
+		reason =3D "module with unavailable key";
+		break;
+
+	default:
+		/*
+		 * All other errors are fatal, including lack of memory,
+		 * unparseable signatures, and signature check failures --
+		 * even if signatures aren't required.
+		 */
+		return err;
+	}
+
+	if (is_module_sig_enforced()) {
+		pr_notice("Loading of %s is rejected\n", reason);
+		return -EKEYREJECTED;
+	}
+
+	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
+}
-- =

2.34.1

--===============1296225595203551503==--

