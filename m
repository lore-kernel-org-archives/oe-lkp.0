Content-Type: multipart/mixed; boundary="===============6623999393372714289=="
MIME-Version: 1.0
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] kernel/watchdog_hld.c: Fix access percpu in preemptible context
Date: Sat, 19 Dec 2020 23:02:14 +0800
Message-ID: <20201219150214.16854-1-lecopzer.chen@mediatek.com>
In-Reply-To: <20201219135917.GA26344@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6623999393372714289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BRs,
Lecopzer


> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 6e37d53a67753bcb12a0b9102cac85d98f8a0453 ("[PATCH] kernel/watchdo=
g_hld.c: Fix access percpu in preemptible context")
> url: https://github.com/0day-ci/linux/commits/Lecopzer-Chen/kernel-watchd=
og_hld-c-Fix-access-percpu-in-preemptible-context/20201217-211549
> base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git acc=
efff5b547a9a1d959c7e76ad539bf2480e78b
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>=20
--===============6623999393372714289==--

