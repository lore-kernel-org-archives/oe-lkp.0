Content-Type: multipart/mixed; boundary="===============1071520455421630357=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 5349b2afc1: xfstests.xfs.299.fail
Date: Wed, 15 Jun 2022 17:04:36 +0800
Message-ID: <20220615090436.GH36441@xsang-OptiPlex-9020>
In-Reply-To: <20220602214037.GE1098723@dread.disaster.area>
List-Id: <oe-lkp.lists.linux.dev>

--===============1071520455421630357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave Chinner,

On Fri, Jun 03, 2022 at 07:40:37AM +1000, Dave Chinner wrote:
> > =

> > xfs/299	- output mismatch (see /lkp/benchmarks/xfstests/results//xfs/29=
9.out.bad)
> >     --- tests/xfs/299.out	2022-05-16 16:42:32.000000000 +0000
> >     +++ /lkp/benchmarks/xfstests/results//xfs/299.out.bad	2022-05-17 15=
:57:43.078827071 +0000
> >     @@ -6,6 +6,7 @@
> >      log      =3DLDEV bsize=3DXXX blocks=3DXXX
> >      realtime =3DRDEV extsz=3DXXX blocks=3DXXX, rtextents=3DXXX
> >      *** user, group, and project
> >     +xfs_quota: cannot set warnings: Invalid argument
> =

> Not a kernel issue - this is fixed in the latest fstests release.

got it! we upgraded our test package and now the test can pass on this comm=
it
now. Thanks a lot!

> =

> -Dave.
> -- =

> Dave Chinner
> david(a)fromorbit.com
--===============1071520455421630357==--

