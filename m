Content-Type: multipart/mixed; boundary="===============7974224559809417341=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Fri, 23 Aug 2019 11:54:57 +0200
Message-ID: <7ba725e3-3db7-36d7-25f5-d9ef607ebf65@suse.de>
In-Reply-To: <CAPM=9twNdYZCbyByLqZPpcK+ifoeL0weXppqzLyZEOn7GPAV_Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7974224559809417341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 22.08.19 um 22:02 schrieb Dave Airlie:
> On Fri, 23 Aug 2019 at 03:25, Thomas Zimmermann <tzimmermann@suse.de> w=
rote:
>>
>> Hi
>>
>> I was traveling and could reply earlier. Sorry for taking so long.
>>
>> Am 13.08.19 um 11:36 schrieb Feng Tang:
>>> Hi Thomas,
>>>
>>> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>>>> Hi Thomas,
>>>>
>>>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>>>> Hi,
>>>>>
>>>>>>> Actually we run the benchmark as a background process, do we need to
>>>>>>> disable the cursor and test again?
>>>>>> There's a worker thread that updates the display from the shadow buf=
fer.
>>>>>> The blinking cursor periodically triggers the worker thread, but the
>>>>>> actual update is just the size of one character.
>>>>>>
>>>>>> The point of the test without output is to see if the regression com=
es
>>>>> >from the buffer update (i.e., the memcpy from shadow buffer to VRAM)=
, or
>>>>> >from the worker thread. If the regression goes away after disabling =
the
>>>>>> blinking cursor, then the worker thread is the problem. If it already
>>>>>> goes away if there's simply no output from the test, the screen upda=
te
>>>>>> is the problem. On my machine I have to disable the blinking cursor,=
 so
>>>>>> I think the worker causes the performance drop.
>>>>>
>>>>> We disabled redirecting stdout/stderr to /dev/kmsg,  and the regressi=
on is
>>>>> gone.
>>>>>
>>>>> commit:
>>>>>   f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
>>>>>   90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fram=
ebuffer
>>>>> emulation
>>>>>
>>>>> f1f8555dfb9a70a2  90f479ae51afa45efab97afdde testcase/testparams/test=
box
>>>>> ----------------  -------------------------- ------------------------=
---
>>>>>          %stddev      change         %stddev
>>>>>              \          |                \
>>>>>      43785                       44481
>>>>> vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>>>>      43785                       44481        GEO-MEAN vm-scalability=
.median
>>>>
>>>> Till now, from Rong's tests:
>>>> 1. Disabling cursor blinking doesn't cure the regression.
>>>> 2. Disabling printint test results to console can workaround the
>>>> regression.
>>>>
>>>> Also if we set the perfer_shadown to 0, the regression is also
>>>> gone.
>>>
>>> We also did some further break down for the time consumed by the
>>> new code.
>>>
>>> The drm_fb_helper_dirty_work() calls sequentially
>>> 1. drm_client_buffer_vmap       (290 us)
>>> 2. drm_fb_helper_dirty_blit_real  (19240 us)
>>> 3. helper->fb->funcs->dirty()    ---> NULL for mgag200 driver
>>> 4. drm_client_buffer_vunmap       (215 us)
>>>
>>
>> It's somewhat different to what I observed, but maybe I just couldn't
>> reproduce the problem correctly.
>>
>>> The average run time is listed after the function names.
>>>
>>> From it, we can see drm_fb_helper_dirty_blit_real() takes too long
>>> time (about 20ms for each run). I guess this is the root cause
>>> of this regression, as the original code doesn't use this dirty worker.
>>
>> True, the original code uses a temporary buffer, but updates the display
>> immediately.
>>
>> My guess is that this could be a caching problem. The worker runs on a
>> different CPU, which doesn't have the shadow buffer in cache.
>>
>>> As said in last email, setting the prefer_shadow to 0 can avoid
>>> the regrssion. Could it be an option?
>>
>> Unfortunately not. Without the shadow buffer, the console's display
>> buffer permanently resides in video memory. It consumes significant
>> amount of that memory (say 8 MiB out of 16 MiB). That doesn't leave
>> enough room for anything else.
>>
>> The best option is to not print to the console.
> =

> Wait a second, I thought the driver did an eviction on modeset of the
> scanned out object, this was a deliberate design decision made when
> writing those drivers, has this been removed in favour of gem and
> generic code paths?

Yes. We added back this feature for testing in [1]. It was only an
improvement of ~1% compared to the original report. I wouldn't mind
landing this patch set, but it probably doesn't make a difference either.

Best regards
Thomas

[1] https://lists.freedesktop.org/archives/dri-devel/2019-August/228950.html

> =

> Dave.
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--===============7974224559809417341==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxZnQvUUFDZ2tRYUEzQkhWTUwKZWlNOFRnZitLQmJtOWxpenhm
ZkxZYkVRUEpjdVVzblNVL2NhRzI0R09DSXhlMG9qSEtVbVZ4UVdpd1pRWE5QZQphOThTWEFRUkI0
NTNkV0dFdmFlTkl6TkR6b3JsZ2ZTcDc2bXZYdmxRMFpaSjBqb1JTL1JjUzdPKzFRN2lyenNrCnpm
dDUxU1pxeXcrWFNDN0t0UlBZa3dqY3M3VCtiVU00NUpYSkJ0Z1F4M0t4cHFST3ViTmlqOWhiUW90
b1FGR0cKYjNUU2w2ZzgxT1ZnNXM3SkFkK0N1WC9ZZFZDRnFIeVRBVEp1dEQ5TTVTTWFMWkF4M0VR
T3JMU0tmaWE5ZTVOcQo4QktyVTFFd2c2ZndmWDFIN2NHQlpNdW1tM281OTVybnNjQkNPL28xakJ3
cmtTYmxjUmkvTW5wcU96OUo5SFFtClhKV1Fpd1BSdVVXc1ViQ2p1T2tFQTlTSkhxY1prUT09Cj0v
ZnJvCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7974224559809417341==--

