Content-Type: multipart/mixed; boundary="===============2597513739874441301=="
MIME-Version: 1.0
From: Peter Wu <peter@lekensteyn.nl>
To: lkp@lists.01.org
Subject: Re: [bochs] df2052cc92: WARNING:at_drivers/gpu/drm/drm_mode_config.c:#drm_mode_config_cleanup
Date: Sun, 23 Dec 2018 01:43:15 +0100
Message-ID: <20181223004315.GA11455@al>
In-Reply-To: <CAHk-=whM09ZxdrrN-o3k1JOAn0keF5aXtPAcEYiukn7kW7yp2g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2597513739874441301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 21, 2018 at 11:25:41AM -0800, Linus Torvalds wrote:
> On Fri, Dec 21, 2018 at 12:32 AM kernel test robot
> <rong.a.chen@intel.com> wrote:
> >
> > FYI, we noticed commit df2052cc9221 ("bochs: convert to
> > drm_fb_helper_fbdev_setup/teardown") caused
> >
> > [  487.591733] WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_mode_confi=
g.c:478 drm_mode_config_cleanup+0x270/0x290
> =

> Ok, this is apparently just a leak for what appears to be a not
> particularly interesting error case, but the warning is new to 4.20
> (*) so it would be nice to have somebody look at it.
> =

> That commit is supposed to fix a leak, but there's apparently
> something still there.

> (*) the *problem* is probably not new, it's just now exposed by the
> switch to drm_mode_config_cleanup().

I concur, the issue was only revealed because a (not so interesting
error path was triggered). Reproduced this on current master
(v4.20-rc7-274-g23203e3f34c9), the trace leading up to the warning is
the same:

    [   50.008030] bochsdrmfb: enable CONFIG_FB_LITTLE_ENDIAN to support th=
is framebuffer
    [   50.009436] bochs-drm 0000:00:02.0: [drm:drm_fb_helper_fbdev_setup] =
*ERROR* fbdev: Failed to set configuration (ret=3D-38)
    [   50.011456] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:0=
2.0 on minor 2
    [   50.013604] WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_mode_confi=
g.c:477 drm_mode_config_cleanup+0x280/0x2a0
    [   50.016175] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G                =
T 4.20.0-rc7 #1
    [   50.017732] EIP: drm_mode_config_cleanup+0x280/0x2a0
    ...
    [   50.023155] Call Trace:
    [   50.023155]  ? bochs_kms_fini+0x1e/0x30
    [   50.023155]  ? bochs_unload+0x18/0x40
    [   50.023155]  ? bochs_pci_remove+0x18/0x30
    [   50.023155]  ? pci_device_remove+0x1c/0x50
    [   50.031880]  ? really_probe+0xf3/0x2d0
    [   50.031880]  ? driver_probe_device+0x23/0xa0

The warning suggests that drm_framebuffer_init was called at some point wit=
hout
a matching call to drm_framebuffer_cleanup. Adding dump_stack() reveals:

    [   97.673399]  drm_framebuffer_init+0x17d/0x190
    [   97.674134]  drm_gem_fb_alloc+0xbe/0x120
    [   97.674678]  drm_gem_fbdev_fb_create+0x184/0x1c0
    [   97.675322]  ? drm_gem_fb_simple_display_pipe_prepare_fb+0x20/0x20
    [   97.676771]  ? drm_fb_helper_alloc_fbi+0xe1/0x120
    [   97.677408]  bochsfb_create+0x245/0x5f0
    [   97.677935]  ? bochsfb_mmap+0x60/0x60
    [   97.678421]  __drm_fb_helper_initial_config_and_unlock+0x3d3/0x7b0
    [   97.678827]  ? drm_setup_crtcs+0x1430/0x1430
    [   97.678827]  drm_fb_helper_fbdev_setup+0x12b/0x230
    [   97.678827]  bochs_fbdev_init+0x33/0x40
    [   97.678827]  bochs_pci_probe+0x197/0x1a0
    [   97.678827]  pci_device_probe+0xe9/0x180
    [   97.693848] bochsdrmfb: enable CONFIG_FB_LITTLE_ENDIAN to support th=
is framebuffer
    [   97.694880] bochs-drm 0000:00:02.0: [drm:drm_fb_helper_fbdev_setup] =
*ERROR* fbdev: Failed to set configuration (ret=3D-38)

More precisely, this is the call chain (obtained via GDB):

    drm_fb_helper_fbdev_setup
    -> drm_fb_helper_initial_config
    -> __drm_fb_helper_initial_config_and_unlock
    -> drm_fb_helper_single_fb_probe
    -> bochsfb_create
    -> drm_gem_fbdev_fb_create
    -> drm_gem_fb_alloc
    -> drm_framebuffer_init

Let's have a look at the source of the error message, keep in mind that
drm_fb_helper_fini is called on the error path:

    int drm_fb_helper_fbdev_setup(struct drm_device *dev, ...) {
        /* ... */
        ret =3D drm_fb_helper_initial_config(fb_helper, preferred_bpp);
        if (ret < 0) {
            DRM_DEV_ERROR(dev->dev, "fbdev: Failed to set configuration (re=
t=3D%d)\n", ret);
            goto err_drm_fb_helper_fini;
        }

        return 0;

    err_drm_fb_helper_fini:
        drm_fb_helper_fini(fb_helper);

        return ret;
    }

The CONFIG_FB_LITTLE_ENDIAN error above suggests that this code path is rea=
ched
*after* calling bochsfb_create:

    drm_fb_helper_fbdev_setup
    -> drm_fb_helper_initial_config
    -> __drm_fb_helper_initial_config_and_unlock
    -> register_framebuffer
    -> do_register_framebuffer
    -> fb_check_foreignness
    (prints error and propagates error code back to drm_fb_helper_fbdev_set=
up).

What does "drm_fb_helper_fini" do? Among other things it basically kfree's
memory associated with "fb_helper->fbdev" which was created using
"drm_fb_helper_alloc_fbi" in the "fb_probe" callback. This is sufficient for
"drm_fb_helper_generic_probe" (introduced by Noralf), but not for
"bochsfb_create" which additionally calls "drm_gem_fbdev_fb_create":

    info =3D drm_fb_helper_alloc_fbi(helper);
    if (IS_ERR(info)) {
        DRM_ERROR("Failed to allocate fbi: %ld\n", PTR_ERR(info));
        return PTR_ERR(info);
    }

    info->par =3D &bochs->fb.helper;

    fb =3D drm_gem_fbdev_fb_create(bochs->dev, sizes, 0, gobj, NULL);
    if (IS_ERR(fb)) {
        DRM_ERROR("Failed to create framebuffer: %ld\n", PTR_ERR(fb));
        return PTR_ERR(fb);
    }

    /* setup helper */
    bochs->fb.helper.fb =3D fb;

Note that "fb" is unhandled by "drm_fb_helper_fini", so it leaks.

What is the usual behavior? drm_fb_helper_fbdev_setup succeeds and on unload
drm_fb_helper_fbdev_teardown is called which properly releases "fb":

    void drm_fb_helper_fbdev_teardown(struct drm_device *dev)
    {
        struct drm_fb_helper *fb_helper =3D dev->fb_helper;
        struct fb_ops *fbops =3D NULL;

        if (!fb_helper)
            return;

        /* Unregister if it hasn't been done already */
        if (fb_helper->fbdev && fb_helper->fbdev->dev)
            drm_fb_helper_unregister_fbi(fb_helper);

        if (fb_helper->fbdev && fb_helper->fbdev->fbdefio) {
            fb_deferred_io_cleanup(fb_helper->fbdev);
            kfree(fb_helper->fbdev->fbdefio);
            fbops =3D fb_helper->fbdev->fbops;
        }

        drm_fb_helper_fini(fb_helper);
        kfree(fbops);

        if (fb_helper->fb)
            drm_framebuffer_remove(fb_helper->fb);  // yay!
    }

Due to calling "drm_fb_helper_fini" however, "dev->fb_helper" will be NULL =
and
thus this function does nothing on the error path.

So in summary, "drm_fb_helper_fbdev_setup" calls the driver callback
drm_fb_helper_funcs::fb_probe, detects an error but does not properly relea=
se
all resources from the callback even after calling "drm_fb_helper_fini". On
unload, "drm_fb_helper_fbdev_teardown" has no effect because the earlier ca=
ll to
"drm_fb_helper_fini" and skips the required "drm_framebuffer_remove" call.

I'll send a proposed patch in a reply.
-- =

Kind regards,
Peter Wu
https://lekensteyn.nl

--===============2597513739874441301==--

