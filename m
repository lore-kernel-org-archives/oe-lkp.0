Content-Type: multipart/mixed; boundary="===============3533911084548563784=="
MIME-Version: 1.0
From: Noralf Trønnes <noralf@tronnes.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] drm/fb-helper: fix leaks in error path of drm_fb_helper_fbdev_setup
Date: Sat, 05 Jan 2019 19:25:53 +0100
Message-ID: <564896a7-e232-70e2-dd01-fec265f731eb@tronnes.org>
In-Reply-To: <20181224150302.GA2259@al>
List-Id: <oe-lkp.lists.linux.dev>

--===============3533911084548563784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Den 24.12.2018 16.03, skrev Peter Wu:
> On Mon, Dec 24, 2018 at 03:52:55PM +0100, Noralf Tr=C3=B8nnes wrote:
>>
>>
>> Den 24.12.2018 00.10, skrev Peter Wu:
>>> On Sun, Dec 23, 2018 at 02:55:52PM +0100, Noralf Tr=C3=B8nnes wrote:
>>>>
>>>>
>>>> Den 23.12.2018 01.55, skrev Peter Wu:
>>>>> After drm_fb_helper_fbdev_setup calls drm_fb_helper_init,
>>>>> "dev->fb_helper" will be initialized (and thus drm_fb_helper_fini will
>>>>> have some effect). After that, drm_fb_helper_initial_config is called
>>>>> which may call the "fb_probe" driver callback.
>>>>>
>>>>> This driver callback may call drm_fb_helper_defio_init (as is done by
>>>>> drm_fb_helper_generic_probe) or set a framebuffer (as is done by boch=
s)
>>>>> as documented. These are normally cleaned up on exit by
>>>>> drm_fb_helper_fbdev_teardown which also calls drm_fb_helper_fini.
>>>>>
>>>>> If an error occurs after "fb_probe", but before setup is complete, th=
en
>>>>> calling just drm_fb_helper_fini will leak resources. This was trigger=
ed
>>>>> by df2052cc922 ("bochs: convert to drm_fb_helper_fbdev_setup/teardown=
"):
>>>>>
>>>>>        [   50.008030] bochsdrmfb: enable CONFIG_FB_LITTLE_ENDIAN to s=
upport this framebuffer
>>>>>        [   50.009436] bochs-drm 0000:00:02.0: [drm:drm_fb_helper_fbde=
v_setup] *ERROR* fbdev: Failed to set configuration (ret=3D-38)
>>>>>        [   50.011456] [drm] Initialized bochs-drm 1.0.0 20130925 for =
0000:00:02.0 on minor 2
>>>>>        [   50.013604] WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_m=
ode_config.c:477 drm_mode_config_cleanup+0x280/0x2a0
>>>>>        [   50.016175] CPU: 1 PID: 1 Comm: swapper/0 Tainted: G       =
         T 4.20.0-rc7 #1
>>>>>        [   50.017732] EIP: drm_mode_config_cleanup+0x280/0x2a0
>>>>>        ...
>>>>>        [   50.023155] Call Trace:
>>>>>        [   50.023155]  ? bochs_kms_fini+0x1e/0x30
>>>>>        [   50.023155]  ? bochs_unload+0x18/0x40
>>>>>
>>>>> This can be reproduced with QEMU and CONFIG_FB_LITTLE_ENDIAN=3Dn.
>>>>>
>>>>> Link: https://lkml.kernel.org/r/20181221083226.GI23332(a)shao2-debian
>>>>> Link: https://lkml.kernel.org/r/20181223004315.GA11455(a)al
>>>>> Fixes: 8741216396b2 ("drm/fb-helper: Add drm_fb_helper_fbdev_setup/te=
ardown()")
>>>>> Reported-by: kernel test robot <rong.a.chen@intel.com>
>>>>> Cc: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>>>>> Signed-off-by: Peter Wu <peter@lekensteyn.nl>
>>>>> ---
>>>>>     drivers/gpu/drm/drm_fb_helper.c | 2 +-
>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb=
_helper.c
>>>>> index 9d64f874f965..432e0f3b9267 100644
>>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>>> @@ -2860,7 +2860,7 @@ int drm_fb_helper_fbdev_setup(struct drm_device=
 *dev,
>>>>>     	return 0;
>>>>>     err_drm_fb_helper_fini:
>>>>> -	drm_fb_helper_fini(fb_helper);
>>>>> +	drm_fb_helper_fbdev_teardown(dev);
>>>>
>>>> This change will break the error path for drm_fbdev_generic_setup()
>>>> because drm_fb_helper_generic_probe() cleans up on error but doesn't
>>>> clear drm_fb_helper->fb resulting in a double drm_framebuffer_remove().
>>>
>>> This should probably considered a bug of drm_fb_helper_generic_probe.
>>> Ownership of fb_helper should remain with the caller. The caller can
>>> detect an error and act accordingly.
>>>
>>>> My assumption has been that the drm_fb_helper_funcs->fb_probe callback
>>>> cleans up its resources on error. Clearly this is not the case for boc=
hs, so
>>>> my take on this is that bochsfb_create() needs to clean up on error.
>>>
>>> That assumption still holds for bochs. The problem is this sequence:
>>> - drm_fb_helper_fbdev_setup is called.
>>> - fb_probe succeeds (this is crucial).
>>> - register_framebuffer fails.
>>> - error path of setup is triggered.
>>>
>>> As fb_helper is fully setup by drivers, the drm_fb_helper core should
>>> fully deallocate it again on the error path or else a leak occurs.
>>>
>>>> Gerd has a patchset that switches bochs over to the generic fbdev
>>>> emulation, but ofc that doesn't help with 4.20:
>>>> https://patchwork.freedesktop.org/series/54269/
>>>
>>> And that does not help with other users of the drm_fb_helper who use
>>> functions like drm_fb_helper_defio_init. They will likely run in the
>>> same problem.
>>>
>>> I don't have a way to test tinydrm or other drivers, but if you force
>>> register_framebuffer to fail, you should be able to reproduce the
>>> problem with drm_fb_helper_generic_probe.
>>>
>>
>> Now I understand. I have looked at the drivers that use drm_fb_helper
>> and no one seem to handle the case where register_framebuffer() is
>> failing.
>>
>> Here's what drivers do when drm_fb_helper_initial_config() fails:
>>
>> Doesn't check:
>> amdgpu
>> virtio
>>
>> Calls drm_fb_helper_fini():
>> armada
>> ast
>> exynos
>> gma500
>> hisilicon
>> mgag200
>> msm
>> nouveau
>> omap
>> radeon
>> rockchip
>> tegra
>> udl
>> bochs - Uses drm_fb_helper_fbdev_setup()
>> qxl - Uses drm_fb_helper_fbdev_setup()
>> vboxvideo - Uses drm_fb_helper_fbdev_setup()
>>
>> Might clean up, not sure:
>> cirrus
>>
>> Looks suspicious:
>> i915
>>
>> I looked at bochs before it switched to drm_fb_helper_fbdev_setup() and
>> it also just called drm_fb_helper_fini().
>>
>> It looks like you've uncovered something no one has though about (or
>> not implemented at least).
>>
>> It's not just the framebuffer that's not destroyed, the buffer object
>> is also leaked. drm_mode_config_cleanup() yells about the framebuffer
>> (and frees it), but says nothing about the buffer object. It might be
>> that it can't even be made to detect that since some drivers do special
>> stuff for the fbdev buffer.
>>
>> I'll pick up on this and do some testing after the Christmas holidays.
> =

> Thanks, the warning is bad for CI (which uses QEMU), but otherwise it
> should not have any effect on regular users so it can wait.
> =


This patch is good as long as it's applied along side the fix[1] to the =

generic emulation:

Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>

I can apply them both when I get an ack/rb on the other patch.

Thanks for fixing this.

Noralf.

[1] https://patchwork.freedesktop.org/patch/275002/

--===============3533911084548563784==--

