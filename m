Content-Type: multipart/mixed; boundary="===============3193636928883845228=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 14:27:16 +0800
Message-ID: <20190904062716.GC5541@shbuild999.sh.intel.com>
In-Reply-To: <2e1b4d65-d477-f571-845d-fa0a670859af@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3193636928883845228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Wed, Aug 28, 2019 at 12:51:40PM +0200, Thomas Zimmermann wrote:
> Hi
> =

> Am 28.08.19 um 11:37 schrieb Rong Chen:
> > Hi Thomas,
> > =

> > On 8/28/19 1:16 AM, Thomas Zimmermann wrote:
> >> Hi
> >>
> >> Am 27.08.19 um 14:33 schrieb Chen, Rong A:
> >>> Both patches have little impact on the performance from our side.
> >> Thanks for testing. Too bad they doesn't solve the issue.
> >>
> >> There's another patch attached. Could you please tests this as well?
> >> Thanks a lot!
> >>
> >> The patch comes from Daniel Vetter after discussing the problem on IRC.
> >> The idea of the patch is that the old mgag200 code might display much
> >> less frames that the generic code, because mgag200 only prints from
> >> non-atomic context. If we simulate this with the generic code, we shou=
ld
> >> see roughly the original performance.
> >>
> >>
> > =

> > It's cool, the patch "usecansleep.patch" can fix the issue.
> =

> Thank you for testing. But don't get too excited, because the patch
> simulates a bug that was present in the original mgag200 code. A
> significant number of frames are simply skipped. That is apparently the
> reason why it's faster.

Thanks for the detailed info, so the original code skips time-consuming
work inside atomic context on purpose. Is there any space to optmise it?
If 2 scheduled update worker are handled at almost same time, can one be
skipped?

Thanks,
Feng

> =

> Best regards
> Thomas

--===============3193636928883845228==--

