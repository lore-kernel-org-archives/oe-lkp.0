Content-Type: multipart/mixed; boundary="===============4200780377139037483=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 08 Jan 2020 02:28:50 +0000
Message-ID: <654bacf5-0567-0552-5cdb-c155d96d92bf@intel.com>
In-Reply-To: <89eedbfc-6174-e59d-921e-b92d11a52331@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4200780377139037483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

The previous throughput was reduced from 43955 to 35691, and there is a lit=
tle increase in next-20200106,
but there is no obvious change after the patchset:
  =

commit:
   f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer console")
   90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic framebuf=
fer emulation")

f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9
---------------- ---------------------------
          %stddev     %change         %stddev
              \          |                \
      43955 =C2=B1  2%     -18.8%      35691        vm-scalability.median

commit:

   9eb1b48ca4 ("Add linux-next specific files for 20200106")
   5f20199bac ("drm/fb-helper: Synchronize dirty worker with vblank")

  next-20200106  5f20199bac9b2de71fd2158b90
----------------  --------------------------
          %stddev      change         %stddev
              \          |                \
      38550                       38744
      38549                       38744        vm-scalability.median


Best Regards,
Rong Chen

On 1/6/20 9:19 PM, Thomas Zimmermann wrote:
> Hi Feng,
>
> do you still have the test setup that produced the performance penalty?
>
> If so, could you give a try to the patchset at [1]? I think I've fixed
> the remaining issues in earlier versions and I'd like to see if it
> actually improves performance.
>
> Best regards
> Thomas
>
> [1]
> https://lists.freedesktop.org/archives/dri-devel/2019-December/247771.html
>
> Am 05.08.19 um 14:52 schrieb Feng Tang:
>> Hi Thomas,
>>
>> On Mon, Aug 05, 2019 at 12:22:11PM +0200, Thomas Zimmermann wrote:
>>
>> 	[snip]
>>
>>>>>    2019-08-03 19:29:17  ./case-anon-cow-seq-hugetlb
>>>>>    2019-08-03 19:29:17  ./usemem --runtime 300 -n 4 --prealloc --pref=
ault
>>>>>      -O -U 815394406
>>>>>    917318700 bytes / 659419 usecs =3D 1358497 KB/s
>>>>>    917318700 bytes / 659658 usecs =3D 1358005 KB/s
>>>>>    917318700 bytes / 659916 usecs =3D 1357474 KB/s
>>>>>    917318700 bytes / 660168 usecs =3D 1356956 KB/s
>>>>>
>>>>> Rong, Feng, could you confirm this by disabling the cursor or blinkin=
g?
>>>> Glad to know this method restored the drop. Rong is running the case.
>>>>
>>>> While I have another finds, as I noticed your patch changed the bpp fr=
om
>>>> 24 to 32, I had a patch to change it back to 24, and run the case in
>>>> the weekend, the -18% regrssion was reduced to about -5%. Could this
>>>> be related?
>>> In the original code, the fbdev console already ran with 32 bpp [1] and
>>> 16 bpp was selected for low-end devices. [2][3] The patch only set the
>>> same values for userspace; nothing changed for the console.
>> I did the experiment becasue I checked the commit
>>
>> 90f479ae51afa4 drm/mgag200: Replace struct mga_fbdev with generic frameb=
uffer emulation
>>
>> in which there is code:
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mg=
ag200/mgag200_main.c
>> index b10f726..a977333 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, unsi=
gned long flags)
>>   	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>   		dev->mode_config.preferred_depth =3D 16;
>>   	else
>> -		dev->mode_config.preferred_depth =3D 24;
>> +		dev->mode_config.preferred_depth =3D 32;
>>   	dev->mode_config.prefer_shadow =3D 1;
>>   =

>> My debug patch was kind of restoring of this part.
>>
>> Thanks,
>> Feng
>>
>>> Best regards
>>> Thomas
>>>
>>> [1]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/m=
gag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n259
>>> [2]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/m=
gag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n263
>>> [3]
>>> https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/mgag200/m=
gag200_fb.c?id=3D5d17718997367c435dbe5341a8e270d9b19478d3#n286
>>>
>>>> commit:
>>>>    f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
>>>>    90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fram=
ebuffer emulation
>>>>    01e75fea0d5 mgag200: restore the depth back to 24
>>>>
>>>> f1f8555dfb9a70a2 90f479ae51afa45efab97afdde9 01e75fea0d5ff39d3e588c20e=
c5
>>>> ---------------- --------------------------- -------------------------=
--
>>>>       43921 =C2=B1  2%     -18.3%      35884            -4.8%      418=
26        vm-scalability.median
>>>>    14889337           -17.5%   12291029            -4.1%   14278574   =
     vm-scalability.throughput
>>>>   =

>>>> commit 01e75fea0d5ff39d3e588c20ec52e7a4e6588a74
>>>> Author: Feng Tang <feng.tang@intel.com>
>>>> Date:   Fri Aug 2 15:09:19 2019 +0800
>>>>
>>>>      mgag200: restore the depth back to 24
>>>>      =

>>>>      Signed-off-by: Feng Tang <feng.tang@intel.com>
>>>>
>>>> diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/=
mgag200/mgag200_main.c
>>>> index a977333..ac8f6c9 100644
>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>>>> @@ -162,7 +162,7 @@ int mgag200_driver_load(struct drm_device *dev, un=
signed long flags)
>>>>   	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
>>>>   		dev->mode_config.preferred_depth =3D 16;
>>>>   	else
>>>> -		dev->mode_config.preferred_depth =3D 32;
>>>> +		dev->mode_config.preferred_depth =3D 24;>  	dev->mode_config.prefer=
_shadow =3D 1;
>>>>   =

>>>>   	r =3D mgag200_modeset_init(mdev);
>>>>
>>>> Thanks,
>>>> Feng
>>>>
>>>>>
>>>>> The difference between mgag200's original fbdev support and generic
>>>>> fbdev emulation is generic fbdev's worker task that updates the VRAM
>>>>> buffer from the shadow buffer. mgag200 does this immediately, but rel=
ies
>>>>> on drm_can_sleep(), which is deprecated.
>>>>>
>>>>> I think that the worker task interferes with the test case, as the
>>>>> worker has been in fbdev emulation since forever and no performance
>>>>> regressions have been reported so far.
>>>>>
>>>>>
>>>>> So unless there's a report where this problem happens in a real-world
>>>>> use case, I'd like to keep code as it is. And apparently there's alwa=
ys
>>>>> the workaround of disabling the cursor blinking.
>>>>>
>>>>> Best regards
>>>>> Thomas
>>>>>
>>> -- =

>>> Thomas Zimmermann
>>> Graphics Driver Developer
>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>> HRB 21284 (AG N=C3=BCrnberg)
>>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel(a)lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>


--===============4200780377139037483==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRl
bnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAgPC9oZWFkPgogIDxib2R5IHRleHQ9IiMw
MDAwMDAiIGJnY29sb3I9IiNGRkZGRkYiPgogICAgPHByZSBzdHlsZT0iZm9udC1zaXplOiAxM3B4
OyBmb250LWZhbWlseTogbW9ub3NwYWNlOyB3aGl0ZS1zcGFjZTogcHJlLXdyYXA7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7IGZvbnQtc3R5bGU6IG5vcm1hbDsgZm9udC12YXJpYW50LWxpZ2F0dXJlczog
bm9ybWFsOyBmb250LXZhcmlhbnQtY2Fwczogbm9ybWFsOyBmb250LXdlaWdodDogNDAwOyBsZXR0
ZXItc3BhY2luZzogbm9ybWFsOyBvcnBoYW5zOiAyOyB0ZXh0LWFsaWduOiBzdGFydDsgdGV4dC1p
bmRlbnQ6IDBweDsgdGV4dC10cmFuc2Zvcm06IG5vbmU7IHdpZG93czogMjsgd29yZC1zcGFjaW5n
OiAwcHg7IC13ZWJraXQtdGV4dC1zdHJva2Utd2lkdGg6IDBweDsgdGV4dC1kZWNvcmF0aW9uLXN0
eWxlOiBpbml0aWFsOyB0ZXh0LWRlY29yYXRpb24tY29sb3I6IGluaXRpYWw7Ij5IaSBUaG9tYXMs
CgpUaGUgcHJldmlvdXMgdGhyb3VnaHB1dCB3YXMgcmVkdWNlZCBmcm9tIDQzOTU1IHRvIDM1Njkx
LCBhbmQgdGhlcmUgaXMgYSBsaXR0bGUgaW5jcmVhc2UgaW4gbmV4dC0yMDIwMDEwNiwKYnV0IHRo
ZXJlIGlzIG5vIG9idmlvdXMgY2hhbmdlIGFmdGVyIHRoZSBwYXRjaHNldDoKwqAKY29tbWl0OiAK
ICBmMWY4NTU1ZGZiICgiZHJtL2JvY2hzOiBVc2Ugc2hhZG93IGJ1ZmZlciBmb3IgYm9jaHMgZnJh
bWVidWZmZXIgY29uc29sZSIpCiAgOTBmNDc5YWU1MSAoImRybS9tZ2FnMjAwOiBSZXBsYWNlIHN0
cnVjdCBtZ2FfZmJkZXYgd2l0aCBnZW5lcmljIGZyYW1lYnVmZmVyIGVtdWxhdGlvbiIpCgpmMWY4
NTU1ZGZiOWE3MGEyIDkwZjQ3OWFlNTFhZmE0NWVmYWI5N2FmZGRlOSAKLS0tLS0tLS0tLS0tLS0t
LSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gCiAgICAgICAgICVzdGRkZXYgICAgICVjaGFu
Z2UgICAgICAgICAlc3RkZGV2CiAgICAgICAgICAgICBcICAgICAgICAgIHwgICAgICAgICAgICAg
ICAgXCAgCiAgICAgNDM5NTUgwrEgIDIlICAgICAtMTguOCUgICAgICAzNTY5MSAgICAgICAgdm0t
c2NhbGFiaWxpdHkubWVkaWFuCgpjb21taXQ6IAoKICA5ZWIxYjQ4Y2E0ICgiQWRkIGxpbnV4LW5l
eHQgc3BlY2lmaWMgZmlsZXMgZm9yIDIwMjAwMTA2IikKICA1ZjIwMTk5YmFjICgiZHJtL2ZiLWhl
bHBlcjogU3luY2hyb25pemUgZGlydHkgd29ya2VyIHdpdGggdmJsYW5rIikKCiBuZXh0LTIwMjAw
MTA2ICA1ZjIwMTk5YmFjOWIyZGU3MWZkMjE1OGI5MAotLS0tLS0tLS0tLS0tLS0tICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAlc3RkZGV2ICAgICAgY2hhbmdlICAgICAgICAg
JXN0ZGRldgogICAgICAgICAgICAgXCAgICAgICAgICB8ICAgICAgICAgICAgICAgIFwgIAogICAg
IDM4NTUwICAgICAgICAgICAgICAgICAgICAgICAzODc0NCAgICAgICAKICAgICAzODU0OSAgICAg
ICAgICAgICAgICAgICAgICAgMzg3NDQgICAgICAgIHZtLXNjYWxhYmlsaXR5Lm1lZGlhbgo8L3By
ZT4KICAgIDxicj4KICAgIEJlc3QgUmVnYXJkcyw8YnI+CiAgICBSb25nIENoZW48YnI+CiAgICA8
YnI+CiAgICA8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDEvNi8yMCA5OjE5IFBNLCBU
aG9tYXMgWmltbWVybWFubgogICAgICB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1
b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9Im1pZDo4OWVlZGJmYy02MTc0LWU1OWQtOTIxZS1i
OTJkMTFhNTIzMzFAc3VzZS5kZSI+CiAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdy
YXA9IiI+SGkgRmVuZywKCmRvIHlvdSBzdGlsbCBoYXZlIHRoZSB0ZXN0IHNldHVwIHRoYXQgcHJv
ZHVjZWQgdGhlIHBlcmZvcm1hbmNlIHBlbmFsdHk/CgpJZiBzbywgY291bGQgeW91IGdpdmUgYSB0
cnkgdG8gdGhlIHBhdGNoc2V0IGF0IFsxXT8gSSB0aGluayBJJ3ZlIGZpeGVkCnRoZSByZW1haW5p
bmcgaXNzdWVzIGluIGVhcmxpZXIgdmVyc2lvbnMgYW5kIEknZCBsaWtlIHRvIHNlZSBpZiBpdAph
Y3R1YWxseSBpbXByb3ZlcyBwZXJmb3JtYW5jZS4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKClsxXQo8
YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1EZWNlbWJlci8yNDc3NzEuaHRtbCI+
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktRGVj
ZW1iZXIvMjQ3NzcxLmh0bWw8L2E+CgpBbSAwNS4wOC4xOSB1bSAxNDo1MiBzY2hyaWViIEZlbmcg
VGFuZzoKPC9wcmU+CiAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAgIDxwcmUg
Y2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+SGkgVGhvbWFzLAoKT24gTW9uLCBBdWcgMDUs
IDIwMTkgYXQgMTI6MjI6MTFQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6CgoJW3Nu
aXBdIAoKPC9wcmU+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0
ZSI+CiAgICAgICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4gIDIw
MTktMDgtMDMgMTk6Mjk6MTcgIC4vY2FzZS1hbm9uLWNvdy1zZXEtaHVnZXRsYgogIDIwMTktMDgt
MDMgMTk6Mjk6MTcgIC4vdXNlbWVtIC0tcnVudGltZSAzMDAgLW4gNCAtLXByZWFsbG9jIC0tcHJl
ZmF1bHQKICAgIC1PIC1VIDgxNTM5NDQwNgogIDkxNzMxODcwMCBieXRlcyAvIDY1OTQxOSB1c2Vj
cyA9IDEzNTg0OTcgS0IvcwogIDkxNzMxODcwMCBieXRlcyAvIDY1OTY1OCB1c2VjcyA9IDEzNTgw
MDUgS0IvcwogIDkxNzMxODcwMCBieXRlcyAvIDY1OTkxNiB1c2VjcyA9IDEzNTc0NzQgS0Ivcwog
IDkxNzMxODcwMCBieXRlcyAvIDY2MDE2OCB1c2VjcyA9IDEzNTY5NTYgS0IvcwoKUm9uZywgRmVu
ZywgY291bGQgeW91IGNvbmZpcm0gdGhpcyBieSBkaXNhYmxpbmcgdGhlIGN1cnNvciBvciBibGlu
a2luZz8KPC9wcmU+CiAgICAgICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICAgICAgPHByZSBj
bGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KR2xhZCB0byBrbm93IHRoaXMgbWV0aG9kIHJl
c3RvcmVkIHRoZSBkcm9wLiBSb25nIGlzIHJ1bm5pbmcgdGhlIGNhc2UuCgpXaGlsZSBJIGhhdmUg
YW5vdGhlciBmaW5kcywgYXMgSSBub3RpY2VkIHlvdXIgcGF0Y2ggY2hhbmdlZCB0aGUgYnBwIGZy
b20KMjQgdG8gMzIsIEkgaGFkIGEgcGF0Y2ggdG8gY2hhbmdlIGl0IGJhY2sgdG8gMjQsIGFuZCBy
dW4gdGhlIGNhc2UgaW4KdGhlIHdlZWtlbmQsIHRoZSAtMTglIHJlZ3Jzc2lvbiB3YXMgcmVkdWNl
ZCB0byBhYm91dCAtNSUuIENvdWxkIHRoaXMKYmUgcmVsYXRlZD8KPC9wcmU+CiAgICAgICAgICA8
L2Jsb2NrcXVvdGU+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIi
PgpJbiB0aGUgb3JpZ2luYWwgY29kZSwgdGhlIGZiZGV2IGNvbnNvbGUgYWxyZWFkeSByYW4gd2l0
aCAzMiBicHAgWzFdIGFuZAoxNiBicHAgd2FzIHNlbGVjdGVkIGZvciBsb3ctZW5kIGRldmljZXMu
IFsyXVszXSBUaGUgcGF0Y2ggb25seSBzZXQgdGhlCnNhbWUgdmFsdWVzIGZvciB1c2Vyc3BhY2U7
IG5vdGhpbmcgY2hhbmdlZCBmb3IgdGhlIGNvbnNvbGUuCjwvcHJlPgogICAgICAgIDwvYmxvY2tx
dW90ZT4KICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgpJIGRpZCB0
aGUgZXhwZXJpbWVudCBiZWNhc3VlIEkgY2hlY2tlZCB0aGUgY29tbWl0IAoKOTBmNDc5YWU1MWFm
YTQgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc3RydWN0IG1nYV9mYmRldiB3aXRoIGdlbmVyaWMgZnJh
bWVidWZmZXIgZW11bGF0aW9uCgppbiB3aGljaCB0aGVyZSBpcyBjb2RlOgoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJt
L21nYWcyMDAvbWdhZzIwMF9tYWluLmMKaW5kZXggYjEwZjcyNi4uYTk3NzMzMyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tYWluLmMKQEAgLTE2Miw3ICsxNjIsNyBAQCBpbnQgbWdh
ZzIwMF9kcml2ZXJfbG9hZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGZs
YWdzKQogCWlmIChJU19HMjAwX1NFKG1kZXYpICZhbXA7JmFtcDsgbWRldi0mZ3Q7bWMudnJhbV9z
aXplICZsdDsgKDIwNDgqMTAyNCkpCiAJCWRldi0mZ3Q7bW9kZV9jb25maWcucHJlZmVycmVkX2Rl
cHRoID0gMTY7CiAJZWxzZQotCQlkZXYtJmd0O21vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9
IDI0OworCQlkZXYtJmd0O21vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDMyOwogCWRldi0m
Z3Q7bW9kZV9jb25maWcucHJlZmVyX3NoYWRvdyA9IDE7CiAKTXkgZGVidWcgcGF0Y2ggd2FzIGtp
bmQgb2YgcmVzdG9yaW5nIG9mIHRoaXMgcGFydC4KClRoYW5rcywKRmVuZwoKPC9wcmU+CiAgICAg
ICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVv
dGUtcHJlIiB3cmFwPSIiPgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgpbMV0KPGEgY2xhc3M9Im1vei10
eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLXRpcC90cmVlL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYz9pZD01ZDE3
NzE4OTk3MzY3YzQzNWRiZTUzNDFhOGUyNzBkOWIxOTQ3OGQzI24yNTkiPmh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2ZiLmM/aWQ9NWQxNzcxODk5NzM2N2M0MzVkYmU1MzQxYThlMjcwZDliMTk0NzhkMyNu
MjU5PC9hPgpbMl0KPGEgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6
Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRpcC90cmVlL2RyaXZlcnMvZ3B1L2RybS9t
Z2FnMjAwL21nYWcyMDBfZmIuYz9pZD01ZDE3NzE4OTk3MzY3YzQzNWRiZTUzNDFhOGUyNzBkOWIx
OTQ3OGQzI24yNjMiPmh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJl
ZS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2ZiLmM/aWQ9NWQxNzcxODk5NzM2N2M0
MzVkYmU1MzQxYThlMjcwZDliMTk0NzhkMyNuMjYzPC9hPgpbM10KPGEgY2xhc3M9Im1vei10eHQt
bGluay1mcmVldGV4dCIgaHJlZj0iaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJt
LXRpcC90cmVlL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZmIuYz9pZD01ZDE3NzE4
OTk3MzY3YzQzNWRiZTUzNDFhOGUyNzBkOWIxOTQ3OGQzI24yODYiPmh0dHBzOi8vY2dpdC5mcmVl
ZGVza3RvcC5vcmcvZHJtL2RybS10aXAvdHJlZS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2ZiLmM/aWQ9NWQxNzcxODk5NzM2N2M0MzVkYmU1MzQxYThlMjcwZDliMTk0NzhkMyNuMjg2
PC9hPgoKPC9wcmU+CiAgICAgICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj4KICAgICAgICAg
ICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj4KY29tbWl0OiAKICBmMWY4NTU1
ZGZiOSBkcm0vYm9jaHM6IFVzZSBzaGFkb3cgYnVmZmVyIGZvciBib2NocyBmcmFtZWJ1ZmZlciBj
b25zb2xlCiAgOTBmNDc5YWU1MWEgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc3RydWN0IG1nYV9mYmRl
diB3aXRoIGdlbmVyaWMgZnJhbWVidWZmZXIgZW11bGF0aW9uCiAgMDFlNzVmZWEwZDUgbWdhZzIw
MDogcmVzdG9yZSB0aGUgZGVwdGggYmFjayB0byAyNAoKZjFmODU1NWRmYjlhNzBhMiA5MGY0Nzlh
ZTUxYWZhNDVlZmFiOTdhZmRkZTkgMDFlNzVmZWEwZDVmZjM5ZDNlNTg4YzIwZWM1IAotLS0tLS0t
LS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAtLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0gCiAgICAgNDM5MjEgwrEgIDIlICAgICAtMTguMyUgICAgICAzNTg4NCAgICAgICAg
ICAgIC00LjglICAgICAgNDE4MjYgICAgICAgIHZtLXNjYWxhYmlsaXR5Lm1lZGlhbgogIDE0ODg5
MzM3ICAgICAgICAgICAtMTcuNSUgICAxMjI5MTAyOSAgICAgICAgICAgIC00LjElICAgMTQyNzg1
NzQgICAgICAgIHZtLXNjYWxhYmlsaXR5LnRocm91Z2hwdXQKIApjb21taXQgMDFlNzVmZWEwZDVm
ZjM5ZDNlNTg4YzIwZWM1MmU3YTRlNjU4OGE3NApBdXRob3I6IEZlbmcgVGFuZyA8YSBjbGFzcz0i
bW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86ZmVuZy50YW5nQGludGVsLmNvbSI+
Jmx0O2ZlbmcudGFuZ0BpbnRlbC5jb20mZ3Q7PC9hPgpEYXRlOiAgIEZyaSBBdWcgMiAxNTowOTox
OSAyMDE5ICswODAwCgogICAgbWdhZzIwMDogcmVzdG9yZSB0aGUgZGVwdGggYmFjayB0byAyNAog
ICAgCiAgICBTaWduZWQtb2ZmLWJ5OiBGZW5nIFRhbmcgPGEgY2xhc3M9Im1vei10eHQtbGluay1y
ZmMyMzk2RSIgaHJlZj0ibWFpbHRvOmZlbmcudGFuZ0BpbnRlbC5jb20iPiZsdDtmZW5nLnRhbmdA
aW50ZWwuY29tJmd0OzwvYT4KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFpbi5jCmlu
ZGV4IGE5NzczMzMuLmFjOGY2YzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAw
L21nYWcyMDBfbWFpbi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbWFp
bi5jCkBAIC0xNjIsNyArMTYyLDcgQEAgaW50IG1nYWcyMDBfZHJpdmVyX2xvYWQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykKIAlpZiAoSVNfRzIwMF9TRShtZGV2
KSAmYW1wOyZhbXA7IG1kZXYtJmd0O21jLnZyYW1fc2l6ZSAmbHQ7ICgyMDQ4KjEwMjQpKQogCQlk
ZXYtJmd0O21vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDE2OwogCWVsc2UKLQkJZGV2LSZn
dDttb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAzMjsKKwkJZGV2LSZndDttb2RlX2NvbmZp
Zy5wcmVmZXJyZWRfZGVwdGggPSAyNDsmZ3Q7ICAJZGV2LSZndDttb2RlX2NvbmZpZy5wcmVmZXJf
c2hhZG93ID0gMTsKIAogCXIgPSBtZ2FnMjAwX21vZGVzZXRfaW5pdChtZGV2KTsKClRoYW5rcywK
RmVuZwoKPC9wcmU+CiAgICAgICAgICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPgogICAgICAg
ICAgICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+CgpUaGUgZGlmZmVyZW5j
ZSBiZXR3ZWVuIG1nYWcyMDAncyBvcmlnaW5hbCBmYmRldiBzdXBwb3J0IGFuZCBnZW5lcmljCmZi
ZGV2IGVtdWxhdGlvbiBpcyBnZW5lcmljIGZiZGV2J3Mgd29ya2VyIHRhc2sgdGhhdCB1cGRhdGVz
IHRoZSBWUkFNCmJ1ZmZlciBmcm9tIHRoZSBzaGFkb3cgYnVmZmVyLiBtZ2FnMjAwIGRvZXMgdGhp
cyBpbW1lZGlhdGVseSwgYnV0IHJlbGllcwpvbiBkcm1fY2FuX3NsZWVwKCksIHdoaWNoIGlzIGRl
cHJlY2F0ZWQuCgpJIHRoaW5rIHRoYXQgdGhlIHdvcmtlciB0YXNrIGludGVyZmVyZXMgd2l0aCB0
aGUgdGVzdCBjYXNlLCBhcyB0aGUKd29ya2VyIGhhcyBiZWVuIGluIGZiZGV2IGVtdWxhdGlvbiBz
aW5jZSBmb3JldmVyIGFuZCBubyBwZXJmb3JtYW5jZQpyZWdyZXNzaW9ucyBoYXZlIGJlZW4gcmVw
b3J0ZWQgc28gZmFyLgoKClNvIHVubGVzcyB0aGVyZSdzIGEgcmVwb3J0IHdoZXJlIHRoaXMgcHJv
YmxlbSBoYXBwZW5zIGluIGEgcmVhbC13b3JsZAp1c2UgY2FzZSwgSSdkIGxpa2UgdG8ga2VlcCBj
b2RlIGFzIGl0IGlzLiBBbmQgYXBwYXJlbnRseSB0aGVyZSdzIGFsd2F5cwp0aGUgd29ya2Fyb3Vu
ZCBvZiBkaXNhYmxpbmcgdGhlIGN1cnNvciBibGlua2luZy4KCkJlc3QgcmVnYXJkcwpUaG9tYXMK
CjwvcHJlPgogICAgICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgICAgICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgotLSAKVGhvbWFz
IFppbW1lcm1hbm4KR3JhcGhpY3MgRHJpdmVyIERldmVsb3BlcgpTVVNFIExpbnV4IEdtYkgsIE1h
eGZlbGRzdHJhc3NlIDUsIDkwNDA5IE51ZXJuYmVyZywgR2VybWFueQpHRjogRmVsaXggSW1lbmTD
tnJmZmVyLCBNYXJ5IEhpZ2dpbnMsIFNyaSBSYXNpYWgKSFJCIDIxMjg0IChBRyBOw7xybmJlcmcp
Cgo8L3ByZT4KICAgICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1
b3RlLXByZSIgd3JhcD0iIj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CjxhIGNsYXNzPSJtb3otdHh0LWxpbmst
YWJicmV2aWF0ZWQiIGhyZWY9Im1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Ij5kcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPgo8YSBjbGFzcz0ibW96LXR4dC1s
aW5rLWZyZWV0ZXh0IiBocmVmPSJodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbCI+aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw8L2E+Cgo8L3ByZT4KICAgICAgPC9ibG9ja3F1b3RlPgogICAg
ICA8cHJlIGNsYXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPgo8L3ByZT4KICAgIDwvYmxvY2tx
dW90ZT4KICAgIDxicj4KICA8L2JvZHk+CjwvaHRtbD4K

--===============4200780377139037483==--

