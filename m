Content-Type: multipart/mixed; boundary="===============5453713438771290624=="
MIME-Version: 1.0
From: Noralf Trønnes <noralf@tronnes.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
Date: Sun, 23 Dec 2018 14:55:52 +0100
Message-ID: <ad4be2e7-b53c-97b5-7029-83f4017e4643@tronnes.org>
In-Reply-To: <20181223005507.28328-1-peter@lekensteyn.nl>
List-Id: <oe-lkp.lists.linux.dev>

--===============5453713438771290624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Den 23.12.2018 01.55, skrev Peter Wu:
> After drm_fb_helper_fbdev_setup calls drm_fb_helper_init,
> "dev->fb_helper" will be initialized (and thus drm_fb_helper_fini will
> have some effect). After that, drm_fb_helper_initial_config is called
> which may call the "fb_probe" driver callback.
> =

> This driver callback may call drm_fb_helper_defio_init (as is done by
> drm_fb_helper_generic_probe) or set a framebuffer (as is done by bochs)
> as documented. These are normally cleaned up on exit by
> drm_fb_helper_fbdev_teardown which also calls drm_fb_helper_fini.
> =

> If an error occurs after "fb_probe", but before setup is complete, then
> calling just drm_fb_helper_fini will leak resources. This was triggered
> by df2052cc922 ("bochs: convert to drm_fb_helper_fbdev_setup/teardown"):
> =

>      [   50.008030] bochsdrmfb: enable CONFIG_FB_LITTLE_ENDIAN to support=
 this framebuffer
>      [   50.009436] bochs-drm 0000:00:02.0: [drm:drm_fb_helper_fbdev_setu=
p] *ERROR* fbdev: Failed to set configuration (ret=3D-38)
>      [   50.011456] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:0=
0:02.0 on minor 2
>      [   50.013604] WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_mode_co=
nfig.c:477 drm_mode_config_cleanup+0x280/0x2a0
>      [   50.016175] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G             =
   T 4.20.0-rc7 #1
>      [   50.017732] EIP: drm_mode_config_cleanup+0x280/0x2a0
>      ...
>      [   50.023155] Call Trace:
>      [   50.023155]  ? bochs_kms_fini+0x1e/0x30
>      [   50.023155]  ? bochs_unload+0x18/0x40
> =

> This can be reproduced with QEMU and CONFIG_FB_LITTLE_ENDIAN=3Dn.
> =

> Link: https://lkml.kernel.org/r/20181221083226.GI23332(a)shao2-debian
> Link: https://lkml.kernel.org/r/20181223004315.GA11455(a)al
> Fixes: 8741216396b2 ("drm/fb-helper: Add drm_fb_helper_fbdev_setup/teardo=
wn()")
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
> ---
>   drivers/gpu/drm/drm_fb_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 9d64f874f965..432e0f3b9267 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2860,7 +2860,7 @@ int drm_fb_helper_fbdev_setup(struct drm_device *de=
v,
>   	return 0;
>   =

>   err_drm_fb_helper_fini:
> -	drm_fb_helper_fini(fb_helper);
> +	drm_fb_helper_fbdev_teardown(dev);

This change will break the error path for drm_fbdev_generic_setup()
because drm_fb_helper_generic_probe() cleans up on error but doesn't
clear drm_fb_helper->fb resulting in a double drm_framebuffer_remove().

My assumption has been that the drm_fb_helper_funcs->fb_probe callback
cleans up its resources on error. Clearly this is not the case for =

bochs, so my take on this is that bochsfb_create() needs to clean up on =

error.

Gerd has a patchset that switches bochs over to the generic fbdev
emulation, but ofc that doesn't help with 4.20:
https://patchwork.freedesktop.org/series/54269/

Noralf.

>   =

>   	return ret;
>   }
>=20

--===============5453713438771290624==--

