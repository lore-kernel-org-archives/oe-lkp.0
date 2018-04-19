Content-Type: multipart/mixed; boundary="===============8392495166303503985=="
MIME-Version: 1.0
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [i915] WARNING: CPU: 2 PID: 183 at drivers/gpu/drm/i915/intel_display.c:14584 intel_modeset_init+0x3be/0x1060
Date: Thu, 19 Apr 2018 16:39:30 +0200
Message-ID: <e7cee8ae-f3b4-f342-f381-8ed48809148e@linux.intel.com>
In-Reply-To: <20180419110505.wy47nheshalanxek@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8392495166303503985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Op 19-04-18 om 13:05 schreef Fengguang Wu:
> Hi Maarten,
>
>> What extra dmesg output do you get when you boot with drm.debug=3D0x1f ?
>
> Attached is the dmesg with drm.debug=3D0x1f.
>
> Thanks,
> Fengguang

Ah so we're inheriting the FB 2x, once with 1280x1024, other with 1366x768:

kern  :debug : [   74.880444] [drm:i9xx_get_initial_plane_config [i915]] pi=
pe A/primary A with fb: size=3D1366x768(a)32, offset=3D61000, pitch 5504, s=
ize 0x408000
kern  :debug : [   74.881187] [drm:i915_gem_object_create_stolen_for_preall=
ocated [i915]] creating preallocated stolen object: stolen_offset=3D0x00000=
00000061000, gtt_offset=3D0x0000000000061000, size=3D0x0000000000408000
kern  :debug : [   74.882197] [drm:intel_alloc_initial_plane_obj.isra.126 [=
i915]] initial plane fb obj 000000005efa24f9

kern  :debug : [   74.883532] [drm:i9xx_get_initial_plane_config [i915]] pi=
pe B/primary B with fb: size=3D1280x1024(a)32, offset=3D61000, pitch 5504, =
size 0x560000
kern  :debug : [   74.884260] [drm:i915_gem_object_create_stolen_for_preall=
ocated [i915]] creating preallocated stolen object: stolen_offset=3D0x00000=
00000061000, gtt_offset=3D0x0000000000061000, size=3D0x0000000000560000
kern  :debug : [   74.885295] [drm:i915_gem_object_create_stolen_for_preall=
ocated [i915]] failed to allocate stolen space

Which of course fails, but should be an interesting case to handle right. :)

~Maarten


--===============8392495166303503985==--

