Content-Type: multipart/mixed; boundary="===============6858980560557943994=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 08 Jan 2020 06:20:47 +0100
Message-ID: <fc55325c-a7bf-a431-fdd8-0fc2af91476f@suse.de>
In-Reply-To: <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6858980560557943994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.01.20 um 03:25 schrieb Rong Chen:
> Hi Thomas,
> =

> The previous throughput was reduced from 43955 to 35691, and there is a l=
ittle increase in next-20200106,
> but there is no obvious change after the patchset:

OK, I would have hoped for some improvements. Anyway, thanks for testing.

Best regards
Thomas

> =C2=A0
> commit: =

>   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer console=
")
>   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic framebu=
ffer emulation")
> =

> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      43955 =C2=B1  2%     -18.8%      35691        vm-scalability.median
> =

> commit: =

> =

>   9eb1b48ca4 ("Add linux-next specific files for 20200106")
>   5f20199bac ("drm/fb-helper: Synchronize dirty worker with vblank")
> =

>  next-20200106  5f20199bac9b2de71fd2158b90
> ----------------  --------------------------
>          %stddev      change         %stddev
>              \          |                \  =

>      38550                       38744       =

>      38549                       38744        vm-scalability.median
> =

> =

> Best Regards,
> Rong Chen
> =

> On 1/6/20 9:19 PM, Thomas Zimmermann wrote:
>> Hi Feng,
>>
>> do you still have the test setup that produced the performance penalty?
>>
>> If so, could you give a try to the patchset at [1]? I think I've fixed
>> the remaining issues in earlier versions and I'd like to see if it
>> actually improves performance.
>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.ht=
ml
>>
>> Am 05.08.19 um 14:52 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
>>>
>>> 	[snip] =

>>>
>>>>>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --pref=
ault
>>>>>>     -O -U 815394406
>>>>>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>>>
>>>>>> Rong, Feng, could you confirm this by disabling the cursor or blinki=
ng?
>>>>> Glad to know this method restored the drop. Rong is running the case.
>>>>>
>>>>> While I have another finds, as I noticed your patch changed the bpp f=
rom
>>>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>>>> be related?
>>>> In the original code, the fbdev console already ran with 32 bpp [1] and
>>>> 16 bpp was selected for low-end devices. [2][3] The patch only set the
>>>> same values for userspace; nothing changed for the console.
>>> I did the experiment becasue I checked the commit =

>>>
>>> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic frame=
buffer emulation
>>>
>>> in which there is code:
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/m=
gag200/mgag200_main.c
>>> index b10f726..a977333 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, uns=
igned long flags)
>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>  		dev->mode_config.preferred_depth =3D 16;
>>>  	else
>>> -		dev->mode_config.preferred_depth =3D 24;
>>> +		dev->mode_config.preferred_depth =3D 32;
>>>  	dev->mode_config.prefer_shadow =3D 1;
>>>  =

>>> My debug patch was kind of restoring of this part.
>>>
>>> Thanks,
>>> Feng
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>> [1]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
>>>> [2]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
>>>> [3]
>>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/=
mgag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>>>
>>>>> commit: =

>>>>>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
>>>>>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fram=
ebuffer emulation
>>>>>   01e75fea0d5 mgag200: restore the depth back to 24
>>>>>
>>>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20=
ec5 =

>>>>> ---------------- --------------------------- ------------------------=
--- =

>>>>>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      418=
26        vm-scalability.median
>>>>>   14889337           -17.5%   12291029            -4.1%   14278574   =
     vm-scalability.throughput
>>>>>  =

>>>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>>>> Author: Feng Tang <feng.tang@intel.com>
>>>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>>>
>>>>>     mgag200: restore the depth back to 24
>>>>>     =

>>>>>     Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>>>
>>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm=
/mgag200/mgag200_main.c
>>>>> index a977333..ac8f6c9 100644
>>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, u=
nsigned long flags)
>>>>>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>>>  		dev->mode_config.preferred_depth =3D 16;
>>>>>  	else
>>>>> -		dev->mode_config.preferred_depth =3D 32;
>>>>> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefe=
r_shadow =3D 1;
>>>>>  =

>>>>>  	r =3D mgag200_modeset_init(mdev);
>>>>>
>>>>> Thanks,
>>>>> Feng
>>>>>
>>>>>> The difference between mgag200's original fbdev support and generic
>>>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>>>>> buffer from the shadow buffer. mgag200 does this immediately, but re=
lies
>>>>>> on drm_can_sleep(), which is deprecated.
>>>>>>
>>>>>> I think that the worker task interferes with the test case, as the
>>>>>> worker has been in fbdev emulation since forever and no performance
>>>>>> regressions have been reported so far.
>>>>>>
>>>>>>
>>>>>> So unless there's a report where this problem happens in a real-world
>>>>>> use case, I'd like to keep code as it is. And apparently there's alw=
ays
>>>>>> the workaround of disabling the cursor blinking.
>>>>>>
>>>>>> Best regards
>>>>>> Thomas
>>>>>>
>>>> -- =

>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel(a)lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--===============6858980560557943994==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWw0VlpyTUFDZ2tRYUEzQkhWTUwKZWlNR3pBZ0FrZ1BySFFrL25h
MUpUZ0JDN1VuSkx0cHNUemExVG1xaFFkMDBxdmZmRnhQbGdaeHBnZDdOQmpoQQpTTUlVdW5DQTVE
emd4KzBzZXUxTlZSN2c5KzAwaWNmMzVuWHB3c1dDMjRnQUtMeUc0Q2VKSHNvNFhtOWJNWUphCjJk
L2ptb2NjaElIalNDREJVWTN5eG5KZkhxbmgvQ0llYVdRbS9mR2tqTlZjRXR1bUJ3bzNoWlBEWmxO
WUh3Zm4KVkdBTktmSG1qNndRNk5nVU9yKzBEa0Q0ZFI3eUw2VU9mQlJ3TGhSY2kwRWsyQmxvNkQw
aXE0QTZSSmE5SlpzVAplM2lSZXQ5NTdpcXRYZUtzSjhUMTZIckZIU3lNOUVkb1U5dnZzQkNGRmN0
ZzNYbWM3dDd1ajJFT1lBVW4xc1FUCk9pMnZ6cHlnSmlaeHJkM1BBNmpmT2tLUncrbGwrQT09Cj1J
RlM1Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6858980560557943994==--

