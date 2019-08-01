Content-Type: multipart/mixed; boundary="===============0820788753770630951=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Thu, 01 Aug 2019 13:58:38 +0200
Message-ID: <afd7d401-143c-b121-740c-9a50d34bbd29@suse.de>
In-Reply-To: <20190801112535.GA70068@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0820788753770630951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.08.19 um 13:25 schrieb Feng Tang:
> Hi Thomas,
> =

> On Thu, Aug 01, 2019 at 11:59:28AM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 01.08.19 um 10:37 schrieb Feng Tang:
>>> On Thu, Aug 01, 2019 at 02:19:53PM +0800, Rong Chen wrote:
>>>>>>>>>>>>>
>>>>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag20=
0: Replace struct mga_fbdev with generic framebuffer emulation")
>>>>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next=
/linux-next.git master
>>>>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>>>>
>>>>>>>>>>>> I expected some change in display performance, but not in VM. =
Since it's
>>>>>>>>>>>> a server chipset, probably no one cares much about display per=
formance.
>>>>>>>>>>>> So that seemed like a good trade-off for re-using shared code.
>>>>>>>>>>>>
>>>>>>>>>>>> Part of the patch set is that the generic fb emulation now map=
s and
>>>>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's t=
he cause
>>>>>>>>>>>> of the performance regression. And it should be visible with o=
ther
>>>>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>>>>> For fbcon we should need to do any maps/unamps at all, this is =
for the
>>>>>>>>>>> fbdev mmap support only. If the testcase mentioned here tests f=
bdev
>>>>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you=
 don't
>>>>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to g=
et the
>>>>>>>>>> fbdev BO out if it's not being displayed. If not being mapped, i=
t can be
>>>>>>>>>> evicted and make room for X, etc.
>>>>>>>>>>
>>>>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow =
FB. [1]
>>>>>>>>>> That fbdev mapping is established on each screen update, more or=
 less.
>>>>>>>>>> From my (yet unverified) understanding, this causes the performa=
nce
>>>>>>>>>> regression in the VM code.
>>>>>>>>>>
>>>>>>>>>> The original code in mgag200 used to kmap the fbdev BO while it'=
s being
>>>>>>>>>> displayed; [2] and the drawing code only mapped it when necessar=
y (i.e.,
>>>>>>>>>> not being display). [3]
>>>>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed sh=
ould
>>>>>>>>> cache this.
>>>>>>>>>
>>>>>>>>>> I think this could be added for VRAM helpers as well, but it's s=
till a
>>>>>>>>>> workaround and non-VRAM drivers might also run into such a perfo=
rmance
>>>>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>>>>
>>>>>>>>>> Noralf mentioned that there are plans for other DRM clients besi=
des the
>>>>>>>>>> console. They would as well run into similar problems.
>>>>>>>>>>
>>>>>>>>>>>> The thing is that we'd need another generic fbdev emulation fo=
r ast and
>>>>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>>>>> Yeah I dont think we want to jump the gun here.  If you can try=
 to
>>>>>>>>>>> repro locally and profile where we're wasting cpu time I hope t=
hat
>>>>>>>>>>> should sched a light what's going wrong here.
>>>>>>>>>> I don't have much time ATM and I'm not even officially at work u=
ntil
>>>>>>>>>> late Aug. I'd send you the revert and investigate later. I agree=
 that
>>>>>>>>>> using generic fbdev emulation would be preferable.
>>>>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>>>>> regression, but vm testcases shouldn run a single line of fbcon o=
r drm
>>>>>>>>> code. So why this is impacted so heavily by a silly drm change is=
 very
>>>>>>>>> confusing to me. We might be papering over a deeper and much more
>>>>>>>>> serious issue ...
>>>>>>>> It's a regression, the right thing is to revert first and then work
>>>>>>>> out the right thing to do.
>>>>>>> Sure, but I have no idea whether the testcase is doing something
>>>>>>> reasonable. If it's accidentally testing vm scalability of fbdev and
>>>>>>> there's no one else doing something this pointless, then it's not a
>>>>>>> real bug. Plus I think we're shooting the messenger here.
>>>>>>>
>>>>>>>> It's likely the test runs on the console and printfs stuff out whi=
le running.
>>>>>>> But why did we not regress the world if a few prints on the console
>>>>>>> have such a huge impact? We didn't get an entire stream of mails ab=
out
>>>>>>> breaking stuff ...
>>>>>> The regression seems not related to the commit.  But we have retested
>>>>>> and confirmed the regression.  Hard to understand what happens.
>>>>> Does the regressed test cause any output on console while it's
>>>>> measuring? If so, it's probably accidentally measuring fbcon/DRM code=
 in
>>>>> addition to the workload it's trying to measure.
>>>>>
>>>>
>>>> Sorry, I'm not familiar with DRM, we enabled the console to output log=
s, and
>>>> attached please find the log file.
>>>>
>>>> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
>>>> console=3DttyS0,115200 vga=3Dnormal rw"
>>>
>>> We did more check, and found this test machine does use the
>>> mgag200 driver. =

>>>
>>> And we are suspecting the regression is caused by =

>>>
>>> commit cf1ca9aeb930df074bb5bbcde55f935fec04e529
>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>> Date:   Wed Jul 3 09:58:24 2019 +0200
>>
>> Yes, that's the commit. Unfortunately reverting it would require
>> reverting a hand full of other patches as well.
>>
>> I have a potential fix for the problem. Could you run and verify that it
>> resolves the problem?
> =

> Sure, please send it to us. Rong and I will try it.

Fantastic, thank you! The patch set is available on dri-devel at

  https://lists.freedesktop.org/archives/dri-devel/2019-August/228950.html

Best regards
Thomas

> =

> Thanks,
> Feng
> =

> =

>> Best regards
>> Thomas
>>
>>>
>>>     drm/fb-helper: Map DRM client buffer only when required
>>>     =

>>>     This patch changes DRM clients to not map the buffer by default. The
>>>     buffer, like any buffer object, should be mapped and unmapped when
>>>     needed.
>>>     =

>>>     An unmapped buffer object can be evicted to system memory and does
>>>     not consume video ram until displayed. This allows to use generic f=
bdev
>>>     emulation with drivers for low-memory devices, such as ast and mgag=
200.
>>>     =

>>>     This change affects the generic framebuffer console. HW-based conso=
les
>>>     map their console buffer once and keep it mapped. Userspace can mma=
p this
>>>     buffer into its address space. The shadow-buffered framebuffer cons=
ole
>>>     only needs the buffer object to be mapped during updates. While not=
 being
>>>     updated from the shadow buffer, the buffer object can remain unmapp=
ed.
>>>     Userspace will always mmap the shadow buffer.
>>>  =

>>> which may add more load when fbcon is busy printing out messages.
>>>
>>> We are doing more test inside 0day to confirm.
>>>
>>> Thanks,
>>> Feng
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel(a)lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
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


--===============0820788753770630951==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxQzAvRUFDZ2tRYUEzQkhWTUwKZWlPcEhnZi9mV3J2ZWN2aTVt
cDFCMzJIMmhmQmtYN1kvZ0dJa1VZSytxL3llTHI5QnVEcmNiTTRoWVRkSE5DQwpubEpkdXArODZ0
ZGZZaE1Ra1lKaEpoQys3aGJoM0hISUFwaldaZGVtZG1Oc2FZbDIzN3dNWXNxOS9WZjdsem1DCjRK
czEyVXpIbHdxUFVGdmprM2Z5N0dsZHRkNzJCNnJKbDJETFoyNS81aDlyeFFuak1BdW1sN2lsUFpR
aGQvU3MKMVQ5U2NQeUNzSzZNQVlwKzdzUXNSeXZpNEl1aFkxT05JbUxKUUJTMkVYMFhzc0RiT0VW
dVBPZ1FWbDFXN0ZtNgpCUnNDV2hoeDVPR2pMYm44OFNUdThQR2ZzTUJkeU8wWStMekNudkR2UWtY
KzNoT3dsa3dVaThrZ0l5eUNSSDBKCldyZVcwWFh3VkUvLzdBNmRkMVR0c3RYZXBKOXFTQT09Cj1l
MjJ0Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0820788753770630951==--

