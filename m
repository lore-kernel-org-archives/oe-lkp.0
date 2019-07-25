Content-Type: multipart/mixed; boundary="===============4647796841291567106=="
MIME-Version: 1.0
From: Allen, John <John.Allen@amd.com>
To: lkp@lists.01.org
Subject: [BUG] unixbench: libperl5.28 does not exist on ubuntu-18.04
Date: Thu, 25 Jul 2019 14:53:00 +0000
Message-ID: <20190725145247.zc3apygng5kkqxp5@mojo.amd.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4647796841291567106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

7cd78129d06e3c8fd47eaab4ff seems to have introduced an issue with ubuntu-18=
.04.
The patch changes the install dependencies for ubuntu to perl-modules-5.28 =
and
libperl5.28 from 5.26. However, ubuntu-18.04 repos seem to only contain ver=
sion
5.26. Is ubuntu 18.04 not a supported distro? If it is supported, it seems =
that
we will need a way to specify to install whichever version of the package is
available. Ideally, it would be nice to be able to specify something like
"perl-modules >=3D 5.26", but the current method of installing packages doe=
sn't
seem to be equipped to handle that sort of thing.

Thanks,
John

--===============4647796841291567106==--

