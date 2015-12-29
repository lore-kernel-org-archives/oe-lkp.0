Content-Type: multipart/mixed; boundary="===============6063841435588262110=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [memdup_user_nul] BUG: unable to handle kernel paging request at 000b777b
Date: Tue, 29 Dec 2015 20:45:21 +0800
Message-ID: <20151229124521.GG4678@wfg-t540p.sh.intel.com>
In-Reply-To: <87ege74bom.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6063841435588262110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git work.misc

commit c7af9d5728bed29ef614324e67e066896d087c8f
Author:     Al Viro <viro@zeniv.linux.org.uk>
AuthorDate: Thu Dec 24 00:13:10 2015 -0500
Commit:     Al Viro <viro@zeniv.linux.org.uk>
CommitDate: Thu Dec 24 10:52:16 2015 -0500

    kernel/*: switch to memdup_user_nul()
    =

    Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

+-----------------------------------------------+------------+------------+=
------------+
|                                               | c4af5f8aed | c7af9d5728 |=
 212424e0f1 |
+-----------------------------------------------+------------+------------+=
------------+
| boot_successes                                | 104        | 2          |=
 15         |
| boot_failures                                 | 0          | 33         |=
 4          |
| BUG:unable_to_handle_kernel                   | 0          | 27         |=
 3          |
| Oops                                          | 0          | 27         |=
 3          |
| EIP_is_at_lock_anon_vma_root                  | 0          | 9          |=
 2          |
| Kernel_panic-not_syncing:Fatal_exception      | 0          | 29         |=
 4          |
| backtrace:do_group_exit                       | 0          | 12         |=
 3          |
| backtrace:SyS_exit_group                      | 0          | 12         |=
 3          |
| EIP_is_at_anon_vma_interval_tree_remove       | 0          | 2          |=
            |
| backtrace:do_execve                           | 0          | 7          |=
            |
| backtrace:SyS_execve                          | 0          | 7          |=
            |
| BUG:kernel_test_crashed                       | 0          | 4          |=
            |
| EIP_is_at_vma_last_pgoff                      | 0          | 7          |=
 1          |
| EIP_is_at_anon_vma_interval_tree_insert       | 0          | 3          |=
            |
| backtrace:_do_fork                            | 0          | 3          |=
            |
| backtrace:SyS_clone                           | 0          | 3          |=
            |
| backtrace:SYSC_select                         | 0          | 1          |=
            |
| backtrace:SyS_select                          | 0          | 1          |=
            |
| EIP_is_at_handle_mm_fault                     | 0          | 1          |=
            |
| EIP_is_at_tty_write                           | 0          | 1          |=
            |
| backtrace:vfs_write                           | 0          | 1          |=
            |
| backtrace:SyS_write                           | 0          | 1          |=
            |
| EIP_is_at__rb_change_child                    | 0          | 2          |=
            |
| backtrace:SYSC_mmap_pgoff                     | 0          | 2          |=
            |
| backtrace:SyS_mmap_pgoff                      | 0          | 2          |=
            |
| general_protection_fault:#[##]DEBUG_PAGEALLOC | 0          | 1          |=
 1          |
| EIP_is_at_switch_mm                           | 0          | 1          |=
 1          |
| backtrace:smpboot_thread_fn                   | 0          | 1          |=
 1          |
| Assertion_failed                              | 0          | 1          |=
            |
| EIP_is_at__rb_erase_color                     | 0          | 1          |=
            |
| kernel_BUG_at_mm/vmalloc.c                    | 0          | 1          |=
            |
| invalid_opcode:#[##]DEBUG_PAGEALLOC           | 0          | 1          |=
            |
| EIP_is_at__vunmap                             | 0          | 1          |=
            |
+-----------------------------------------------+------------+------------+=
------------+

[   49.355162] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input3
[   49.740439] init: plymouth-log main process (238) terminated with status=
 1
[   49.802692] udevd[248]: starting version 175
[   49.846802] BUG: unable to handle kernel paging request at 000b777b
[   49.848735] IP: [<c75c9e86>] lock_anon_vma_root+0xb/0x1d6
[   49.850377] *pdpt =3D 000000000ab53001 *pde =3D 0000000000000000 =

[   49.852167] Oops: 0000 [#1] DEBUG_PAGEALLOC =

[   49.853513] CPU: 0 PID: 252 Comm: init Not tainted 4.4.0-rc4-00029-gc7af=
9d5 #1
[   49.855623] task: caafc980 ti: caac2000 task.ti: caac2000
[   49.857207] EIP: 0060:[<c75c9e86>] EFLAGS: 00010282 CPU: 0
[   49.858810] EIP is at lock_anon_vma_root+0xb/0x1d6
[   49.860219] EAX: ca9c11d8 EBX: ca9c11d8 ECX: cab034d4 EDX: 000b777b
[   49.862051] ESI: caa918d0 EDI: 000b777b EBP: caac3dc4 ESP: caac3db0
[   49.863881]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
[   49.865447] CR0: 8005003b CR2: 000b777b CR3: 0ab0b6c0 CR4: 000006b0
[   49.867278] Stack:
[   49.867896]  caa91c00 00000000 cab0b760 caa918d0 000b777b caac3de8 c75cc=
0de cab0b768
[   49.870480]  caa91910 ca9c11d8 caa91908 caa918d0 00000000 caa918d0 caac3=
e08 c75b602a
[   49.873068]  caac3e1c caa91ab0 b74f5000 ca9ef9f0 caab9a00 caafcab4 caac3=
e68 c75c3d69
[   49.875329] Call Trace:
[   49.876059]  [<c75cc0de>] unlink_anon_vmas+0x50/0x1e5
[   49.877546]  [<c75b602a>] free_pgtables+0x9a/0x112
[   49.878935]  [<c75c3d69>] exit_mmap+0xb7/0x1ae
[   49.880105]  [<c7486b98>] mmput+0x140/0x258
[   49.881212]  [<c76019c5>] flush_old_exec+0x301/0x3ae
[   49.882513]  [<c767a0da>] load_elf_binary+0x561/0x1363
[   49.883863]  [<c7602042>] search_binary_handler+0x83/0x190
[   49.885292]  [<c7602a35>] do_execveat_common+0x8e6/0xcca
[   49.887893]  [<c7602e3b>] do_execve+0x22/0x32
[   49.893167]  [<c7603205>] SyS_execve+0x46/0x74
[   49.894431]  [<c74027de>] do_syscall_32_irqs_on+0xcc/0xfc
[   49.895949]  [<c837faee>] entry_INT80_32+0x2e/0x2e
[   49.898183] Code: c8 01 89 e5 83 15 44 6b c8 c8 00 e8 e5 3a 01 00 83 05 =
48 6b c8 c8 01 83 15 4c 6b c8 c8 00 5d c3 55 89 e5 57 56 53 89 c3 83 ec 08 =
<8b> 3a 83 05 80 6c c8 c8 01 83 15 84 6c c8 c8 00 39 c7 0f 84 aa
[   49.913707] EIP: [<c75c9e86>] lock_anon_vma_root+0xb/0x1d6 SS:ESP 0068:c=
aac3db0
[   49.917174] CR2: 00000000000b777b
[   49.920345] ---[ end trace d785867481aca111 ]---
[   49.921676] Kernel panic - not syncing: Fatal exception

git bisect start 212424e0f12362219dc6f53bb13f4af726825044 4ef7675344d687a0e=
f5b0d7c0cee12da005870c0 --
git bisect  bad 45e82e90e5e7072b4e304d19f84d2c1c4b3c7b41  # 20:42      1-  =
    4  Merge 'linux-review/Jann-Horn/android-binder-fix-fput-comment/201512=
26-045614' into devel-spot-201512261608
git bisect  bad 9605f52d2f60ff9d808e3aae3b06651af8748e2b  # 20:55      0-  =
    2  Merge 'linux-review/changbin-du-intel-com/usb-gadget-acm-set-notify_=
req-to-NULL-after-freed-to-avoid-double-free/20151226-120759' into devel-sp=
ot-201512261608
git bisect good e4faee14fcf2744599b3774b14c27eb8a1b24cd7  # 21:11     35+  =
    0  Merge 'linux-review/SF-Markus-Elfring/i2c-core-One-function-call-les=
s-in-acpi_i2c_space_handler-after-error-detection/20151226-151227' into dev=
el-spot-201512261608
git bisect  bad cdac7c82b1842fa38e8b877ee841d813b26ae841  # 21:17      2-  =
   20  Merge 'vfs/work.misc' into devel-spot-201512261608
git bisect good 9e6697e26f9888cdb6088664d31c3772b0dff0a4  # 21:31     35+  =
    0  namei.c: fold set_root_rcu() into set_root()
git bisect good a98e80b2b86d1489d56859c948248738ad932be9  # 21:41     35+  =
    0  switch wireless debugfs ->write() instances to memdup_user_nul()
git bisect  bad 9e38a427c41702e177f7691c6023adde7e6c711e  # 21:46      0-  =
    2  put the remnants of ..._user_ret() to rest
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 21:57      0-  =
    6  kernel/*: switch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 22:10     33+  =
    0  cciss: switch to memdup_user_nul()
# first bad commit: [c7af9d5728bed29ef614324e67e066896d087c8f] kernel/*: sw=
itch to memdup_user_nul()
git bisect good c4af5f8aed82ef30f6cf91bc3478b52c61cecd18  # 22:13     98+  =
    0  cciss: switch to memdup_user_nul()
# extra tests with DEBUG_INFO
git bisect  bad c7af9d5728bed29ef614324e67e066896d087c8f  # 22:23      0-  =
    2  kernel/*: switch to memdup_user_nul()
# extra tests on HEAD of linux-devel/devel-spot-201512261608
git bisect  bad 212424e0f12362219dc6f53bb13f4af726825044  # 22:23      0-  =
    4  0day head guard for 'devel-spot-201512261608'
# extra tests on tree/branch vfs/work.misc
git bisect  bad 15d8d69accf88da38aac73dd873ce56fd39b358a  # 22:28      1-  =
    4  saner calling conventions for copy_mount_options()
# extra tests with first bad commit reverted
git bisect good 241dc6cc888af8cc59a6e1c3ddd4ee2e0da6d00d  # 22:46    105+  =
    0  Revert "kernel/*: switch to memdup_user_nul()"
# extra tests on tree/branch linus/master
git bisect good 8db7b3c54401d83a4dc370a59b8692854000ea03  # 22:59    104+  =
    2  Merge branch 'parisc-4.4-4' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/deller/parisc-linux
# extra tests on tree/branch linux-next/master


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

---
0-DAY kernel test infrastructure                Open Source Technology Cent=
er
https://lists.01.org/pipermail/lkp                          Intel Corporati=
on

--===============6063841435588262110==--

