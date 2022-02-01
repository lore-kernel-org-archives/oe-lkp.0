Content-Type: multipart/mixed; boundary="===============8293590307757147305=="
MIME-Version: 1.0
From: Sean Young <sean@mess.org>
To: lkp@lists.01.org
Subject: [PATCH] selftests/ir: fix build with ancient kernel headers
Date: Tue, 01 Feb 2022 16:53:11 +0000
Message-ID: <YflldzHZPVK3OQRJ@gofer.mess.org>
In-Reply-To: <347bae9f-f775-4976-3d27-b0c725211d78@linuxfoundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8293590307757147305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h"),
the build of the selftests fails on rhel 8 since its version of
/usr/include/linux/lirc.h has no definition of RC_PROTO_RCMM32 etc.

Fixes: e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h")

Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 tools/testing/selftests/ir/ir_loopback.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selft=
ests/ir/ir_loopback.c
index 06256c96df12..8dc104690adc 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -29,6 +29,13 @@
 #define SYSFS_PATH_MAX 256
 #define DNAME_PATH_MAX 256
 =

+/* Support ancient lirc.h which does not have these values */
+#if RC_PROTO_MAX < 26
+#define RC_PROTO_RCMM12 24
+#define RC_PROTO_RCMM24 25
+#define RC_PROTO_RCMM32 26
+#endif
+
 static const struct {
 	enum rc_proto proto;
 	const char *name;
-- =

2.34.1

--===============8293590307757147305==--

