Content-Type: multipart/mixed; boundary="===============6021165908444241620=="
MIME-Version: 1.0
From: Aaron Tomlin <atomlin@redhat.com>
To: lkp@lists.01.org
Subject: [RFC PATCH v4 01/13] module: Move all into module/
Date: Mon, 31 Jan 2022 12:45:30 +0000
Message-ID: <20220131124542.1389280-1-atomlin@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6021165908444241620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

No functional changes.

This patch moves all module related code into a separate directory,
modifies each file name and creates a new Makefile. Note: this effort
is in preparation to refactor core module code.

Signed-off-by: Aaron Tomlin <atomlin@redhat.com>
---
 MAINTAINERS                                         | 2 +-
 kernel/Makefile                                     | 5 +----
 kernel/module/Makefile                              | 9 +++++++++
 kernel/{module_decompress.c =3D> module/decompress.c} | 2 +-
 kernel/{module-internal.h =3D> module/internal.h}     | 0
 kernel/{module.c =3D> module/main.c}                  | 2 +-
 kernel/{module_signature.c =3D> module/signature.c}   | 0
 kernel/{module_signing.c =3D> module/signing.c}       | 2 +-
 8 files changed, 14 insertions(+), 8 deletions(-)
 create mode 100644 kernel/module/Makefile
 rename kernel/{module_decompress.c =3D> module/decompress.c} (99%)
 rename kernel/{module-internal.h =3D> module/internal.h} (100%)
 rename kernel/{module.c =3D> module/main.c} (99%)
 rename kernel/{module_signature.c =3D> module/signature.c} (100%)
 rename kernel/{module_signing.c =3D> module/signing.c} (97%)

diff --git a/MAINTAINERS b/MAINTAINERS
index acd112c42255..a98f4700acb7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12976,7 +12976,7 @@ L:	linux-kernel(a)vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modu=
les-next
 F:	include/linux/module.h
-F:	kernel/module.c
+F:	kernel/module/main.c
 =

 MONOLITHIC POWER SYSTEM PMIC DRIVER
 M:	Saravanan Sekar <sravanhome@gmail.com>
diff --git a/kernel/Makefile b/kernel/Makefile
index 56f4ee97f328..3a6380975c57 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -53,6 +53,7 @@ obj-y +=3D rcu/
 obj-y +=3D livepatch/
 obj-y +=3D dma/
 obj-y +=3D entry/
+obj-y +=3D module/
 =

 obj-$(CONFIG_KCMP) +=3D kcmp.o
 obj-$(CONFIG_FREEZER) +=3D freezer.o
@@ -66,10 +67,6 @@ ifneq ($(CONFIG_SMP),y)
 obj-y +=3D up.o
 endif
 obj-$(CONFIG_UID16) +=3D uid16.o
-obj-$(CONFIG_MODULES) +=3D module.o
-obj-$(CONFIG_MODULE_DECOMPRESS) +=3D module_decompress.o
-obj-$(CONFIG_MODULE_SIG) +=3D module_signing.o
-obj-$(CONFIG_MODULE_SIG_FORMAT) +=3D module_signature.o
 obj-$(CONFIG_KALLSYMS) +=3D kallsyms.o
 obj-$(CONFIG_BSD_PROCESS_ACCT) +=3D acct.o
 obj-$(CONFIG_CRASH_CORE) +=3D crash_core.o
diff --git a/kernel/module/Makefile b/kernel/module/Makefile
new file mode 100644
index 000000000000..2902fc7d0ef1
--- /dev/null
+++ b/kernel/module/Makefile
@@ -0,0 +1,9 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Makefile for linux kernel module support
+#
+
+obj-$(CONFIG_MODULES) +=3D main.o
+obj-$(CONFIG_MODULE_DECOMPRESS) +=3D decompress.o
+obj-$(CONFIG_MODULE_SIG) +=3D signing.o
+obj-$(CONFIG_MODULE_SIG_FORMAT) +=3D signature.o
diff --git a/kernel/module_decompress.c b/kernel/module/decompress.c
similarity index 99%
rename from kernel/module_decompress.c
rename to kernel/module/decompress.c
index b01c69c2ff99..c153fd8a4444 100644
--- a/kernel/module_decompress.c
+++ b/kernel/module/decompress.c
@@ -12,7 +12,7 @@
 #include <linux/sysfs.h>
 #include <linux/vmalloc.h>
 =

-#include "module-internal.h"
+#include "internal.h"
 =

 static int module_extend_max_pages(struct load_info *info, unsigned int ex=
tent)
 {
diff --git a/kernel/module-internal.h b/kernel/module/internal.h
similarity index 100%
rename from kernel/module-internal.h
rename to kernel/module/internal.h
diff --git a/kernel/module.c b/kernel/module/main.c
similarity index 99%
rename from kernel/module.c
rename to kernel/module/main.c
index 387ee77bdbd6..d8c6269af6cf 100644
--- a/kernel/module.c
+++ b/kernel/module/main.c
@@ -58,7 +58,7 @@
 #include <linux/dynamic_debug.h>
 #include <linux/audit.h>
 #include <uapi/linux/module.h>
-#include "module-internal.h"
+#include "internal.h"
 =

 #define CREATE_TRACE_POINTS
 #include <trace/events/module.h>
diff --git a/kernel/module_signature.c b/kernel/module/signature.c
similarity index 100%
rename from kernel/module_signature.c
rename to kernel/module/signature.c
diff --git a/kernel/module_signing.c b/kernel/module/signing.c
similarity index 97%
rename from kernel/module_signing.c
rename to kernel/module/signing.c
index 8723ae70ea1f..8aeb6d2ee94b 100644
--- a/kernel/module_signing.c
+++ b/kernel/module/signing.c
@@ -12,7 +12,7 @@
 #include <linux/string.h>
 #include <linux/verification.h>
 #include <crypto/public_key.h>
-#include "module-internal.h"
+#include "internal.h"
 =

 /*
  * Verify the signature on a module.
-- =

2.34.1

--===============6021165908444241620==--

