Content-Type: multipart/mixed; boundary="===============1400851620557231918=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: [x86/asm/entry] INFO: task swapper/0:1 blocked for more than 120 seconds.
Date: Sat, 07 Mar 2015 07:33:20 +0800
Message-ID: <20150306233320.GC3556@wfg-t540p.sh.intel.com>
In-Reply-To: <20150306233033.GA3556@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1400851620557231918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Here is yet another warning message on commit =


git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/asm

commit 75182b1632a89f12540baa1806a7c5c180db620c
Author:     Andy Lutomirski <luto@amacapital.net>
AuthorDate: Thu Mar 5 19:19:03 2015 -0800
Commit:     Ingo Molnar <mingo@kernel.org>
CommitDate: Fri Mar 6 08:32:57 2015 +0100

    x86/asm/entry: Switch all C consumers of kernel_stack to this_cpu_sp0()
    =

    This will make modifying the semantics of kernel_stack easier.
    =

    The change to ist_begin_non_atomic() is necessary because sp0 no
    longer points to the same THREAD_SIZE-aligned region as RSP;
    it's one byte too high for that.  At Denys' suggestion, rather
    than offsetting it, just check explicitly that we're in the
    correct range ending at sp0.  This has the added benefit that we
    no longer assume that the thread stack is aligned to
    THREAD_SIZE.
    =

    Suggested-by: Denys Vlasenko <dvlasenk@redhat.com>
    Signed-off-by: Andy Lutomirski <luto@amacapital.net>
    Cc: Borislav Petkov <bp@alien8.de>
    Cc: H. Peter Anvin <hpa@zytor.com>
    Cc: Linus Torvalds <torvalds@linux-foundation.org>
    Cc: Oleg Nesterov <oleg@redhat.com>
    Cc: Thomas Gleixner <tglx@linutronix.de>
    Link: http://lkml.kernel.org/r/ef8254ad414cbb8034c9a56396eeb24f5dd5b0de=
.1425611534.git.luto(a)amacapital.net
    Signed-off-by: Ingo Molnar <mingo@kernel.org>

+--------------------------------------------------+------------+----------=
--+------------+
|                                                  | 8ef46a672a | 75182b163=
2 | fad99646bd |
+--------------------------------------------------+------------+----------=
--+------------+
| boot_successes                                   | 153        | 0        =
  | 0          |
| boot_failures                                    | 0          | 51       =
  | 12         |
| EIP_is_at_multi_cpu_stop                         | 0          | 18       =
  | 4          |
| Kernel_panic-not_syncing:softlockup:hung_tasks   | 0          | 18       =
  | 4          |
| backtrace:smpboot_thread_fn                      | 0          | 18       =
  | 4          |
| INFO:task_blocked_for_more_than#seconds          | 0          | 33       =
  | 8          |
| EIP_is_at_default_send_IPI_mask_logical          | 0          | 33       =
  | 8          |
| Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 33       =
  | 8          |
| backtrace:misc_register                          | 0          | 33       =
  | 8          |
| backtrace:vga_arb_device_init                    | 0          | 33       =
  | 8          |
| backtrace:kernel_init_freeable                   | 0          | 33       =
  | 8          |
| backtrace:watchdog                               | 0          | 33       =
  | 8          |
+--------------------------------------------------+------------+----------=
--+------------+

[    2.990165] ACPI: =

[    2.990165] ACPI: Enabled 16 GPEs in block 00 to 0FEnabled 16 GPEs in bl=
ock 00 to 0F

[  242.992054] INFO: task swapper/0:1 blocked for more than 120 seconds.
[  242.992054] INFO: task swapper/0:1 blocked for more than 120 seconds.
[  242.993686]       Not tainted 4.0.0-rc2-00052-g75182b1 #51
[  242.993686]       Not tainted 4.0.0-rc2-00052-g75182b1 #51
[  242.994973] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables =
this message.

git bisect start fad99646bd5e9e5cf78637701931518b8a55890e 4f671fe2f9523a1ea=
206f63fe60a7c7b3a56d5c7 --
git bisect good 7dfd6d85242a6790260381cb45ea407bd9b65af3  # 18:24     25+  =
    0  Merge branch 'linus'
git bisect good 0624492336dfd630334fb582eb3f20ee3e109293  # 18:34     25+  =
    0  Merge branch 'x86/asm'
git bisect good 93cbe2969a57747f291894e2331d9864034ac0a1  # 18:41     25+  =
    0  Merge branch 'timers/urgent'
git bisect good e0aa5c22486be95ff8b52926fcb4f0e6f01a79c6  # 18:47     25+  =
    0  Merge branch 'perf/urgent'
git bisect  bad 74d398c3580c5cb5601028821833366dc8414a69  # 18:47      0-  =
   12  Merge branch 'x86/asm'
git bisect  bad 9d0c914c60f4d3123debb653340dc1f7cf44939d  # 19:02     19-  =
   25  x86/asm/entry/64/compat: Change the 32-bit sysenter code to use sp0
git bisect  bad 75182b1632a89f12540baa1806a7c5c180db620c  # 19:28     18-  =
   51  x86/asm/entry: Switch all C consumers of kernel_stack to this_cpu_sp=
0()
git bisect good 8ef46a672a7d852709561d10672b6eaa8a4acd82  # 19:35     51+  =
    0  x86/asm/entry: Add this_cpu_sp0() to read sp0 for the current cpu
# first bad commit: [75182b1632a89f12540baa1806a7c5c180db620c] x86/asm/entr=
y: Switch all C consumers of kernel_stack to this_cpu_sp0()
git bisect good 8ef46a672a7d852709561d10672b6eaa8a4acd82  # 19:38    153+  =
    0  x86/asm/entry: Add this_cpu_sp0() to read sp0 for the current cpu
# extra tests with DEBUG_INFO
git bisect good 75182b1632a89f12540baa1806a7c5c180db620c  # 19:59    153+  =
  153  x86/asm/entry: Switch all C consumers of kernel_stack to this_cpu_sp=
0()
# extra tests on HEAD of tip/master
git bisect  bad fad99646bd5e9e5cf78637701931518b8a55890e  # 19:59      0-  =
   12  Merge branch 'x86/urgent'
# extra tests on tree/branch tip/x86/asm
git bisect  bad 9b47668843d800ed57f6f6bfd6f5c4cffdf201c6  # 20:09     43-  =
  117  x86/asm/entry: Rename 'INIT_TSS_IST' to 'CPU_TSS_IST'
# extra tests on tree/branch tip/master
git bisect  bad fad99646bd5e9e5cf78637701931518b8a55890e  # 20:09      0-  =
   12  Merge branch 'x86/urgent'
# extra tests on tree/branch linus/master
git bisect good 99aedde0869ce194539166ac5a4d2e1a20995348  # 20:34    153+  =
    0  Merge branch 'x86-urgent-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
# extra tests on tree/branch next/master
git bisect good 28855005be1d6a0a041de46fd2e61da2b796abff  # 20:39    153+  =
    0  Add linux-next specific files for 20150306


This script may reproduce the error.

----------------------------------------------------------------------------
#!/bin/bash

kernel=3D$1

kvm=3D(
	qemu-system-x86_64
	-cpu kvm64
	-enable-kvm
	-kernel $kernel
	-m 320
	-smp 1
	-net nic,vlan=3D1,model=3De1000
	-net user,vlan=3D1
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

--===============1400851620557231918==--

