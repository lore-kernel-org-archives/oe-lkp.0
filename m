Content-Type: multipart/mixed; boundary="===============8795972305038151097=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v3 12/13] module: Move kdb_modules list out of core code
Date: Fri, 28 Jan 2022 12:50:45 +0000
Message-ID: <20220128125046.497173-13-atomlin@redhat.com>
In-Reply-To: <20220128125046.497173-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8795972305038151097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional change.

This patch migrates kdb_modules list to core kdb code
since the list of added/or loaded modules is no longer
private.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 kernel/debug/kdb/kdb_main.c | 5 +++++
 kernel/module/main.c        | 4 ----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 0852a537dad4..f101f5f078f4 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -59,6 +59,11 @@ EXPORT_SYMBOL(kdb_grepping_flag);
 int kdb_grep_leading;
 int kdb_grep_trailing;
 =

+#ifdef CONFIG_MODULES
+extern struct list_head modules;
+struct list_head *kdb_modules =3D &modules; /* kdb needs the list of modul=
es */
+#endif /* CONFIG_MODULES */
+
 /*
  * Kernel debugger state flags
  */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 574cba3e0418..1f16e67f687f 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -95,10 +95,6 @@ static void mod_update_bounds(struct module *mod)
 		__mod_update_bounds(mod->init_layout.base, mod->init_layout.size);
 }
 =

-#ifdef CONFIG_KGDB_KDB
-struct list_head *kdb_modules =3D &modules; /* kdb needs the list of modul=
es */
-#endif /* CONFIG_KGDB_KDB */
-
 static void module_assert_mutex_or_preempt(void)
 {
 #ifdef CONFIG_LOCKDEP
-- =

2.34.1

--===============8795972305038151097==--

