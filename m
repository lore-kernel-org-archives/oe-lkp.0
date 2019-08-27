Content-Type: multipart/mixed; boundary="===============6942867273364752684=="
MIME-Version: 1.0
From: Chen, Rong A <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Tue, 27 Aug 2019 20:33:24 +0800
Message-ID: <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
In-Reply-To: <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============6942867273364752684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On 8/26/2019 6:50 PM, Thomas Zimmermann wrote:
> Hi Feng
>
> Am 24.08.19 um 07:16 schrieb Feng Tang:
>> Hi Thomas,
>>
>> On Thu, Aug 22, 2019 at 07:25:11PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> I was traveling and could reply earlier. Sorry for taking so long.
>> No problem! I guessed so :)
>>
>>> Am 13.08.19 um 11:36 schrieb Feng Tang:
>>>> Hi Thomas,
>>>>
>>>> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>>>>> Hi Thomas,
>>>>>
>>>>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>>>>> Hi,
>>>>>>
>>>>>>>> Actually we run the benchmark as a background process, do
>>>>>>>> we need to disable the cursor and test again?
>>>>>>> There's a worker thread that updates the display from the
>>>>>>> shadow buffer. The blinking cursor periodically triggers
>>>>>>> the worker thread, but the actual update is just the size
>>>>>>> of one character.
>>>>>>>
>>>>>>> The point of the test without output is to see if the
>>>>>>> regression comes from the buffer update (i.e., the memcpy
>>>>>>> from shadow buffer to VRAM), or from the worker thread. If
>>>>>>>   the regression goes away after disabling the blinking
>>>>>>> cursor, then the worker thread is the problem. If it
>>>>>>> already goes away if there's simply no output from the
>>>>>>> test, the screen update is the problem. On my machine I
>>>>>>> have to disable the blinking cursor, so I think the worker
>>>>>>>   causes the performance drop.
>>>>>> We disabled redirecting stdout/stderr to /dev/kmsg,  and the
>>>>>>   regression is gone.
>>>>>>
>>>>>> commit: f1f8555dfb9 drm/bochs: Use shadow buffer for bochs
>>>>>> framebuffer console 90f479ae51a drm/mgag200: Replace struct
>>>>>> mga_fbdev with generic framebuffer emulation
>>>>>>
>>>>>> f1f8555dfb9a70a2  90f479ae51afa45efab97afdde
>>>>>> testcase/testparams/testbox ----------------
>>>>>> -------------------------- ---------------------------
>>>>>> %stddev      change         %stddev \          | \ 43785
>>>>>> 44481 vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>>>>> 43785 44481        GEO-MEAN vm-scalability.median
>>>>> Till now, from Rong's tests: 1. Disabling cursor blinking
>>>>> doesn't cure the regression. 2. Disabling printint test results
>>>>> to console can workaround the regression.
>>>>>
>>>>> Also if we set the perfer_shadown to 0, the regression is also
>>>>> gone.
>>>> We also did some further break down for the time consumed by the
>>>> new code.
>>>>
>>>> The drm_fb_helper_dirty_work() calls sequentially 1.
>>>> drm_client_buffer_vmap	  (290 us) 2.
>>>> drm_fb_helper_dirty_blit_real  (19240 us) 3.
>>>> helper->fb->funcs->dirty()    ---> NULL for mgag200 driver 4.
>>>> drm_client_buffer_vunmap       (215 us)
>>>>
>>> It's somewhat different to what I observed, but maybe I just
>>> couldn't reproduce the problem correctly.
>>>
>>>> The average run time is listed after the function names.
>>>>
>>>>  From it, we can see drm_fb_helper_dirty_blit_real() takes too
>>>> long time (about 20ms for each run). I guess this is the root
>>>> cause of this regression, as the original code doesn't use this
>>>> dirty worker.
>>> True, the original code uses a temporary buffer, but updates the
>>> display immediately.
>>>
>>> My guess is that this could be a caching problem. The worker runs
>>> on a different CPU, which doesn't have the shadow buffer in cache.
>> Yes, that's my thought too. I profiled the working set size, for most
>> of the drm_fb_helper_dirty_blit_real(), it will update a buffer
>> 4096x768(3 MB), and as it is called 30~40 times per second, it surely
>> will affect the cache.
>>
>>
>>>> As said in last email, setting the prefer_shadow to 0 can avoid
>>>> the regrssion. Could it be an option?
>>> Unfortunately not. Without the shadow buffer, the console's
>>> display buffer permanently resides in video memory. It consumes
>>> significant amount of that memory (say 8 MiB out of 16 MiB). That
>>> doesn't leave enough room for anything else.
>>>
>>> The best option is to not print to the console.
>> Do we have other options here?
> I attached two patches. Both show an improvement in my setup at least.
> Could you please test them independently from each other and report back?
>
> prefetch.patch prefetches the shadow buffer two scanlines ahead during
> the blit function. The idea is to have the scanlines in cache when they
> are supposed to go to hardware.
>
> schedule.patch schedules the dirty worker on the current CPU core (i.e.,
> the one that did the drawing to the shadow buffer). Hopefully the shadow
> buffer remains in cache meanwhile.
>
> Best regards
> Thomas

Both patches have little impact on the performance from our side.

prefetch.patch:
commit:
 =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
 =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic =

framebuffer emulation
 =C2=A0 77459f56994 prefetch shadow buffer two lines ahead of blit offset

f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde 77459f56994ab87ee5459920b=
3=C2=A0 =

testcase/testparams/testbox
----------------=C2=A0 -------------------------- -------------------------=
-=C2=A0 =

---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
 =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
35515 =

vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
 =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
35515=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

GEO-MEAN vm-scalability.median

schedule.patch:
commit:
 =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
 =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic =

framebuffer emulation
 =C2=A0 ccc5f095c61 schedule dirty worker on local core

f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde ccc5f095c61ff6eded0f0ab1b=
7=C2=A0 =

testcase/testparams/testbox
----------------=C2=A0 -------------------------- -------------------------=
-=C2=A0 =

---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 change %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | \
 =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36556 =C2=B1=C2=A0 =

4% vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
 =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15% =
36556=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =

GEO-MEAN vm-scalability.median

Best Regards,
Rong Chen

--===============6942867273364752684==--

