Content-Type: multipart/mixed; boundary="===============0381847208172551048=="
MIME-Version: 1.0
From: Claudio Suarez <cssk@net-c.es>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm: fix error found in some cases after the patch d1af5cd86997
Date: Thu, 02 Dec 2021 10:44:29 +0100
Message-ID: <YaiVfZWNyMkG8uED@gineta.localdomain>
In-Reply-To: <YaXi803g7iv9MxWR@phenom.ffwll.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============0381847208172551048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 09:38:11AM +0100, Daniel Vetter wrote:
> On Mon, Nov 29, 2021 at 08:27:45PM +0100, Claudio Suarez wrote:
> > The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> > calls in drm core, files drm_a*.c") fails when the drm_device
> > cannot be found in the parameter plane_state. Fix it.
> > =

> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm core=
, files drm_a*.c")
> > Signed-off-by: Claudio Suarez <cssk@net-c.es>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 12 +++++-------
> >  1 file changed, 5 insertions(+), 7 deletions(-)
> > =

> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index aef2fbd676e5..8bd4472d7949 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -312,7 +312,7 @@ update_connector_routing(struct drm_atomic_state *s=
tate,
> >  =

> >  	if (!new_connector_state->crtc) {
> >  		drm_dbg_atomic(connector->dev, "Disabling [CONNECTOR:%d:%s]\n",
> > -				connector->base.id, connector->name);
> > +			       connector->base.id, connector->name);
> =

> Can you pls split this checkpatch fix out?

Of course.

> =

> >  =

> >  		set_best_encoder(state, new_connector_state, NULL);
> >  =

> > @@ -805,6 +805,7 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  					bool can_update_disabled)
> >  {
> >  	struct drm_framebuffer *fb =3D plane_state->fb;
> > +	struct drm_device *dev =3D plane_state->plane ? plane_state->plane->d=
ev : NULL;
> =

> For real drivers plane_state->plane really should never be NULL, and
> looking at the test report we blow up in an selftest. I think the right
> fix here is to make the selftest more robust and also mock a drm_plane
> (with a NULL plane->dev pointer, that should be fine).
> =

> Can you pls spin that and test it with the selftests enabled in the
> config?

You are right. I made this change in the test and the error was gone.
Output before and after follow.
The code in the kernel should be fixed though. Currently plane_state->crtc
is used. It should be plane_state->plane
I going to send two patches: one for the test and a v2 for the drm code.

Output before changing the test:
[   38.161315][    T1] drm_mm: bottom-up fragmented insert of 10000 and 200=
00 insertions took 7047892 and 14424064 nsecs
[   38.191061][    T1] drm_mm: top-down fragmented insert of 10000 and 2000=
0 insertions took 7114502 and 14582794 nsecs
[   40.260837][    T1] BUG: kernel NULL pointer dereference, address: 00000=
000
[   40.261381][    T1] #PF: supervisor read access in kernel mode
[   40.261845][    T1] #PF: error_code(0x0000) - not-present page
[   40.262346][    T1] *pde =3D 00000000 =

[   40.262692][    T1] Oops: 0000 [#1] PREEMPT SMP
[   40.263061][    T1] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G S      W   =
      5.16.0-rc2-00002-g58f3ee4dc1e9-dirty #1
[   40.264036][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.14.0-2 04/01/2014
[   40.264036][    T1] EIP: drm_atomic_helper_check_plane_state+0x15e/0x280
[   40.264036][    T1] Code: 8b 45 d4 50 89 f0 e8 c1 0c 03 00 5a 80 7b 6c 0=
0 74 6a 80 7d cc 00 75 64 8b 45 e4 39 43 5c 75 08 8b 45 ec 39 43 64 74 44 8=
b 03 <8b> 00 85 c0 74 03 8b 40 08 68 33 c2 70 c2 6a 04 50 e8 4c 14 04 00
[   40.264036][    T1] EAX: 00000000 EBX: c036dce8 ECX: 08000000 EDX: 00000=
001

Output after:
[   38.230609][    T1] drm_mm: bottom-up fragmented insert of 10000 and 200=
00 insertions took 7235202 and 14675224 nsecs
[   38.259900][    T1] drm_mm: top-down fragmented insert of 10000 and 2000=
0 insertions took 7078062 and 14642524 nsecs
[   40.347207][    T1] random: get_random_bytes called from igt_dp_mst_side=
band_msg_req_decode+0x25f/0x300 with crng_init=3D0
[   40.347248][    T1] ACPI: bus type drm_connector registered             =
                                                             =

[   40.350980][    T1] [drm] Initialized vgem 1.0.0 20120112 for vgem on mi=
nor 0                                                        =

[   40.351670][    T2] random: get_random_u32 called from copy_process+0x21=
c/0x1a00 with crng_init=3D0                                    =

[   40.353310][    T1] [drm] Initialized vkms 1.0.0 20180514 for vkms on mi=
nor 1         =



BR
Claudio Suarez

> =

> Thanks, Daniel
> =

> >  	struct drm_rect *src =3D &plane_state->src;
> >  	struct drm_rect *dst =3D &plane_state->dst;
> >  	unsigned int rotation =3D plane_state->rotation;
> > @@ -828,8 +829,7 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  	}
> >  =

> >  	if (!crtc_state->enable && !can_update_disabled) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Cannot update plane of a disabled CRTC.\n");
> > +		drm_dbg_kms(dev, "Cannot update plane of a disabled CRTC.\n");
> >  		return -EINVAL;
> >  	}
> >  =

> > @@ -839,8 +839,7 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  	hscale =3D drm_rect_calc_hscale(src, dst, min_scale, max_scale);
> >  	vscale =3D drm_rect_calc_vscale(src, dst, min_scale, max_scale);
> >  	if (hscale < 0 || vscale < 0) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Invalid scaling of plane\n");
> > +		drm_dbg_kms(dev, "Invalid scaling of plane\n");
> >  		drm_rect_debug_print("src: ", &plane_state->src, true);
> >  		drm_rect_debug_print("dst: ", &plane_state->dst, false);
> >  		return -ERANGE;
> > @@ -864,8 +863,7 @@ int drm_atomic_helper_check_plane_state(struct drm_=
plane_state *plane_state,
> >  		return 0;
> >  =

> >  	if (!can_position && !drm_rect_equals(dst, &clip)) {
> > -		drm_dbg_kms(plane_state->crtc->dev,
> > -			       "Plane must cover entire CRTC\n");
> > +		drm_dbg_kms(dev, "Plane must cover entire CRTC\n");
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


--===============0381847208172551048==--

