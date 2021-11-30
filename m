Content-Type: multipart/mixed; boundary="===============6731411888637787575=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm: fix error found in some cases after the patch d1af5cd86997
Date: Tue, 30 Nov 2021 09:38:11 +0100
Message-ID: <YaXi803g7iv9MxWR@phenom.ffwll.local>
In-Reply-To: <YaUpsaP7hng6zpFh@gineta.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============6731411888637787575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 08:27:45PM +0100, Claudio Suarez wrote:
> The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> calls in drm core, files drm_a*.c") fails when the drm_device
> cannot be found in the parameter plane_state. Fix it.
> =

> Reported-by: kernel test robot <oliver.sang@intel.com>
> Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core, =
files drm_a*.c")
> Signed-off-by: Claudio Suarez <cssk@net-c.es>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index aef2fbd676e5..8bd4472d7949 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -312,7 +312,7 @@ update_connector_routing(struct drm_atomic_state *sta=
te,
>  =

>  	if (!new_connector_state->crtc) {
>  		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
> -				connector->base.id, connector->name);
> +			       connector->base.id, connector->name);

Can you pls split this checkpatch fix out?

>  =

>  		set_best_encoder(state, new_connector_state, NULL);
>  =

> @@ -805,6 +805,7 @@ int drm_atomic_helper_check_plane_state(struct drm_pl=
ane_state *plane_state,
>  					bool can_update_disabled)
>  {
>  	struct drm_framebuffer *fb =3D plane_state->fb;
> +	struct drm_device *dev =3D plane_state->plane ? plane_state->plane->dev=
 : NULL;

For real drivers plane_state->plane really should never be NULL, and
looking at the test report we blow up in an selftest. I think the right
fix here is to make the selftest more robust and also mock a drm_plane
(with a NULL plane->dev pointer, that should be fine).

Can you pls spin that and test it with the selftests enabled in the
config?

Thanks, Daniel

>  	struct drm_rect *src =3D &plane_state->src;
>  	struct drm_rect *dst =3D &plane_state->dst;
>  	unsigned int rotation =3D plane_state->rotation;
> @@ -828,8 +829,7 @@ int drm_atomic_helper_check_plane_state(struct drm_pl=
ane_state *plane_state,
>  	}
>  =

>  	if (!crtc_state->enable && !can_update_disabled) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Cannot update plane of a disabled CRTC.\n");
> +		drm_dbg_kms(dev, "Cannot update plane of a disabled CRTC.\n");
>  		return -EINVAL;
>  	}
>  =

> @@ -839,8 +839,7 @@ int drm_atomic_helper_check_plane_state(struct drm_pl=
ane_state *plane_state,
>  	hscale =3D drm_rect_calc_hscale(src, dst, min_scale, max_scale);
>  	vscale =3D drm_rect_calc_vscale(src, dst, min_scale, max_scale);
>  	if (hscale < 0 || vscale < 0) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Invalid scaling of plane\n");
> +		drm_dbg_kms(dev, "Invalid scaling of plane\n");
>  		drm_rect_debug_print("src: ", &plane_state->src, true);
>  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
>  		return -ERANGE;
> @@ -864,8 +863,7 @@ int drm_atomic_helper_check_plane_state(struct drm_pl=
ane_state *plane_state,
>  		return 0;
>  =

>  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> -		drm_dbg_kms(plane_state->crtc->dev,
> -			       "Plane must cover entire CRTC\n");
> +		drm_dbg_kms(dev, "Plane must cover entire CRTC\n");
>  		drm_rect_debug_print("dst: ", dst, false);
>  		drm_rect_debug_print("clip: ", &clip, false);
>  		return -EINVAL;
> -- =

> 2.33.0
> =

> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--===============6731411888637787575==--

