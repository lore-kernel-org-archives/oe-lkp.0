Content-Type: multipart/mixed; boundary="===============8960955866663482428=="
MIME-Version: 1.0
From: Allen, John <John.Allen@amd.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Fri, 26 Jul 2019 12:16:09 +0000
Message-ID: <20190726121551.zypztn5not35r2vr@mojo.amd.com>
In-Reply-To: <831EE4E5E37DCC428EB295A351E662495207D979@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8960955866663482428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 12:26:18AM +0000, Li, Philip wrote:
> =

> =

> > -----Original Message-----
> > From: Allen, John [mailto:John.Allen(a)amd.com]
> > Sent: Friday, July 26, 2019 1:07 AM
> > To: Li, Philip <philip.li@intel.com>
> > Cc: lkp(a)lists.01.org
> > Subject: Re: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubunt=
u-18.04
> > =

> > On Thu, Jul 25, 2019 at 03:56:17PM +0000, Li, Philip wrote:
> > > > Subject: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubunt=
u-18.04
> > > >
> > > > 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with u=
buntu-
> > > > 18.04.
> > > Thanks John for the input, would you like to open an issue on
> > github.com/intel/lkp-tests,
> > > we will add it to plan to look for ways to resolve it.
> > =

> > Thanks, issue opened here:
> > =

> > https://github.com/fengguang/lkp-tests/issues/11
> thanks, the official repo is https://github.com/intel/lkp-tests, can you =
help move the
> issue to it?
>
Ah, thanks for making me aware of the official repo. New issue is open here:
https://github.com/intel/lkp-tests/issues/42 =

> > =

> > >
> > > > The patch changes the install dependencies for ubuntu to perl-modul=
es-5.28
> > and
> > > > libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only con=
tain
> > version
> > > > 5.26. Is ubuntu 18.04 not a supported distro? If it is supported, i=
t seems that
> > > > we will need a way to specify to install whichever version of the p=
ackage is
> > > > available. Ideally, it would be nice to be able to specify somethin=
g like
> > > > "perl-modules >=3D 5.26", but the current method of installing pack=
ages doesn't
> > > > seem to be equipped to handle that sort of thing.
> > > >
> > > > Thanks,
> > > > John
> > > > _______________________________________________
> > > > LKP mailing list
> > > > LKP(a)lists.01.org
> > > > https://lists.01.org/mailman/listinfo/lkp

--===============8960955866663482428==--

