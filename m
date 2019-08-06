Content-Type: multipart/mixed; boundary="===============3711743085777873923=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Tue, 06 Aug 2019 20:59:27 +0800
Message-ID: <37ae41e4-455d-c18d-5c93-7df854abfef9@intel.com>
In-Reply-To: <045a23ab-78f7-f363-4a2e-bf24a7a2f79e@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3711743085777873923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 8/5/2019 6:25 PM, Thomas Zimmermann wrote:
> Hi
>
> Am 05.08.19 um 09:28 schrieb Rong Chen:
>> Hi,
>>
>> On 8/5/19 3:02 PM, Feng Tang wrote:
>>> Hi Thomas,
>>>
>>> On Sun, Aug 04, 2019 at 08:39:19PM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> I did some further analysis on this problem and found that the blinking
>>>> cursor affects performance of the vm-scalability test case.
>>>>
>>>> I only have a 4-core machine, so scalability is not really testable. Y=
et
>>>> I see the effects of running vm-scalibility against drm-tip, a revert =
of
>>>> the mgag200 patch and the vmap fixes that I posted a few days ago.
>>>>
>>>> After reverting the mgag200 patch, running the test as described in the
>>>> report
>>>>
>>>>  =C2=A0=C2=A0 bin/lkp run job.yaml
>>>>
>>>> gives results like
>>>>
>>>>  =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>  =C2=A0=C2=A0 2019-08-02 19:34:37=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>>> --prefault
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815395225
>>>>  =C2=A0=C2=A0 917319627 bytes / 756534 usecs =3D 1184110 KB/s
>>>>  =C2=A0=C2=A0 917319627 bytes / 764675 usecs =3D 1171504 KB/s
>>>>  =C2=A0=C2=A0 917319627 bytes / 766414 usecs =3D 1168846 KB/s
>>>>  =C2=A0=C2=A0 917319627 bytes / 777990 usecs =3D 1151454 KB/s
>>>>
>>>> Running the test against current drm-tip gives slightly worse results,
>>>> such as.
>>>>
>>>>  =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>  =C2=A0=C2=A0 2019-08-03 19:17:06=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>>> --prefault
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>  =C2=A0=C2=A0 917318700 bytes / 871607 usecs =3D 1027778 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 894173 usecs =3D 1001840 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 919694 usecs =3D 974040 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 923341 usecs =3D 970193 KB/s
>>>>
>>>> The test puts out roughly one result per second. Strangely sending the
>>>> output to /dev/null can make results significantly worse.
>>>>
>>>>  =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>>
>>>>  =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>  =C2=A0=C2=A0 2019-08-03 19:23:04=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>>> --prefault
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>  =C2=A0=C2=A0 917318700 bytes / 1207358 usecs =3D 741966 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 1210456 usecs =3D 740067 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 1216572 usecs =3D 736346 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 1239152 usecs =3D 722929 KB/s
>>>>
>>>> I realized that there's still a blinking cursor on the screen, which I
>>>> disabled with
>>>>
>>>>  =C2=A0=C2=A0 tput civis
>>>>
>>>> or alternatively
>>>>
>>>>  =C2=A0=C2=A0 echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink
>>>>
>>>> Running the the test now gives the original or even better results,
>>>> such as
>>>>
>>>>  =C2=A0=C2=A0 bin/lkp run job.yaml > /dev/null
>>>>
>>>>  =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./case-anon-cow-seq-hugetlb
>>>>  =C2=A0=C2=A0 2019-08-03 19:29:17=C2=A0 ./usemem --runtime 300 -n 4 --=
prealloc
>>>> --prefault
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 -O -U 815394406
>>>>  =C2=A0=C2=A0 917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>  =C2=A0=C2=A0 917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>
>>>> Rong, Feng, could you confirm this by disabling the cursor or blinking?
>>> Glad to know this method restored the drop. Rong is running the case.
>> I set "echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink" for
>> both commits,
>> and the regression has no obvious change.
> Ah, I see. Thank you for testing. There are two questions that come to
> my mind: did you send the regular output to /dev/null? And what happens
> if you disable the cursor with 'tput civis'?

I didn't send the output to /dev/null because we need to collect data =

from the output,
Actually we run the benchmark as a background process, do we need to =

disable the cursor and test again?

Best Regards,
Rong Chen

>
> If there is absolutely nothing changing on the screen, I don't see how
> the regression could persist.
>
> Best regards
> Thomas
>
>
>> commit:
>>  =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer c=
onsole
>>  =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
>> framebuffer emulation
>>
>> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams/te=
stbox
>> ----------------=C2=A0 -------------------------- ----------------------=
-----
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>  =C2=A0=C2=A0=C2=A0=C2=A0 43394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575 =
=C2=B1=C2=A0 3%
>> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>  =C2=A0=C2=A0=C2=A0=C2=A0 43393=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34575=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
>> vm-scalability.median
>>
>> Best Regards,
>> Rong Chen
>>
>>> While I have another finds, as I noticed your patch changed the bpp from
>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>> be related?
>>>
>>> commit:
>>>  =C2=A0=C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs frameb=
uffer console
>>>  =C2=A0=C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with ge=
neric
>>> framebuffer emulation
>>>  =C2=A0=C2=A0 01e75fea0d5 mgag200: restore the depth back to 24
>>>
>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20ec5
>>> ---------------- --------------------------- ---------------------------
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43921 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=
=C2=A0 -18.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.8%
>>> 41826=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.median
>>>  =C2=A0=C2=A0 14889337=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -17.5%=C2=A0=C2=A0 12291029=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -4.1%
>>> 14278574=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm-scalability.throu=
ghput
>>>  =C2=A0 commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>> Author: Feng Tang <feng.tang@intel.com>
>>> Date:=C2=A0=C2=A0 Fri Aug 2 15:09:19 2019 +0800
>>>
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 mgag200: restore the depth back to 24
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 Signed-off-by: Feng =
Tang <feng.tang@intel.com>
>>>
>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> index a977333..ac8f6c9 100644
>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev,
>>> unsigned long flags)
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_G200_SE(mdev) && mdev->mc.vram_s=
ize < (2048*1024))
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_confi=
g.preferred_depth =3D 16;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_=
depth =3D 32;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.preferred_=
depth =3D 24;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->mode_config.prefer_shadow =3D 1;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D mgag200_modeset_init(mdev);
>>>
>>> Thanks,
>>> Feng
>>>
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
>
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============3711743085777873923==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.html"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgSGksPGJyPgogICAgPGJyPgogICAgPGRpdiBj
bGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA4LzUvMjAxOSA2OjI1IFBNLCBUaG9tYXMgWmltbWVy
bWFubgogICAgICB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNp
dGUiCiAgICAgIGNpdGU9Im1pZDowNDVhMjNhYi03OGY3LWYzNjMtNGEyZS1iZjI0YTdhMmY3OWVA
c3VzZS5kZSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+SGkKCkFt
IDA1LjA4LjE5IHVtIDA5OjI4IHNjaHJpZWIgUm9uZyBDaGVuOgo8L3ByZT4KICAgICAgPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3Jh
cD0iIj5IaSwKCk9uIDgvNS8xOSAzOjAyIFBNLCBGZW5nIFRhbmcgd3JvdGU6CjwvcHJlPgogICAg
ICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1
b3RlLXByZSIgd3JhcD0iIj5IaSBUaG9tYXMsCgpPbiBTdW4sIEF1ZyAwNCwgMjAxOSBhdCAwODoz
OToxOVBNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToKPC9wcmU+CiAgICAgICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj5IaQoKSSBkaWQgc29tZSBmdXJ0aGVyIGFuYWx5c2lzIG9uIHRoaXMgcHJv
YmxlbSBhbmQgZm91bmQgdGhhdCB0aGUgYmxpbmtpbmcKY3Vyc29yIGFmZmVjdHMgcGVyZm9ybWFu
Y2Ugb2YgdGhlIHZtLXNjYWxhYmlsaXR5IHRlc3QgY2FzZS4KCkkgb25seSBoYXZlIGEgNC1jb3Jl
IG1hY2hpbmUsIHNvIHNjYWxhYmlsaXR5IGlzIG5vdCByZWFsbHkgdGVzdGFibGUuIFlldApJIHNl
ZSB0aGUgZWZmZWN0cyBvZiBydW5uaW5nIHZtLXNjYWxpYmlsaXR5IGFnYWluc3QgZHJtLXRpcCwg
YSByZXZlcnQgb2YKdGhlIG1nYWcyMDAgcGF0Y2ggYW5kIHRoZSB2bWFwIGZpeGVzIHRoYXQgSSBw
b3N0ZWQgYSBmZXcgZGF5cyBhZ28uCgpBZnRlciByZXZlcnRpbmcgdGhlIG1nYWcyMDAgcGF0Y2gs
IHJ1bm5pbmcgdGhlIHRlc3QgYXMgZGVzY3JpYmVkIGluIHRoZQpyZXBvcnQKCsKgwqAgYmluL2xr
cCBydW4gam9iLnlhbWwKCmdpdmVzIHJlc3VsdHMgbGlrZQoKwqDCoCAyMDE5LTA4LTAyIDE5OjM0
OjM3wqAgLi9jYXNlLWFub24tY293LXNlcS1odWdldGxiCsKgwqAgMjAxOS0wOC0wMiAxOTozNDoz
N8KgIC4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gNCAtLXByZWFsbG9jCi0tcHJlZmF1bHQKwqDC
oMKgwqAgLU8gLVUgODE1Mzk1MjI1CsKgwqAgOTE3MzE5NjI3IGJ5dGVzIC8gNzU2NTM0IHVzZWNz
ID0gMTE4NDExMCBLQi9zCsKgwqAgOTE3MzE5NjI3IGJ5dGVzIC8gNzY0Njc1IHVzZWNzID0gMTE3
MTUwNCBLQi9zCsKgwqAgOTE3MzE5NjI3IGJ5dGVzIC8gNzY2NDE0IHVzZWNzID0gMTE2ODg0NiBL
Qi9zCsKgwqAgOTE3MzE5NjI3IGJ5dGVzIC8gNzc3OTkwIHVzZWNzID0gMTE1MTQ1NCBLQi9zCgpS
dW5uaW5nIHRoZSB0ZXN0IGFnYWluc3QgY3VycmVudCBkcm0tdGlwIGdpdmVzIHNsaWdodGx5IHdv
cnNlIHJlc3VsdHMsCnN1Y2ggYXMuCgrCoMKgIDIwMTktMDgtMDMgMTk6MTc6MDbCoCAuL2Nhc2Ut
YW5vbi1jb3ctc2VxLWh1Z2V0bGIKwqDCoCAyMDE5LTA4LTAzIDE5OjE3OjA2wqAgLi91c2VtZW0g
LS1ydW50aW1lIDMwMCAtbiA0IC0tcHJlYWxsb2MKLS1wcmVmYXVsdArCoMKgwqDCoCAtTyAtVSA4
MTUzOTQ0MDYKwqDCoCA5MTczMTg3MDAgYnl0ZXMgLyA4NzE2MDcgdXNlY3MgPSAxMDI3Nzc4IEtC
L3MKwqDCoCA5MTczMTg3MDAgYnl0ZXMgLyA4OTQxNzMgdXNlY3MgPSAxMDAxODQwIEtCL3MKwqDC
oCA5MTczMTg3MDAgYnl0ZXMgLyA5MTk2OTQgdXNlY3MgPSA5NzQwNDAgS0IvcwrCoMKgIDkxNzMx
ODcwMCBieXRlcyAvIDkyMzM0MSB1c2VjcyA9IDk3MDE5MyBLQi9zCgpUaGUgdGVzdCBwdXRzIG91
dCByb3VnaGx5IG9uZSByZXN1bHQgcGVyIHNlY29uZC4gU3RyYW5nZWx5IHNlbmRpbmcgdGhlCm91
dHB1dCB0byAvZGV2L251bGwgY2FuIG1ha2UgcmVzdWx0cyBzaWduaWZpY2FudGx5IHdvcnNlLgoK
wqDCoCBiaW4vbGtwIHJ1biBqb2IueWFtbCAmZ3Q7IC9kZXYvbnVsbAoKwqDCoCAyMDE5LTA4LTAz
IDE5OjIzOjA0wqAgLi9jYXNlLWFub24tY293LXNlcS1odWdldGxiCsKgwqAgMjAxOS0wOC0wMyAx
OToyMzowNMKgIC4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gNCAtLXByZWFsbG9jCi0tcHJlZmF1
bHQKwqDCoMKgwqAgLU8gLVUgODE1Mzk0NDA2CsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gMTIwNzM1
OCB1c2VjcyA9IDc0MTk2NiBLQi9zCsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gMTIxMDQ1NiB1c2Vj
cyA9IDc0MDA2NyBLQi9zCsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gMTIxNjU3MiB1c2VjcyA9IDcz
NjM0NiBLQi9zCsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gMTIzOTE1MiB1c2VjcyA9IDcyMjkyOSBL
Qi9zCgpJIHJlYWxpemVkIHRoYXQgdGhlcmUncyBzdGlsbCBhIGJsaW5raW5nIGN1cnNvciBvbiB0
aGUgc2NyZWVuLCB3aGljaCBJCmRpc2FibGVkIHdpdGgKCsKgwqAgdHB1dCBjaXZpcwoKb3IgYWx0
ZXJuYXRpdmVseQoKwqDCoCBlY2hvIDAgJmd0OyAvc3lzL2RldmljZXMvdmlydHVhbC9ncmFwaGlj
cy9mYmNvbi9jdXJzb3JfYmxpbmsKClJ1bm5pbmcgdGhlIHRoZSB0ZXN0IG5vdyBnaXZlcyB0aGUg
b3JpZ2luYWwgb3IgZXZlbiBiZXR0ZXIgcmVzdWx0cywKc3VjaCBhcwoKwqDCoCBiaW4vbGtwIHJ1
biBqb2IueWFtbCAmZ3Q7IC9kZXYvbnVsbAoKwqDCoCAyMDE5LTA4LTAzIDE5OjI5OjE3wqAgLi9j
YXNlLWFub24tY293LXNlcS1odWdldGxiCsKgwqAgMjAxOS0wOC0wMyAxOToyOToxN8KgIC4vdXNl
bWVtIC0tcnVudGltZSAzMDAgLW4gNCAtLXByZWFsbG9jCi0tcHJlZmF1bHQKwqDCoMKgwqAgLU8g
LVUgODE1Mzk0NDA2CsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gNjU5NDE5IHVzZWNzID0gMTM1ODQ5
NyBLQi9zCsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gNjU5NjU4IHVzZWNzID0gMTM1ODAwNSBLQi9z
CsKgwqAgOTE3MzE4NzAwIGJ5dGVzIC8gNjU5OTE2IHVzZWNzID0gMTM1NzQ3NCBLQi9zCsKgwqAg
OTE3MzE4NzAwIGJ5dGVzIC8gNjYwMTY4IHVzZWNzID0gMTM1Njk1NiBLQi9zCgpSb25nLCBGZW5n
LCBjb3VsZCB5b3UgY29uZmlybSB0aGlzIGJ5IGRpc2FibGluZyB0aGUgY3Vyc29yIG9yIGJsaW5r
aW5nPwo8L3ByZT4KICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgIDxwcmUgY2xhc3M9
Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+R2xhZCB0byBrbm93IHRoaXMgbWV0aG9kIHJlc3RvcmVk
IHRoZSBkcm9wLiBSb25nIGlzIHJ1bm5pbmcgdGhlIGNhc2UuCjwvcHJlPgogICAgICAgIDwvYmxv
Y2txdW90ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpJIHNl
dCAiZWNobyAwICZndDsgL3N5cy9kZXZpY2VzL3ZpcnR1YWwvZ3JhcGhpY3MvZmJjb24vY3Vyc29y
X2JsaW5rIiBmb3IKYm90aCBjb21taXRzLAphbmQgdGhlIHJlZ3Jlc3Npb24gaGFzIG5vIG9idmlv
dXMgY2hhbmdlLgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8cHJlIGNsYXNzPSJt
b3otcXVvdGUtcHJlIiB3cmFwPSIiPgpBaCwgSSBzZWUuIFRoYW5rIHlvdSBmb3IgdGVzdGluZy4g
VGhlcmUgYXJlIHR3byBxdWVzdGlvbnMgdGhhdCBjb21lIHRvCm15IG1pbmQ6IGRpZCB5b3Ugc2Vu
ZCB0aGUgcmVndWxhciBvdXRwdXQgdG8gL2Rldi9udWxsPyBBbmQgd2hhdCBoYXBwZW5zCmlmIHlv
dSBkaXNhYmxlIHRoZSBjdXJzb3Igd2l0aCAndHB1dCBjaXZpcyc/PC9wcmU+CiAgICA8L2Jsb2Nr
cXVvdGU+CiAgICA8YnI+CiAgICBJIGRpZG4ndCBzZW5kIHRoZSBvdXRwdXQgdG8gL2Rldi9udWxs
IGJlY2F1c2Ugd2UgbmVlZCB0byBjb2xsZWN0CiAgICBkYXRhIGZyb20gdGhlIG91dHB1dCw8YnI+
CiAgICBBY3R1YWxseSB3ZSBydW4gdGhlIGJlbmNobWFyayBhcyBhIGJhY2tncm91bmQgcHJvY2Vz
cywgZG8gd2UgbmVlZCB0bwogICAgZGlzYWJsZSB0aGUgY3Vyc29yIGFuZCB0ZXN0IGFnYWluPzxi
cj4KICAgIDxicj4KICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICBSb25nIENoZW48YnI+CiAgICA8
YnI+CiAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICBjaXRlPSJtaWQ6MDQ1YTIzYWIt
NzhmNy1mMzYzLTRhMmUtYmYyNGE3YTJmNzllQHN1c2UuZGUiPgogICAgICA8cHJlIGNsYXNzPSJt
b3otcXVvdGUtcHJlIiB3cmFwPSIiPgoKSWYgdGhlcmUgaXMgYWJzb2x1dGVseSBub3RoaW5nIGNo
YW5naW5nIG9uIHRoZSBzY3JlZW4sIEkgZG9uJ3Qgc2VlIGhvdwp0aGUgcmVncmVzc2lvbiBjb3Vs
ZCBwZXJzaXN0LgoKQmVzdCByZWdhcmRzClRob21hcwoKCjwvcHJlPgogICAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PmNvbW1pdDoKwqAgZjFmODU1NWRmYjkgZHJtL2JvY2hzOiBVc2Ugc2hhZG93IGJ1ZmZlciBmb3Ig
Ym9jaHMgZnJhbWVidWZmZXIgY29uc29sZQrCoCA5MGY0NzlhZTUxYSBkcm0vbWdhZzIwMDogUmVw
bGFjZSBzdHJ1Y3QgbWdhX2ZiZGV2IHdpdGggZ2VuZXJpYwpmcmFtZWJ1ZmZlciBlbXVsYXRpb24K
CmYxZjg1NTVkZmI5YTcwYTLCoCA5MGY0NzlhZTUxYWZhNDVlZmFiOTdhZmRkZSB0ZXN0Y2FzZS90
ZXN0cGFyYW1zL3Rlc3Rib3gKLS0tLS0tLS0tLS0tLS0tLcKgIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQrCoMKgwqDCoMKgwqDCoMKgICVzdGRk
ZXbCoMKgwqDCoMKgIGNoYW5nZcKgwqDCoMKgwqDCoMKgwqAgJXN0ZGRldgrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKwqDCoMKgwqAgNDMzOTTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTIwJcKgwqDC
oMKgwqAgMzQ1NzUgwrHCoCAzJQp2bS1zY2FsYWJpbGl0eS9wZXJmb3JtYW5jZS0zMDBzLThULWFu
b24tY293LXNlcS1odWdldGxiL2xrcC1rbm0wMQrCoMKgwqDCoCA0MzM5M8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtMjAlwqDCoMKgwqDCoCAzNDU3NcKgwqDCoMKgwqDCoMKgIEdFTy1NRUFOCnZt
LXNjYWxhYmlsaXR5Lm1lZGlhbgoKQmVzdCBSZWdhcmRzLApSb25nIENoZW4KCjwvcHJlPgogICAg
ICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1
b3RlLXByZSIgd3JhcD0iIj4KV2hpbGUgSSBoYXZlIGFub3RoZXIgZmluZHMsIGFzIEkgbm90aWNl
ZCB5b3VyIHBhdGNoIGNoYW5nZWQgdGhlIGJwcCBmcm9tCjI0IHRvIDMyLCBJIGhhZCBhIHBhdGNo
IHRvIGNoYW5nZSBpdCBiYWNrIHRvIDI0LCBhbmQgcnVuIHRoZSBjYXNlIGluCnRoZSB3ZWVrZW5k
LCB0aGUgLTE4JSByZWdyc3Npb24gd2FzIHJlZHVjZWQgdG8gYWJvdXQgLTUlLiBDb3VsZCB0aGlz
CmJlIHJlbGF0ZWQ/Cgpjb21taXQ6CsKgwqAgZjFmODU1NWRmYjkgZHJtL2JvY2hzOiBVc2Ugc2hh
ZG93IGJ1ZmZlciBmb3IgYm9jaHMgZnJhbWVidWZmZXIgY29uc29sZQrCoMKgIDkwZjQ3OWFlNTFh
IGRybS9tZ2FnMjAwOiBSZXBsYWNlIHN0cnVjdCBtZ2FfZmJkZXYgd2l0aCBnZW5lcmljCmZyYW1l
YnVmZmVyIGVtdWxhdGlvbgrCoMKgIDAxZTc1ZmVhMGQ1IG1nYWcyMDA6IHJlc3RvcmUgdGhlIGRl
cHRoIGJhY2sgdG8gMjQKCmYxZjg1NTVkZmI5YTcwYTIgOTBmNDc5YWU1MWFmYTQ1ZWZhYjk3YWZk
ZGU5IDAxZTc1ZmVhMGQ1ZmYzOWQzZTU4OGMyMGVjNQotLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KwqDCoMKgwqDC
oCA0MzkyMSDCscKgIDIlwqDCoMKgwqAgLTE4LjMlwqDCoMKgwqDCoCAzNTg4NMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLTQuOCXCoMKgwqDCoMKgCjQxODI2wqDCoMKgwqDCoMKgwqAgdm0tc2NhbGFi
aWxpdHkubWVkaWFuCsKgwqAgMTQ4ODkzMzfCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMTcuNSXCoMKg
IDEyMjkxMDI5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtNC4xJcKgwqAKMTQyNzg1NzTCoMKgwqDC
oMKgwqDCoCB2bS1zY2FsYWJpbGl0eS50aHJvdWdocHV0CsKgIGNvbW1pdCAwMWU3NWZlYTBkNWZm
MzlkM2U1ODhjMjBlYzUyZTdhNGU2NTg4YTc0CkF1dGhvcjogRmVuZyBUYW5nIDxhIGNsYXNzPSJt
b3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpmZW5nLnRhbmdAaW50ZWwuY29tIj4m
bHQ7ZmVuZy50YW5nQGludGVsLmNvbSZndDs8L2E+CkRhdGU6wqDCoCBGcmkgQXVnIDIgMTU6MDk6
MTkgMjAxOSArMDgwMAoKwqDCoMKgwqAgbWdhZzIwMDogcmVzdG9yZSB0aGUgZGVwdGggYmFjayB0
byAyNArCoMKgwqDCoCDCoMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBGZW5nIFRhbmcgPGEgY2xhc3M9
Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmZlbmcudGFuZ0BpbnRlbC5jb20i
PiZsdDtmZW5nLnRhbmdAaW50ZWwuY29tJmd0OzwvYT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21haW4uYwpiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbWFpbi5jCmluZGV4IGE5NzczMzMuLmFjOGY2YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfbWFpbi5jCkBAIC0xNjIsNyArMTYyLDcgQEAgaW50IG1nYWcyMDBfZHJpdmVy
X2xvYWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKdW5zaWduZWQgbG9uZyBmbGFncykKwqDCoMKg
wqDCoCBpZiAoSVNfRzIwMF9TRShtZGV2KSAmYW1wOyZhbXA7IG1kZXYtJmd0O21jLnZyYW1fc2l6
ZSAmbHQ7ICgyMDQ4KjEwMjQpKQrCoMKgwqDCoMKgwqDCoMKgwqAgZGV2LSZndDttb2RlX2NvbmZp
Zy5wcmVmZXJyZWRfZGVwdGggPSAxNjsKwqDCoMKgwqDCoCBlbHNlCi3CoMKgwqDCoMKgwqDCoCBk
ZXYtJmd0O21vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDMyOworwqDCoMKgwqDCoMKgwqAg
ZGV2LSZndDttb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsKwqDCoMKgwqDCoCBkZXYt
Jmd0O21vZGVfY29uZmlnLnByZWZlcl9zaGFkb3cgPSAxOwrCoCDCoMKgwqDCoMKgIHIgPSBtZ2Fn
MjAwX21vZGVzZXRfaW5pdChtZGV2KTsKClRoYW5rcywKRmVuZwoKPC9wcmU+CiAgICAgICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3Rl
LXByZSIgd3JhcD0iIj4KVGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBtZ2FnMjAwJ3Mgb3JpZ2luYWwg
ZmJkZXYgc3VwcG9ydCBhbmQgZ2VuZXJpYwpmYmRldiBlbXVsYXRpb24gaXMgZ2VuZXJpYyBmYmRl
didzIHdvcmtlciB0YXNrIHRoYXQgdXBkYXRlcyB0aGUgVlJBTQpidWZmZXIgZnJvbSB0aGUgc2hh
ZG93IGJ1ZmZlci4gbWdhZzIwMCBkb2VzIHRoaXMgaW1tZWRpYXRlbHksIGJ1dCByZWxpZXMKb24g
ZHJtX2Nhbl9zbGVlcCgpLCB3aGljaCBpcyBkZXByZWNhdGVkLgoKSSB0aGluayB0aGF0IHRoZSB3
b3JrZXIgdGFzayBpbnRlcmZlcmVzIHdpdGggdGhlIHRlc3QgY2FzZSwgYXMgdGhlCndvcmtlciBo
YXMgYmVlbiBpbiBmYmRldiBlbXVsYXRpb24gc2luY2UgZm9yZXZlciBhbmQgbm8gcGVyZm9ybWFu
Y2UKcmVncmVzc2lvbnMgaGF2ZSBiZWVuIHJlcG9ydGVkIHNvIGZhci4KCgpTbyB1bmxlc3MgdGhl
cmUncyBhIHJlcG9ydCB3aGVyZSB0aGlzIHByb2JsZW0gaGFwcGVucyBpbiBhIHJlYWwtd29ybGQK
dXNlIGNhc2UsIEknZCBsaWtlIHRvIGtlZXAgY29kZSBhcyBpdCBpcy4gQW5kIGFwcGFyZW50bHkg
dGhlcmUncyBhbHdheXMKdGhlIHdvcmthcm91bmQgb2YgZGlzYWJsaW5nIHRoZSBjdXJzb3IgYmxp
bmtpbmcuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo8L3ByZT4KICAgICAgICAgIDwvYmxvY2txdW90
ZT4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXBy
ZSIgd3JhcD0iIj4KPC9wcmU+CiAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgPHByZSBjbGFzcz0i
bW96LXF1b3RlLXByZSIgd3JhcD0iIj4KPC9wcmU+CiAgICAgIDxicj4KICAgICAgPGZpZWxkc2V0
IGNsYXNzPSJtaW1lQXR0YWNobWVudEhlYWRlciI+PC9maWVsZHNldD4KICAgICAgPHByZSBjbGFz
cz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMS1AgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmst
YWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpMS1BAbGlzdHMuMDEub3JnIj5MS1BAbGlzdHMuMDEu
b3JnPC9hPgo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xp
c3RzLjAxLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xrcCI+aHR0cHM6Ly9saXN0cy4wMS5vcmcvbWFp
bG1hbi9saXN0aW5mby9sa3A8L2E+CjwvcHJlPgogICAgPC9ibG9ja3F1b3RlPgogICAgPGJyPgog
IDwvYm9keT4KPC9odG1sPgo=

--===============3711743085777873923==--

