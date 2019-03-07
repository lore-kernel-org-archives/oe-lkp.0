Content-Type: multipart/mixed; boundary="===============1963167423080415995=="
MIME-Version: 1.0
From: Alexey Dobriyan <adobriyan@gmail.com>
To: lkp@lists.01.org
Subject: Re: [proc] 3f02daf340: kernel_selftests.proc.proc-pid-vm.fail
Date: Thu, 07 Mar 2019 21:12:56 +0300
Message-ID: <20190307181256.GA10410@avx2>
In-Reply-To: <20190219094722.GB28258@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1963167423080415995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> selftests: proc: proc-pid-vm
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> proc-pid-vm: proc-pid-vm.c:277: main: Assertion `rv =3D=3D strlen(buf0)' =
failed.
> Aborted

vsyscall mapping enabled, I'll post patch shortly.

--===============1963167423080415995==--

