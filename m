Content-Type: multipart/mixed; boundary="===============7234446717543315878=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 05 Aug 2019 12:22:11 +0200
Message-ID: <2f524683-d9ee-77b6-1253-5645dff050a7@suse.de>
In-Reply-To: <20190805070200.GA91650@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7234446717543315878==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.08.19 um 09:02 schrieb Feng Tang:
> Hi Thomas,
> =

> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> I did some further analysis on this problem and found that the blinking
>> cursor affects performance of the vm-scalability test case.
>>
>> I only have a 4-core machine, so scalability is not really testable. Yet
>> I see the effects of running vm-scalibility against drm-tip, a revert of
>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>
>> After reverting the mgag200 patch, running the test as described in the
>> report
>>
>>   bin/lkp run job.yaml
>>
>> gives results like
>>
>>   2019-08-02 19:34:37  ./case-anon-cow-seq-hugetlb
>>   2019-08-02 19:34:37  ./usemem --runtime 300 -n 4 --prealloc --prefault
>>     -O -U 815395225
>>   917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>   917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>   917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>   917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>
>> Running the test against current drm-tip gives slightly worse results,
>> such as.
>>
>>   2019-08-03 19:17:06  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:17:06  ./usemem --runtime 300 -n 4 --prealloc --prefault
>>     -O -U 815394406
>>   917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>   917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>   917318700 bytes / 919694 usecs =3D 974040 KB/s
>>   917318700 bytes / 923341 usecs =3D 970193 KB/s
>>
>> The test puts out roughly one result per second. Strangely sending the
>> output to /dev/null can make results significantly worse.
>>
>>   bin/lkp run job.yaml > /dev/null
>>
>>   2019-08-03 19:23:04  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:23:04  ./usemem --runtime 300 -n 4 --prealloc --prefault
>>     -O -U 815394406
>>   917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>   917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>   917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>   917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>
>> I realized that there's still a blinking cursor on the screen, which I
>> disabled with
>>
>>   tput civis
>>
>> or alternatively
>>
>>   echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>
>> Running the the test now gives the original or even better results, such=
 as
>>
>>   bin/lkp run job.yaml > /dev/null
>>
>>   2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>   2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --prefault
>>     -O -U 815394406
>>   917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>   917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>   917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>   917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>
>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
> =

> Glad to know this method restored the drop. Rong is running the case.
> =

> While I have another finds, as I noticed your patch changed the bpp from
> 24 to 32, I had a patch to change it back to 24, and run the case in
> the weekend, the -18% regrssion was reduced to about -5%. Could this
> be related?

In the original code, the fbdev console already ran with 32 bpp [1] and
16 bpp was selected for low-end devices. [2][3] The patch only set the
same values for userspace; nothing changed for the console.

Best regards
Thomas

[1]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag2=
00_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
[2]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag2=
00_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
[3]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/mgag2=
00_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286

> =

> commit: =

>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer console
>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic framebuf=
fer emulation
>   01e75fea0d5 mgag200: restore the depth back to 24
> =

> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5 =

> ---------------- --------------------------- --------------------------- =

>      43921 =C2=B1  2%     -18.3%      35884            -4.8%      41826  =
      vm-scalability.median
>   14889337           -17.5%   12291029            -4.1%   14278574       =
 vm-scalability.throughput
>  =

> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
> Author: Feng Tang <feng.tang@intel.com>
> Date:   Fri Aug 2 15:09:19 2019 +0800
> =

>     mgag200: restore the depth back to 24
>     =

>     Signed-off-by: Feng Tang <feng.tang@intel.com>
> =

> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mga=
g200/mgag200_main.c
> index a977333..ac8f6c9 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsig=
ned long flags)
>  	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>  		dev->mode_config.preferred_depth =3D 16;
>  	else
> -		dev->mode_config.preferred_depth =3D 32;
> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefer_sh=
adow =3D 1;
>  =

>  	r =3D mgag200_modeset_init(mdev);
> =

> Thanks,
> Feng
> =

>>
>>
>> The difference between mgag200's original fbdev support and generic
>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>> buffer from the shadow buffer. mgag200 does this immediately, but relies
>> on drm_can_sleep(), which is deprecated.
>>
>> I think that the worker task interferes with the test case, as the
>> worker has been in fbdev emulation since forever and no performance
>> regressions have been reported so far.
>>
>>
>> So unless there's a report where this problem happens in a real-world
>> use case, I'd like to keep code as it is. And apparently there's always
>> the workaround of disabling the cursor blinking.
>>
>> Best regards
>> Thomas
>>

-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============7234446717543315878==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxSUExY0FDZ2tRYUEzQkhWTUwKZWlPZm9BZitKaDNEL3k5NU5v
RVlBb3M4SkhIOWt1YlZTdjJGZ05oand5dTF0eEFXajl2dS93OFZVVlFXajM4cwo3Rm90Zk11ZFV1
WUtwb2tNd2xoOUJzUDFod05VMUY0SklnNUxGUzlRWER4SVVFMEJDbXFxZ0FNa0VLdTJhTDNTCnp0
SFFnMWt3bGxGK2dBWWt5cjBvaysrY0VYalJrK2J4Mk55Vk1FS2Y1bXV2K25jOGlQUnhjM1BZWmNw
L0ZiRTIKMFJackx1OWFPWXJyeFoyc2dRdUYzWk1JWjgrbmUvSXpuem9abWZCbmlwNnhUVFB5a2ZB
d09ZUnVyZSs2Q0grbwoxdjlpVS9aV3cramhHaHZXeDlzRkx3aHJTNll1bENrekhRWTBzVE0wQzd5
cDh2N0psMjJ6OFdsRGlRbWhudmxTCkRUNHA5S0J5SUhWcGg2M0JpcTd6dnZDT0JIcTUydz09Cj1Q
OHEyCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7234446717543315878==--

