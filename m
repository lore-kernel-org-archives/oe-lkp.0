Content-Type: multipart/mixed; boundary="===============1967057971594231616=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 06 Jan 2020 14:19:23 +0100
Message-ID: <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
In-Reply-To: <20190805125239.GB96155@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1967057971594231616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Feng,

do you still have the test setup that produced the performance penalty?

If so, could you give a try to the patchset at [1]? I think I've fixed
the remaining issues in earlier versions and I'd like to see if it
actually improves performance.

Best regards
Thomas

[1]
https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.html

Am 05.08.19 um 14:52 schrieb Feng Tang:
> Hi Thomas,
> =

> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
> =

> 	[snip] =

> =

>>>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefau=
lt
>>>>     -O -U 815394406
>>>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>
>>>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
>>>
>>> Glad to know this method restored the drop. Rong is running the case.
>>>
>>> While I have another finds, as I noticed your patch changed the bpp from
>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>> be related?
>>
>> In the original code, the fbdev console already ran with 32 bpp [1] and
>> 16 bpp was selected for low-end devices. [2][3] The patch only set the
>> same values for userspace; nothing changed for the console.
> =

> I did the experiment becasue I checked the commit =

> =

> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic framebu=
ffer emulation
> =

> in which there is code:
> =

> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mga=
g200/mgag200_main.c
> index b10f726..a977333 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsig=
ned long flags)
>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>  		dev->mode_config.preferred_depth =3D 16;
>  	else
> -		dev->mode_config.preferred_depth =3D 24;
> +		dev->mode_config.preferred_depth =3D 32;
>  	dev->mode_config.prefer_shadow =3D 1;
>  =

> My debug patch was kind of restoring of this part.
> =

> Thanks,
> Feng
> =

>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mg=
ag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
>> [2]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mg=
ag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
>> [3]
>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mg=
ag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>
>>>
>>> commit: =

>>>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
>>>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic frameb=
uffer emulation
>>>   01e75fea0d5 mgag200: restore the depth back to 24
>>>
>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec=
5 =

>>> ---------------- --------------------------- --------------------------=
- =

>>>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      41826=
        vm-scalability.median
>>>   14889337           -17.5%   12291029            -4.1%   14278574     =
   vm-scalability.throughput
>>>  =

>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>> Author: Feng Tang <feng.tang@intel.com>
>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>
>>>     mgag200: restore the depth back to 24
>>>     =

>>>     Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/m=
gag200/mgag200_main.c
>>> index a977333..ac8f6c9 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, uns=
igned long flags)
>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>  		dev->mode_config.preferred_depth =3D 16;
>>>  	else
>>> -		dev->mode_config.preferred_depth =3D 32;
>>> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefer_=
shadow =3D 1;
>>>  =

>>>  	r =3D mgag200_modeset_init(mdev);
>>>
>>> Thanks,
>>> Feng
>>>
>>>>
>>>>
>>>> The difference between mgag200's original fbdev support and generic
>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>>> buffer from the shadow buffer. mgag200 does this immediately, but reli=
es
>>>> on drm_can_sleep(), which is deprecated.
>>>>
>>>> I think that the worker task interferes with the test case, as the
>>>> worker has been in fbdev emulation since forever and no performance
>>>> regressions have been reported so far.
>>>>
>>>>
>>>> So unless there's a report where this problem happens in a real-world
>>>> use case, I'd like to keep code as it is. And apparently there's always
>>>> the workaround of disabling the cursor blinking.
>>>>
>>>> Best regards
>>>> Thomas
>>>>
>>
>> -- =

>> Thomas Zimmermann
>> Graphics Driver Developer
>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>> HRB 21284 (AG N=C3=BCrnberg)
>>
> =

> =

> =

> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============1967057971594231616==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWw0VE05c0FDZ2tRYUEzQkhWTUwKZWlPajd3ZjdCNFRRelBzWC85
b3Q0NkRlVXpyOUcrdlBiSy9CaVlka1pTV3hDWVI2ajdocWlTcW5GM0ZxYXNJWgo2WmlmTnZNRDZK
bkdMcWJ1ajhKczF1WHR4cFZpN2xyMGYvWFJaU1BwWUk4akI2dkRvaDdVWDdJSkxtYmtGYXhJCkRx
dFMreTJ1YStkNExkMVYwRFBWWlJGcDJFdEVUZ05qOGZOYUxFOEN5NmVuanZTSVJDMDJKQksycDBV
bWduakQKQVNCRC9PUEI3TXFTbWxxU00vUmU5eXN1T2RNcWNPTFowKzRsUEYrOGdzNjFGQWhPOE5Z
SDRwZ0d1OUE3cHhLTAp0UW9QSE8xWVBZeXd0bGxlWCtueERqcTlJSEVhTC9zN2QwZ3hiSVl2aXlC
M2FiWkk5MVp1T2ZuazhoelU3UTF2Cm9wM1Q2QmFSWEJ5cXVNbXp3djhhcnZsT0Z6dUxHUT09Cj0w
aHVjCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============1967057971594231616==--

