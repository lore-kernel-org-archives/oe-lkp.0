Content-Type: multipart/mixed; boundary="===============8801155049001868419=="
MIME-Version: 1.0
From: Berg, Johannes <johannes.berg@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [cfg80211] 90a53e4432: kmsg.cfg80211:Problem_loading_in-kernel_X.#certificate(-#)
Date: Thu, 26 Oct 2017 08:38:11 +0000
Message-ID: <1DC40B07CD6EC041A66726C271A73AE678E89C38@IRSMSX108.ger.corp.intel.com>
In-Reply-To: <20171025163149.GJ3294@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8801155049001868419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: 90a53e4432b12288316efaa5f308adafb8d304b0 ("cfg80211:
> implement regdb signature checking")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: syzkaller
> with following parameters:
> =

> 	runtime: 10
> 	repro_program: repro-9684fa3c
> =

> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> [    1.128131] cfg80211: Problem loading in-kernel X.509 certificate (-19)

Thanks for the report. Looks like there's an ordering problem when this isn=
't built as modules, and the key type only gets registered after cfg80211 r=
egistration.

I'll look at fixing this as soon as I can, but it might be a while as I'll =
be travelling soon.

johannes
Intel Deutschland GmbH
Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Christin Eisenschmid, Christian Lamprechter
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928


--===============8801155049001868419==--

