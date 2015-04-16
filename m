Content-Type: multipart/mixed; boundary="===============6475962602128051891=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [x86 fsgs] BUG: unable to handle kernel NULL pointer dereference at 0000000000000296
Date: Thu, 16 Apr 2015 11:34:44 +0800
Message-ID: <20150416033444.GA31571@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6475962602128051891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andi,

0day kernel testing robot got the below dmesg and the first bad commit is

git://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git x86/fsgs-4

commit f69df22a54c355220cfac7eb8c8a63055c2ddcfd
Author:     Andi Kleen <ak@linux.intel.com>
AuthorDate: Wed Apr 23 13:26:20 2014 -0700
Commit:     Andi Kleen <ak@linux.intel.com>
CommitDate: Fri Apr 10 16:42:22 2015 -0700

    x86: Add support for rd/wr fs/gs base
    =

    Introduction:
    =

    IvyBridge added four new instructions to directly write the fs and gs
    64bit base registers. Previously this had to be done with a system
    call to write to MSRs. The main use case is fast user space threading
    and switching the fs/gs registers quickly there. Another use
    case is having (relatively) cheap access to a new address
    register per thread.
    =

    The instructions are opt-in and have to be explicitely enabled
    by the OS.
    =

    For more details on how to use the instructions see
    Documentation/x86/fsgs.txt added in a followon patch.
    =

    Paranoid exception path changes:
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
    =

    The paranoid entry/exit code is used for any NMI like
    exception.
    =

    Previously Linux couldn't support the new instructions
    because the paranoid entry code relied on the gs base never being
    negative outside the kernel to decide when to use swaps. It would
    check the gs MSR value and assume it was already running in
    kernel if negative.
    =

    To get rid of this assumption we have to revamp the paranoid exception
    path to not rely on this. We can use the new instructions
    to get (relatively) quick access to the GS value, and use
    it directly.
    =

    This is also significantly faster than a MSR read, so will speed
    NMIs (critical for profiling)
    =

    The kernel gs for the paranoid path is now stored at the
    bottom of the IST stack (so that it can be derived from RSP).
    =

    The original patch compared the gs with the kernel gs and
    assumed that if it was identical, swapgs was not needed
    (and no user space processing was needed). This
    was nice and simple and didn't need a lot of changes.
    =

    But this had the side effect that if a user process set its
    GS to the same as the kernel it may lose rescheduling
    checks (so a racing reschedule IPI would have been
    only acted upon the next non paranoid interrupt)
    =

    This version now switches to full save/restore of the GS.
    This requires quite some changes in the paranoid path.
    Unfortunately I didn't come up with a simpler scheme.
    =

    When swapgs used to be needed, but we have the new
    instructions, we restore original GS value in the exit
    path.
    =

    Context switch changes:
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    =

    Then after these changes we need to also use the new instructions
    to save/restore fs and gs, so that the new values set by the
    users won't disappear.  This is also significantly
    faster for the case when the 64bit base has to be switched
    (that is when GS is larger than 4GB), as we can replace
    the slow MSR write with a faster wr[fg]sbase execution.
    =

    This is in term enables fast switching when there are
    enough threads that their TLS segment does not fit below 4GB
    (or with some newer systems which don't properly hint the
    stack limit), or alternatively programs that use fs as an additional ba=
se
    register will not get a sigificant context switch penalty.
    =

    It is all done in a single patch because there was no
    simple way to do it in pieces without having crash
    holes inbetween.
    =

    v2: Change to save/restore GS instead of using swapgs
    based on the value. Large scale changes.
    v3: Fix wrong flag initialization in fallback path.
    Thanks 0day!
    v4: Make swapgs code paths kprobes safe.
    Port to new base line code which now switches indexes.
    v5: Port to new kernel which avoids paranoid entry for ring 3.
    Removed some code that handled this previously.
    v6: Remove obsolete code. Use macro for ALTERNATIVE. Use
    ALTERNATIVE for exit path, eliminating the DO_RESTORE_G15 flag.
    Various cleanups. Improve description.
    Signed-off-by: Andi Kleen <ak@linux.intel.com>

+--------------------------------------------------------------------------=
+------------+------------+------------+
|                                                                          =
| b969de8386 | f69df22a54 | 53a7ef01ad |
+--------------------------------------------------------------------------=
+------------+------------+------------+
| boot_successes                                                           =
| 1185       | 64         | 9          |
| boot_failures                                                            =
| 15         | 66         | 8          |
| Unexpected_close,not_stopping_watchdog                                   =
| 15         | 1          |            |
| BUG:kernel_boot_crashed                                                  =
| 0          | 43         |            |
| BUG:kernel_test_crashed                                                  =
| 0          | 15         |            |
| PANIC:double_fault                                                       =
| 0          | 5          |            |
| RIP:async_page_fault                                                     =
| 0          | 2          |            |
| BUG:unable_to_handle_kernel                                              =
| 0          | 6          | 8          |
| Oops                                                                     =
| 0          | 5          | 8          |
| RIP:show_stack_log_lvl                                                   =
| 0          | 4          |            |
| Kernel_panic-not_syncing:Fatal_exception_in_interrupt                    =
| 0          | 4          | 4          |
| RIP:do_async_page_fault                                                  =
| 0          | 2          |            |
| RIP:update_min_vruntime                                                  =
| 0          | 1          |            |
| backtrace:ftrace_event_reg                                               =
| 0          | 2          |            |
| backtrace:perf_trace_init                                                =
| 0          | 2          |            |
| backtrace:perf_tp_event_init                                             =
| 0          | 2          |            |
| backtrace:perf_try_init_event                                            =
| 0          | 2          |            |
| backtrace:perf_init_event                                                =
| 0          | 2          |            |
| backtrace:SYSC_perf_event_open                                           =
| 0          | 2          |            |
| backtrace:SyS_perf_event_open                                            =
| 0          | 2          | 2          |
| general_protection_fault                                                 =
| 0          | 1          |            |
| Kernel_panic-not_syncing:Machine_halted                                  =
| 0          | 1          |            |
| RIP:find_vma                                                             =
| 0          | 1          |            |
| backtrace:sock_common_setsockopt                                         =
| 0          | 1          |            |
| backtrace:SyS_setsockopt                                                 =
| 0          | 1          |            |
| RIP:load_balance                                                         =
| 0          | 1          |            |
| backtrace:activate_jump_labels                                           =
| 0          | 0          | 3          |
| backtrace:kernel_init_freeable                                           =
| 0          | 0          | 3          |
| Kernel_panic-not_syncing:Fatal_exception                                 =
| 0          | 0          | 4          |
| BUG:sleeping_function_called_from_invalid_context_at_arch/x86/mm/fault.c =
| 0          | 0          | 3          |
| backtrace:async_page_fault                                               =
| 0          | 0          | 1          |
+--------------------------------------------------------------------------=
+------------+------------+------------+

[    1.795354] init: Failed to create pty - disabling logging for job
[    1.797590] init: Failed to create pty - disabling logging for job
Kernel tests: Boot OK!
[   12.093940] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000296
[   12.094022] IP: [<ffffffff8119d6f5>] do_mlockall+0x75/0xf0
[   12.094022] BAD
[   12.094022] Oops: 0000 [#1] SMP =

[   12.094022] Modules linked in:
[   12.094022] CPU: 1 PID: 5842 Comm: trinity-c1 Tainted: G        W       =
4.0.0-rc7-00002-gf69df22a #1
[   12.094022] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.7.5-20140531_083030-gandalf 04/01/2014
[   12.094022] task: ffff880009970000 ti: ffff880000194000 task.ti: ffff880=
0001
Elapsed time: 15
qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /kernel/x86_64-rhel/f69df=
22a54c355220cfac7eb8c8a63055c2ddcfd/vmlinuz-4.0.0-rc7-00002-gf69df22a -appe=
nd 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 rd.udev.log-priority=3De=
rr systemd.log_target=3Djournal systemd.log_level=3Dwarning debug apic=3Dde=
bug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 so=
ftlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 promp=
t_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/d=
ev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/x86_64-rhel/linux-devel:devel=
-roam-lkp-201504140733:f69df22a54c355220cfac7eb8c8a63055c2ddcfd:bisect-linu=
x-2/.vmlinuz-f69df22a54c355220cfac7eb8c8a63055c2ddcfd-20150415004413-69-ivb=
42 branch=3Dlinux-devel/devel-roam-lkp-201504140733 BOOT_IMAGE=3D/kernel/x8=
6_64-rhel/f69df22a54c355220cfac7eb8c8a63055c2ddcfd/vmlinuz-4.0.0-rc7-00002-=
gf69df22a drbd.minor_count=3D8'  -initrd /kernel-tests/initrd/quantal-core-=
x86_64.cgz -m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0=
 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -driv=
e file=3D/fs/vdisk/disk0-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive f=
ile=3D/fs/vdisk/disk1-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/vdisk/disk2-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive file=3D=
/fs/vdisk/disk3-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive file=3D/fs=
/vdisk/disk4-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/vd=
isk/disk5-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/vdisk=
/disk6-quantal-ivb42-57,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pi=
d-quantal-ivb42-57 -serial file:/dev/shm/kboot/serial-quantal-ivb42-57 -dae=
monize -display none -monitor null =


git bisect start 53a7ef01add3c5575f44e5222acec9c6114d6064 39a8804455fb23f09=
157341d3ba7db6d7ae6ee76 --
git bisect  bad a7ae6bb02f7c104f516b9ab0c1a9d86666add2b7  # 08:26      0-  =
    3  Merge 'perf/perf/core' into devel-roam-lkp-201504140733
git bisect good 01f4b66ca961e0e9dc9c06549ff9ae9dd88a3883  # 10:14     36+  =
    1  0day base guard for 'devel-roam-lkp-201504140733'
git bisect  bad 175253a10859b6a4214ecfb2a902c3c13ea0203b  # 23:15      4-  =
    2  Merge 'ak/x86/fsgs-4' into devel-roam-lkp-201504140733
git bisect  bad fd68c3619c3bf1ce75c0b3cc9a3343cb57e0bd15  # 00:02     11-  =
    8  x86: Enumerate kernel FSGS capability in AT_HWCAP2
git bisect  bad f69df22a54c355220cfac7eb8c8a63055c2ddcfd  # 01:49     38-  =
   20  x86: Add support for rd/wr fs/gs base
git bisect good b969de8386323f25a44288c1d06a3a8db66cb0ff  # 14:44    300+  =
    2  x86: Add intrinsics/macros for new rd/wr fs/gs base instructions
# first bad commit: [f69df22a54c355220cfac7eb8c8a63055c2ddcfd] x86: Add sup=
port for rd/wr fs/gs base
git bisect good b969de8386323f25a44288c1d06a3a8db66cb0ff  # 20:40    900+  =
   15  x86: Add intrinsics/macros for new rd/wr fs/gs base instructions
# extra tests with DEBUG_INFO
git bisect  bad f69df22a54c355220cfac7eb8c8a63055c2ddcfd  # 20:50      2-  =
    3  x86: Add support for rd/wr fs/gs base
# extra tests on HEAD of linux-devel/devel-roam-lkp-201504140733
git bisect  bad 53a7ef01add3c5575f44e5222acec9c6114d6064  # 20:50      0-  =
    8  0day head guard for 'devel-roam-lkp-201504140733'
# extra tests on tree/branch ak/x86/fsgs-4
git bisect  bad ad7a085ec2a306924d317d281e8cd31a6d54b4e9  # 21:38      0-  =
    5  fixup! x86: Add support for rd/wr fs/gs base
# extra tests on tree/branch linus/master
git bisect good bb0fd7ab0986105765d11baa82e619c618a235aa  # 22:50    900+  =
   13  Merge branch 'for-linus' of git://ftp.arm.linux.org.uk/~rmk/linux-arm
# extra tests on tree/branch next/master
git bisect good fb5e230888b2b734a061e853b3729acdaae7a537  # 11:28    900+  =
  129  Add linux-next specific files for 20150415


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
	rd.udev.log-priority=3Derr
	systemd.log_target=3Djournal
	systemd.log_level=3Dwarning
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

--===============6475962602128051891==--

