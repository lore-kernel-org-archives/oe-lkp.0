Content-Type: multipart/mixed; boundary="===============9179399462106007172=="
MIME-Version: 1.0
From: Oded Gabbay <oded.gabbay@amd.com>
To: lkp@lists.01.org
Subject: [PATCH v2] drm/radeon: Init amdkfd only if it was compiled
Date: Mon, 29 Dec 2014 10:59:46 +0200
Message-ID: <1419843586-29864-1-git-send-email-oded.gabbay@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9179399462106007172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch changes the radeon_kfd_init(), which is used to initialize the
interface between radeon and amdkfd, so the interface will be initialized o=
nly
if amdkfd was build, either as module or inside the kernel image.

In the modules case, the symbol_request() will be used (same as old code). =
In
the in-image compilation case, a direct call to kgd2kfd_init() will be done.
For other cases, radeon_kfd_init() will just return false.

This patch is necessary because in case of the following specific
configuration: kernel 32-bit, no modules support, random kernel base and no
hibernation, the symbol_request() doesn't work as expected - it doesn't ret=
urn
NULL if the symbol doesn't exists - which makes the kernel panic.

Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
---
 drivers/gpu/drm/radeon/radeon_kfd.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_kfd.c b/drivers/gpu/drm/radeon/r=
adeon_kfd.c
index 242fd8b..d3e78b4 100644
--- a/drivers/gpu/drm/radeon/radeon_kfd.c
+++ b/drivers/gpu/drm/radeon/radeon_kfd.c
@@ -101,6 +101,7 @@ static const struct kgd2kfd_calls *kgd2kfd;
 =

 bool radeon_kfd_init(void)
 {
+#if defined(CONFIG_HSA_AMD_MODULE)
 	bool (*kgd2kfd_init_p)(unsigned, const struct kfd2kgd_calls*,
 				const struct kgd2kfd_calls**);
 =

@@ -117,6 +118,17 @@ bool radeon_kfd_init(void)
 	}
 =

 	return true;
+#elif defined(CONFIG_HSA_AMD)
+	if (!kgd2kfd_init(KFD_INTERFACE_VERSION, &kfd2kgd, &kgd2kfd)) {
+		kgd2kfd =3D NULL;
+
+		return false;
+	}
+
+	return true;
+#else
+	return false;
+#endif
 }
 =

 void radeon_kfd_fini(void)
-- =

1.9.1


--===============9179399462106007172==--

