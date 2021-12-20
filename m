Content-Type: multipart/mixed; boundary="===============4272423348955928123=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] drm: fix error found in some cases after the patch d1af5cd86997
Date: Mon, 20 Dec 2021 18:11:31 +0100
Message-ID: <YcC5Qxnj8PvqnS6f@phenom.ffwll.local>
In-Reply-To: <YcBKbn/9oqD2taCk@phenom.ffwll.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============4272423348955928123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 10:18:38AM +0100, Daniel Vetter wrote:
> On Thu, Dec 02, 2021 at 10:51:12AM +0100, Claudio Suarez wrote:
> > The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> > calls in drm core, files drm_a*.c") fails when the drm_device
> > cannot be found in the parameter plane_state->crtc.
> > Fix it using plane_state->plane.
> > =

> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core=
, files drm_a*.c")

My scrip complained about the fixes line, so I fixed it. I guess you've
used the sha1 from your tree, not from upstream? Please always use
upstream sha1 when referencing commits.

Anyway patches are now pushed.

Cheers, Daniel

> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> =

> Sorry I missed these two patches, but both applied now, thanks.
> -Daniel
> =

> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index aef2fbd676e5..a7a05e1e26bb 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -828,8 +828,8 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  	}
> >  =

> >  	if (!crtc_state->enable && !can_update_disabled) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Cannot update plane of a disabled CRTC.\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Cannot update plane of a disabled CRTC.\n");
> >  		return -EINVAL;
> >  	}
> >  =

> > @@ -839,8 +839,8 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  	hscale =3D drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> >  	vscale =3D drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> >  	if (hscale < 0 || vscale < 0) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Invalid scaling of plane\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Invalid scaling of plane\n");
> >  		drm_rect_debug_print("src: ", &plane_state->src, true);
> >  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> >  		return -ERANGE;
> > @@ -864,8 +864,8 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  		return 0;
> >  =

> >  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Plane must cover entire CRTC\n");
> > +		drm_dbg_kms(plane_state->plane->dev,
> > +			    "Plane must cover entire CRTC\n");
> >  		drm_rect_debug_print("dst: ", dst, false);
> >  		drm_rect_debug_print("clip: ", &clip, false);
> >  		return -EINVAL;
> > -- =

> > 2.33.0
> > =

> > =

> > =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--===============4272423348955928123==--

