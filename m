Content-Type: multipart/mixed; boundary="===============5865680099672984418=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: b614345f52 ("x86/entry: Clarify irq_{enter, exit}_rcu()"): WARNING: CPU: 0 PID: 0 at kernel/locking/lockdep.c:3680 lockdep_hardirqs_on_prepare
Date: Wed, 03 Jun 2020 12:23:56 +0200
Message-ID: <87v9k8fnwj.fsf@nanos.tec.linutronix.de>
In-Reply-To: <5ed39ad2.0a1dg5gg0oNfWJPp%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5865680099672984418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <lkp@intel.com> writes:
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
> #!/bin/bash
>
> kernel=3D$1
> initrd=3Dyocto-x86_64-trinity.cgz
>
> wget --no-clobber https://download.01.org/0day-ci/lkp-qemu/osimage/yocto/=
$initrd

That results in a 404. Still the same problem as months ago.

initrd=3Dyocto-trinity-x86_64.cgz

works ....
--===============5865680099672984418==--

