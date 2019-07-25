Content-Type: multipart/mixed; boundary="===============4296219937697858993=="
MIME-Version: 1.0
From: Allen, John <John.Allen@amd.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Thu, 25 Jul 2019 17:06:36 +0000
Message-ID: <20190725170630.pyf6ktebhwqhrwig@mojo.amd.com>
In-Reply-To: <831EE4E5E37DCC428EB295A351E662495207D277@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4296219937697858993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 03:56:17PM +0000, Li, Philip wrote:
> > Subject: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubuntu-18=
.04
> > =

> > 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with ubunt=
u-
> > 18.04.
> Thanks John for the input, would you like to open an issue on github.com/=
intel/lkp-tests,
> we will add it to plan to look for ways to resolve it.

Thanks, issue opened here:

https://github.com/fengguang/lkp-tests/issues/11

> =

> > The patch changes the install dependencies for ubuntu to perl-modules-5=
.28 and
> > libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only contain=
 version
> > 5.26. Is ubuntu 18.04 not a supported distro? If it is supported, it se=
ems that
> > we will need a way to specify to install whichever version of the packa=
ge is
> > available. Ideally, it would be nice to be able to specify something li=
ke
> > "perl-modules >=3D 5.26", but the current method of installing packages=
 doesn't
> > seem to be equipped to handle that sort of thing.
> > =

> > Thanks,
> > John
> > _______________________________________________
> > LKP mailing list
> > LKP(a)lists.01.org
> > https://lists.01.org/mailman/listinfo/lkp

--===============4296219937697858993==--

