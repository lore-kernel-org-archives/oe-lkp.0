Content-Type: multipart/mixed; boundary="===============7891774863018105555=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Fri, 02 Aug 2019 11:26:58 +0200
Message-ID: <4dcd878d-9b47-25b4-92a6-1aef42524be1@suse.de>
In-Reply-To: <20190802091150.GK7444@phenom.ffwll.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============7891774863018105555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 02.08.19 um 11:11 schrieb Daniel Vetter:
> On Wed, Jul 31, 2019 at 12:10:54PM +0200, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 31.07.19 um 10:13 schrieb Daniel Vetter:
>>> On Tue, Jul 30, 2019 at 10:27 PM Dave Airlie <airlied@gmail.com> wrot=
e:
>>>>
>>>> On Wed, 31 Jul 2019 at 05:00, Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>>
>>>>> On Tue, Jul 30, 2019 at 8:50 PM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>>>>>>
>>>>>> Hi
>>>>>>
>>>>>> Am 30.07.19 um 20:12 schrieb Daniel Vetter:
>>>>>>> On Tue, Jul 30, 2019 at 7:50 PM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
>>>>>>>> Am 29.07.19 um 11:51 schrieb kernel test robot:
>>>>>>>>> Greeting,
>>>>>>>>>
>>>>>>>>> FYI, we noticed a -18.8% regression of vm-scalability.median due =
to commit:>
>>>>>>>>>
>>>>>>>>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag200: R=
eplace struct mga_fbdev with generic framebuffer emulation")
>>>>>>>>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/lin=
ux-next.git master
>>>>>>>>
>>>>>>>> Daniel, Noralf, we may have to revert this patch.
>>>>>>>>
>>>>>>>> I expected some change in display performance, but not in VM. Sinc=
e it's
>>>>>>>> a server chipset, probably no one cares much about display perform=
ance.
>>>>>>>> So that seemed like a good trade-off for re-using shared code.
>>>>>>>>
>>>>>>>> Part of the patch set is that the generic fb emulation now maps and
>>>>>>>> unmaps the fbdev BO when updating the screen. I guess that's the c=
ause
>>>>>>>> of the performance regression. And it should be visible with other
>>>>>>>> drivers as well if they use a shadow FB for fbdev emulation.
>>>>>>>
>>>>>>> For fbcon we should need to do any maps/unamps at all, this is for =
the
>>>>>>> fbdev mmap support only. If the testcase mentioned here tests fbdev
>>>>>>> mmap handling it's pretty badly misnamed :-) And as long as you don=
't
>>>>>>> have an fbdev mmap there shouldn't be any impact at all.
>>>>>>
>>>>>> The ast and mgag200 have only a few MiB of VRAM, so we have to get t=
he
>>>>>> fbdev BO out if it's not being displayed. If not being mapped, it ca=
n be
>>>>>> evicted and make room for X, etc.
>>>>>>
>>>>>> To make this work, the BO's memory is mapped and unmapped in
>>>>>> drm_fb_helper_dirty_work() before being updated from the shadow FB. =
[1]
>>>>>> That fbdev mapping is established on each screen update, more or les=
s.
>>>>>> From my (yet unverified) understanding, this causes the performance
>>>>>> regression in the VM code.
>>>>>>
>>>>>> The original code in mgag200 used to kmap the fbdev BO while it's be=
ing
>>>>>> displayed; [2] and the drawing code only mapped it when necessary (i=
.e.,
>>>>>> not being display). [3]
>>>>>
>>>>> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed should
>>>>> cache this.
>>>>>
>>>>>> I think this could be added for VRAM helpers as well, but it's still=
 a
>>>>>> workaround and non-VRAM drivers might also run into such a performan=
ce
>>>>>> regression if they use the fbdev's shadow fb.
>>>>>
>>>>> Yeah agreed, fbdev emulation should try to cache the vmap.
>>>>>
>>>>>> Noralf mentioned that there are plans for other DRM clients besides =
the
>>>>>> console. They would as well run into similar problems.
>>>>>>
>>>>>>>> The thing is that we'd need another generic fbdev emulation for as=
t and
>>>>>>>> mgag200 that handles this issue properly.
>>>>>>>
>>>>>>> Yeah I dont think we want to jump the gun here.  If you can try to
>>>>>>> repro locally and profile where we're wasting cpu time I hope that
>>>>>>> should sched a light what's going wrong here.
>>>>>>
>>>>>> I don't have much time ATM and I'm not even officially at work until
>>>>>> late Aug. I'd send you the revert and investigate later. I agree that
>>>>>> using generic fbdev emulation would be preferable.
>>>>>
>>>>> Still not sure that's the right thing to do really. Yes it's a
>>>>> regression, but vm testcases shouldn run a single line of fbcon or drm
>>>>> code. So why this is impacted so heavily by a silly drm change is very
>>>>> confusing to me. We might be papering over a deeper and much more
>>>>> serious issue ...
>>>>
>>>> It's a regression, the right thing is to revert first and then work
>>>> out the right thing to do.
>>>
>>> Sure, but I have no idea whether the testcase is doing something
>>> reasonable. If it's accidentally testing vm scalability of fbdev and
>>> there's no one else doing something this pointless, then it's not a
>>> real bug. Plus I think we're shooting the messenger here.
>>>
>>>> It's likely the test runs on the console and printfs stuff out while r=
unning.
>>>
>>> But why did we not regress the world if a few prints on the console
>>> have such a huge impact? We didn't get an entire stream of mails about
>>> breaking stuff ...
>>
>> The vmap/vunmap pair is only executed for fbdev emulation with a shadow
>> FB. And most of those are with shmem helpers, which ref-count the vmap
>> calls internally. My guess is that VRAM helpers are currently the only
>> BOs triggering this problem.
> =

> I meant that surely this vm-scalability testcase isn't the only thing
> that's being run by 0day on a machine with mga200g. If a few printks to
> dmesg/console cause such a huge regression, I'd expect everything to
> regress on that box. But seems to not be the case.

True. And according to Rong Chen's feedback, vmap and vunmap have only a
small impact. The other difference is that there's now a shadow FB for
the the console; including the dirty worker with an additional memcpy.
mgag200 used to update the console directly in VRAM.

I'd expect to see every driver with shadow-FB console to show bad
performance, but that doesn't seem to be the case either.

Best regards
Thomas

> -Daniel
> =

>>
>> Best regards
>> Thomas
>>
>>> -Daniel
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

> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============7891774863018105555==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxRUFlSUFDZ2tRYUEzQkhWTUwKZWlNKzFBZi9aQ1pXU1AzWWRv
VnNWT3VWY3FKR2JKb0NQYUVRa0FYWm9XWDdxbjFvUUpOLzRRRkJXVmtFbVZXaQpwd09Ic1dkWFB0
cFpvaTVPcXljNEVSWFJOeDloN2ZXQ281MW1xclZjZE9rTWtXeC9tdVdRY3hVSXYwSG1WNWt3ClJj
UmhkRGJGWmhteHZ5UW16ZE9LVnd6QzQyYU0weXFNdWJOa25xbTQwVlR5NEs0S3dtUGRmeGZqZnl6
NmJFR0QKUm0rNUx6bjFvTG1NbkwwOEQ0Q2ZpS0RUbGM4dFFJR05WbGpEV21QcEFSMUd5b0hwVFo2
Q0lmSlM0K3JpZjJXNgpyeW1Qa255R2tXZmRsSE5oL0V5QTdVNEk2L0RBcTI1b3crcnRhbHA0dWl3
S2RYZHd6Wmt0M0hsKzgwMEpJc1UrCnMzRDE2MVR5SXREZmVjelBYSFpneTFoUUV3UkVwQT09Cj1E
Yzg4Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7891774863018105555==--

