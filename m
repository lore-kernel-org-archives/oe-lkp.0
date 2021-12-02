Content-Type: multipart/mixed; boundary="===============8571081356563614620=="
MIME-Version: 1.0
From: Claudio Suarez <cssk@net-c.es>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] drm: fix error found in some cases after the patch d1af5cd86997
Date: Thu, 02 Dec 2021 10:51:12 +0100
Message-ID: <YaiXEARd8z2C463h@gineta.localdomain>
In-Reply-To: <YaiVfZWNyMkG8uED@gineta.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============8571081356563614620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
calls in drm core, files drm_a*.c") fails when the drm_device
cannot be found in the parameter plane_state->crtc.
Fix it using plane_state->plane.

Reported-by: kernel test robot <oliver.sang@intel.com>
Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, fi=
les drm_a*.c")
Signed-off-by: Claudio Suarez <cssk@net-c.es>
---
 drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atom=
ic_helper.c
index aef2fbd676e5..a7a05e1e26bb 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -828,8 +828,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plan=
e_state *plane_state,
 	}
 =

 	if (!crtc_state->enable && !can_update_disabled) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Cannot update plane of a disabled CRTC.\n");
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Cannot update plane of a disabled CRTC.\n");
 		return -EINVAL;
 	}
 =

@@ -839,8 +839,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plan=
e_state *plane_state,
 	hscale =3D drm_rect_calc_hscale(src, dst, min_scale, max_scale);
 	vscale =3D drm_rect_calc_vscale(src, dst, min_scale, max_scale);
 	if (hscale < 0 || vscale < 0) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Invalid scaling of plane\n");
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Invalid scaling of plane\n");
 		drm_rect_debug_print("src: ", &plane_state->src, true);
 		drm_rect_debug_print("dst: ", &plane_state->dst, false);
 		return -ERANGE;
@@ -864,8 +864,8 @@ int drm_atomic_helper_check_plane_state(struct drm_plan=
e_state *plane_state,
 		return 0;
 =

 	if (!can_position && !drm_rect_equals(dst, &clip)) {
-		drm_dbg_kms(plane_state->crtc->dev,
-			       "Plane must cover entire CRTC\n");
+		drm_dbg_kms(plane_state->plane->dev,
+			    "Plane must cover entire CRTC\n");
 		drm_rect_debug_print("dst: ", dst, false);
 		drm_rect_debug_print("clip: ", &clip, false);
 		return -EINVAL;
-- =

2.33.0



--===============8571081356563614620==--

