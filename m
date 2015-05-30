Content-Type: multipart/mixed; boundary="===============5295983651127861890=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [vfs] BUG: unable to handle kernel NULL pointer dereference at 0000000c
Date: Sat, 30 May 2015 20:42:15 +0800
Message-ID: <20150530124215.GA8758@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5295983651127861890==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Greetings,

0day kernel testing robot got the below dmesg and the first bad commit is

https://github.com/fbq/linux.git per-ns-rename_lock

commit 6155a1dcc08052d83f56edfe201e7c0b5b918dd4
Author:     Boqun Feng <boqun.feng@gmail.com>
AuthorDate: Fri May 29 18:20:41 2015 +0800
Commit:     Boqun Feng <boqun.feng@gmail.com>
CommitDate: Fri May 29 18:20:41 2015 +0800

    vfs: use per-namespace rename_lock
    =

    Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

+------------------------------------------+------------+------------+-----=
-------+
|                                          | b853a16176 | 6155a1dcc0 | 6155=
a1dcc0 |
+------------------------------------------+------------+------------+-----=
-------+
| boot_successes                           | 60         | 0          | 0   =
       |
| boot_failures                            | 0          | 12         | 12  =
       |
| BUG:unable_to_handle_kernel              | 0          | 12         | 12  =
       |
| Oops                                     | 0          | 12         | 12  =
       |
| EIP_is_at_d_lookup                       | 0          | 12         | 12  =
       |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 12         | 12  =
       |
| backtrace:cryptomgr_test                 | 0          | 12         | 12  =
       |
+------------------------------------------+------------+------------+-----=
-------+

[    7.313134] apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
[    7.320482] apm: overridden by ACPI.
[    7.320482] apm: overridden by ACPI.
[    7.327879] BUG: unable to handle kernel =

[    7.327879] BUG: unable to handle kernel NULL pointer dereferenceNULL po=
inter dereference at 0000000c
 at 0000000c
[    7.334886] IP:
[    7.334886] IP: [<c4b1d33b>] d_lookup+0x3a/0x130
 [<c4b1d33b>] d_lookup+0x3a/0x130
[    7.336214] *pdpt =3D 0000000000000000 =

[    7.336214] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 *pde =
=3D f000ff53f000ff53 =


[    7.336214] Oops: 0000 [#1] =

[    7.336214] Oops: 0000 [#1] =


[    7.336214] CPU: 0 PID: 18 Comm: cryptomgr_test Not tainted 4.1.0-rc3-00=
132-g6155a1d #216
[    7.336214] CPU: 0 PID: 18 Comm: cryptomgr_test Not tainted 4.1.0-rc3-00=
132-g6155a1d #216
[    7.336214] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[    7.336214] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[    7.336214] task: cb5d7000 ti: d0734000 task.ti: d0734000
[    7.336214] task: cb5d7000 ti: d0734000 task.ti: d0734000
[    7.336214] EIP: 0060:[<c4b1d33b>] EFLAGS: 00010246 CPU: 0
[    7.336214] EIP: 0060:[<c4b1d33b>] EFLAGS: 00010246 CPU: 0
[    7.336214] EIP is at d_lookup+0x3a/0x130
[    7.336214] EIP is at d_lookup+0x3a/0x130
[    7.336214] EAX: 00000000 EBX: d0735e00 ECX: 00000000 EDX: 00000000
[    7.336214] EAX: 00000000 EBX: d0735e00 ECX: 00000000 EDX: 00000000
[    7.336214] ESI: d0735e7c EDI: cb5d7000 EBP: d0735e34 ESP: d0735e18
[    7.336214] ESI: d0735e7c EDI: cb5d7000 EBP: d0735e34 ESP: d0735e18
[    7.336214]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
[    7.336214]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
[    7.336214] CR0: 8005003b CR2: 0000000c CR3: 05b96000 CR4: 000006b0
[    7.336214] CR0: 8005003b CR2: 0000000c CR3: 05b96000 CR4: 000006b0
[    7.336214] Stack:
[    7.336214] Stack:
[    7.336214]  cb5d7000
[    7.336214]  cb5d7000 d0735e7c d0735e7c c0102768 c0102768 00000002 00000=
002 d0735e8b d0735e8b d0735e7c d0735e7c c0102768 c0102768 d0735e4c d0735e4c

[    7.336214]  c4b1d489
[    7.336214]  c4b1d489 d0735dd4 d0735dd4 d0735e8b d0735e8b c0102610 c0102=
610 00000012 00000012 d0735ea4 d0735ea4 c4b44ea3 c4b44ea3 d0735e8b d0735e8b

[    7.336214]  0000000d
[    7.336214]  0000000d c5745c73 c5745c73 00000012 00000012 00000000 00000=
000 cc7b4980 cc7b4980 cc7b4980 cc7b4980 cc7b499c cc7b499c 00000012 00000012

[    7.336214] Call Trace:
[    7.336214] Call Trace:
[    7.336214]  [<c4b1d489>] d_hash_and_lookup+0x58/0x5e
[    7.336214]  [<c4b1d489>] d_hash_and_lookup+0x58/0x5e
[    7.336214]  [<c4b44ea3>] proc_flush_task+0x85/0x151
[    7.336214]  [<c4b44ea3>] proc_flush_task+0x85/0x151
[    7.336214]  [<c4a43f9a>] release_task+0x5f/0x417
[    7.336214]  [<c4a43f9a>] release_task+0x5f/0x417
[    7.336214]  [<c4a67b03>] ? lock_release_holdtime+0xa9/0xb4
[    7.336214]  [<c4a67b03>] ? lock_release_holdtime+0xa9/0xb4
[    7.336214]  [<c4a45802>] ? do_exit+0x42c/0x91a
[    7.336214]  [<c4a45802>] ? do_exit+0x42c/0x91a
[    7.336214]  [<c4a6cb74>] ? do_raw_write_unlock+0x74/0x96
[    7.336214]  [<c4a6cb74>] ? do_raw_write_unlock+0x74/0x96
[    7.336214]  [<c4a45c07>] do_exit+0x831/0x91a
[    7.336214]  [<c4a45c07>] do_exit+0x831/0x91a
[    7.336214]  [<c4bea0e0>] ? cryptomgr_notify+0x370/0x370
[    7.336214]  [<c4bea0e0>] ? cryptomgr_notify+0x370/0x370
[    7.336214]  [<c4bea100>] cryptomgr_test+0x20/0x20
[    7.336214]  [<c4bea100>] cryptomgr_test+0x20/0x20
[    7.336214]  [<c4a598ee>] kthread+0xbe/0xc3
[    7.336214]  [<c4a598ee>] kthread+0xbe/0xc3
[    7.336214]  [<c4a6274b>] ? local_clock+0x12/0x1c
[    7.336214]  [<c4a6274b>] ? local_clock+0x12/0x1c
[    7.336214]  [<c4a664d3>] ? complete+0x17/0x3a
[    7.336214]  [<c4a664d3>] ? complete+0x17/0x3a
[    7.336214]  [<c5376380>] ret_from_kernel_thread+0x20/0x30
[    7.336214]  [<c5376380>] ret_from_kernel_thread+0x20/0x30
[    7.336214]  [<c4a59830>] ? __kthread_parkme+0x80/0x80
[    7.336214]  [<c4a59830>] ? __kthread_parkme+0x80/0x80
[    7.336214] Code:
[    7.336214] Code: 3d 3d b0 b0 10 10 82 82 c5 c5 89 89 45 45 ec ec 89 89 =
55 55 e8 e8 a1 a1 b0 b0 10 10 82 82 c5 c5 89 89 45 45 e4 e4 8b 8b 45 45 e4 =
e4 83 83 3d 3d 94 94 5f 5f 82 82 c5 c5 00 00 8b 8b 80 80 38 38 03 03 00 00 =
00 00 0f 0f 94 94 c3 c3 31 31 c9 c9 0f 0f b6 b6 d3 d3 <8b> <8b> 70 70 0c 0c=
 b8 b8 64 64 2a 2a a8 a8 c5 c5 e8 e8 9a 9a f4 f4 f8 f8 ff ff 84 84 db db 74=
 74 02 02 0f 0f 0b 0b 9c 9c 58 58

[    7.336214] EIP: [<c4b1d33b>] =

[    7.336214] EIP: [<c4b1d33b>] d_lookup+0x3a/0x130d_lookup+0x3a/0x130 SS:=
ESP 0068:d0735e18
 SS:ESP 0068:d0735e18
[    7.336214] CR2: 000000000000000c
[    7.336214] CR2: 000000000000000c
[    7.336214] ---[ end trace be9151c7869d7a03 ]---
[    7.336214] ---[ end trace be9151c7869d7a03 ]---

git bisect start 6155a1dcc08052d83f56edfe201e7c0b5b918dd4 b853a16176cf3e02c=
57e215743015614152c2428 --
# first bad commit: [6155a1dcc08052d83f56edfe201e7c0b5b918dd4] vfs: use per=
-namespace rename_lock
git bisect good b853a16176cf3e02c57e215743015614152c2428  # 19:58     60+  =
    0  turn user_{path_at,path,lpath,path_dir}() into static inlines
# extra tests with DEBUG_INFO
# extra tests on HEAD of fbq/per-ns-rename_lock
git bisect  bad 6155a1dcc08052d83f56edfe201e7c0b5b918dd4  # 20:02      0-  =
   12  vfs: use per-namespace rename_lock
# extra tests on tree/branch fbq/per-ns-rename_lock
git bisect  bad 6155a1dcc08052d83f56edfe201e7c0b5b918dd4  # 20:02      0-  =
   12  vfs: use per-namespace rename_lock
# extra tests with first bad commit reverted
# extra tests on tree/branch linus/master
git bisect good ace6a22a9fbcdba0ccf190f97b82a79ef2f44aeb  # 20:09     60+  =
    0  Merge tag 'xtensa-20150526' of git://github.com/czankel/xtensa-linux
# extra tests on tree/branch next/master
git bisect good 5d925a7641c8066290ee58eaf4f651a1ea7d9c82  # 20:21     60+  =
    0  Add linux-next specific files for 20150528


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1
initrd=3Dquantal-core-i386.cgz

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

Thanks,
Fengguang

--===============5295983651127861890==--

