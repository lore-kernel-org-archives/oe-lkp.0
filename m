Content-Type: multipart/mixed; boundary="===============4926325891678603835=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 28 Aug 2019 17:37:01 +0800
Message-ID: <90e78ce8-d46a-5154-c324-a05aa1743c98@intel.com>
In-Reply-To: <44029e80-ba00-8246-dec0-fda122d53f5e@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4926325891678603835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
> Hi
>
> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
>> Both patches have little impact on the performance from our side.
> Thanks for testing. Too bad they doesn't solve the issue.
>
> There's another patch attached. Could you please tests this as well?
> Thanks a lot!
>
> The patch comes from Daniel Vetter after discussing the problem on IRC.
> The idea of the patch is that the old mgag200 code might display much
> less frames that the generic code, because mgag200 only prints from
> non-atomic context. If we simulate this with the generic code, we should
> see roughly the original performance.
>
>

It's cool, the patch "usecansleep.patch" can fix the issue.

commit:
 =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer cons=
ole
 =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic =

framebuffer emulation
 =C2=A0 b976b04c2bc only schedule worker from non-atomic context

f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde b976b04c2bcf33148d6c7bc1a=
2=C2=A0 =

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
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 440=
93 =

vm-scalability/performance-300s-8T-anon-cow-seq-hugetlb/lkp-knm01
 =C2=A0=C2=A0=C2=A0=C2=A0 42912=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36517 440=
93=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN =

vm-scalability.median

Best Regards,
Rong Chen

--===============4926325891678603835==--

