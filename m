Content-Type: multipart/mixed; boundary="===============6480231722979507474=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Tue, 17 Sep 2019 10:48:14 +0200
Message-ID: <60ae9ffa-88e0-1219-ee6a-269495055df2@suse.de>
In-Reply-To: <20190916090652.GK5541@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6480231722979507474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.09.19 um 11:06 schrieb Feng Tang:
> Hi Thomas,
> =

> On Mon, Sep 09, 2019 at 04:12:37PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 04.09.19 um 08:27 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Wed, Aug 28, 2019 at 12:51:40PM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 28.08.19 um 11:37 schrieb Rong Chen:
>>>>> Hi Thomas,
>>>>>
>>>>> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
>>>>>> Hi
>>>>>>
>>>>>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>>>>>>> Both patches have little impact on the performance from our side.
>>>>>> Thanks for testing. Too bad they doesn't solve the issue.
>>>>>>
>>>>>> There's another patch attached. Could you please tests this as well?
>>>>>> Thanks a lot!
>>>>>>
>>>>>> The patch comes from Daniel Vetter after discussing the problem on I=
RC.
>>>>>> The idea of the patch is that the old mgag200 code might display much
>>>>>> less frames that the generic code, because mgag200 only prints from
>>>>>> non-atomic context. If we simulate this with the generic code, we sh=
ould
>>>>>> see roughly the original performance.
>>>>>>
>>>>>>
>>>>>
>>>>> It's cool, the patch "usecansleep.patch" can fix the issue.
>>>>
>>>> Thank you for testing. But don't get too excited, because the patch
>>>> simulates a bug that was present in the original mgag200 code. A
>>>> significant number of frames are simply skipped. That is apparently the
>>>> reason why it's faster.
>>>
>>> Thanks for the detailed info, so the original code skips time-consuming
>>> work inside atomic context on purpose. Is there any space to optmise it?
>>> If 2 scheduled update worker are handled at almost same time, can one be
>>> skipped?
>>
>> We discussed ideas on IRC and decided that screen updates could be
>> synchronized with vblank intervals. This may give some rate limiting to
>> the output.
>>
>> If you like, you could try the patch set at [1]. It adds the respective
>> code to console and mgag200.
> =

> I just tried the 2 patches, no obvious change (comparing to the
> 18.8% regression), both in overall benchmark and micro-profiling.
> =

> 90f479ae51afa45e 04a0983095feaee022cdd65e3e4 =

> ---------------- --------------------------- =

>      37236 =C2=B1  3%      +2.5%      38167 =C2=B1  3%  vm-scalability.me=
dian
>       0.15 =C2=B1 24%     -25.1%       0.11 =C2=B1 23%  vm-scalability.me=
dian_stddev
>       0.15 =C2=B1 23%     -25.1%       0.11 =C2=B1 22%  vm-scalability.st=
ddev
>   12767318 =C2=B1  4%      +2.5%   13089177 =C2=B1  3%  vm-scalability.th=
roughput

Thank you for testing. I wish we'd seen at least some improvement.

Best regards
Thomas

> Thanks,
> Feng
> =

>>
>> Best regards
>> Thomas
>>
>> [1]
>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234850.h=
tml
>>
>>>
>>> Thanks,
>>> Feng
>>>
>>>>
>>>> Best regards
>>>> Thomas
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
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============6480231722979507474==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwyQW5jNEFDZ2tRYUEzQkhWTUwKZWlPU3JnZ0F0TFBMclhHa3Zx
cWsrMnhyWGp0dm1PaC8wdTM1MXU3QWNXMnJDUUNoL21JQ1VHMVRaWXhhdVltKwp4ZW5SdmtSZHNk
NDhMenpsaGpIL0VSQXdLMkc1NlVFM2ROTHRxU3d5SG5sczRlYUJ4alA0YUdqM2dRVHZ3N3VOCmZP
QXhjTmJSRm1DbnBXb3c0L2NCWGtMMnc1dExvMmNXN1R3VWRoYld4UkF2aWVIZTd3elR2UjBUSEpz
ZFdobUgKV0tTRG9NRTh2NU0yOHZ1MXFxMkszMVR6M08wYm13QnljRUp0QjdkdXNXRVRIMmFnR0VB
QjBpWDV2bEMrVUZxdwo1NzUvcnBXSVZPeVI5TFIrS2N1U3dndXQxd1ZyYnZwVXR6U3d0NnJiaUtw
MmJpeTU3NFhyaXIvMFpxTmphbEJ5CjNlcUw0YWdsNmtFSC9OVmhJU2N4SU9CWGFrUDBpdz09Cj15
bXV1Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6480231722979507474==--

