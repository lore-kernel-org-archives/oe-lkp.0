Content-Type: multipart/mixed; boundary="===============0308128162700008500=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Thu, 01 Aug 2019 11:57:12 +0200
Message-ID: <c3253583-9441-8d95-c39b-990e73643b6c@suse.de>
In-Reply-To: <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0308128162700008500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 01.08.19 um 08:19 schrieb Rong Chen:
> Hi,
> =

> On 7/31/19 6:21 PM, Michel D=C3=A4nzer wrote:
>> On 2019-07-31 11:25 a.m., Huang, Ying wrote:
>>> Hi, Daniel,
>>>
>>> Daniel Vetter <daniel@ffwll.ch> writes:
>>>
>>>> On Tue, Jul 30, 2019 at 10:27 PM Dave Airlie <airlied@gmail.com> wro=
te:
>>>>> On Wed, 31 Jul 2019 at 05:00, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>> On Tue, Jul 30, 2019 at 8:50 PM Thomas Zimmermann
>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>> Hi
>>>>>>>
>>>>>>> Am 30.07.19 um 20:12 schrieb Daniel Vetter:
>>>>>>>> On Tue, Jul 30, 2019 at 7:50 PM Thomas Zimmermann
>>>>>>>> <tzimmermann@suse.de> wrote:
>>>>>>>>> Am 29.07.19 um 11:51 schrieb kernel test robot:
>>>>>>>>>> Greeting,
>>>>>>>>>>
>>>>>>>>>> FYI, we noticed a -18.8% regression of vm-scalability.median
>>>>>>>>>> due to commit:>
>>>>>>>>>>
>>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4
>>>>>>>>>> ("drm/mgag200: Replace struct mga_fbdev with generic
>>>>>>>>>> framebuffer emulation")
>>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/li=
nux-next.git
>>>>>>>>>> master
>>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>>
>>>>>>>>> I expected some change in display performance, but not in VM.
>>>>>>>>> Since it's
>>>>>>>>> a server chipset, probably no one cares much about display
>>>>>>>>> performance.
>>>>>>>>> So that seemed like a good trade-off for re-using shared code.
>>>>>>>>>
>>>>>>>>> Part of the patch set is that the generic fb emulation now maps
>>>>>>>>> and
>>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's
>>>>>>>>> the cause
>>>>>>>>> of the performance regression. And it should be visible with other
>>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>> For fbcon we should need to do any maps/unamps at all, this is
>>>>>>>> for the
>>>>>>>> fbdev mmap support only. If the testcase mentioned here tests fbdev
>>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you
>>>>>>>> don't
>>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to
>>>>>>> get the
>>>>>>> fbdev BO out if it's not being displayed. If not being mapped, it
>>>>>>> can be
>>>>>>> evicted and make room for X, etc.
>>>>>>>
>>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow
>>>>>>> FB. [1]
>>>>>>> That fbdev mapping is established on each screen update, more or
>>>>>>> less.
>>>>>>> =C2=A0From my (yet unverified) understanding, this causes the perfo=
rmance
>>>>>>> regression in the VM code.
>>>>>>>
>>>>>>> The original code in mgag200 used to kmap the fbdev BO while it's
>>>>>>> being
>>>>>>> displayed; [2] and the drawing code only mapped it when necessary
>>>>>>> (i.e.,
>>>>>>> not being display). [3]
>>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed should
>>>>>> cache this.
>>>>>>
>>>>>>> I think this could be added for VRAM helpers as well, but it's
>>>>>>> still a
>>>>>>> workaround and non-VRAM drivers might also run into such a
>>>>>>> performance
>>>>>>> regression if they use the fbdev's shadow fb.
>>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>>
>>>>>>> Noralf mentioned that there are plans for other DRM clients
>>>>>>> besides the
>>>>>>> console. They would as well run into similar problems.
>>>>>>>
>>>>>>>>> The thing is that we'd need another generic fbdev emulation for
>>>>>>>>> ast and
>>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>> Yeah I dont think we want to jump the gun here.=C2=A0 If you can t=
ry to
>>>>>>>> repro locally and profile where we're wasting cpu time I hope that
>>>>>>>> should sched a light what's going wrong here.
>>>>>>> I don't have much time ATM and I'm not even officially at work until
>>>>>>> late Aug. I'd send you the revert and investigate later. I agree
>>>>>>> that
>>>>>>> using generic fbdev emulation would be preferable.
>>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>>> regression, but vm testcases shouldn run a single line of fbcon or
>>>>>> drm
>>>>>> code. So why this is impacted so heavily by a silly drm change is
>>>>>> very
>>>>>> confusing to me. We might be papering over a deeper and much more
>>>>>> serious issue ...
>>>>> It's a regression, the right thing is to revert first and then work
>>>>> out the right thing to do.
>>>> Sure, but I have no idea whether the testcase is doing something
>>>> reasonable. If it's accidentally testing vm scalability of fbdev and
>>>> there's no one else doing something this pointless, then it's not a
>>>> real bug. Plus I think we're shooting the messenger here.
>>>>
>>>>> It's likely the test runs on the console and printfs stuff out
>>>>> while running.
>>>> But why did we not regress the world if a few prints on the console
>>>> have such a huge impact? We didn't get an entire stream of mails about
>>>> breaking stuff ...
>>> The regression seems not related to the commit.=C2=A0 But we have retes=
ted
>>> and confirmed the regression.=C2=A0 Hard to understand what happens.
>> Does the regressed test cause any output on console while it's
>> measuring? If so, it's probably accidentally measuring fbcon/DRM code in
>> addition to the workload it's trying to measure.
>>
> =

> Sorry, I'm not familiar with DRM, we enabled the console to output logs,
> and attached please find the log file.

I have a patch set for fixing this problem. But I cannot reproduce the
issue locally, because my machine is not for testing scalability.

If I send you the patches, could you run them on the machine to test
whether they solve the problem?

Best regards
Thomas

> =

> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw"
> =

> Best Regards,
> Rong Chen
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


--===============0308128162700008500==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxQ3Qzd0FDZ2tRYUEzQkhWTUwKZWlQWU9BZitJSmVGdEF6N2N4
MTJoa05rVDB2b1hUQTltbmx0NitXdE1keHdpRXQ5cTZYam1sSXRnbVdSNW5lKwpGUWtCbmQ5RHZR
QUx5dlQweFNtNUVLSm5LNHJQS0lNT0JLVXVZOFNsT1dBSDR2alpWNUwxVkhqY0J5SC92dlMyClEz
TXJlMTlWaEpmYzEvaXJwU2h1TUFkbzI0cVFDaEFFdWhZdEoxTk90UjNweUVuQ0VEbFNMeHgxNG5q
dnUzN3YKdkFvTXNVeG9SYWFQakcyM3B3TmdzeGVIVXpNdDY5TzB4bTJBZk9NckFVWmZDRUdsTnVX
TllyQm9PTVdmMVNWbwp2OUFNdFpGVVJSVVFVaERtM1hBUHlQMHhRa1lFOXFiMjZxMy9wUmlnWlcz
VmV2NFdqZU15dU4rY0hJc2JONE1BCkUxeGJ2TzhLbFYwWUdTbTdUOEVGMUQ5OTRCRVVhUT09Cj00
S2Q5Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============0308128162700008500==--

