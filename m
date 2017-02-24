Content-Type: multipart/mixed; boundary="===============5755471216906924921=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [Merge branch 'core-debugobjects-for-linus' of git] 575260e3f8: WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrtimer_init
Date: Fri, 24 Feb 2017 14:37:04 -0800
Message-ID: <CA+55aFyB9eYm+DB_nDONh-T93pBYF1gLoGrDy_qMFMuRfV6-_g@mail.gmail.com>
In-Reply-To: <58afd688.ylLbFUtdb1efyToQ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5755471216906924921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This looks like two -tip trees together show some issue - the timer
updates from Thomas triggering a debugobjects check from Ingo, thus
fingering my merge as the culprit.

Added Thomas/Ingo to the cc, leaving everything quoted for their
edification and enjoyment.

           Linus

On Thu, Feb 23, 2017 at 10:45 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit 575260e3f8f8ac72dc0c41a4a20190d1a5f2b887
> Merge: 1cd4027 0cad93c3
> Author:     Linus Torvalds <torvalds@linux-foundation.org>
> AuthorDate: Mon Feb 20 11:19:09 2017 -0800
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Mon Feb 20 11:19:09 2017 -0800
>
>     Merge branch 'core-debugobjects-for-linus' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/tip/tip
>
>     Pull debugobjects updates from Ingo Molnar:
>      "A number of scalability improvements by Waimang Long"
>
>     * 'core-debugobjects-for-linus' of git://git.kernel.org/pub/scm/linux=
/kernel/git/tip/tip:
>       debugobjects: Improve variable naming
>       debugobjects: Reduce contention on the global pool_lock
>       debugobjects: Scale thresholds with # of CPUs
>       debugobjects: Track number of kmem_cache_alloc/kmem_cache_free done
>
> 1cd4027cfe  Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub=
/scm/linux/kernel/git/tip/tip
> 0cad93c345  debugobjects: Improve variable naming
> 575260e3f8  Merge branch 'core-debugobjects-for-linus' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip
> +------------------------------------------------+------------+----------=
--+------------+
> |                                                | 1cd4027cfe | 0cad93c34=
5 | 575260e3f8 |
> +------------------------------------------------+------------+----------=
--+------------+
> | boot_successes                                 | 202        | 90       =
  | 0          |
> | boot_failures                                  | 0          | 2        =
  | 26         |
> | invoked_oom-killer:gfp_mask=3D0x                 | 0          | 2      =
    | 1          |
> | Mem-Info                                       | 0          | 2        =
  | 1          |
> | WARNING:at_kernel/time/hrtimer.c:#hrtimer_init | 0          | 0        =
  | 26         |
> +------------------------------------------------+------------+----------=
--+------------+
>
> [    6.585095] usbcore: registered new interface driver rndis_wlan
> [    6.586060] mac80211_hwsim: initializing netlink
> [    6.587805] ieee80211 phy0: Selected rate control algorithm 'minstrel_=
ht'
> [    6.589765] ieee80211 phy0: hwaddr 02:00:00:00:00:00 registered
> [    6.590718] ------------[ cut here ]------------
> [    6.591473] WARNING: CPU: 0 PID: 1 at kernel/time/hrtimer.c:1090 hrtim=
er_init+0x11f/0x199
> [    6.592949] Invalid clockid 4. Using MONOTONIC
> [    6.593646] Modules linked in:
> [    6.594202] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.10.0-00312-g57=
5260e3 #2
> [    6.595371] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [    6.596852] Call Trace:
> [    6.597330]  dump_stack+0x82/0xb8
> [    6.597908]  __warn+0xc2/0xdd
> [    6.598446]  warn_slowpath_fmt+0x4b/0x53
> [    6.599090]  ? lock_is_held_type+0x4b/0x54
> [    6.599748]  hrtimer_init+0x11f/0x199
> [    6.600372]  ? mac80211_hwsim_get_tsf+0x1d/0x1d
> [    6.601089]  tasklet_hrtimer_init+0x1b/0x4f
> [    6.601758]  mac80211_hwsim_new_radio+0x7fe/0x916
> [    6.602491]  ? set_debug_rodata+0x12/0x12
> [    6.603149]  init_mac80211_hwsim+0x138/0x29f
> [    6.603834]  ? rndis_wlan_driver_init+0x1b/0x1b
> [    6.604542]  do_one_initcall+0x90/0x142
> [    6.605176]  ? set_debug_rodata+0x12/0x12
> [    6.605833]  kernel_init_freeable+0x1cb/0x258
> [    6.606522]  ? rest_init+0x13b/0x13b
> [    6.607126]  kernel_init+0xe/0xf5
> [    6.607693]  ret_from_fork+0x31/0x40
> [    6.608341] ---[ end trace e131c19313689169 ]---
> [    6.609819] ieee80211 phy1: Selected rate control algorithm 'minstrel_=
ht'
>
> git bisect start 37c85961c3f87f2141c84e53df31e59db072fd2e v4.10 --
> git bisect  bad fd4a61e08aa79f2b7835b25c6f94f27bd2d65990  # 03:55      0-=
     10  sched/core: Fix build paravirt build on arm and arm64
> git bisect  bad 280d7a1edef214eefb1cb34915c73767355dd1b3  # 04:24      0-=
      6  Merge branch 'x86-fpu-for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tip/tip
> git bisect  bad 32e2d7c8afb35d59fbf7d96619538427568ecb68  # 05:02      0-=
      3  Merge branch 'efi-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect good c9b9f207b90468bf9583f7ed71c15d0142bbf9b1  # 05:06     20+=
      1  Merge tag 'for-v4.11' of git://git.kernel.org/pub/scm/linux/kernel=
/git/sre/linux-power-supply
> git bisect good 1cd4027cfe33390dc3f442aea8e7caeeeaa861a1  # 07:19     22+=
      0  Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad 575260e3f8f8ac72dc0c41a4a20190d1a5f2b887  # 07:37      0-=
     16  Merge branch 'core-debugobjects-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/tip/tip
> git bisect good 97dd552eb23c83dbf626a6e84666c7e281375d47  # 12:59     22+=
      0  debugobjects: Scale thresholds with # of CPUs
> git bisect good 0cad93c3453fc9d11692d3924ac3a520821bbf64  # 14:11     22+=
      0  debugobjects: Improve variable naming
> # first bad commit: [575260e3f8f8ac72dc0c41a4a20190d1a5f2b887] Merge bran=
ch 'core-debugobjects-for-linus' of git://git.kernel.org/pub/scm/linux/kern=
el/git/tip/tip
> git bisect good 1cd4027cfe33390dc3f442aea8e7caeeeaa861a1  # 14:16     66+=
      0  Merge branch 'irq-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect good 0cad93c3453fc9d11692d3924ac3a520821bbf64  # 14:21     66+=
      2  debugobjects: Improve variable naming
> # extra tests on HEAD of linux-review/Ming-Lei/MAINTAINERS-update-firmwar=
e-loader-entry/20170223-095208
> git bisect  bad e9a88fe6c1f018d34f582d59734f1e7da31ef9cd  # 14:21      0-=
     21  MAINTAINERS: update firmware loader entry
> # extra tests on tree/branch linus/master
> git bisect  bad f1ef09fde17f9b77ca1435a5b53a28b203afb81c  # 14:40      0-=
     39  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/ebiederm/user-namespace
> # extra tests on tree/branch linux-next/master
> git bisect  bad 27fde840c0aaca31213844b8bc914281cdb101fa  # 14:45      0-=
     26  Add linux-next specific files for 20170223
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============5755471216906924921==--

