Content-Type: multipart/mixed; boundary="===============6058378209795041693=="
MIME-Version: 1.0
From: Oded Gabbay <oded.gabbay@amd.com>
To: lkp@lists.01.org
Subject: [PATCH] drm/radeon: Try to init amdkfd only if 64 bit kernel
Date: Mon, 22 Dec 2014 13:11:13 +0200
Message-ID: <1419246673-7222-1-git-send-email-oded.gabbay@amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6058378209795041693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

amdkfd driver can be compiled only in 64-bit kernel. Therefore, there is no
point in trying to initialize amdkfd in 32-bit kernel.

In addition, in case of specific configuration of 32-bit kernel, no modules=
 and
random kernel base, the symbol_request function doesn't work as expected - =
It
doesn't return NULL if the symbol doesn't exists. That makes the kernel pan=
ic.
Therefore, the as amdkfd doesn't compile in 32-bit kernel, the best way is =
just
to return false immediately.

Signed-off-by: Oded Gabbay <oded.gabbay@amd.com>
---
 drivers/gpu/drm/radeon/radeon_kfd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_kfd.c b/drivers/gpu/drm/radeon/r=
adeon_kfd.c
index 242fd8b..cb77e5c 100644
--- a/drivers/gpu/drm/radeon/radeon_kfd.c
+++ b/drivers/gpu/drm/radeon/radeon_kfd.c
@@ -101,6 +101,7 @@ static const struct kgd2kfd_calls *kgd2kfd;
 =

 bool radeon_kfd_init(void)
 {
+#ifdef CONFIG_X86_64
 	bool (*kgd2kfd_init_p)(unsigned, const struct kfd2kgd_calls*,
 				const struct kgd2kfd_calls**);
 =

@@ -117,6 +118,9 @@ bool radeon_kfd_init(void)
 	}
 =

 	return true;
+#else
+	return false;
+#endif
 }
 =

 void radeon_kfd_fini(void)
-- =

1.9.1


--===============6058378209795041693==--

