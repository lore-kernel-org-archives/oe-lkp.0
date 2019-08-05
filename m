Content-Type: multipart/mixed; boundary="===============8468901514155278692=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 05 Aug 2019 12:25:50 +0200
Message-ID: <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
In-Reply-To: <c0c3f387-dc93-3146-788c-23258b28a015@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8468901514155278692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.08.19 um 09:28 schrieb Rong Chen:
> Hi,
> =

> On 8/5/19 3:02 PM, Feng Tang wrote:
>> Hi Thomas,
>>
>> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> I did some further analysis on this problem and found that the blinking
>>> cursor affects performance of the vm-scalability test case.
>>>
>>> I only have a 4-core machine, so scalability is not really testable. Yet
>>> I see the effects of running vm-scalibility against drm-tip, a revert of
>>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>>
>>> After reverting the mgag200 patch, running the test as described in the
>>> report
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml
>>>
>>> gives results like
>>>
>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./usemem --runtime 300 -n 4 --pr=
ealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815395225
>>> =C2=A0=C2=A0 917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>> =C2=A0=C2=A0 917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>>
>>> Running the test against current drm-tip gives slightly worse results,
>>> such as.
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./usemem --runtime 300 -n 4 --pr=
ealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 919694 usecs =3D 974040 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 923341 usecs =3D 970193 KB/s
>>>
>>> The test puts out roughly one result per second. Strangely sending the
>>> output to /dev/null can make results significantly worse.
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./usemem --runtime 300 -n 4 --pr=
ealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>>
>>> I realized that there's still a blinking cursor on the screen, which I
>>> disabled with
>>>
>>> =C2=A0=C2=A0 tput civis
>>>
>>> or alternatively
>>>
>>> =C2=A0=C2=A0 echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>>
>>> Running the the test now gives the original or even better results,
>>> such as
>>>
>>> =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>
>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./case-anon-cow-seq-hugetlb
>>> =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./usemem --runtime 300 -n 4 --pr=
ealloc
>>> --prefault
>>> =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>> =C2=A0=C2=A0 917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>> =C2=A0=C2=A0 917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>
>>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
>> Glad to know this method restored the drop. Rong is running the case.
> =

> I set "echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink" for
> both commits,
> and the regression has no obvious change.

Ah, I see. Thank you for testing. There are two questions that come to
my mind: did you send the regular output to /dev/null? And what happens
if you disable the cursor with 'tput civis'?

If there is absolutely nothing changing on the screen, I don't see how
the regression could persist.

Best regards
Thomas


> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer con=
sole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams/tes=
tbox
> ----------------=C2=A0 -------------------------- -----------------------=
----
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 43394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575 =C2=
=B1=C2=A0 3%
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 43393=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
> vm-scalability.median
> =

> Best Regards,
> Rong Chen
> =

>>
>> While I have another finds, as I noticed your patch changed the bpp from
>> 24 to 32, I had a patch to change it back to 24, and run the case in
>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>> be related?
>>
>> commit:
>> =C2=A0=C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuf=
fer console
>> =C2=A0=C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with gene=
ric
>> framebuffer emulation
>> =C2=A0=C2=A0 01e75fea0d5 mgag200: restore the depth back to 24
>>
>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5
>> ---------------- --------------------------- ---------------------------
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43921 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -18.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0
>> 41826=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.median
>> =C2=A0=C2=A0 14889337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -17.5%=C2=A0=C2=A0 12291029=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.1%=C2=A0=C2=A0
>> 14278574=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.throug=
hput
>> =C2=A0 commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>> Author: Feng Tang <feng.tang@intel.com>
>> Date:=C2=A0=C2=A0 Fri Aug 2 15:09:19 2019 +0800
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 mgag200: restore the depth back to 24
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Feng Ta=
ng <feng.tang@intel.com>
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
>> b/drivers/gpu/drm/mgag200/mgag200_main.c
>> index a977333..ac8f6c9 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
>> unsigned long flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_G200_SE(mdev) && mdev->mc.vram_siz=
e < (2048*1024))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.=
preferred_depth =3D 16;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_d=
epth =3D 32;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_d=
epth =3D 24;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D mgag200_modeset_init(mdev);
>>
>> Thanks,
>> Feng
>>
>>>
>>> The difference between mgag200's original fbdev support and generic
>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>> buffer from the shadow buffer. mgag200 does this immediately, but relies
>>> on drm_can_sleep(), which is deprecated.
>>>
>>> I think that the worker task interferes with the test case, as the
>>> worker has been in fbdev emulation since forever and no performance
>>> regressions have been reported so far.
>>>
>>>
>>> So unless there's a report where this problem happens in a real-world
>>> use case, I'd like to keep code as it is. And apparently there's always
>>> the workaround of disabling the cursor blinking.
>>>
>>> Best regards
>>> Thomas
>>>
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============8468901514155278692==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxSUJDNEFDZ2tRYUEzQkhWTUwKZWlOb1NBZjhEd25WS2tiYXBk
QU5CUmUxVktQdnpCWmpsdm96TmNGWEYyZjhiN25DenhzcjRJNTlZN0QxMElvUQpKUlhZcTl4SVMx
c0w2QjdiZ0lUSDVtV2RFODdtNytBcmpZMjVlS09weng2U0dqQnJVZ1FPVGx5S2ZNY0JpVy9TCldP
Q2RTUWJHTXg4WVFVeGNOeVJjcWE4VnhjdDhCMTgwN2ppSlNNa2JuY2R5MkJDTHhJNzZ1aUZhVFFY
dUM0V1kKS1E2QlpBdGVCd3lDTWppN3JBQ3p4ZW9VK2RrVUZCUDl6emxBdWEzUFlhVVZ6c3hhQmxw
d04xY0NXeUt4VkNIOQpNelJFUjNlenA4ck1NYkZVVWV6ajB1aHFpck1TeGhRS01kTkY4UEU0Y3hE
V0ZVUjBDN1Nhbzh1WThacWVTUGF5CjVoS3NIcGxLUWhuV2RqbWpYZ3lMSUxqbjFpU2Nodz09Cj1K
OURYCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8468901514155278692==--

