Content-Type: multipart/mixed; boundary="===============7019277189984450404=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 26 Aug 2019 12:50:50 +0200
Message-ID: <1b897bfe-fd40-3ae3-d867-424d1fc08c44@suse.de>
In-Reply-To: <20190824051605.GA63850@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7019277189984450404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Feng

Am 24.08.19 um 07:16 schrieb Feng Tang:
> Hi Thomas,
> =

> On Thu, Aug 22, 2019 at 07:25:11PM +0200, Thomas Zimmermann wrote:
>> Hi
>> =

>> I was traveling and could reply earlier. Sorry for taking so long.
> =

> No problem! I guessed so :)
> =

>> =

>> Am 13.08.19 um 11:36 schrieb Feng Tang:
>>> Hi Thomas,
>>> =

>>> On Mon, Aug 12, 2019 at 03:25:45PM +0800, Feng Tang wrote:
>>>> Hi Thomas,
>>>> =

>>>> On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
>>>>> Hi,
>>>>> =

>>>>>>> Actually we run the benchmark as a background process, do
>>>>>>> we need to disable the cursor and test again?
>>>>>> There's a worker thread that updates the display from the =

>>>>>> shadow buffer. The blinking cursor periodically triggers =

>>>>>> the worker thread, but the actual update is just the size =

>>>>>> of one character.
>>>>>> =

>>>>>> The point of the test without output is to see if the =

>>>>>> regression comes from the buffer update (i.e., the memcpy =

>>>>>> from shadow buffer to VRAM), or from the worker thread. If
>>>>>>  the regression goes away after disabling the blinking =

>>>>>> cursor, then the worker thread is the problem. If it =

>>>>>> already goes away if there's simply no output from the =

>>>>>> test, the screen update is the problem. On my machine I =

>>>>>> have to disable the blinking cursor, so I think the worker
>>>>>>  causes the performance drop.
>>>>> =

>>>>> We disabled redirecting stdout/stderr to /dev/kmsg,  and the
>>>>>  regression is gone.
>>>>> =

>>>>> commit: f1f8555dfb9 drm/bochs: Use shadow buffer for bochs =

>>>>> framebuffer console 90f479ae51a drm/mgag200: Replace struct =

>>>>> mga_fbdev with generic framebuffer emulation
>>>>> =

>>>>> f1f8555dfb9a70a2  90f479ae51afa45efab97afdde =

>>>>> testcase/testparams/testbox ---------------- =

>>>>> -------------------------- --------------------------- =

>>>>> %stddev      change         %stddev \          | \ 43785 =

>>>>> 44481 vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01 =

>>>>> 43785 44481        GEO-MEAN vm-scalability.median
>>>> =

>>>> Till now, from Rong's tests: 1. Disabling cursor blinking =

>>>> doesn't cure the regression. 2. Disabling printint test results
>>>> to console can workaround the regression.
>>>> =

>>>> Also if we set the perfer_shadown to 0, the regression is also =

>>>> gone.
>>> =

>>> We also did some further break down for the time consumed by the =

>>> new code.
>>> =

>>> The drm_fb_helper_dirty_work() calls sequentially 1. =

>>> drm_client_buffer_vmap	  (290 us) 2. =

>>> drm_fb_helper_dirty_blit_real  (19240 us) 3. =

>>> helper->fb->funcs->dirty()    ---> NULL for mgag200 driver 4. =

>>> drm_client_buffer_vunmap       (215 us)
>>> =

>> =

>> It's somewhat different to what I observed, but maybe I just =

>> couldn't reproduce the problem correctly.
>> =

>>> The average run time is listed after the function names.
>>> =

>>> From it, we can see drm_fb_helper_dirty_blit_real() takes too =

>>> long time (about 20ms for each run). I guess this is the root =

>>> cause of this regression, as the original code doesn't use this =

>>> dirty worker.
>> =

>> True, the original code uses a temporary buffer, but updates the =

>> display immediately.
>> =

>> My guess is that this could be a caching problem. The worker runs =

>> on a different CPU, which doesn't have the shadow buffer in cache.
> =

> Yes, that's my thought too. I profiled the working set size, for most
> of the drm_fb_helper_dirty_blit_real(), it will update a buffer =

> 4096x768(3 MB), and as it is called 30~40 times per second, it surely
> will affect the cache.
> =

> =

>>> As said in last email, setting the prefer_shadow to 0 can avoid =

>>> the regrssion. Could it be an option?
>> =

>> Unfortunately not. Without the shadow buffer, the console's
>> display buffer permanently resides in video memory. It consumes
>> significant amount of that memory (say 8 MiB out of 16 MiB). That
>> doesn't leave enough room for anything else.
>> =

>> The best option is to not print to the console.
> =

> Do we have other options here?

I attached two patches. Both show an improvement in my setup at least.
Could you please test them independently from each other and report back?

prefetch.patch prefetches the shadow buffer two scanlines ahead during
the blit function. The idea is to have the scanlines in cache when they
are supposed to go to hardware.

schedule.patch schedules the dirty worker on the current CPU core (i.e.,
the one that did the drawing to the shadow buffer). Hopefully the shadow
buffer remains in cache meanwhile.

Best regards
Thomas

> My thought is this is clearly a regression, that the old driver
> works fine, while the new version in linux-next doesn't. Also for a
> frame buffer console, writting dozens line of message to it is not a
> rare user case. We have many test platforms
> (servers/desktops/laptops) with different kinds of GFX hardwares, and
> this model works fine for many years :)
> =

> Thanks, Feng
> =

> =

> =

>> Best regards Thomas
>> =

>>> Thanks, Feng
>>> =

>>>> =

>>>> --- a/drivers/gpu/drm/mgag200/mgag200_main.c +++ =

>>>> b/drivers/gpu/drm/mgag200/mgag200_main.c @@ -167,7 +167,7 @@ =

>>>> int mgag200_driver_load(struct drm_device *dev, unsigned long =

>>>> flags) dev->mode_config.preferred_depth =3D 16; else =

>>>> dev->mode_config.preferred_depth =3D 32; - =

>>>> dev->mode_config.prefer_shadow =3D 1; + =

>>>> dev->mode_config.prefer_shadow =3D 0;
>>>> =

>>>> And from the perf data, one obvious difference is good case =

>>>> don't call drm_fb_helper_dirty_work(), while bad case calls.
>>>> =

>>>> Thanks, Feng
>>>> =

>>>>> Best Regards, Rong Chen
>>> _______________________________________________ dri-devel mailing
>>> list dri-devel(a)lists.freedesktop.org =

>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>> =

>> =

>> -- Thomas Zimmermann Graphics Driver Developer SUSE Linux GmbH, =

>> Maxfeldstrasse 5, 90409 Nuernberg, Germany GF: Felix Imend=C3=B6rffer, =

>> Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=BCrnberg)
>> =

> =

> =

> =

> _______________________________________________ dri-devel mailing =

> list dri-devel(a)lists.freedesktop.org =

> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)

--===============7019277189984450404==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="prefetch.patch"

RnJvbSA3MjU4MDY0YjE2YWI0ZjQ0ZGI3MDg2NzBmNjNjODhkYjhiM2YyZWVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KRGF0ZTogTW9uLCAyNiBBdWcgMjAxOSAwOTo1MzozOCArMDIwMApTdWJqZWN0OiBwcmVmZXRj
aCBzaGFkb3cgYnVmZmVyIHR3byBsaW5lcyBhaGVhZCBvZiBibGl0IG9mZnNldAoKLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBhN2JhNWI0OTAyZDYuLjYx
Y2Y0MzY4NDBjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0zMyw2ICszMyw3IEBACiAj
aW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L21vZHVsZS5oPgorI2luY2x1ZGUgPGxpbnV4L3ByZWZldGNoLmg+CiAjaW5j
bHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L3N5c3JxLmg+CiAjaW5jbHVkZSA8
bGludXgvdm1hbGxvYy5oPgpAQCAtMzkwLDYgKzM5MSw4IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9o
ZWxwZXJfZGlydHlfYmxpdF9yZWFsKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsCiAJ
dW5zaWduZWQgaW50IHk7CiAKIAlmb3IgKHkgPSBjbGlwLT55MTsgeSA8IGNsaXAtPnkyOyB5Kysp
IHsKKwkJaWYgKHkgPCBjbGlwLT55MiAtIDIpCisJCQlwcmVmZXRjaF9yYW5nZShzcmMgKyAyICog
ZmItPnBpdGNoZXNbMF0sIGxlbik7CiAJCW1lbWNweShkc3QsIHNyYywgbGVuKTsKIAkJc3JjICs9
IGZiLT5waXRjaGVzWzBdOwogCQlkc3QgKz0gZmItPnBpdGNoZXNbMF07Ci0tIAoyLjIyLjAKCg==

--===============7019277189984450404==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="schedule.patch"

RnJvbSA2MGQ1MzIyYWUzYWIyYTRjODJjMTU3OWIzN2MzNGFiYjNiODIyMmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KRGF0ZTogTW9uLCAyNiBBdWcgMjAxOSAxMjoxNzozOCArMDIwMApTdWJqZWN0OiBzY2hlZHVs
ZSBkaXJ0eSB3b3JrZXIgb24gbG9jYWwgY29yZQoKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBhN2JhNWI0OTAyZDYuLjlhYmM5
NTBjZmFlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0zNCw2ICszNCw3IEBACiAjaW5j
bHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVk
ZSA8bGludXgvc2xhYi5oPgorI2luY2x1ZGUgPGxpbnV4L3NtcC5oPgogI2luY2x1ZGUgPGxpbnV4
L3N5c3JxLmg+CiAjaW5jbHVkZSA8bGludXgvdm1hbGxvYy5oPgogCkBAIC02NDIsNyArNjQzLDcg
QEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywg
dTMyIHgsIHUzMiB5LAogCWNsaXAtPnkyID0gbWF4X3QodTMyLCBjbGlwLT55MiwgeSArIGhlaWdo
dCk7CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGVscGVyLT5kaXJ0eV9sb2NrLCBmbGFncyk7
CiAKLQlzY2hlZHVsZV93b3JrKCZoZWxwZXItPmRpcnR5X3dvcmspOworCXNjaGVkdWxlX3dvcmtf
b24oc21wX3Byb2Nlc3Nvcl9pZCgpLCAmaGVscGVyLT5kaXJ0eV93b3JrKTsKIH0KIAogLyoqCi0t
IAoyLjIyLjAKCg==

--===============7019277189984450404==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxanVZb0FDZ2tRYUEzQkhWTUwKZWlOb0ZBZjlFZzVkUnRadUJl
TytSUHNKbi9EblpsY3ByQmxWdHpSbnR3UXJOMVVjTDJvekQwYWFQL0k0eTlLegowZkxiaEpOWG5S
VXNTSXBOZ0tYdUdJeURROFBOaFY4bWlhZklYYzVVUG51MDh5ckdHS1JuVDVtYkhJOGtqQlhaCmRr
WkVqRk5HWEMvOVpJWFVKdXRKTUdLREtqSWF6VmhGZkV6YUFqQ3lrdVpBVDZ5emNhZjBhYWlGN3Ju
SW52WXMKaDdhNXJWMlFDdDBQWWtmT3VkZUlEZlpPNTBTS1craXVYWkFjSjZ2UmhsRFlCZEd1ZGgy
dDFKa1QzZC95eEoyagpDQ1VkWXV6YlNVWHIzMTZEak0zT1hhaEU2ZnNzOE9ZVWdxOVdMblE2WE03
ZXhVUndybmJBU3JibTZYSVREVFg3CmE3WnhPN2dHdFJVMUFka0h0ek81UlZ1V2NzUlIvZz09Cj0r
MUlkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7019277189984450404==--

