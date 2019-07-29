Content-Type: multipart/mixed; boundary="===============6314253090642572631=="
MIME-Version: 1.0
From: Liu Yiding <liuyd.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Mon, 29 Jul 2019 15:21:22 +0800
Message-ID: <46723510-0ff8-de18-3260-e050b4d3bc4d@cn.fujitsu.com>
In-Reply-To: <20190725145247.zc3apygng5kkqxp5@mojo.amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6314253090642572631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, John. please update lkp-tests. commit =

8de082ad179f96187c37471db537068691fed355 has decreased perl to stable =

5.24 version.


On 7/25/19 10:53 PM, Allen, John wrote:
> 7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with ubuntu-=
18.04.
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
>
> Thanks,
> John
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp
>
>
-- =

Best regards.
Liu Yiding




--===============6314253090642572631==--

