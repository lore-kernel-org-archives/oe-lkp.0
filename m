Content-Type: multipart/mixed; boundary="===============0547960684670865701=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 16 Sep 2019 17:06:52 +0800
Message-ID: <20190916090652.GK5541@shbuild999.sh.intel.com>
In-Reply-To: <6806e973-4cf7-bcac-54b4-4fac21698ece@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0547960684670865701==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Sep 09, 2019 at 04:12:37PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 04.09.19 um 08:27 schrieb Feng Tang:
> > Hi Thomas,
> > =

> > On Wed, Aug 28, 2019 at 12:51:40PM +0200, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 28.08.19 um 11:37 schrieb Rong Chen:
> >>> Hi Thomas,
> >>>
> >>> On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
> >>>> Hi
> >>>>
> >>>> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
> >>>>> Both patches have little impact on the performance from our side.
> >>>> Thanks for testing. Too bad they doesn't solve the issue.
> >>>>
> >>>> There's another patch attached. Could you please tests this as well?
> >>>> Thanks a lot!
> >>>>
> >>>> The patch comes from Daniel Vetter after discussing the problem on I=
RC.
> >>>> The idea of the patch is that the old mgag200 code might display much
> >>>> less frames that the generic code, because mgag200 only prints from
> >>>> non-atomic context. If we simulate this with the generic code, we sh=
ould
> >>>> see roughly the original performance.
> >>>>
> >>>>
> >>>
> >>> It's cool, the patch "usecansleep.patch" can fix the issue.
> >>
> >> Thank you for testing. But don't get too excited, because the patch
> >> simulates a bug that was present in the original mgag200 code. A
> >> significant number of frames are simply skipped. That is apparently the
> >> reason why it's faster.
> > =

> > Thanks for the detailed info, so the original code skips time-consuming
> > work inside atomic context on purpose. Is there any space to optmise it?
> > If 2 scheduled update worker are handled at almost same time, can one be
> > skipped?
> =

> We discussed ideas on IRC and decided that screen updates could be
> synchronized with vblank intervals. This may give some rate limiting to
> the output.
> =

> If you like, you could try the patch set at [1]. It adds the respective
> code to console and mgag200.

I just tried the 2 patches, no obvious change (comparing to the
18.8% regression), both in overall benchmark and micro-profiling.

90f479ae51afa45e 04a0983095feaee022cdd65e3e4 =

---------------- --------------------------- =

     37236 =C2=B1  3%      +2.5%      38167 =C2=B1  3%  vm-scalability.medi=
an
      0.15 =C2=B1 24%     -25.1%       0.11 =C2=B1 23%  vm-scalability.medi=
an_stddev
      0.15 =C2=B1 23%     -25.1%       0.11 =C2=B1 22%  vm-scalability.stdd=
ev
  12767318 =C2=B1  4%      +2.5%   13089177 =C2=B1  3%  vm-scalability.thro=
ughput
 =

Thanks,
Feng

> =

> Best regards
> Thomas
> =

> [1]
> https://lists.freedesktop.org/archives/dri-devel/2019-September/234850.ht=
ml
> =

> > =

> > Thanks,
> > Feng
> > =

> >>
> >> Best regards
> >> Thomas
> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG N=C3=BCrnberg)
> =





--===============0547960684670865701==--

