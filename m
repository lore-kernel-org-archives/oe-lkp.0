Content-Type: multipart/mixed; boundary="===============8594085026895947828=="
MIME-Version: 1.0
From: Stefano Brivio <sbrivio@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [vti6] b4331a6818: kernel_selftests.net.pmtu.sh.fail
Date: Tue, 05 Jun 2018 11:08:36 +0200
Message-ID: <20180605110836.4307eb3c@epycfail>
In-Reply-To: <20180605070927.GN16472@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8594085026895947828==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 5 Jun 2018 15:09:27 +0800
kernel test robot <xiaolong.ye@intel.com> wrote:

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: b4331a681822b420511b3258f1c3db35001fde48 ("vti6: Change minimum M=
TU to IPV4_MIN_MTU, vti6 can carry IPv4 too")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> [...]
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> selftests: pmtu.sh
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> TEST: vti6: PMTU exceptions                                         [ OK ]
> TEST: vti4: PMTU exceptions                                         [ OK ]
> TEST: vti4: default MTU assignment                                  [ OK ]
> TEST: vti6: default MTU assignment                                  [ OK ]
> TEST: vti4: MTU setting on link creation                            [ OK ]
> TEST: vti6: MTU setting on link creation                            [FAIL]
>   vti6 tunnel created with invalid MTU 1279

This is solved by net-next.git commit 5a643c861d0f ("selftests: pmtu:
Minimum MTU for vti6 is 68"), which should get merged into net.git soon.

-- =

Stefano

--===============8594085026895947828==--

