Content-Type: multipart/mixed; boundary="===============5415563295786358591=="
MIME-Version: 1.0
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: lkp@lists.01.org
Subject: Re: [vrf] 2ef23e860e: kernel-selftests.net.fcnal-test.sh.fail
Date: Mon, 22 Aug 2022 14:15:50 +0700
Message-ID: <c9451365-e582-3bb0-0180-462d0a4069ed@gnuweeb.org>
In-Reply-To: <532c4311-ada3-05c7-bc63-b5cb2d32ca1a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5415563295786358591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/22/22 2:03 PM, kernel test robot wrote:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/group/test/atomic_test/ucode:
>  =C2=A0 lkp-skl-d01/kernel-selftests/debian-12-x86_64-20220629.cgz/x86_64=
-rhel-8.3-kselftests/gcc-11/net/fcnal-test.sh/use_cases/0xf0
> =

> commit:
>  =C2=A0 cae90bd22cffb ("net: bridge: vlan: fix error return code in __vla=
n_add()")
>  =C2=A0 2ef23e860e765 ("vrf: packets with lladdr src needs dst at input w=
ith orig_iif when needs strict")
> =

> cae90bd22cffb1e1 2ef23e860e765eb1dd287492206
> ---------------- ---------------------------
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fail:runs=C2=A0 %reproduction=C2=A0=
=C2=A0=C2=A0 fail:runs
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :6=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 100%=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6:6=C2=A0=C2=A0=C2=A0=C2=A0 kernel-sel=
ftests.net.fcnal-test.sh.fail
> =

> =

> FYI, we noticed that this is a backport commit of upstream 205704c618af0a=
b2366015d2281a3b0814d918a0
> (merged by v5.10), so we also test this case on mainline, and this issue =
doesn't exist.

Can you test the latest linux-5.4.y branch and see whether the issue
exists on there?

You can pull from:

   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git linux-5=
.4.y

The HEAD commit is:

    de0cd3ea700d1e8ed76705d02e33b524cbb84cf3 ("Linux 5.4.210")

-- =

Ammar Faizi
--===============5415563295786358591==--

