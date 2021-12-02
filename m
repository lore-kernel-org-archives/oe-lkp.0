Content-Type: multipart/mixed; boundary="===============6835775234126091266=="
MIME-Version: 1.0
From: Claudio Suarez <cssk@net-c.es>
To: lkp@lists.01.org
Subject: [PATCH] mock a drm_plane in igt_check_plane_state to make the test more robust
Date: Thu, 02 Dec 2021 10:49:49 +0100
Message-ID: <YaiWvQESctDMipjh@gineta.localdomain>
In-Reply-To: <YaiVfZWNyMkG8uED@gineta.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============6835775234126091266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

igt_check_plane_state test crashes in drm_atomic_helper_check_plane_state
when trying to de-reference drm_plane_state->plane->dev
due to the lack of a struct drm_plane in the mock struct drm_plane_state.
Since drm_plane_state always should contain a plane, the mock also
needs a plane to be the test more robust and realistic. Add it.

Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/selftests/test-drm_plane_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/selftests/test-drm_plane_helper.c b/drivers/gp=
u/drm/selftests/test-drm_plane_helper.c
index 0a9553f51796..ceebeede55ea 100644
--- a/drivers/gpu/drm/selftests/test-drm_plane_helper.c
+++ b/drivers/gpu/drm/selftests/test-drm_plane_helper.c
@@ -87,11 +87,15 @@ int igt_check_plane_state(void *ignored)
 				DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
 		},
 	};
+	struct drm_plane plane =3D {
+		.dev =3D NULL
+	};
 	struct drm_framebuffer fb =3D {
 		.width =3D 2048,
 		.height =3D 2048
 	};
 	struct drm_plane_state plane_state =3D {
+		.plane =3D &plane,
 		.crtc =3D ZERO_SIZE_PTR,
 		.fb =3D &fb,
 		.rotation =3D DRM_MODE_ROTATE_0
-- =

2.33.0



--===============6835775234126091266==--

