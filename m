Content-Type: multipart/mixed; boundary="===============5275643010875174617=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Tue, 27 Aug 2019 19:16:47 +0200
Message-ID: <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
In-Reply-To: <d114b0b6-6b64-406e-6c3f-a8b8d5502413@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5275643010875174617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 27.08.19 um 14:33 schrieb Chen, Rong A:
> =

> Both patches have little impact on the performance from our side.

Thanks for testing. Too bad they doesn't solve the issue.

There's another patch attached. Could you please tests this as well?
Thanks a lot!

The patch comes from Daniel Vetter after discussing the problem on IRC.
The idea of the patch is that the old mgag200 code might display much
less frames that the generic code, because mgag200 only prints from
non-atomic context. If we simulate this with the generic code, we should
see roughly the original performance.

Best regards
Thomas

> =

> prefetch.patch:
> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer con=
sole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> =C2=A0 77459f56994 prefetch shadow buffer two lines ahead of blit offset
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde 77459f56994ab87ee545992=
0b3=C2=A0
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
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
35515
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -17% =
35515=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> GEO-MEAN vm-scalability.median
> =

> schedule.patch:
> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer con=
sole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> =C2=A0 ccc5f095c61 schedule dirty worker on local core
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde ccc5f095c61ff6eded0f0ab=
1b7=C2=A0
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
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36556 =C2=B1=C2=A0 4%
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15% =
36556=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> GEO-MEAN vm-scalability.median
> =

> Best Regards,
> Rong Chen
> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)

--===============5275643010875174617==
Content-Type: text/x-patch
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="usecansleep.patch"

RnJvbSBlNmU3MjAzMWU4NWUxYWQ0Y2JkMzhmYjQ3Zjg5OWJhYjU0YmY2YmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4KRGF0ZTogVHVlLCAyNyBBdWcgMjAxOSAxOTowMDo0MSArMDIwMApTdWJqZWN0OiBvbmx5IHNj
aGVkdWxlIHdvcmtlciBmcm9tIG5vbi1hdG9taWMgY29udGV4dAoKLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwppbmRleCBhN2JhNWI0OTAy
ZDYuLjNhM2U0Nzg0ZWIyOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCkBAIC02NDIsNyArNjQy
LDggQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kaXJ0eShzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywgdTMyIHgsIHUzMiB5LAogCWNsaXAtPnkyID0gbWF4X3QodTMyLCBjbGlwLT55MiwgeSArIGhl
aWdodCk7CiAJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaGVscGVyLT5kaXJ0eV9sb2NrLCBmbGFn
cyk7CiAKLQlzY2hlZHVsZV93b3JrKCZoZWxwZXItPmRpcnR5X3dvcmspOworCWlmIChkcm1fY2Fu
X3NsZWVwKCkpCisJCXNjaGVkdWxlX3dvcmsoJmhlbHBlci0+ZGlydHlfd29yayk7CiB9CiAKIC8q
KgotLSAKMi4yMi4wCgo=

--===============5275643010875174617==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxbFpZTUFDZ2tRYUEzQkhWTUwKZWlOdWl3Z0FxMDJqWU93MTNr
R2xDZHJwcHVnWDQzUzVQaEt6aGNreDBsQnd6cUZZVW5jcVJwMVB3NkJHN1MrRwpTUTlaRVdYcHhS
M3VXM3V1RXpMYVZUajlTUE81NTZWWWxVejZxZW50dU9uRnp0Ly9WU0xuejJwY09xdjU5czVICnNa
N2h5TnNLR1dncnhGU2hJSDVyaFBhemVyWWg1bTlSZ0hnRlRlUXJDNFZja083eHRvREp4L2xrUEc4
TFdEZUsKbmhsS2lXTzcxSTYrRkFGWjN4MUNzQjJJQnF0c0NmZDByTFdUdCtzcklCSVViRjBaZGla
TTZicm42ZXg5VGVUWApFQ3FNbnJuU3dnbnpYV2dEQ242VWtqakJFWFlJVHYzbXFUVFVva0tLbThN
N2hCMWljSEg2YVl5UVlBdUpxZFh0CmIwZWlnRitrUlh4aElmN2RnTnZFaC9UQ1JZY0FkZz09Cj1Z
ajhmCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============5275643010875174617==--

