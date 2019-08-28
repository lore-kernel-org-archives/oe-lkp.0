Content-Type: multipart/mixed; boundary="===============4044996220996580232=="
MIME-Version: 1.0
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 28 Aug 2019 12:51:40 +0200
Message-ID: <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
In-Reply-To: <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4044996220996580232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.08.19 um 11:37 schrieb Rong Chen:
> Hi Thomas,
> =

> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
>> Hi
>>
>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>>> Both patches have little impact on the performance from our side.
>> Thanks for testing. Too bad they doesn't solve the issue.
>>
>> There's another patch attached. Could you please tests this as well?
>> Thanks a lot!
>>
>> The patch comes from Daniel Vetter after discussing the problem on IRC.
>> The idea of the patch is that the old mgag200 code might display much
>> less frames that the generic code, because mgag200 only prints from
>> non-atomic context. If we simulate this with the generic code, we should
>> see roughly the original performance.
>>
>>
> =

> It's cool, the patch "usecansleep.patch" can fix the issue.

Thank you for testing. But don't get too excited, because the patch
simulates a bug that was present in the original mgag200 code. A
significant number of frames are simply skipped. That is apparently the
reason why it's faster.

Best regards
Thomas

> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer con=
sole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic
> framebuffer emulation
> =C2=A0 b976b04c2bc only schedule worker from non-atomic context
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde b976b04c2bcf33148d6c7bc=
1a2=C2=A0
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
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 440=
93
> vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 440=
93=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN
> vm-scalability.median
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


--===============4044996220996580232==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRRXpCQUVCQ0FBZEZpRUVjaGY3ckl6cHoy
TkVvV2psYUEzQkhWTUxlaU1GQWwxbVhMd0FDZ2tRYUEzQkhWTUwKZWlQUXlnZ0Fnd1o3VlowOXNL
RWhaYUpsdnNiUythLytDV05TVEE5ZXhpZ1dLWkNpNlNOeENZdlJEcmt6RUFGQgpITVVyOVViemZW
b2c4bkJnK01nYWd2M0VuMG0ydDZHZWZ5cXVDQWJ0MDFkNldjZFpic042TDlOVFJLSUZpb09SClFh
WTZFcmNiRGU1ZnRPUU4rQk5tL01tTkxaU2xEZUsrVXB0UFh3bDlKbUt1MVN6WlNZL1hFUUl6dXNs
NmlxVlEKUGtsZS9uUFRxM2ZjRkE2UkN4NkU3emJtY0E4dmQ3dTFGZE9BR052ZmxZTUlBMEQ3VTRr
dnQvSVNQLzFhcHZJOAp6clRjYVlYemhaTHVQTDlyOURyVU8vcUk5c2RaTVZnN3p2TlYwZGNEMGhy
OHNLaFE4NGczMlpralcxQ3hBTVpkCmcvb3hHSXYvZlpuaTYzUjNBWElFbllJWE9VYi9Odz09Cj1J
cHJkCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============4044996220996580232==--

