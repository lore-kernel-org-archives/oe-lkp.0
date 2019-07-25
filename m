Content-Type: multipart/mixed; boundary="===============3239175901625350819=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Thu, 25 Jul 2019 15:56:17 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662495207D277@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20190725145247.zc3apygng5kkqxp5@mojo.amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3239175901625350819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: [LKP] [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
> =

> 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with ubuntu-
> 18.04.
Thanks John for the input, would you like to open an issue on github.com/in=
tel/lkp-tests,
we will add it to plan to look for ways to resolve it.

> The patch changes the install dependencies for ubuntu to perl-modules-5.2=
8 and
> libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only contain v=
ersion
> 5.26. Is ubuntu 18.04 not a supported distro? If it is supported, it seem=
s that
> we will need a way to specify to install whichever version of the package=
 is
> available. Ideally, it would be nice to be able to specify something like
> "perl-modules >=3D 5.26", but the current method of installing packages d=
oesn't
> seem to be equipped to handle that sort of thing.
> =

> Thanks,
> John
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============3239175901625350819==--

