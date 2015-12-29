Content-Type: multipart/mixed; boundary="===============4747127335365801092=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [memdup_user_nul] kernel BUG at mm/slab.c:2735!
Date: Tue, 29 Dec 2015 20:38:43 +0800
Message-ID: <20151229123843.GA4678@wfg-t540p.sh.intel.com>
In-Reply-To: <87ege74bom.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4747127335365801092==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Al,

It looks this patch has various impacts. Here are some more bug messages.

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.misc

commit c7af9d5728bed29ef614324e67e066896d087c8f
Author:     Al Viro <viro@zeniv.linux.org.uk>
AuthorDate: Thu Dec 24 00:13:10 2015 -0500
Commit:     Al Viro <viro@zeniv.linux.org.uk>
CommitDate: Thu Dec 24 10:52:16 2015 -0500

    kernel/*: switch to memdup_user_nul()
    =

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

+------------------------------------------+------------+------------+-----=
-------+
|                                          | c4af5f8aed | c7af9d5728 | e391=
21f54a |
+------------------------------------------+------------+------------+-----=
-------+
| boot_successes                           | 63         | 12         | 9   =
       |
| boot_failures                            | 0          | 10         | 10  =
       |
| kernel_BUG_at_mm/slab.c                  | 0          | 10         | 10  =
       |
| invalid_opcode:#[##]                     | 0          | 10         | 10  =
       |
| RIP:cache_free_debugcheck                | 0          | 10         | 10  =
       |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 10         | 10  =
       |
| backtrace:vfs_write                      | 0          | 10         | 10  =
       |
| backtrace:SyS_write                      | 0          | 10         | 10  =
       |
+------------------------------------------+------------+------------+-----=
-------+

[   12.900517] init: Failed to create pty - disabling logging for job
[   12.901337] init: Temporary process spawn error: No space left on device
[   12.982980] ------------[ cut here ]------------
[   12.983551] kernel BUG at mm/slab.c:2735!
[   12.984240] invalid opcode: 0000 [#1] =

[   12.984705] CPU: 0 PID: 219 Comm: sysctl Not tainted 4.4.0-rc4-00029-gc7=
af9d5 #1
[   12.985577] task: ffff8800118de640 ti: ffff8800118e0000 task.ti: ffff880=
0118e0000
[   12.986459] RIP: 0010:[<ffffffff81265a6e>]  [<ffffffff81265a6e>] cache_f=
ree_debugcheck+0x27e/0x450
[   12.987524] RSP: 0018:ffff8800118e3cb8  EFLAGS: 00010002
[   12.988148] RAX: ffff8800123ab200 RBX: ffff8800123ab208 RCX: 00000000000=
00004
[   12.988985] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff840=
c97b0
[   12.989824] RBP: ffff8800118e3cf8 R08: ffff88001024c480 R09: 00000000000=
00007
[   12.990658] R10: 0000000000000002 R11: ffff8800118e3d78 R12: ffff8800100=
00140
[   12.991489] R13: 0000000000000008 R14: ffffea00003fcd68 R15: 00000000000=
00003
[   12.992322] FS:  00007fc8ff1bc700(0000) GS:ffffffff83e2b000(0000) knlGS:=
0000000000000000
[   12.993264] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   12.993926] CR2: 00007fc8ff1be000 CR3: 0000000011800000 CR4: 00000000000=
006b0
[   12.994751] Stack:
[   12.994992]  0000000000000000 ffff8800100011f8 ffff8800123ab200 00000000=
00000282
[   12.995898]  ffff8800123ab208 ffff880011493020 ffffffff81135b6d ffff8800=
10000140
[   12.996803]  ffff8800118e3d30 ffffffff81268ceb 0000000000000000 00000000=
00000000
[   12.997708] Call Trace:
[   12.998003]  [<ffffffff81135b6d>] ? __do_proc_dointvec+0x37d/0x510
[   12.998724]  [<ffffffff81268ceb>] kfree+0x19b/0x2d0
[   12.999293]  [<ffffffff81135b6d>] __do_proc_dointvec+0x37d/0x510
[   12.999986]  [<ffffffff81135e18>] proc_dointvec+0x38/0x40
[   13.000614]  [<ffffffff811345e0>] ? resource_list_free+0x50/0x50
[   13.001313]  [<ffffffff813273c6>] proc_sys_call_handler+0x126/0x160
[   13.002035]  [<ffffffff81327414>] proc_sys_write+0x14/0x20
[   13.002673]  [<ffffffff812867a0>] __vfs_write+0x40/0x190
[   13.003291]  [<ffffffff8128b480>] ? __sb_start_write+0xe0/0x170
[   13.003972]  [<ffffffff81286c25>] vfs_write+0x1c5/0x320
[   13.004580]  [<ffffffff81286ef2>] SyS_write+0x62/0x110
[   13.005175]  [<ffffffff82bb5873>] entry_SYSCALL_64_fastpath+0x16/0x7a
[   13.005932] Code: 0f 95 c7 31 d2 45 0f b6 ff 44 89 fe 49 83 c7 02 e8 18 =
b5 f7 ff 48 8b 45 d0 4a 83 04 fd 28 f3 2c 84 01 48 39 c3 0f 84 d4 00 00 00 =
<0f> 0b 48 b8 00 00 00 00 00 78 00 00 48 01 d8 e9 90 fe ff ff 48 =

[   13.008992] RIP  [<ffffffff81265a6e>] cache_free_debugcheck+0x27e/0x450
[   13.009778]  RSP <ffff8800118e3cb8>
[   13.010190] ---[ end trace 9689f67a5733e394 ]---
[   13.010734] Kernel panic - not syncing: Fatal exception

git bisect start e39121f54a77d2b1536cd2924347b9b106ddfbea 4ef7675344d687a0e=
f5b0d7c0cee12da005870c0 --
git bisect  bad d147a8ed3ab35f67adb2de64ec50c31265782b24  # 15:36      0-  =
    6  Merge 'linux-review/SF-Markus-Elfring/gpio-ucb1400-Delete-an-unneces=
sary-variable-initialisation-in-ucb1400_gpio_probe/20151226-025155' into de=
vel-spot-201512261453
git bisect  bad d6fda4209fcf205c9401cce1948b8570218a3b6d  # 15:44      0-  =
    2  Merge 'linux-review/Martin-Blumenstingl/net-phy-at803x-Don-t-set-gbi=
t-features-for-the-AR8030-phy/20151226-083323' into devel-spot-201512261453
git bisect good 6df2275ce5a3901a015a28cc9f20d297f2bbebd6  # 15:58     22+  =
    2  Merge 'linux-review/Zhi-zhou-Zhang/arm64-entry-S-add-missing-trace_h=
ardirqs_off/20151226-140037' into devel-spot-201512261453
git bisect  bad f396b9fc5242d2c04440a85b4ad70ebc982f2b3f  # 16:05      0-  =
    5  Merge 'vfs/work.misc' into devel-spot-201512261453
git bisect good 57e3715cfa3fb01581555934d7191f8eabf740f4  # 16:23     22+  =
    0  typo in fs/namei.c comment
git bisect good b808b1d632f6915e4d6b1badb927b2c970ad11bb  # 16:42     22+  =
    0  don't open-code generic_file_llseek_size()
git bisect good af26a3456b8549149544fc5bad6b7c364653e787  # 16:52     22+  =
    0  selinuxfs: switch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 17:06     22+  =
    0  cciss: switch to memdup_user_nul()
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 17:14      0-  =
    9  kernel/*: switch to memdup_user_nul()
# first bad commit: [c7af9d5728bed29ef614324e67e066896d087c8f] kernel/*: sw=
itch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 17:18     61+  =
    0  cciss: switch to memdup_user_nul()
# extra tests with DEBUG_INFO
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 17:24      0-  =
    1  kernel/*: switch to memdup_user_nul()
# extra tests on HEAD of linux-devel/devel-spot-201512261453
git bisect  bad e39121f54a77d2b1536cd2924347b9b106ddfbea  # 17:25      0-  =
   10  0day head guard for 'devel-spot-201512261453'
# extra tests on tree/branch vfs/work.misc
git bisect  bad 15d8d69accf88da38aac73dd873ce56fd39b358a  # 17:30      0-  =
   10  saner calling conventions for copy_mount_options()
# extra tests with first bad commit reverted
git bisect good 241dc6cc888af8cc59a6e1c3ddd4ee2e0da6d00d  # 17:39     66+  =
    0  Revert "kernel/*: switch to memdup_user_nul()"
# extra tests on tree/branch linus/master
git bisect good 8db7b3c54401d83a4dc370a59b8692854000ea03  # 17:55     60+  =
    2  Merge branch 'parisc-4.4-4' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/deller/parisc-linux
# extra tests on tree/branch linux-next/master


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dquantal-core-x86_64.cgz

wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/mas=
ter/initrd/$initrd

kvm=3D(
	qemu-system-x86_64
	-enable-kvm
	-cpu kvm64
	-kernel $kernel
	-initrd $initrd
	-m 300
	-smp 2
	-device e1000,netdev=3Dnet0
	-netdev user,id=3Dnet0
	-boot order=3Dnc
	-no-reboot
	-watchdog i6300esb
	-rtc base=3Dlocaltime
	-serial stdio
	-display none
	-monitor null =

)

append=3D(
	hung_task_panic=3D1
	earlyprintk=3DttyS0,115200
	systemd.log_level=3Derr
	debug
	apic=3Ddebug
	sysrq_always_enabled
	rcupdate.rcu_cpu_stall_timeout=3D100
	panic=3D-1
	softlockup_panic=3D1
	nmi_watchdog=3Dpanic
	oops=3Dpanic
	load_ramdisk=3D2
	prompt_ramdisk=3D0
	console=3DttyS0,115200
	console=3Dtty0
	vga=3Dnormal
	root=3D/dev/ram0
	rw
	drbd.minor_count=3D8
)

"${kvm[@]}" --append "${append[*]}"
----------------------------------------------------------------------------

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/lkp                          Intel Corporati=
on

--===============4747127335365801092==--

