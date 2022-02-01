Content-Type: multipart/mixed; boundary="===============6534835850968222596=="
MIME-Version: 1.0
From: Sean Young <sean@mess.org>
To: lkp@lists.01.org
Subject: [PATCH v2] selftests/ir: fix build with ancient kernel headers
Date: Tue, 01 Feb 2022 18:38:36 +0000
Message-ID: <Yfl+LOPk+KQdc0Us@gofer.mess.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6534835850968222596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Since commit e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h"),
the build of the selftests fails on rhel 8 since its version of
/usr/include/linux/lirc.h has no definition of RC_PROTO_RCMM32, etc [1].

[1] https://lkml.org/lkml/2022/1/28/275

Fixes: e2bcbd7769ee ("tools headers UAPI: remove stale lirc.h")
Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
Reported-by: kernel test robot <oliver.sang@intel.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 tools/testing/selftests/ir/ir_loopback.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/ir/ir_loopback.c b/tools/testing/selft=
ests/ir/ir_loopback.c
index 06256c96df12..f4a15cbdd5ea 100644
--- a/tools/testing/selftests/ir/ir_loopback.c
+++ b/tools/testing/selftests/ir/ir_loopback.c
@@ -29,6 +29,16 @@
 #define SYSFS_PATH_MAX 256
 #define DNAME_PATH_MAX 256
 =

+/*
+ * Support ancient lirc.h which does not have these values. Can be removed
+ * once RHEL 8 is no longer a relevant testing platform.
+ */
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

--===============6534835850968222596==--

