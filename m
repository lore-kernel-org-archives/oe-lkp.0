Content-Type: multipart/mixed; boundary="===============0464849634703324105=="
MIME-Version: 1.0
From: Thierry Reding <treding@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [drm/fb-helper] BUG: unable to handle kernel paging request at 95d24c70
Date: Fri, 19 Dec 2014 11:15:44 +0100
Message-ID: <20141219101543.GA16504@ulmo.nvidia.com>
In-Reply-To: <20141219020445.GA10008@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0464849634703324105==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 18, 2014 at 06:04:45PM -0800, Fengguang Wu wrote:
> =

> Hi Thierry,
> =

> FYI, here is another bisect result.

Thanks. Looking at the cirrus driver more closely it already employs the
big hammer upon failure and ends up calling drm_fb_helper_fini() via the
cirrus_driver_unload() call in cirrus_driver_load()'s cleanup path.

> commit 7bf2844ed14de049a4ccec26eb3d8b4c3d5c1971
> Author:     Thierry Reding <treding@nvidia.com>
> AuthorDate: Wed Dec 17 16:39:59 2014 +0100
> Commit:     Daniel Vetter <daniel.vetter@ffwll.ch>
> CommitDate: Wed Dec 17 22:05:08 2014 +0100
> =

>     drm/fb-helper: Propagate errors from initial config failure
>     =

>     Make drm_fb_helper_initial_config() return an int rather than a bool =
so
>     that the error can be properly propagated. While at it, update drivers
>     to propagate errors further rather than just ignore them.
>     =

>     Cc: David Airlie <airlied@linux.ie>
>     Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>     Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>     Cc: Rob Clark <robdclark@gmail.com>
>     Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
>     Cc: Alex Deucher <alexander.deucher@amd.com>
>     Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>     Cc: Ben Skeggs <bskeggs@redhat.com>
>     Signed-off-by: Thierry Reding <treding@nvidia.com>
>     Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>     Reviewed-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
>     Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Using the attached patch on top of this I can no longer reproduce either
this or the earlier result. I'll send a revised patch with this squashed
in.

Thanks,
Thierry

diff --git a/drivers/gpu/drm/cirrus/cirrus_fbdev.c b/drivers/gpu/drm/cirrus=
/cirrus_fbdev.c
index 0682210b068b..f7e8c6530beb 100644
--- a/drivers/gpu/drm/cirrus/cirrus_fbdev.c
+++ b/drivers/gpu/drm/cirrus/cirrus_fbdev.c
@@ -318,26 +318,20 @@ int cirrus_fbdev_init(struct cirrus_device *cdev)
 	ret =3D drm_fb_helper_init(cdev->dev, &gfbdev->helper,
 				 cdev->num_crtc, CIRRUSFB_CONN_LIMIT);
 	if (ret)
-		goto free;
+		return ret;
 =

 	ret =3D drm_fb_helper_single_add_all_connectors(&gfbdev->helper);
 	if (ret)
-		goto fini;
+		return ret;
 =

 	/* disable all the possible outputs/crtcs before entering KMS mode */
 	drm_helper_disable_unused_functions(cdev->dev);
 =

 	ret =3D drm_fb_helper_initial_config(&gfbdev->helper, bpp_sel);
 	if (ret)
-		goto fini;
+		return ret;;
 =

 	return 0;
-
-free:
-	kfree(gfbdev);
-fini:
-	drm_fb_helper_fini(&gfbdev->helper);
-	return ret;
 }
 =

 void cirrus_fbdev_fini(struct cirrus_device *cdev)

--===============0464849634703324105==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRSWNCQUVC
QWdBR0JRSlVrL3JQQUFvSkVOMGpyTmQvUHJPaGJta1FBSlpZV09uTEV3c3VLSE5NeVp6WU1iRW8K
TzBjZ0xZUGs2Si9WbmU0QU5mMXVEMm05QmFPekhsTkVXNEZDcmd3c2JYTkROd0JVbk1oc1I3Ujdi
V2JjQjBvYwpxUm1sYklWUGxXVDQ4Ulg3dkpjOXpFSVljM2FuMXQvMG9LcmJaS1hiTlV6bkN3eDJi
bmdORE9jUDl3K0QrRVFOCnhUeVoxVWMvcWw2a2IxYXZTQjViK1k3cS9IbjN0TXVIVldGZ3dENnc5
Q05aMGpaL1BkWTBvUWRCRmpkRVhPb2UKak55RVdEcXBrLzJHUUsrcUNNM1UvUXJnL0tlRXlpMUhl
REJBaEFwMW1sdXNPSXIwK3NzcU5zeVFpVG11cDlkLwpMc1lNVU9ZN01ta25PajNncTVzKzBXMlk0
bmM2UUJEWWQ0UGJTR0FhcVJxaFdpQ0V6TjJwVmgxbk5Va3Q2Y1ZwCkx6UkZMMFd1aU5iVkgwMlFV
dGExRjJZNjN2K08reWlmQnBJMVpSS2pGdjlteklyMy9NMVgxTzFDby9TVytVUlIKbWkyaktEdldO
Uzc0YWtOS0liTnBaNWZnbTRHd21FYXREemwxZHdkZ3VqYjVaTHJHQzNTTjlvK0c1Rk4zL1RLZwo5
RE0vYk9jUldiTEl0MkdrZEptZXI4Qk5YT21td3ZZUmlhTnM3WEVTakJ6aU5MZnBwSXZXamU3VW5t
M2R3YUw4CkE4ZHd6bUt6K1JwOGFUa3gycnAzL3VSSmVuODRrNzdSTTlxMTRrR2U5M2NKRTZudHM5
bExJaWJ4R2ZQVTl5NGwKOEcrY25VaEdWRUllaFgwUG43ZjJBYW9tNExZZlpHVUhOLzE4SjhqNk1I
b3dNWHZMOC9VblVORVM5THgwMnJUZAp0YVpHY3JEWTdHQXAxNWNHUXpTego9bjB1VwotLS0tLUVO
RCBQR1AgU0lHTkFUVVJFLS0tLS0K

--===============0464849634703324105==--

