Content-Type: multipart/mixed; boundary="===============1968060482037321239=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Fri, 26 Jul 2019 00:26:18 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662495207D979@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20190725170630.pyf6ktebhwqhrwig@mojo.amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1968060482037321239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Allen, John [mailto:John.Allen(a)amd.com]
> Sent: Friday, July 26, 2019 1:07 AM
> To: Li, Philip <philip.li@intel.com>
> Cc: lkp(a)lists.01.org
> Subject: Re: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubuntu-=
18.04
> =

> On Thu, Jul 25, 2019 at 03:56:17PM +0000, Li, Philip wrote:
> > > Subject: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubuntu-=
18.04
> > >
> > > 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with ubu=
ntu-
> > > 18.04.
> > Thanks John for the input, would you like to open an issue on
> github.com/intel/lkp-tests,
> > we will add it to plan to look for ways to resolve it.
> =

> Thanks, issue opened here:
> =

> https://github.com/fengguang/lkp-tests/issues/11
thanks, the official repo is https://github.com/intel/lkp-tests, can you he=
lp move the
issue to it?

> =

> >
> > > The patch changes the install dependencies for ubuntu to perl-modules=
-5.28
> and
> > > libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only conta=
in
> version
> > > 5.26. Is ubuntu 18.04 not a supported distro? If it is supported, it =
seems that
> > > we will need a way to specify to install whichever version of the pac=
kage is
> > > available. Ideally, it would be nice to be able to specify something =
like
> > > "perl-modules >=3D 5.26", but the current method of installing packag=
es doesn't
> > > seem to be equipped to handle that sort of thing.
> > >
> > > Thanks,
> > > John
> > > _______________________________________________
> > > LKP mailing list
> > > LKP(a)lists.01.org
> > > https://lists.01.org/mailman/listinfo/lkp

--===============1968060482037321239==--

