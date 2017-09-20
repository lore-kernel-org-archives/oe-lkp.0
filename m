Content-Type: multipart/mixed; boundary="===============3326902065655905888=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: 7898f79654 ("x86/mm/64: Fix an incorrect warning with CONFIG_DEBUG_VM=y, !PCID"): WARNING: CPU: 0 PID: 0 at arch/x86/mm/tlb.c:245 initialize_tlbstate_and_flush
Date: Wed, 20 Sep 2017 08:26:16 -0700
Message-ID: <1F539A81-A75B-4708-820F-3A892C139C59@amacapital.net>
In-Reply-To: <20170920112204.k2j3xt6lb5m5mybt@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3326902065655905888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


> On Sep 20, 2017, at 4:22 AM, Fengguang Wu <fengguang.wu@intel.com> wrot=
e:
> =

> Hi Andy,
> =

> Your patch triggers the warning (not 100% reproducible) with the
> attached kconfig and KVM reproduce script. It may be relevant to an
> old bug though, since the dmesg is not clean and contains another BUG
> trace dump.

This should be fixed in tip/urgent now.  If you continue to see this proble=
m, please let me know.

> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 7898f79654698dcea5a0876785796de67d527ee7
> Author:     Andy Lutomirski <luto@kernel.org>
> AuthorDate: Sun Sep 10 08:52:58 2017 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Sun Sep 10 09:55:35 2017 -0700
> =

>     x86/mm/64: Fix an incorrect warning with CONFIG_DEBUG_VM=3Dy, !PCID
> =

>     I've been staring at the word PCID too long.
> =

>     Fixes: f13c8e8c58ba ("x86/mm: Reinitialize TLB state on hotplug and r=
esume")
>     Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
>     Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> =

> 4dfc278803  Merge tag 'iommu-updates-v4.14' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/joro/iommu
> 7898f79654  x86/mm/64: Fix an incorrect warning with CONFIG_DEBUG_VM=3Dy,=
 !PCID
> 0666f560b7  Merge branch 'core-urgent-for-linus' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tip/tip
> fc2e8b1a47  Add linux-next specific files for 20170918
> +-------------------------------------------------------------+----------=
--+------------+------------+---------------+
> |                                                             | 4dfc27880=
3 | 7898f79654 | 0666f560b7 | next-20170918 |
> +-------------------------------------------------------------+----------=
--+------------+------------+---------------+
> | boot_successes                                              | 6        =
  | 4          | 2          | 5             |
> | boot_failures                                               | 58       =
  | 12         | 37         | 12            |
> | BUG:workqueue_lockup-pool                                   | 58       =
  | 11         | 37         | 10            |
> | WARNING:at_arch/x86/mm/tlb.c:#initialize_tlbstate_and_flush | 0        =
  | 12         | 32         | 8             |
> | EIP:initialize_tlbstate_and_flush                           | 0        =
  | 12         | 32         | 8             |
> | BUG:soft_lockup-CPU##stuck_for#s                            | 0        =
  | 1          | 0          | 2             |
> | EIP:lock_acquire                                            | 0        =
  | 1          | 0          | 1             |
> | Kernel_panic-not_syncing:softlockup:hung_tasks              | 0        =
  | 1          | 0          | 2             |
> | EIP:lock_release                                            | 0        =
  | 0          | 0          | 1             |
> +-------------------------------------------------------------+----------=
--+------------+------------+---------------+
> =

> [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 byt=
es)
> [    0.000000] Initializing CPU#0
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: CPU: 0 PID: 0 at arch/x86/mm/tlb.c:245 initialize=
_tlbstate_and_flush+0xf0/0x100
> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.13.0-10313-g7898=
f79 #2
> [    0.000000] task: c2433fc0 task.stack: c2428000
> [    0.000000] EIP: initialize_tlbstate_and_flush+0xf0/0x100
> [    0.000000] EFLAGS: 00210046 CPU: 0
> [    0.000000] EAX: 02773000 EBX: c2599fa0 ECX: c2773000 EDX: 00000000
> [    0.000000] ESI: 00000000 EDI: 00000000 EBP: c2429f7c ESP: c2429f40
> [    0.000000]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> [    0.000000] CR0: 80050033 CR2: 00000000 CR3: 02773000 CR4: 00040690
> [    0.000000] Call Trace:
> [    0.000000]  ? cpu_init+0xbc/0x230
> [    0.000000]  ? trap_init+0x46/0x5c
> [    0.000000]  ? start_kernel+0x2b1/0x4d9
> [    0.000000]  ? set_init_arg+0x8e/0x8e
> [    0.000000]  ? startup_32_smp+0x15f/0x161
> [    0.000000] Code: 15 ac 9f 44 c2 c7 01 00 00 00 00 c7 41 04 00 00 00 0=
0 8b 04 24 ff 15 a8 9f 44 c2 83 c1 10 81 f9 ec a0 44 c2 75 d0 58 5b 5e 5f c=
3 <0f> ff e9 58 ff ff ff 0f ff e9 31 ff ff ff 66 90 c3 eb 0d 90 90
> [    0.000000] ---[ end trace 1af372c46ad40bb0 ]---
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e v4.13 --
> git bisect good 3aea311c1b4002bd730a09530f80f2f2ad3bf495  # 11:39  G     =
11     0   10  11  genksyms: fix gperf removal conversion
> git bisect  bad 6d8ef53e8b2fed8b0f91df0c6da7cc92747d934a  # 11:53  B     =
 0     5   37   9  Merge tag 'f2fs-for-4.14' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/jaegeuk/f2fs
> git bisect  bad d719518d9ce9132bad8a06e8029aeead328f66a3  # 12:13  B     =
 0     2   14   0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/dave=
m/sparc-next
> git bisect good 66ba772ee3119849fcdd8ac9766c6c25ede4a982  # 12:33  G     =
11     0   11  20  Merge branch 'for-4.14' of git://git.kernel.org/pub/scm/=
linux/kernel/git/kdave/linux
> git bisect good 7151202b64c8c5eb163e41fa0adcb8239eea64aa  # 12:53  G     =
11     0   11  13  Merge tag 'rpmsg-v4.14' of git://github.com/andersson/re=
moteproc
> git bisect good 4dfc2788033d30dfccfd4268e06dd73ce2c654ed  # 13:14  G     =
11     0   11  26  Merge tag 'iommu-updates-v4.14' of git://git.kernel.org/=
pub/scm/linux/kernel/git/joro/iommu
> git bisect  bad 7898f79654698dcea5a0876785796de67d527ee7  # 13:29  B     =
 0     7   21   1  x86/mm/64: Fix an incorrect warning with CONFIG_DEBUG_VM=
=3Dy, !PCID
> # first bad commit: [7898f79654698dcea5a0876785796de67d527ee7] x86/mm/64:=
 Fix an incorrect warning with CONFIG_DEBUG_VM=3Dy, !PCID
> git bisect good 4dfc2788033d30dfccfd4268e06dd73ce2c654ed  # 13:52  G     =
33     0   32  58  Merge tag 'iommu-updates-v4.14' of git://git.kernel.org/=
pub/scm/linux/kernel/git/joro/iommu
> # extra tests on HEAD of jpirko-mlxsw/jiri_devel_linak
> git bisect  bad 3fdbd4dc0393b593cc458812adb1aec6319dcf14  # 13:52  B     =
 0    12   34   4  UNFI: actuator: introduce Actuonix Linear Actuator Contr=
ol Board support
> # extra tests on tree/branch linus/master
> git bisect  bad 0666f560b71b899cd11a7caf39fd45129e9030fd  # 14:05  B     =
 0     5   21   4  Merge branch 'core-urgent-for-linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/tip/tip
> # extra tests with first bad commit reverted
> git bisect good 3964f2e324e6c24ec357aa86b38d4d9e2a653da5  # 14:31  G     =
11     0   11  11  Revert "x86/mm/64: Fix an incorrect warning with CONFIG_=
DEBUG_VM=3Dy, !PCID"
> # extra tests on tree/branch linux-next/master
> git bisect  bad fc2e8b1a47c14b22c33eb087fca0db58e1f4ed0e  # 14:44  B     =
 0     6   27   5  Add linux-next specific files for 20170918
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> <dmesg-yocto-ivb41-92:20170918132326:i386-randconfig-i0-201738:4.13.0-103=
13-g7898f79:2.gz>
> <dmesg-openwrt-lkp-hsw01-102:20170918131202:i386-randconfig-i0-201738:4.1=
3.0-10312-g4dfc278:33.gz>
> <reproduce-yocto-ivb41-92:20170918132326:i386-randconfig-i0-201738:4.13.0=
-10313-g7898f79:2>
> <config-4.13.0-10313-g7898f79>

--===============3326902065655905888==--

