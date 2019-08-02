Content-Type: multipart/mixed; boundary="===============4074161228722250373=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Fri, 02 Aug 2019 10:17:02 +0200
Message-ID: <09483a64-1065-5643-ed02-03595568c26d@suse.de>
In-Reply-To: <bf871753-a193-ea0e-dfd6-55f3e6a4a9b8@daenzer.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4074161228722250373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.08.19 um 15:30 schrieb Michel D=C3=A4nzer:
> On 2019-08-01 8:19 a.m., Rong Chen wrote:
>> Hi,
>>
>> On 7/31/19 6:21 PM, Michel D=C3=A4nzer wrote:
>>> On 2019-07-31 11:25 a.m., Huang, Ying wrote:
>>>> Hi, Daniel,
>>>>
>>>> Daniel Vetter <daniel@ffwll.ch> writes:
>>>>
>>>>> On Tue, Jul 30, 2019 at 10:27 PM Dave Airlie <airlied@gmail.com> wr=
ote:
>>>>>> On Wed, 31 Jul 2019 at 05:00, Daniel Vetter <daniel@ffwll.ch> wrot=
e:
>>>>>>> On Tue, Jul 30, 2019 at 8:50 PM Thomas Zimmermann
>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>> Hi
>>>>>>>>
>>>>>>>> Am 30.07.19 um 20:12 schrieb Daniel Vetter:
>>>>>>>>> On Tue, Jul 30, 2019 at 7:50 PM Thomas Zimmermann
>>>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>>>> Am 29.07.19 um 11:51 schrieb kernel test robot:
>>>>>>>>>>> Greeting,
>>>>>>>>>>>
>>>>>>>>>>> FYI, we noticed a -18.8% regression of vm-scalability.median
>>>>>>>>>>> due to commit:>
>>>>>>>>>>>
>>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4
>>>>>>>>>>> ("drm/mgag200: Replace struct mga_fbdev with generic
>>>>>>>>>>> framebuffer emulation")
>>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/l=
inux-next.git
>>>>>>>>>>> master
>>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>>
>>>>>>>>>> I expected some change in display performance, but not in VM.
>>>>>>>>>> Since it's
>>>>>>>>>> a server chipset, probably no one cares much about display
>>>>>>>>>> performance.
>>>>>>>>>> So that seemed like a good trade-off for re-using shared code.
>>>>>>>>>>
>>>>>>>>>> Part of the patch set is that the generic fb emulation now maps
>>>>>>>>>> and
>>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's
>>>>>>>>>> the cause
>>>>>>>>>> of the performance regression. And it should be visible with oth=
er
>>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>>> For fbcon we should need to do any maps/unamps at all, this is
>>>>>>>>> for the
>>>>>>>>> fbdev mmap support only. If the testcase mentioned here tests fbd=
ev
>>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you
>>>>>>>>> don't
>>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to
>>>>>>>> get the
>>>>>>>> fbdev BO out if it's not being displayed. If not being mapped, it
>>>>>>>> can be
>>>>>>>> evicted and make room for X, etc.
>>>>>>>>
>>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow
>>>>>>>> FB. [1]
>>>>>>>> That fbdev mapping is established on each screen update, more or
>>>>>>>> less.
>>>>>>>> =C2=A0From my (yet unverified) understanding, this causes the perf=
ormance
>>>>>>>> regression in the VM code.
>>>>>>>>
>>>>>>>> The original code in mgag200 used to kmap the fbdev BO while it's
>>>>>>>> being
>>>>>>>> displayed; [2] and the drawing code only mapped it when necessary
>>>>>>>> (i.e.,
>>>>>>>> not being display). [3]
>>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed shou=
ld
>>>>>>> cache this.
>>>>>>>
>>>>>>>> I think this could be added for VRAM helpers as well, but it's
>>>>>>>> still a
>>>>>>>> workaround and non-VRAM drivers might also run into such a
>>>>>>>> performance
>>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>>
>>>>>>>> Noralf mentioned that there are plans for other DRM clients
>>>>>>>> besides the
>>>>>>>> console. They would as well run into similar problems.
>>>>>>>>
>>>>>>>>>> The thing is that we'd need another generic fbdev emulation for
>>>>>>>>>> ast and
>>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>>> Yeah I dont think we want to jump the gun here.=C2=A0 If you can =
try to
>>>>>>>>> repro locally and profile where we're wasting cpu time I hope that
>>>>>>>>> should sched a light what's going wrong here.
>>>>>>>> I don't have much time ATM and I'm not even officially at work unt=
il
>>>>>>>> late Aug. I'd send you the revert and investigate later. I agree
>>>>>>>> that
>>>>>>>> using generic fbdev emulation would be preferable.
>>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>>> regression, but vm testcases shouldn run a single line of fbcon or
>>>>>>> drm
>>>>>>> code. So why this is impacted so heavily by a silly drm change is
>>>>>>> very
>>>>>>> confusing to me. We might be papering over a deeper and much more
>>>>>>> serious issue ...
>>>>>> It's a regression, the right thing is to revert first and then work
>>>>>> out the right thing to do.
>>>>> Sure, but I have no idea whether the testcase is doing something
>>>>> reasonable. If it's accidentally testing vm scalability of fbdev and
>>>>> there's no one else doing something this pointless, then it's not a
>>>>> real bug. Plus I think we're shooting the messenger here.
>>>>>
>>>>>> It's likely the test runs on the console and printfs stuff out
>>>>>> while running.
>>>>> But why did we not regress the world if a few prints on the console
>>>>> have such a huge impact? We didn't get an entire stream of mails about
>>>>> breaking stuff ...
>>>> The regression seems not related to the commit.=C2=A0 But we have rete=
sted
>>>> and confirmed the regression.=C2=A0 Hard to understand what happens.
>>> Does the regressed test cause any output on console while it's
>>> measuring? If so, it's probably accidentally measuring fbcon/DRM code in
>>> addition to the workload it's trying to measure.
>>>
>>
>> Sorry, I'm not familiar with DRM, we enabled the console to output logs,
>> and attached please find the log file.
>>
>> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
>> console=3DttyS0,115200 vga=3Dnormal rw"
> =

> I assume the
> =

> user  :notice: [  xxx.xxxx] xxxxxxxxx bytes / xxxxxxx usecs =3D xxxxx KB/s
> =

> lines are generated by the test?
> =

> If so, unless the test is intended to measure console performance, it
> should be fixed not to generate output to console (while it's measuring).

Yes, the test prints quite a lot of text to the console. It shouldn't do
that.

Best regards
Thomas

> =

> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============4074161228722250373==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxRDhZSUFDZ2tRYUEzQkhWTUwKZWlPYmNnZjlIUDA5TlB3bGNi
ZCtPSkFtMlVoTHUyWDFMMXFDTkxOK2ZaYWJRT0FyN09Wc1NHdVNzKzNKMzI0bQpiZEVkc1VGOHpu
a1d4S21JOGtYNHZ5eFQ1enFVOVg5czFYakR2YXcyMXM4T2hDTy9CaHBGb2o5dkU4L2M1SHQyCnIy
a0puOWlGeS9YU3h0V2lVMDFLOUJyVDlNcXFrMU94MGJSWkExbGdhM2pCOUNlemRPWDMxSTBIcWFE
WlRrWmIKQ2ZHRmh0QTJ3eFhPeGtPUkp4c0h3by9KSzNRdmsvaHFkeEpUK2ZlNGpUd0RtMWRNdE5m
WTVYYitjWU5BSFpjcQplcDZXY21DSHdxSWh1aTNFd0p3RXRuNGxQbmJjMDMvbmVZZG1MeHNJQlZh
R01aMHIrNjVDd2hJVVlzOFVsSDNyCkNvK0d1V3huUlBuSmFzeXdPNkxOWGpweDQ3V2NyUT09Cj02
VFRkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4074161228722250373==--

