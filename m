Content-Type: multipart/mixed; boundary="===============0238947786101524944=="
MIME-Version: 1.0
From: Matt Fleming <matt.fleming@intel.com>
To: lkp@lists.01.org
Subject: Re: [dmi] PANIC: early exception 0e rip 10:ffffffff81899e6b error 9 cr2 ffffffffff240000
Date: Fri, 07 Nov 2014 09:36:06 +0000
Message-ID: <1415352966.14686.101.camel@mfleming-mobl1.ger.corp.intel.com>
In-Reply-To: <20141107092651.GE24745@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0238947786101524944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2014-11-07 at 17:26 +0800, Yuanhan Liu wrote:
> =

> Here is the output:
> =

> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] =3D=3D=3D=3D=3D=3D Decoding _DMI_ header:
> [    0.000000] 5f 44 4d 49 5f 48 a3 0b 00 20 60 8f 3e 00 25 00 =

> [    0.000000] =3D=3D=3D=3D=3D=3D Remapped SMBIOS table 0xffffffff8f60200=
0 at ffffffffff240000, size 0xba3, num 0x3e

Smells like a sign extension issue. Previously how could dmi_base (u32)
hold 0xffffffff8f602000?


--===============0238947786101524944==--

