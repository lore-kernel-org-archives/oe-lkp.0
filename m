Content-Type: multipart/mixed; boundary="===============8331698323421438721=="
MIME-Version: 1.0
From: Li, Philip <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 77ef56e4f0 ("x86: Enable 5-level paging support via CONFIG_X86_5LEVEL=y"): BUG: kernel hang in early-boot stage, last printk: Unable to boot - please use a kernel appropriate for your CPU.
Date: Thu, 05 Oct 2017 04:46:47 +0000
Message-ID: <831EE4E5E37DCC428EB295A351E662494C870690@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <20171004003603.g65od772xezl2dpf@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8331698323421438721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Subject: Re: 77ef56e4f0 ("x86: Enable 5-level paging support via
> CONFIG_X86_5LEVEL=3Dy"): BUG: kernel hang in early-boot stage, last print=
k:
> Unable to boot - please use a kernel appropriate for your CPU.
> =

> Philip, would you make this P1 priority?
sure, this looks to have wide impact. I update the deps cgz for 0day-boot-t=
ests,
and boot servers are rebooted one by one.

root(a)lkp-nex04 ~# qemu-system-x86_64 --version
QEMU emulator version 2.10.0(Debian 1:2.10.0+dfsg-1)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers
root(a)lkp-nex04 ~# qemu-system-i386 --version
QEMU emulator version 2.10.0(Debian 1:2.10.0+dfsg-1)
Copyright (c) 2003-2017 Fabrice Bellard and the QEMU Project developers

> =

> This issue effectively disabled a large portion of our boot tests.
> =

> On Tue, Sep 26, 2017 at 09:45:28AM +0800, LKP wrote:
> >On Tue, Sep 26, 2017 at 09:25:56AM +0800, Fengguang Wu wrote:
> >>FYI. We'll either need to upgrade to qemu-2.9 (which supports 5-level
> >>paging) or disable CONFIG_X86_5LEVEL.
> >
> >We may either install packages here:
> >
> >https://debian.pkgs.org/sid/debian-main-amd64/qemu_2.10.0+dfsg-
> 1_amd64.deb.html
> >
> >or use custom build qemu by 0day:
> >
> >inn:/pkg/qemu/x86_64-softmmu/
> >
> >Thanks,
> >Fengguang

--===============8331698323421438721==--

