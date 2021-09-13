Content-Type: multipart/mixed; boundary="===============0372240309738321467=="
MIME-Version: 1.0
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: lkp@lists.01.org
Subject: Re: [mctp] 831119f887: net/mctp/route.c:#RCU-list_traversed_in_non-reader_section
Date: Mon, 13 Sep 2021 11:52:51 +0800
Message-ID: <b670e63f5c7dd365b00ab235e36a2cbf0208ed3e.camel@codeconstruct.com.au>
In-Reply-To: <ec1e993a5856f6b687f934792003612da523069d.camel@codeconstruct.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============0372240309738321467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi LKPers,

> FYI, we noticed the following commit (built with gcc-9):

[snip]

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cd linux
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cp config-5.14.0-rc2-0060=
9-g831119f88781 .config
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3D=
gcc-9 ARCH=3Dx86_64 olddefconfig prepare
> modules_prepare bzImage
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImage> job-=
script # job-script is attached
> in this email

This gives me:

  [jk(a)pecola lkp-tests]$ bin/lkp qemu -o results -k bzImage job-script =

  11 blocks
  downloading initrds ...
  /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tps://download.01.org/0day-ci/lkp-qemu/osimage/debian/debian-10.4-x86_64-20=
200603.cgz -N -P /home/jk/.lkp/cache/osimage/debian
  440459 blocks
  /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tps://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-10.4-x86_64-2020=
0603.cgz/run-ipconfig_20200608.cgz -N -P /home/jk/.lkp/cache/osimage/deps/d=
ebian-10.4-x86_64-20200603.cgz
  1773 blocks
  /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tps://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-10.4-x86_64-2020=
0603.cgz/lkp_20210707.cgz -N -P /home/jk/.lkp/cache/osimage/deps/debian-10.=
4-x86_64-20200603.cgz
  2321 blocks
  /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tps://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-10.4-x86_64-2020=
0603.cgz/rsync-rootfs_20200608.cgz -N -P /home/jk/.lkp/cache/osimage/deps/d=
ebian-10.4-x86_64-20200603.cgz
  6856 blocks
  /usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 ht=
tps://download.01.org/0day-ci/lkp-qemu/osimage/pkg/debian-10.4-x86_64-20200=
603.cgz/trinity-x86_64-b1a0aef9-1_20210908.cgz -N -P /home/jk/.lkp/cache/os=
image/pkg/debian-10.4-x86_64-20200603.cgz
  Failed to download osimage/pkg/debian-10.4-x86_64-20200603.cgz/trinity-x8=
6_64-b1a0aef9-1_20210908.cgz

I'm seeing a 404 on that URL: there's no
trinity-x86_64-b1a0aef9-1_20210908.cgz in the
osimage/pkg/debian-<version>/ directory there, only a 20210905 one.

If I modify the job-script to use that 20210905 payload instead to get
things working, it looks like no tests are run, as we're missing some
lkp init infrastructure too:

  Starting LKP bootstrap...
  [  239.132159] rc.local[723]: /etc/init.d/lkp-bootstrap: 75: /etc/init.d/=
lkp-bootstrap: /lkp/root/src/bin/lkp-setup-rootfs: not found

is there something on the host-side that I've missed?

Cheers,


Jeremy

--===============0372240309738321467==--

