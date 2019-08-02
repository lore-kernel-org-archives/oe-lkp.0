Content-Type: multipart/mixed; boundary="===============8188170831068635745=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Fri, 02 Aug 2019 11:20:14 +0200
Message-ID: <5a27b946-a1b1-fa97-c02d-cbccff53ac6a@suse.de>
In-Reply-To: <95c677b9-bdf7-28e1-b196-9d9dcac63bb3@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8188170831068635745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.08.19 um 09:11 schrieb Rong Chen:
> Hi,
> =

> On 8/1/19 7:58 PM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 01.08.19 um 13:25 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Thu, Aug 01, 2019 at 11:59:28AM +0200, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 01.08.19 um 10:37 schrieb Feng Tang:
>>>>> On Thu, Aug 01, 2019 at 02:19:53PM +0800, Rong Chen wrote:
>>>>>>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4
>>>>>>>>>>>>>>> ("drm/mgag200: Replace struct mga_fbdev with generic
>>>>>>>>>>>>>>> framebuffer emulation")
>>>>>>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/ne=
xt/linux-next.git
>>>>>>>>>>>>>>> master
>>>>>>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I expected some change in display performance, but not in
>>>>>>>>>>>>>> VM. Since it's
>>>>>>>>>>>>>> a server chipset, probably no one cares much about display
>>>>>>>>>>>>>> performance.
>>>>>>>>>>>>>> So that seemed like a good trade-off for re-using shared
>>>>>>>>>>>>>> code.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Part of the patch set is that the generic fb emulation now
>>>>>>>>>>>>>> maps and
>>>>>>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess
>>>>>>>>>>>>>> that's the cause
>>>>>>>>>>>>>> of the performance regression. And it should be visible
>>>>>>>>>>>>>> with other
>>>>>>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>>>>>>> For fbcon we should need to do any maps/unamps at all, this
>>>>>>>>>>>>> is for the
>>>>>>>>>>>>> fbdev mmap support only. If the testcase mentioned here
>>>>>>>>>>>>> tests fbdev
>>>>>>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as
>>>>>>>>>>>>> you don't
>>>>>>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have
>>>>>>>>>>>> to get the
>>>>>>>>>>>> fbdev BO out if it's not being displayed. If not being
>>>>>>>>>>>> mapped, it can be
>>>>>>>>>>>> evicted and make room for X, etc.
>>>>>>>>>>>>
>>>>>>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>>>>>>> drm_fb_helper_dirty_work() before being updated from the
>>>>>>>>>>>> shadow FB. [1]
>>>>>>>>>>>> That fbdev mapping is established on each screen update,
>>>>>>>>>>>> more or less.
>>>>>>>>>>>> =C2=A0From my (yet unverified) understanding, this causes the
>>>>>>>>>>>> performance
>>>>>>>>>>>> regression in the VM code.
>>>>>>>>>>>>
>>>>>>>>>>>> The original code in mgag200 used to kmap the fbdev BO while
>>>>>>>>>>>> it's being
>>>>>>>>>>>> displayed; [2] and the drawing code only mapped it when
>>>>>>>>>>>> necessary (i.e.,
>>>>>>>>>>>> not being display). [3]
>>>>>>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We
>>>>>>>>>>> indeed should
>>>>>>>>>>> cache this.
>>>>>>>>>>>
>>>>>>>>>>>> I think this could be added for VRAM helpers as well, but
>>>>>>>>>>>> it's still a
>>>>>>>>>>>> workaround and non-VRAM drivers might also run into such a
>>>>>>>>>>>> performance
>>>>>>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>>>>>>
>>>>>>>>>>>> Noralf mentioned that there are plans for other DRM clients
>>>>>>>>>>>> besides the
>>>>>>>>>>>> console. They would as well run into similar problems.
>>>>>>>>>>>>
>>>>>>>>>>>>>> The thing is that we'd need another generic fbdev
>>>>>>>>>>>>>> emulation for ast and
>>>>>>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>>>>>>> Yeah I dont think we want to jump the gun here.=C2=A0 If you =
can
>>>>>>>>>>>>> try to
>>>>>>>>>>>>> repro locally and profile where we're wasting cpu time I
>>>>>>>>>>>>> hope that
>>>>>>>>>>>>> should sched a light what's going wrong here.
>>>>>>>>>>>> I don't have much time ATM and I'm not even officially at
>>>>>>>>>>>> work until
>>>>>>>>>>>> late Aug. I'd send you the revert and investigate later. I
>>>>>>>>>>>> agree that
>>>>>>>>>>>> using generic fbdev emulation would be preferable.
>>>>>>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>>>>>>> regression, but vm testcases shouldn run a single line of
>>>>>>>>>>> fbcon or drm
>>>>>>>>>>> code. So why this is impacted so heavily by a silly drm
>>>>>>>>>>> change is very
>>>>>>>>>>> confusing to me. We might be papering over a deeper and much
>>>>>>>>>>> more
>>>>>>>>>>> serious issue ...
>>>>>>>>>> It's a regression, the right thing is to revert first and then
>>>>>>>>>> work
>>>>>>>>>> out the right thing to do.
>>>>>>>>> Sure, but I have no idea whether the testcase is doing something
>>>>>>>>> reasonable. If it's accidentally testing vm scalability of
>>>>>>>>> fbdev and
>>>>>>>>> there's no one else doing something this pointless, then it's
>>>>>>>>> not a
>>>>>>>>> real bug. Plus I think we're shooting the messenger here.
>>>>>>>>>
>>>>>>>>>> It's likely the test runs on the console and printfs stuff out
>>>>>>>>>> while running.
>>>>>>>>> But why did we not regress the world if a few prints on the
>>>>>>>>> console
>>>>>>>>> have such a huge impact? We didn't get an entire stream of
>>>>>>>>> mails about
>>>>>>>>> breaking stuff ...
>>>>>>>> The regression seems not related to the commit.=C2=A0 But we have
>>>>>>>> retested
>>>>>>>> and confirmed the regression.=C2=A0 Hard to understand what happen=
s.
>>>>>>> Does the regressed test cause any output on console while it's
>>>>>>> measuring? If so, it's probably accidentally measuring fbcon/DRM
>>>>>>> code in
>>>>>>> addition to the workload it's trying to measure.
>>>>>>>
>>>>>> Sorry, I'm not familiar with DRM, we enabled the console to output
>>>>>> logs, and
>>>>>> attached please find the log file.
>>>>>>
>>>>>> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
>>>>>> console=3DttyS0,115200 vga=3Dnormal rw"
>>>>> We did more check, and found this test machine does use the
>>>>> mgag200 driver.
>>>>>
>>>>> And we are suspecting the regression is caused by
>>>>>
>>>>> commit cf1ca9aeb930df074bb5bbcde55f935fec04e529
>>>>> Author: Thomas Zimmermann <tzimmermann@suse.de>
>>>>> Date:=C2=A0=C2=A0 Wed Jul 3 09:58:24 2019 +0200
>>>> Yes, that's the commit. Unfortunately reverting it would require
>>>> reverting a hand full of other patches as well.
>>>>
>>>> I have a potential fix for the problem. Could you run and verify
>>>> that it
>>>> resolves the problem?
>>> Sure, please send it to us. Rong and I will try it.
>> Fantastic, thank you! The patch set is available on dri-devel at
>>
>> =C2=A0=C2=A0
>> https://lists.freedesktop.org/archives/dri-devel/2019-August/228950.html
> =

> The patch set improves the performance slightly, but the change is not
> very obvious.
> =

> $ git log --oneline 8f7ec6bcc7 -5
> 8f7ec6bcc75a9 drm/mgag200: Map fbdev framebuffer while it's being display=
ed
> abcb1cf24033a drm/ast: Map fbdev framebuffer while it's being displayed
> a92f80044c623 drm/vram-helpers: Add kmap ref-counting to GEM VRAM objects
> 90f479ae51afa drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> f1f8555dfb9a7 drm/bochs: Use shadow buffer for bochs framebuffer console
> =

> commit:
> =C2=A0 f1f8555dfb ("drm/bochs: Use shadow buffer for bochs framebuffer co=
nsole")
> =C2=A0 90f479ae51 ("drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation")
> =C2=A0 8f7ec6bcc7 ("drm/mgag200: Map fbdev framebuffer while it's being
> displayed")
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde 8f7ec6bcc75a996f5c6b39a=
9cf=C2=A0
> testcase/testparams/testbox
> ----------------=C2=A0 -------------------------- -----------------------=
---=C2=A0
> ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
> =C2=A0=C2=A0=C2=A0=C2=A0 43921=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
36629
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 43921=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -18%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35884=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
36629=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> GEO-MEAN vm-scalability.median

Thank you for testing.

There's another thing I'd like to ask: could you run the test without
console output on drm-tip (i.e., disable it or pipe it into /dev/null)?
I'd like to see how that impacts performance.

Best regards
Thomas

> Best Regards,
> Rong Chen
> =

>>
>> Best regards
>> Thomas
>>
>>> Thanks,
>>> Feng
>>>
>>>
>>>> Best regards
>>>> Thomas
>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 drm/fb-helper: Map DRM client buffer only wh=
en required
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This patch changes =
DRM clients to not map the buffer by
>>>>> default. The
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 buffer, like any buffer object, should be ma=
pped and unmapped
>>>>> when
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 needed.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 An unmapped buffer =
object can be evicted to system memory
>>>>> and does
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 not consume video ram until displayed. This =
allows to use
>>>>> generic fbdev
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 emulation with drivers for low-memory device=
s, such as ast and
>>>>> mgag200.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 This change affects=
 the generic framebuffer console.
>>>>> HW-based consoles
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 map their console buffer once and keep it ma=
pped. Userspace
>>>>> can mmap this
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 buffer into its address space. The shadow-bu=
ffered framebuffer
>>>>> console
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 only needs the buffer object to be mapped du=
ring updates.
>>>>> While not being
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 updated from the shadow buffer, the buffer o=
bject can remain
>>>>> unmapped.
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 Userspace will always mmap the shadow buffer.
>>>>> =C2=A0 which may add more load when fbcon is busy printing out messag=
es.
>>>>>
>>>>> We are doing more test inside 0day to confirm.
>>>>>
>>>>> Thanks,
>>>>> Feng
>>>>> _______________________________________________
>>>>> dri-devel mailing list
>>>>> dri-devel(a)lists.freedesktop.org
>>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>>
>>>> --=C2=A0
>>>> Thomas Zimmermann
>>>> Graphics Driver Developer
>>>> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
>>>> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
>>>> HRB 21284 (AG N=C3=BCrnberg)
>>>>
>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel(a)lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>
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


--===============8188170831068635745==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxRUFFNEFDZ2tRYUEzQkhWTUwKZWlPQ3BnZitNNmo0ZlF6Um11
WUt6U0Q0MGZjeVY4OEYxS1VDVGdINGJyRzJwRFQ0a2pzY005T2ZkNm01dklZNwpZVUh5Mjk3YStm
cUs4VGpDUGFrUnNLK0hMQWJydnZUM2RVV1NpdUNDaFdtVUcwZzlxRlo2c0ordWJDd1lBa0ZDCkxL
dWducW8rVk9IdEJHQ2U3MlBFaWRlay91MHZKWTNuWHJ3SFZCTitzUFdZSDRFUWhDaWRpVE80eFkw
cUdZOE8Kcm5kNm9TZjJnUUFPbW1yL3JXUkJXbEtyWitNcWtzN3pqRDQrUFZGd21yTWt4dzlOVjVE
WDRPUnBqYmFmR1NOQQpmTXVvY3lrZlBWZXJaVW0rTGtyS1BwbUt2dHNsWmNZZzZDbkV0UHlRanlR
aUxqMkdrTGJzUFdYdmlTQ01QdS82Ckx2WEJkZ2QxVVpWanlmeVlnbWQySjBpdnFhV3Mzdz09Cj1v
QXArCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============8188170831068635745==--

