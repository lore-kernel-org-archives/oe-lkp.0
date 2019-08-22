Content-Type: multipart/mixed; boundary="===============3161386246380409255=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Thu, 22 Aug 2019 19:25:11 +0200
Message-ID: <64d41701-55a4-e526-17ae-8936de4bc1ef@suse.de>
In-Reply-To: <20190813093616.GA65475@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3161386246380409255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

I was traveling and could reply earlier. Sorry for taking so long.

Am 13.08.19 um 11:36 schrieb Feng Tang:
> Hi Thomas, =

> =

> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>> Hi Thomas,
>>
>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>> Hi,
>>>
>>>>> Actually we run the benchmark as a background process, do we need to
>>>>> disable the cursor and test again?
>>>> There's a worker thread that updates the display from the shadow buffe=
r.
>>>> The blinking cursor periodically triggers the worker thread, but the
>>>> actual update is just the size of one character.
>>>>
>>>> The point of the test without output is to see if the regression comes
>>> >from the buffer update (i.e., the memcpy from shadow buffer to VRAM), =
or
>>> >from the worker thread. If the regression goes away after disabling the
>>>> blinking cursor, then the worker thread is the problem. If it already
>>>> goes away if there's simply no output from the test, the screen update
>>>> is the problem. On my machine I have to disable the blinking cursor, so
>>>> I think the worker causes the performance drop.
>>>
>>> We disabled redirecting stdout/stderr to /dev/kmsg,=C2=A0 and the regre=
ssion is
>>> gone.
>>>
>>> commit:
>>> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer c=
onsole
>>> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic f=
ramebuffer
>>> emulation
>>>
>>> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams/t=
estbox
>>> ----------------=C2=A0 -------------------------- ---------------------=
------
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 44481
>>> vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01
>>> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 44481=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN=
 vm-scalability.median
>>
>> Till now, from Rong's tests:
>> 1. Disabling cursor blinking doesn't cure the regression.
>> 2. Disabling printint test results to console can workaround the
>> regression.
>>
>> Also if we set the perfer_shadown to 0, the regression is also
>> gone.
> =

> We also did some further break down for the time consumed by the
> new code.
> =

> The drm_fb_helper_dirty_work() calls sequentially =

> 1. drm_client_buffer_vmap	  (290 us)
> 2. drm_fb_helper_dirty_blit_real  (19240 us)
> 3. helper->fb->funcs->dirty()    ---> NULL for mgag200 driver
> 4. drm_client_buffer_vunmap       (215 us)
>

It's somewhat different to what I observed, but maybe I just couldn't
reproduce the problem correctly.

> The average run time is listed after the function names.
> =

> From it, we can see drm_fb_helper_dirty_blit_real() takes too long
> time (about 20ms for each run). I guess this is the root cause
> of this regression, as the original code doesn't use this dirty worker.

True, the original code uses a temporary buffer, but updates the display
immediately.

My guess is that this could be a caching problem. The worker runs on a
different CPU, which doesn't have the shadow buffer in cache.

> As said in last email, setting the prefer_shadow to 0 can avoid
> the regrssion. Could it be an option?

Unfortunately not. Without the shadow buffer, the console's display
buffer permanently resides in video memory. It consumes significant
amount of that memory (say 8 MiB out of 16 MiB). That doesn't leave
enough room for anything else.

The best option is to not print to the console.

Best regards
Thomas

> Thanks,
> Feng
> =

>>
>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_main.c
>> @@ -167,7 +167,7 @@ int mgag200_driver_load(struct drm_device *dev, unsi=
gned long flags)
>>  		dev->mode_config.preferred_depth =3D 16;
>>  	else
>>  		dev->mode_config.preferred_depth =3D 32;
>> -	dev->mode_config.prefer_shadow =3D 1;
>> +	dev->mode_config.prefer_shadow =3D 0;
>>
>> And from the perf data, one obvious difference is good case don't
>> call drm_fb_helper_dirty_work(), while bad case calls.
>>
>> Thanks,
>> Feng
>>
>>> Best Regards,
>>> Rong Chen
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


--===============3161386246380409255==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxZXovc0FDZ2tRYUEzQkhWTUwKZWlNZkxBZjlIcnVDcklDa2hH
bmJMVnp4ejRLb0U1WjUrZTVIZEN2S3JUMW5UMDVUcWNEUXlkcU5RM0dEYStYZQpCTmExOWRBM3lr
cklFWlJQelJJNm5kMjAwUmNPVGtoZDNiQytSZnJlcjUydW1OYTA3THdQUjJuUVhEaExRaHBvCkJw
aHByaUE3b3piZ1M1WUM4MHVmWCtDTk9kL3dTdjBEWkdtT01raHFZVlM2NGg5YWxxQUwvdWRuS0Jw
SlBEN08KaHYyZDhtSlNiZ3BOdW9oZm1CSW5HTS84RWhsN2k0ZkcraDU1WnFZaVNXZHhIa0U1cGNn
Q0VrcUtWVnNrQTllVQpYY21ubFZrbEFOcWJDdkJDRElJbCszeUQ3akhSWW54RzFJeFJWTWRnOVI4
KytRbW1BNnFoQ2l5b3cxeldwRGUxCnQ3U0thQzJ1WmVDWUhFakRIQVViZmt2YUxNOTJudz09Cj1N
dnI0Ci0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============3161386246380409255==--

