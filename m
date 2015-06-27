Content-Type: multipart/mixed; boundary="===============8844366063355348648=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/entry/64] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:3561 check_flags()
Date: Sat, 27 Jun 2015 14:29:13 +0800
Message-ID: <20150627062913.GA23578@wfg-t540p.sh.intel.com>
In-Reply-To: <20150627062733.GA22268@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8844366063355348648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ah it has been reported, sorry for the duplicated report!

On Sat, Jun 27, 2015 at 02:27:33PM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry
> =

> commit e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8
> Author:     Andy Lutomirski <luto@kernel.org>
> AuthorDate: Tue Jun 16 12:16:30 2015 -0700
> Commit:     Andy Lutomirski <luto@kernel.org>
> CommitDate: Thu Jun 25 16:50:46 2015 -0700
> =

>     x86/entry/64: Migrate 64-bit and compat syscalls to new exit hooks
>     =

>     These need to be migrated together, as the compat case used to jump
>     into the middle of the 64-bit exit code.
>     =

>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
> =

> +----------------------------------------------------+------------+------=
------+------------+
> |                                                    | 3854ea665f | e9c46=
9cb57 | eafee44a99 |
> +----------------------------------------------------+------------+------=
------+------------+
> | boot_successes                                     | 63         | 0    =
      | 0          |
> | boot_failures                                      | 0          | 24   =
      | 24         |
> | WARNING:at_kernel/locking/lockdep.c:#check_flags() | 0          | 24   =
      | 24         |
> | backtrace:__task_pid_nr_ns                         | 0          | 22   =
      | 8          |
> | backtrace:SyS_set_tid_address                      | 0          | 22   =
      | 8          |
> | backtrace:vm_mmap_pgoff                            | 0          | 2    =
      |            |
> | backtrace:SyS_mmap_pgoff                           | 0          | 2    =
      |            |
> | backtrace:SyS_mmap                                 | 0          | 2    =
      |            |
> | IP-Config:Auto-configuration_of_network_failed     | 0          | 2    =
      |            |
> | backtrace:vfs_read                                 | 0          | 0    =
      | 3          |
> | backtrace:SyS_read                                 | 0          | 0    =
      | 3          |
> | backtrace:__close_fd                               | 0          | 0    =
      | 13         |
> | backtrace:SyS_close                                | 0          | 0    =
      | 13         |
> +----------------------------------------------------+------------+------=
------+------------+
> =

> [   11.004006] Freeing unused kernel memory: 1200K (ffff88000b4d4000 - ff=
ff88000b600000)
> [   11.006656] Freeing unused kernel memory: 1360K (ffff88000bcac000 - ff=
ff88000be00000)
> [   11.010492] ------------[ cut here ]------------
> [   11.011035] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:3561 ch=
eck_flags+0x2f6/0x330()
> [   11.011035] DEBUG_LOCKS_WARN_ON(!current->hardirqs_enabled)
> [   11.011035] CPU: 1 PID: 1 Comm: init Not tainted 4.1.0-01336-ge9c469c =
#1
> [   11.011035]  ffffffff8bb7f2e0 ffff880010d0fdd8 ffffffff8b4a70ee 000000=
000000002f
> [   11.011035]  ffff880010d0fe28 ffff880010d0fe18 ffffffff8a8ac643 ffff88=
00100dc120
> [   11.011035]  0000000000000202 0000000000000000 0000000000000000 000000=
0000000000
> [   11.011035] Call Trace:
> [   11.011035]  [<ffffffff8b4a70ee>] dump_stack+0x84/0xb9
> [   11.011035]  [<ffffffff8a8ac643>] warn_slowpath_common+0xa3/0x100
> [   11.011035]  [<ffffffff8a8ac731>] warn_slowpath_fmt+0x51/0x60
> [   11.011035]  [<ffffffff8a91af46>] check_flags+0x2f6/0x330
> [   11.011035]  [<ffffffff8a920991>] lock_acquire+0xb1/0x1a0
> [   11.011035]  [<ffffffff8a8dd8ee>] ? task_work_run+0x12e/0x160
> [   11.011035]  [<ffffffff8a8dd30f>] __task_pid_nr_ns+0x5f/0x290
> [   11.011035]  [<ffffffff8a8dd2b0>] ? pid_vnr+0x80/0x80
> [   11.011035]  [<ffffffff8a8ab09e>] SyS_set_tid_address+0x2e/0x40
> [   11.011035]  [<ffffffff8b4b99f6>] entry_SYSCALL_64_fastpath+0x16/0x7a
> [   11.011035] ---[ end trace 3806fbdbe2666144 ]---
> [   11.011035] possible reason: unannotated irqs-on.
> =

> git bisect start eafee44a99f220b651d8f2e3ef1cf617f7a178be b953c0d234bc72e=
8489d3bf51a276c5c4ec85345 --
> git bisect  bad 50d4f70d4e503816c7e593c7f7ed1c09cc98a615  # 00:23      0-=
     22  Merge 'btrfs/integration-4.2' into devel-spot-201506261220
> git bisect good 22fdb85178ce6d40c43c419df08c7b22c9e0cef1  # 00:37     22+=
      2  Merge 'pm/bleeding-edge' into devel-spot-201506261220
> git bisect  bad f378713e98927057d534780b238f1045f8c80a83  # 00:43      0-=
     22  Merge 'luto/x86/entry' into devel-spot-201506261220
> git bisect good 7ae9481f6b73ee3a1afcc9d8ff0394b629171a4a  # 01:02     22+=
      0  Merge 'ukl/gpiod' into devel-spot-201506261220
> git bisect good 3a3c8160aa4072046489cebe9623e1096ad85553  # 01:09     22+=
      0  Merge 'perf/tmp.perf/pt' into devel-spot-201506261220
> git bisect good 3854ea665fc3b5cdae745f1c9ca30422556cfdf9  # 01:34     22+=
      0  x86/entry/64: Really create an error-entry-from-usermode code path
> git bisect  bad 97c83f17b5d877a6ecdc52cf8c486ce167c1f4ef  # 02:04      0-=
     22  x86/entry: Remove exception_enter from most trap handlers
> git bisect  bad c0b6e6a29945abf362aff2fc607e1623fc3eb124  # 02:36      0-=
     24  x86/asm/entry/64: Save all regs on interrupt entry
> git bisect  bad e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8  # 02:43      0-=
     24  x86/entry/64: Migrate 64-bit and compat syscalls to new exit hooks
> # first bad commit: [e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8] x86/entry/=
64: Migrate 64-bit and compat syscalls to new exit hooks
> git bisect good 3854ea665fc3b5cdae745f1c9ca30422556cfdf9  # 02:46     63+=
      0  x86/entry/64: Really create an error-entry-from-usermode code path
> # extra tests with DEBUG_INFO
> git bisect  bad e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8  # 02:55      0-=
      7  x86/entry/64: Migrate 64-bit and compat syscalls to new exit hooks
> # extra tests on HEAD of linux-devel/devel-spot-201506261220
> git bisect  bad eafee44a99f220b651d8f2e3ef1cf617f7a178be  # 02:55      0-=
     24  0day head guard for 'devel-spot-201506261220'
> # extra tests on tree/branch luto/x86/entry
> git bisect good d5a2db8b9358cfeb7e0688ea391185fd2b1cdc05  # 03:07     66+=
      0  x86/entry: Remove do_notify_resume, syscall_trace_leave, and their=
 TIF masks
> # extra tests on tree/branch linus/master
> git bisect good c13c81006314ad76c2b31824960a900385601b8b  # 03:52     61+=
      2  Merge tag 'rtc-v4.2-1' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/abelloni/linux
> # extra tests on tree/branch next/master
> git bisect good 043831b4a4e9a981c4ec6331b6d64b9f62285d5d  # 04:47     60+=
      0  Add linux-next specific files for 20150626
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 300
> 	-smp 2
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null =

> )
> =

> append=3D(
> 	hung_task_panic=3D1
> 	earlyprintk=3DttyS0,115200
> 	systemd.log_level=3Derr
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
---
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> early console in decompress_kernel
> KASLR using RDTSC...
> =

> Decompressing Linux... Parsing ELF... Performing relocations... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 4.1.0-01336-ge9c469c (kbuild(a)ivytown2) (gc=
c version 4.9.2 (Debian 4.9.2-10) ) #1 SMP Sat Jun 27 02:42:21 CST 2015
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate=
.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1=
15200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests=
/run-queue/kvm/x86_64-randconfig-h0-06261249/linux-devel:devel-spot-2015062=
61220:e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8:bisect-linux-8/.vmlinuz-e9c4=
69cb57d2ccf6e7e5e8e6f869fc579adb58e8-20150627024253-9-ivb42 branch=3Dlinux-=
devel/devel-spot-201506261220 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-h0-=
06261249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-4.1.0-013=
36-ge9c469c drbd.minor_count=3D8
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Centaur CentaurHauls
> [    0.000000] x86/fpu: Legacy x87 FPU detected.
> [    0.000000] x86/fpu: Using 'lazy' FPU context switches.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000012bdffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000012be0000-0x0000000012bfffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x400000000
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0e80-0x000f0e8f] mapped a=
t [ffff8800000f0e80]
> [    0.000000]   mpc: f0e90-f0fac
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x0d8b4000, 0x0d8b4fff] PGTABLE
> [    0.000000] BRK [0x0d8b5000, 0x0d8b5fff] PGTABLE
> [    0.000000] BRK [0x0d8b6000, 0x0d8b6fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x11200000-0x113fffff]
> [    0.000000]  [mem 0x11200000-0x113fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x111fffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x111fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x11400000-0x12bdffff]
> [    0.000000]  [mem 0x11400000-0x129fffff] page 2M
> [    0.000000]  [mem 0x12a00000-0x12bdffff] page 4k
> [    0.000000] BRK [0x0d8b7000, 0x0d8b7fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x11525000-0x12bd7fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0C60 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000012BE18BD 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000012BE0B37 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000012BE0040 000AF7 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> [    0.000000] ACPI: SSDT 0x0000000012BE0BAB 000C5A (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000012BE1805 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000012BE1885 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff57d000 (        fee00000)
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x0000000012bdfff=
f]
> [    0.000000] NODE_DATA(0) allocated [mem 0x114fe000-0x11524fff]
> [    0.000000] cma: dma_contiguous_reserve(limit 12be0000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:1147e001, primary cpu clock
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000]  [ffffea0000000000-ffffea00005fffff] PMD -> [ffff880010600=
000-ffff880010bfffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x0000000012bdffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000012b=
dffff]
> [    0.000000] On node 0 totalpages: 76670
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1136 pages used for memmap
> [    0.000000]   DMA32 zone: 72672 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff57d000 (        fee00000)
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.000000] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI =
0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, API=
C INT 02
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, API=
C INT 05
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, API=
C INT 09
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, API=
C INT 0a
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, API=
C INT 0b
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, API=
C INT 01
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, API=
C INT 03
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, API=
C INT 04
> [    0.000000] ACPI: IRQ5 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, API=
C INT 06
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, API=
C INT 07
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, API=
C INT 08
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] ACPI: IRQ10 used by override.
> [    0.000000] ACPI: IRQ11 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, API=
C INT 0c
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, API=
C INT 0d
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, API=
C INT 0e
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, API=
C INT 0f
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [    0.000000] mapped IOAPIC to ffffffffff57c000 (fec00000)
> [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 =
nr_node_ids:1
> [    0.000000] PERCPU: Embedded 29 pages/cpu @ffff880011000000 s86976 r0 =
d31808 u1048576
> [    0.000000] pcpu-alloc: s86976 r0 d31808 u1048576 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1100d0c0
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.  To=
tal pages: 75449
> [    0.000000] Policy zone: DMA32
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled r=
cupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3Dtt=
yS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-=
tests/run-queue/kvm/x86_64-randconfig-h0-06261249/linux-devel:devel-spot-20=
1506261220:e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8:bisect-linux-8/.vmlinuz=
-e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8-20150627024253-9-ivb42 branch=3Dl=
inux-devel/devel-spot-201506261220 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfi=
g-h0-06261249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-4.1.=
0-01336-ge9c469c drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Memory: 225792K/306680K available (13046K kernel code, 576=
3K rwdata, 6832K rodata, 1292K init, 20256K bss, 80888K reserved, 0K cma-re=
served)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D64, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:4352 nr_irqs:440 16
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 4.1.0-01336-ge9c469c (kbuild(a)ivytown2) (gc=
c version 4.9.2 (Debian 4.9.2-10) ) #1 SMP Sat Jun 27 02:42:21 CST 2015
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate=
.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1=
15200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests=
/run-queue/kvm/x86_64-randconfig-h0-06261249/linux-devel:devel-spot-2015062=
61220:e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8:bisect-linux-8/.vmlinuz-e9c4=
69cb57d2ccf6e7e5e8e6f869fc579adb58e8-20150627024253-9-ivb42 branch=3Dlinux-=
devel/devel-spot-201506261220 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-h0-=
06261249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-4.1.0-013=
36-ge9c469c drbd.minor_count=3D8
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Centaur CentaurHauls
> [    0.000000] x86/fpu: Legacy x87 FPU detected.
> [    0.000000] x86/fpu: Using 'lazy' FPU context switches.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000012bdffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000012be0000-0x0000000012bfffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x400000000
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0e80-0x000f0e8f] mapped a=
t [ffff8800000f0e80]
> [    0.000000]   mpc: f0e90-f0fac
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x0d8b4000, 0x0d8b4fff] PGTABLE
> [    0.000000] BRK [0x0d8b5000, 0x0d8b5fff] PGTABLE
> [    0.000000] BRK [0x0d8b6000, 0x0d8b6fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x11200000-0x113fffff]
> [    0.000000]  [mem 0x11200000-0x113fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x111fffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x111fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x11400000-0x12bdffff]
> [    0.000000]  [mem 0x11400000-0x129fffff] page 2M
> [    0.000000]  [mem 0x12a00000-0x12bdffff] page 4k
> [    0.000000] BRK [0x0d8b7000, 0x0d8b7fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x11525000-0x12bd7fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0C60 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000012BE18BD 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000012BE0B37 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000012BE0040 000AF7 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> [    0.000000] ACPI: SSDT 0x0000000012BE0BAB 000C5A (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000012BE1805 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000012BE1885 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff57d000 (        fee00000)
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x0000000012bdfff=
f]
> [    0.000000] NODE_DATA(0) allocated [mem 0x114fe000-0x11524fff]
> [    0.000000] cma: dma_contiguous_reserve(limit 12be0000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:1147e001, primary cpu clock
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000]  [ffffea0000000000-ffffea00005fffff] PMD -> [ffff880010600=
000-ffff880010bfffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x0000000012bdffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000012b=
dffff]
> [    0.000000] On node 0 totalpages: 76670
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1136 pages used for memmap
> [    0.000000]   DMA32 zone: 72672 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff57d000 (        fee00000)
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.000000] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI =
0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, API=
C INT 02
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, API=
C INT 05
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, API=
C INT 09
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, API=
C INT 0a
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high lev=
el)
> [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, API=
C INT 0b
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, API=
C INT 01
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, API=
C INT 03
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, API=
C INT 04
> [    0.000000] ACPI: IRQ5 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, API=
C INT 06
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, API=
C INT 07
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, API=
C INT 08
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] ACPI: IRQ10 used by override.
> [    0.000000] ACPI: IRQ11 used by override.
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, API=
C INT 0c
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, API=
C INT 0d
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, API=
C INT 0e
> [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, API=
C INT 0f
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
> [    0.000000] mapped IOAPIC to ffffffffff57c000 (fec00000)
> [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:2 nr_cpu_ids:2 =
nr_node_ids:1
> [    0.000000] PERCPU: Embedded 29 pages/cpu @ffff880011000000 s86976 r0 =
d31808 u1048576
> [    0.000000] pcpu-alloc: s86976 r0 d31808 u1048576 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1100d0c0
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.  To=
tal pages: 75449
> [    0.000000] Policy zone: DMA32
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled r=
cupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3Dtt=
yS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-=
tests/run-queue/kvm/x86_64-randconfig-h0-06261249/linux-devel:devel-spot-20=
1506261220:e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8:bisect-linux-8/.vmlinuz=
-e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8-20150627024253-9-ivb42 branch=3Dl=
inux-devel/devel-spot-201506261220 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfi=
g-h0-06261249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-4.1.=
0-01336-ge9c469c drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Memory: 225792K/306680K available (13046K kernel code, 576=
3K rwdata, 6832K rodata, 1292K init, 20256K bss, 80888K reserved, 0K cma-re=
served)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D64, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:4352 nr_irqs:440 16
> [    0.000000] console [ttyS0] enabled
> [    0.000000] console [ttyS0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
., Ingo Molnar
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000]  memory used by lock dependency info: 8159 kB
> [    0.000000]  memory used by lock dependency info: 8159 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] ODEBUG: selftest passed
> [    0.000000] ODEBUG: selftest passed
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.000000] hpet clockevent registered
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.020000] Calibrating delay loop (skipped) preset value.. =

> [    0.020000] Calibrating delay loop (skipped) preset value.. 5387.01 Bo=
goMIPS (lpj=3D26935080)
> 5387.01 BogoMIPS (lpj=3D26935080)
> [    0.020000] pid_max: default: 32768 minimum: 301
> [    0.020000] pid_max: default: 32768 minimum: 301
> [    0.020000] ACPI: Core revision 20150410
> [    0.020000] ACPI: Core revision 20150410
> [    0.031262] ACPI: =

> [    0.031262] ACPI: All ACPI Tables successfully acquiredAll ACPI Tables=
 successfully acquired
> =

> [    0.033158] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.033158] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.035389] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.035389] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.037403] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
> [    0.037403] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
> [    0.039231] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.039231] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.040941] Initializing cgroup subsys perf_event
> [    0.040941] Initializing cgroup subsys perf_event
> [    0.042209] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.042209] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.043482] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.043482] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.045186] Freeing SMP alternatives memory: 28K (ffffffff8c4e5000 - f=
fffffff8c4ec000)
> [    0.045186] Freeing SMP alternatives memory: 28K (ffffffff8c4e5000 - f=
fffffff8c4ec000)
> [    0.052001] enabled ExtINT on CPU#0
> [    0.052001] enabled ExtINT on CPU#0
> [    0.053761] ENABLING IO-APIC IRQs
> [    0.053761] ENABLING IO-APIC IRQs
> [    0.054591] init IO_APIC IRQs
> [    0.054591] init IO_APIC IRQs
> [    0.055320]  apic 0 pin 0 not connected
> [    0.055320]  apic 0 pin 0 not connected
> [    0.060078] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.060078] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.062501] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.062501] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.067608] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.067608] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.069557] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.069557] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.070000] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.070000]  apic 0 pin 16 not connected
> [    0.070000]  apic 0 pin 16 not connected
> [    0.070000]  apic 0 pin 17 not connected
> [    0.070000]  apic 0 pin 17 not connected
> [    0.070000]  apic 0 pin 18 not connected
> [    0.070000]  apic 0 pin 18 not connected
> [    0.070000]  apic 0 pin 19 not connected
> [    0.070000]  apic 0 pin 19 not connected
> [    0.070000]  apic 0 pin 20 not connected
> [    0.070000]  apic 0 pin 20 not connected
> [    0.070000]  apic 0 pin 21 not connected
> [    0.070000]  apic 0 pin 21 not connected
> [    0.070000]  apic 0 pin 22 not connected
> [    0.070000]  apic 0 pin 22 not connected
> [    0.070000]  apic 0 pin 23 not connected
> [    0.070000]  apic 0 pin 23 not connected
> [    0.070000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.070000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.070000] Using local APIC timer interrupts.
> [    0.070000] calibrating APIC timer ...
> [    0.070000] Using local APIC timer interrupts.
> [    0.070000] calibrating APIC timer ...
> [    0.070000] ... lapic delta =3D 10002945
> [    0.070000] ... lapic delta =3D 10002945
> [    0.070000] ... PM-Timer delta =3D 529853
> [    0.070000] ... PM-Timer delta =3D 529853
> [    0.070000] APIC calibration not consistent with PM-Timer: 148ms inste=
ad of 100ms
> [    0.070000] APIC calibration not consistent with PM-Timer: 148ms inste=
ad of 100ms
> [    0.070000] APIC delta adjusted to PM-Timer: 6757712 (10002945)
> [    0.070000] APIC delta adjusted to PM-Timer: 6757712 (10002945)
> [    0.070000] TSC delta adjusted to PM-Timer: 269334339 (398675829)
> [    0.070000] TSC delta adjusted to PM-Timer: 269334339 (398675829)
> [    0.070000] ..... delta 6757712
> [    0.070000] ..... delta 6757712
> [    0.070000] ..... mult: 290241520
> [    0.070000] ..... mult: 290241520
> [    0.070000] ..... calibration result: 10812339
> [    0.070000] ..... calibration result: 10812339
> [    0.070000] ..... CPU clock speed is 2693.3433 MHz.
> [    0.070000] ..... CPU clock speed is 2693.3433 MHz.
> [    0.070000] ..... host bus clock speed is 1081.2339 MHz.
> [    0.070000] ..... host bus clock speed is 1081.2339 MHz.
> [    0.070067] smpboot: CPU0: =

> [    0.070067] smpboot: CPU0: Intel Intel Common KVM processorCommon KVM =
processor (fam: 0f, model: 06 (fam: 0f, model: 06, stepping: 01)
> , stepping: 01)
> [    0.073555] Performance Events: =

> [    0.073555] Performance Events: unsupported Netburst CPU model 6 unsup=
ported Netburst CPU model 6 no PMU driver, software events only.
> no PMU driver, software events only.
> [    0.079413] x86: Booting SMP configuration:
> [    0.079413] x86: Booting SMP configuration:
> [    0.080020] .... node  #0, CPUs:  =

> [    0.080020] .... node  #0, CPUs:         #1 #1
> [    0.020000] kvm-clock: cpu 1, msr 0:1147e041, secondary cpu clock
> [    0.020000] masked ExtINT on CPU#1
> [    0.110218] x86: Booted up 1 node, 2 CPUs
> [    0.110218] x86: Booted up 1 node, 2 CPUs
> [    0.110186] KVM setup async PF for cpu 1
> [    0.110186] KVM setup async PF for cpu 1
> [    0.110186] kvm-stealtime: cpu 1, msr 1110d0c0
> [    0.110186] kvm-stealtime: cpu 1, msr 1110d0c0
> [    0.121148] smpboot: Total of 2 processors activated (10774.03 BogoMIP=
S)
> [    0.121148] smpboot: Total of 2 processors activated (10774.03 BogoMIP=
S)
> [    0.123569] devtmpfs: initialized
> [    0.123569] devtmpfs: initialized
> [    0.133897] gcov: version magic: 0x3430392a
> [    0.133897] gcov: version magic: 0x3430392a
> [    0.143639] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.143639] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.150154] xor: measuring software checksum speed
> [    0.150154] xor: measuring software checksum speed
> [    0.250012]    prefetch64-sse: 10042.800 MB/sec
> [    0.250012]    prefetch64-sse: 10042.800 MB/sec
> [    0.350011]    generic_sse:  5266.000 MB/sec
> [    0.350011]    generic_sse:  5266.000 MB/sec
> [    0.351171] xor: using function: prefetch64-sse (10042.800 MB/sec)
> [    0.351171] xor: using function: prefetch64-sse (10042.800 MB/sec)
> [    0.352817] prandom: seed boundary self test passed
> [    0.352817] prandom: seed boundary self test passed
> [    0.354971] prandom: 100 self tests passed
> [    0.354971] prandom: 100 self tests passed
> [    0.356068] atomic64_test: passed for x86-64 platform with CX8 and wit=
h SSE
> [    0.356068] atomic64_test: passed for x86-64 platform with CX8 and wit=
h SSE
> [    0.360923] regulator-dummy: no parameters
> [    0.360923] regulator-dummy: no parameters
> [    0.362228] RTC time:  2:38:53, date: 06/27/15
> [    0.362228] RTC time:  2:38:53, date: 06/27/15
> [    0.363989] NET: Registered protocol family 16
> [    0.363989] NET: Registered protocol family 16
> [    0.400079] cpuidle: using governor ladder
> [    0.400079] cpuidle: using governor ladder
> [    0.410055] cpuidle: using governor menu
> [    0.410055] cpuidle: using governor menu
> [    0.423771] ACPI: bus type PCI registered
> [    0.423771] ACPI: bus type PCI registered
> [    0.424907] PCI: Using configuration type 1 for base access
> [    0.424907] PCI: Using configuration type 1 for base access
> [    0.650012] raid6: sse2x1   gen()  1249 MB/s
> [    0.650012] raid6: sse2x1   gen()  1249 MB/s
> [    0.820028] raid6: sse2x1   xor()  1229 MB/s
> [    0.820028] raid6: sse2x1   xor()  1229 MB/s
> [    0.990045] raid6: sse2x2   gen()   974 MB/s
> [    0.990045] raid6: sse2x2   gen()   974 MB/s
> [    1.160019] raid6: sse2x2   xor()  1106 MB/s
> [    1.160019] raid6: sse2x2   xor()  1106 MB/s
> [    1.330046] raid6: sse2x4   gen()  1301 MB/s
> [    1.330046] raid6: sse2x4   gen()  1301 MB/s
> [    1.500033] raid6: sse2x4   xor()   845 MB/s
> [    1.500033] raid6: sse2x4   xor()   845 MB/s
> [    1.501184] raid6: using algorithm sse2x4 gen() 1301 MB/s
> [    1.501184] raid6: using algorithm sse2x4 gen() 1301 MB/s
> [    1.502592] raid6: .... xor() 845 MB/s, rmw enabled
> [    1.502592] raid6: .... xor() 845 MB/s, rmw enabled
> [    1.504016] raid6: using intx1 recovery algorithm
> [    1.504016] raid6: using intx1 recovery algorithm
> [    1.510079] ACPI: Added _OSI(Module Device)
> [    1.510079] ACPI: Added _OSI(Module Device)
> [    1.511301] ACPI: Added _OSI(Processor Device)
> [    1.511301] ACPI: Added _OSI(Processor Device)
> [    1.512574] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    1.512574] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    1.520008] ACPI: Added _OSI(Processor Aggregator Device)
> [    1.520008] ACPI: Added _OSI(Processor Aggregator Device)
> [    1.529766] ACPI: Interpreter enabled
> [    1.529766] ACPI: Interpreter enabled
> [    1.530014] ACPI Exception: AE_NOT_FOUND, =

> [    1.530014] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S1_]While evaluating Sleep State [\_S1_] (20150410/hwxface-580)
>  (20150410/hwxface-580)
> [    1.532509] ACPI Exception: AE_NOT_FOUND, =

> [    1.532509] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S2_]While evaluating Sleep State [\_S2_] (20150410/hwxface-580)
>  (20150410/hwxface-580)
> [    1.535285] ACPI: (supports S0 S3 S5)
> [    1.535285] ACPI: (supports S0 S3 S5)
> [    1.536424] ACPI: Using IOAPIC for interrupt routing
> [    1.536424] ACPI: Using IOAPIC for interrupt routing
> [    1.537957] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    1.537957] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    1.559303] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    1.559303] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    1.560017] acpi PNP0A03:00: _OSC: OS supports [Segments]
> [    1.560017] acpi PNP0A03:00: _OSC: OS supports [Segments]
> [    1.561529] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    1.561529] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    1.564158] PCI host bridge to bus 0000:00
> [    1.564158] PCI host bridge to bus 0000:00
> [    1.565357] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.565357] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    1.567044] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    1.567044] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    1.568918] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff wind=
ow]
> [    1.568918] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff wind=
ow]
> [    1.570009] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff wind=
ow]
> [    1.570009] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff wind=
ow]
> [    1.571793] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf wind=
ow]
> [    1.571793] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf wind=
ow]
> [    1.573555] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff wind=
ow]
> [    1.573555] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff wind=
ow]
> [    1.575353] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    1.575353] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    1.577418] pci_bus 0000:00: root bus resource [mem 0x12c00000-0xfebff=
fff window]
> [    1.577418] pci_bus 0000:00: root bus resource [mem 0x12c00000-0xfebff=
fff window]
> [    1.579702] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    1.579702] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    1.581276] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    1.581276] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    1.584110] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    1.584110] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    1.610017] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
> [    1.610017] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
> [    1.621578] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    1.621578] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    1.630007] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    1.630007] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    1.631725] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    1.631725] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    1.633612] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    1.633612] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    1.636268] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    1.636268] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    1.640534] pci 0000:00:01.3: can't claim BAR 7 [io  0x0600-0x063f]: a=
ddress conflict with ACPI PM1a_EVT_BLK [io  0x0600-0x0603]
> [    1.640534] pci 0000:00:01.3: can't claim BAR 7 [io  0x0600-0x063f]: a=
ddress conflict with ACPI PM1a_EVT_BLK [io  0x0600-0x0603]
> [    1.650024] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    1.650024] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    1.652657] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    1.652657] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    1.663234] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    1.663234] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    1.670040] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    1.670040] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    1.730034] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    1.730034] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    1.732828] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    1.732828] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    1.740013] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    1.740013] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    1.760021] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    1.760021] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    1.823278] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    1.823278] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    1.826077] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> [    1.826077] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> [    1.840019] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    1.840019] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    1.850015] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    1.850015] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    1.900968] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> [    1.900968] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> [    1.916284] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> [    1.916284] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> [    1.923048] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> [    1.923048] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> [    1.953993] pci 0000:00:06.0: [1af4:1001] type 00 class 0x010000
> [    1.953993] pci 0000:00:06.0: [1af4:1001] type 00 class 0x010000
> [    1.960015] pci 0000:00:06.0: reg 0x10: [io  0xc0c0-0xc0ff]
> [    1.960015] pci 0000:00:06.0: reg 0x10: [io  0xc0c0-0xc0ff]
> [    1.967598] pci 0000:00:06.0: reg 0x14: [mem 0xfebf3000-0xfebf3fff]
> [    1.967598] pci 0000:00:06.0: reg 0x14: [mem 0xfebf3000-0xfebf3fff]
> [    1.997084] pci 0000:00:07.0: [1af4:1001] type 00 class 0x010000
> [    1.997084] pci 0000:00:07.0: [1af4:1001] type 00 class 0x010000
> [    2.006245] pci 0000:00:07.0: reg 0x10: [io  0xc100-0xc13f]
> [    2.006245] pci 0000:00:07.0: reg 0x10: [io  0xc100-0xc13f]
> [    2.013008] pci 0000:00:07.0: reg 0x14: [mem 0xfebf4000-0xfebf4fff]
> [    2.013008] pci 0000:00:07.0: reg 0x14: [mem 0xfebf4000-0xfebf4fff]
> [    2.044019] pci 0000:00:08.0: [1af4:1001] type 00 class 0x010000
> [    2.044019] pci 0000:00:08.0: [1af4:1001] type 00 class 0x010000
> [    2.050020] pci 0000:00:08.0: reg 0x10: [io  0xc140-0xc17f]
> [    2.050020] pci 0000:00:08.0: reg 0x10: [io  0xc140-0xc17f]
> [    2.060015] pci 0000:00:08.0: reg 0x14: [mem 0xfebf5000-0xfebf5fff]
> [    2.060015] pci 0000:00:08.0: reg 0x14: [mem 0xfebf5000-0xfebf5fff]
> [    2.090989] pci 0000:00:09.0: [1af4:1001] type 00 class 0x010000
> [    2.090989] pci 0000:00:09.0: [1af4:1001] type 00 class 0x010000
> [    2.098810] pci 0000:00:09.0: reg 0x10: [io  0xc180-0xc1bf]
> [    2.098810] pci 0000:00:09.0: reg 0x10: [io  0xc180-0xc1bf]
> [    2.106108] pci 0000:00:09.0: reg 0x14: [mem 0xfebf6000-0xfebf6fff]
> [    2.106108] pci 0000:00:09.0: reg 0x14: [mem 0xfebf6000-0xfebf6fff]
> [    2.137259] pci 0000:00:0a.0: [1af4:1001] type 00 class 0x010000
> [    2.137259] pci 0000:00:0a.0: [1af4:1001] type 00 class 0x010000
> [    2.143061] pci 0000:00:0a.0: reg 0x10: [io  0xc1c0-0xc1ff]
> [    2.143061] pci 0000:00:0a.0: reg 0x10: [io  0xc1c0-0xc1ff]
> [    2.150016] pci 0000:00:0a.0: reg 0x14: [mem 0xfebf7000-0xfebf7fff]
> [    2.150016] pci 0000:00:0a.0: reg 0x14: [mem 0xfebf7000-0xfebf7fff]
> [    2.181018] pci 0000:00:0b.0: [8086:25ab] type 00 class 0x088000
> [    2.181018] pci 0000:00:0b.0: [8086:25ab] type 00 class 0x088000
> [    2.185993] pci 0000:00:0b.0: reg 0x10: [mem 0xfebf8000-0xfebf800f]
> [    2.185993] pci 0000:00:0b.0: reg 0x10: [mem 0xfebf8000-0xfebf800f]
> [    2.209097] ACPI: PCI Interrupt Link [LNKA] (IRQs
> [    2.209097] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 5 *10 *10 11 11))
> =

> [    2.210870] ACPI: PCI Interrupt Link [LNKB] (IRQs
> [    2.210870] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 5 *10 *10 11 11))
> =

> [    2.212846] ACPI: PCI Interrupt Link [LNKC] (IRQs
> [    2.212846] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 5 10 10 *11 *11))
> =

> [    2.215003] ACPI: PCI Interrupt Link [LNKD] (IRQs
> [    2.215003] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 5 10 10 *11 *11))
> =

> [    2.216872] ACPI: PCI Interrupt Link [LNKS] (IRQs
> [    2.216872] ACPI: PCI Interrupt Link [LNKS] (IRQs *9 *9))
> =

> [    2.220320] ACPI: =

> [    2.220320] ACPI: Enabled 16 GPEs in block 00 to 0FEnabled 16 GPEs in =
block 00 to 0F
> =

> [    2.223054] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    2.223054] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    2.223054] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    2.223054] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    2.223054] vgaarb: loaded
> [    2.223054] vgaarb: loaded
> [    2.223054] vgaarb: bridge control possible 0000:00:02.0
> [    2.223054] vgaarb: bridge control possible 0000:00:02.0
> [    2.223478] SCSI subsystem initialized
> [    2.223478] SCSI subsystem initialized
> [    2.230141] libata version 3.00 loaded.
> [    2.230141] libata version 3.00 loaded.
> [    2.231287] ACPI: bus type USB registered
> [    2.231287] ACPI: bus type USB registered
> [    2.232494] usbcore: registered new interface driver usbfs
> [    2.232494] usbcore: registered new interface driver usbfs
> [    2.234046] usbcore: registered new interface driver hub
> [    2.234046] usbcore: registered new interface driver hub
> [    2.240019] usbcore: registered new device driver usb
> [    2.240019] usbcore: registered new device driver usb
> [    2.240246] Linux video capture interface: v2.00
> [    2.240246] Linux video capture interface: v2.00
> [    2.250380] PCI: Using ACPI for IRQ routing
> [    2.250380] PCI: Using ACPI for IRQ routing
> [    2.251363] PCI: pci_cache_line_size set to 64 bytes
> [    2.251363] PCI: pci_cache_line_size set to 64 bytes
> [    2.253097] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    2.253097] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    2.254889] e820: reserve RAM buffer [mem 0x12be0000-0x13ffffff]
> [    2.254889] e820: reserve RAM buffer [mem 0x12be0000-0x13ffffff]
> [    2.270102] clocksource: Switched to clocksource kvm-clock
> [    2.270102] clocksource: Switched to clocksource kvm-clock
> [    2.272267] FS-Cache: Loaded
> [    2.272267] FS-Cache: Loaded
> [    2.273361] CacheFiles: Loaded
> [    2.273361] CacheFiles: Loaded
> [    2.274334] pnp: PnP ACPI init
> [    2.274334] pnp: PnP ACPI init
> [    2.275558] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    2.275558] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    2.277636] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    2.277636] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    2.279742] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    2.279742] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    2.281815] pnp 00:03: [dma 2]
> [    2.281815] pnp 00:03: [dma 2]
> [    2.282975] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    2.282975] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    2.285172] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    2.285172] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    2.287226] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    2.287226] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    2.290250] pnp: PnP ACPI: found 6 devices
> [    2.290250] pnp: PnP ACPI: found 6 devices
> [    2.297900] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    2.297900] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    2.300863] pci 0000:00:01.3: BAR 7: [io  size 0x0040] has bogus align=
ment
> [    2.300863] pci 0000:00:01.3: BAR 7: [io  size 0x0040] has bogus align=
ment
> [    2.303055] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    2.303055] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    2.304868] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff window]
> [    2.304868] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff window]
> [    2.306676] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff window]
> [    2.306676] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff window]
> [    2.308487] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf window]
> [    2.308487] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf window]
> [    2.310302] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff window]
> [    2.310302] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff window]
> [    2.312146] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff win=
dow]
> [    2.312146] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff win=
dow]
> [    2.314165] pci_bus 0000:00: resource 10 [mem 0x12c00000-0xfebfffff wi=
ndow]
> [    2.314165] pci_bus 0000:00: resource 10 [mem 0x12c00000-0xfebfffff wi=
ndow]
> [    2.318780] NET: Registered protocol family 1
> [    2.318780] NET: Registered protocol family 1
> [    2.320109] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    2.320109] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    2.321911] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    2.321911] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    2.323628] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    2.323628] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    2.325474] pci 0000:00:02.0: Video device with shadowed ROM
> [    2.325474] pci 0000:00:02.0: Video device with shadowed ROM
> [    2.327268] PCI: CLS 0 bytes, default 64
> [    2.327268] PCI: CLS 0 bytes, default 64
> [    2.341232] Unpacking initramfs...
> [    2.341232] Unpacking initramfs...
> [    3.628254] Freeing initrd memory: 23244K (ffff880011525000 - ffff8800=
12bd8000)
> [    3.628254] Freeing initrd memory: 23244K (ffff880011525000 - ffff8800=
12bd8000)
> [    3.644896] des3_ede-x86_64: performance on this CPU would be suboptim=
al: disabling des3_ede-x86_64.
> [    3.644896] des3_ede-x86_64: performance on this CPU would be suboptim=
al: disabling des3_ede-x86_64.
> [    3.647413] camellia-x86_64: performance on this CPU would be suboptim=
al: disabling camellia-x86_64.
> [    3.647413] camellia-x86_64: performance on this CPU would be suboptim=
al: disabling camellia-x86_64.
> [    3.649895] blowfish-x86_64: performance on this CPU would be suboptim=
al: disabling blowfish-x86_64.
> [    3.649895] blowfish-x86_64: performance on this CPU would be suboptim=
al: disabling blowfish-x86_64.
> [    3.652641] cryptomgr_test (31) used greatest stack depth: 14376 bytes=
 left
> [    3.652641] cryptomgr_test (31) used greatest stack depth: 14376 bytes=
 left
> [    3.655595] twofish-x86_64-3way: performance on this CPU would be subo=
ptimal: disabling twofish-x86_64-3way.
> [    3.655595] twofish-x86_64-3way: performance on this CPU would be subo=
ptimal: disabling twofish-x86_64-3way.
> [    3.661469] sha1_ssse3: Neither AVX nor AVX2 nor SSSE3 is available/us=
able.
> [    3.661469] sha1_ssse3: Neither AVX nor AVX2 nor SSSE3 is available/us=
able.
> [    3.663358] PCLMULQDQ-NI instructions are not detected.
> [    3.663358] PCLMULQDQ-NI instructions are not detected.
> [    3.664771] CPU feature 'AVX registers' is not supported.
> [    3.664771] CPU feature 'AVX registers' is not supported.
> [    3.666242] CPU feature 'AVX registers' is not supported.
> [    3.666242] CPU feature 'AVX registers' is not supported.
> [    3.667705] CPU feature 'AVX registers' is not supported.
> [    3.667705] CPU feature 'AVX registers' is not supported.
> [    3.669266] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    3.669266] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    3.674076] spin_lock-torture: Creating torture_shuffle task
> [    3.674076] spin_lock-torture: Creating torture_shuffle task
> [    3.675768] spin_lock-torture: torture_shuffle task started
> [    3.675768] spin_lock-torture: torture_shuffle task started
> [    3.677334] spin_lock-torture: Creating torture_stutter task
> [    3.677334] spin_lock-torture: Creating torture_stutter task
> [    3.678969] spin_lock-torture: torture_stutter task started
> [    3.678969] spin_lock-torture: torture_stutter task started
> [    3.680524] spin_lock-torture: Creating lock_torture_writer task
> [    3.680524] spin_lock-torture: Creating lock_torture_writer task
> [    3.682526] spin_lock-torture: lock_torture_writer task started
> [    3.682526] spin_lock-torture: lock_torture_writer task started
> [    3.694889] spin_lock-torture: Creating lock_torture_writer task
> [    3.694889] spin_lock-torture: Creating lock_torture_writer task
> [    3.696763] spin_lock-torture: Creating lock_torture_writer task
> [    3.696763] spin_lock-torture: Creating lock_torture_writer task
> [    3.698397] spin_lock-torture: lock_torture_writer task started
> [    3.698397] spin_lock-torture: lock_torture_writer task started
> [    3.700117] spin_lock-torture: Creating lock_torture_writer task
> [    3.700117] spin_lock-torture: Creating lock_torture_writer task
> [    3.702009] spin_lock-torture: lock_torture_writer task started
> [    3.702009] spin_lock-torture: lock_torture_writer task started
> [    3.707001] spin_lock-torture: lock_torture_writer task started
> [    3.707001] spin_lock-torture: lock_torture_writer task started
> [    3.708729] spin_lock-torture: Creating lock_torture_stats task
> [    3.708729] spin_lock-torture: Creating lock_torture_stats task
> [    3.719012] spin_lock-torture: lock_torture_stats task started
> [    3.719012] spin_lock-torture: lock_torture_stats task started
> [    3.720045] torture_init_begin: refusing rcu init: spin_lock running
> [    3.720045] torture_init_begin: refusing rcu init: spin_lock running
> [    3.720045] futex hash table entries: 512 (order: 4, 65536 bytes)
> [    3.720045] futex hash table entries: 512 (order: 4, 65536 bytes)
> [    4.360090] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    4.360090] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    4.374980] zbud: loaded
> [    4.374980] zbud: loaded
> [    4.376648] VFS: Disk quotas dquot_6.6.0
> [    4.376648] VFS: Disk quotas dquot_6.6.0
> [    4.377887] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    4.377887] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    4.382151] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    4.382151] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> [    4.385309] ntfs: driver 2.1.32 [Flags: R/O].
> [    4.385309] ntfs: driver 2.1.32 [Flags: R/O].
> [    4.387037] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [    4.387037] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [    4.388632] QNX4 filesystem 0.2.3 registered.
> [    4.388632] QNX4 filesystem 0.2.3 registered.
> [    4.389907] qnx6: QNX6 filesystem 1.0.0 registered.
> [    4.389907] qnx6: QNX6 filesystem 1.0.0 registered.
> [    4.391519] befs: version: 0.9.3
> [    4.391519] befs: version: 0.9.3
> [    4.406411] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 251)
> [    4.406411] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 251)
> [    4.408592] io scheduler noop registered (default)
> [    4.408592] io scheduler noop registered (default)
> [    4.409766] io scheduler deadline registered
> [    4.409766] io scheduler deadline registered
> [    4.411011] start plist test
> [    4.411011] start plist test
> [    4.414758] end plist test
> [    4.414758] end plist test
> [    4.415437] test_string_helpers: Running tests...
> [    4.415437] test_string_helpers: Running tests...
> [    4.438736] crc32: CRC_LE_BITS =3D 1, CRC_BE BITS =3D 1
> [    4.438736] crc32: CRC_LE_BITS =3D 1, CRC_BE BITS =3D 1
> [    4.439945] crc32: self tests passed, processed 225944 bytes in 106769=
32 nsec
> [    4.439945] crc32: self tests passed, processed 225944 bytes in 106769=
32 nsec
> [    4.452004] crc32c: CRC_LE_BITS =3D 1
> [    4.452004] crc32c: CRC_LE_BITS =3D 1
> [    4.452880] crc32c: self tests passed, processed 225944 bytes in 49229=
83 nsec
> [    4.452880] crc32c: self tests passed, processed 225944 bytes in 49229=
83 nsec
> [    4.632547] tsc: Refined TSC clocksource calibration: 2693.501 MHz
> [    4.632547] tsc: Refined TSC clocksource calibration: 2693.501 MHz
> [    4.634074] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
6d342ea19f, max_idle_ns: 440795269462 ns
> [    4.634074] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
6d342ea19f, max_idle_ns: 440795269462 ns
> [    4.963879] crc32_combine: 8373 self tests passed
> [    4.963879] crc32_combine: 8373 self tests passed
> [    5.463370] crc32c_combine: 8373 self tests passed
> [    5.463370] crc32c_combine: 8373 self tests passed
> [    5.465335] xz_dec_test: module loaded
> [    5.465335] xz_dec_test: module loaded
> [    5.466449] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 250 0' and write .xz files to it.
> [    5.466449] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 250 0' and write .xz files to it.
> [    5.470606] ipmi message handler version 39.2
> [    5.470606] ipmi message handler version 39.2
> [    5.471938] ipmi device interface
> [    5.471938] ipmi device interface
> [    5.473027] IPMI System Interface driver.
> [    5.473027] IPMI System Interface driver.
> [    5.474552] ipmi_si: Unable to find any System Interface(s)
> [    5.474552] ipmi_si: Unable to find any System Interface(s)
> [    5.478414] IPMI SSIF Interface driver
> [    5.478414] IPMI SSIF Interface driver
> [    5.479576] IPMI Watchdog: driver initialized
> [    5.479576] IPMI Watchdog: driver initialized
> [    5.481524] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    5.481524] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    5.483650] ACPI: Power Button [PWRF]
> [    5.483650] ACPI: Power Button [PWRF]
> [    5.615562] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    5.615562] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    5.616956] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    5.616956] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    5.687956] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    5.687956] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    5.695565] Non-volatile memory driver v1.3
> [    5.695565] Non-volatile memory driver v1.3
> [    5.697219] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    5.697219] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    5.698732] smapi::smapi_init, ERROR invalid usSmapiID
> [    5.698732] smapi::smapi_init, ERROR invalid usSmapiID
> [    5.700254] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    5.700254] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    5.703112] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    5.703112] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    5.705319] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    5.705319] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    5.707232] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    5.707232] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    5.723383] [drm] Initialized drm 1.1.0 20060810
> [    5.723383] [drm] Initialized drm 1.1.0 20060810
> [    5.725766] usbcore: registered new interface driver udl
> [    5.725766] usbcore: registered new interface driver udl
> [    5.729015] dummy-irq: no IRQ given.  Use irq=3DN
> [    5.729015] dummy-irq: no IRQ given.  Use irq=3DN
> [    5.730490] lkdtm: No crash points registered, enable through debugfs
> [    5.730490] lkdtm: No crash points registered, enable through debugfs
> [    5.733326] usbcore: registered new interface driver rtsx_usb
> [    5.733326] usbcore: registered new interface driver rtsx_usb
> [    5.735766] Uniform Multi-Platform E-IDE driver
> [    5.735766] Uniform Multi-Platform E-IDE driver
> [    5.737257] ide_generic: please use "probe_mask=3D0x3f" module paramet=
er for probing all legacy ISA IDE ports
> [    5.737257] ide_generic: please use "probe_mask=3D0x3f" module paramet=
er for probing all legacy ISA IDE ports
> [    5.763090] ide-gd driver 1.18
> [    5.763090] ide-gd driver 1.18
> [    5.764055] ide-cd driver 5.00
> [    5.764055] ide-cd driver 5.00
> [    5.765288] rdac: device handler registered
> [    5.765288] rdac: device handler registered
> [    5.791904] hp_sw: device handler registered
> [    5.791904] hp_sw: device handler registered
> [    5.793174] emc: device handler registered
> [    5.793174] emc: device handler registered
> [    5.794649] SCSI Media Changer driver v0.25 =

> [    5.794649] SCSI Media Changer driver v0.25 =

> [    5.796068] Error: Driver 'pata_platform' is already registered, abort=
ing...
> [    5.796068] Error: Driver 'pata_platform' is already registered, abort=
ing...
> [    5.813176] Rounding down aligned max_sectors from 4294967295 to 42949=
67288
> [    5.813176] Rounding down aligned max_sectors from 4294967295 to 42949=
67288
> [    5.816627] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    5.816627] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    5.818564] L440GX flash mapping: failed to find PIIX4 ISA bridge, can=
not continue
> [    5.818564] L440GX flash mapping: failed to find PIIX4 ISA bridge, can=
not continue
> [    5.843281] platform physmap-flash.0: failed to claim resource 0
> [    5.843281] platform physmap-flash.0: failed to claim resource 0
> [    5.845086] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> [    5.845086] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> [    5.847143] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.847143] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.850342] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.850342] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.853106] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.853106] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.855823] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.855823] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.858555] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.858555] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.875548] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.875548] [nandsim] warning: read_byte: unexpected data output cycle=
, state is STATE_READY return 0x0
> [    5.878282] nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> [    5.878282] nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> [    5.880132] nand: Toshiba NAND 128MiB 1,8V 8-bit
> [    5.880132] nand: Toshiba NAND 128MiB 1,8V 8-bit
> [    5.881495] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, OO=
B size: 16
> [    5.881495] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, OO=
B size: 16
> [    5.883735] flash size: 128 MiB
> [    5.883735] flash size: 128 MiB
> [    5.893610] page size: 512 bytes
> [    5.893610] page size: 512 bytes
> [    5.894576] OOB area size: 16 bytes
> [    5.894576] OOB area size: 16 bytes
> [    5.895602] sector size: 16 KiB
> [    5.895602] sector size: 16 KiB
> [    5.896527] pages number: 262144
> [    5.896527] pages number: 262144
> [    5.897476] pages per sector: 32
> [    5.897476] pages per sector: 32
> [    5.898428] bus width: 8
> [    5.898428] bus width: 8
> [    5.899179] bits in sector size: 14
> [    5.899179] bits in sector size: 14
> [    5.900204] bits in page size: 9
> [    5.900204] bits in page size: 9
> [    5.901174] bits in OOB size: 4
> [    5.901174] bits in OOB size: 4
> [    5.902108] flash size with OOB: 135168 KiB
> [    5.902108] flash size with OOB: 135168 KiB
> [    5.903332] page address bytes: 4
> [    5.903332] page address bytes: 4
> [    5.904306] sector address bytes: 3
> [    5.904306] sector address bytes: 3
> [    5.922640] options: 0x42
> [    5.922640] options: 0x42
> [    5.925169] Scanning device for bad blocks
> [    5.925169] Scanning device for bad blocks
> [    5.998332] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> [    5.998332] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> [    6.000104] 0x000000000000-0x000008000000 : "NAND simulator partition =
0"
> [    6.000104] 0x000000000000-0x000008000000 : "NAND simulator partition =
0"
> [    6.023668] usbcore: registered new interface driver hwa-rc
> [    6.023668] usbcore: registered new interface driver hwa-rc
> [    6.025702] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    6.025702] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    6.027612] ehci-pci: EHCI PCI platform driver
> [    6.027612] ehci-pci: EHCI PCI platform driver
> [    6.028978] ehci-platform: EHCI generic platform driver
> [    6.028978] ehci-platform: EHCI generic platform driver
> [    6.030702] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    6.030702] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    6.032593] ohci-pci: OHCI PCI platform driver
> [    6.032593] ohci-pci: OHCI PCI platform driver
> [    6.033965] ohci-platform: OHCI generic platform driver
> [    6.033965] ohci-platform: OHCI generic platform driver
> [    6.035578] usbcore: registered new interface driver hwa-hc
> [    6.035578] usbcore: registered new interface driver hwa-hc
> [    6.037244] fusbh200_hcd: FUSBH200 Host Controller (EHCI) Driver
> [    6.037244] fusbh200_hcd: FUSBH200 Host Controller (EHCI) Driver
> [    6.039000] Warning! fusbh200_hcd should always be loaded before uhci_=
hcd and ohci_hcd, not after
> [    6.039000] Warning! fusbh200_hcd should always be loaded before uhci_=
hcd and ohci_hcd, not after
> [    6.051691] usbcore: registered new interface driver wusb-cbaf
> [    6.051691] usbcore: registered new interface driver wusb-cbaf
> [    6.053455] usbcore: registered new interface driver cdc_acm
> [    6.053455] usbcore: registered new interface driver cdc_acm
> [    6.055114] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
> [    6.055114] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
> [    6.057478] usbcore: registered new interface driver cdc_wdm
> [    6.057478] usbcore: registered new interface driver cdc_wdm
> [    6.059196] usbcore: registered new interface driver usbtmc
> [    6.059196] usbcore: registered new interface driver usbtmc
> [    6.060927] usbcore: registered new interface driver usb-storage
> [    6.060927] usbcore: registered new interface driver usb-storage
> [    6.062721] usbcore: registered new interface driver ums-cypress
> [    6.062721] usbcore: registered new interface driver ums-cypress
> [    6.083055] usbcore: registered new interface driver ums-datafab
> [    6.083055] usbcore: registered new interface driver ums-datafab
> [    6.084844] usbcore: registered new interface driver ums_eneub6250
> [    6.084844] usbcore: registered new interface driver ums_eneub6250
> [    6.086697] usbcore: registered new interface driver ums-isd200
> [    6.086697] usbcore: registered new interface driver ums-isd200
> [    6.088477] usbcore: registered new interface driver ums-jumpshot
> [    6.088477] usbcore: registered new interface driver ums-jumpshot
> [    6.090298] usbcore: registered new interface driver ums-onetouch
> [    6.090298] usbcore: registered new interface driver ums-onetouch
> [    6.092168] usbcore: registered new interface driver ums-realtek
> [    6.092168] usbcore: registered new interface driver ums-realtek
> [    6.093969] usbcore: registered new interface driver ums-usbat
> [    6.093969] usbcore: registered new interface driver ums-usbat
> [    6.104347] usbcore: registered new interface driver microtekX6
> [    6.104347] usbcore: registered new interface driver microtekX6
> [    6.106213] usbcore: registered new interface driver usbserial
> [    6.106213] usbcore: registered new interface driver usbserial
> [    6.107965] usbcore: registered new interface driver ark3116
> [    6.107965] usbcore: registered new interface driver ark3116
> [    6.109781] usbserial: USB Serial support registered for ark3116
> [    6.109781] usbserial: USB Serial support registered for ark3116
> [    6.111633] usbcore: registered new interface driver belkin_sa
> [    6.111633] usbcore: registered new interface driver belkin_sa
> [    6.113388] usbserial: USB Serial support registered for Belkin / Pera=
com / GoHubs USB Serial Adapter
> [    6.113388] usbserial: USB Serial support registered for Belkin / Pera=
com / GoHubs USB Serial Adapter
> [    6.138224] usbcore: registered new interface driver ch341
> [    6.138224] usbcore: registered new interface driver ch341
> [    6.139905] usbserial: USB Serial support registered for ch341-uart
> [    6.139905] usbserial: USB Serial support registered for ch341-uart
> [    6.141845] usbcore: registered new interface driver cp210x
> [    6.141845] usbcore: registered new interface driver cp210x
> [    6.143540] usbserial: USB Serial support registered for cp210x
> [    6.143540] usbserial: USB Serial support registered for cp210x
> [    6.145309] usbcore: registered new interface driver cyberjack
> [    6.145309] usbcore: registered new interface driver cyberjack
> [    6.147065] usbserial: USB Serial support registered for Reiner SCT Cy=
berjack USB card reader
> [    6.147065] usbserial: USB Serial support registered for Reiner SCT Cy=
berjack USB card reader
> [    6.149584] usbcore: registered new interface driver cypress_m8
> [    6.149584] usbcore: registered new interface driver cypress_m8
> [    6.151595] usbserial: USB Serial support registered for DeLorme Earth=
mate USB
> [    6.151595] usbserial: USB Serial support registered for DeLorme Earth=
mate USB
> [    6.153800] usbserial: USB Serial support registered for HID->COM RS23=
2 Adapter
> [    6.153800] usbserial: USB Serial support registered for HID->COM RS23=
2 Adapter
> [    6.155986] usbserial: USB Serial support registered for Nokia CA-42 V=
2 Adapter
> [    6.155986] usbserial: USB Serial support registered for Nokia CA-42 V=
2 Adapter
> [    6.158162] usbcore: registered new interface driver usb_debug
> [    6.158162] usbcore: registered new interface driver usb_debug
> [    6.159918] usbserial: USB Serial support registered for debug
> [    6.159918] usbserial: USB Serial support registered for debug
> [    6.161710] usbcore: registered new interface driver digi_acceleport
> [    6.161710] usbcore: registered new interface driver digi_acceleport
> [    6.163663] usbserial: USB Serial support registered for Digi 2 port U=
SB adapter
> [    6.163663] usbserial: USB Serial support registered for Digi 2 port U=
SB adapter
> [    6.165830] usbserial: USB Serial support registered for Digi 4 port U=
SB adapter
> [    6.165830] usbserial: USB Serial support registered for Digi 4 port U=
SB adapter
> [    6.167991] usbcore: registered new interface driver io_ti
> [    6.167991] usbcore: registered new interface driver io_ti
> [    6.169607] usbserial: USB Serial support registered for Edgeport TI 1=
 port adapter
> [    6.169607] usbserial: USB Serial support registered for Edgeport TI 1=
 port adapter
> [    6.172009] usbserial: USB Serial support registered for Edgeport TI 2=
 port adapter
> [    6.172009] usbserial: USB Serial support registered for Edgeport TI 2=
 port adapter
> [    6.174231] usbcore: registered new interface driver f81232
> [    6.174231] usbcore: registered new interface driver f81232
> [    6.175889] usbserial: USB Serial support registered for f81232
> [    6.175889] usbserial: USB Serial support registered for f81232
> [    6.177625] usbcore: registered new interface driver ftdi_sio
> [    6.177625] usbcore: registered new interface driver ftdi_sio
> [    6.179390] usbserial: USB Serial support registered for FTDI USB Seri=
al Device
> [    6.179390] usbserial: USB Serial support registered for FTDI USB Seri=
al Device
> [    6.181613] usbcore: registered new interface driver garmin_gps
> [    6.181613] usbcore: registered new interface driver garmin_gps
> [    6.183484] usbserial: USB Serial support registered for Garmin GPS us=
b/tty
> [    6.183484] usbserial: USB Serial support registered for Garmin GPS us=
b/tty
> [    6.185565] usbcore: registered new interface driver ipw
> [    6.185565] usbcore: registered new interface driver ipw
> [    6.187176] usbserial: USB Serial support registered for IPWireless co=
nverter
> [    6.187176] usbserial: USB Serial support registered for IPWireless co=
nverter
> [    6.189307] usbcore: registered new interface driver ir_usb
> [    6.189307] usbcore: registered new interface driver ir_usb
> [    6.191033] usbserial: USB Serial support registered for IR Dongle
> [    6.191033] usbserial: USB Serial support registered for IR Dongle
> [    6.192885] usbcore: registered new interface driver keyspan
> [    6.192885] usbcore: registered new interface driver keyspan
> [    6.194641] usbserial: USB Serial support registered for Keyspan - (wi=
thout firmware)
> [    6.194641] usbserial: USB Serial support registered for Keyspan - (wi=
thout firmware)
> [    6.196972] usbserial: USB Serial support registered for Keyspan 1 por=
t adapter
> [    6.196972] usbserial: USB Serial support registered for Keyspan 1 por=
t adapter
> [    6.199139] usbserial: USB Serial support registered for Keyspan 2 por=
t adapter
> [    6.199139] usbserial: USB Serial support registered for Keyspan 2 por=
t adapter
> [    6.201361] usbserial: USB Serial support registered for Keyspan 4 por=
t adapter
> [    6.201361] usbserial: USB Serial support registered for Keyspan 4 por=
t adapter
> [    6.203712] usbcore: registered new interface driver kl5kusb105
> [    6.203712] usbcore: registered new interface driver kl5kusb105
> [    6.205497] usbserial: USB Serial support registered for KL5KUSB105D /=
 PalmConnect
> [    6.205497] usbserial: USB Serial support registered for KL5KUSB105D /=
 PalmConnect
> [    6.207746] usbcore: registered new interface driver mct_u232
> [    6.207746] usbcore: registered new interface driver mct_u232
> [    6.209482] usbserial: USB Serial support registered for MCT U232
> [    6.209482] usbserial: USB Serial support registered for MCT U232
> [    6.211365] usbcore: registered new interface driver metro_usb
> [    6.211365] usbcore: registered new interface driver metro_usb
> [    6.213129] usbserial: USB Serial support registered for Metrologic US=
B to Serial
> [    6.213129] usbserial: USB Serial support registered for Metrologic US=
B to Serial
> [    6.215342] usbcore: registered new interface driver mxuport
> [    6.215342] usbcore: registered new interface driver mxuport
> [    6.217130] usbserial: USB Serial support registered for MOXA UPort
> [    6.217130] usbserial: USB Serial support registered for MOXA UPort
> [    6.219019] usbcore: registered new interface driver navman
> [    6.219019] usbcore: registered new interface driver navman
> [    6.220689] usbserial: USB Serial support registered for navman
> [    6.220689] usbserial: USB Serial support registered for navman
> [    6.222578] usbcore: registered new interface driver opticon
> [    6.222578] usbcore: registered new interface driver opticon
> [    6.224289] usbserial: USB Serial support registered for opticon
> [    6.224289] usbserial: USB Serial support registered for opticon
> [    6.226075] usbcore: registered new interface driver option
> [    6.226075] usbcore: registered new interface driver option
> [    6.227757] usbserial: USB Serial support registered for GSM modem (1-=
port)
> [    6.227757] usbserial: USB Serial support registered for GSM modem (1-=
port)
> [    6.229832] usbcore: registered new interface driver oti6858
> [    6.229832] usbcore: registered new interface driver oti6858
> [    6.231642] usbserial: USB Serial support registered for oti6858
> [    6.231642] usbserial: USB Serial support registered for oti6858
> [    6.233440] usbcore: registered new interface driver pl2303
> [    6.233440] usbcore: registered new interface driver pl2303
> [    6.235158] usbserial: USB Serial support registered for pl2303
> [    6.235158] usbserial: USB Serial support registered for pl2303
> [    6.236957] usbcore: registered new interface driver qcaux
> [    6.236957] usbcore: registered new interface driver qcaux
> [    6.238611] usbserial: USB Serial support registered for qcaux
> [    6.238611] usbserial: USB Serial support registered for qcaux
> [    6.240361] usbcore: registered new interface driver qcserial
> [    6.240361] usbcore: registered new interface driver qcserial
> [    6.242238] usbserial: USB Serial support registered for Qualcomm USB =
modem
> [    6.242238] usbserial: USB Serial support registered for Qualcomm USB =
modem
> [    6.244387] usbcore: registered new interface driver safe_serial
> [    6.244387] usbcore: registered new interface driver safe_serial
> [    6.246177] usbserial: USB Serial support registered for safe_serial
> [    6.246177] usbserial: USB Serial support registered for safe_serial
> [    6.248023] usbcore: registered new interface driver sierra
> [    6.248023] usbcore: registered new interface driver sierra
> [    6.249675] usbserial: USB Serial support registered for Sierra USB mo=
dem
> [    6.249675] usbserial: USB Serial support registered for Sierra USB mo=
dem
> [    6.251792] usbcore: registered new interface driver usb_serial_simple
> [    6.251792] usbcore: registered new interface driver usb_serial_simple
> [    6.253714] usbserial: USB Serial support registered for carelink
> [    6.253714] usbserial: USB Serial support registered for carelink
> [    6.255503] usbserial: USB Serial support registered for zio
> [    6.255503] usbserial: USB Serial support registered for zio
> [    6.257174] usbserial: USB Serial support registered for funsoft
> [    6.257174] usbserial: USB Serial support registered for funsoft
> [    6.259043] usbserial: USB Serial support registered for flashloader
> [    6.259043] usbserial: USB Serial support registered for flashloader
> [    6.261073] usbserial: USB Serial support registered for google
> [    6.261073] usbserial: USB Serial support registered for google
> [    6.262958] usbserial: USB Serial support registered for vivopay
> [    6.262958] usbserial: USB Serial support registered for vivopay
> [    6.264792] usbserial: USB Serial support registered for moto_modem
> [    6.264792] usbserial: USB Serial support registered for moto_modem
> [    6.266690] usbserial: USB Serial support registered for novatel_gps
> [    6.266690] usbserial: USB Serial support registered for novatel_gps
> [    6.268630] usbserial: USB Serial support registered for hp4x
> [    6.268630] usbserial: USB Serial support registered for hp4x
> [    6.270551] usbserial: USB Serial support registered for suunto
> [    6.270551] usbserial: USB Serial support registered for suunto
> [    6.272489] usbserial: USB Serial support registered for siemens_mpi
> [    6.272489] usbserial: USB Serial support registered for siemens_mpi
> [    6.274444] usbcore: registered new interface driver visor
> [    6.274444] usbcore: registered new interface driver visor
> [    6.276152] usbserial: USB Serial support registered for Handspring Vi=
sor / Palm OS
> [    6.276152] usbserial: USB Serial support registered for Handspring Vi=
sor / Palm OS
> [    6.278472] usbserial: USB Serial support registered for Sony Clie 5.0
> [    6.278472] usbserial: USB Serial support registered for Sony Clie 5.0
> [    6.280463] usbserial: USB Serial support registered for Sony Clie 3.5
> [    6.280463] usbserial: USB Serial support registered for Sony Clie 3.5
> [    6.282622] usbcore: registered new interface driver whiteheat
> [    6.282622] usbcore: registered new interface driver whiteheat
> [    6.284443] usbserial: USB Serial support registered for Connect Tech =
- WhiteHEAT - (prerenumeration)
> [    6.284443] usbserial: USB Serial support registered for Connect Tech =
- WhiteHEAT - (prerenumeration)
> [    6.287338] usbserial: USB Serial support registered for Connect Tech =
- WhiteHEAT
> [    6.287338] usbserial: USB Serial support registered for Connect Tech =
- WhiteHEAT
> [    6.289697] usbcore: registered new interface driver keyspan_pda
> [    6.289697] usbcore: registered new interface driver keyspan_pda
> [    6.291670] usbserial: USB Serial support registered for Keyspan PDA
> [    6.291670] usbserial: USB Serial support registered for Keyspan PDA
> [    6.293686] usbserial: USB Serial support registered for Xircom / Entr=
ega PGS - (prerenumeration)
> [    6.293686] usbserial: USB Serial support registered for Xircom / Entr=
ega PGS - (prerenumeration)
> [    6.296466] usbcore: registered new interface driver xsens_mt
> [    6.296466] usbcore: registered new interface driver xsens_mt
> [    6.298301] usbserial: USB Serial support registered for xsens_mt
> [    6.298301] usbserial: USB Serial support registered for xsens_mt
> [    6.341689] usbcore: registered new interface driver appledisplay
> [    6.341689] usbcore: registered new interface driver appledisplay
> [    6.343664] usbcore: registered new interface driver cypress_cy7c63
> [    6.343664] usbcore: registered new interface driver cypress_cy7c63
> [    6.345658] usbcore: registered new interface driver emi26 - firmware =
loader
> [    6.345658] usbcore: registered new interface driver emi26 - firmware =
loader
> [    6.347904] usbcore: registered new interface driver idmouse
> [    6.347904] usbcore: registered new interface driver idmouse
> [    6.349749] usbcore: registered new interface driver ldusb
> [    6.349749] usbcore: registered new interface driver ldusb
> [    6.351648] usbcore: registered new interface driver usbled
> [    6.351648] usbcore: registered new interface driver usbled
> [    6.353456] usbcore: registered new interface driver legousbtower
> [    6.353456] usbcore: registered new interface driver legousbtower
> [    6.355397] usbcore: registered new interface driver usbtest
> [    6.355397] usbcore: registered new interface driver usbtest
> [    6.357211] usbcore: registered new interface driver usb_ehset_test
> [    6.357211] usbcore: registered new interface driver usb_ehset_test
> [    6.359212] usbcore: registered new interface driver usbsevseg
> [    6.359212] usbcore: registered new interface driver usbsevseg
> [    6.361130] usbcore: registered new interface driver yurex
> [    6.361130] usbcore: registered new interface driver yurex
> [    6.362936] usbcore: registered new interface driver chaoskey
> [    6.362936] usbcore: registered new interface driver chaoskey
> [    6.364765] usbcore: registered new interface driver lvs
> [    6.364765] usbcore: registered new interface driver lvs
> [    6.366927] dummy_hcd dummy_hcd.0: USB Host+Gadget Emulator, driver 02=
 May 2005
> [    6.366927] dummy_hcd dummy_hcd.0: USB Host+Gadget Emulator, driver 02=
 May 2005
> [    6.369301] dummy_hcd dummy_hcd.0: Dummy host controller
> [    6.369301] dummy_hcd dummy_hcd.0: Dummy host controller
> [    6.371123] dummy_hcd dummy_hcd.0: new USB bus registered, assigned bu=
s number 1
> [    6.371123] dummy_hcd dummy_hcd.0: new USB bus registered, assigned bu=
s number 1
> [    6.373990] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
> [    6.373990] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
> [    6.376145] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    6.376145] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    6.378382] usb usb1: Product: Dummy host controller
> [    6.378382] usb usb1: Product: Dummy host controller
> [    6.379922] usb usb1: Manufacturer: Linux 4.1.0-01336-ge9c469c dummy_h=
cd
> [    6.379922] usb usb1: Manufacturer: Linux 4.1.0-01336-ge9c469c dummy_h=
cd
> [    6.382059] usb usb1: SerialNumber: dummy_hcd.0
> [    6.382059] usb usb1: SerialNumber: dummy_hcd.0
> [    6.397606] hub 1-0:1.0: USB hub found
> [    6.397606] hub 1-0:1.0: USB hub found
> [    6.398942] hub 1-0:1.0: 1 port detected
> [    6.398942] hub 1-0:1.0: 1 port detected
> [    6.402923] file system registered
> [    6.402923] file system registered
> [    6.420177] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    6.420177] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    6.458372] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    6.458372] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    6.460102] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    6.460102] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    6.511497] usb usb1: dummy_bus_suspend
> [    6.511497] usb usb1: dummy_bus_suspend
> [    6.645111] mousedev: PS/2 mouse device common for all mice
> [    6.645111] mousedev: PS/2 mouse device common for all mice
> [    6.648401] usbcore: registered new interface driver iforce
> [    6.648401] usbcore: registered new interface driver iforce
> [    6.650595] usbcore: registered new interface driver xpad
> [    6.650595] usbcore: registered new interface driver xpad
> [    6.652437] usbcore: registered new interface driver aiptek
> [    6.652437] usbcore: registered new interface driver aiptek
> [    6.654279] usbcore: registered new interface driver gtco
> [    6.654279] usbcore: registered new interface driver gtco
> [    6.656066] usbcore: registered new interface driver kbtab
> [    6.656066] usbcore: registered new interface driver kbtab
> [    6.657926] i2c /dev entries driver
> [    6.657926] i2c /dev entries driver
> [    6.659221] usbcore: registered new interface driver i2c-diolan-u2c
> [    6.659221] usbcore: registered new interface driver i2c-diolan-u2c
> [    6.673936] i2c-parport-light: adapter type unspecified
> [    6.673936] i2c-parport-light: adapter type unspecified
> [    6.675693] usbcore: registered new interface driver RobotFuzz Open So=
urce InterFace, OSIF
> [    6.675693] usbcore: registered new interface driver RobotFuzz Open So=
urce InterFace, OSIF
> [    6.678450] usbcore: registered new interface driver i2c-tiny-usb
> [    6.678450] usbcore: registered new interface driver i2c-tiny-usb
> [    6.689062] lirc_dev: IR Remote Control driver registered, major 243 =

> [    6.689062] lirc_dev: IR Remote Control driver registered, major 243 =

> [    6.691288] IR NEC protocol handler initialized
> [    6.691288] IR NEC protocol handler initialized
> [    6.692765] IR RC5(x/sz) protocol handler initialized
> [    6.692765] IR RC5(x/sz) protocol handler initialized
> [    6.694398] IR RC6 protocol handler initialized
> [    6.694398] IR RC6 protocol handler initialized
> [    6.695855] IR Sony protocol handler initialized
> [    6.695855] IR Sony protocol handler initialized
> [    6.697339] IR Sharp protocol handler initialized
> [    6.697339] IR Sharp protocol handler initialized
> [    6.698855] IR MCE Keyboard/mouse protocol handler initialized
> [    6.698855] IR MCE Keyboard/mouse protocol handler initialized
> [    6.700718] IR LIRC bridge handler initialized
> [    6.700718] IR LIRC bridge handler initialized
> [    6.702278] usbcore: registered new interface driver airspy
> [    6.702278] usbcore: registered new interface driver airspy
> [    6.704126] usbcore: registered new interface driver hackrf
> [    6.704126] usbcore: registered new interface driver hackrf
> [    6.705961] usbcore: registered new interface driver msi2500
> [    6.705961] usbcore: registered new interface driver msi2500
> [    6.707832] usbcore: registered new interface driver usbvision
> [    6.707832] usbcore: registered new interface driver usbvision
> [    6.709705] USBVision USB Video Device Driver for Linux : 0.9.11
> [    6.709705] USBVision USB Video Device Driver for Linux : 0.9.11
> [    6.711733] usbcore: registered new interface driver stk1160
> [    6.711733] usbcore: registered new interface driver stk1160
> [    6.713601] usbcore: registered new interface driver cx231xx
> [    6.713601] usbcore: registered new interface driver cx231xx
> [    6.715472] usbcore: registered new interface driver em28xx
> [    6.715472] usbcore: registered new interface driver em28xx
> [    6.717308] em28xx: Registered (Em28xx v4l2 Extension) extension
> [    6.717308] em28xx: Registered (Em28xx v4l2 Extension) extension
> [    6.719234] em28xx: Registered (Em28xx Input Extension) extension
> [    6.719234] em28xx: Registered (Em28xx Input Extension) extension
> [    6.721290] usbcore: registered new interface driver radioshark
> [    6.721290] usbcore: registered new interface driver radioshark
> [    6.723235] usbcore: registered new interface driver dsbr100
> [    6.723235] usbcore: registered new interface driver dsbr100
> [    6.725164] usbcore: registered new interface driver radio-mr800
> [    6.725164] usbcore: registered new interface driver radio-mr800
> [    6.727139] usbcore: registered new interface driver radio-keene
> [    6.727139] usbcore: registered new interface driver radio-keene
> [    6.729119] usbcore: registered new interface driver radio-ma901
> [    6.729119] usbcore: registered new interface driver radio-ma901
> [    6.731272] usbcore: registered new interface driver radio-raremono
> [    6.731272] usbcore: registered new interface driver radio-raremono
> [    6.733286] Driver for 1-wire Dallas network protocol.
> [    6.733286] Driver for 1-wire Dallas network protocol.
> [    6.735111] usbcore: registered new interface driver DS9490R
> [    6.735111] usbcore: registered new interface driver DS9490R
> [    6.736964] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> [    6.736964] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> [    6.739081] 1-Wire driver for the DS2760 battery monitor chip - (c) 20=
04-2005, Szabolcs Gyurko
> [    6.739081] 1-Wire driver for the DS2760 battery monitor chip - (c) 20=
04-2005, Szabolcs Gyurko
> [    6.742171] power_supply test_ac: uevent
> [    6.742171] power_supply test_ac: uevent
> [    6.743439] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
> [    6.743439] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
> [    6.745230] power_supply test_ac: prop ONLINE=3D1
> [    6.745230] power_supply test_ac: prop ONLINE=3D1
> [    6.746741] power_supply test_ac: power_supply_changed
> [    6.746741] power_supply test_ac: power_supply_changed
> [    6.748722] power_supply test_battery: uevent
> [    6.748722] power_supply test_battery: uevent
> [    6.750129] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
> [    6.750129] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
> [    6.752249] power_supply test_battery: prop STATUS=3DDischarging
> [    6.752249] power_supply test_battery: prop STATUS=3DDischarging
> [    6.754119] power_supply test_battery: prop CHARGE_TYPE=3DFast
> [    6.754119] power_supply test_battery: prop CHARGE_TYPE=3DFast
> [    6.755937] power_supply test_battery: prop HEALTH=3DGood
> [    6.755937] power_supply test_battery: prop HEALTH=3DGood
> [    6.757604] power_supply test_battery: prop PRESENT=3D1
> [    6.757604] power_supply test_battery: prop PRESENT=3D1
> [    6.759227] power_supply test_battery: prop TECHNOLOGY=3DLi-ion
> [    6.759227] power_supply test_battery: prop TECHNOLOGY=3DLi-ion
> [    6.761119] power_supply test_battery: prop CHARGE_FULL_DESIGN=3D100
> [    6.761119] power_supply test_battery: prop CHARGE_FULL_DESIGN=3D100
> [    6.763106] power_supply test_battery: prop CHARGE_FULL=3D100
> [    6.763106] power_supply test_battery: prop CHARGE_FULL=3D100
> [    6.764892] power_supply test_battery: prop CHARGE_NOW=3D50
> [    6.764892] power_supply test_battery: prop CHARGE_NOW=3D50
> [    6.766617] power_supply test_battery: prop CAPACITY=3D50
> [    6.766617] power_supply test_battery: prop CAPACITY=3D50
> [    6.768291] power_supply test_battery: prop CAPACITY_LEVEL=3DNormal
> [    6.768291] power_supply test_battery: prop CAPACITY_LEVEL=3DNormal
> [    6.770237] power_supply test_battery: prop TIME_TO_EMPTY_AVG=3D3600
> [    6.770237] power_supply test_battery: prop TIME_TO_EMPTY_AVG=3D3600
> [    6.772269] power_supply test_battery: prop TIME_TO_FULL_NOW=3D3600
> [    6.772269] power_supply test_battery: prop TIME_TO_FULL_NOW=3D3600
> [    6.774215] power_supply test_battery: prop MODEL_NAME=3DTest battery
> [    6.774215] power_supply test_battery: prop MODEL_NAME=3DTest battery
> [    6.776217] power_supply test_battery: prop MANUFACTURER=3DLinux
> [    6.776217] power_supply test_battery: prop MANUFACTURER=3DLinux
> [    6.778088] power_supply test_battery: prop SERIAL_NUMBER=3D4.1.0-0133=
6-ge9c469c
> [    6.778088] power_supply test_battery: prop SERIAL_NUMBER=3D4.1.0-0133=
6-ge9c469c
> [    6.780399] power_supply test_battery: prop TEMP=3D26
> [    6.780399] power_supply test_battery: prop TEMP=3D26
> [    6.782019] power_supply test_battery: prop VOLTAGE_NOW=3D3300
> [    6.782019] power_supply test_battery: prop VOLTAGE_NOW=3D3300
> [    6.784291] power_supply test_battery: power_supply_changed
> [    6.784291] power_supply test_battery: power_supply_changed
> [    6.786258] power_supply test_usb: uevent
> [    6.786258] power_supply test_usb: uevent
> [    6.787548] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_usb
> [    6.787548] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_usb
> [    6.789386] power_supply test_usb: prop ONLINE=3D1
> [    6.789386] power_supply test_usb: prop ONLINE=3D1
> [    6.790946] power_supply test_usb: power_supply_changed
> [    6.790946] power_supply test_usb: power_supply_changed
> [    6.796329] usbcore: registered new interface driver pcwd_usb
> [    6.796329] usbcore: registered new interface driver pcwd_usb
> [    6.798311] advantechwdt: WDT driver for Advantech single board comput=
er initialising
> [    6.798311] advantechwdt: WDT driver for Advantech single board comput=
er initialising
> [    6.801484] advantechwdt: initialized. timeout=3D60 sec (nowayout=3D0)
> [    6.801484] advantechwdt: initialized. timeout=3D60 sec (nowayout=3D0)
> [    6.803569] wafer5823wdt: WDT driver for Wafer 5823 single board compu=
ter initialising
> [    6.803569] wafer5823wdt: WDT driver for Wafer 5823 single board compu=
ter initialising
> [    6.806105] wafer5823wdt: I/O address 0x0443 already in use
> [    6.806105] wafer5823wdt: I/O address 0x0443 already in use
> [    6.807893] sc1200wdt: build 20020303
> [    6.807893] sc1200wdt: build 20020303
> [    6.809112] sc1200wdt: io parameter must be specified
> [    6.809112] sc1200wdt: io parameter must be specified
> [    6.810837] pc87413_wdt: Version 1.1 at io 0x2E
> [    6.810837] pc87413_wdt: Version 1.1 at io 0x2E
> [    6.812298] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.812298] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.814402] sbc60xxwdt: I/O address 0x0443 already in use
> [    6.814402] sbc60xxwdt: I/O address 0x0443 already in use
> [    6.816156] cpu5wdt: misc_register failed
> [    6.816156] cpu5wdt: misc_register failed
> [    6.817522] smsc37b787_wdt: SMsC 37B787 watchdog component driver 1.1 =
initialising...
> [    6.817522] smsc37b787_wdt: SMsC 37B787 watchdog component driver 1.1 =
initialising...
> [    6.821171] smsc37b787_wdt: Unable to register miscdev on minor 130
> [    6.821171] smsc37b787_wdt: Unable to register miscdev on minor 130
> [    6.823255] w83877f_wdt: I/O address 0x0443 already in use
> [    6.823255] w83877f_wdt: I/O address 0x0443 already in use
> [    6.825022] w83977f_wdt: driver v1.00
> [    6.825022] w83977f_wdt: driver v1.00
> [    6.826204] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.826204] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.828313] machzwd: MachZ ZF-Logic Watchdog driver initializing
> [    6.828313] machzwd: MachZ ZF-Logic Watchdog driver initializing
> [    6.830238] machzwd: no ZF-Logic found
> [    6.830238] machzwd: no ZF-Logic found
> [    6.831505] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D=
-16)
> [    6.831505] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D=
-16)
> [    6.833758] md: linear personality registered for level -1
> [    6.833758] md: linear personality registered for level -1
> [    6.835592] md: raid0 personality registered for level 0
> [    6.835592] md: raid0 personality registered for level 0
> [    6.837299] md: raid1 personality registered for level 1
> [    6.837299] md: raid1 personality registered for level 1
> [    6.860379] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    6.860379] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    6.863769] md: raid6 personality registered for level 6
> [    6.863769] md: raid6 personality registered for level 6
> [    6.865477] md: raid5 personality registered for level 5
> [    6.865477] md: raid5 personality registered for level 5
> [    6.867177] md: raid4 personality registered for level 4
> [    6.867177] md: raid4 personality registered for level 4
> [    6.868886] md: multipath personality registered for level -4
> [    6.868886] md: multipath personality registered for level -4
> [    6.870107] sdhci: Secure Digital Host Controller Interface driver
> [    6.870107] sdhci: Secure Digital Host Controller Interface driver
> [    6.872978] sdhci: Copyright(c) Pierre Ossman
> [    6.872978] sdhci: Copyright(c) Pierre Ossman
> [    6.874490] usbcore: registered new interface driver ushc
> [    6.874490] usbcore: registered new interface driver ushc
> [    6.876329] sdhci-pltfm: SDHCI platform and OF driver helper
> [    6.876329] sdhci-pltfm: SDHCI platform and OF driver helper
> [    6.878758] power_supply test_ac: power_supply_changed_work
> [    6.878758] power_supply test_ac: power_supply_changed_work
> [    6.880576] power_supply test_ac: uevent
> [    6.880576] power_supply test_ac: uevent
> [    6.882056] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    6.882056] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    6.884376] usbcore: registered new interface driver usbhid
> [    6.884376] usbcore: registered new interface driver usbhid
> [    6.884378] usbhid: USB HID core driver
> [    6.884378] usbhid: USB HID core driver
> [    6.888027]  fake-fmc-carrier: mezzanine 0
> [    6.888027]  fake-fmc-carrier: mezzanine 0
> [    6.888030]       Manufacturer: fake-vendor
> [    6.888030]       Manufacturer: fake-vendor
> [    6.888031]       Product name: fake-design-for-testing
> [    6.888031]       Product name: fake-design-for-testing
> [    6.888157] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    6.888157] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    6.888179] fmc_write_eeprom fake-design-for-testing-f001: fmc_write_e=
eprom: no busid passed, refusing all cards
> [    6.888179] fmc_write_eeprom fake-design-for-testing-f001: fmc_write_e=
eprom: no busid passed, refusing all cards
> [    6.888255] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    6.888255] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    6.888510] fmc_chardev fake-design-for-testing-f001: Created misc dev=
ice "fake-design-for-testing-f001"
> [    6.888510] fmc_chardev fake-design-for-testing-f001: Created misc dev=
ice "fake-design-for-testing-f001"
> [    6.888555] oprofile: using NMI interrupt.
> [    6.888555] oprofile: using NMI interrupt.
> [    6.889093] ... APIC ID:      00000000 (0)
> [    6.889093] ... APIC ID:      00000000 (0)
> [    6.889095] ... APIC VERSION: 01050014
> [    6.889095] ... APIC VERSION: 01050014
> [    6.889110] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    6.889110] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    6.889118] 0000000002000000000000000000000000000000000000000000000000=
000000
> [    6.889118] 0000000002000000000000000000000000000000000000000000000000=
000000
> [    6.889126] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    6.889126] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    6.889136] =

> [    6.889136] =

> [    6.889138] number of MP IRQ sources: 15.
> [    6.889138] number of MP IRQ sources: 15.
> [    6.889140] number of IO-APIC #0 registers: 24.
> [    6.889140] number of IO-APIC #0 registers: 24.
> [    6.889140] testing the IO APIC.......................
> [    6.889140] testing the IO APIC.......................
> [    6.889160] IO APIC #0......
> [    6.889160] IO APIC #0......
> [    6.889161] .... register #00: 00000000
> [    6.889161] .... register #00: 00000000
> [    6.889162] .......    : physical APIC id: 00
> [    6.889162] .......    : physical APIC id: 00
> [    6.889163] .......    : Delivery Type: 0
> [    6.889163] .......    : Delivery Type: 0
> [    6.889164] .......    : LTS          : 0
> [    6.889164] .......    : LTS          : 0
> [    6.889165] .... register #01: 00170011
> [    6.889165] .... register #01: 00170011
> [    6.889166] .......     : max redirection entries: 17
> [    6.889166] .......     : max redirection entries: 17
> [    6.889166] .......     : PRQ implemented: 0
> [    6.889166] .......     : PRQ implemented: 0
> [    6.889167] .......     : IO APIC version: 11
> [    6.889167] .......     : IO APIC version: 11
> [    6.889168] .... register #02: 00000000
> [    6.889168] .... register #02: 00000000
> [    6.889169] .......     : arbitration: 00
> [    6.889169] .......     : arbitration: 00
> [    6.889170] .... IRQ redirection table:
> [    6.889170] .... IRQ redirection table:
> [    6.889171] IOAPIC 0:
> [    6.889171] IOAPIC 0:
> [    6.889187]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889187]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889203]  pin01, enabled , edge , high, V(31), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889203]  pin01, enabled , edge , high, V(31), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889217]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logica=
l , D(01), M(1)
> [    6.889217]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logica=
l , D(01), M(1)
> [    6.889232]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889232]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889246]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889246]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889261]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889261]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889274]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889274]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889289]  pin07, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889289]  pin07, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889304]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889304]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889318]  pin09, enabled , level, high, V(39), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889318]  pin09, enabled , level, high, V(39), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889332]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889332]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889347]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889347]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889361]  pin0c, enabled , edge , high, V(3C), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889361]  pin0c, enabled , edge , high, V(3C), IRR(0), S(0), logica=
l , D(03), M(1)
> [    6.889375]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889375]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889389]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889389]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889404]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889404]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889417]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889417]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889432]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889432]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889446]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889446]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889461]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889461]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889476]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889476]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889490]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889490]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889504]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889504]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889518]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889518]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    6.889518] IRQ to pin mappings:
> [    6.889518] IRQ to pin mappings:
> [    6.889522] IRQ0 -> 0:2
> [    6.889522] IRQ0 -> 0:2
> [    6.889524] IRQ1 -> 0:1
> [    6.889524] IRQ1 -> 0:1
> [    6.889526] IRQ3 -> 0:3
> [    6.889526] IRQ3 -> 0:3
> [    6.889529] IRQ4 -> 0:4
> [    6.889529] IRQ4 -> 0:4
> [    6.889531] IRQ5 -> 0:5
> [    6.889531] IRQ5 -> 0:5
> [    6.889533] IRQ6 -> 0:6
> [    6.889533] IRQ6 -> 0:6
> [    6.889535] IRQ7 -> 0:7
> [    6.889535] IRQ7 -> 0:7
> [    6.889538] IRQ8 -> 0:8
> [    6.889538] IRQ8 -> 0:8
> [    6.889540] IRQ9 -> 0:9
> [    6.889540] IRQ9 -> 0:9
> [    6.889542] IRQ10 -> 0:10
> [    6.889542] IRQ10 -> 0:10
> [    6.889544] IRQ11 -> 0:11
> [    6.889544] IRQ11 -> 0:11
> [    6.889546] IRQ12 -> 0:12
> [    6.889546] IRQ12 -> 0:12
> [    6.889548] IRQ13 -> 0:13
> [    6.889548] IRQ13 -> 0:13
> [    6.889551] IRQ14 -> 0:14
> [    6.889551] IRQ14 -> 0:14
> [    6.889553] IRQ15 -> 0:15
> [    6.889553] IRQ15 -> 0:15
> [    6.889554] .................................... done.
> [    6.889554] .................................... done.
> [    6.890350] bootconsole [earlyser0] disabled
> [    6.890350] bootconsole [earlyser0] disabled
> [    7.032880] power_supply test_ac: POWER_SUPPLY_NAME=3Dtest_ac
> [    7.032947] power_supply test_ac: prop ONLINE=3D1
> [    7.033094] power_supply test_battery: power_supply_changed_work
> [    7.033108] power_supply test_battery: uevent
> [    7.033110] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
> [    7.033117] power_supply test_battery: prop STATUS=3DDischarging
> [    7.033122] power_supply test_battery: prop CHARGE_TYPE=3DFast
> [    7.033127] power_supply test_battery: prop HEALTH=3DGood
> [    7.033131] power_supply test_battery: prop PRESENT=3D1
> [    7.033136] power_supply test_battery: prop TECHNOLOGY=3DLi-ion
> [    7.033141] power_supply test_battery: prop CHARGE_FULL_DESIGN=3D100
> [    7.033146] power_supply test_battery: prop CHARGE_FULL=3D100
> [    7.033151] power_supply test_battery: prop CHARGE_NOW=3D50
> [    7.033155] power_supply test_battery: prop CAPACITY=3D50
> [    7.033160] power_supply test_battery: prop CAPACITY_LEVEL=3DNormal
> [    7.033165] power_supply test_battery: prop TIME_TO_EMPTY_AVG=3D3600
> [    7.033169] power_supply test_battery: prop TIME_TO_FULL_NOW=3D3600
> [    7.033174] power_supply test_battery: prop MODEL_NAME=3DTest battery
> [    7.033179] power_supply test_battery: prop MANUFACTURER=3DLinux
> [    7.033184] power_supply test_battery: prop SERIAL_NUMBER=3D4.1.0-0133=
6-ge9c469c
> [    7.033189] power_supply test_battery: prop TEMP=3D26
> [    7.033193] power_supply test_battery: prop VOLTAGE_NOW=3D3300
> [    7.033210] power_supply test_usb: power_supply_changed_work
> [    7.033219] power_supply test_usb: uevent
> [    7.033221] power_supply test_usb: POWER_SUPPLY_NAME=3Dtest_usb
> [    7.033227] power_supply test_usb: prop ONLINE=3D1
> [    7.056779] raid6test: testing the 4-disk case...
> [    7.058505] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.059630] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(P=
)  OK
> [    7.060757] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(Q=
)  OK
> [    7.061872] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(P=
)  OK
> [    7.063115] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(Q=
)  OK
> [    7.064213] raid6test: test_disks(2, 3): faila=3D  2(P)  failb=3D  3(Q=
)  OK
> [    7.065332] raid6test: testing the 5-disk case...
> [    7.066154] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.067261] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(D=
)  OK
> [    7.068409] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(P=
)  OK
> [    7.069510] raid6test: test_disks(0, 4): faila=3D  0(D)  failb=3D  4(Q=
)  OK
> [    7.070623] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(D=
)  OK
> [    7.071792] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(P=
)  OK
> [    7.072896] raid6test: test_disks(1, 4): faila=3D  1(D)  failb=3D  4(Q=
)  OK
> [    7.074004] raid6test: test_disks(2, 3): faila=3D  2(D)  failb=3D  3(P=
)  OK
> [    7.075105] raid6test: test_disks(2, 4): faila=3D  2(D)  failb=3D  4(Q=
)  OK
> [    7.076201] raid6test: test_disks(3, 4): faila=3D  3(P)  failb=3D  4(Q=
)  OK
> [    7.077392] raid6test: testing the 11-disk case...
> [    7.078266] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.079401] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(D=
)  OK
> [    7.080534] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(D=
)  OK
> [    7.081765] raid6test: test_disks(0, 4): faila=3D  0(D)  failb=3D  4(D=
)  OK
> [    7.082904] raid6test: test_disks(0, 5): faila=3D  0(D)  failb=3D  5(D=
)  OK
> [    7.084041] raid6test: test_disks(0, 6): faila=3D  0(D)  failb=3D  6(D=
)  OK
> [    7.085175] raid6test: test_disks(0, 7): faila=3D  0(D)  failb=3D  7(D=
)  OK
> [    7.086317] raid6test: test_disks(0, 8): faila=3D  0(D)  failb=3D  8(D=
)  OK
> [    7.087446] raid6test: test_disks(0, 9): faila=3D  0(D)  failb=3D  9(P=
)  OK
> [    7.088572] raid6test: test_disks(0, 10): faila=3D  0(D)  failb=3D 10(=
Q)  OK
> [    7.089717] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(D=
)  OK
> [    7.090880] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(D=
)  OK
> [    7.092023] raid6test: test_disks(1, 4): faila=3D  1(D)  failb=3D  4(D=
)  OK
> [    7.093156] raid6test: test_disks(1, 5): faila=3D  1(D)  failb=3D  5(D=
)  OK
> [    7.094292] raid6test: test_disks(1, 6): faila=3D  1(D)  failb=3D  6(D=
)  OK
> [    7.095437] raid6test: test_disks(1, 7): faila=3D  1(D)  failb=3D  7(D=
)  OK
> [    7.096574] raid6test: test_disks(1, 8): faila=3D  1(D)  failb=3D  8(D=
)  OK
> [    7.097709] raid6test: test_disks(1, 9): faila=3D  1(D)  failb=3D  9(P=
)  OK
> [    7.098836] raid6test: test_disks(1, 10): faila=3D  1(D)  failb=3D 10(=
Q)  OK
> [    7.099992] raid6test: test_disks(2, 3): faila=3D  2(D)  failb=3D  3(D=
)  OK
> [    7.101148] raid6test: test_disks(2, 4): faila=3D  2(D)  failb=3D  4(D=
)  OK
> [    7.102287] raid6test: test_disks(2, 5): faila=3D  2(D)  failb=3D  5(D=
)  OK
> [    7.103425] raid6test: test_disks(2, 6): faila=3D  2(D)  failb=3D  6(D=
)  OK
> [    7.104559] raid6test: test_disks(2, 7): faila=3D  2(D)  failb=3D  7(D=
)  OK
> [    7.105696] raid6test: test_disks(2, 8): faila=3D  2(D)  failb=3D  8(D=
)  OK
> [    7.106835] raid6test: test_disks(2, 9): faila=3D  2(D)  failb=3D  9(P=
)  OK
> [    7.107967] raid6test: test_disks(2, 10): faila=3D  2(D)  failb=3D 10(=
Q)  OK
> [    7.109120] raid6test: test_disks(3, 4): faila=3D  3(D)  failb=3D  4(D=
)  OK
> [    7.110253] raid6test: test_disks(3, 5): faila=3D  3(D)  failb=3D  5(D=
)  OK
> [    7.111405] raid6test: test_disks(3, 6): faila=3D  3(D)  failb=3D  6(D=
)  OK
> [    7.112540] raid6test: test_disks(3, 7): faila=3D  3(D)  failb=3D  7(D=
)  OK
> [    7.113677] raid6test: test_disks(3, 8): faila=3D  3(D)  failb=3D  8(D=
)  OK
> [    7.114812] raid6test: test_disks(3, 9): faila=3D  3(D)  failb=3D  9(P=
)  OK
> [    7.115940] raid6test: test_disks(3, 10): faila=3D  3(D)  failb=3D 10(=
Q)  OK
> [    7.117088] raid6test: test_disks(4, 5): faila=3D  4(D)  failb=3D  5(D=
)  OK
> [    7.118222] raid6test: test_disks(4, 6): faila=3D  4(D)  failb=3D  6(D=
)  OK
> [    7.119362] raid6test: test_disks(4, 7): faila=3D  4(D)  failb=3D  7(D=
)  OK
> [    7.120497] raid6test: test_disks(4, 8): faila=3D  4(D)  failb=3D  8(D=
)  OK
> [    7.121699] raid6test: test_disks(4, 9): faila=3D  4(D)  failb=3D  9(P=
)  OK
> [    7.122834] raid6test: test_disks(4, 10): faila=3D  4(D)  failb=3D 10(=
Q)  OK
> [    7.123992] raid6test: test_disks(5, 6): faila=3D  5(D)  failb=3D  6(D=
)  OK
> [    7.125132] raid6test: test_disks(5, 7): faila=3D  5(D)  failb=3D  7(D=
)  OK
> [    7.126267] raid6test: test_disks(5, 8): faila=3D  5(D)  failb=3D  8(D=
)  OK
> [    7.127402] raid6test: test_disks(5, 9): faila=3D  5(D)  failb=3D  9(P=
)  OK
> [    7.128527] raid6test: test_disks(5, 10): faila=3D  5(D)  failb=3D 10(=
Q)  OK
> [    7.129676] raid6test: test_disks(6, 7): faila=3D  6(D)  failb=3D  7(D=
)  OK
> [    7.142980] raid6test: test_disks(6, 8): faila=3D  6(D)  failb=3D  8(D=
)  OK
> [    7.144127] raid6test: test_disks(6, 9): faila=3D  6(D)  failb=3D  9(P=
)  OK
> [    7.145256] raid6test: test_disks(6, 10): faila=3D  6(D)  failb=3D 10(=
Q)  OK
> [    7.146410] raid6test: test_disks(7, 8): faila=3D  7(D)  failb=3D  8(D=
)  OK
> [    7.147553] raid6test: test_disks(7, 9): faila=3D  7(D)  failb=3D  9(P=
)  OK
> [    7.148678] raid6test: test_disks(7, 10): faila=3D  7(D)  failb=3D 10(=
Q)  OK
> [    7.149830] raid6test: test_disks(8, 9): faila=3D  8(D)  failb=3D  9(P=
)  OK
> [    7.150978] raid6test: test_disks(8, 10): faila=3D  8(D)  failb=3D 10(=
Q)  OK
> [    7.152121] raid6test: test_disks(9, 10): faila=3D  9(P)  failb=3D 10(=
Q)  OK
> [    7.153341] raid6test: testing the 12-disk case...
> [    7.154207] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.155346] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(D=
)  OK
> [    7.156543] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(D=
)  OK
> [    7.157685] raid6test: test_disks(0, 4): faila=3D  0(D)  failb=3D  4(D=
)  OK
> [    7.158829] raid6test: test_disks(0, 5): faila=3D  0(D)  failb=3D  5(D=
)  OK
> [    7.159980] raid6test: test_disks(0, 6): faila=3D  0(D)  failb=3D  6(D=
)  OK
> [    7.161185] raid6test: test_disks(0, 7): faila=3D  0(D)  failb=3D  7(D=
)  OK
> [    7.162328] raid6test: test_disks(0, 8): faila=3D  0(D)  failb=3D  8(D=
)  OK
> [    7.163473] raid6test: test_disks(0, 9): faila=3D  0(D)  failb=3D  9(D=
)  OK
> [    7.164612] raid6test: test_disks(0, 10): faila=3D  0(D)  failb=3D 10(=
P)  OK
> [    7.165758] raid6test: test_disks(0, 11): faila=3D  0(D)  failb=3D 11(=
Q)  OK
> [    7.166917] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(D=
)  OK
> [    7.168059] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(D=
)  OK
> [    7.169207] raid6test: test_disks(1, 4): faila=3D  1(D)  failb=3D  4(D=
)  OK
> [    7.170346] raid6test: test_disks(1, 5): faila=3D  1(D)  failb=3D  5(D=
)  OK
> [    7.171540] raid6test: test_disks(1, 6): faila=3D  1(D)  failb=3D  6(D=
)  OK
> [    7.172691] raid6test: test_disks(1, 7): faila=3D  1(D)  failb=3D  7(D=
)  OK
> [    7.173834] raid6test: test_disks(1, 8): faila=3D  1(D)  failb=3D  8(D=
)  OK
> [    7.174981] raid6test: test_disks(1, 9): faila=3D  1(D)  failb=3D  9(D=
)  OK
> [    7.176124] raid6test: test_disks(1, 10): faila=3D  1(D)  failb=3D 10(=
P)  OK
> [    7.177266] raid6test: test_disks(1, 11): faila=3D  1(D)  failb=3D 11(=
Q)  OK
> [    7.178424] raid6test: test_disks(2, 3): faila=3D  2(D)  failb=3D  3(D=
)  OK
> [    7.179567] raid6test: test_disks(2, 4): faila=3D  2(D)  failb=3D  4(D=
)  OK
> [    7.180772] raid6test: test_disks(2, 5): faila=3D  2(D)  failb=3D  5(D=
)  OK
> [    7.181920] raid6test: test_disks(2, 6): faila=3D  2(D)  failb=3D  6(D=
)  OK
> [    7.183061] raid6test: test_disks(2, 7): faila=3D  2(D)  failb=3D  7(D=
)  OK
> [    7.184205] raid6test: test_disks(2, 8): faila=3D  2(D)  failb=3D  8(D=
)  OK
> [    7.185346] raid6test: test_disks(2, 9): faila=3D  2(D)  failb=3D  9(D=
)  OK
> [    7.186490] raid6test: test_disks(2, 10): faila=3D  2(D)  failb=3D 10(=
P)  OK
> [    7.187636] raid6test: test_disks(2, 11): faila=3D  2(D)  failb=3D 11(=
Q)  OK
> [    7.188787] raid6test: test_disks(3, 4): faila=3D  3(D)  failb=3D  4(D=
)  OK
> [    7.189934] raid6test: test_disks(3, 5): faila=3D  3(D)  failb=3D  5(D=
)  OK
> [    7.191132] raid6test: test_disks(3, 6): faila=3D  3(D)  failb=3D  6(D=
)  OK
> [    7.192276] raid6test: test_disks(3, 7): faila=3D  3(D)  failb=3D  7(D=
)  OK
> [    7.193416] raid6test: test_disks(3, 8): faila=3D  3(D)  failb=3D  8(D=
)  OK
> [    7.194555] raid6test: test_disks(3, 9): faila=3D  3(D)  failb=3D  9(D=
)  OK
> [    7.195695] raid6test: test_disks(3, 10): faila=3D  3(D)  failb=3D 10(=
P)  OK
> [    7.196840] raid6test: test_disks(3, 11): faila=3D  3(D)  failb=3D 11(=
Q)  OK
> [    7.197993] raid6test: test_disks(4, 5): faila=3D  4(D)  failb=3D  5(D=
)  OK
> [    7.199131] raid6test: test_disks(4, 6): faila=3D  4(D)  failb=3D  6(D=
)  OK
> [    7.200267] raid6test: test_disks(4, 7): faila=3D  4(D)  failb=3D  7(D=
)  OK
> [    7.201461] raid6test: test_disks(4, 8): faila=3D  4(D)  failb=3D  8(D=
)  OK
> [    7.202608] raid6test: test_disks(4, 9): faila=3D  4(D)  failb=3D  9(D=
)  OK
> [    7.203753] raid6test: test_disks(4, 10): faila=3D  4(D)  failb=3D 10(=
P)  OK
> [    7.204906] raid6test: test_disks(4, 11): faila=3D  4(D)  failb=3D 11(=
Q)  OK
> [    7.206060] raid6test: test_disks(5, 6): faila=3D  5(D)  failb=3D  6(D=
)  OK
> [    7.207201] raid6test: test_disks(5, 7): faila=3D  5(D)  failb=3D  7(D=
)  OK
> [    7.208340] raid6test: test_disks(5, 8): faila=3D  5(D)  failb=3D  8(D=
)  OK
> [    7.209484] raid6test: test_disks(5, 9): faila=3D  5(D)  failb=3D  9(D=
)  OK
> [    7.210623] raid6test: test_disks(5, 10): faila=3D  5(D)  failb=3D 10(=
P)  OK
> [    7.211823] raid6test: test_disks(5, 11): faila=3D  5(D)  failb=3D 11(=
Q)  OK
> [    7.212992] raid6test: test_disks(6, 7): faila=3D  6(D)  failb=3D  7(D=
)  OK
> [    7.214134] raid6test: test_disks(6, 8): faila=3D  6(D)  failb=3D  8(D=
)  OK
> [    7.215278] raid6test: test_disks(6, 9): faila=3D  6(D)  failb=3D  9(D=
)  OK
> [    7.216417] raid6test: test_disks(6, 10): faila=3D  6(D)  failb=3D 10(=
P)  OK
> [    7.217562] raid6test: test_disks(6, 11): faila=3D  6(D)  failb=3D 11(=
Q)  OK
> [    7.218717] raid6test: test_disks(7, 8): faila=3D  7(D)  failb=3D  8(D=
)  OK
> [    7.219862] raid6test: test_disks(7, 9): faila=3D  7(D)  failb=3D  9(D=
)  OK
> [    7.221053] raid6test: test_disks(7, 10): faila=3D  7(D)  failb=3D 10(=
P)  OK
> [    7.222200] raid6test: test_disks(7, 11): faila=3D  7(D)  failb=3D 11(=
Q)  OK
> [    7.223353] raid6test: test_disks(8, 9): faila=3D  8(D)  failb=3D  9(D=
)  OK
> [    7.224492] raid6test: test_disks(8, 10): faila=3D  8(D)  failb=3D 10(=
P)  OK
> [    7.225636] raid6test: test_disks(8, 11): faila=3D  8(D)  failb=3D 11(=
Q)  OK
> [    7.226788] raid6test: test_disks(9, 10): faila=3D  9(D)  failb=3D 10(=
P)  OK
> [    7.227934] raid6test: test_disks(9, 11): faila=3D  9(D)  failb=3D 11(=
Q)  OK
> [    7.229076] raid6test: test_disks(10, 11): faila=3D 10(P)  failb=3D 11=
(Q)  OK
> [    7.230466] raid6test: testing the 24-disk case...
> [    7.231441] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.232640] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(D=
)  OK
> [    7.233839] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(D=
)  OK
> [    7.235036] raid6test: test_disks(0, 4): faila=3D  0(D)  failb=3D  4(D=
)  OK
> [    7.236231] raid6test: test_disks(0, 5): faila=3D  0(D)  failb=3D  5(D=
)  OK
> [    7.237424] raid6test: test_disks(0, 6): faila=3D  0(D)  failb=3D  6(D=
)  OK
> [    7.238616] raid6test: test_disks(0, 7): faila=3D  0(D)  failb=3D  7(D=
)  OK
> [    7.239807] raid6test: test_disks(0, 8): faila=3D  0(D)  failb=3D  8(D=
)  OK
> [    7.241058] raid6test: test_disks(0, 9): faila=3D  0(D)  failb=3D  9(D=
)  OK
> [    7.242252] raid6test: test_disks(0, 10): faila=3D  0(D)  failb=3D 10(=
D)  OK
> [    7.243458] raid6test: test_disks(0, 11): faila=3D  0(D)  failb=3D 11(=
D)  OK
> [    7.244661] raid6test: test_disks(0, 12): faila=3D  0(D)  failb=3D 12(=
D)  OK
> [    7.245871] raid6test: test_disks(0, 13): faila=3D  0(D)  failb=3D 13(=
D)  OK
> [    7.247075] raid6test: test_disks(0, 14): faila=3D  0(D)  failb=3D 14(=
D)  OK
> [    7.248287] raid6test: test_disks(0, 15): faila=3D  0(D)  failb=3D 15(=
D)  OK
> [    7.249492] raid6test: test_disks(0, 16): faila=3D  0(D)  failb=3D 16(=
D)  OK
> [    7.250700] raid6test: test_disks(0, 17): faila=3D  0(D)  failb=3D 17(=
D)  OK
> [    7.251966] raid6test: test_disks(0, 18): faila=3D  0(D)  failb=3D 18(=
D)  OK
> [    7.253182] raid6test: test_disks(0, 19): faila=3D  0(D)  failb=3D 19(=
D)  OK
> [    7.254389] raid6test: test_disks(0, 20): faila=3D  0(D)  failb=3D 20(=
D)  OK
> [    7.255596] raid6test: test_disks(0, 21): faila=3D  0(D)  failb=3D 21(=
D)  OK
> [    7.256802] raid6test: test_disks(0, 22): faila=3D  0(D)  failb=3D 22(=
P)  OK
> [    7.258003] raid6test: test_disks(0, 23): faila=3D  0(D)  failb=3D 23(=
Q)  OK
> [    7.259212] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(D=
)  OK
> [    7.260404] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(D=
)  OK
> [    7.261649] raid6test: test_disks(1, 4): faila=3D  1(D)  failb=3D  4(D=
)  OK
> [    7.262852] raid6test: test_disks(1, 5): faila=3D  1(D)  failb=3D  5(D=
)  OK
> [    7.264043] raid6test: test_disks(1, 6): faila=3D  1(D)  failb=3D  6(D=
)  OK
> [    7.265236] raid6test: test_disks(1, 7): faila=3D  1(D)  failb=3D  7(D=
)  OK
> [    7.266422] raid6test: test_disks(1, 8): faila=3D  1(D)  failb=3D  8(D=
)  OK
> [    7.267621] raid6test: test_disks(1, 9): faila=3D  1(D)  failb=3D  9(D=
)  OK
> [    7.268814] raid6test: test_disks(1, 10): faila=3D  1(D)  failb=3D 10(=
D)  OK
> [    7.270025] raid6test: test_disks(1, 11): faila=3D  1(D)  failb=3D 11(=
D)  OK
> [    7.271284] raid6test: test_disks(1, 12): faila=3D  1(D)  failb=3D 12(=
D)  OK
> [    7.272488] raid6test: test_disks(1, 13): faila=3D  1(D)  failb=3D 13(=
D)  OK
> [    7.273696] raid6test: test_disks(1, 14): faila=3D  1(D)  failb=3D 14(=
D)  OK
> [    7.274908] raid6test: test_disks(1, 15): faila=3D  1(D)  failb=3D 15(=
D)  OK
> [    7.276111] raid6test: test_disks(1, 16): faila=3D  1(D)  failb=3D 16(=
D)  OK
> [    7.277321] raid6test: test_disks(1, 17): faila=3D  1(D)  failb=3D 17(=
D)  OK
> [    7.278533] raid6test: test_disks(1, 18): faila=3D  1(D)  failb=3D 18(=
D)  OK
> [    7.279737] raid6test: test_disks(1, 19): faila=3D  1(D)  failb=3D 19(=
D)  OK
> [    7.280991] raid6test: test_disks(1, 20): faila=3D  1(D)  failb=3D 20(=
D)  OK
> [    7.282204] raid6test: test_disks(1, 21): faila=3D  1(D)  failb=3D 21(=
D)  OK
> [    7.283403] raid6test: test_disks(1, 22): faila=3D  1(D)  failb=3D 22(=
P)  OK
> [    7.284602] raid6test: test_disks(1, 23): faila=3D  1(D)  failb=3D 23(=
Q)  OK
> [    7.285808] raid6test: test_disks(2, 3): faila=3D  2(D)  failb=3D  3(D=
)  OK
> [    7.287004] raid6test: test_disks(2, 4): faila=3D  2(D)  failb=3D  4(D=
)  OK
> [    7.288197] raid6test: test_disks(2, 5): faila=3D  2(D)  failb=3D  5(D=
)  OK
> [    7.289391] raid6test: test_disks(2, 6): faila=3D  2(D)  failb=3D  6(D=
)  OK
> [    7.290583] raid6test: test_disks(2, 7): faila=3D  2(D)  failb=3D  7(D=
)  OK
> [    7.291829] raid6test: test_disks(2, 8): faila=3D  2(D)  failb=3D  8(D=
)  OK
> [    7.293028] raid6test: test_disks(2, 9): faila=3D  2(D)  failb=3D  9(D=
)  OK
> [    7.294218] raid6test: test_disks(2, 10): faila=3D  2(D)  failb=3D 10(=
D)  OK
> [    7.295432] raid6test: test_disks(2, 11): faila=3D  2(D)  failb=3D 11(=
D)  OK
> [    7.296640] raid6test: test_disks(2, 12): faila=3D  2(D)  failb=3D 12(=
D)  OK
> [    7.297851] raid6test: test_disks(2, 13): faila=3D  2(D)  failb=3D 13(=
D)  OK
> [    7.299059] raid6test: test_disks(2, 14): faila=3D  2(D)  failb=3D 14(=
D)  OK
> [    7.300265] raid6test: test_disks(2, 15): faila=3D  2(D)  failb=3D 15(=
D)  OK
> [    7.301524] raid6test: test_disks(2, 16): faila=3D  2(D)  failb=3D 16(=
D)  OK
> [    7.302734] raid6test: test_disks(2, 17): faila=3D  2(D)  failb=3D 17(=
D)  OK
> [    7.303947] raid6test: test_disks(2, 18): faila=3D  2(D)  failb=3D 18(=
D)  OK
> [    7.305154] raid6test: test_disks(2, 19): faila=3D  2(D)  failb=3D 19(=
D)  OK
> [    7.306361] raid6test: test_disks(2, 20): faila=3D  2(D)  failb=3D 20(=
D)  OK
> [    7.307573] raid6test: test_disks(2, 21): faila=3D  2(D)  failb=3D 21(=
D)  OK
> [    7.308777] raid6test: test_disks(2, 22): faila=3D  2(D)  failb=3D 22(=
P)  OK
> [    7.309984] raid6test: test_disks(2, 23): faila=3D  2(D)  failb=3D 23(=
Q)  OK
> [    7.311244] raid6test: test_disks(3, 4): faila=3D  3(D)  failb=3D  4(D=
)  OK
> [    7.312441] raid6test: test_disks(3, 5): faila=3D  3(D)  failb=3D  5(D=
)  OK
> [    7.313634] raid6test: test_disks(3, 6): faila=3D  3(D)  failb=3D  6(D=
)  OK
> [    7.314825] raid6test: test_disks(3, 7): faila=3D  3(D)  failb=3D  7(D=
)  OK
> [    7.316017] raid6test: test_disks(3, 8): faila=3D  3(D)  failb=3D  8(D=
)  OK
> [    7.317206] raid6test: test_disks(3, 9): faila=3D  3(D)  failb=3D  9(D=
)  OK
> [    7.318395] raid6test: test_disks(3, 10): faila=3D  3(D)  failb=3D 10(=
D)  OK
> [    7.319599] raid6test: test_disks(3, 11): faila=3D  3(D)  failb=3D 11(=
D)  OK
> [    7.320877] raid6test: test_disks(3, 12): faila=3D  3(D)  failb=3D 12(=
D)  OK
> [    7.322085] raid6test: test_disks(3, 13): faila=3D  3(D)  failb=3D 13(=
D)  OK
> [    7.323289] raid6test: test_disks(3, 14): faila=3D  3(D)  failb=3D 14(=
D)  OK
> [    7.324494] raid6test: test_disks(3, 15): faila=3D  3(D)  failb=3D 15(=
D)  OK
> [    7.325700] raid6test: test_disks(3, 16): faila=3D  3(D)  failb=3D 16(=
D)  OK
> [    7.326909] raid6test: test_disks(3, 17): faila=3D  3(D)  failb=3D 17(=
D)  OK
> [    7.328120] raid6test: test_disks(3, 18): faila=3D  3(D)  failb=3D 18(=
D)  OK
> [    7.329324] raid6test: test_disks(3, 19): faila=3D  3(D)  failb=3D 19(=
D)  OK
> [    7.330530] raid6test: test_disks(3, 20): faila=3D  3(D)  failb=3D 20(=
D)  OK
> [    7.331784] raid6test: test_disks(3, 21): faila=3D  3(D)  failb=3D 21(=
D)  OK
> [    7.332992] raid6test: test_disks(3, 22): faila=3D  3(D)  failb=3D 22(=
P)  OK
> [    7.334195] raid6test: test_disks(3, 23): faila=3D  3(D)  failb=3D 23(=
Q)  OK
> [    7.335402] raid6test: test_disks(4, 5): faila=3D  4(D)  failb=3D  5(D=
)  OK
> [    7.336595] raid6test: test_disks(4, 6): faila=3D  4(D)  failb=3D  6(D=
)  OK
> [    7.337789] raid6test: test_disks(4, 7): faila=3D  4(D)  failb=3D  7(D=
)  OK
> [    7.338984] raid6test: test_disks(4, 8): faila=3D  4(D)  failb=3D  8(D=
)  OK
> [    7.340180] raid6test: test_disks(4, 9): faila=3D  4(D)  failb=3D  9(D=
)  OK
> [    7.341425] raid6test: test_disks(4, 10): faila=3D  4(D)  failb=3D 10(=
D)  OK
> [    7.342634] raid6test: test_disks(4, 11): faila=3D  4(D)  failb=3D 11(=
D)  OK
> [    7.343842] raid6test: test_disks(4, 12): faila=3D  4(D)  failb=3D 12(=
D)  OK
> [    7.345052] raid6test: test_disks(4, 13): faila=3D  4(D)  failb=3D 13(=
D)  OK
> [    7.346264] raid6test: test_disks(4, 14): faila=3D  4(D)  failb=3D 14(=
D)  OK
> [    7.347469] raid6test: test_disks(4, 15): faila=3D  4(D)  failb=3D 15(=
D)  OK
> [    7.348677] raid6test: test_disks(4, 16): faila=3D  4(D)  failb=3D 16(=
D)  OK
> [    7.349887] raid6test: test_disks(4, 17): faila=3D  4(D)  failb=3D 17(=
D)  OK
> [    7.351142] raid6test: test_disks(4, 18): faila=3D  4(D)  failb=3D 18(=
D)  OK
> [    7.352351] raid6test: test_disks(4, 19): faila=3D  4(D)  failb=3D 19(=
D)  OK
> [    7.353557] raid6test: test_disks(4, 20): faila=3D  4(D)  failb=3D 20(=
D)  OK
> [    7.354765] raid6test: test_disks(4, 21): faila=3D  4(D)  failb=3D 21(=
D)  OK
> [    7.355973] raid6test: test_disks(4, 22): faila=3D  4(D)  failb=3D 22(=
P)  OK
> [    7.357174] raid6test: test_disks(4, 23): faila=3D  4(D)  failb=3D 23(=
Q)  OK
> [    7.358377] raid6test: test_disks(5, 6): faila=3D  5(D)  failb=3D  6(D=
)  OK
> [    7.359572] raid6test: test_disks(5, 7): faila=3D  5(D)  failb=3D  7(D=
)  OK
> [    7.360833] raid6test: test_disks(5, 8): faila=3D  5(D)  failb=3D  8(D=
)  OK
> [    7.362032] raid6test: test_disks(5, 9): faila=3D  5(D)  failb=3D  9(D=
)  OK
> [    7.363226] raid6test: test_disks(5, 10): faila=3D  5(D)  failb=3D 10(=
D)  OK
> [    7.364430] raid6test: test_disks(5, 11): faila=3D  5(D)  failb=3D 11(=
D)  OK
> [    7.365633] raid6test: test_disks(5, 12): faila=3D  5(D)  failb=3D 12(=
D)  OK
> [    7.366839] raid6test: test_disks(5, 13): faila=3D  5(D)  failb=3D 13(=
D)  OK
> [    7.368049] raid6test: test_disks(5, 14): faila=3D  5(D)  failb=3D 14(=
D)  OK
> [    7.369256] raid6test: test_disks(5, 15): faila=3D  5(D)  failb=3D 15(=
D)  OK
> [    7.370462] raid6test: test_disks(5, 16): faila=3D  5(D)  failb=3D 16(=
D)  OK
> [    7.371716] raid6test: test_disks(5, 17): faila=3D  5(D)  failb=3D 17(=
D)  OK
> [    7.372928] raid6test: test_disks(5, 18): faila=3D  5(D)  failb=3D 18(=
D)  OK
> [    7.374133] raid6test: test_disks(5, 19): faila=3D  5(D)  failb=3D 19(=
D)  OK
> [    7.375336] raid6test: test_disks(5, 20): faila=3D  5(D)  failb=3D 20(=
D)  OK
> [    7.376535] raid6test: test_disks(5, 21): faila=3D  5(D)  failb=3D 21(=
D)  OK
> [    7.377744] raid6test: test_disks(5, 22): faila=3D  5(D)  failb=3D 22(=
P)  OK
> [    7.378945] raid6test: test_disks(5, 23): faila=3D  5(D)  failb=3D 23(=
Q)  OK
> [    7.380152] raid6test: test_disks(6, 7): faila=3D  6(D)  failb=3D  7(D=
)  OK
> [    7.381390] raid6test: test_disks(6, 8): faila=3D  6(D)  failb=3D  8(D=
)  OK
> [    7.382590] raid6test: test_disks(6, 9): faila=3D  6(D)  failb=3D  9(D=
)  OK
> [    7.383781] raid6test: test_disks(6, 10): faila=3D  6(D)  failb=3D 10(=
D)  OK
> [    7.384988] raid6test: test_disks(6, 11): faila=3D  6(D)  failb=3D 11(=
D)  OK
> [    7.386198] raid6test: test_disks(6, 12): faila=3D  6(D)  failb=3D 12(=
D)  OK
> [    7.387400] raid6test: test_disks(6, 13): faila=3D  6(D)  failb=3D 13(=
D)  OK
> [    7.388605] raid6test: test_disks(6, 14): faila=3D  6(D)  failb=3D 14(=
D)  OK
> [    7.389812] raid6test: test_disks(6, 15): faila=3D  6(D)  failb=3D 15(=
D)  OK
> [    7.391076] raid6test: test_disks(6, 16): faila=3D  6(D)  failb=3D 16(=
D)  OK
> [    7.392286] raid6test: test_disks(6, 17): faila=3D  6(D)  failb=3D 17(=
D)  OK
> [    7.393497] raid6test: test_disks(6, 18): faila=3D  6(D)  failb=3D 18(=
D)  OK
> [    7.394701] raid6test: test_disks(6, 19): faila=3D  6(D)  failb=3D 19(=
D)  OK
> [    7.395928] raid6test: test_disks(6, 20): faila=3D  6(D)  failb=3D 20(=
D)  OK
> [    7.397136] raid6test: test_disks(6, 21): faila=3D  6(D)  failb=3D 21(=
D)  OK
> [    7.398340] raid6test: test_disks(6, 22): faila=3D  6(D)  failb=3D 22(=
P)  OK
> [    7.399537] raid6test: test_disks(6, 23): faila=3D  6(D)  failb=3D 23(=
Q)  OK
> [    7.400743] raid6test: test_disks(7, 8): faila=3D  7(D)  failb=3D  8(D=
)  OK
> [    7.401995] raid6test: test_disks(7, 9): faila=3D  7(D)  failb=3D  9(D=
)  OK
> [    7.403190] raid6test: test_disks(7, 10): faila=3D  7(D)  failb=3D 10(=
D)  OK
> [    7.404396] raid6test: test_disks(7, 11): faila=3D  7(D)  failb=3D 11(=
D)  OK
> [    7.405604] raid6test: test_disks(7, 12): faila=3D  7(D)  failb=3D 12(=
D)  OK
> [    7.406808] raid6test: test_disks(7, 13): faila=3D  7(D)  failb=3D 13(=
D)  OK
> [    7.408015] raid6test: test_disks(7, 14): faila=3D  7(D)  failb=3D 14(=
D)  OK
> [    7.409228] raid6test: test_disks(7, 15): faila=3D  7(D)  failb=3D 15(=
D)  OK
> [    7.410436] raid6test: test_disks(7, 16): faila=3D  7(D)  failb=3D 16(=
D)  OK
> [    7.411693] raid6test: test_disks(7, 17): faila=3D  7(D)  failb=3D 17(=
D)  OK
> [    7.412905] raid6test: test_disks(7, 18): faila=3D  7(D)  failb=3D 18(=
D)  OK
> [    7.414111] raid6test: test_disks(7, 19): faila=3D  7(D)  failb=3D 19(=
D)  OK
> [    7.415315] raid6test: test_disks(7, 20): faila=3D  7(D)  failb=3D 20(=
D)  OK
> [    7.416524] raid6test: test_disks(7, 21): faila=3D  7(D)  failb=3D 21(=
D)  OK
> [    7.417724] raid6test: test_disks(7, 22): faila=3D  7(D)  failb=3D 22(=
P)  OK
> [    7.418924] raid6test: test_disks(7, 23): faila=3D  7(D)  failb=3D 23(=
Q)  OK
> [    7.420132] raid6test: test_disks(8, 9): faila=3D  8(D)  failb=3D  9(D=
)  OK
> [    7.421373] raid6test: test_disks(8, 10): faila=3D  8(D)  failb=3D 10(=
D)  OK
> [    7.422580] raid6test: test_disks(8, 11): faila=3D  8(D)  failb=3D 11(=
D)  OK
> [    7.423792] raid6test: test_disks(8, 12): faila=3D  8(D)  failb=3D 12(=
D)  OK
> [    7.425007] raid6test: test_disks(8, 13): faila=3D  8(D)  failb=3D 13(=
D)  OK
> [    7.426217] raid6test: test_disks(8, 14): faila=3D  8(D)  failb=3D 14(=
D)  OK
> [    7.427424] raid6test: test_disks(8, 15): faila=3D  8(D)  failb=3D 15(=
D)  OK
> [    7.428629] raid6test: test_disks(8, 16): faila=3D  8(D)  failb=3D 16(=
D)  OK
> [    7.429833] raid6test: test_disks(8, 17): faila=3D  8(D)  failb=3D 17(=
D)  OK
> [    7.431089] raid6test: test_disks(8, 18): faila=3D  8(D)  failb=3D 18(=
D)  OK
> [    7.432294] raid6test: test_disks(8, 19): faila=3D  8(D)  failb=3D 19(=
D)  OK
> [    7.433498] raid6test: test_disks(8, 20): faila=3D  8(D)  failb=3D 20(=
D)  OK
> [    7.434700] raid6test: test_disks(8, 21): faila=3D  8(D)  failb=3D 21(=
D)  OK
> [    7.435901] raid6test: test_disks(8, 22): faila=3D  8(D)  failb=3D 22(=
P)  OK
> [    7.437098] raid6test: test_disks(8, 23): faila=3D  8(D)  failb=3D 23(=
Q)  OK
> [    7.438304] raid6test: test_disks(9, 10): faila=3D  9(D)  failb=3D 10(=
D)  OK
> [    7.439509] raid6test: test_disks(9, 11): faila=3D  9(D)  failb=3D 11(=
D)  OK
> [    7.440711] raid6test: test_disks(9, 12): faila=3D  9(D)  failb=3D 12(=
D)  OK
> [    7.441975] raid6test: test_disks(9, 13): faila=3D  9(D)  failb=3D 13(=
D)  OK
> [    7.443187] raid6test: test_disks(9, 14): faila=3D  9(D)  failb=3D 14(=
D)  OK
> [    7.444397] raid6test: test_disks(9, 15): faila=3D  9(D)  failb=3D 15(=
D)  OK
> [    7.445602] raid6test: test_disks(9, 16): faila=3D  9(D)  failb=3D 16(=
D)  OK
> [    7.446810] raid6test: test_disks(9, 17): faila=3D  9(D)  failb=3D 17(=
D)  OK
> [    7.448025] raid6test: test_disks(9, 18): faila=3D  9(D)  failb=3D 18(=
D)  OK
> [    7.449233] raid6test: test_disks(9, 19): faila=3D  9(D)  failb=3D 19(=
D)  OK
> [    7.450441] raid6test: test_disks(9, 20): faila=3D  9(D)  failb=3D 20(=
D)  OK
> [    7.451700] raid6test: test_disks(9, 21): faila=3D  9(D)  failb=3D 21(=
D)  OK
> [    7.452911] raid6test: test_disks(9, 22): faila=3D  9(D)  failb=3D 22(=
P)  OK
> [    7.454111] raid6test: test_disks(9, 23): faila=3D  9(D)  failb=3D 23(=
Q)  OK
> [    7.455320] raid6test: test_disks(10, 11): faila=3D 10(D)  failb=3D 11=
(D)  OK
> [    7.456539] raid6test: test_disks(10, 12): faila=3D 10(D)  failb=3D 12=
(D)  OK
> [    7.457760] raid6test: test_disks(10, 13): faila=3D 10(D)  failb=3D 13=
(D)  OK
> [    7.458980] raid6test: test_disks(10, 14): faila=3D 10(D)  failb=3D 14=
(D)  OK
> [    7.460197] raid6test: test_disks(10, 15): faila=3D 10(D)  failb=3D 15=
(D)  OK
> [    7.461461] raid6test: test_disks(10, 16): faila=3D 10(D)  failb=3D 16=
(D)  OK
> [    7.462688] raid6test: test_disks(10, 17): faila=3D 10(D)  failb=3D 17=
(D)  OK
> [    7.463912] raid6test: test_disks(10, 18): faila=3D 10(D)  failb=3D 18=
(D)  OK
> [    7.465134] raid6test: test_disks(10, 19): faila=3D 10(D)  failb=3D 19=
(D)  OK
> [    7.466350] raid6test: test_disks(10, 20): faila=3D 10(D)  failb=3D 20=
(D)  OK
> [    7.467570] raid6test: test_disks(10, 21): faila=3D 10(D)  failb=3D 21=
(D)  OK
> [    7.468783] raid6test: test_disks(10, 22): faila=3D 10(D)  failb=3D 22=
(P)  OK
> [    7.469999] raid6test: test_disks(10, 23): faila=3D 10(D)  failb=3D 23=
(Q)  OK
> [    7.471271] raid6test: test_disks(11, 12): faila=3D 11(D)  failb=3D 12=
(D)  OK
> [    7.472493] raid6test: test_disks(11, 13): faila=3D 11(D)  failb=3D 13=
(D)  OK
> [    7.473714] raid6test: test_disks(11, 14): faila=3D 11(D)  failb=3D 14=
(D)  OK
> [    7.474935] raid6test: test_disks(11, 15): faila=3D 11(D)  failb=3D 15=
(D)  OK
> [    7.476158] raid6test: test_disks(11, 16): faila=3D 11(D)  failb=3D 16=
(D)  OK
> [    7.477373] raid6test: test_disks(11, 17): faila=3D 11(D)  failb=3D 17=
(D)  OK
> [    7.478591] raid6test: test_disks(11, 18): faila=3D 11(D)  failb=3D 18=
(D)  OK
> [    7.479815] raid6test: test_disks(11, 19): faila=3D 11(D)  failb=3D 19=
(D)  OK
> [    7.481097] raid6test: test_disks(11, 20): faila=3D 11(D)  failb=3D 20=
(D)  OK
> [    7.482321] raid6test: test_disks(11, 21): faila=3D 11(D)  failb=3D 21=
(D)  OK
> [    7.483537] raid6test: test_disks(11, 22): faila=3D 11(D)  failb=3D 22=
(P)  OK
> [    7.484750] raid6test: test_disks(11, 23): faila=3D 11(D)  failb=3D 23=
(Q)  OK
> [    7.485975] raid6test: test_disks(12, 13): faila=3D 12(D)  failb=3D 13=
(D)  OK
> [    7.487195] raid6test: test_disks(12, 14): faila=3D 12(D)  failb=3D 14=
(D)  OK
> [    7.488416] raid6test: test_disks(12, 15): faila=3D 12(D)  failb=3D 15=
(D)  OK
> [    7.489643] raid6test: test_disks(12, 16): faila=3D 12(D)  failb=3D 16=
(D)  OK
> [    7.490922] raid6test: test_disks(12, 17): faila=3D 12(D)  failb=3D 17=
(D)  OK
> [    7.492144] raid6test: test_disks(12, 18): faila=3D 12(D)  failb=3D 18=
(D)  OK
> [    7.493365] raid6test: test_disks(12, 19): faila=3D 12(D)  failb=3D 19=
(D)  OK
> [    7.494583] raid6test: test_disks(12, 20): faila=3D 12(D)  failb=3D 20=
(D)  OK
> [    7.495804] raid6test: test_disks(12, 21): faila=3D 12(D)  failb=3D 21=
(D)  OK
> [    7.497025] raid6test: test_disks(12, 22): faila=3D 12(D)  failb=3D 22=
(P)  OK
> [    7.498234] raid6test: test_disks(12, 23): faila=3D 12(D)  failb=3D 23=
(Q)  OK
> [    7.499452] raid6test: test_disks(13, 14): faila=3D 13(D)  failb=3D 14=
(D)  OK
> [    7.500664] raid6test: test_disks(13, 15): faila=3D 13(D)  failb=3D 15=
(D)  OK
> [    7.501937] raid6test: test_disks(13, 16): faila=3D 13(D)  failb=3D 16=
(D)  OK
> [    7.503155] raid6test: test_disks(13, 17): faila=3D 13(D)  failb=3D 17=
(D)  OK
> [    7.504368] raid6test: test_disks(13, 18): faila=3D 13(D)  failb=3D 18=
(D)  OK
> [    7.505593] raid6test: test_disks(13, 19): faila=3D 13(D)  failb=3D 19=
(D)  OK
> [    7.506808] raid6test: test_disks(13, 20): faila=3D 13(D)  failb=3D 20=
(D)  OK
> [    7.508032] raid6test: test_disks(13, 21): faila=3D 13(D)  failb=3D 21=
(D)  OK
> [    7.509249] raid6test: test_disks(13, 22): faila=3D 13(D)  failb=3D 22=
(P)  OK
> [    7.510461] raid6test: test_disks(13, 23): faila=3D 13(D)  failb=3D 23=
(Q)  OK
> [    7.511731] raid6test: test_disks(14, 15): faila=3D 14(D)  failb=3D 15=
(D)  OK
> [    7.513012] raid6test: test_disks(14, 16): faila=3D 14(D)  failb=3D 16=
(D)  OK
> [    7.514234] raid6test: test_disks(14, 17): faila=3D 14(D)  failb=3D 17=
(D)  OK
> [    7.515493] raid6test: test_disks(14, 18): faila=3D 14(D)  failb=3D 18=
(D)  OK
> [    7.516712] raid6test: test_disks(14, 19): faila=3D 14(D)  failb=3D 19=
(D)  OK
> [    7.517933] raid6test: test_disks(14, 20): faila=3D 14(D)  failb=3D 20=
(D)  OK
> [    7.519151] raid6test: test_disks(14, 21): faila=3D 14(D)  failb=3D 21=
(D)  OK
> [    7.520365] raid6test: test_disks(14, 22): faila=3D 14(D)  failb=3D 22=
(P)  OK
> [    7.521631] raid6test: test_disks(14, 23): faila=3D 14(D)  failb=3D 23=
(Q)  OK
> [    7.522867] raid6test: test_disks(15, 16): faila=3D 15(D)  failb=3D 16=
(D)  OK
> [    7.524090] raid6test: test_disks(15, 17): faila=3D 15(D)  failb=3D 17=
(D)  OK
> [    7.525310] raid6test: test_disks(15, 18): faila=3D 15(D)  failb=3D 18=
(D)  OK
> [    7.526525] raid6test: test_disks(15, 19): faila=3D 15(D)  failb=3D 19=
(D)  OK
> [    7.527742] raid6test: test_disks(15, 20): faila=3D 15(D)  failb=3D 20=
(D)  OK
> [    7.528971] raid6test: test_disks(15, 21): faila=3D 15(D)  failb=3D 21=
(D)  OK
> [    7.530188] raid6test: test_disks(15, 22): faila=3D 15(D)  failb=3D 22=
(P)  OK
> [    7.531445] raid6test: test_disks(15, 23): faila=3D 15(D)  failb=3D 23=
(Q)  OK
> [    7.532664] raid6test: test_disks(16, 17): faila=3D 16(D)  failb=3D 17=
(D)  OK
> [    7.533891] raid6test: test_disks(16, 18): faila=3D 16(D)  failb=3D 18=
(D)  OK
> [    7.535107] raid6test: test_disks(16, 19): faila=3D 16(D)  failb=3D 19=
(D)  OK
> [    7.536323] raid6test: test_disks(16, 20): faila=3D 16(D)  failb=3D 20=
(D)  OK
> [    7.537543] raid6test: test_disks(16, 21): faila=3D 16(D)  failb=3D 21=
(D)  OK
> [    7.538757] raid6test: test_disks(16, 22): faila=3D 16(D)  failb=3D 22=
(P)  OK
> [    7.539971] raid6test: test_disks(16, 23): faila=3D 16(D)  failb=3D 23=
(Q)  OK
> [    7.541241] raid6test: test_disks(17, 18): faila=3D 17(D)  failb=3D 18=
(D)  OK
> [    7.542468] raid6test: test_disks(17, 19): faila=3D 17(D)  failb=3D 19=
(D)  OK
> [    7.543683] raid6test: test_disks(17, 20): faila=3D 17(D)  failb=3D 20=
(D)  OK
> [    7.544907] raid6test: test_disks(17, 21): faila=3D 17(D)  failb=3D 21=
(D)  OK
> [    7.546122] raid6test: test_disks(17, 22): faila=3D 17(D)  failb=3D 22=
(P)  OK
> [    7.547333] raid6test: test_disks(17, 23): faila=3D 17(D)  failb=3D 23=
(Q)  OK
> [    7.548551] raid6test: test_disks(18, 19): faila=3D 18(D)  failb=3D 19=
(D)  OK
> [    7.549771] raid6test: test_disks(18, 20): faila=3D 18(D)  failb=3D 20=
(D)  OK
> [    7.551044] raid6test: test_disks(18, 21): faila=3D 18(D)  failb=3D 21=
(D)  OK
> [    7.552266] raid6test: test_disks(18, 22): faila=3D 18(D)  failb=3D 22=
(P)  OK
> [    7.553485] raid6test: test_disks(18, 23): faila=3D 18(D)  failb=3D 23=
(Q)  OK
> [    7.554704] raid6test: test_disks(19, 20): faila=3D 19(D)  failb=3D 20=
(D)  OK
> [    7.555927] raid6test: test_disks(19, 21): faila=3D 19(D)  failb=3D 21=
(D)  OK
> [    7.557138] raid6test: test_disks(19, 22): faila=3D 19(D)  failb=3D 22=
(P)  OK
> [    7.558349] raid6test: test_disks(19, 23): faila=3D 19(D)  failb=3D 23=
(Q)  OK
> [    7.559569] raid6test: test_disks(20, 21): faila=3D 20(D)  failb=3D 21=
(D)  OK
> [    7.560858] raid6test: test_disks(20, 22): faila=3D 20(D)  failb=3D 22=
(P)  OK
> [    7.562071] raid6test: test_disks(20, 23): faila=3D 20(D)  failb=3D 23=
(Q)  OK
> [    7.563287] raid6test: test_disks(21, 22): faila=3D 21(D)  failb=3D 22=
(P)  OK
> [    7.564494] raid6test: test_disks(21, 23): faila=3D 21(D)  failb=3D 23=
(Q)  OK
> [    7.565695] raid6test: test_disks(22, 23): faila=3D 22(P)  failb=3D 23=
(Q)  OK
> [    7.567626] raid6test: testing the 64-disk case...
> [    7.568717] raid6test: test_disks(0, 1): faila=3D  0(D)  failb=3D  1(D=
)  OK
> [    7.570087] raid6test: test_disks(0, 2): faila=3D  0(D)  failb=3D  2(D=
)  OK
> [    7.571502] raid6test: test_disks(0, 3): faila=3D  0(D)  failb=3D  3(D=
)  OK
> [    7.572876] raid6test: test_disks(0, 4): faila=3D  0(D)  failb=3D  4(D=
)  OK
> [    7.574238] raid6test: test_disks(0, 5): faila=3D  0(D)  failb=3D  5(D=
)  OK
> [    7.575596] raid6test: test_disks(0, 6): faila=3D  0(D)  failb=3D  6(D=
)  OK
> [    7.576964] raid6test: test_disks(0, 7): faila=3D  0(D)  failb=3D  7(D=
)  OK
> [    7.578328] raid6test: test_disks(0, 8): faila=3D  0(D)  failb=3D  8(D=
)  OK
> [    7.579695] raid6test: test_disks(0, 9): faila=3D  0(D)  failb=3D  9(D=
)  OK
> [    7.581114] raid6test: test_disks(0, 10): faila=3D  0(D)  failb=3D 10(=
D)  OK
> [    7.582497] raid6test: test_disks(0, 11): faila=3D  0(D)  failb=3D 11(=
D)  OK
> [    7.583883] raid6test: test_disks(0, 12): faila=3D  0(D)  failb=3D 12(=
D)  OK
> [    7.585266] raid6test: test_disks(0, 13): faila=3D  0(D)  failb=3D 13(=
D)  OK
> [    7.586643] raid6test: test_disks(0, 14): faila=3D  0(D)  failb=3D 14(=
D)  OK
> [    7.588044] raid6test: test_disks(0, 15): faila=3D  0(D)  failb=3D 15(=
D)  OK
> [    7.589422] raid6test: test_disks(0, 16): faila=3D  0(D)  failb=3D 16(=
D)  OK
> [    7.590870] raid6test: test_disks(0, 17): faila=3D  0(D)  failb=3D 17(=
D)  OK
> [    7.592254] raid6test: test_disks(0, 18): faila=3D  0(D)  failb=3D 18(=
D)  OK
> [    7.593632] raid6test: test_disks(0, 19): faila=3D  0(D)  failb=3D 19(=
D)  OK
> [    7.595020] raid6test: test_disks(0, 20): faila=3D  0(D)  failb=3D 20(=
D)  OK
> [    7.596403] raid6test: test_disks(0, 21): faila=3D  0(D)  failb=3D 21(=
D)  OK
> [    7.597780] raid6test: test_disks(0, 22): faila=3D  0(D)  failb=3D 22(=
D)  OK
> [    7.599167] raid6test: test_disks(0, 23): faila=3D  0(D)  failb=3D 23(=
D)  OK
> [    7.600540] raid6test: test_disks(0, 24): faila=3D  0(D)  failb=3D 24(=
D)  OK
> [    7.601974] raid6test: test_disks(0, 25): faila=3D  0(D)  failb=3D 25(=
D)  OK
> [    7.603355] raid6test: test_disks(0, 26): faila=3D  0(D)  failb=3D 26(=
D)  OK
> [    7.604733] raid6test: test_disks(0, 27): faila=3D  0(D)  failb=3D 27(=
D)  OK
> [    7.606118] raid6test: test_disks(0, 28): faila=3D  0(D)  failb=3D 28(=
D)  OK
> [    7.607498] raid6test: test_disks(0, 29): faila=3D  0(D)  failb=3D 29(=
D)  OK
> [    7.608881] raid6test: test_disks(0, 30): faila=3D  0(D)  failb=3D 30(=
D)  OK
> [    7.610262] raid6test: test_disks(0, 31): faila=3D  0(D)  failb=3D 31(=
D)  OK
> [    7.611688] raid6test: test_disks(0, 32): faila=3D  0(D)  failb=3D 32(=
D)  OK
> [    7.613076] raid6test: test_disks(0, 33): faila=3D  0(D)  failb=3D 33(=
D)  OK
> [    7.614458] raid6test: test_disks(0, 34): faila=3D  0(D)  failb=3D 34(=
D)  OK
> [    7.615837] raid6test: test_disks(0, 35): faila=3D  0(D)  failb=3D 35(=
D)  OK
> [    7.617219] raid6test: test_disks(0, 36): faila=3D  0(D)  failb=3D 36(=
D)  OK
> [    7.618596] raid6test: test_disks(0, 37): faila=3D  0(D)  failb=3D 37(=
D)  OK
> [    7.619981] raid6test: test_disks(0, 38): faila=3D  0(D)  failb=3D 38(=
D)  OK
> [    7.621409] raid6test: test_disks(0, 39): faila=3D  0(D)  failb=3D 39(=
D)  OK
> [    7.622790] raid6test: test_disks(0, 40): faila=3D  0(D)  failb=3D 40(=
D)  OK
> [    7.624171] raid6test: test_disks(0, 41): faila=3D  0(D)  failb=3D 41(=
D)  OK
> [    7.625597] raid6test: test_disks(0, 42): faila=3D  0(D)  failb=3D 42(=
D)  OK
> [    7.626987] raid6test: test_disks(0, 43): faila=3D  0(D)  failb=3D 43(=
D)  OK
> [    7.628366] raid6test: test_disks(0, 44): faila=3D  0(D)  failb=3D 44(=
D)  OK
> [    7.629746] raid6test: test_disks(0, 45): faila=3D  0(D)  failb=3D 45(=
D)  OK
> [    7.631192] raid6test: test_disks(0, 46): faila=3D  0(D)  failb=3D 46(=
D)  OK
> [    7.632570] raid6test: test_disks(0, 47): faila=3D  0(D)  failb=3D 47(=
D)  OK
> [    7.633953] raid6test: test_disks(0, 48): faila=3D  0(D)  failb=3D 48(=
D)  OK
> [    7.635331] raid6test: test_disks(0, 49): faila=3D  0(D)  failb=3D 49(=
D)  OK
> [    7.636707] raid6test: test_disks(0, 50): faila=3D  0(D)  failb=3D 50(=
D)  OK
> [    7.638086] raid6test: test_disks(0, 51): faila=3D  0(D)  failb=3D 51(=
D)  OK
> [    7.639464] raid6test: test_disks(0, 52): faila=3D  0(D)  failb=3D 52(=
D)  OK
> [    7.640961] raid6test: test_disks(0, 53): faila=3D  0(D)  failb=3D 53(=
D)  OK
> [    7.642346] raid6test: test_disks(0, 54): faila=3D  0(D)  failb=3D 54(=
D)  OK
> [    7.643724] raid6test: test_disks(0, 55): faila=3D  0(D)  failb=3D 55(=
D)  OK
> [    7.645103] raid6test: test_disks(0, 56): faila=3D  0(D)  failb=3D 56(=
D)  OK
> [    7.646484] raid6test: test_disks(0, 57): faila=3D  0(D)  failb=3D 57(=
D)  OK
> [    7.647866] raid6test: test_disks(0, 58): faila=3D  0(D)  failb=3D 58(=
D)  OK
> [    7.649244] raid6test: test_disks(0, 59): faila=3D  0(D)  failb=3D 59(=
D)  OK
> [    7.650621] raid6test: test_disks(0, 60): faila=3D  0(D)  failb=3D 60(=
D)  OK
> [    7.652053] raid6test: test_disks(0, 61): faila=3D  0(D)  failb=3D 61(=
D)  OK
> [    7.653429] raid6test: test_disks(0, 62): faila=3D  0(D)  failb=3D 62(=
P)  OK
> [    7.654807] raid6test: test_disks(0, 63): faila=3D  0(D)  failb=3D 63(=
Q)  OK
> [    7.656187] raid6test: test_disks(1, 2): faila=3D  1(D)  failb=3D  2(D=
)  OK
> [    7.657553] raid6test: test_disks(1, 3): faila=3D  1(D)  failb=3D  3(D=
)  OK
> [    7.658929] raid6test: test_disks(1, 4): faila=3D  1(D)  failb=3D  4(D=
)  OK
> [    7.660291] raid6test: test_disks(1, 5): faila=3D  1(D)  failb=3D  5(D=
)  OK
> [    7.661706] raid6test: test_disks(1, 6): faila=3D  1(D)  failb=3D  6(D=
)  OK
> [    7.663079] raid6test: test_disks(1, 7): faila=3D  1(D)  failb=3D  7(D=
)  OK
> [    7.664448] raid6test: test_disks(1, 8): faila=3D  1(D)  failb=3D  8(D=
)  OK
> [    7.665809] raid6test: test_disks(1, 9): faila=3D  1(D)  failb=3D  9(D=
)  OK
> [    7.667178] raid6test: test_disks(1, 10): faila=3D  1(D)  failb=3D 10(=
D)  OK
> [    7.668553] raid6test: test_disks(1, 11): faila=3D  1(D)  failb=3D 11(=
D)  OK
> [    7.669940] raid6test: test_disks(1, 12): faila=3D  1(D)  failb=3D 12(=
D)  OK
> [    7.671368] raid6test: test_disks(1, 13): faila=3D  1(D)  failb=3D 13(=
D)  OK
> [    7.672751] raid6test: test_disks(1, 14): faila=3D  1(D)  failb=3D 14(=
D)  OK
> [    7.674132] raid6test: test_disks(1, 15): faila=3D  1(D)  failb=3D 15(=
D)  OK
> [    7.675510] raid6test: test_disks(1, 16): faila=3D  1(D)  failb=3D 16(=
D)  OK
> [    7.676886] raid6test: test_disks(1, 17): faila=3D  1(D)  failb=3D 17(=
D)  OK
> [    7.678264] raid6test: test_disks(1, 18): faila=3D  1(D)  failb=3D 18(=
D)  OK
> [    7.679646] raid6test: test_disks(1, 19): faila=3D  1(D)  failb=3D 19(=
D)  OK
> [    7.681092] raid6test: test_disks(1, 20): faila=3D  1(D)  failb=3D 20(=
D)  OK
> [    7.682475] raid6test: test_disks(1, 21): faila=3D  1(D)  failb=3D 21(=
D)  OK
> [    7.683860] raid6test: test_disks(1, 22): faila=3D  1(D)  failb=3D 22(=
D)  OK
> [    7.685235] raid6test: test_disks(1, 23): faila=3D  1(D)  failb=3D 23(=
D)  OK
> [    7.686612] raid6test: test_disks(1, 24): faila=3D  1(D)  failb=3D 24(=
D)  OK
> [    7.687993] raid6test: test_disks(1, 25): faila=3D  1(D)  failb=3D 25(=
D)  OK
> [    7.689372] raid6test: test_disks(1, 26): faila=3D  1(D)  failb=3D 26(=
D)  OK
> [    7.690744] raid6test: test_disks(1, 27): faila=3D  1(D)  failb=3D 27(=
D)  OK
> [    7.692175] raid6test: test_disks(1, 28): faila=3D  1(D)  failb=3D 28(=
D)  OK
> [    7.693560] raid6test: test_disks(1, 29): faila=3D  1(D)  failb=3D 29(=
D)  OK
> [    7.694945] raid6test: test_disks(1, 30): faila=3D  1(D)  failb=3D 30(=
D)  OK
> [    7.696323] raid6test: test_disks(1, 31): faila=3D  1(D)  failb=3D 31(=
D)  OK
> [    7.697701] raid6test: test_disks(1, 32): faila=3D  1(D)  failb=3D 32(=
D)  OK
> [    7.699085] raid6test: test_disks(1, 33): faila=3D  1(D)  failb=3D 33(=
D)  OK
> [    7.700473] raid6test: test_disks(1, 34): faila=3D  1(D)  failb=3D 34(=
D)  OK
> [    7.701907] raid6test: test_disks(1, 35): faila=3D  1(D)  failb=3D 35(=
D)  OK
> [    7.703287] raid6test: test_disks(1, 36): faila=3D  1(D)  failb=3D 36(=
D)  OK
> [    7.704672] raid6test: test_disks(1, 37): faila=3D  1(D)  failb=3D 37(=
D)  OK
> [    7.706056] raid6test: test_disks(1, 38): faila=3D  1(D)  failb=3D 38(=
D)  OK
> [    7.707433] raid6test: test_disks(1, 39): faila=3D  1(D)  failb=3D 39(=
D)  OK
> [    7.708802] raid6test: test_disks(1, 40): faila=3D  1(D)  failb=3D 40(=
D)  OK
> [    7.710188] raid6test: test_disks(1, 41): faila=3D  1(D)  failb=3D 41(=
D)  OK
> [    7.711617] raid6test: test_disks(1, 42): faila=3D  1(D)  failb=3D 42(=
D)  OK
> [    7.713003] raid6test: test_disks(1, 43): faila=3D  1(D)  failb=3D 43(=
D)  OK
> [    7.714333] raid6test: test_disks(1, 44): faila=3D  1(D)  failb=3D 44(=
D)  OK
> [    7.715541] raid6test: test_disks(1, 45): faila=3D  1(D)  failb=3D 45(=
D)  OK
> [    7.716872] raid6test: test_disks(1, 46): faila=3D  1(D)  failb=3D 46(=
D)  OK
> [    7.718199] raid6test: test_disks(1, 47): faila=3D  1(D)  failb=3D 47(=
D)  OK
> [    7.719519] raid6test: test_disks(1, 48): faila=3D  1(D)  failb=3D 48(=
D)  OK
> [    7.720913] raid6test: test_disks(1, 49): faila=3D  1(D)  failb=3D 49(=
D)  OK
> [    7.722239] raid6test: test_disks(1, 50): faila=3D  1(D)  failb=3D 50(=
D)  OK
> [    7.723572] raid6test: test_disks(1, 51): faila=3D  1(D)  failb=3D 51(=
D)  OK
> [    7.724897] raid6test: test_disks(1, 52): faila=3D  1(D)  failb=3D 52(=
D)  OK
> [    7.726225] raid6test: test_disks(1, 53): faila=3D  1(D)  failb=3D 53(=
D)  OK
> [    7.727552] raid6test: test_disks(1, 54): faila=3D  1(D)  failb=3D 54(=
D)  OK
> [    7.728886] raid6test: test_disks(1, 55): faila=3D  1(D)  failb=3D 55(=
D)  OK
> [    7.730211] raid6test: test_disks(1, 56): faila=3D  1(D)  failb=3D 56(=
D)  OK
> [    7.732151] raid6test: test_disks(1, 57): faila=3D  1(D)  failb=3D 57(=
D)  OK
> [    7.733372] raid6test: test_disks(1, 58): faila=3D  1(D)  failb=3D 58(=
D)  OK
> [    7.734597] raid6test: test_disks(1, 59): faila=3D  1(D)  failb=3D 59(=
D)  OK
> [    7.735813] raid6test: test_disks(1, 60): faila=3D  1(D)  failb=3D 60(=
D)  OK
> [    7.737162] raid6test: test_disks(1, 61): faila=3D  1(D)  failb=3D 61(=
D)  OK
> [    7.738394] raid6test: test_disks(1, 62): faila=3D  1(D)  failb=3D 62(=
P)  OK
> [    7.739648] raid6test: test_disks(1, 63): faila=3D  1(D)  failb=3D 63(=
Q)  OK
> [    7.741654] raid6test: test_disks(2, 3): faila=3D  2(D)  failb=3D  3(D=
)  OK
> [    7.742875] raid6test: test_disks(2, 4): faila=3D  2(D)  failb=3D  4(D=
)  OK
> [    7.744074] raid6test: test_disks(2, 5): faila=3D  2(D)  failb=3D  5(D=
)  OK
> [    7.745275] raid6test: test_disks(2, 6): faila=3D  2(D)  failb=3D  6(D=
)  OK
> [    7.746507] raid6test: test_disks(2, 7): faila=3D  2(D)  failb=3D  7(D=
)  OK
> [    7.747812] raid6test: test_disks(2, 8): faila=3D  2(D)  failb=3D  8(D=
)  OK
> [    7.749112] raid6test: test_disks(2, 9): faila=3D  2(D)  failb=3D  9(D=
)  OK
> [    7.750414] raid6test: test_disks(2, 10): faila=3D  2(D)  failb=3D 10(=
D)  OK
> [    7.751788] raid6test: test_disks(2, 11): faila=3D  2(D)  failb=3D 11(=
D)  OK
> [    7.753118] raid6test: test_disks(2, 12): faila=3D  2(D)  failb=3D 12(=
D)  OK
> [    7.754407] raid6test: test_disks(2, 13): faila=3D  2(D)  failb=3D 13(=
D)  OK
> [    7.755609] raid6test: test_disks(2, 14): faila=3D  2(D)  failb=3D 14(=
D)  OK
> [    7.756844] raid6test: test_disks(2, 15): faila=3D  2(D)  failb=3D 15(=
D)  OK
> [    7.758172] raid6test: test_disks(2, 16): faila=3D  2(D)  failb=3D 16(=
D)  OK
> [    7.759504] raid6test: test_disks(2, 17): faila=3D  2(D)  failb=3D 17(=
D)  OK
> [    7.760899] raid6test: test_disks(2, 18): faila=3D  2(D)  failb=3D 18(=
D)  OK
> [    7.762231] raid6test: test_disks(2, 19): faila=3D  2(D)  failb=3D 19(=
D)  OK
> [    7.763448] raid6test: test_disks(2, 20): faila=3D  2(D)  failb=3D 20(=
D)  OK
> [    7.764782] raid6test: test_disks(2, 21): faila=3D  2(D)  failb=3D 21(=
D)  OK
> [    7.766108] raid6test: test_disks(2, 22): faila=3D  2(D)  failb=3D 22(=
D)  OK
> [    7.767328] raid6test: test_disks(2, 23): faila=3D  2(D)  failb=3D 23(=
D)  OK
> [    7.768647] raid6test: test_disks(2, 24): faila=3D  2(D)  failb=3D 24(=
D)  OK
> [    7.770619] raid6test: test_disks(2, 25): faila=3D  2(D)  failb=3D 25(=
D)  OK
> [    7.772036] raid6test: test_disks(2, 26): faila=3D  2(D)  failb=3D 26(=
D)  OK
> [    7.773372] raid6test: test_disks(2, 27): faila=3D  2(D)  failb=3D 27(=
D)  OK
> [    7.774703] raid6test: test_disks(2, 28): faila=3D  2(D)  failb=3D 28(=
D)  OK
> [    7.775966] raid6test: test_disks(2, 29): faila=3D  2(D)  failb=3D 29(=
D)  OK
> [    7.777294] raid6test: test_disks(2, 30): faila=3D  2(D)  failb=3D 30(=
D)  OK
> [    7.778615] raid6test: test_disks(2, 31): faila=3D  2(D)  failb=3D 31(=
D)  OK
> [    7.779875] raid6test: test_disks(2, 32): faila=3D  2(D)  failb=3D 32(=
D)  OK
> [    7.781256] raid6test: test_disks(2, 33): faila=3D  2(D)  failb=3D 33(=
D)  OK
> [    7.782585] raid6test: test_disks(2, 34): faila=3D  2(D)  failb=3D 34(=
D)  OK
> [    7.783745] raid6test: test_disks(2, 35): faila=3D  2(D)  failb=3D 35(=
D)  OK
> [    7.785068] raid6test: test_disks(2, 36): faila=3D  2(D)  failb=3D 36(=
D)  OK
> [    7.786395] raid6test: test_disks(2, 37): faila=3D  2(D)  failb=3D 37(=
D)  OK
> [    7.787681] raid6test: test_disks(2, 38): faila=3D  2(D)  failb=3D 38(=
D)  OK
> [    7.789014] raid6test: test_disks(2, 39): faila=3D  2(D)  failb=3D 39(=
D)  OK
> [    7.790355] raid6test: test_disks(2, 40): faila=3D  2(D)  failb=3D 40(=
D)  OK
> [    7.791743] raid6test: test_disks(2, 41): faila=3D  2(D)  failb=3D 41(=
D)  OK
> [    7.793071] raid6test: test_disks(2, 42): faila=3D  2(D)  failb=3D 42(=
D)  OK
> [    7.794400] raid6test: test_disks(2, 43): faila=3D  2(D)  failb=3D 43(=
D)  OK
> [    7.795727] raid6test: test_disks(2, 44): faila=3D  2(D)  failb=3D 44(=
D)  OK
> [    7.797060] raid6test: test_disks(2, 45): faila=3D  2(D)  failb=3D 45(=
D)  OK
> [    7.798384] raid6test: test_disks(2, 46): faila=3D  2(D)  failb=3D 46(=
D)  OK
> [    7.799719] raid6test: test_disks(2, 47): faila=3D  2(D)  failb=3D 47(=
D)  OK
> [    7.801109] raid6test: test_disks(2, 48): faila=3D  2(D)  failb=3D 48(=
D)  OK
> [    7.802437] raid6test: test_disks(2, 49): faila=3D  2(D)  failb=3D 49(=
D)  OK
> [    7.803768] raid6test: test_disks(2, 50): faila=3D  2(D)  failb=3D 50(=
D)  OK
> [    7.805097] raid6test: test_disks(2, 51): faila=3D  2(D)  failb=3D 51(=
D)  OK
> [    7.806423] raid6test: test_disks(2, 52): faila=3D  2(D)  failb=3D 52(=
D)  OK
> [    7.807750] raid6test: test_disks(2, 53): faila=3D  2(D)  failb=3D 53(=
D)  OK
> [    7.809076] raid6test: test_disks(2, 54): faila=3D  2(D)  failb=3D 54(=
D)  OK
> [    7.810404] raid6test: test_disks(2, 55): faila=3D  2(D)  failb=3D 55(=
D)  OK
> [    7.811783] raid6test: test_disks(2, 56): faila=3D  2(D)  failb=3D 56(=
D)  OK
> [    7.813115] raid6test: test_disks(2, 57): faila=3D  2(D)  failb=3D 57(=
D)  OK
> [    7.814441] raid6test: test_disks(2, 58): faila=3D  2(D)  failb=3D 58(=
D)  OK
> [    7.815770] raid6test: test_disks(2, 59): faila=3D  2(D)  failb=3D 59(=
D)  OK
> [    7.817104] raid6test: test_disks(2, 60): faila=3D  2(D)  failb=3D 60(=
D)  OK
> [    7.818432] raid6test: test_disks(2, 61): faila=3D  2(D)  failb=3D 61(=
D)  OK
> [    7.819756] raid6test: test_disks(2, 62): faila=3D  2(D)  failb=3D 62(=
P)  OK
> [    7.821143] raid6test: test_disks(2, 63): faila=3D  2(D)  failb=3D 63(=
Q)  OK
> [    7.822515] raid6test: test_disks(3, 4): faila=3D  3(D)  failb=3D  4(D=
)  OK
> [    7.823829] raid6test: test_disks(3, 5): faila=3D  3(D)  failb=3D  5(D=
)  OK
> [    7.825156] raid6test: test_disks(3, 6): faila=3D  3(D)  failb=3D  6(D=
)  OK
> [    7.826474] raid6test: test_disks(3, 7): faila=3D  3(D)  failb=3D  7(D=
)  OK
> [    7.827796] raid6test: test_disks(3, 8): faila=3D  3(D)  failb=3D  8(D=
)  OK
> [    7.829123] raid6test: test_disks(3, 9): faila=3D  3(D)  failb=3D  9(D=
)  OK
> [    7.830433] raid6test: test_disks(3, 10): faila=3D  3(D)  failb=3D 10(=
D)  OK
> [    7.831648] raid6test: test_disks(3, 11): faila=3D  3(D)  failb=3D 11(=
D)  OK
> [    7.832925] raid6test: test_disks(3, 12): faila=3D  3(D)  failb=3D 12(=
D)  OK
> [    7.834245] raid6test: test_disks(3, 13): faila=3D  3(D)  failb=3D 13(=
D)  OK
> [    7.835559] raid6test: test_disks(3, 14): faila=3D  3(D)  failb=3D 14(=
D)  OK
> [    7.836929] raid6test: test_disks(3, 15): faila=3D  3(D)  failb=3D 15(=
D)  OK
> [    7.838250] raid6test: test_disks(3, 16): faila=3D  3(D)  failb=3D 16(=
D)  OK
> [    7.839582] raid6test: test_disks(3, 17): faila=3D  3(D)  failb=3D 17(=
D)  OK
> [    7.840979] raid6test: test_disks(3, 18): faila=3D  3(D)  failb=3D 18(=
D)  OK
> [    7.842308] raid6test: test_disks(3, 19): faila=3D  3(D)  failb=3D 19(=
D)  OK
> [    7.843656] raid6test: test_disks(3, 20): faila=3D  3(D)  failb=3D 20(=
D)  OK
> [    7.844985] raid6test: test_disks(3, 21): faila=3D  3(D)  failb=3D 21(=
D)  OK
> [    7.846329] raid6test: test_disks(3, 22): faila=3D  3(D)  failb=3D 22(=
D)  OK
> [    7.847657] raid6test: test_disks(3, 23): faila=3D  3(D)  failb=3D 23(=
D)  OK
> [    7.848991] raid6test: test_disks(3, 24): faila=3D  3(D)  failb=3D 24(=
D)  OK
> [    7.850316] raid6test: test_disks(3, 25): faila=3D  3(D)  failb=3D 25(=
D)  OK
> [    7.851644] raid6test: test_disks(3, 26): faila=3D  3(D)  failb=3D 26(=
D)  OK
> [    7.852977] raid6test: test_disks(3, 27): faila=3D  3(D)  failb=3D 27(=
D)  OK
> [    7.854303] raid6test: test_disks(3, 28): faila=3D  3(D)  failb=3D 28(=
D)  OK
> [    7.855485] raid6test: test_disks(3, 29): faila=3D  3(D)  failb=3D 29(=
D)  OK
> [    7.856812] raid6test: test_disks(3, 30): faila=3D  3(D)  failb=3D 30(=
D)  OK
> [    7.858154] raid6test: test_disks(3, 31): faila=3D  3(D)  failb=3D 31(=
D)  OK
> [    7.859460] raid6test: test_disks(3, 32): faila=3D  3(D)  failb=3D 32(=
D)  OK
> [    7.860901] raid6test: test_disks(3, 33): faila=3D  3(D)  failb=3D 33(=
D)  OK
> [    7.862257] raid6test: test_disks(3, 34): faila=3D  3(D)  failb=3D 34(=
D)  OK
> [    7.863621] raid6test: test_disks(3, 35): faila=3D  3(D)  failb=3D 35(=
D)  OK
> [    7.864951] raid6test: test_disks(3, 36): faila=3D  3(D)  failb=3D 36(=
D)  OK
> [    7.866301] raid6test: test_disks(3, 37): faila=3D  3(D)  failb=3D 37(=
D)  OK
> [    7.867684] raid6test: test_disks(3, 38): faila=3D  3(D)  failb=3D 38(=
D)  OK
> [    7.869051] raid6test: test_disks(3, 39): faila=3D  3(D)  failb=3D 39(=
D)  OK
> [    7.870386] raid6test: test_disks(3, 40): faila=3D  3(D)  failb=3D 40(=
D)  OK
> [    7.871655] raid6test: test_disks(3, 41): faila=3D  3(D)  failb=3D 41(=
D)  OK
> [    7.872985] raid6test: test_disks(3, 42): faila=3D  3(D)  failb=3D 42(=
D)  OK
> [    7.874305] raid6test: test_disks(3, 43): faila=3D  3(D)  failb=3D 43(=
D)  OK
> [    7.875517] raid6test: test_disks(3, 44): faila=3D  3(D)  failb=3D 44(=
D)  OK
> [    7.876819] raid6test: test_disks(3, 45): faila=3D  3(D)  failb=3D 45(=
D)  OK
> [    7.878154] raid6test: test_disks(3, 46): faila=3D  3(D)  failb=3D 46(=
D)  OK
> [    7.879437] raid6test: test_disks(3, 47): faila=3D  3(D)  failb=3D 47(=
D)  OK
> [    7.880831] raid6test: test_disks(3, 48): faila=3D  3(D)  failb=3D 48(=
D)  OK
> [    7.882162] raid6test: test_disks(3, 49): faila=3D  3(D)  failb=3D 49(=
D)  OK
> [    7.883475] raid6test: test_disks(3, 50): faila=3D  3(D)  failb=3D 50(=
D)  OK
> [    7.884823] raid6test: test_disks(3, 51): faila=3D  3(D)  failb=3D 51(=
D)  OK
> [    7.886174] raid6test: test_disks(3, 52): faila=3D  3(D)  failb=3D 52(=
D)  OK
> [    7.887554] raid6test: test_disks(3, 53): faila=3D  3(D)  failb=3D 53(=
D)  OK
> [    7.888959] raid6test: test_disks(3, 54): faila=3D  3(D)  failb=3D 54(=
D)  OK
> [    7.890304] raid6test: test_disks(3, 55): faila=3D  3(D)  failb=3D 55(=
D)  OK
> [    7.891724] raid6test: test_disks(3, 56): faila=3D  3(D)  failb=3D 56(=
D)  OK
> [    7.893106] raid6test: test_disks(3, 57): faila=3D  3(D)  failb=3D 57(=
D)  OK
> [    7.894466] raid6test: test_disks(3, 58): faila=3D  3(D)  failb=3D 58(=
D)  OK
> [    7.895841] raid6test: test_disks(3, 59): faila=3D  3(D)  failb=3D 59(=
D)  OK
> [    7.897067] raid6test: test_disks(3, 60): faila=3D  3(D)  failb=3D 60(=
D)  OK
> [    7.898399] raid6test: test_disks(3, 61): faila=3D  3(D)  failb=3D 61(=
D)  OK
> [    7.899732] raid6test: test_disks(3, 62): faila=3D  3(D)  failb=3D 62(=
P)  OK
> [    7.901126] raid6test: test_disks(3, 63): faila=3D  3(D)  failb=3D 63(=
Q)  OK
> [    7.902455] raid6test: test_disks(4, 5): faila=3D  4(D)  failb=3D  5(D=
)  OK
> [    7.903771] raid6test: test_disks(4, 6): faila=3D  4(D)  failb=3D  6(D=
)  OK
> [    7.905087] raid6test: test_disks(4, 7): faila=3D  4(D)  failb=3D  7(D=
)  OK
> [    7.906400] raid6test: test_disks(4, 8): faila=3D  4(D)  failb=3D  8(D=
)  OK
> [    7.907724] raid6test: test_disks(4, 9): faila=3D  4(D)  failb=3D  9(D=
)  OK
> [    7.909040] raid6test: test_disks(4, 10): faila=3D  4(D)  failb=3D 10(=
D)  OK
> [    7.910368] raid6test: test_disks(4, 11): faila=3D  4(D)  failb=3D 11(=
D)  OK
> [    7.916980] raid6test: test_disks(4, 12): faila=3D  4(D)  failb=3D 12(=
D)  OK
> [    7.918312] raid6test: test_disks(4, 13): faila=3D  4(D)  failb=3D 13(=
D)  OK
> [    7.919608] raid6test: test_disks(4, 14): faila=3D  4(D)  failb=3D 14(=
D)  OK
> [    7.920998] raid6test: test_disks(4, 15): faila=3D  4(D)  failb=3D 15(=
D)  OK
> [    7.922325] raid6test: test_disks(4, 16): faila=3D  4(D)  failb=3D 16(=
D)  OK
> [    7.923529] raid6test: test_disks(4, 17): faila=3D  4(D)  failb=3D 17(=
D)  OK
> [    7.924859] raid6test: test_disks(4, 18): faila=3D  4(D)  failb=3D 18(=
D)  OK
> [    7.926183] raid6test: test_disks(4, 19): faila=3D  4(D)  failb=3D 19(=
D)  OK
> [    7.927404] raid6test: test_disks(4, 20): faila=3D  4(D)  failb=3D 20(=
D)  OK
> [    7.928658] raid6test: test_disks(4, 21): faila=3D  4(D)  failb=3D 21(=
D)  OK
> [    7.929990] raid6test: test_disks(4, 22): faila=3D  4(D)  failb=3D 22(=
D)  OK
> [    7.931291] raid6test: test_disks(4, 23): faila=3D  4(D)  failb=3D 23(=
D)  OK
> [    7.932618] raid6test: test_disks(4, 24): faila=3D  4(D)  failb=3D 24(=
D)  OK
> [    7.933943] raid6test: test_disks(4, 25): faila=3D  4(D)  failb=3D 25(=
D)  OK
> [    7.935205] raid6test: test_disks(4, 26): faila=3D  4(D)  failb=3D 26(=
D)  OK
> [    7.936463] raid6test: test_disks(4, 27): faila=3D  4(D)  failb=3D 27(=
D)  OK
> [    7.937791] raid6test: test_disks(4, 28): faila=3D  4(D)  failb=3D 28(=
D)  OK
> [    7.939066] raid6test: test_disks(4, 29): faila=3D  4(D)  failb=3D 29(=
D)  OK
> [    7.940307] raid6test: test_disks(4, 30): faila=3D  4(D)  failb=3D 30(=
D)  OK
> [    7.941690] raid6test: test_disks(4, 31): faila=3D  4(D)  failb=3D 31(=
D)  OK
> [    7.943038] raid6test: test_disks(4, 32): faila=3D  4(D)  failb=3D 32(=
D)  OK
> [    7.944367] raid6test: test_disks(4, 33): faila=3D  4(D)  failb=3D 33(=
D)  OK
> [    7.945685] raid6test: test_disks(4, 34): faila=3D  4(D)  failb=3D 34(=
D)  OK
> [    7.947040] raid6test: test_disks(4, 35): faila=3D  4(D)  failb=3D 35(=
D)  OK
> [    7.948428] raid6test: test_disks(4, 36): faila=3D  4(D)  failb=3D 36(=
D)  OK
> [    7.949794] raid6test: test_disks(4, 37): faila=3D  4(D)  failb=3D 37(=
D)  OK
> [    7.951238] raid6test: test_disks(4, 38): faila=3D  4(D)  failb=3D 38(=
D)  OK
> [    7.952606] raid6test: test_disks(4, 39): faila=3D  4(D)  failb=3D 39(=
D)  OK
> [    7.953912] raid6test: test_disks(4, 40): faila=3D  4(D)  failb=3D 40(=
D)  OK
> [    7.955156] raid6test: test_disks(4, 41): faila=3D  4(D)  failb=3D 41(=
D)  OK
> [    7.956399] raid6test: test_disks(4, 42): faila=3D  4(D)  failb=3D 42(=
D)  OK
> [    7.957714] raid6test: test_disks(4, 43): faila=3D  4(D)  failb=3D 43(=
D)  OK
> [    7.958978] raid6test: test_disks(4, 44): faila=3D  4(D)  failb=3D 44(=
D)  OK
> [    7.960286] raid6test: test_disks(4, 45): faila=3D  4(D)  failb=3D 45(=
D)  OK
> [    7.961659] raid6test: test_disks(4, 46): faila=3D  4(D)  failb=3D 46(=
D)  OK
> [    7.962931] raid6test: test_disks(4, 47): faila=3D  4(D)  failb=3D 47(=
D)  OK
> [    7.964159] raid6test: test_disks(4, 48): faila=3D  4(D)  failb=3D 48(=
D)  OK
> [    7.965470] raid6test: test_disks(4, 49): faila=3D  4(D)  failb=3D 49(=
D)  OK
> [    7.966743] raid6test: test_disks(4, 50): faila=3D  4(D)  failb=3D 50(=
D)  OK
> [    7.968084] raid6test: test_disks(4, 51): faila=3D  4(D)  failb=3D 51(=
D)  OK
> [    7.969440] raid6test: test_disks(4, 52): faila=3D  4(D)  failb=3D 52(=
D)  OK
> [    7.970887] raid6test: test_disks(4, 53): faila=3D  4(D)  failb=3D 53(=
D)  OK
> [    7.972273] raid6test: test_disks(4, 54): faila=3D  4(D)  failb=3D 54(=
D)  OK
> [    7.973667] raid6test: test_disks(4, 55): faila=3D  4(D)  failb=3D 55(=
D)  OK
> [    7.975032] raid6test: test_disks(4, 56): faila=3D  4(D)  failb=3D 56(=
D)  OK
> [    7.976404] raid6test: test_disks(4, 57): faila=3D  4(D)  failb=3D 57(=
D)  OK
> [    7.977765] raid6test: test_disks(4, 58): faila=3D  4(D)  failb=3D 58(=
D)  OK
> [    7.979139] raid6test: test_disks(4, 59): faila=3D  4(D)  failb=3D 59(=
D)  OK
> [    7.980509] raid6test: test_disks(4, 60): faila=3D  4(D)  failb=3D 60(=
D)  OK
> [    7.994303] raid6test: test_disks(4, 61): faila=3D  4(D)  failb=3D 61(=
D)  OK
> [    7.995672] raid6test: test_disks(4, 62): faila=3D  4(D)  failb=3D 62(=
P)  OK
> [    7.997049] raid6test: test_disks(4, 63): faila=3D  4(D)  failb=3D 63(=
Q)  OK
> [    7.998429] raid6test: test_disks(5, 6): faila=3D  5(D)  failb=3D  6(D=
)  OK
> [    7.999794] raid6test: test_disks(5, 7): faila=3D  5(D)  failb=3D  7(D=
)  OK
> [    8.011441] raid6test: test_disks(5, 8): faila=3D  5(D)  failb=3D  8(D=
)  OK
> [    8.012821] raid6test: test_disks(5, 9): faila=3D  5(D)  failb=3D  9(D=
)  OK
> [    8.014209] raid6test: test_disks(5, 10): faila=3D  5(D)  failb=3D 10(=
D)  OK
> [    8.015543] raid6test: test_disks(5, 11): faila=3D  5(D)  failb=3D 11(=
D)  OK
> [    8.016926] raid6test: test_disks(5, 12): faila=3D  5(D)  failb=3D 12(=
D)  OK
> [    8.018298] raid6test: test_disks(5, 13): faila=3D  5(D)  failb=3D 13(=
D)  OK
> [    8.019659] raid6test: test_disks(5, 14): faila=3D  5(D)  failb=3D 14(=
D)  OK
> [    8.033270] raid6test: test_disks(5, 15): faila=3D  5(D)  failb=3D 15(=
D)  OK
> [    8.034671] raid6test: test_disks(5, 16): faila=3D  5(D)  failb=3D 16(=
D)  OK
> [    8.036039] raid6test: test_disks(5, 17): faila=3D  5(D)  failb=3D 17(=
D)  OK
> [    8.037391] raid6test: test_disks(5, 18): faila=3D  5(D)  failb=3D 18(=
D)  OK
> [    8.038762] raid6test: test_disks(5, 19): faila=3D  5(D)  failb=3D 19(=
D)  OK
> [    8.040099] raid6test: test_disks(5, 20): faila=3D  5(D)  failb=3D 20(=
D)  OK
> [    8.054338] raid6test: test_disks(5, 21): faila=3D  5(D)  failb=3D 21(=
D)  OK
> [    8.056183] raid6test: test_disks(5, 22): faila=3D  5(D)  failb=3D 22(=
D)  OK
> [    8.057558] raid6test: test_disks(5, 23): faila=3D  5(D)  failb=3D 23(=
D)  OK
> [    8.058947] raid6test: test_disks(5, 24): faila=3D  5(D)  failb=3D 24(=
D)  OK
> [    8.060318] raid6test: test_disks(5, 25): faila=3D  5(D)  failb=3D 25(=
D)  OK
> [    8.061784] raid6test: test_disks(5, 26): faila=3D  5(D)  failb=3D 26(=
D)  OK
> [    8.063124] raid6test: test_disks(5, 27): faila=3D  5(D)  failb=3D 27(=
D)  OK
> [    8.064513] raid6test: test_disks(5, 28): faila=3D  5(D)  failb=3D 28(=
D)  OK
> [    8.065857] raid6test: test_disks(5, 29): faila=3D  5(D)  failb=3D 29(=
D)  OK
> [    8.067248] raid6test: test_disks(5, 30): faila=3D  5(D)  failb=3D 30(=
D)  OK
> [    8.068636] raid6test: test_disks(5, 31): faila=3D  5(D)  failb=3D 31(=
D)  OK
> [    8.083189] raid6test: test_disks(5, 32): faila=3D  5(D)  failb=3D 32(=
D)  OK
> [    8.084560] raid6test: test_disks(5, 33): faila=3D  5(D)  failb=3D 33(=
D)  OK
> [    8.085945] raid6test: test_disks(5, 34): faila=3D  5(D)  failb=3D 34(=
D)  OK
> [    8.087291] raid6test: test_disks(5, 35): faila=3D  5(D)  failb=3D 35(=
D)  OK
> [    8.088652] raid6test: test_disks(5, 36): faila=3D  5(D)  failb=3D 36(=
D)  OK
> [    8.090070] raid6test: test_disks(5, 37): faila=3D  5(D)  failb=3D 37(=
D)  OK
> [    8.100280] raid6test: test_disks(5, 38): faila=3D  5(D)  failb=3D 38(=
D)  OK
> [    8.101630] raid6test: test_disks(5, 39): faila=3D  5(D)  failb=3D 39(=
D)  OK
> [    8.102928] raid6test: test_disks(5, 40): faila=3D  5(D)  failb=3D 40(=
D)  OK
> [    8.104168] raid6test: test_disks(5, 41): faila=3D  5(D)  failb=3D 41(=
D)  OK
> [    8.105495] raid6test: test_disks(5, 42): faila=3D  5(D)  failb=3D 42(=
D)  OK
> [    8.106824] raid6test: test_disks(5, 43): faila=3D  5(D)  failb=3D 43(=
D)  OK
> [    8.108155] raid6test: test_disks(5, 44): faila=3D  5(D)  failb=3D 44(=
D)  OK
> [    8.109427] raid6test: test_disks(5, 45): faila=3D  5(D)  failb=3D 45(=
D)  OK
> [    8.110031] raid6test: test_disks(5, 46): faila=3D  5(D)  failb=3D 46(=
D)  OK
> [    8.112046] raid6test: test_disks(5, 47): faila=3D  5(D)  failb=3D 47(=
D)  OK
> [    8.130525] raid6test: test_disks(5, 48): faila=3D  5(D)  failb=3D 48(=
D)  OK
> [    8.131868] raid6test: test_disks(5, 49): faila=3D  5(D)  failb=3D 49(=
D)  OK
> [    8.133198] raid6test: test_disks(5, 50): faila=3D  5(D)  failb=3D 50(=
D)  OK
> [    8.134528] raid6test: test_disks(5, 51): faila=3D  5(D)  failb=3D 51(=
D)  OK
> [    8.135865] raid6test: test_disks(5, 52): faila=3D  5(D)  failb=3D 52(=
D)  OK
> [    8.137191] raid6test: test_disks(5, 53): faila=3D  5(D)  failb=3D 53(=
D)  OK
> [    8.138519] raid6test: test_disks(5, 54): faila=3D  5(D)  failb=3D 54(=
D)  OK
> [    8.139718] raid6test: test_disks(5, 55): faila=3D  5(D)  failb=3D 55(=
D)  OK
> [    8.141017] raid6test: test_disks(5, 56): faila=3D  5(D)  failb=3D 56(=
D)  OK
> [    8.142353] raid6test: test_disks(5, 57): faila=3D  5(D)  failb=3D 57(=
D)  OK
> [    8.152137] raid6test: test_disks(5, 58): faila=3D  5(D)  failb=3D 58(=
D)  OK
> [    8.153469] raid6test: test_disks(5, 59): faila=3D  5(D)  failb=3D 59(=
D)  OK
> [    8.154800] raid6test: test_disks(5, 60): faila=3D  5(D)  failb=3D 60(=
D)  OK
> [    8.156143] raid6test: test_disks(5, 61): faila=3D  5(D)  failb=3D 61(=
D)  OK
> [    8.157483] raid6test: test_disks(5, 62): faila=3D  5(D)  failb=3D 62(=
P)  OK
> [    8.158814] raid6test: test_disks(5, 63): faila=3D  5(D)  failb=3D 63(=
Q)  OK
> [    8.160157] raid6test: test_disks(6, 7): faila=3D  6(D)  failb=3D  7(D=
)  OK
> [    8.161540] raid6test: test_disks(6, 8): faila=3D  6(D)  failb=3D  8(D=
)  OK
> [    8.162870] raid6test: test_disks(6, 9): faila=3D  6(D)  failb=3D  9(D=
)  OK
> [    8.164187] raid6test: test_disks(6, 10): faila=3D  6(D)  failb=3D 10(=
D)  OK
> [    8.165518] raid6test: test_disks(6, 11): faila=3D  6(D)  failb=3D 11(=
D)  OK
> [    8.166856] raid6test: test_disks(6, 12): faila=3D  6(D)  failb=3D 12(=
D)  OK
> [    8.168190] raid6test: test_disks(6, 13): faila=3D  6(D)  failb=3D 13(=
D)  OK
> [    8.169523] raid6test: test_disks(6, 14): faila=3D  6(D)  failb=3D 14(=
D)  OK
> [    8.171131] raid6test: test_disks(6, 15): faila=3D  6(D)  failb=3D 15(=
D)  OK
> [    8.172471] raid6test: test_disks(6, 16): faila=3D  6(D)  failb=3D 16(=
D)  OK
> [    8.173809] raid6test: test_disks(6, 17): faila=3D  6(D)  failb=3D 17(=
D)  OK
> [    8.175135] raid6test: test_disks(6, 18): faila=3D  6(D)  failb=3D 18(=
D)  OK
> [    8.176471] raid6test: test_disks(6, 19): faila=3D  6(D)  failb=3D 19(=
D)  OK
> [    8.177807] raid6test: test_disks(6, 20): faila=3D  6(D)  failb=3D 20(=
D)  OK
> [    8.179102] raid6test: test_disks(6, 21): faila=3D  6(D)  failb=3D 21(=
D)  OK
> [    8.180436] raid6test: test_disks(6, 22): faila=3D  6(D)  failb=3D 22(=
D)  OK
> [    8.181822] raid6test: test_disks(6, 23): faila=3D  6(D)  failb=3D 23(=
D)  OK
> [    8.183153] raid6test: test_disks(6, 24): faila=3D  6(D)  failb=3D 24(=
D)  OK
> [    8.184485] raid6test: test_disks(6, 25): faila=3D  6(D)  failb=3D 25(=
D)  OK
> [    8.185820] raid6test: test_disks(6, 26): faila=3D  6(D)  failb=3D 26(=
D)  OK
> [    8.187131] raid6test: test_disks(6, 27): faila=3D  6(D)  failb=3D 27(=
D)  OK
> [    8.188457] raid6test: test_disks(6, 28): faila=3D  6(D)  failb=3D 28(=
D)  OK
> [    8.189798] raid6test: test_disks(6, 29): faila=3D  6(D)  failb=3D 29(=
D)  OK
> [    8.191146] raid6test: test_disks(6, 30): faila=3D  6(D)  failb=3D 30(=
D)  OK
> [    8.192484] raid6test: test_disks(6, 31): faila=3D  6(D)  failb=3D 31(=
D)  OK
> [    8.193821] raid6test: test_disks(6, 32): faila=3D  6(D)  failb=3D 32(=
D)  OK
> [    8.195110] raid6test: test_disks(6, 33): faila=3D  6(D)  failb=3D 33(=
D)  OK
> [    8.196327] raid6test: test_disks(6, 34): faila=3D  6(D)  failb=3D 34(=
D)  OK
> [    8.197654] raid6test: test_disks(6, 35): faila=3D  6(D)  failb=3D 35(=
D)  OK
> [    8.198952] raid6test: test_disks(6, 36): faila=3D  6(D)  failb=3D 36(=
D)  OK
> [    8.200255] raid6test: test_disks(6, 37): faila=3D  6(D)  failb=3D 37(=
D)  OK
> [    8.201648] raid6test: test_disks(6, 38): faila=3D  6(D)  failb=3D 38(=
D)  OK
> [    8.202946] raid6test: test_disks(6, 39): faila=3D  6(D)  failb=3D 39(=
D)  OK
> [    8.204272] raid6test: test_disks(6, 40): faila=3D  6(D)  failb=3D 40(=
D)  OK
> [    8.205596] raid6test: test_disks(6, 41): faila=3D  6(D)  failb=3D 41(=
D)  OK
> [    8.206920] raid6test: test_disks(6, 42): faila=3D  6(D)  failb=3D 42(=
D)  OK
> [    8.208248] raid6test: test_disks(6, 43): faila=3D  6(D)  failb=3D 43(=
D)  OK
> [    8.209586] raid6test: test_disks(6, 44): faila=3D  6(D)  failb=3D 44(=
D)  OK
> [    8.210990] raid6test: test_disks(6, 45): faila=3D  6(D)  failb=3D 45(=
D)  OK
> [    8.212324] raid6test: test_disks(6, 46): faila=3D  6(D)  failb=3D 46(=
D)  OK
> [    8.213656] raid6test: test_disks(6, 47): faila=3D  6(D)  failb=3D 47(=
D)  OK
> [    8.214991] raid6test: test_disks(6, 48): faila=3D  6(D)  failb=3D 48(=
D)  OK
> [    8.216319] raid6test: test_disks(6, 49): faila=3D  6(D)  failb=3D 49(=
D)  OK
> [    8.217647] raid6test: test_disks(6, 50): faila=3D  6(D)  failb=3D 50(=
D)  OK
> [    8.218945] raid6test: test_disks(6, 51): faila=3D  6(D)  failb=3D 51(=
D)  OK
> [    8.220262] raid6test: test_disks(6, 52): faila=3D  6(D)  failb=3D 52(=
D)  OK
> [    8.221656] raid6test: test_disks(6, 53): faila=3D  6(D)  failb=3D 53(=
D)  OK
> [    8.222874] raid6test: test_disks(6, 54): faila=3D  6(D)  failb=3D 54(=
D)  OK
> [    8.224203] raid6test: test_disks(6, 55): faila=3D  6(D)  failb=3D 55(=
D)  OK
> [    8.225527] raid6test: test_disks(6, 56): faila=3D  6(D)  failb=3D 56(=
D)  OK
> [    8.226860] raid6test: test_disks(6, 57): faila=3D  6(D)  failb=3D 57(=
D)  OK
> [    8.228191] raid6test: test_disks(6, 58): faila=3D  6(D)  failb=3D 58(=
D)  OK
> [    8.229536] raid6test: test_disks(6, 59): faila=3D  6(D)  failb=3D 59(=
D)  OK
> [    8.230920] raid6test: test_disks(6, 60): faila=3D  6(D)  failb=3D 60(=
D)  OK
> [    8.232256] raid6test: test_disks(6, 61): faila=3D  6(D)  failb=3D 61(=
D)  OK
> [    8.233494] raid6test: test_disks(6, 62): faila=3D  6(D)  failb=3D 62(=
P)  OK
> [    8.234815] raid6test: test_disks(6, 63): faila=3D  6(D)  failb=3D 63(=
Q)  OK
> [    8.236150] raid6test: test_disks(7, 8): faila=3D  7(D)  failb=3D  8(D=
)  OK
> [    8.237402] raid6test: test_disks(7, 9): faila=3D  7(D)  failb=3D  9(D=
)  OK
> [    8.238575] raid6test: test_disks(7, 10): faila=3D  7(D)  failb=3D 10(=
D)  OK
> [    8.239903] raid6test: test_disks(7, 11): faila=3D  7(D)  failb=3D 11(=
D)  OK
> [    8.241287] raid6test: test_disks(7, 12): faila=3D  7(D)  failb=3D 12(=
D)  OK
> [    8.242624] raid6test: test_disks(7, 13): faila=3D  7(D)  failb=3D 13(=
D)  OK
> [    8.243960] raid6test: test_disks(7, 14): faila=3D  7(D)  failb=3D 14(=
D)  OK
> [    8.245285] raid6test: test_disks(7, 15): faila=3D  7(D)  failb=3D 15(=
D)  OK
> [    8.246616] raid6test: test_disks(7, 16): faila=3D  7(D)  failb=3D 16(=
D)  OK
> [    8.247948] raid6test: test_disks(7, 17): faila=3D  7(D)  failb=3D 17(=
D)  OK
> [    8.249277] raid6test: test_disks(7, 18): faila=3D  7(D)  failb=3D 18(=
D)  OK
> [    8.250601] raid6test: test_disks(7, 19): faila=3D  7(D)  failb=3D 19(=
D)  OK
> [    8.251997] raid6test: test_disks(7, 20): faila=3D  7(D)  failb=3D 20(=
D)  OK
> [    8.253321] raid6test: test_disks(7, 21): faila=3D  7(D)  failb=3D 21(=
D)  OK
> [    8.254651] raid6test: test_disks(7, 22): faila=3D  7(D)  failb=3D 22(=
D)  OK
> [    8.255982] raid6test: test_disks(7, 23): faila=3D  7(D)  failb=3D 23(=
D)  OK
> [    8.257315] raid6test: test_disks(7, 24): faila=3D  7(D)  failb=3D 24(=
D)  OK
> [    8.258648] raid6test: test_disks(7, 25): faila=3D  7(D)  failb=3D 25(=
D)  OK
> [    8.259987] raid6test: test_disks(7, 26): faila=3D  7(D)  failb=3D 26(=
D)  OK
> [    8.261367] raid6test: test_disks(7, 27): faila=3D  7(D)  failb=3D 27(=
D)  OK
> [    8.262693] raid6test: test_disks(7, 28): faila=3D  7(D)  failb=3D 28(=
D)  OK
> [    8.264030] raid6test: test_disks(7, 29): faila=3D  7(D)  failb=3D 29(=
D)  OK
> [    8.265362] raid6test: test_disks(7, 30): faila=3D  7(D)  failb=3D 30(=
D)  OK
> [    8.266688] raid6test: test_disks(7, 31): faila=3D  7(D)  failb=3D 31(=
D)  OK
> [    8.268015] raid6test: test_disks(7, 32): faila=3D  7(D)  failb=3D 32(=
D)  OK
> [    8.269346] raid6test: test_disks(7, 33): faila=3D  7(D)  failb=3D 33(=
D)  OK
> [    8.270668] raid6test: test_disks(7, 34): faila=3D  7(D)  failb=3D 34(=
D)  OK
> [    8.271953] raid6test: test_disks(7, 35): faila=3D  7(D)  failb=3D 35(=
D)  OK
> [    8.273283] raid6test: test_disks(7, 36): faila=3D  7(D)  failb=3D 36(=
D)  OK
> [    8.274606] raid6test: test_disks(7, 37): faila=3D  7(D)  failb=3D 37(=
D)  OK
> [    8.275826] raid6test: test_disks(7, 38): faila=3D  7(D)  failb=3D 38(=
D)  OK
> [    8.277160] raid6test: test_disks(7, 39): faila=3D  7(D)  failb=3D 39(=
D)  OK
> [    8.278489] raid6test: test_disks(7, 40): faila=3D  7(D)  failb=3D 40(=
D)  OK
> [    8.279797] raid6test: test_disks(7, 41): faila=3D  7(D)  failb=3D 41(=
D)  OK
> [    8.281188] raid6test: test_disks(7, 42): faila=3D  7(D)  failb=3D 42(=
D)  OK
> [    8.282514] raid6test: test_disks(7, 43): faila=3D  7(D)  failb=3D 43(=
D)  OK
> [    8.283842] raid6test: test_disks(7, 44): faila=3D  7(D)  failb=3D 44(=
D)  OK
> [    8.285169] raid6test: test_disks(7, 45): faila=3D  7(D)  failb=3D 45(=
D)  OK
> [    8.286499] raid6test: test_disks(7, 46): faila=3D  7(D)  failb=3D 46(=
D)  OK
> [    8.287830] raid6test: test_disks(7, 47): faila=3D  7(D)  failb=3D 47(=
D)  OK
> [    8.289160] raid6test: test_disks(7, 48): faila=3D  7(D)  failb=3D 48(=
D)  OK
> [    8.290487] raid6test: test_disks(7, 49): faila=3D  7(D)  failb=3D 49(=
D)  OK
> [    8.291878] raid6test: test_disks(7, 50): faila=3D  7(D)  failb=3D 50(=
D)  OK
> [    8.293209] raid6test: test_disks(7, 51): faila=3D  7(D)  failb=3D 51(=
D)  OK
> [    8.294534] raid6test: test_disks(7, 52): faila=3D  7(D)  failb=3D 52(=
D)  OK
> [    8.295855] raid6test: test_disks(7, 53): faila=3D  7(D)  failb=3D 53(=
D)  OK
> [    8.297173] raid6test: test_disks(7, 54): faila=3D  7(D)  failb=3D 54(=
D)  OK
> [    8.298443] raid6test: test_disks(7, 55): faila=3D  7(D)  failb=3D 55(=
D)  OK
> [    8.299705] raid6test: test_disks(7, 56): faila=3D  7(D)  failb=3D 56(=
D)  OK
> [    8.301094] raid6test: test_disks(7, 57): faila=3D  7(D)  failb=3D 57(=
D)  OK
> [    8.302429] raid6test: test_disks(7, 58): faila=3D  7(D)  failb=3D 58(=
D)  OK
> [    8.303752] raid6test: test_disks(7, 59): faila=3D  7(D)  failb=3D 59(=
D)  OK
> [    8.305083] raid6test: test_disks(7, 60): faila=3D  7(D)  failb=3D 60(=
D)  OK
> [    8.306414] raid6test: test_disks(7, 61): faila=3D  7(D)  failb=3D 61(=
D)  OK
> [    8.307738] raid6test: test_disks(7, 62): faila=3D  7(D)  failb=3D 62(=
P)  OK
> [    8.309075] raid6test: test_disks(7, 63): faila=3D  7(D)  failb=3D 63(=
Q)  OK
> [    8.310406] raid6test: test_disks(8, 9): faila=3D  8(D)  failb=3D  9(D=
)  OK
> [    8.311703] raid6test: test_disks(8, 10): faila=3D  8(D)  failb=3D 10(=
D)  OK
> [    8.313034] raid6test: test_disks(8, 11): faila=3D  8(D)  failb=3D 11(=
D)  OK
> [    8.314362] raid6test: test_disks(8, 12): faila=3D  8(D)  failb=3D 12(=
D)  OK
> [    8.315636] raid6test: test_disks(8, 13): faila=3D  8(D)  failb=3D 13(=
D)  OK
> [    8.316965] raid6test: test_disks(8, 14): faila=3D  8(D)  failb=3D 14(=
D)  OK
> [    8.318294] raid6test: test_disks(8, 15): faila=3D  8(D)  failb=3D 15(=
D)  OK
> [    8.319508] raid6test: test_disks(8, 16): faila=3D  8(D)  failb=3D 16(=
D)  OK
> [    8.320914] raid6test: test_disks(8, 17): faila=3D  8(D)  failb=3D 17(=
D)  OK
> [    8.322254] raid6test: test_disks(8, 18): faila=3D  8(D)  failb=3D 18(=
D)  OK
> [    8.323475] raid6test: test_disks(8, 19): faila=3D  8(D)  failb=3D 19(=
D)  OK
> [    8.324769] raid6test: test_disks(8, 20): faila=3D  8(D)  failb=3D 20(=
D)  OK
> [    8.326101] raid6test: test_disks(8, 21): faila=3D  8(D)  failb=3D 21(=
D)  OK
> [    8.327345] raid6test: test_disks(8, 22): faila=3D  8(D)  failb=3D 22(=
D)  OK
> [    8.328671] raid6test: test_disks(8, 23): faila=3D  8(D)  failb=3D 23(=
D)  OK
> [    8.330005] raid6test: test_disks(8, 24): faila=3D  8(D)  failb=3D 24(=
D)  OK
> [    8.331534] raid6test: test_disks(8, 25): faila=3D  8(D)  failb=3D 25(=
D)  OK
> [    8.332877] raid6test: test_disks(8, 26): faila=3D  8(D)  failb=3D 26(=
D)  OK
> [    8.334197] raid6test: test_disks(8, 27): faila=3D  8(D)  failb=3D 27(=
D)  OK
> [    8.335424] raid6test: test_disks(8, 28): faila=3D  8(D)  failb=3D 28(=
D)  OK
> [    8.336684] raid6test: test_disks(8, 29): faila=3D  8(D)  failb=3D 29(=
D)  OK
> [    8.338008] raid6test: test_disks(8, 30): faila=3D  8(D)  failb=3D 30(=
D)  OK
> [    8.339290] raid6test: test_disks(8, 31): faila=3D  8(D)  failb=3D 31(=
D)  OK
> [    8.340621] raid6test: test_disks(8, 32): faila=3D  8(D)  failb=3D 32(=
D)  OK
> [    8.342022] raid6test: test_disks(8, 33): faila=3D  8(D)  failb=3D 33(=
D)  OK
> [    8.343362] raid6test: test_disks(8, 34): faila=3D  8(D)  failb=3D 34(=
D)  OK
> [    8.344687] raid6test: test_disks(8, 35): faila=3D  8(D)  failb=3D 35(=
D)  OK
> [    8.346026] raid6test: test_disks(8, 36): faila=3D  8(D)  failb=3D 36(=
D)  OK
> [    8.347352] raid6test: test_disks(8, 37): faila=3D  8(D)  failb=3D 37(=
D)  OK
> [    8.348678] raid6test: test_disks(8, 38): faila=3D  8(D)  failb=3D 38(=
D)  OK
> [    8.350011] raid6test: test_disks(8, 39): faila=3D  8(D)  failb=3D 39(=
D)  OK
> [    8.351396] raid6test: test_disks(8, 40): faila=3D  8(D)  failb=3D 40(=
D)  OK
> [    8.352733] raid6test: test_disks(8, 41): faila=3D  8(D)  failb=3D 41(=
D)  OK
> [    8.354065] raid6test: test_disks(8, 42): faila=3D  8(D)  failb=3D 42(=
D)  OK
> [    8.355401] raid6test: test_disks(8, 43): faila=3D  8(D)  failb=3D 43(=
D)  OK
> [    8.356723] raid6test: test_disks(8, 44): faila=3D  8(D)  failb=3D 44(=
D)  OK
> [    8.358051] raid6test: test_disks(8, 45): faila=3D  8(D)  failb=3D 45(=
D)  OK
> [    8.359383] raid6test: test_disks(8, 46): faila=3D  8(D)  failb=3D 46(=
D)  OK
> [    8.360714] raid6test: test_disks(8, 47): faila=3D  8(D)  failb=3D 47(=
D)  OK
> [    8.362104] raid6test: test_disks(8, 48): faila=3D  8(D)  failb=3D 48(=
D)  OK
> [    8.363438] raid6test: test_disks(8, 49): faila=3D  8(D)  failb=3D 49(=
D)  OK
> [    8.364768] raid6test: test_disks(8, 50): faila=3D  8(D)  failb=3D 50(=
D)  OK
> [    8.366105] raid6test: test_disks(8, 51): faila=3D  8(D)  failb=3D 51(=
D)  OK
> [    8.367443] raid6test: test_disks(8, 52): faila=3D  8(D)  failb=3D 52(=
D)  OK
> [    8.368773] raid6test: test_disks(8, 53): faila=3D  8(D)  failb=3D 53(=
D)  OK
> [    8.370111] raid6test: test_disks(8, 54): faila=3D  8(D)  failb=3D 54(=
D)  OK
> [    8.371496] raid6test: test_disks(8, 55): faila=3D  8(D)  failb=3D 55(=
D)  OK
> [    8.372825] raid6test: test_disks(8, 56): faila=3D  8(D)  failb=3D 56(=
D)  OK
> [    8.374159] raid6test: test_disks(8, 57): faila=3D  8(D)  failb=3D 57(=
D)  OK
> [    8.375495] raid6test: test_disks(8, 58): faila=3D  8(D)  failb=3D 58(=
D)  OK
> [    8.376830] raid6test: test_disks(8, 59): faila=3D  8(D)  failb=3D 59(=
D)  OK
> [    8.378161] raid6test: test_disks(8, 60): faila=3D  8(D)  failb=3D 60(=
D)  OK
> [    8.379494] raid6test: test_disks(8, 61): faila=3D  8(D)  failb=3D 61(=
D)  OK
> [    8.380898] raid6test: test_disks(8, 62): faila=3D  8(D)  failb=3D 62(=
P)  OK
> [    8.382212] raid6test: test_disks(8, 63): faila=3D  8(D)  failb=3D 63(=
Q)  OK
> [    8.383546] raid6test: test_disks(9, 10): faila=3D  9(D)  failb=3D 10(=
D)  OK
> [    8.384875] raid6test: test_disks(9, 11): faila=3D  9(D)  failb=3D 11(=
D)  OK
> [    8.386210] raid6test: test_disks(9, 12): faila=3D  9(D)  failb=3D 12(=
D)  OK
> [    8.387469] raid6test: test_disks(9, 13): faila=3D  9(D)  failb=3D 13(=
D)  OK
> [    8.388791] raid6test: test_disks(9, 14): faila=3D  9(D)  failb=3D 14(=
D)  OK
> [    8.390120] raid6test: test_disks(9, 15): faila=3D  9(D)  failb=3D 15(=
D)  OK
> [    8.391480] raid6test: test_disks(9, 16): faila=3D  9(D)  failb=3D 16(=
D)  OK
> [    8.392811] raid6test: test_disks(9, 17): faila=3D  9(D)  failb=3D 17(=
D)  OK
> [    8.394142] raid6test: test_disks(9, 18): faila=3D  9(D)  failb=3D 18(=
D)  OK
> [    8.395460] raid6test: test_disks(9, 19): faila=3D  9(D)  failb=3D 19(=
D)  OK
> [    8.396786] raid6test: test_disks(9, 20): faila=3D  9(D)  failb=3D 20(=
D)  OK
> [    8.398117] raid6test: test_disks(9, 21): faila=3D  9(D)  failb=3D 21(=
D)  OK
> [    8.399423] raid6test: test_disks(9, 22): faila=3D  9(D)  failb=3D 22(=
D)  OK
> [    8.400814] raid6test: test_disks(9, 23): faila=3D  9(D)  failb=3D 23(=
D)  OK
> [    8.402153] raid6test: test_disks(9, 24): faila=3D  9(D)  failb=3D 24(=
D)  OK
> [    8.403492] raid6test: test_disks(9, 25): faila=3D  9(D)  failb=3D 25(=
D)  OK
> [    8.404821] raid6test: test_disks(9, 26): faila=3D  9(D)  failb=3D 26(=
D)  OK
> [    8.406160] raid6test: test_disks(9, 27): faila=3D  9(D)  failb=3D 27(=
D)  OK
> [    8.407490] raid6test: test_disks(9, 28): faila=3D  9(D)  failb=3D 28(=
D)  OK
> [    8.408770] raid6test: test_disks(9, 29): faila=3D  9(D)  failb=3D 29(=
D)  OK
> [    8.410106] raid6test: test_disks(9, 30): faila=3D  9(D)  failb=3D 30(=
D)  OK
> [    8.411423] raid6test: test_disks(9, 31): faila=3D  9(D)  failb=3D 31(=
D)  OK
> [    8.412754] raid6test: test_disks(9, 32): faila=3D  9(D)  failb=3D 32(=
D)  OK
> [    8.414094] raid6test: test_disks(9, 33): faila=3D  9(D)  failb=3D 33(=
D)  OK
> [    8.415317] raid6test: test_disks(9, 34): faila=3D  9(D)  failb=3D 34(=
D)  OK
> [    8.416636] raid6test: test_disks(9, 35): faila=3D  9(D)  failb=3D 35(=
D)  OK
> [    8.417976] raid6test: test_disks(9, 36): faila=3D  9(D)  failb=3D 36(=
D)  OK
> [    8.419270] raid6test: test_disks(9, 37): faila=3D  9(D)  failb=3D 37(=
D)  OK
> [    8.420602] raid6test: test_disks(9, 38): faila=3D  9(D)  failb=3D 38(=
D)  OK
> [    8.421993] raid6test: test_disks(9, 39): faila=3D  9(D)  failb=3D 39(=
D)  OK
> [    8.423258] raid6test: test_disks(9, 40): faila=3D  9(D)  failb=3D 40(=
D)  OK
> [    8.424590] raid6test: test_disks(9, 41): faila=3D  9(D)  failb=3D 41(=
D)  OK
> [    8.425927] raid6test: test_disks(9, 42): faila=3D  9(D)  failb=3D 42(=
D)  OK
> [    8.427203] raid6test: test_disks(9, 43): faila=3D  9(D)  failb=3D 43(=
D)  OK
> [    8.428536] raid6test: test_disks(9, 44): faila=3D  9(D)  failb=3D 44(=
D)  OK
> [    8.429867] raid6test: test_disks(9, 45): faila=3D  9(D)  failb=3D 45(=
D)  OK
> [    8.431201] raid6test: test_disks(9, 46): faila=3D  9(D)  failb=3D 46(=
D)  OK
> [    8.432534] raid6test: test_disks(9, 47): faila=3D  9(D)  failb=3D 47(=
D)  OK
> [    8.433871] raid6test: test_disks(9, 48): faila=3D  9(D)  failb=3D 48(=
D)  OK
> [    8.435201] raid6test: test_disks(9, 49): faila=3D  9(D)  failb=3D 49(=
D)  OK
> [    8.436529] raid6test: test_disks(9, 50): faila=3D  9(D)  failb=3D 50(=
D)  OK
> [    8.437860] raid6test: test_disks(9, 51): faila=3D  9(D)  failb=3D 51(=
D)  OK
> [    8.439141] raid6test: test_disks(9, 52): faila=3D  9(D)  failb=3D 52(=
D)  OK
> [    8.440394] raid6test: test_disks(9, 53): faila=3D  9(D)  failb=3D 53(=
D)  OK
> [    8.441822] raid6test: test_disks(9, 54): faila=3D  9(D)  failb=3D 54(=
D)  OK
> [    8.443119] raid6test: test_disks(9, 55): faila=3D  9(D)  failb=3D 55(=
D)  OK
> [    8.444312] raid6test: test_disks(9, 56): faila=3D  9(D)  failb=3D 56(=
D)  OK
> [    8.445639] raid6test: test_disks(9, 57): faila=3D  9(D)  failb=3D 57(=
D)  OK
> [    8.446968] raid6test: test_disks(9, 58): faila=3D  9(D)  failb=3D 58(=
D)  OK
> [    8.448291] raid6test: test_disks(9, 59): faila=3D  9(D)  failb=3D 59(=
D)  OK
> [    8.449621] raid6test: test_disks(9, 60): faila=3D  9(D)  failb=3D 60(=
D)  OK
> [    8.451013] raid6test: test_disks(9, 61): faila=3D  9(D)  failb=3D 61(=
D)  OK
> [    8.452303] raid6test: test_disks(9, 62): faila=3D  9(D)  failb=3D 62(=
P)  OK
> [    8.453607] raid6test: test_disks(9, 63): faila=3D  9(D)  failb=3D 63(=
Q)  OK
> [    8.454991] raid6test: test_disks(10, 11): faila=3D 10(D)  failb=3D 11=
(D)  OK
> [    8.456339] raid6test: test_disks(10, 12): faila=3D 10(D)  failb=3D 12=
(D)  OK
> [    8.457680] raid6test: test_disks(10, 13): faila=3D 10(D)  failb=3D 13=
(D)  OK
> [    8.459035] raid6test: test_disks(10, 14): faila=3D 10(D)  failb=3D 14=
(D)  OK
> [    8.460367] raid6test: test_disks(10, 15): faila=3D 10(D)  failb=3D 15=
(D)  OK
> [    8.461774] raid6test: test_disks(10, 16): faila=3D 10(D)  failb=3D 16=
(D)  OK
> [    8.463126] raid6test: test_disks(10, 17): faila=3D 10(D)  failb=3D 17=
(D)  OK
> [    8.464467] raid6test: test_disks(10, 18): faila=3D 10(D)  failb=3D 18=
(D)  OK
> [    8.465804] raid6test: test_disks(10, 19): faila=3D 10(D)  failb=3D 19=
(D)  OK
> [    8.467151] raid6test: test_disks(10, 20): faila=3D 10(D)  failb=3D 20=
(D)  OK
> [    8.468492] raid6test: test_disks(10, 21): faila=3D 10(D)  failb=3D 21=
(D)  OK
> [    8.469837] raid6test: test_disks(10, 22): faila=3D 10(D)  failb=3D 22=
(D)  OK
> [    8.471240] raid6test: test_disks(10, 23): faila=3D 10(D)  failb=3D 23=
(D)  OK
> [    8.472593] raid6test: test_disks(10, 24): faila=3D 10(D)  failb=3D 24=
(D)  OK
> [    8.473946] raid6test: test_disks(10, 25): faila=3D 10(D)  failb=3D 25=
(D)  OK
> [    8.475220] raid6test: test_disks(10, 26): faila=3D 10(D)  failb=3D 26=
(D)  OK
> [    8.476501] raid6test: test_disks(10, 27): faila=3D 10(D)  failb=3D 27=
(D)  OK
> [    8.477845] raid6test: test_disks(10, 28): faila=3D 10(D)  failb=3D 28=
(D)  OK
> [    8.479175] raid6test: test_disks(10, 29): faila=3D 10(D)  failb=3D 29=
(D)  OK
> [    8.480508] raid6test: test_disks(10, 30): faila=3D 10(D)  failb=3D 30=
(D)  OK
> [    8.481939] raid6test: test_disks(10, 31): faila=3D 10(D)  failb=3D 31=
(D)  OK
> [    8.483213] raid6test: test_disks(10, 32): faila=3D 10(D)  failb=3D 32=
(D)  OK
> [    8.484555] raid6test: test_disks(10, 33): faila=3D 10(D)  failb=3D 33=
(D)  OK
> [    8.485873] raid6test: test_disks(10, 34): faila=3D 10(D)  failb=3D 34=
(D)  OK
> [    8.487089] raid6test: test_disks(10, 35): faila=3D 10(D)  failb=3D 35=
(D)  OK
> [    8.488431] raid6test: test_disks(10, 36): faila=3D 10(D)  failb=3D 36=
(D)  OK
> [    8.489775] raid6test: test_disks(10, 37): faila=3D 10(D)  failb=3D 37=
(D)  OK
> [    8.491126] raid6test: test_disks(10, 38): faila=3D 10(D)  failb=3D 38=
(D)  OK
> [    8.492409] raid6test: test_disks(10, 39): faila=3D 10(D)  failb=3D 39=
(D)  OK
> [    8.493751] raid6test: test_disks(10, 40): faila=3D 10(D)  failb=3D 40=
(D)  OK
> [    8.495052] raid6test: test_disks(10, 41): faila=3D 10(D)  failb=3D 41=
(D)  OK
> [    8.496283] raid6test: test_disks(10, 42): faila=3D 10(D)  failb=3D 42=
(D)  OK
> [    8.497621] raid6test: test_disks(10, 43): faila=3D 10(D)  failb=3D 43=
(D)  OK
> [    8.498934] raid6test: test_disks(10, 44): faila=3D 10(D)  failb=3D 44=
(D)  OK
> [    8.500295] raid6test: test_disks(10, 45): faila=3D 10(D)  failb=3D 45=
(D)  OK
> [    8.501703] raid6test: test_disks(10, 46): faila=3D 10(D)  failb=3D 46=
(D)  OK
> [    8.503014] raid6test: test_disks(10, 47): faila=3D 10(D)  failb=3D 47=
(D)  OK
> [    8.504278] raid6test: test_disks(10, 48): faila=3D 10(D)  failb=3D 48=
(D)  OK
> [    8.505621] raid6test: test_disks(10, 49): faila=3D 10(D)  failb=3D 49=
(D)  OK
> [    8.506964] raid6test: test_disks(10, 50): faila=3D 10(D)  failb=3D 50=
(D)  OK
> [    8.508311] raid6test: test_disks(10, 51): faila=3D 10(D)  failb=3D 51=
(D)  OK
> [    8.509642] raid6test: test_disks(10, 52): faila=3D 10(D)  failb=3D 52=
(D)  OK
> [    8.511065] raid6test: test_disks(10, 53): faila=3D 10(D)  failb=3D 53=
(D)  OK
> [    8.512409] raid6test: test_disks(10, 54): faila=3D 10(D)  failb=3D 54=
(D)  OK
> [    8.513751] raid6test: test_disks(10, 55): faila=3D 10(D)  failb=3D 55=
(D)  OK
> [    8.515120] raid6test: test_disks(10, 56): faila=3D 10(D)  failb=3D 56=
(D)  OK
> [    8.516470] raid6test: test_disks(10, 57): faila=3D 10(D)  failb=3D 57=
(D)  OK
> [    8.517815] raid6test: test_disks(10, 58): faila=3D 10(D)  failb=3D 58=
(D)  OK
> [    8.519166] raid6test: test_disks(10, 59): faila=3D 10(D)  failb=3D 59=
(D)  OK
> [    8.520510] raid6test: test_disks(10, 60): faila=3D 10(D)  failb=3D 60=
(D)  OK
> [    8.521927] raid6test: test_disks(10, 61): faila=3D 10(D)  failb=3D 61=
(D)  OK
> [    8.523278] raid6test: test_disks(10, 62): faila=3D 10(D)  failb=3D 62=
(P)  OK
> [    8.524617] raid6test: test_disks(10, 63): faila=3D 10(D)  failb=3D 63=
(Q)  OK
> [    8.525833] raid6test: test_disks(11, 12): faila=3D 11(D)  failb=3D 12=
(D)  OK
> [    8.527181] raid6test: test_disks(11, 13): faila=3D 11(D)  failb=3D 13=
(D)  OK
> [    8.528522] raid6test: test_disks(11, 14): faila=3D 11(D)  failb=3D 14=
(D)  OK
> [    8.529880] raid6test: test_disks(11, 15): faila=3D 11(D)  failb=3D 15=
(D)  OK
> [    8.531287] raid6test: test_disks(11, 16): faila=3D 11(D)  failb=3D 16=
(D)  OK
> [    8.532635] raid6test: test_disks(11, 17): faila=3D 11(D)  failb=3D 17=
(D)  OK
> [    8.533979] raid6test: test_disks(11, 18): faila=3D 11(D)  failb=3D 18=
(D)  OK
> [    8.535252] raid6test: test_disks(11, 19): faila=3D 11(D)  failb=3D 19=
(D)  OK
> [    8.536544] raid6test: test_disks(11, 20): faila=3D 11(D)  failb=3D 20=
(D)  OK
> [    8.537893] raid6test: test_disks(11, 21): faila=3D 11(D)  failb=3D 21=
(D)  OK
> [    8.539187] raid6test: test_disks(11, 22): faila=3D 11(D)  failb=3D 22=
(D)  OK
> [    8.540531] raid6test: test_disks(11, 23): faila=3D 11(D)  failb=3D 23=
(D)  OK
> [    8.541942] raid6test: test_disks(11, 24): faila=3D 11(D)  failb=3D 24=
(D)  OK
> [    8.543203] raid6test: test_disks(11, 25): faila=3D 11(D)  failb=3D 25=
(D)  OK
> [    8.544432] raid6test: test_disks(11, 26): faila=3D 11(D)  failb=3D 26=
(D)  OK
> [    8.545708] raid6test: test_disks(11, 27): faila=3D 11(D)  failb=3D 27=
(D)  OK
> [    8.547050] raid6test: test_disks(11, 28): faila=3D 11(D)  failb=3D 28=
(D)  OK
> [    8.548391] raid6test: test_disks(11, 29): faila=3D 11(D)  failb=3D 29=
(D)  OK
> [    8.549728] raid6test: test_disks(11, 30): faila=3D 11(D)  failb=3D 30=
(D)  OK
> [    8.551080] raid6test: test_disks(11, 31): faila=3D 11(D)  failb=3D 31=
(D)  OK
> [    8.552336] raid6test: test_disks(11, 32): faila=3D 11(D)  failb=3D 32=
(D)  OK
> [    8.553674] raid6test: test_disks(11, 33): faila=3D 11(D)  failb=3D 33=
(D)  OK
> [    8.555011] raid6test: test_disks(11, 34): faila=3D 11(D)  failb=3D 34=
(D)  OK
> [    8.556357] raid6test: test_disks(11, 35): faila=3D 11(D)  failb=3D 35=
(D)  OK
> [    8.557694] raid6test: test_disks(11, 36): faila=3D 11(D)  failb=3D 36=
(D)  OK
> [    8.559018] raid6test: test_disks(11, 37): faila=3D 11(D)  failb=3D 37=
(D)  OK
> [    8.560259] raid6test: test_disks(11, 38): faila=3D 11(D)  failb=3D 38=
(D)  OK
> [    8.561664] raid6test: test_disks(11, 39): faila=3D 11(D)  failb=3D 39=
(D)  OK
> [    8.562973] raid6test: test_disks(11, 40): faila=3D 11(D)  failb=3D 40=
(D)  OK
> [    8.564240] raid6test: test_disks(11, 41): faila=3D 11(D)  failb=3D 41=
(D)  OK
> [    8.565580] raid6test: test_disks(11, 42): faila=3D 11(D)  failb=3D 42=
(D)  OK
> [    8.566918] raid6test: test_disks(11, 43): faila=3D 11(D)  failb=3D 43=
(D)  OK
> [    8.568247] raid6test: test_disks(11, 44): faila=3D 11(D)  failb=3D 44=
(D)  OK
> [    8.569588] raid6test: test_disks(11, 45): faila=3D 11(D)  failb=3D 45=
(D)  OK
> [    8.571012] raid6test: test_disks(11, 46): faila=3D 11(D)  failb=3D 46=
(D)  OK
> [    8.572356] raid6test: test_disks(11, 47): faila=3D 11(D)  failb=3D 47=
(D)  OK
> [    8.573691] raid6test: test_disks(11, 48): faila=3D 11(D)  failb=3D 48=
(D)  OK
> [    8.575030] raid6test: test_disks(11, 49): faila=3D 11(D)  failb=3D 49=
(D)  OK
> [    8.576369] raid6test: test_disks(11, 50): faila=3D 11(D)  failb=3D 50=
(D)  OK
> [    8.577710] raid6test: test_disks(11, 51): faila=3D 11(D)  failb=3D 51=
(D)  OK
> [    8.579060] raid6test: test_disks(11, 52): faila=3D 11(D)  failb=3D 52=
(D)  OK
> [    8.580409] raid6test: test_disks(11, 53): faila=3D 11(D)  failb=3D 53=
(D)  OK
> [    8.581806] raid6test: test_disks(11, 54): faila=3D 11(D)  failb=3D 54=
(D)  OK
> [    8.583092] raid6test: test_disks(11, 55): faila=3D 11(D)  failb=3D 55=
(D)  OK
> [    8.584391] raid6test: test_disks(11, 56): faila=3D 11(D)  failb=3D 56=
(D)  OK
> [    8.585736] raid6test: test_disks(11, 57): faila=3D 11(D)  failb=3D 57=
(D)  OK
> [    8.587036] raid6test: test_disks(11, 58): faila=3D 11(D)  failb=3D 58=
(D)  OK
> [    8.588268] raid6test: test_disks(11, 59): faila=3D 11(D)  failb=3D 59=
(D)  OK
> [    8.589611] raid6test: test_disks(11, 60): faila=3D 11(D)  failb=3D 60=
(D)  OK
> [    8.590989] raid6test: test_disks(11, 61): faila=3D 11(D)  failb=3D 61=
(D)  OK
> [    8.592319] raid6test: test_disks(11, 62): faila=3D 11(D)  failb=3D 62=
(P)  OK
> [    8.593668] raid6test: test_disks(11, 63): faila=3D 11(D)  failb=3D 63=
(Q)  OK
> [    8.594973] raid6test: test_disks(12, 13): faila=3D 12(D)  failb=3D 13=
(D)  OK
> [    8.596313] raid6test: test_disks(12, 14): faila=3D 12(D)  failb=3D 14=
(D)  OK
> [    8.597656] raid6test: test_disks(12, 15): faila=3D 12(D)  failb=3D 15=
(D)  OK
> [    8.598960] raid6test: test_disks(12, 16): faila=3D 12(D)  failb=3D 16=
(D)  OK
> [    8.600241] raid6test: test_disks(12, 17): faila=3D 12(D)  failb=3D 17=
(D)  OK
> [    8.602280] raid6test: test_disks(12, 18): faila=3D 12(D)  failb=3D 18=
(D)  OK
> [    8.603540] raid6test: test_disks(12, 19): faila=3D 12(D)  failb=3D 19=
(D)  OK
> [    8.604891] raid6test: test_disks(12, 20): faila=3D 12(D)  failb=3D 20=
(D)  OK
> [    8.606240] raid6test: test_disks(12, 21): faila=3D 12(D)  failb=3D 21=
(D)  OK
> [    8.607525] raid6test: test_disks(12, 22): faila=3D 12(D)  failb=3D 22=
(D)  OK
> [    8.608874] raid6test: test_disks(12, 23): faila=3D 12(D)  failb=3D 23=
(D)  OK
> [    8.610211] raid6test: test_disks(12, 24): faila=3D 12(D)  failb=3D 24=
(D)  OK
> [    8.611482] raid6test: test_disks(12, 25): faila=3D 12(D)  failb=3D 25=
(D)  OK
> [    8.612820] raid6test: test_disks(12, 26): faila=3D 12(D)  failb=3D 26=
(D)  OK
> [    8.614169] raid6test: test_disks(12, 27): faila=3D 12(D)  failb=3D 27=
(D)  OK
> [    8.615408] raid6test: test_disks(12, 28): faila=3D 12(D)  failb=3D 28=
(D)  OK
> [    8.616711] raid6test: test_disks(12, 29): faila=3D 12(D)  failb=3D 29=
(D)  OK
> [    8.618058] raid6test: test_disks(12, 30): faila=3D 12(D)  failb=3D 30=
(D)  OK
> [    8.619313] raid6test: test_disks(12, 31): faila=3D 12(D)  failb=3D 31=
(D)  OK
> [    8.620624] raid6test: test_disks(12, 32): faila=3D 12(D)  failb=3D 32=
(D)  OK
> [    8.621937] raid6test: test_disks(12, 33): faila=3D 12(D)  failb=3D 33=
(D)  OK
> [    8.623202] raid6test: test_disks(12, 34): faila=3D 12(D)  failb=3D 34=
(D)  OK
> [    8.624493] raid6test: test_disks(12, 35): faila=3D 12(D)  failb=3D 35=
(D)  OK
> [    8.625839] raid6test: test_disks(12, 36): faila=3D 12(D)  failb=3D 36=
(D)  OK
> [    8.627187] raid6test: test_disks(12, 37): faila=3D 12(D)  failb=3D 37=
(D)  OK
> [    8.628531] raid6test: test_disks(12, 38): faila=3D 12(D)  failb=3D 38=
(D)  OK
> [    8.629877] raid6test: test_disks(12, 39): faila=3D 12(D)  failb=3D 39=
(D)  OK
> [    8.631298] raid6test: test_disks(12, 40): faila=3D 12(D)  failb=3D 40=
(D)  OK
> [    8.632638] raid6test: test_disks(12, 41): faila=3D 12(D)  failb=3D 41=
(D)  OK
> [    8.633986] raid6test: test_disks(12, 42): faila=3D 12(D)  failb=3D 42=
(D)  OK
> [    8.635330] raid6test: test_disks(12, 43): faila=3D 12(D)  failb=3D 43=
(D)  OK
> [    8.636581] raid6test: test_disks(12, 44): faila=3D 12(D)  failb=3D 44=
(D)  OK
> [    8.637763] raid6test: test_disks(12, 45): faila=3D 12(D)  failb=3D 45=
(D)  OK
> [    8.638987] raid6test: test_disks(12, 46): faila=3D 12(D)  failb=3D 46=
(D)  OK
> [    8.640336] raid6test: test_disks(12, 47): faila=3D 12(D)  failb=3D 47=
(D)  OK
> [    8.641797] raid6test: test_disks(12, 48): faila=3D 12(D)  failb=3D 48=
(D)  OK
> [    8.643087] raid6test: test_disks(12, 49): faila=3D 12(D)  failb=3D 49=
(D)  OK
> [    8.644332] raid6test: test_disks(12, 50): faila=3D 12(D)  failb=3D 50=
(D)  OK
> [    8.645671] raid6test: test_disks(12, 51): faila=3D 12(D)  failb=3D 51=
(D)  OK
> [    8.646989] raid6test: test_disks(12, 52): faila=3D 12(D)  failb=3D 52=
(D)  OK
> [    8.648330] raid6test: test_disks(12, 53): faila=3D 12(D)  failb=3D 53=
(D)  OK
> [    8.649675] raid6test: test_disks(12, 54): faila=3D 12(D)  failb=3D 54=
(D)  OK
> [    8.651096] raid6test: test_disks(12, 55): faila=3D 12(D)  failb=3D 55=
(D)  OK
> [    8.652438] raid6test: test_disks(12, 56): faila=3D 12(D)  failb=3D 56=
(D)  OK
> [    8.653781] raid6test: test_disks(12, 57): faila=3D 12(D)  failb=3D 57=
(D)  OK
> [    8.655135] raid6test: test_disks(12, 58): faila=3D 12(D)  failb=3D 58=
(D)  OK
> [    8.656476] raid6test: test_disks(12, 59): faila=3D 12(D)  failb=3D 59=
(D)  OK
> [    8.657823] raid6test: test_disks(12, 60): faila=3D 12(D)  failb=3D 60=
(D)  OK
> [    8.659174] raid6test: test_disks(12, 61): faila=3D 12(D)  failb=3D 61=
(D)  OK
> [    8.660513] raid6test: test_disks(12, 62): faila=3D 12(D)  failb=3D 62=
(P)  OK
> [    8.661911] raid6test: test_disks(12, 63): faila=3D 12(D)  failb=3D 63=
(Q)  OK
> [    8.663251] raid6test: test_disks(13, 14): faila=3D 13(D)  failb=3D 14=
(D)  OK
> [    8.664592] raid6test: test_disks(13, 15): faila=3D 13(D)  failb=3D 15=
(D)  OK
> [    8.665826] raid6test: test_disks(13, 16): faila=3D 13(D)  failb=3D 16=
(D)  OK
> [    8.667101] raid6test: test_disks(13, 17): faila=3D 13(D)  failb=3D 17=
(D)  OK
> [    8.668442] raid6test: test_disks(13, 18): faila=3D 13(D)  failb=3D 18=
(D)  OK
> [    8.669780] raid6test: test_disks(13, 19): faila=3D 13(D)  failb=3D 19=
(D)  OK
> [    8.671182] raid6test: test_disks(13, 20): faila=3D 13(D)  failb=3D 20=
(D)  OK
> [    8.672527] raid6test: test_disks(13, 21): faila=3D 13(D)  failb=3D 21=
(D)  OK
> [    8.673872] raid6test: test_disks(13, 22): faila=3D 13(D)  failb=3D 22=
(D)  OK
> [    8.675217] raid6test: test_disks(13, 23): faila=3D 13(D)  failb=3D 23=
(D)  OK
> [    8.676557] raid6test: test_disks(13, 24): faila=3D 13(D)  failb=3D 24=
(D)  OK
> [    8.677905] raid6test: test_disks(13, 25): faila=3D 13(D)  failb=3D 25=
(D)  OK
> [    8.679248] raid6test: test_disks(13, 26): faila=3D 13(D)  failb=3D 26=
(D)  OK
> [    8.680596] raid6test: test_disks(13, 27): faila=3D 13(D)  failb=3D 27=
(D)  OK
> [    8.682005] raid6test: test_disks(13, 28): faila=3D 13(D)  failb=3D 28=
(D)  OK
> [    8.683353] raid6test: test_disks(13, 29): faila=3D 13(D)  failb=3D 29=
(D)  OK
> [    8.684697] raid6test: test_disks(13, 30): faila=3D 13(D)  failb=3D 30=
(D)  OK
> [    8.686043] raid6test: test_disks(13, 31): faila=3D 13(D)  failb=3D 31=
(D)  OK
> [    8.687394] raid6test: test_disks(13, 32): faila=3D 13(D)  failb=3D 32=
(D)  OK
> [    8.688736] raid6test: test_disks(13, 33): faila=3D 13(D)  failb=3D 33=
(D)  OK
> [    8.690088] raid6test: test_disks(13, 34): faila=3D 13(D)  failb=3D 34=
(D)  OK
> [    8.706361] raid6test: test_disks(13, 35): faila=3D 13(D)  failb=3D 35=
(D)  OK
> [    8.707717] raid6test: test_disks(13, 36): faila=3D 13(D)  failb=3D 36=
(D)  OK
> [    8.709061] raid6test: test_disks(13, 37): faila=3D 13(D)  failb=3D 37=
(D)  OK
> [    8.710468] raid6test: test_disks(13, 38): faila=3D 13(D)  failb=3D 38=
(D)  OK
> [    8.711804] raid6test: test_disks(13, 39): faila=3D 13(D)  failb=3D 39=
(D)  OK
> [    8.713152] raid6test: test_disks(13, 40): faila=3D 13(D)  failb=3D 40=
(D)  OK
> [    8.714491] raid6test: test_disks(13, 41): faila=3D 13(D)  failb=3D 41=
(D)  OK
> [    8.715836] raid6test: test_disks(13, 42): faila=3D 13(D)  failb=3D 42=
(D)  OK
> [    8.717187] raid6test: test_disks(13, 43): faila=3D 13(D)  failb=3D 43=
(D)  OK
> [    8.718525] raid6test: test_disks(13, 44): faila=3D 13(D)  failb=3D 44=
(D)  OK
> [    8.719873] raid6test: test_disks(13, 45): faila=3D 13(D)  failb=3D 45=
(D)  OK
> [    8.734309] raid6test: test_disks(13, 46): faila=3D 13(D)  failb=3D 46=
(D)  OK
> [    8.735541] raid6test: test_disks(13, 47): faila=3D 13(D)  failb=3D 47=
(D)  OK
> [    8.736895] raid6test: test_disks(13, 48): faila=3D 13(D)  failb=3D 48=
(D)  OK
> [    8.738234] raid6test: test_disks(13, 49): faila=3D 13(D)  failb=3D 49=
(D)  OK
> [    8.739488] raid6test: test_disks(13, 50): faila=3D 13(D)  failb=3D 50=
(D)  OK
> [    8.740889] raid6test: test_disks(13, 51): faila=3D 13(D)  failb=3D 51=
(D)  OK
> [    8.742240] raid6test: test_disks(13, 52): faila=3D 13(D)  failb=3D 52=
(D)  OK
> [    8.743559] raid6test: test_disks(13, 53): faila=3D 13(D)  failb=3D 53=
(D)  OK
> [    8.744957] raid6test: test_disks(13, 54): faila=3D 13(D)  failb=3D 54=
(D)  OK
> [    8.746322] raid6test: test_disks(13, 55): faila=3D 13(D)  failb=3D 55=
(D)  OK
> [    8.747722] raid6test: test_disks(13, 56): faila=3D 13(D)  failb=3D 56=
(D)  OK
> [    8.749127] raid6test: test_disks(13, 57): faila=3D 13(D)  failb=3D 57=
(D)  OK
> [    8.750508] raid6test: test_disks(13, 58): faila=3D 13(D)  failb=3D 58=
(D)  OK
> [    8.751998] raid6test: test_disks(13, 59): faila=3D 13(D)  failb=3D 59=
(D)  OK
> [    8.753349] raid6test: test_disks(13, 60): faila=3D 13(D)  failb=3D 60=
(D)  OK
> [    8.754750] raid6test: test_disks(13, 61): faila=3D 13(D)  failb=3D 61=
(D)  OK
> [    8.756132] raid6test: test_disks(13, 62): faila=3D 13(D)  failb=3D 62=
(P)  OK
> [    8.757362] raid6test: test_disks(13, 63): faila=3D 13(D)  failb=3D 63=
(Q)  OK
> [    8.758587] raid6test: test_disks(14, 15): faila=3D 14(D)  failb=3D 15=
(D)  OK
> [    8.759793] raid6test: test_disks(14, 16): faila=3D 14(D)  failb=3D 16=
(D)  OK
> [    8.761174] raid6test: test_disks(14, 17): faila=3D 14(D)  failb=3D 17=
(D)  OK
> [    8.762513] raid6test: test_disks(14, 18): faila=3D 14(D)  failb=3D 18=
(D)  OK
> [    8.763864] raid6test: test_disks(14, 19): faila=3D 14(D)  failb=3D 19=
(D)  OK
> [    8.765207] raid6test: test_disks(14, 20): faila=3D 14(D)  failb=3D 20=
(D)  OK
> [    8.766551] raid6test: test_disks(14, 21): faila=3D 14(D)  failb=3D 21=
(D)  OK
> [    8.767814] raid6test: test_disks(14, 22): faila=3D 14(D)  failb=3D 22=
(D)  OK
> [    8.769116] raid6test: test_disks(14, 23): faila=3D 14(D)  failb=3D 23=
(D)  OK
> [    8.770465] raid6test: test_disks(14, 24): faila=3D 14(D)  failb=3D 24=
(D)  OK
> [    8.771929] raid6test: test_disks(14, 25): faila=3D 14(D)  failb=3D 25=
(D)  OK
> [    8.773336] raid6test: test_disks(14, 26): faila=3D 14(D)  failb=3D 26=
(D)  OK
> [    8.774767] raid6test: test_disks(14, 27): faila=3D 14(D)  failb=3D 27=
(D)  OK
> [    8.776147] raid6test: test_disks(14, 28): faila=3D 14(D)  failb=3D 28=
(D)  OK
> [    8.777543] raid6test: test_disks(14, 29): faila=3D 14(D)  failb=3D 29=
(D)  OK
> [    8.778924] raid6test: test_disks(14, 30): faila=3D 14(D)  failb=3D 30=
(D)  OK
> [    8.780234] raid6test: test_disks(14, 31): faila=3D 14(D)  failb=3D 31=
(D)  OK
> [    8.781660] raid6test: test_disks(14, 32): faila=3D 14(D)  failb=3D 32=
(D)  OK
> [    8.782861] raid6test: test_disks(14, 33): faila=3D 14(D)  failb=3D 33=
(D)  OK
> [    8.784084] raid6test: test_disks(14, 34): faila=3D 14(D)  failb=3D 34=
(D)  OK
> [    8.785307] raid6test: test_disks(14, 35): faila=3D 14(D)  failb=3D 35=
(D)  OK
> [    8.786568] raid6test: test_disks(14, 36): faila=3D 14(D)  failb=3D 36=
(D)  OK
> [    8.787764] raid6test: test_disks(14, 37): faila=3D 14(D)  failb=3D 37=
(D)  OK
> [    8.788994] raid6test: test_disks(14, 38): faila=3D 14(D)  failb=3D 38=
(D)  OK
> [    8.790238] raid6test: test_disks(14, 39): faila=3D 14(D)  failb=3D 39=
(D)  OK
> [    8.791627] raid6test: test_disks(14, 40): faila=3D 14(D)  failb=3D 40=
(D)  OK
> [    8.792978] raid6test: test_disks(14, 41): faila=3D 14(D)  failb=3D 41=
(D)  OK
> [    8.794318] raid6test: test_disks(14, 42): faila=3D 14(D)  failb=3D 42=
(D)  OK
> [    8.795621] raid6test: test_disks(14, 43): faila=3D 14(D)  failb=3D 43=
(D)  OK
> [    8.797002] raid6test: test_disks(14, 44): faila=3D 14(D)  failb=3D 44=
(D)  OK
> [    8.798383] raid6test: test_disks(14, 45): faila=3D 14(D)  failb=3D 45=
(D)  OK
> [    8.799771] raid6test: test_disks(14, 46): faila=3D 14(D)  failb=3D 46=
(D)  OK
> [    8.801224] raid6test: test_disks(14, 47): faila=3D 14(D)  failb=3D 47=
(D)  OK
> [    8.802570] raid6test: test_disks(14, 48): faila=3D 14(D)  failb=3D 48=
(D)  OK
> [    8.803941] raid6test: test_disks(14, 49): faila=3D 14(D)  failb=3D 49=
(D)  OK
> [    8.805320] raid6test: test_disks(14, 50): faila=3D 14(D)  failb=3D 50=
(D)  OK
> [    8.806704] raid6test: test_disks(14, 51): faila=3D 14(D)  failb=3D 51=
(D)  OK
> [    8.808099] raid6test: test_disks(14, 52): faila=3D 14(D)  failb=3D 52=
(D)  OK
> [    8.809434] raid6test: test_disks(14, 53): faila=3D 14(D)  failb=3D 53=
(D)  OK
> [    8.810858] raid6test: test_disks(14, 54): faila=3D 14(D)  failb=3D 54=
(D)  OK
> [    8.812198] raid6test: test_disks(14, 55): faila=3D 14(D)  failb=3D 55=
(D)  OK
> [    8.813539] raid6test: test_disks(14, 56): faila=3D 14(D)  failb=3D 56=
(D)  OK
> [    8.814887] raid6test: test_disks(14, 57): faila=3D 14(D)  failb=3D 57=
(D)  OK
> [    8.816225] raid6test: test_disks(14, 58): faila=3D 14(D)  failb=3D 58=
(D)  OK
> [    8.817565] raid6test: test_disks(14, 59): faila=3D 14(D)  failb=3D 59=
(D)  OK
> [    8.818887] raid6test: test_disks(14, 60): faila=3D 14(D)  failb=3D 60=
(D)  OK
> [    8.820210] raid6test: test_disks(14, 61): faila=3D 14(D)  failb=3D 61=
(D)  OK
> [    8.821591] raid6test: test_disks(14, 62): faila=3D 14(D)  failb=3D 62=
(P)  OK
> [    8.823016] raid6test: test_disks(14, 63): faila=3D 14(D)  failb=3D 63=
(Q)  OK
> [    8.824357] raid6test: test_disks(15, 16): faila=3D 15(D)  failb=3D 16=
(D)  OK
> [    8.825683] raid6test: test_disks(15, 17): faila=3D 15(D)  failb=3D 17=
(D)  OK
> [    8.826977] raid6test: test_disks(15, 18): faila=3D 15(D)  failb=3D 18=
(D)  OK
> [    8.828232] raid6test: test_disks(15, 19): faila=3D 15(D)  failb=3D 19=
(D)  OK
> [    8.829570] raid6test: test_disks(15, 20): faila=3D 15(D)  failb=3D 20=
(D)  OK
> [    8.830953] raid6test: test_disks(15, 21): faila=3D 15(D)  failb=3D 21=
(D)  OK
> [    8.832216] raid6test: test_disks(15, 22): faila=3D 15(D)  failb=3D 22=
(D)  OK
> [    8.833552] raid6test: test_disks(15, 23): faila=3D 15(D)  failb=3D 23=
(D)  OK
> [    8.834867] raid6test: test_disks(15, 24): faila=3D 15(D)  failb=3D 24=
(D)  OK
> [    8.836001] raid6test: test_disks(15, 25): faila=3D 15(D)  failb=3D 25=
(D)  OK
> [    8.837309] raid6test: test_disks(15, 26): faila=3D 15(D)  failb=3D 26=
(D)  OK
> [    8.838686] raid6test: test_disks(15, 27): faila=3D 15(D)  failb=3D 27=
(D)  OK
> [    8.840010] raid6test: test_disks(15, 28): faila=3D 15(D)  failb=3D 28=
(D)  OK
> [    8.841483] raid6test: test_disks(15, 29): faila=3D 15(D)  failb=3D 29=
(D)  OK
> [    8.842826] raid6test: test_disks(15, 30): faila=3D 15(D)  failb=3D 30=
(D)  OK
> [    8.844214] raid6test: test_disks(15, 31): faila=3D 15(D)  failb=3D 31=
(D)  OK
> [    8.845566] raid6test: test_disks(15, 32): faila=3D 15(D)  failb=3D 32=
(D)  OK
> [    8.846964] raid6test: test_disks(15, 33): faila=3D 15(D)  failb=3D 33=
(D)  OK
> [    8.848354] raid6test: test_disks(15, 34): faila=3D 15(D)  failb=3D 34=
(D)  OK
> [    8.849704] raid6test: test_disks(15, 35): faila=3D 15(D)  failb=3D 35=
(D)  OK
> [    8.851189] raid6test: test_disks(15, 36): faila=3D 15(D)  failb=3D 36=
(D)  OK
> [    8.852598] raid6test: test_disks(15, 37): faila=3D 15(D)  failb=3D 37=
(D)  OK
> [    8.853991] raid6test: test_disks(15, 38): faila=3D 15(D)  failb=3D 38=
(D)  OK
> [    8.855354] raid6test: test_disks(15, 39): faila=3D 15(D)  failb=3D 39=
(D)  OK
> [    8.856708] raid6test: test_disks(15, 40): faila=3D 15(D)  failb=3D 40=
(D)  OK
> [    8.858100] raid6test: test_disks(15, 41): faila=3D 15(D)  failb=3D 41=
(D)  OK
> [    8.859403] raid6test: test_disks(15, 42): faila=3D 15(D)  failb=3D 42=
(D)  OK
> [    8.860735] raid6test: test_disks(15, 43): faila=3D 15(D)  failb=3D 43=
(D)  OK
> [    8.862154] raid6test: test_disks(15, 44): faila=3D 15(D)  failb=3D 44=
(D)  OK
> [    8.863443] raid6test: test_disks(15, 45): faila=3D 15(D)  failb=3D 45=
(D)  OK
> [    8.864784] raid6test: test_disks(15, 46): faila=3D 15(D)  failb=3D 46=
(D)  OK
> [    8.866130] raid6test: test_disks(15, 47): faila=3D 15(D)  failb=3D 47=
(D)  OK
> [    8.867431] raid6test: test_disks(15, 48): faila=3D 15(D)  failb=3D 48=
(D)  OK
> [    8.868773] raid6test: test_disks(15, 49): faila=3D 15(D)  failb=3D 49=
(D)  OK
> [    8.870117] raid6test: test_disks(15, 50): faila=3D 15(D)  failb=3D 50=
(D)  OK
> [    8.884337] raid6test: test_disks(15, 51): faila=3D 15(D)  failb=3D 51=
(D)  OK
> [    8.885703] raid6test: test_disks(15, 52): faila=3D 15(D)  failb=3D 52=
(D)  OK
> [    8.887057] raid6test: test_disks(15, 53): faila=3D 15(D)  failb=3D 53=
(D)  OK
> [    8.888398] raid6test: test_disks(15, 54): faila=3D 15(D)  failb=3D 54=
(D)  OK
> [    8.889735] raid6test: test_disks(15, 55): faila=3D 15(D)  failb=3D 55=
(D)  OK
> [    8.891128] raid6test: test_disks(15, 56): faila=3D 15(D)  failb=3D 56=
(D)  OK
> [    8.892480] raid6test: test_disks(15, 57): faila=3D 15(D)  failb=3D 57=
(D)  OK
> [    8.893823] raid6test: test_disks(15, 58): faila=3D 15(D)  failb=3D 58=
(D)  OK
> [    8.895106] raid6test: test_disks(15, 59): faila=3D 15(D)  failb=3D 59=
(D)  OK
> [    8.896425] raid6test: test_disks(15, 60): faila=3D 15(D)  failb=3D 60=
(D)  OK
> [    8.897764] raid6test: test_disks(15, 61): faila=3D 15(D)  failb=3D 61=
(D)  OK
> [    8.899073] raid6test: test_disks(15, 62): faila=3D 15(D)  failb=3D 62=
(P)  OK
> [    8.900389] raid6test: test_disks(15, 63): faila=3D 15(D)  failb=3D 63=
(Q)  OK
> [    8.914313] raid6test: test_disks(16, 17): faila=3D 16(D)  failb=3D 17=
(D)  OK
> [    8.915657] raid6test: test_disks(16, 18): faila=3D 16(D)  failb=3D 18=
(D)  OK
> [    8.917006] raid6test: test_disks(16, 19): faila=3D 16(D)  failb=3D 19=
(D)  OK
> [    8.918356] raid6test: test_disks(16, 20): faila=3D 16(D)  failb=3D 20=
(D)  OK
> [    8.919657] raid6test: test_disks(16, 21): faila=3D 16(D)  failb=3D 21=
(D)  OK
> [    8.921072] raid6test: test_disks(16, 22): faila=3D 16(D)  failb=3D 22=
(D)  OK
> [    8.922423] raid6test: test_disks(16, 23): faila=3D 16(D)  failb=3D 23=
(D)  OK
> [    8.923626] raid6test: test_disks(16, 24): faila=3D 16(D)  failb=3D 24=
(D)  OK
> [    8.932345] raid6test: test_disks(16, 25): faila=3D 16(D)  failb=3D 25=
(D)  OK
> [    8.933751] raid6test: test_disks(16, 26): faila=3D 16(D)  failb=3D 26=
(D)  OK
> [    8.935128] raid6test: test_disks(16, 27): faila=3D 16(D)  failb=3D 27=
(D)  OK
> [    8.936533] raid6test: test_disks(16, 28): faila=3D 16(D)  failb=3D 28=
(D)  OK
> [    8.937991] raid6test: test_disks(16, 29): faila=3D 16(D)  failb=3D 29=
(D)  OK
> [    8.939524] raid6test: test_disks(16, 30): faila=3D 16(D)  failb=3D 30=
(D)  OK
> [    8.940975] raid6test: test_disks(16, 31): faila=3D 16(D)  failb=3D 31=
(D)  OK
> [    8.942341] raid6test: test_disks(16, 32): faila=3D 16(D)  failb=3D 32=
(D)  OK
> [    8.943668] raid6test: test_disks(16, 33): faila=3D 16(D)  failb=3D 33=
(D)  OK
> [    8.958111] raid6test: test_disks(16, 34): faila=3D 16(D)  failb=3D 34=
(D)  OK
> [    8.959500] raid6test: test_disks(16, 35): faila=3D 16(D)  failb=3D 35=
(D)  OK
> [    8.960881] raid6test: test_disks(16, 36): faila=3D 16(D)  failb=3D 36=
(D)  OK
> [    8.962257] raid6test: test_disks(16, 37): faila=3D 16(D)  failb=3D 37=
(D)  OK
> [    8.963655] raid6test: test_disks(16, 38): faila=3D 16(D)  failb=3D 38=
(D)  OK
> [    8.965002] raid6test: test_disks(16, 39): faila=3D 16(D)  failb=3D 39=
(D)  OK
> [    8.966393] raid6test: test_disks(16, 40): faila=3D 16(D)  failb=3D 40=
(D)  OK
> [    8.967770] raid6test: test_disks(16, 41): faila=3D 16(D)  failb=3D 41=
(D)  OK
> [    8.969089] raid6test: test_disks(16, 42): faila=3D 16(D)  failb=3D 42=
(D)  OK
> [    8.970424] raid6test: test_disks(16, 43): faila=3D 16(D)  failb=3D 43=
(D)  OK
> [    8.984923] raid6test: test_disks(16, 44): faila=3D 16(D)  failb=3D 44=
(D)  OK
> [    8.986250] raid6test: test_disks(16, 45): faila=3D 16(D)  failb=3D 45=
(D)  OK
> [    8.987622] raid6test: test_disks(16, 46): faila=3D 16(D)  failb=3D 46=
(D)  OK
> [    8.988987] raid6test: test_disks(16, 47): faila=3D 16(D)  failb=3D 47=
(D)  OK
> [    8.990318] raid6test: test_disks(16, 48): faila=3D 16(D)  failb=3D 48=
(D)  OK
> [    8.991717] raid6test: test_disks(16, 49): faila=3D 16(D)  failb=3D 49=
(D)  OK
> [    8.993138] raid6test: test_disks(16, 50): faila=3D 16(D)  failb=3D 50=
(D)  OK
> [    8.994548] raid6test: test_disks(16, 51): faila=3D 16(D)  failb=3D 51=
(D)  OK
> [    8.995960] raid6test: test_disks(16, 52): faila=3D 16(D)  failb=3D 52=
(D)  OK
> [    9.010455] raid6test: test_disks(16, 53): faila=3D 16(D)  failb=3D 53=
(D)  OK
> [    9.011860] raid6test: test_disks(16, 54): faila=3D 16(D)  failb=3D 54=
(D)  OK
> [    9.013249] raid6test: test_disks(16, 55): faila=3D 16(D)  failb=3D 55=
(D)  OK
> [    9.014621] raid6test: test_disks(16, 56): faila=3D 16(D)  failb=3D 56=
(D)  OK
> [    9.015948] raid6test: test_disks(16, 57): faila=3D 16(D)  failb=3D 57=
(D)  OK
> [    9.017311] raid6test: test_disks(16, 58): faila=3D 16(D)  failb=3D 58=
(D)  OK
> [    9.018708] raid6test: test_disks(16, 59): faila=3D 16(D)  failb=3D 59=
(D)  OK
> [    9.020040] raid6test: test_disks(16, 60): faila=3D 16(D)  failb=3D 60=
(D)  OK
> [    9.021530] raid6test: test_disks(16, 61): faila=3D 16(D)  failb=3D 61=
(D)  OK
> [    9.035999] raid6test: test_disks(16, 62): faila=3D 16(D)  failb=3D 62=
(P)  OK
> [    9.037404] raid6test: test_disks(16, 63): faila=3D 16(D)  failb=3D 63=
(Q)  OK
> [    9.038787] raid6test: test_disks(17, 18): faila=3D 17(D)  failb=3D 18=
(D)  OK
> [    9.040202] raid6test: test_disks(17, 19): faila=3D 17(D)  failb=3D 19=
(D)  OK
> [    9.041585] raid6test: test_disks(17, 20): faila=3D 17(D)  failb=3D 20=
(D)  OK
> [    9.042961] raid6test: test_disks(17, 21): faila=3D 17(D)  failb=3D 21=
(D)  OK
> [    9.044353] raid6test: test_disks(17, 22): faila=3D 17(D)  failb=3D 22=
(D)  OK
> [    9.045737] raid6test: test_disks(17, 23): faila=3D 17(D)  failb=3D 23=
(D)  OK
> [    9.047098] raid6test: test_disks(17, 24): faila=3D 17(D)  failb=3D 24=
(D)  OK
> [    9.048441] raid6test: test_disks(17, 25): faila=3D 17(D)  failb=3D 25=
(D)  OK
> [    9.074350] raid6test: test_disks(17, 26): faila=3D 17(D)  failb=3D 26=
(D)  OK
> [    9.075576] raid6test: test_disks(17, 27): faila=3D 17(D)  failb=3D 27=
(D)  OK
> [    9.076893] raid6test: test_disks(17, 28): faila=3D 17(D)  failb=3D 28=
(D)  OK
> [    9.078234] raid6test: test_disks(17, 29): faila=3D 17(D)  failb=3D 29=
(D)  OK
> [    9.079499] raid6test: test_disks(17, 30): faila=3D 17(D)  failb=3D 30=
(D)  OK
> [    9.080896] raid6test: test_disks(17, 31): faila=3D 17(D)  failb=3D 31=
(D)  OK
> [    9.082239] raid6test: test_disks(17, 32): faila=3D 17(D)  failb=3D 32=
(D)  OK
> [    9.083576] raid6test: test_disks(17, 33): faila=3D 17(D)  failb=3D 33=
(D)  OK
> [    9.084924] raid6test: test_disks(17, 34): faila=3D 17(D)  failb=3D 34=
(D)  OK
> [    9.086269] raid6test: test_disks(17, 35): faila=3D 17(D)  failb=3D 35=
(D)  OK
> [    9.087568] raid6test: test_disks(17, 36): faila=3D 17(D)  failb=3D 36=
(D)  OK
> [    9.088916] raid6test: test_disks(17, 37): faila=3D 17(D)  failb=3D 37=
(D)  OK
> [    9.090260] raid6test: test_disks(17, 38): faila=3D 17(D)  failb=3D 38=
(D)  OK
> [    9.104288] raid6test: test_disks(17, 39): faila=3D 17(D)  failb=3D 39=
(D)  OK
> [    9.105646] raid6test: test_disks(17, 40): faila=3D 17(D)  failb=3D 40=
(D)  OK
> [    9.106957] raid6test: test_disks(17, 41): faila=3D 17(D)  failb=3D 41=
(D)  OK
> [    9.108202] raid6test: test_disks(17, 42): faila=3D 17(D)  failb=3D 42=
(D)  OK
> [    9.109548] raid6test: test_disks(17, 43): faila=3D 17(D)  failb=3D 43=
(D)  OK
> [    9.110917] raid6test: test_disks(17, 44): faila=3D 17(D)  failb=3D 44=
(D)  OK
> [    9.112190] raid6test: test_disks(17, 45): faila=3D 17(D)  failb=3D 45=
(D)  OK
> [    9.113527] raid6test: test_disks(17, 46): faila=3D 17(D)  failb=3D 46=
(D)  OK
> [    9.114852] raid6test: test_disks(17, 47): faila=3D 17(D)  failb=3D 47=
(D)  OK
> [    9.116170] raid6test: test_disks(17, 48): faila=3D 17(D)  failb=3D 48=
(D)  OK
> [    9.117520] raid6test: test_disks(17, 49): faila=3D 17(D)  failb=3D 49=
(D)  OK
> [    9.118842] raid6test: test_disks(17, 50): faila=3D 17(D)  failb=3D 50=
(D)  OK
> [    9.120177] raid6test: test_disks(17, 51): faila=3D 17(D)  failb=3D 51=
(D)  OK
> [    9.132251] raid6test: test_disks(17, 52): faila=3D 17(D)  failb=3D 52=
(D)  OK
> [    9.133662] raid6test: test_disks(17, 53): faila=3D 17(D)  failb=3D 53=
(D)  OK
> [    9.135045] raid6test: test_disks(17, 54): faila=3D 17(D)  failb=3D 54=
(D)  OK
> [    9.136415] raid6test: test_disks(17, 55): faila=3D 17(D)  failb=3D 55=
(D)  OK
> [    9.137800] raid6test: test_disks(17, 56): faila=3D 17(D)  failb=3D 56=
(D)  OK
> [    9.139134] raid6test: test_disks(17, 57): faila=3D 17(D)  failb=3D 57=
(D)  OK
> [    9.140467] raid6test: test_disks(17, 58): faila=3D 17(D)  failb=3D 58=
(D)  OK
> [    9.141820] raid6test: test_disks(17, 59): faila=3D 17(D)  failb=3D 59=
(D)  OK
> [    9.143148] raid6test: test_disks(17, 60): faila=3D 17(D)  failb=3D 60=
(D)  OK
> [    9.144517] raid6test: test_disks(17, 61): faila=3D 17(D)  failb=3D 61=
(D)  OK
> [    9.159058] raid6test: test_disks(17, 62): faila=3D 17(D)  failb=3D 62=
(P)  OK
> [    9.160621] raid6test: test_disks(17, 63): faila=3D 17(D)  failb=3D 63=
(Q)  OK
> [    9.162003] raid6test: test_disks(18, 19): faila=3D 18(D)  failb=3D 19=
(D)  OK
> [    9.163408] raid6test: test_disks(18, 20): faila=3D 18(D)  failb=3D 20=
(D)  OK
> [    9.164802] raid6test: test_disks(18, 21): faila=3D 18(D)  failb=3D 21=
(D)  OK
> [    9.166202] raid6test: test_disks(18, 22): faila=3D 18(D)  failb=3D 22=
(D)  OK
> [    9.167573] raid6test: test_disks(18, 23): faila=3D 18(D)  failb=3D 23=
(D)  OK
> [    9.168958] raid6test: test_disks(18, 24): faila=3D 18(D)  failb=3D 24=
(D)  OK
> [    9.170165] raid6test: test_disks(18, 25): faila=3D 18(D)  failb=3D 25=
(D)  OK
> [    9.184877] raid6test: test_disks(18, 26): faila=3D 18(D)  failb=3D 26=
(D)  OK
> [    9.186279] raid6test: test_disks(18, 27): faila=3D 18(D)  failb=3D 27=
(D)  OK
> [    9.187686] raid6test: test_disks(18, 28): faila=3D 18(D)  failb=3D 28=
(D)  OK
> [    9.189080] raid6test: test_disks(18, 29): faila=3D 18(D)  failb=3D 29=
(D)  OK
> [    9.190439] raid6test: test_disks(18, 30): faila=3D 18(D)  failb=3D 30=
(D)  OK
> [    9.191912] raid6test: test_disks(18, 31): faila=3D 18(D)  failb=3D 31=
(D)  OK
> [    9.193262] raid6test: test_disks(18, 32): faila=3D 18(D)  failb=3D 32=
(D)  OK
> [    9.194600] raid6test: test_disks(18, 33): faila=3D 18(D)  failb=3D 33=
(D)  OK
> [    9.195934] raid6test: test_disks(18, 34): faila=3D 18(D)  failb=3D 34=
(D)  OK
> [    9.210383] raid6test: test_disks(18, 35): faila=3D 18(D)  failb=3D 35=
(D)  OK
> [    9.211784] raid6test: test_disks(18, 36): faila=3D 18(D)  failb=3D 36=
(D)  OK
> [    9.213164] raid6test: test_disks(18, 37): faila=3D 18(D)  failb=3D 37=
(D)  OK
> [    9.214499] raid6test: test_disks(18, 38): faila=3D 18(D)  failb=3D 38=
(D)  OK
> [    9.215812] raid6test: test_disks(18, 39): faila=3D 18(D)  failb=3D 39=
(D)  OK
> [    9.217199] raid6test: test_disks(18, 40): faila=3D 18(D)  failb=3D 40=
(D)  OK
> [    9.218592] raid6test: test_disks(18, 41): faila=3D 18(D)  failb=3D 41=
(D)  OK
> [    9.220009] raid6test: test_disks(18, 42): faila=3D 18(D)  failb=3D 42=
(D)  OK
> [    9.221439] raid6test: test_disks(18, 43): faila=3D 18(D)  failb=3D 43=
(D)  OK
> [    9.222829] raid6test: test_disks(18, 44): faila=3D 18(D)  failb=3D 44=
(D)  OK
> [    9.237364] raid6test: test_disks(18, 45): faila=3D 18(D)  failb=3D 45=
(D)  OK
> [    9.238759] raid6test: test_disks(18, 46): faila=3D 18(D)  failb=3D 46=
(D)  OK
> [    9.240170] raid6test: test_disks(18, 47): faila=3D 18(D)  failb=3D 47=
(D)  OK
> [    9.241579] raid6test: test_disks(18, 48): faila=3D 18(D)  failb=3D 48=
(D)  OK
> [    9.242990] raid6test: test_disks(18, 49): faila=3D 18(D)  failb=3D 49=
(D)  OK
> [    9.244390] raid6test: test_disks(18, 50): faila=3D 18(D)  failb=3D 50=
(D)  OK
> [    9.245787] raid6test: test_disks(18, 51): faila=3D 18(D)  failb=3D 51=
(D)  OK
> [    9.247176] raid6test: test_disks(18, 52): faila=3D 18(D)  failb=3D 52=
(D)  OK
> [    9.248571] raid6test: test_disks(18, 53): faila=3D 18(D)  failb=3D 53=
(D)  OK
> [    9.275335] raid6test: test_disks(18, 54): faila=3D 18(D)  failb=3D 54=
(D)  OK
> [    9.276698] raid6test: test_disks(18, 55): faila=3D 18(D)  failb=3D 55=
(D)  OK
> [    9.278045] raid6test: test_disks(18, 56): faila=3D 18(D)  failb=3D 56=
(D)  OK
> [    9.279314] raid6test: test_disks(18, 57): faila=3D 18(D)  failb=3D 57=
(D)  OK
> [    9.280721] raid6test: test_disks(18, 58): faila=3D 18(D)  failb=3D 58=
(D)  OK
> [    9.282071] raid6test: test_disks(18, 59): faila=3D 18(D)  failb=3D 59=
(D)  OK
> [    9.283395] raid6test: test_disks(18, 60): faila=3D 18(D)  failb=3D 60=
(D)  OK
> [    9.284732] raid6test: test_disks(18, 61): faila=3D 18(D)  failb=3D 61=
(D)  OK
> [    9.286076] raid6test: test_disks(18, 62): faila=3D 18(D)  failb=3D 62=
(P)  OK
> [    9.287316] raid6test: test_disks(18, 63): faila=3D 18(D)  failb=3D 63=
(Q)  OK
> [    9.288654] raid6test: test_disks(19, 20): faila=3D 19(D)  failb=3D 20=
(D)  OK
> [    9.290002] raid6test: test_disks(19, 21): faila=3D 19(D)  failb=3D 21=
(D)  OK
> [    9.304276] raid6test: test_disks(19, 22): faila=3D 19(D)  failb=3D 22=
(D)  OK
> [    9.305637] raid6test: test_disks(19, 23): faila=3D 19(D)  failb=3D 23=
(D)  OK
> [    9.306956] raid6test: test_disks(19, 24): faila=3D 19(D)  failb=3D 24=
(D)  OK
> [    9.308242] raid6test: test_disks(19, 25): faila=3D 19(D)  failb=3D 25=
(D)  OK
> [    9.309582] raid6test: test_disks(19, 26): faila=3D 19(D)  failb=3D 26=
(D)  OK
> [    9.310951] raid6test: test_disks(19, 27): faila=3D 19(D)  failb=3D 27=
(D)  OK
> [    9.312295] raid6test: test_disks(19, 28): faila=3D 19(D)  failb=3D 28=
(D)  OK
> [    9.313635] raid6test: test_disks(19, 29): faila=3D 19(D)  failb=3D 29=
(D)  OK
> [    9.314972] raid6test: test_disks(19, 30): faila=3D 19(D)  failb=3D 30=
(D)  OK
> [    9.316281] raid6test: test_disks(19, 31): faila=3D 19(D)  failb=3D 31=
(D)  OK
> [    9.317659] raid6test: test_disks(19, 32): faila=3D 19(D)  failb=3D 32=
(D)  OK
> [    9.319070] raid6test: test_disks(19, 33): faila=3D 19(D)  failb=3D 33=
(D)  OK
> [    9.320467] raid6test: test_disks(19, 34): faila=3D 19(D)  failb=3D 34=
(D)  OK
> [    9.321947] raid6test: test_disks(19, 35): faila=3D 19(D)  failb=3D 35=
(D)  OK
> [    9.323348] raid6test: test_disks(19, 36): faila=3D 19(D)  failb=3D 36=
(D)  OK
> [    9.324735] raid6test: test_disks(19, 37): faila=3D 19(D)  failb=3D 37=
(D)  OK
> [    9.326141] raid6test: test_disks(19, 38): faila=3D 19(D)  failb=3D 38=
(D)  OK
> [    9.327556] raid6test: test_disks(19, 39): faila=3D 19(D)  failb=3D 39=
(D)  OK
> [    9.328948] raid6test: test_disks(19, 40): faila=3D 19(D)  failb=3D 40=
(D)  OK
> [    9.330291] raid6test: test_disks(19, 41): faila=3D 19(D)  failb=3D 41=
(D)  OK
> [    9.331680] raid6test: test_disks(19, 42): faila=3D 19(D)  failb=3D 42=
(D)  OK
> [    9.333021] raid6test: test_disks(19, 43): faila=3D 19(D)  failb=3D 43=
(D)  OK
> [    9.334349] raid6test: test_disks(19, 44): faila=3D 19(D)  failb=3D 44=
(D)  OK
> [    9.335685] raid6test: test_disks(19, 45): faila=3D 19(D)  failb=3D 45=
(D)  OK
> [    9.337017] raid6test: test_disks(19, 46): faila=3D 19(D)  failb=3D 46=
(D)  OK
> [    9.338342] raid6test: test_disks(19, 47): faila=3D 19(D)  failb=3D 47=
(D)  OK
> [    9.339670] raid6test: test_disks(19, 48): faila=3D 19(D)  failb=3D 48=
(D)  OK
> [    9.341072] raid6test: test_disks(19, 49): faila=3D 19(D)  failb=3D 49=
(D)  OK
> [    9.342379] raid6test: test_disks(19, 50): faila=3D 19(D)  failb=3D 50=
(D)  OK
> [    9.343781] raid6test: test_disks(19, 51): faila=3D 19(D)  failb=3D 51=
(D)  OK
> [    9.345200] raid6test: test_disks(19, 52): faila=3D 19(D)  failb=3D 52=
(D)  OK
> [    9.346618] raid6test: test_disks(19, 53): faila=3D 19(D)  failb=3D 53=
(D)  OK
> [    9.348039] raid6test: test_disks(19, 54): faila=3D 19(D)  failb=3D 54=
(D)  OK
> [    9.349457] raid6test: test_disks(19, 55): faila=3D 19(D)  failb=3D 55=
(D)  OK
> [    9.350919] raid6test: test_disks(19, 56): faila=3D 19(D)  failb=3D 56=
(D)  OK
> [    9.352407] raid6test: test_disks(19, 57): faila=3D 19(D)  failb=3D 57=
(D)  OK
> [    9.353781] raid6test: test_disks(19, 58): faila=3D 19(D)  failb=3D 58=
(D)  OK
> [    9.355171] raid6test: test_disks(19, 59): faila=3D 19(D)  failb=3D 59=
(D)  OK
> [    9.356516] raid6test: test_disks(19, 60): faila=3D 19(D)  failb=3D 60=
(D)  OK
> [    9.357864] raid6test: test_disks(19, 61): faila=3D 19(D)  failb=3D 61=
(D)  OK
> [    9.359131] raid6test: test_disks(19, 62): faila=3D 19(D)  failb=3D 62=
(P)  OK
> [    9.360380] raid6test: test_disks(19, 63): faila=3D 19(D)  failb=3D 63=
(Q)  OK
> [    9.361788] raid6test: test_disks(20, 21): faila=3D 20(D)  failb=3D 21=
(D)  OK
> [    9.363099] raid6test: test_disks(20, 22): faila=3D 20(D)  failb=3D 22=
(D)  OK
> [    9.364440] raid6test: test_disks(20, 23): faila=3D 20(D)  failb=3D 23=
(D)  OK
> [    9.365776] raid6test: test_disks(20, 24): faila=3D 20(D)  failb=3D 24=
(D)  OK
> [    9.367087] raid6test: test_disks(20, 25): faila=3D 20(D)  failb=3D 25=
(D)  OK
> [    9.368315] raid6test: test_disks(20, 26): faila=3D 20(D)  failb=3D 26=
(D)  OK
> [    9.369679] raid6test: test_disks(20, 27): faila=3D 20(D)  failb=3D 27=
(D)  OK
> [    9.371153] raid6test: test_disks(20, 28): faila=3D 20(D)  failb=3D 28=
(D)  OK
> [    9.372556] raid6test: test_disks(20, 29): faila=3D 20(D)  failb=3D 29=
(D)  OK
> [    9.373966] raid6test: test_disks(20, 30): faila=3D 20(D)  failb=3D 30=
(D)  OK
> [    9.375366] raid6test: test_disks(20, 31): faila=3D 20(D)  failb=3D 31=
(D)  OK
> [    9.376733] raid6test: test_disks(20, 32): faila=3D 20(D)  failb=3D 32=
(D)  OK
> [    9.378137] raid6test: test_disks(20, 33): faila=3D 20(D)  failb=3D 33=
(D)  OK
> [    9.379539] raid6test: test_disks(20, 34): faila=3D 20(D)  failb=3D 34=
(D)  OK
> [    9.381030] raid6test: test_disks(20, 35): faila=3D 20(D)  failb=3D 35=
(D)  OK
> [    9.382298] raid6test: test_disks(20, 36): faila=3D 20(D)  failb=3D 36=
(D)  OK
> [    9.383617] raid6test: test_disks(20, 37): faila=3D 20(D)  failb=3D 37=
(D)  OK
> [    9.384968] raid6test: test_disks(20, 38): faila=3D 20(D)  failb=3D 38=
(D)  OK
> [    9.386309] raid6test: test_disks(20, 39): faila=3D 20(D)  failb=3D 39=
(D)  OK
> [    9.387576] raid6test: test_disks(20, 40): faila=3D 20(D)  failb=3D 40=
(D)  OK
> [    9.388923] raid6test: test_disks(20, 41): faila=3D 20(D)  failb=3D 41=
(D)  OK
> [    9.390266] raid6test: test_disks(20, 42): faila=3D 20(D)  failb=3D 42=
(D)  OK
> [    9.391555] raid6test: test_disks(20, 43): faila=3D 20(D)  failb=3D 43=
(D)  OK
> [    9.392910] raid6test: test_disks(20, 44): faila=3D 20(D)  failb=3D 44=
(D)  OK
> [    9.394200] raid6test: test_disks(20, 45): faila=3D 20(D)  failb=3D 45=
(D)  OK
> [    9.395536] raid6test: test_disks(20, 46): faila=3D 20(D)  failb=3D 46=
(D)  OK
> [    9.396938] raid6test: test_disks(20, 47): faila=3D 20(D)  failb=3D 47=
(D)  OK
> [    9.398344] raid6test: test_disks(20, 48): faila=3D 20(D)  failb=3D 48=
(D)  OK
> [    9.399743] raid6test: test_disks(20, 49): faila=3D 20(D)  failb=3D 49=
(D)  OK
> [    9.401215] raid6test: test_disks(20, 50): faila=3D 20(D)  failb=3D 50=
(D)  OK
> [    9.402627] raid6test: test_disks(20, 51): faila=3D 20(D)  failb=3D 51=
(D)  OK
> [    9.404033] raid6test: test_disks(20, 52): faila=3D 20(D)  failb=3D 52=
(D)  OK
> [    9.405428] raid6test: test_disks(20, 53): faila=3D 20(D)  failb=3D 53=
(D)  OK
> [    9.406824] raid6test: test_disks(20, 54): faila=3D 20(D)  failb=3D 54=
(D)  OK
> [    9.408156] raid6test: test_disks(20, 55): faila=3D 20(D)  failb=3D 55=
(D)  OK
> [    9.409486] raid6test: test_disks(20, 56): faila=3D 20(D)  failb=3D 56=
(D)  OK
> [    9.410899] raid6test: test_disks(20, 57): faila=3D 20(D)  failb=3D 57=
(D)  OK
> [    9.412228] raid6test: test_disks(20, 58): faila=3D 20(D)  failb=3D 58=
(D)  OK
> [    9.413557] raid6test: test_disks(20, 59): faila=3D 20(D)  failb=3D 59=
(D)  OK
> [    9.414883] raid6test: test_disks(20, 60): faila=3D 20(D)  failb=3D 60=
(D)  OK
> [    9.416211] raid6test: test_disks(20, 61): faila=3D 20(D)  failb=3D 61=
(D)  OK
> [    9.417533] raid6test: test_disks(20, 62): faila=3D 20(D)  failb=3D 62=
(P)  OK
> [    9.418843] raid6test: test_disks(20, 63): faila=3D 20(D)  failb=3D 63=
(Q)  OK
> [    9.420151] raid6test: test_disks(21, 22): faila=3D 21(D)  failb=3D 22=
(D)  OK
> [    9.421627] raid6test: test_disks(21, 23): faila=3D 21(D)  failb=3D 23=
(D)  OK
> [    9.423046] raid6test: test_disks(21, 24): faila=3D 21(D)  failb=3D 24=
(D)  OK
> [    9.424455] raid6test: test_disks(21, 25): faila=3D 21(D)  failb=3D 25=
(D)  OK
> [    9.425868] raid6test: test_disks(21, 26): faila=3D 21(D)  failb=3D 26=
(D)  OK
> [    9.427246] raid6test: test_disks(21, 27): faila=3D 21(D)  failb=3D 27=
(D)  OK
> [    9.428647] raid6test: test_disks(21, 28): faila=3D 21(D)  failb=3D 28=
(D)  OK
> [    9.430025] raid6test: test_disks(21, 29): faila=3D 21(D)  failb=3D 29=
(D)  OK
> [    9.431643] raid6test: test_disks(21, 30): faila=3D 21(D)  failb=3D 30=
(D)  OK
> [    9.432872] raid6test: test_disks(21, 31): faila=3D 21(D)  failb=3D 31=
(D)  OK
> [    9.434074] raid6test: test_disks(21, 32): faila=3D 21(D)  failb=3D 32=
(D)  OK
> [    9.435360] raid6test: test_disks(21, 33): faila=3D 21(D)  failb=3D 33=
(D)  OK
> [    9.436701] raid6test: test_disks(21, 34): faila=3D 21(D)  failb=3D 34=
(D)  OK
> [    9.438042] raid6test: test_disks(21, 35): faila=3D 21(D)  failb=3D 35=
(D)  OK
> [    9.439296] raid6test: test_disks(21, 36): faila=3D 21(D)  failb=3D 36=
(D)  OK
> [    9.440568] raid6test: test_disks(21, 37): faila=3D 21(D)  failb=3D 37=
(D)  OK
> [    9.441996] raid6test: test_disks(21, 38): faila=3D 21(D)  failb=3D 38=
(D)  OK
> [    9.443345] raid6test: test_disks(21, 39): faila=3D 21(D)  failb=3D 39=
(D)  OK
> [    9.444689] raid6test: test_disks(21, 40): faila=3D 21(D)  failb=3D 40=
(D)  OK
> [    9.446039] raid6test: test_disks(21, 41): faila=3D 21(D)  failb=3D 41=
(D)  OK
> [    9.447395] raid6test: test_disks(21, 42): faila=3D 21(D)  failb=3D 42=
(D)  OK
> [    9.448739] raid6test: test_disks(21, 43): faila=3D 21(D)  failb=3D 43=
(D)  OK
> [    9.450083] raid6test: test_disks(21, 44): faila=3D 21(D)  failb=3D 44=
(D)  OK
> [    9.464367] raid6test: test_disks(21, 45): faila=3D 21(D)  failb=3D 45=
(D)  OK
> [    9.465734] raid6test: test_disks(21, 46): faila=3D 21(D)  failb=3D 46=
(D)  OK
> [    9.467045] raid6test: test_disks(21, 47): faila=3D 21(D)  failb=3D 47=
(D)  OK
> [    9.468394] raid6test: test_disks(21, 48): faila=3D 21(D)  failb=3D 48=
(D)  OK
> [    9.469741] raid6test: test_disks(21, 49): faila=3D 21(D)  failb=3D 49=
(D)  OK
> [    9.483347] raid6test: test_disks(21, 50): faila=3D 21(D)  failb=3D 50=
(D)  OK
> [    9.484605] raid6test: test_disks(21, 51): faila=3D 21(D)  failb=3D 51=
(D)  OK
> [    9.485951] raid6test: test_disks(21, 52): faila=3D 21(D)  failb=3D 52=
(D)  OK
> [    9.487291] raid6test: test_disks(21, 53): faila=3D 21(D)  failb=3D 53=
(D)  OK
> [    9.488635] raid6test: test_disks(21, 54): faila=3D 21(D)  failb=3D 54=
(D)  OK
> [    9.489981] raid6test: test_disks(21, 55): faila=3D 21(D)  failb=3D 55=
(D)  OK
> [    9.491388] raid6test: test_disks(21, 56): faila=3D 21(D)  failb=3D 56=
(D)  OK
> [    9.492732] raid6test: test_disks(21, 57): faila=3D 21(D)  failb=3D 57=
(D)  OK
> [    9.494082] raid6test: test_disks(21, 58): faila=3D 21(D)  failb=3D 58=
(D)  OK
> [    9.495318] raid6test: test_disks(21, 59): faila=3D 21(D)  failb=3D 59=
(D)  OK
> [    9.496643] raid6test: test_disks(21, 60): faila=3D 21(D)  failb=3D 60=
(D)  OK
> [    9.497986] raid6test: test_disks(21, 61): faila=3D 21(D)  failb=3D 61=
(D)  OK
> [    9.499252] raid6test: test_disks(21, 62): faila=3D 21(D)  failb=3D 62=
(P)  OK
> [    9.500590] raid6test: test_disks(21, 63): faila=3D 21(D)  failb=3D 63=
(Q)  OK
> [    9.515298] raid6test: test_disks(22, 23): faila=3D 22(D)  failb=3D 23=
(D)  OK
> [    9.516660] raid6test: test_disks(22, 24): faila=3D 22(D)  failb=3D 24=
(D)  OK
> [    9.518115] raid6test: test_disks(22, 25): faila=3D 22(D)  failb=3D 25=
(D)  OK
> [    9.519513] raid6test: test_disks(22, 26): faila=3D 22(D)  failb=3D 26=
(D)  OK
> [    9.520936] raid6test: test_disks(22, 27): faila=3D 22(D)  failb=3D 27=
(D)  OK
> [    9.522336] raid6test: test_disks(22, 28): faila=3D 22(D)  failb=3D 28=
(D)  OK
> [    9.523730] raid6test: test_disks(22, 29): faila=3D 22(D)  failb=3D 29=
(D)  OK
> [    9.525127] raid6test: test_disks(22, 30): faila=3D 22(D)  failb=3D 30=
(D)  OK
> [    9.526515] raid6test: test_disks(22, 31): faila=3D 22(D)  failb=3D 31=
(D)  OK
> [    9.527912] raid6test: test_disks(22, 32): faila=3D 22(D)  failb=3D 32=
(D)  OK
> [    9.529305] raid6test: test_disks(22, 33): faila=3D 22(D)  failb=3D 33=
(D)  OK
> [    9.543845] raid6test: test_disks(22, 34): faila=3D 22(D)  failb=3D 34=
(D)  OK
> [    9.545252] raid6test: test_disks(22, 35): faila=3D 22(D)  failb=3D 35=
(D)  OK
> [    9.546634] raid6test: test_disks(22, 36): faila=3D 22(D)  failb=3D 36=
(D)  OK
> [    9.548033] raid6test: test_disks(22, 37): faila=3D 22(D)  failb=3D 37=
(D)  OK
> [    9.549425] raid6test: test_disks(22, 38): faila=3D 22(D)  failb=3D 38=
(D)  OK
> [    9.550876] raid6test: test_disks(22, 39): faila=3D 22(D)  failb=3D 39=
(D)  OK
> [    9.552270] raid6test: test_disks(22, 40): faila=3D 22(D)  failb=3D 40=
(D)  OK
> [    9.553659] raid6test: test_disks(22, 41): faila=3D 22(D)  failb=3D 41=
(D)  OK
> [    9.555052] raid6test: test_disks(22, 42): faila=3D 22(D)  failb=3D 42=
(D)  OK
> [    9.569589] raid6test: test_disks(22, 43): faila=3D 22(D)  failb=3D 43=
(D)  OK
> [    9.571029] raid6test: test_disks(22, 44): faila=3D 22(D)  failb=3D 44=
(D)  OK
> [    9.572426] raid6test: test_disks(22, 45): faila=3D 22(D)  failb=3D 45=
(D)  OK
> [    9.573825] raid6test: test_disks(22, 46): faila=3D 22(D)  failb=3D 46=
(D)  OK
> [    9.575211] raid6test: test_disks(22, 47): faila=3D 22(D)  failb=3D 47=
(D)  OK
> [    9.576600] raid6test: test_disks(22, 48): faila=3D 22(D)  failb=3D 48=
(D)  OK
> [    9.577993] raid6test: test_disks(22, 49): faila=3D 22(D)  failb=3D 49=
(D)  OK
> [    9.579385] raid6test: test_disks(22, 50): faila=3D 22(D)  failb=3D 50=
(D)  OK
> [    9.580829] raid6test: test_disks(22, 51): faila=3D 22(D)  failb=3D 51=
(D)  OK
> [    9.595340] raid6test: test_disks(22, 52): faila=3D 22(D)  failb=3D 52=
(D)  OK
> [    9.596739] raid6test: test_disks(22, 53): faila=3D 22(D)  failb=3D 53=
(D)  OK
> [    9.598135] raid6test: test_disks(22, 54): faila=3D 22(D)  failb=3D 54=
(D)  OK
> [    9.599533] raid6test: test_disks(22, 55): faila=3D 22(D)  failb=3D 55=
(D)  OK
> [    9.600961] raid6test: test_disks(22, 56): faila=3D 22(D)  failb=3D 56=
(D)  OK
> [    9.602349] raid6test: test_disks(22, 57): faila=3D 22(D)  failb=3D 57=
(D)  OK
> [    9.603746] raid6test: test_disks(22, 58): faila=3D 22(D)  failb=3D 58=
(D)  OK
> [    9.605142] raid6test: test_disks(22, 59): faila=3D 22(D)  failb=3D 59=
(D)  OK
> [    9.606531] raid6test: test_disks(22, 60): faila=3D 22(D)  failb=3D 60=
(D)  OK
> [    9.621027] raid6test: test_disks(22, 61): faila=3D 22(D)  failb=3D 61=
(D)  OK
> [    9.622460] raid6test: test_disks(22, 62): faila=3D 22(D)  failb=3D 62=
(P)  OK
> [    9.623873] raid6test: test_disks(22, 63): faila=3D 22(D)  failb=3D 63=
(Q)  OK
> [    9.625268] raid6test: test_disks(23, 24): faila=3D 23(D)  failb=3D 24=
(D)  OK
> [    9.626642] raid6test: test_disks(23, 25): faila=3D 23(D)  failb=3D 25=
(D)  OK
> [    9.637155] raid6test: test_disks(23, 26): faila=3D 23(D)  failb=3D 26=
(D)  OK
> [    9.638492] raid6test: test_disks(23, 27): faila=3D 23(D)  failb=3D 27=
(D)  OK
> [    9.639831] raid6test: test_disks(23, 28): faila=3D 23(D)  failb=3D 28=
(D)  OK
> [    9.653946] raid6test: test_disks(23, 29): faila=3D 23(D)  failb=3D 29=
(D)  OK
> [    9.655299] raid6test: test_disks(23, 30): faila=3D 23(D)  failb=3D 30=
(D)  OK
> [    9.656644] raid6test: test_disks(23, 31): faila=3D 23(D)  failb=3D 31=
(D)  OK
> [    9.657994] raid6test: test_disks(23, 32): faila=3D 23(D)  failb=3D 32=
(D)  OK
> [    9.659342] raid6test: test_disks(23, 33): faila=3D 23(D)  failb=3D 33=
(D)  OK
> [    9.660756] raid6test: test_disks(23, 34): faila=3D 23(D)  failb=3D 34=
(D)  OK
> [    9.662101] raid6test: test_disks(23, 35): faila=3D 23(D)  failb=3D 35=
(D)  OK
> [    9.663443] raid6test: test_disks(23, 36): faila=3D 23(D)  failb=3D 36=
(D)  OK
> [    9.664780] raid6test: test_disks(23, 37): faila=3D 23(D)  failb=3D 37=
(D)  OK
> [    9.666125] raid6test: test_disks(23, 38): faila=3D 23(D)  failb=3D 38=
(D)  OK
> [    9.667464] raid6test: test_disks(23, 39): faila=3D 23(D)  failb=3D 39=
(D)  OK
> [    9.668803] raid6test: test_disks(23, 40): faila=3D 23(D)  failb=3D 40=
(D)  OK
> [    9.670150] raid6test: test_disks(23, 41): faila=3D 23(D)  failb=3D 41=
(D)  OK
> [    9.684316] raid6test: test_disks(23, 42): faila=3D 23(D)  failb=3D 42=
(D)  OK
> [    9.685677] raid6test: test_disks(23, 43): faila=3D 23(D)  failb=3D 43=
(D)  OK
> [    9.687028] raid6test: test_disks(23, 44): faila=3D 23(D)  failb=3D 44=
(D)  OK
> [    9.688365] raid6test: test_disks(23, 45): faila=3D 23(D)  failb=3D 45=
(D)  OK
> [    9.689700] raid6test: test_disks(23, 46): faila=3D 23(D)  failb=3D 46=
(D)  OK
> [    9.700305] raid6test: test_disks(23, 47): faila=3D 23(D)  failb=3D 47=
(D)  OK
> [    9.701705] raid6test: test_disks(23, 48): faila=3D 23(D)  failb=3D 48=
(D)  OK
> [    9.703116] raid6test: test_disks(23, 49): faila=3D 23(D)  failb=3D 49=
(D)  OK
> [    9.704517] raid6test: test_disks(23, 50): faila=3D 23(D)  failb=3D 50=
(D)  OK
> [    9.705910] raid6test: test_disks(23, 51): faila=3D 23(D)  failb=3D 51=
(D)  OK
> [    9.707310] raid6test: test_disks(23, 52): faila=3D 23(D)  failb=3D 52=
(D)  OK
> [    9.708702] raid6test: test_disks(23, 53): faila=3D 23(D)  failb=3D 53=
(D)  OK
> [    9.710037] raid6test: test_disks(23, 54): faila=3D 23(D)  failb=3D 54=
(D)  OK
> [    9.711541] raid6test: test_disks(23, 55): faila=3D 23(D)  failb=3D 55=
(D)  OK
> [    9.726029] raid6test: test_disks(23, 56): faila=3D 23(D)  failb=3D 56=
(D)  OK
> [    9.727490] raid6test: test_disks(23, 57): faila=3D 23(D)  failb=3D 57=
(D)  OK
> [    9.728827] raid6test: test_disks(23, 58): faila=3D 23(D)  failb=3D 58=
(D)  OK
> [    9.730144] raid6test: test_disks(23, 59): faila=3D 23(D)  failb=3D 59=
(D)  OK
> [    9.731533] raid6test: test_disks(23, 60): faila=3D 23(D)  failb=3D 60=
(D)  OK
> [    9.732924] raid6test: test_disks(23, 61): faila=3D 23(D)  failb=3D 61=
(D)  OK
> [    9.734265] raid6test: test_disks(23, 62): faila=3D 23(D)  failb=3D 62=
(P)  OK
> [    9.735639] raid6test: test_disks(23, 63): faila=3D 23(D)  failb=3D 63=
(Q)  OK
> [    9.737050] raid6test: test_disks(24, 25): faila=3D 24(D)  failb=3D 25=
(D)  OK
> [    9.738418] raid6test: test_disks(24, 26): faila=3D 24(D)  failb=3D 26=
(D)  OK
> [    9.752988] raid6test: test_disks(24, 27): faila=3D 24(D)  failb=3D 27=
(D)  OK
> [    9.754381] raid6test: test_disks(24, 28): faila=3D 24(D)  failb=3D 28=
(D)  OK
> [    9.755738] raid6test: test_disks(24, 29): faila=3D 24(D)  failb=3D 29=
(D)  OK
> [    9.757065] raid6test: test_disks(24, 30): faila=3D 24(D)  failb=3D 30=
(D)  OK
> [    9.758450] raid6test: test_disks(24, 31): faila=3D 24(D)  failb=3D 31=
(D)  OK
> [    9.759862] raid6test: test_disks(24, 32): faila=3D 24(D)  failb=3D 32=
(D)  OK
> [    9.761244] raid6test: test_disks(24, 33): faila=3D 24(D)  failb=3D 33=
(D)  OK
> [    9.762565] raid6test: test_disks(24, 34): faila=3D 24(D)  failb=3D 34=
(D)  OK
> [    9.763986] raid6test: test_disks(24, 35): faila=3D 24(D)  failb=3D 35=
(D)  OK
> [    9.774443] raid6test: test_disks(24, 36): faila=3D 24(D)  failb=3D 36=
(D)  OK
> [    9.776019] raid6test: test_disks(24, 37): faila=3D 24(D)  failb=3D 37=
(D)  OK
> [    9.777359] raid6test: test_disks(24, 38): faila=3D 24(D)  failb=3D 38=
(D)  OK
> [    9.778681] raid6test: test_disks(24, 39): faila=3D 24(D)  failb=3D 39=
(D)  OK
> [    9.779997] raid6test: test_disks(24, 40): faila=3D 24(D)  failb=3D 40=
(D)  OK
> [    9.781419] raid6test: test_disks(24, 41): faila=3D 24(D)  failb=3D 41=
(D)  OK
> [    9.782754] raid6test: test_disks(24, 42): faila=3D 24(D)  failb=3D 42=
(D)  OK
> [    9.784075] raid6test: test_disks(24, 43): faila=3D 24(D)  failb=3D 43=
(D)  OK
> [    9.785417] raid6test: test_disks(24, 44): faila=3D 24(D)  failb=3D 44=
(D)  OK
> [    9.786986] raid6test: test_disks(24, 45): faila=3D 24(D)  failb=3D 45=
(D)  OK
> [    9.788230] raid6test: test_disks(24, 46): faila=3D 24(D)  failb=3D 46=
(D)  OK
> [    9.789519] raid6test: test_disks(24, 47): faila=3D 24(D)  failb=3D 47=
(D)  OK
> [    9.790928] raid6test: test_disks(24, 48): faila=3D 24(D)  failb=3D 48=
(D)  OK
> [    9.792135] raid6test: test_disks(24, 49): faila=3D 24(D)  failb=3D 49=
(D)  OK
> [    9.793376] raid6test: test_disks(24, 50): faila=3D 24(D)  failb=3D 50=
(D)  OK
> [    9.794591] raid6test: test_disks(24, 51): faila=3D 24(D)  failb=3D 51=
(D)  OK
> [    9.795961] raid6test: test_disks(24, 52): faila=3D 24(D)  failb=3D 52=
(D)  OK
> [    9.797202] raid6test: test_disks(24, 53): faila=3D 24(D)  failb=3D 53=
(D)  OK
> [    9.798433] raid6test: test_disks(24, 54): faila=3D 24(D)  failb=3D 54=
(D)  OK
> [    9.799651] raid6test: test_disks(24, 55): faila=3D 24(D)  failb=3D 55=
(D)  OK
> [    9.801006] raid6test: test_disks(24, 56): faila=3D 24(D)  failb=3D 56=
(D)  OK
> [    9.802251] raid6test: test_disks(24, 57): faila=3D 24(D)  failb=3D 57=
(D)  OK
> [    9.803508] raid6test: test_disks(24, 58): faila=3D 24(D)  failb=3D 58=
(D)  OK
> [    9.804855] raid6test: test_disks(24, 59): faila=3D 24(D)  failb=3D 59=
(D)  OK
> [    9.806195] raid6test: test_disks(24, 60): faila=3D 24(D)  failb=3D 60=
(D)  OK
> [    9.807435] raid6test: test_disks(24, 61): faila=3D 24(D)  failb=3D 61=
(D)  OK
> [    9.808779] raid6test: test_disks(24, 62): faila=3D 24(D)  failb=3D 62=
(P)  OK
> [    9.810123] raid6test: test_disks(24, 63): faila=3D 24(D)  failb=3D 63=
(Q)  OK
> [    9.811549] raid6test: test_disks(25, 26): faila=3D 25(D)  failb=3D 26=
(D)  OK
> [    9.812892] raid6test: test_disks(25, 27): faila=3D 25(D)  failb=3D 27=
(D)  OK
> [    9.814233] raid6test: test_disks(25, 28): faila=3D 25(D)  failb=3D 28=
(D)  OK
> [    9.815465] raid6test: test_disks(25, 29): faila=3D 25(D)  failb=3D 29=
(D)  OK
> [    9.816804] raid6test: test_disks(25, 30): faila=3D 25(D)  failb=3D 30=
(D)  OK
> [    9.818154] raid6test: test_disks(25, 31): faila=3D 25(D)  failb=3D 31=
(D)  OK
> [    9.819452] raid6test: test_disks(25, 32): faila=3D 25(D)  failb=3D 32=
(D)  OK
> [    9.820711] raid6test: test_disks(25, 33): faila=3D 25(D)  failb=3D 33=
(D)  OK
> [    9.822135] raid6test: test_disks(25, 34): faila=3D 25(D)  failb=3D 34=
(D)  OK
> [    9.823376] raid6test: test_disks(25, 35): faila=3D 25(D)  failb=3D 35=
(D)  OK
> [    9.824694] raid6test: test_disks(25, 36): faila=3D 25(D)  failb=3D 36=
(D)  OK
> [    9.826197] raid6test: test_disks(25, 37): faila=3D 25(D)  failb=3D 37=
(D)  OK
> [    9.827552] raid6test: test_disks(25, 38): faila=3D 25(D)  failb=3D 38=
(D)  OK
> [    9.828895] raid6test: test_disks(25, 39): faila=3D 25(D)  failb=3D 39=
(D)  OK
> [    9.830237] raid6test: test_disks(25, 40): faila=3D 25(D)  failb=3D 40=
(D)  OK
> [    9.831515] raid6test: test_disks(25, 41): faila=3D 25(D)  failb=3D 41=
(D)  OK
> [    9.832839] raid6test: test_disks(25, 42): faila=3D 25(D)  failb=3D 42=
(D)  OK
> [    9.834196] raid6test: test_disks(25, 43): faila=3D 25(D)  failb=3D 43=
(D)  OK
> [    9.835442] raid6test: test_disks(25, 44): faila=3D 25(D)  failb=3D 44=
(D)  OK
> [    9.836759] raid6test: test_disks(25, 45): faila=3D 25(D)  failb=3D 45=
(D)  OK
> [    9.838097] raid6test: test_disks(25, 46): faila=3D 25(D)  failb=3D 46=
(D)  OK
> [    9.839338] raid6test: test_disks(25, 47): faila=3D 25(D)  failb=3D 47=
(D)  OK
> [    9.840645] raid6test: test_disks(25, 48): faila=3D 25(D)  failb=3D 48=
(D)  OK
> [    9.842059] raid6test: test_disks(25, 49): faila=3D 25(D)  failb=3D 49=
(D)  OK
> [    9.843401] raid6test: test_disks(25, 50): faila=3D 25(D)  failb=3D 50=
(D)  OK
> [    9.844738] raid6test: test_disks(25, 51): faila=3D 25(D)  failb=3D 51=
(D)  OK
> [    9.846081] raid6test: test_disks(25, 52): faila=3D 25(D)  failb=3D 52=
(D)  OK
> [    9.847369] raid6test: test_disks(25, 53): faila=3D 25(D)  failb=3D 53=
(D)  OK
> [    9.848712] raid6test: test_disks(25, 54): faila=3D 25(D)  failb=3D 54=
(D)  OK
> [    9.850063] raid6test: test_disks(25, 55): faila=3D 25(D)  failb=3D 55=
(D)  OK
> [    9.851365] raid6test: test_disks(25, 56): faila=3D 25(D)  failb=3D 56=
(D)  OK
> [    9.852662] raid6test: test_disks(25, 57): faila=3D 25(D)  failb=3D 57=
(D)  OK
> [    9.854004] raid6test: test_disks(25, 58): faila=3D 25(D)  failb=3D 58=
(D)  OK
> [    9.855274] raid6test: test_disks(25, 59): faila=3D 25(D)  failb=3D 59=
(D)  OK
> [    9.856754] raid6test: test_disks(25, 60): faila=3D 25(D)  failb=3D 60=
(D)  OK
> [    9.858108] raid6test: test_disks(25, 61): faila=3D 25(D)  failb=3D 61=
(D)  OK
> [    9.859347] raid6test: test_disks(25, 62): faila=3D 25(D)  failb=3D 62=
(P)  OK
> [    9.860655] raid6test: test_disks(25, 63): faila=3D 25(D)  failb=3D 63=
(Q)  OK
> [    9.862075] raid6test: test_disks(26, 27): faila=3D 26(D)  failb=3D 27=
(D)  OK
> [    9.863370] raid6test: test_disks(26, 28): faila=3D 26(D)  failb=3D 28=
(D)  OK
> [    9.864709] raid6test: test_disks(26, 29): faila=3D 26(D)  failb=3D 29=
(D)  OK
> [    9.866147] raid6test: test_disks(26, 30): faila=3D 26(D)  failb=3D 30=
(D)  OK
> [    9.867494] raid6test: test_disks(26, 31): faila=3D 26(D)  failb=3D 31=
(D)  OK
> [    9.868835] raid6test: test_disks(26, 32): faila=3D 26(D)  failb=3D 32=
(D)  OK
> [    9.870182] raid6test: test_disks(26, 33): faila=3D 26(D)  failb=3D 33=
(D)  OK
> [    9.871545] raid6test: test_disks(26, 34): faila=3D 26(D)  failb=3D 34=
(D)  OK
> [    9.872901] raid6test: test_disks(26, 35): faila=3D 26(D)  failb=3D 35=
(D)  OK
> [    9.874235] raid6test: test_disks(26, 36): faila=3D 26(D)  failb=3D 36=
(D)  OK
> [    9.875577] raid6test: test_disks(26, 37): faila=3D 26(D)  failb=3D 37=
(D)  OK
> [    9.877023] raid6test: test_disks(26, 38): faila=3D 26(D)  failb=3D 38=
(D)  OK
> [    9.878371] raid6test: test_disks(26, 39): faila=3D 26(D)  failb=3D 39=
(D)  OK
> [    9.879614] raid6test: test_disks(26, 40): faila=3D 26(D)  failb=3D 40=
(D)  OK
> [    9.881050] raid6test: test_disks(26, 41): faila=3D 26(D)  failb=3D 41=
(D)  OK
> [    9.882392] raid6test: test_disks(26, 42): faila=3D 26(D)  failb=3D 42=
(D)  OK
> [    9.883694] raid6test: test_disks(26, 43): faila=3D 26(D)  failb=3D 43=
(D)  OK
> [    9.885045] raid6test: test_disks(26, 44): faila=3D 26(D)  failb=3D 44=
(D)  OK
> [    9.886509] raid6test: test_disks(26, 45): faila=3D 26(D)  failb=3D 45=
(D)  OK
> [    9.887708] raid6test: test_disks(26, 46): faila=3D 26(D)  failb=3D 46=
(D)  OK
> [    9.889052] raid6test: test_disks(26, 47): faila=3D 26(D)  failb=3D 47=
(D)  OK
> [    9.890398] raid6test: test_disks(26, 48): faila=3D 26(D)  failb=3D 48=
(D)  OK
> [    9.891666] raid6test: test_disks(26, 49): faila=3D 26(D)  failb=3D 49=
(D)  OK
> [    9.893016] raid6test: test_disks(26, 50): faila=3D 26(D)  failb=3D 50=
(D)  OK
> [    9.894362] raid6test: test_disks(26, 51): faila=3D 26(D)  failb=3D 51=
(D)  OK
> [    9.895711] raid6test: test_disks(26, 52): faila=3D 26(D)  failb=3D 52=
(D)  OK
> [    9.897059] raid6test: test_disks(26, 53): faila=3D 26(D)  failb=3D 53=
(D)  OK
> [    9.898397] raid6test: test_disks(26, 54): faila=3D 26(D)  failb=3D 54=
(D)  OK
> [    9.899735] raid6test: test_disks(26, 55): faila=3D 26(D)  failb=3D 55=
(D)  OK
> [    9.901144] raid6test: test_disks(26, 56): faila=3D 26(D)  failb=3D 56=
(D)  OK
> [    9.902484] raid6test: test_disks(26, 57): faila=3D 26(D)  failb=3D 57=
(D)  OK
> [    9.903822] raid6test: test_disks(26, 58): faila=3D 26(D)  failb=3D 58=
(D)  OK
> [    9.905160] raid6test: test_disks(26, 59): faila=3D 26(D)  failb=3D 59=
(D)  OK
> [    9.906506] raid6test: test_disks(26, 60): faila=3D 26(D)  failb=3D 60=
(D)  OK
> [    9.907839] raid6test: test_disks(26, 61): faila=3D 26(D)  failb=3D 61=
(D)  OK
> [    9.909178] raid6test: test_disks(26, 62): faila=3D 26(D)  failb=3D 62=
(P)  OK
> [    9.910523] raid6test: test_disks(26, 63): faila=3D 26(D)  failb=3D 63=
(Q)  OK
> [    9.911790] raid6test: test_disks(27, 28): faila=3D 27(D)  failb=3D 28=
(D)  OK
> [    9.913144] raid6test: test_disks(27, 29): faila=3D 27(D)  failb=3D 29=
(D)  OK
> [    9.914487] raid6test: test_disks(27, 30): faila=3D 27(D)  failb=3D 30=
(D)  OK
> [    9.915971] raid6test: test_disks(27, 31): faila=3D 27(D)  failb=3D 31=
(D)  OK
> [    9.917315] raid6test: test_disks(27, 32): faila=3D 27(D)  failb=3D 32=
(D)  OK
> [    9.918654] raid6test: test_disks(27, 33): faila=3D 27(D)  failb=3D 33=
(D)  OK
> [    9.920000] raid6test: test_disks(27, 34): faila=3D 27(D)  failb=3D 34=
(D)  OK
> [    9.921414] raid6test: test_disks(27, 35): faila=3D 27(D)  failb=3D 35=
(D)  OK
> [    9.922753] raid6test: test_disks(27, 36): faila=3D 27(D)  failb=3D 36=
(D)  OK
> [    9.924097] raid6test: test_disks(27, 37): faila=3D 27(D)  failb=3D 37=
(D)  OK
> [    9.925440] raid6test: test_disks(27, 38): faila=3D 27(D)  failb=3D 38=
(D)  OK
> [    9.926892] raid6test: test_disks(27, 39): faila=3D 27(D)  failb=3D 39=
(D)  OK
> [    9.928239] raid6test: test_disks(27, 40): faila=3D 27(D)  failb=3D 40=
(D)  OK
> [    9.929575] raid6test: test_disks(27, 41): faila=3D 27(D)  failb=3D 41=
(D)  OK
> [    9.930996] raid6test: test_disks(27, 42): faila=3D 27(D)  failb=3D 42=
(D)  OK
> [    9.932337] raid6test: test_disks(27, 43): faila=3D 27(D)  failb=3D 43=
(D)  OK
> [    9.933674] raid6test: test_disks(27, 44): faila=3D 27(D)  failb=3D 44=
(D)  OK
> [    9.935026] raid6test: test_disks(27, 45): faila=3D 27(D)  failb=3D 45=
(D)  OK
> [    9.936367] raid6test: test_disks(27, 46): faila=3D 27(D)  failb=3D 46=
(D)  OK
> [    9.937708] raid6test: test_disks(27, 47): faila=3D 27(D)  failb=3D 47=
(D)  OK
> [    9.939009] raid6test: test_disks(27, 48): faila=3D 27(D)  failb=3D 48=
(D)  OK
> [    9.940297] raid6test: test_disks(27, 49): faila=3D 27(D)  failb=3D 49=
(D)  OK
> [    9.941726] raid6test: test_disks(27, 50): faila=3D 27(D)  failb=3D 50=
(D)  OK
> [    9.943042] raid6test: test_disks(27, 51): faila=3D 27(D)  failb=3D 51=
(D)  OK
> [    9.944312] raid6test: test_disks(27, 52): faila=3D 27(D)  failb=3D 52=
(D)  OK
> [    9.945647] raid6test: test_disks(27, 53): faila=3D 27(D)  failb=3D 53=
(D)  OK
> [    9.947127] raid6test: test_disks(27, 54): faila=3D 27(D)  failb=3D 54=
(D)  OK
> [    9.948473] raid6test: test_disks(27, 55): faila=3D 27(D)  failb=3D 55=
(D)  OK
> [    9.949819] raid6test: test_disks(27, 56): faila=3D 27(D)  failb=3D 56=
(D)  OK
> [    9.951176] raid6test: test_disks(27, 57): faila=3D 27(D)  failb=3D 57=
(D)  OK
> [    9.952520] raid6test: test_disks(27, 58): faila=3D 27(D)  failb=3D 58=
(D)  OK
> [    9.953819] raid6test: test_disks(27, 59): faila=3D 27(D)  failb=3D 59=
(D)  OK
> [    9.955072] raid6test: test_disks(27, 60): faila=3D 27(D)  failb=3D 60=
(D)  OK
> [    9.956372] raid6test: test_disks(27, 61): faila=3D 27(D)  failb=3D 61=
(D)  OK
> [    9.957713] raid6test: test_disks(27, 62): faila=3D 27(D)  failb=3D 62=
(P)  OK
> [    9.959066] raid6test: test_disks(27, 63): faila=3D 27(D)  failb=3D 63=
(Q)  OK
> [    9.960408] raid6test: test_disks(28, 29): faila=3D 28(D)  failb=3D 29=
(D)  OK
> [    9.961826] raid6test: test_disks(28, 30): faila=3D 28(D)  failb=3D 30=
(D)  OK
> [    9.963174] raid6test: test_disks(28, 31): faila=3D 28(D)  failb=3D 31=
(D)  OK
> [    9.964522] raid6test: test_disks(28, 32): faila=3D 28(D)  failb=3D 32=
(D)  OK
> [    9.966003] raid6test: test_disks(28, 33): faila=3D 28(D)  failb=3D 33=
(D)  OK
> [    9.967348] raid6test: test_disks(28, 34): faila=3D 28(D)  failb=3D 34=
(D)  OK
> [    9.968683] raid6test: test_disks(28, 35): faila=3D 28(D)  failb=3D 35=
(D)  OK
> [    9.970033] raid6test: test_disks(28, 36): faila=3D 28(D)  failb=3D 36=
(D)  OK
> [    9.971458] raid6test: test_disks(28, 37): faila=3D 28(D)  failb=3D 37=
(D)  OK
> [    9.972799] raid6test: test_disks(28, 38): faila=3D 28(D)  failb=3D 38=
(D)  OK
> [    9.974142] raid6test: test_disks(28, 39): faila=3D 28(D)  failb=3D 39=
(D)  OK
> [    9.975480] raid6test: test_disks(28, 40): faila=3D 28(D)  failb=3D 40=
(D)  OK
> [    9.976951] raid6test: test_disks(28, 41): faila=3D 28(D)  failb=3D 41=
(D)  OK
> [    9.978288] raid6test: test_disks(28, 42): faila=3D 28(D)  failb=3D 42=
(D)  OK
> [    9.979638] raid6test: test_disks(28, 43): faila=3D 28(D)  failb=3D 43=
(D)  OK
> [    9.981060] raid6test: test_disks(28, 44): faila=3D 28(D)  failb=3D 44=
(D)  OK
> [    9.982405] raid6test: test_disks(28, 45): faila=3D 28(D)  failb=3D 45=
(D)  OK
> [    9.983872] raid6test: test_disks(28, 46): faila=3D 28(D)  failb=3D 46=
(D)  OK
> [    9.985208] raid6test: test_disks(28, 47): faila=3D 28(D)  failb=3D 47=
(D)  OK
> [    9.986554] raid6test: test_disks(28, 48): faila=3D 28(D)  failb=3D 48=
(D)  OK
> [    9.987898] raid6test: test_disks(28, 49): faila=3D 28(D)  failb=3D 49=
(D)  OK
> [    9.989238] raid6test: test_disks(28, 50): faila=3D 28(D)  failb=3D 50=
(D)  OK
> [    9.990584] raid6test: test_disks(28, 51): faila=3D 28(D)  failb=3D 51=
(D)  OK
> [    9.992015] raid6test: test_disks(28, 52): faila=3D 28(D)  failb=3D 52=
(D)  OK
> [    9.993353] raid6test: test_disks(28, 53): faila=3D 28(D)  failb=3D 53=
(D)  OK
> [    9.994690] raid6test: test_disks(28, 54): faila=3D 28(D)  failb=3D 54=
(D)  OK
> [    9.996040] raid6test: test_disks(28, 55): faila=3D 28(D)  failb=3D 55=
(D)  OK
> [    9.997388] raid6test: test_disks(28, 56): faila=3D 28(D)  failb=3D 56=
(D)  OK
> [    9.998721] raid6test: test_disks(28, 57): faila=3D 28(D)  failb=3D 57=
(D)  OK
> [   10.000080] raid6test: test_disks(28, 58): faila=3D 28(D)  failb=3D 58=
(D)  OK
> [   10.001514] raid6test: test_disks(28, 59): faila=3D 28(D)  failb=3D 59=
(D)  OK
> [   10.002825] raid6test: test_disks(28, 60): faila=3D 28(D)  failb=3D 60=
(D)  OK
> [   10.004143] raid6test: test_disks(28, 61): faila=3D 28(D)  failb=3D 61=
(D)  OK
> [   10.005487] raid6test: test_disks(28, 62): faila=3D 28(D)  failb=3D 62=
(P)  OK
> [   10.006966] raid6test: test_disks(28, 63): faila=3D 28(D)  failb=3D 63=
(Q)  OK
> [   10.008310] raid6test: test_disks(29, 30): faila=3D 29(D)  failb=3D 30=
(D)  OK
> [   10.009651] raid6test: test_disks(29, 31): faila=3D 29(D)  failb=3D 31=
(D)  OK
> [   10.011174] raid6test: test_disks(29, 32): faila=3D 29(D)  failb=3D 32=
(D)  OK
> [   10.012520] raid6test: test_disks(29, 33): faila=3D 29(D)  failb=3D 33=
(D)  OK
> [   10.013861] raid6test: test_disks(29, 34): faila=3D 29(D)  failb=3D 34=
(D)  OK
> [   10.015149] raid6test: test_disks(29, 35): faila=3D 29(D)  failb=3D 35=
(D)  OK
> [   10.016498] raid6test: test_disks(29, 36): faila=3D 29(D)  failb=3D 36=
(D)  OK
> [   10.017838] raid6test: test_disks(29, 37): faila=3D 29(D)  failb=3D 37=
(D)  OK
> [   10.019159] raid6test: test_disks(29, 38): faila=3D 29(D)  failb=3D 38=
(D)  OK
> [   10.020508] raid6test: test_disks(29, 39): faila=3D 29(D)  failb=3D 39=
(D)  OK
> [   10.021935] raid6test: test_disks(29, 40): faila=3D 29(D)  failb=3D 40=
(D)  OK
> [   10.023216] raid6test: test_disks(29, 41): faila=3D 29(D)  failb=3D 41=
(D)  OK
> [   10.024562] raid6test: test_disks(29, 42): faila=3D 29(D)  failb=3D 42=
(D)  OK
> [   10.026045] raid6test: test_disks(29, 43): faila=3D 29(D)  failb=3D 43=
(D)  OK
> [   10.027389] raid6test: test_disks(29, 44): faila=3D 29(D)  failb=3D 44=
(D)  OK
> [   10.028699] raid6test: test_disks(29, 45): faila=3D 29(D)  failb=3D 45=
(D)  OK
> [   10.029982] raid6test: test_disks(29, 46): faila=3D 29(D)  failb=3D 46=
(D)  OK
> [   10.031401] raid6test: test_disks(29, 47): faila=3D 29(D)  failb=3D 47=
(D)  OK
> [   10.032748] raid6test: test_disks(29, 48): faila=3D 29(D)  failb=3D 48=
(D)  OK
> [   10.034089] raid6test: test_disks(29, 49): faila=3D 29(D)  failb=3D 49=
(D)  OK
> [   10.035434] raid6test: test_disks(29, 50): faila=3D 29(D)  failb=3D 50=
(D)  OK
> [   10.036913] raid6test: test_disks(29, 51): faila=3D 29(D)  failb=3D 51=
(D)  OK
> [   10.038210] raid6test: test_disks(29, 52): faila=3D 29(D)  failb=3D 52=
(D)  OK
> [   10.039433] raid6test: test_disks(29, 53): faila=3D 29(D)  failb=3D 53=
(D)  OK
> [   10.040878] raid6test: test_disks(29, 54): faila=3D 29(D)  failb=3D 54=
(D)  OK
> [   10.042224] raid6test: test_disks(29, 55): faila=3D 29(D)  failb=3D 55=
(D)  OK
> [   10.043565] raid6test: test_disks(29, 56): faila=3D 29(D)  failb=3D 56=
(D)  OK
> [   10.044910] raid6test: test_disks(29, 57): faila=3D 29(D)  failb=3D 57=
(D)  OK
> [   10.046256] raid6test: test_disks(29, 58): faila=3D 29(D)  failb=3D 58=
(D)  OK
> [   10.047596] raid6test: test_disks(29, 59): faila=3D 29(D)  failb=3D 59=
(D)  OK
> [   10.048956] raid6test: test_disks(29, 60): faila=3D 29(D)  failb=3D 60=
(D)  OK
> [   10.050296] raid6test: test_disks(29, 61): faila=3D 29(D)  failb=3D 61=
(D)  OK
> [   10.051736] raid6test: test_disks(29, 62): faila=3D 29(D)  failb=3D 62=
(P)  OK
> [   10.053090] raid6test: test_disks(29, 63): faila=3D 29(D)  failb=3D 63=
(Q)  OK
> [   10.054438] raid6test: test_disks(30, 31): faila=3D 30(D)  failb=3D 31=
(D)  OK
> [   10.055785] raid6test: test_disks(30, 32): faila=3D 30(D)  failb=3D 32=
(D)  OK
> [   10.057136] raid6test: test_disks(30, 33): faila=3D 30(D)  failb=3D 33=
(D)  OK
> [   10.058478] raid6test: test_disks(30, 34): faila=3D 30(D)  failb=3D 34=
(D)  OK
> [   10.059821] raid6test: test_disks(30, 35): faila=3D 30(D)  failb=3D 35=
(D)  OK
> [   10.061250] raid6test: test_disks(30, 36): faila=3D 30(D)  failb=3D 36=
(D)  OK
> [   10.062593] raid6test: test_disks(30, 37): faila=3D 30(D)  failb=3D 37=
(D)  OK
> [   10.063816] raid6test: test_disks(30, 38): faila=3D 30(D)  failb=3D 38=
(D)  OK
> [   10.065167] raid6test: test_disks(30, 39): faila=3D 30(D)  failb=3D 39=
(D)  OK
> [   10.066668] raid6test: test_disks(30, 40): faila=3D 30(D)  failb=3D 40=
(D)  OK
> [   10.067823] raid6test: test_disks(30, 41): faila=3D 30(D)  failb=3D 41=
(D)  OK
> [   10.069082] raid6test: test_disks(30, 42): faila=3D 30(D)  failb=3D 42=
(D)  OK
> [   10.070435] raid6test: test_disks(30, 43): faila=3D 30(D)  failb=3D 43=
(D)  OK
> [   10.071868] raid6test: test_disks(30, 44): faila=3D 30(D)  failb=3D 44=
(D)  OK
> [   10.073205] raid6test: test_disks(30, 45): faila=3D 30(D)  failb=3D 45=
(D)  OK
> [   10.074548] raid6test: test_disks(30, 46): faila=3D 30(D)  failb=3D 46=
(D)  OK
> [   10.076030] raid6test: test_disks(30, 47): faila=3D 30(D)  failb=3D 47=
(D)  OK
> [   10.077368] raid6test: test_disks(30, 48): faila=3D 30(D)  failb=3D 48=
(D)  OK
> [   10.078707] raid6test: test_disks(30, 49): faila=3D 30(D)  failb=3D 49=
(D)  OK
> [   10.080035] raid6test: test_disks(30, 50): faila=3D 30(D)  failb=3D 50=
(D)  OK
> [   10.081458] raid6test: test_disks(30, 51): faila=3D 30(D)  failb=3D 51=
(D)  OK
> [   10.082787] raid6test: test_disks(30, 52): faila=3D 30(D)  failb=3D 52=
(D)  OK
> [   10.083993] raid6test: test_disks(30, 53): faila=3D 30(D)  failb=3D 53=
(D)  OK
> [   10.085335] raid6test: test_disks(30, 54): faila=3D 30(D)  failb=3D 54=
(D)  OK
> [   10.086670] raid6test: test_disks(30, 55): faila=3D 30(D)  failb=3D 55=
(D)  OK
> [   10.087855] raid6test: test_disks(30, 56): faila=3D 30(D)  failb=3D 56=
(D)  OK
> [   10.089191] raid6test: test_disks(30, 57): faila=3D 30(D)  failb=3D 57=
(D)  OK
> [   10.090532] raid6test: test_disks(30, 58): faila=3D 30(D)  failb=3D 58=
(D)  OK
> [   10.091954] raid6test: test_disks(30, 59): faila=3D 30(D)  failb=3D 59=
(D)  OK
> [   10.093296] raid6test: test_disks(30, 60): faila=3D 30(D)  failb=3D 60=
(D)  OK
> [   10.094638] raid6test: test_disks(30, 61): faila=3D 30(D)  failb=3D 61=
(D)  OK
> [   10.096036] raid6test: test_disks(30, 62): faila=3D 30(D)  failb=3D 62=
(P)  OK
> [   10.097380] raid6test: test_disks(30, 63): faila=3D 30(D)  failb=3D 63=
(Q)  OK
> [   10.098715] raid6test: test_disks(31, 32): faila=3D 31(D)  failb=3D 32=
(D)  OK
> [   10.100066] raid6test: test_disks(31, 33): faila=3D 31(D)  failb=3D 33=
(D)  OK
> [   10.101499] raid6test: test_disks(31, 34): faila=3D 31(D)  failb=3D 34=
(D)  OK
> [   10.102835] raid6test: test_disks(31, 35): faila=3D 31(D)  failb=3D 35=
(D)  OK
> [   10.104181] raid6test: test_disks(31, 36): faila=3D 31(D)  failb=3D 36=
(D)  OK
> [   10.105531] raid6test: test_disks(31, 37): faila=3D 31(D)  failb=3D 37=
(D)  OK
> [   10.106875] raid6test: test_disks(31, 38): faila=3D 31(D)  failb=3D 38=
(D)  OK
> [   10.108176] raid6test: test_disks(31, 39): faila=3D 31(D)  failb=3D 39=
(D)  OK
> [   10.109511] raid6test: test_disks(31, 40): faila=3D 31(D)  failb=3D 40=
(D)  OK
> [   10.110956] raid6test: test_disks(31, 41): faila=3D 31(D)  failb=3D 41=
(D)  OK
> [   10.112303] raid6test: test_disks(31, 42): faila=3D 31(D)  failb=3D 42=
(D)  OK
> [   10.113642] raid6test: test_disks(31, 43): faila=3D 31(D)  failb=3D 43=
(D)  OK
> [   10.114984] raid6test: test_disks(31, 44): faila=3D 31(D)  failb=3D 44=
(D)  OK
> [   10.116325] raid6test: test_disks(31, 45): faila=3D 31(D)  failb=3D 45=
(D)  OK
> [   10.117669] raid6test: test_disks(31, 46): faila=3D 31(D)  failb=3D 46=
(D)  OK
> [   10.119018] raid6test: test_disks(31, 47): faila=3D 31(D)  failb=3D 47=
(D)  OK
> [   10.120353] raid6test: test_disks(31, 48): faila=3D 31(D)  failb=3D 48=
(D)  OK
> [   10.121774] raid6test: test_disks(31, 49): faila=3D 31(D)  failb=3D 49=
(D)  OK
> [   10.123121] raid6test: test_disks(31, 50): faila=3D 31(D)  failb=3D 50=
(D)  OK
> [   10.124464] raid6test: test_disks(31, 51): faila=3D 31(D)  failb=3D 51=
(D)  OK
> [   10.125972] raid6test: test_disks(31, 52): faila=3D 31(D)  failb=3D 52=
(D)  OK
> [   10.127292] raid6test: test_disks(31, 53): faila=3D 31(D)  failb=3D 53=
(D)  OK
> [   10.128625] raid6test: test_disks(31, 54): faila=3D 31(D)  failb=3D 54=
(D)  OK
> [   10.129968] raid6test: test_disks(31, 55): faila=3D 31(D)  failb=3D 55=
(D)  OK
> [   10.144334] raid6test: test_disks(31, 56): faila=3D 31(D)  failb=3D 56=
(D)  OK
> [   10.145695] raid6test: test_disks(31, 57): faila=3D 31(D)  failb=3D 57=
(D)  OK
> [   10.147038] raid6test: test_disks(31, 58): faila=3D 31(D)  failb=3D 58=
(D)  OK
> [   10.148379] raid6test: test_disks(31, 59): faila=3D 31(D)  failb=3D 59=
(D)  OK
> [   10.149721] raid6test: test_disks(31, 60): faila=3D 31(D)  failb=3D 60=
(D)  OK
> [   10.151102] raid6test: test_disks(31, 61): faila=3D 31(D)  failb=3D 61=
(D)  OK
> [   10.152442] raid6test: test_disks(31, 62): faila=3D 31(D)  failb=3D 62=
(P)  OK
> [   10.153787] raid6test: test_disks(31, 63): faila=3D 31(D)  failb=3D 63=
(Q)  OK
> [   10.155141] raid6test: test_disks(32, 33): faila=3D 32(D)  failb=3D 33=
(D)  OK
> [   10.156713] raid6test: test_disks(32, 34): faila=3D 32(D)  failb=3D 34=
(D)  OK
> [   10.158061] raid6test: test_disks(32, 35): faila=3D 32(D)  failb=3D 35=
(D)  OK
> [   10.159409] raid6test: test_disks(32, 36): faila=3D 32(D)  failb=3D 36=
(D)  OK
> [   10.160746] raid6test: test_disks(32, 37): faila=3D 32(D)  failb=3D 37=
(D)  OK
> [   10.162016] raid6test: test_disks(32, 38): faila=3D 32(D)  failb=3D 38=
(D)  OK
> [   10.163266] raid6test: test_disks(32, 39): faila=3D 32(D)  failb=3D 39=
(D)  OK
> [   10.164605] raid6test: test_disks(32, 40): faila=3D 32(D)  failb=3D 40=
(D)  OK
> [   10.166049] raid6test: test_disks(32, 41): faila=3D 32(D)  failb=3D 41=
(D)  OK
> [   10.167393] raid6test: test_disks(32, 42): faila=3D 32(D)  failb=3D 42=
(D)  OK
> [   10.168735] raid6test: test_disks(32, 43): faila=3D 32(D)  failb=3D 43=
(D)  OK
> [   10.170083] raid6test: test_disks(32, 44): faila=3D 32(D)  failb=3D 44=
(D)  OK
> [   10.171507] raid6test: test_disks(32, 45): faila=3D 32(D)  failb=3D 45=
(D)  OK
> [   10.172858] raid6test: test_disks(32, 46): faila=3D 32(D)  failb=3D 46=
(D)  OK
> [   10.174202] raid6test: test_disks(32, 47): faila=3D 32(D)  failb=3D 47=
(D)  OK
> [   10.175546] raid6test: test_disks(32, 48): faila=3D 32(D)  failb=3D 48=
(D)  OK
> [   10.177007] raid6test: test_disks(32, 49): faila=3D 32(D)  failb=3D 49=
(D)  OK
> [   10.178350] raid6test: test_disks(32, 50): faila=3D 32(D)  failb=3D 50=
(D)  OK
> [   10.179591] raid6test: test_disks(32, 51): faila=3D 32(D)  failb=3D 51=
(D)  OK
> [   10.181036] raid6test: test_disks(32, 52): faila=3D 32(D)  failb=3D 52=
(D)  OK
> [   10.182381] raid6test: test_disks(32, 53): faila=3D 32(D)  failb=3D 53=
(D)  OK
> [   10.183592] raid6test: test_disks(32, 54): faila=3D 32(D)  failb=3D 54=
(D)  OK
> [   10.184946] raid6test: test_disks(32, 55): faila=3D 32(D)  failb=3D 55=
(D)  OK
> [   10.186386] raid6test: test_disks(32, 56): faila=3D 32(D)  failb=3D 56=
(D)  OK
> [   10.187681] raid6test: test_disks(32, 57): faila=3D 32(D)  failb=3D 57=
(D)  OK
> [   10.189030] raid6test: test_disks(32, 58): faila=3D 32(D)  failb=3D 58=
(D)  OK
> [   10.190376] raid6test: test_disks(32, 59): faila=3D 32(D)  failb=3D 59=
(D)  OK
> [   10.191803] raid6test: test_disks(32, 60): faila=3D 32(D)  failb=3D 60=
(D)  OK
> [   10.193149] raid6test: test_disks(32, 61): faila=3D 32(D)  failb=3D 61=
(D)  OK
> [   10.194489] raid6test: test_disks(32, 62): faila=3D 32(D)  failb=3D 62=
(P)  OK
> [   10.195998] raid6test: test_disks(32, 63): faila=3D 32(D)  failb=3D 63=
(Q)  OK
> [   10.197345] raid6test: test_disks(33, 34): faila=3D 33(D)  failb=3D 34=
(D)  OK
> [   10.198680] raid6test: test_disks(33, 35): faila=3D 33(D)  failb=3D 35=
(D)  OK
> [   10.199892] raid6test: test_disks(33, 36): faila=3D 33(D)  failb=3D 36=
(D)  OK
> [   10.201329] raid6test: test_disks(33, 37): faila=3D 33(D)  failb=3D 37=
(D)  OK
> [   10.202675] raid6test: test_disks(33, 38): faila=3D 33(D)  failb=3D 38=
(D)  OK
> [   10.203883] raid6test: test_disks(33, 39): faila=3D 33(D)  failb=3D 39=
(D)  OK
> [   10.205235] raid6test: test_disks(33, 40): faila=3D 33(D)  failb=3D 40=
(D)  OK
> [   10.206708] raid6test: test_disks(33, 41): faila=3D 33(D)  failb=3D 41=
(D)  OK
> [   10.207875] raid6test: test_disks(33, 42): faila=3D 33(D)  failb=3D 42=
(D)  OK
> [   10.209212] raid6test: test_disks(33, 43): faila=3D 33(D)  failb=3D 43=
(D)  OK
> [   10.210550] raid6test: test_disks(33, 44): faila=3D 33(D)  failb=3D 44=
(D)  OK
> [   10.211963] raid6test: test_disks(33, 45): faila=3D 33(D)  failb=3D 45=
(D)  OK
> [   10.213311] raid6test: test_disks(33, 46): faila=3D 33(D)  failb=3D 46=
(D)  OK
> [   10.214655] raid6test: test_disks(33, 47): faila=3D 33(D)  failb=3D 47=
(D)  OK
> [   10.217562] raid6test: test_disks(33, 48): faila=3D 33(D)  failb=3D 48=
(D)  OK
> [   10.218910] raid6test: test_disks(33, 49): faila=3D 33(D)  failb=3D 49=
(D)  OK
> [   10.220248] raid6test: test_disks(33, 50): faila=3D 33(D)  failb=3D 50=
(D)  OK
> [   10.221679] raid6test: test_disks(33, 51): faila=3D 33(D)  failb=3D 51=
(D)  OK
> [   10.222994] raid6test: test_disks(33, 52): faila=3D 33(D)  failb=3D 52=
(D)  OK
> [   10.224316] raid6test: test_disks(33, 53): faila=3D 33(D)  failb=3D 53=
(D)  OK
> [   10.225656] raid6test: test_disks(33, 54): faila=3D 33(D)  failb=3D 54=
(D)  OK
> [   10.227177] raid6test: test_disks(33, 55): faila=3D 33(D)  failb=3D 55=
(D)  OK
> [   10.228519] raid6test: test_disks(33, 56): faila=3D 33(D)  failb=3D 56=
(D)  OK
> [   10.229867] raid6test: test_disks(33, 57): faila=3D 33(D)  failb=3D 57=
(D)  OK
> [   10.231247] raid6test: test_disks(33, 58): faila=3D 33(D)  failb=3D 58=
(D)  OK
> [   10.232522] raid6test: test_disks(33, 59): faila=3D 33(D)  failb=3D 59=
(D)  OK
> [   10.233877] raid6test: test_disks(33, 60): faila=3D 33(D)  failb=3D 60=
(D)  OK
> [   10.235193] raid6test: test_disks(33, 61): faila=3D 33(D)  failb=3D 61=
(D)  OK
> [   10.236447] raid6test: test_disks(33, 62): faila=3D 33(D)  failb=3D 62=
(P)  OK
> [   10.237791] raid6test: test_disks(33, 63): faila=3D 33(D)  failb=3D 63=
(Q)  OK
> [   10.239140] raid6test: test_disks(34, 35): faila=3D 34(D)  failb=3D 35=
(D)  OK
> [   10.240482] raid6test: test_disks(34, 36): faila=3D 34(D)  failb=3D 36=
(D)  OK
> [   10.241907] raid6test: test_disks(34, 37): faila=3D 34(D)  failb=3D 37=
(D)  OK
> [   10.243260] raid6test: test_disks(34, 38): faila=3D 34(D)  failb=3D 38=
(D)  OK
> [   10.244608] raid6test: test_disks(34, 39): faila=3D 34(D)  failb=3D 39=
(D)  OK
> [   10.246098] raid6test: test_disks(34, 40): faila=3D 34(D)  failb=3D 40=
(D)  OK
> [   10.247446] raid6test: test_disks(34, 41): faila=3D 34(D)  failb=3D 41=
(D)  OK
> [   10.248787] raid6test: test_disks(34, 42): faila=3D 34(D)  failb=3D 42=
(D)  OK
> [   10.250133] raid6test: test_disks(34, 43): faila=3D 34(D)  failb=3D 43=
(D)  OK
> [   10.251563] raid6test: test_disks(34, 44): faila=3D 34(D)  failb=3D 44=
(D)  OK
> [   10.252914] raid6test: test_disks(34, 45): faila=3D 34(D)  failb=3D 45=
(D)  OK
> [   10.254259] raid6test: test_disks(34, 46): faila=3D 34(D)  failb=3D 46=
(D)  OK
> [   10.255597] raid6test: test_disks(34, 47): faila=3D 34(D)  failb=3D 47=
(D)  OK
> [   10.256944] raid6test: test_disks(34, 48): faila=3D 34(D)  failb=3D 48=
(D)  OK
> [   10.258285] raid6test: test_disks(34, 49): faila=3D 34(D)  failb=3D 49=
(D)  OK
> [   10.259628] raid6test: test_disks(34, 50): faila=3D 34(D)  failb=3D 50=
(D)  OK
> [   10.261055] raid6test: test_disks(34, 51): faila=3D 34(D)  failb=3D 51=
(D)  OK
> [   10.262403] raid6test: test_disks(34, 52): faila=3D 34(D)  failb=3D 52=
(D)  OK
> [   10.263749] raid6test: test_disks(34, 53): faila=3D 34(D)  failb=3D 53=
(D)  OK
> [   10.265095] raid6test: test_disks(34, 54): faila=3D 34(D)  failb=3D 54=
(D)  OK
> [   10.266581] raid6test: test_disks(34, 55): faila=3D 34(D)  failb=3D 55=
(D)  OK
> [   10.267930] raid6test: test_disks(34, 56): faila=3D 34(D)  failb=3D 56=
(D)  OK
> [   10.269283] raid6test: test_disks(34, 57): faila=3D 34(D)  failb=3D 57=
(D)  OK
> [   10.270623] raid6test: test_disks(34, 58): faila=3D 34(D)  failb=3D 58=
(D)  OK
> [   10.272049] raid6test: test_disks(34, 59): faila=3D 34(D)  failb=3D 59=
(D)  OK
> [   10.273396] raid6test: test_disks(34, 60): faila=3D 34(D)  failb=3D 60=
(D)  OK
> [   10.274733] raid6test: test_disks(34, 61): faila=3D 34(D)  failb=3D 61=
(D)  OK
> [   10.276208] raid6test: test_disks(34, 62): faila=3D 34(D)  failb=3D 62=
(P)  OK
> [   10.277548] raid6test: test_disks(34, 63): faila=3D 34(D)  failb=3D 63=
(Q)  OK
> [   10.278883] raid6test: test_disks(35, 36): faila=3D 35(D)  failb=3D 36=
(D)  OK
> [   10.280160] raid6test: test_disks(35, 37): faila=3D 35(D)  failb=3D 37=
(D)  OK
> [   10.281576] raid6test: test_disks(35, 38): faila=3D 35(D)  failb=3D 38=
(D)  OK
> [   10.282892] raid6test: test_disks(35, 39): faila=3D 35(D)  failb=3D 39=
(D)  OK
> [   10.284206] raid6test: test_disks(35, 40): faila=3D 35(D)  failb=3D 40=
(D)  OK
> [   10.285548] raid6test: test_disks(35, 41): faila=3D 35(D)  failb=3D 41=
(D)  OK
> [   10.286889] raid6test: test_disks(35, 42): faila=3D 35(D)  failb=3D 42=
(D)  OK
> [   10.288111] raid6test: test_disks(35, 43): faila=3D 35(D)  failb=3D 43=
(D)  OK
> [   10.289456] raid6test: test_disks(35, 44): faila=3D 35(D)  failb=3D 44=
(D)  OK
> [   10.290875] raid6test: test_disks(35, 45): faila=3D 35(D)  failb=3D 45=
(D)  OK
> [   10.292223] raid6test: test_disks(35, 46): faila=3D 35(D)  failb=3D 46=
(D)  OK
> [   10.293561] raid6test: test_disks(35, 47): faila=3D 35(D)  failb=3D 47=
(D)  OK
> [   10.294881] raid6test: test_disks(35, 48): faila=3D 35(D)  failb=3D 48=
(D)  OK
> [   10.296120] raid6test: test_disks(35, 49): faila=3D 35(D)  failb=3D 49=
(D)  OK
> [   10.297463] raid6test: test_disks(35, 50): faila=3D 35(D)  failb=3D 50=
(D)  OK
> [   10.298793] raid6test: test_disks(35, 51): faila=3D 35(D)  failb=3D 51=
(D)  OK
> [   10.300105] raid6test: test_disks(35, 52): faila=3D 35(D)  failb=3D 52=
(D)  OK
> [   10.301521] raid6test: test_disks(35, 53): faila=3D 35(D)  failb=3D 53=
(D)  OK
> [   10.302841] raid6test: test_disks(35, 54): faila=3D 35(D)  failb=3D 54=
(D)  OK
> [   10.304069] raid6test: test_disks(35, 55): faila=3D 35(D)  failb=3D 55=
(D)  OK
> [   10.305419] raid6test: test_disks(35, 56): faila=3D 35(D)  failb=3D 56=
(D)  OK
> [   10.306891] raid6test: test_disks(35, 57): faila=3D 35(D)  failb=3D 57=
(D)  OK
> [   10.308208] raid6test: test_disks(35, 58): faila=3D 35(D)  failb=3D 58=
(D)  OK
> [   10.309546] raid6test: test_disks(35, 59): faila=3D 35(D)  failb=3D 59=
(D)  OK
> [   10.310976] raid6test: test_disks(35, 60): faila=3D 35(D)  failb=3D 60=
(D)  OK
> [   10.312322] raid6test: test_disks(35, 61): faila=3D 35(D)  failb=3D 61=
(D)  OK
> [   10.313664] raid6test: test_disks(35, 62): faila=3D 35(D)  failb=3D 62=
(P)  OK
> [   10.315018] raid6test: test_disks(35, 63): faila=3D 35(D)  failb=3D 63=
(Q)  OK
> [   10.316363] raid6test: test_disks(36, 37): faila=3D 36(D)  failb=3D 37=
(D)  OK
> [   10.317704] raid6test: test_disks(36, 38): faila=3D 36(D)  failb=3D 38=
(D)  OK
> [   10.319056] raid6test: test_disks(36, 39): faila=3D 36(D)  failb=3D 39=
(D)  OK
> [   10.320396] raid6test: test_disks(36, 40): faila=3D 36(D)  failb=3D 40=
(D)  OK
> [   10.321806] raid6test: test_disks(36, 41): faila=3D 36(D)  failb=3D 41=
(D)  OK
> [   10.323146] raid6test: test_disks(36, 42): faila=3D 36(D)  failb=3D 42=
(D)  OK
> [   10.324492] raid6test: test_disks(36, 43): faila=3D 36(D)  failb=3D 43=
(D)  OK
> [   10.325967] raid6test: test_disks(36, 44): faila=3D 36(D)  failb=3D 44=
(D)  OK
> [   10.327320] raid6test: test_disks(36, 45): faila=3D 36(D)  failb=3D 45=
(D)  OK
> [   10.328659] raid6test: test_disks(36, 46): faila=3D 36(D)  failb=3D 46=
(D)  OK
> [   10.330008] raid6test: test_disks(36, 47): faila=3D 36(D)  failb=3D 47=
(D)  OK
> [   10.331327] raid6test: test_disks(36, 48): faila=3D 36(D)  failb=3D 48=
(D)  OK
> [   10.332603] raid6test: test_disks(36, 49): faila=3D 36(D)  failb=3D 49=
(D)  OK
> [   10.333915] raid6test: test_disks(36, 50): faila=3D 36(D)  failb=3D 50=
(D)  OK
> [   10.335134] raid6test: test_disks(36, 51): faila=3D 36(D)  failb=3D 51=
(D)  OK
> [   10.336602] raid6test: test_disks(36, 52): faila=3D 36(D)  failb=3D 52=
(D)  OK
> [   10.337949] raid6test: test_disks(36, 53): faila=3D 36(D)  failb=3D 53=
(D)  OK
> [   10.339246] raid6test: test_disks(36, 54): faila=3D 36(D)  failb=3D 54=
(D)  OK
> [   10.340586] raid6test: test_disks(36, 55): faila=3D 36(D)  failb=3D 55=
(D)  OK
> [   10.342014] raid6test: test_disks(36, 56): faila=3D 36(D)  failb=3D 56=
(D)  OK
> [   10.343280] raid6test: test_disks(36, 57): faila=3D 36(D)  failb=3D 57=
(D)  OK
> [   10.344460] raid6test: test_disks(36, 58): faila=3D 36(D)  failb=3D 58=
(D)  OK
> [   10.345808] raid6test: test_disks(36, 59): faila=3D 36(D)  failb=3D 59=
(D)  OK
> [   10.347096] raid6test: test_disks(36, 60): faila=3D 36(D)  failb=3D 60=
(D)  OK
> [   10.348385] raid6test: test_disks(36, 61): faila=3D 36(D)  failb=3D 61=
(D)  OK
> [   10.349720] raid6test: test_disks(36, 62): faila=3D 36(D)  failb=3D 62=
(P)  OK
> [   10.351144] raid6test: test_disks(36, 63): faila=3D 36(D)  failb=3D 63=
(Q)  OK
> [   10.352489] raid6test: test_disks(37, 38): faila=3D 37(D)  failb=3D 38=
(D)  OK
> [   10.353827] raid6test: test_disks(37, 39): faila=3D 37(D)  failb=3D 39=
(D)  OK
> [   10.355172] raid6test: test_disks(37, 40): faila=3D 37(D)  failb=3D 40=
(D)  OK
> [   10.356519] raid6test: test_disks(37, 41): faila=3D 37(D)  failb=3D 41=
(D)  OK
> [   10.357868] raid6test: test_disks(37, 42): faila=3D 37(D)  failb=3D 42=
(D)  OK
> [   10.359219] raid6test: test_disks(37, 43): faila=3D 37(D)  failb=3D 43=
(D)  OK
> [   10.360562] raid6test: test_disks(37, 44): faila=3D 37(D)  failb=3D 44=
(D)  OK
> [   10.361978] raid6test: test_disks(37, 45): faila=3D 37(D)  failb=3D 45=
(D)  OK
> [   10.363325] raid6test: test_disks(37, 46): faila=3D 37(D)  failb=3D 46=
(D)  OK
> [   10.364668] raid6test: test_disks(37, 47): faila=3D 37(D)  failb=3D 47=
(D)  OK
> [   10.366149] raid6test: test_disks(37, 48): faila=3D 37(D)  failb=3D 48=
(D)  OK
> [   10.367495] raid6test: test_disks(37, 49): faila=3D 37(D)  failb=3D 49=
(D)  OK
> [   10.368836] raid6test: test_disks(37, 50): faila=3D 37(D)  failb=3D 50=
(D)  OK
> [   10.370172] raid6test: test_disks(37, 51): faila=3D 37(D)  failb=3D 51=
(D)  OK
> [   10.371590] raid6test: test_disks(37, 52): faila=3D 37(D)  failb=3D 52=
(D)  OK
> [   10.372948] raid6test: test_disks(37, 53): faila=3D 37(D)  failb=3D 53=
(D)  OK
> [   10.374290] raid6test: test_disks(37, 54): faila=3D 37(D)  failb=3D 54=
(D)  OK
> [   10.375520] raid6test: test_disks(37, 55): faila=3D 37(D)  failb=3D 55=
(D)  OK
> [   10.376938] raid6test: test_disks(37, 56): faila=3D 37(D)  failb=3D 56=
(D)  OK
> [   10.378282] raid6test: test_disks(37, 57): faila=3D 37(D)  failb=3D 57=
(D)  OK
> [   10.379520] raid6test: test_disks(37, 58): faila=3D 37(D)  failb=3D 58=
(D)  OK
> [   10.380948] raid6test: test_disks(37, 59): faila=3D 37(D)  failb=3D 59=
(D)  OK
> [   10.382297] raid6test: test_disks(37, 60): faila=3D 37(D)  failb=3D 60=
(D)  OK
> [   10.383522] raid6test: test_disks(37, 61): faila=3D 37(D)  failb=3D 61=
(D)  OK
> [   10.384841] raid6test: test_disks(37, 62): faila=3D 37(D)  failb=3D 62=
(P)  OK
> [   10.386256] raid6test: test_disks(37, 63): faila=3D 37(D)  failb=3D 63=
(Q)  OK
> [   10.387587] raid6test: test_disks(38, 39): faila=3D 38(D)  failb=3D 39=
(D)  OK
> [   10.388940] raid6test: test_disks(38, 40): faila=3D 38(D)  failb=3D 40=
(D)  OK
> [   10.390291] raid6test: test_disks(38, 41): faila=3D 38(D)  failb=3D 41=
(D)  OK
> [   10.391618] raid6test: test_disks(38, 42): faila=3D 38(D)  failb=3D 42=
(D)  OK
> [   10.392969] raid6test: test_disks(38, 43): faila=3D 38(D)  failb=3D 43=
(D)  OK
> [   10.394312] raid6test: test_disks(38, 44): faila=3D 38(D)  failb=3D 44=
(D)  OK
> [   10.395529] raid6test: test_disks(38, 45): faila=3D 38(D)  failb=3D 45=
(D)  OK
> [   10.397002] raid6test: test_disks(38, 46): faila=3D 38(D)  failb=3D 46=
(D)  OK
> [   10.398343] raid6test: test_disks(38, 47): faila=3D 38(D)  failb=3D 47=
(D)  OK
> [   10.399561] raid6test: test_disks(38, 48): faila=3D 38(D)  failb=3D 48=
(D)  OK
> [   10.400984] raid6test: test_disks(38, 49): faila=3D 38(D)  failb=3D 49=
(D)  OK
> [   10.402333] raid6test: test_disks(38, 50): faila=3D 38(D)  failb=3D 50=
(D)  OK
> [   10.403658] raid6test: test_disks(38, 51): faila=3D 38(D)  failb=3D 51=
(D)  OK
> [   10.405005] raid6test: test_disks(38, 52): faila=3D 38(D)  failb=3D 52=
(D)  OK
> [   10.406346] raid6test: test_disks(38, 53): faila=3D 38(D)  failb=3D 53=
(D)  OK
> [   10.407561] raid6test: test_disks(38, 54): faila=3D 38(D)  failb=3D 54=
(D)  OK
> [   10.408915] raid6test: test_disks(38, 55): faila=3D 38(D)  failb=3D 55=
(D)  OK
> [   10.410255] raid6test: test_disks(38, 56): faila=3D 38(D)  failb=3D 56=
(D)  OK
> [   10.411599] raid6test: test_disks(38, 57): faila=3D 38(D)  failb=3D 57=
(D)  OK
> [   10.412958] raid6test: test_disks(38, 58): faila=3D 38(D)  failb=3D 58=
(D)  OK
> [   10.414306] raid6test: test_disks(38, 59): faila=3D 38(D)  failb=3D 59=
(D)  OK
> [   10.415626] raid6test: test_disks(38, 60): faila=3D 38(D)  failb=3D 60=
(D)  OK
> [   10.416979] raid6test: test_disks(38, 61): faila=3D 38(D)  failb=3D 61=
(D)  OK
> [   10.418312] raid6test: test_disks(38, 62): faila=3D 38(D)  failb=3D 62=
(P)  OK
> [   10.419652] raid6test: test_disks(38, 63): faila=3D 38(D)  failb=3D 63=
(Q)  OK
> [   10.421044] raid6test: test_disks(39, 40): faila=3D 39(D)  failb=3D 40=
(D)  OK
> [   10.422395] raid6test: test_disks(39, 41): faila=3D 39(D)  failb=3D 41=
(D)  OK
> [   10.423636] raid6test: test_disks(39, 42): faila=3D 39(D)  failb=3D 42=
(D)  OK
> [   10.424986] raid6test: test_disks(39, 43): faila=3D 39(D)  failb=3D 43=
(D)  OK
> [   10.426505] raid6test: test_disks(39, 44): faila=3D 39(D)  failb=3D 44=
(D)  OK
> [   10.427795] raid6test: test_disks(39, 45): faila=3D 39(D)  failb=3D 45=
(D)  OK
> [   10.429133] raid6test: test_disks(39, 46): faila=3D 39(D)  failb=3D 46=
(D)  OK
> [   10.430480] raid6test: test_disks(39, 47): faila=3D 39(D)  failb=3D 47=
(D)  OK
> [   10.431845] raid6test: test_disks(39, 48): faila=3D 39(D)  failb=3D 48=
(D)  OK
> [   10.433199] raid6test: test_disks(39, 49): faila=3D 39(D)  failb=3D 49=
(D)  OK
> [   10.434538] raid6test: test_disks(39, 50): faila=3D 39(D)  failb=3D 50=
(D)  OK
> [   10.435705] raid6test: test_disks(39, 51): faila=3D 39(D)  failb=3D 51=
(D)  OK
> [   10.437056] raid6test: test_disks(39, 52): faila=3D 39(D)  failb=3D 52=
(D)  OK
> [   10.438401] raid6test: test_disks(39, 53): faila=3D 39(D)  failb=3D 53=
(D)  OK
> [   10.439579] raid6test: test_disks(39, 54): faila=3D 39(D)  failb=3D 54=
(D)  OK
> [   10.440967] raid6test: test_disks(39, 55): faila=3D 39(D)  failb=3D 55=
(D)  OK
> [   10.442275] raid6test: test_disks(39, 56): faila=3D 39(D)  failb=3D 56=
(D)  OK
> [   10.443602] raid6test: test_disks(39, 57): faila=3D 39(D)  failb=3D 57=
(D)  OK
> [   10.444907] raid6test: test_disks(39, 58): faila=3D 39(D)  failb=3D 58=
(D)  OK
> [   10.446245] raid6test: test_disks(39, 59): faila=3D 39(D)  failb=3D 59=
(D)  OK
> [   10.447590] raid6test: test_disks(39, 60): faila=3D 39(D)  failb=3D 60=
(D)  OK
> [   10.448937] raid6test: test_disks(39, 61): faila=3D 39(D)  failb=3D 61=
(D)  OK
> [   10.450274] raid6test: test_disks(39, 62): faila=3D 39(D)  failb=3D 62=
(P)  OK
> [   10.451697] raid6test: test_disks(39, 63): faila=3D 39(D)  failb=3D 63=
(Q)  OK
> [   10.453027] raid6test: test_disks(40, 41): faila=3D 40(D)  failb=3D 41=
(D)  OK
> [   10.454373] raid6test: test_disks(40, 42): faila=3D 40(D)  failb=3D 42=
(D)  OK
> [   10.455872] raid6test: test_disks(40, 43): faila=3D 40(D)  failb=3D 43=
(D)  OK
> [   10.457227] raid6test: test_disks(40, 44): faila=3D 40(D)  failb=3D 44=
(D)  OK
> [   10.458579] raid6test: test_disks(40, 45): faila=3D 40(D)  failb=3D 45=
(D)  OK
> [   10.459928] raid6test: test_disks(40, 46): faila=3D 40(D)  failb=3D 46=
(D)  OK
> [   10.461351] raid6test: test_disks(40, 47): faila=3D 40(D)  failb=3D 47=
(D)  OK
> [   10.462665] raid6test: test_disks(40, 48): faila=3D 40(D)  failb=3D 48=
(D)  OK
> [   10.463985] raid6test: test_disks(40, 49): faila=3D 40(D)  failb=3D 49=
(D)  OK
> [   10.465330] raid6test: test_disks(40, 50): faila=3D 40(D)  failb=3D 50=
(D)  OK
> [   10.466776] raid6test: test_disks(40, 51): faila=3D 40(D)  failb=3D 51=
(D)  OK
> [   10.468123] raid6test: test_disks(40, 52): faila=3D 40(D)  failb=3D 52=
(D)  OK
> [   10.469467] raid6test: test_disks(40, 53): faila=3D 40(D)  failb=3D 53=
(D)  OK
> [   10.470866] raid6test: test_disks(40, 54): faila=3D 40(D)  failb=3D 54=
(D)  OK
> [   10.472179] raid6test: test_disks(40, 55): faila=3D 40(D)  failb=3D 55=
(D)  OK
> [   10.473520] raid6test: test_disks(40, 56): faila=3D 40(D)  failb=3D 56=
(D)  OK
> [   10.474861] raid6test: test_disks(40, 57): faila=3D 40(D)  failb=3D 57=
(D)  OK
> [   10.476313] raid6test: test_disks(40, 58): faila=3D 40(D)  failb=3D 58=
(D)  OK
> [   10.477660] raid6test: test_disks(40, 59): faila=3D 40(D)  failb=3D 59=
(D)  OK
> [   10.479004] raid6test: test_disks(40, 60): faila=3D 40(D)  failb=3D 60=
(D)  OK
> [   10.480347] raid6test: test_disks(40, 61): faila=3D 40(D)  failb=3D 61=
(D)  OK
> [   10.481777] raid6test: test_disks(40, 62): faila=3D 40(D)  failb=3D 62=
(P)  OK
> [   10.483133] raid6test: test_disks(40, 63): faila=3D 40(D)  failb=3D 63=
(Q)  OK
> [   10.484481] raid6test: test_disks(41, 42): faila=3D 41(D)  failb=3D 42=
(D)  OK
> [   10.485955] raid6test: test_disks(41, 43): faila=3D 41(D)  failb=3D 43=
(D)  OK
> [   10.487245] raid6test: test_disks(41, 44): faila=3D 41(D)  failb=3D 44=
(D)  OK
> [   10.488542] raid6test: test_disks(41, 45): faila=3D 41(D)  failb=3D 45=
(D)  OK
> [   10.489894] raid6test: test_disks(41, 46): faila=3D 41(D)  failb=3D 46=
(D)  OK
> [   10.491315] raid6test: test_disks(41, 47): faila=3D 41(D)  failb=3D 47=
(D)  OK
> [   10.492614] raid6test: test_disks(41, 48): faila=3D 41(D)  failb=3D 48=
(D)  OK
> [   10.493968] raid6test: test_disks(41, 49): faila=3D 41(D)  failb=3D 49=
(D)  OK
> [   10.495310] raid6test: test_disks(41, 50): faila=3D 41(D)  failb=3D 50=
(D)  OK
> [   10.496654] raid6test: test_disks(41, 51): faila=3D 41(D)  failb=3D 51=
(D)  OK
> [   10.498000] raid6test: test_disks(41, 52): faila=3D 41(D)  failb=3D 52=
(D)  OK
> [   10.499333] raid6test: test_disks(41, 53): faila=3D 41(D)  failb=3D 53=
(D)  OK
> [   10.500672] raid6test: test_disks(41, 54): faila=3D 41(D)  failb=3D 54=
(D)  OK
> [   10.502100] raid6test: test_disks(41, 55): faila=3D 41(D)  failb=3D 55=
(D)  OK
> [   10.503420] raid6test: test_disks(41, 56): faila=3D 41(D)  failb=3D 56=
(D)  OK
> [   10.504753] raid6test: test_disks(41, 57): faila=3D 41(D)  failb=3D 57=
(D)  OK
> [   10.506100] raid6test: test_disks(41, 58): faila=3D 41(D)  failb=3D 58=
(D)  OK
> [   10.507376] raid6test: test_disks(41, 59): faila=3D 41(D)  failb=3D 59=
(D)  OK
> [   10.508722] raid6test: test_disks(41, 60): faila=3D 41(D)  failb=3D 60=
(D)  OK
> [   10.510077] raid6test: test_disks(41, 61): faila=3D 41(D)  failb=3D 61=
(D)  OK
> [   10.511402] raid6test: test_disks(41, 62): faila=3D 41(D)  failb=3D 62=
(P)  OK
> [   10.512745] raid6test: test_disks(41, 63): faila=3D 41(D)  failb=3D 63=
(Q)  OK
> [   10.514096] raid6test: test_disks(42, 43): faila=3D 42(D)  failb=3D 43=
(D)  OK
> [   10.515367] raid6test: test_disks(42, 44): faila=3D 42(D)  failb=3D 44=
(D)  OK
> [   10.516865] raid6test: test_disks(42, 45): faila=3D 42(D)  failb=3D 45=
(D)  OK
> [   10.518210] raid6test: test_disks(42, 46): faila=3D 42(D)  failb=3D 46=
(D)  OK
> [   10.519438] raid6test: test_disks(42, 47): faila=3D 42(D)  failb=3D 47=
(D)  OK
> [   10.520864] raid6test: test_disks(42, 48): faila=3D 42(D)  failb=3D 48=
(D)  OK
> [   10.522211] raid6test: test_disks(42, 49): faila=3D 42(D)  failb=3D 49=
(D)  OK
> [   10.523433] raid6test: test_disks(42, 50): faila=3D 42(D)  failb=3D 50=
(D)  OK
> [   10.524771] raid6test: test_disks(42, 51): faila=3D 42(D)  failb=3D 51=
(D)  OK
> [   10.526246] raid6test: test_disks(42, 52): faila=3D 42(D)  failb=3D 52=
(D)  OK
> [   10.527585] raid6test: test_disks(42, 53): faila=3D 42(D)  failb=3D 53=
(D)  OK
> [   10.528935] raid6test: test_disks(42, 54): faila=3D 42(D)  failb=3D 54=
(D)  OK
> [   10.530279] raid6test: test_disks(42, 55): faila=3D 42(D)  failb=3D 55=
(D)  OK
> [   10.531574] raid6test: test_disks(42, 56): faila=3D 42(D)  failb=3D 56=
(D)  OK
> [   10.532925] raid6test: test_disks(42, 57): faila=3D 42(D)  failb=3D 57=
(D)  OK
> [   10.534259] raid6test: test_disks(42, 58): faila=3D 42(D)  failb=3D 58=
(D)  OK
> [   10.535466] raid6test: test_disks(42, 59): faila=3D 42(D)  failb=3D 59=
(D)  OK
> [   10.536812] raid6test: test_disks(42, 60): faila=3D 42(D)  failb=3D 60=
(D)  OK
> [   10.538153] raid6test: test_disks(42, 61): faila=3D 42(D)  failb=3D 61=
(D)  OK
> [   10.539383] raid6test: test_disks(42, 62): faila=3D 42(D)  failb=3D 62=
(P)  OK
> [   10.540670] raid6test: test_disks(42, 63): faila=3D 42(D)  failb=3D 63=
(Q)  OK
> [   10.542093] raid6test: test_disks(43, 44): faila=3D 43(D)  failb=3D 44=
(D)  OK
> [   10.543346] raid6test: test_disks(43, 45): faila=3D 43(D)  failb=3D 45=
(D)  OK
> [   10.544648] raid6test: test_disks(43, 46): faila=3D 43(D)  failb=3D 46=
(D)  OK
> [   10.546127] raid6test: test_disks(43, 47): faila=3D 43(D)  failb=3D 47=
(D)  OK
> [   10.547481] raid6test: test_disks(43, 48): faila=3D 43(D)  failb=3D 48=
(D)  OK
> [   10.548824] raid6test: test_disks(43, 49): faila=3D 43(D)  failb=3D 49=
(D)  OK
> [   10.550169] raid6test: test_disks(43, 50): faila=3D 43(D)  failb=3D 50=
(D)  OK
> [   10.551593] raid6test: test_disks(43, 51): faila=3D 43(D)  failb=3D 51=
(D)  OK
> [   10.552947] raid6test: test_disks(43, 52): faila=3D 43(D)  failb=3D 52=
(D)  OK
> [   10.554286] raid6test: test_disks(43, 53): faila=3D 43(D)  failb=3D 53=
(D)  OK
> [   10.555625] raid6test: test_disks(43, 54): faila=3D 43(D)  failb=3D 54=
(D)  OK
> [   10.556879] raid6test: test_disks(43, 55): faila=3D 43(D)  failb=3D 55=
(D)  OK
> [   10.558062] raid6test: test_disks(43, 56): faila=3D 43(D)  failb=3D 56=
(D)  OK
> [   10.559326] raid6test: test_disks(43, 57): faila=3D 43(D)  failb=3D 57=
(D)  OK
> [   10.560668] raid6test: test_disks(43, 58): faila=3D 43(D)  failb=3D 58=
(D)  OK
> [   10.562100] raid6test: test_disks(43, 59): faila=3D 43(D)  failb=3D 59=
(D)  OK
> [   10.563445] raid6test: test_disks(43, 60): faila=3D 43(D)  failb=3D 60=
(D)  OK
> [   10.564791] raid6test: test_disks(43, 61): faila=3D 43(D)  failb=3D 61=
(D)  OK
> [   10.566273] raid6test: test_disks(43, 62): faila=3D 43(D)  failb=3D 62=
(P)  OK
> [   10.567622] raid6test: test_disks(43, 63): faila=3D 43(D)  failb=3D 63=
(Q)  OK
> [   10.568976] raid6test: test_disks(44, 45): faila=3D 44(D)  failb=3D 45=
(D)  OK
> [   10.570319] raid6test: test_disks(44, 46): faila=3D 44(D)  failb=3D 46=
(D)  OK
> [   10.571753] raid6test: test_disks(44, 47): faila=3D 44(D)  failb=3D 47=
(D)  OK
> [   10.573127] raid6test: test_disks(44, 48): faila=3D 44(D)  failb=3D 48=
(D)  OK
> [   10.574466] raid6test: test_disks(44, 49): faila=3D 44(D)  failb=3D 49=
(D)  OK
> [   10.575934] raid6test: test_disks(44, 50): faila=3D 44(D)  failb=3D 50=
(D)  OK
> [   10.577285] raid6test: test_disks(44, 51): faila=3D 44(D)  failb=3D 51=
(D)  OK
> [   10.578628] raid6test: test_disks(44, 52): faila=3D 44(D)  failb=3D 52=
(D)  OK
> [   10.579867] raid6test: test_disks(44, 53): faila=3D 44(D)  failb=3D 53=
(D)  OK
> [   10.581285] raid6test: test_disks(44, 54): faila=3D 44(D)  failb=3D 54=
(D)  OK
> [   10.582630] raid6test: test_disks(44, 55): faila=3D 44(D)  failb=3D 55=
(D)  OK
> [   10.583984] raid6test: test_disks(44, 56): faila=3D 44(D)  failb=3D 56=
(D)  OK
> [   10.585332] raid6test: test_disks(44, 57): faila=3D 44(D)  failb=3D 57=
(D)  OK
> [   10.586677] raid6test: test_disks(44, 58): faila=3D 44(D)  failb=3D 58=
(D)  OK
> [   10.588024] raid6test: test_disks(44, 59): faila=3D 44(D)  failb=3D 59=
(D)  OK
> [   10.589368] raid6test: test_disks(44, 60): faila=3D 44(D)  failb=3D 60=
(D)  OK
> [   10.590701] raid6test: test_disks(44, 61): faila=3D 44(D)  failb=3D 61=
(D)  OK
> [   10.592132] raid6test: test_disks(44, 62): faila=3D 44(D)  failb=3D 62=
(P)  OK
> [   10.593476] raid6test: test_disks(44, 63): faila=3D 44(D)  failb=3D 63=
(Q)  OK
> [   10.594812] raid6test: test_disks(45, 46): faila=3D 45(D)  failb=3D 46=
(D)  OK
> [   10.596107] raid6test: test_disks(45, 47): faila=3D 45(D)  failb=3D 47=
(D)  OK
> [   10.597397] raid6test: test_disks(45, 48): faila=3D 45(D)  failb=3D 48=
(D)  OK
> [   10.598731] raid6test: test_disks(45, 49): faila=3D 45(D)  failb=3D 49=
(D)  OK
> [   10.600005] raid6test: test_disks(45, 50): faila=3D 45(D)  failb=3D 50=
(D)  OK
> [   10.601425] raid6test: test_disks(45, 51): faila=3D 45(D)  failb=3D 51=
(D)  OK
> [   10.602754] raid6test: test_disks(45, 52): faila=3D 45(D)  failb=3D 52=
(D)  OK
> [   10.604012] raid6test: test_disks(45, 53): faila=3D 45(D)  failb=3D 53=
(D)  OK
> [   10.605356] raid6test: test_disks(45, 54): faila=3D 45(D)  failb=3D 54=
(D)  OK
> [   10.606834] raid6test: test_disks(45, 55): faila=3D 45(D)  failb=3D 55=
(D)  OK
> [   10.608106] raid6test: test_disks(45, 56): faila=3D 45(D)  failb=3D 56=
(D)  OK
> [   10.609449] raid6test: test_disks(45, 57): faila=3D 45(D)  failb=3D 57=
(D)  OK
> [   10.610876] raid6test: test_disks(45, 58): faila=3D 45(D)  failb=3D 58=
(D)  OK
> [   10.612229] raid6test: test_disks(45, 59): faila=3D 45(D)  failb=3D 59=
(D)  OK
> [   10.613575] raid6test: test_disks(45, 60): faila=3D 45(D)  failb=3D 60=
(D)  OK
> [   10.614917] raid6test: test_disks(45, 61): faila=3D 45(D)  failb=3D 61=
(D)  OK
> [   10.616258] raid6test: test_disks(45, 62): faila=3D 45(D)  failb=3D 62=
(P)  OK
> [   10.617600] raid6test: test_disks(45, 63): faila=3D 45(D)  failb=3D 63=
(Q)  OK
> [   10.618942] raid6test: test_disks(46, 47): faila=3D 46(D)  failb=3D 47=
(D)  OK
> [   10.620285] raid6test: test_disks(46, 48): faila=3D 46(D)  failb=3D 48=
(D)  OK
> [   10.621843] raid6test: test_disks(46, 49): faila=3D 46(D)  failb=3D 49=
(D)  OK
> [   10.623201] raid6test: test_disks(46, 50): faila=3D 46(D)  failb=3D 50=
(D)  OK
> [   10.624541] raid6test: test_disks(46, 51): faila=3D 46(D)  failb=3D 51=
(D)  OK
> [   10.626024] raid6test: test_disks(46, 52): faila=3D 46(D)  failb=3D 52=
(D)  OK
> [   10.627300] raid6test: test_disks(46, 53): faila=3D 46(D)  failb=3D 53=
(D)  OK
> [   10.628641] raid6test: test_disks(46, 54): faila=3D 46(D)  failb=3D 54=
(D)  OK
> [   10.629988] raid6test: test_disks(46, 55): faila=3D 46(D)  failb=3D 55=
(D)  OK
> [   10.631361] raid6test: test_disks(46, 56): faila=3D 46(D)  failb=3D 56=
(D)  OK
> [   10.632711] raid6test: test_disks(46, 57): faila=3D 46(D)  failb=3D 57=
(D)  OK
> [   10.634057] raid6test: test_disks(46, 58): faila=3D 46(D)  failb=3D 58=
(D)  OK
> [   10.635407] raid6test: test_disks(46, 59): faila=3D 46(D)  failb=3D 59=
(D)  OK
> [   10.636907] raid6test: test_disks(46, 60): faila=3D 46(D)  failb=3D 60=
(D)  OK
> [   10.638247] raid6test: test_disks(46, 61): faila=3D 46(D)  failb=3D 61=
(D)  OK
> [   10.639586] raid6test: test_disks(46, 62): faila=3D 46(D)  failb=3D 62=
(P)  OK
> [   10.641093] raid6test: test_disks(46, 63): faila=3D 46(D)  failb=3D 63=
(Q)  OK
> [   10.642445] raid6test: test_disks(47, 48): faila=3D 47(D)  failb=3D 48=
(D)  OK
> [   10.643796] raid6test: test_disks(47, 49): faila=3D 47(D)  failb=3D 49=
(D)  OK
> [   10.645144] raid6test: test_disks(47, 50): faila=3D 47(D)  failb=3D 50=
(D)  OK
> [   10.646490] raid6test: test_disks(47, 51): faila=3D 47(D)  failb=3D 51=
(D)  OK
> [   10.647830] raid6test: test_disks(47, 52): faila=3D 47(D)  failb=3D 52=
(D)  OK
> [   10.649191] raid6test: test_disks(47, 53): faila=3D 47(D)  failb=3D 53=
(D)  OK
> [   10.650538] raid6test: test_disks(47, 54): faila=3D 47(D)  failb=3D 54=
(D)  OK
> [   10.651968] raid6test: test_disks(47, 55): faila=3D 47(D)  failb=3D 55=
(D)  OK
> [   10.653316] raid6test: test_disks(47, 56): faila=3D 47(D)  failb=3D 56=
(D)  OK
> [   10.654527] raid6test: test_disks(47, 57): faila=3D 47(D)  failb=3D 57=
(D)  OK
> [   10.655880] raid6test: test_disks(47, 58): faila=3D 47(D)  failb=3D 58=
(D)  OK
> [   10.657224] raid6test: test_disks(47, 59): faila=3D 47(D)  failb=3D 59=
(D)  OK
> [   10.658571] raid6test: test_disks(47, 60): faila=3D 47(D)  failb=3D 60=
(D)  OK
> [   10.659947] raid6test: test_disks(47, 61): faila=3D 47(D)  failb=3D 61=
(D)  OK
> [   10.661359] raid6test: test_disks(47, 62): faila=3D 47(D)  failb=3D 62=
(P)  OK
> [   10.662703] raid6test: test_disks(47, 63): faila=3D 47(D)  failb=3D 63=
(Q)  OK
> [   10.664058] raid6test: test_disks(48, 49): faila=3D 48(D)  failb=3D 49=
(D)  OK
> [   10.665406] raid6test: test_disks(48, 50): faila=3D 48(D)  failb=3D 50=
(D)  OK
> [   10.666909] raid6test: test_disks(48, 51): faila=3D 48(D)  failb=3D 51=
(D)  OK
> [   10.668252] raid6test: test_disks(48, 52): faila=3D 48(D)  failb=3D 52=
(D)  OK
> [   10.669594] raid6test: test_disks(48, 53): faila=3D 48(D)  failb=3D 53=
(D)  OK
> [   10.671039] raid6test: test_disks(48, 54): faila=3D 48(D)  failb=3D 54=
(D)  OK
> [   10.672389] raid6test: test_disks(48, 55): faila=3D 48(D)  failb=3D 55=
(D)  OK
> [   10.673734] raid6test: test_disks(48, 56): faila=3D 48(D)  failb=3D 56=
(D)  OK
> [   10.675078] raid6test: test_disks(48, 57): faila=3D 48(D)  failb=3D 57=
(D)  OK
> [   10.676542] raid6test: test_disks(48, 58): faila=3D 48(D)  failb=3D 58=
(D)  OK
> [   10.677889] raid6test: test_disks(48, 59): faila=3D 48(D)  failb=3D 59=
(D)  OK
> [   10.679229] raid6test: test_disks(48, 60): faila=3D 48(D)  failb=3D 60=
(D)  OK
> [   10.680565] raid6test: test_disks(48, 61): faila=3D 48(D)  failb=3D 61=
(D)  OK
> [   10.681995] raid6test: test_disks(48, 62): faila=3D 48(D)  failb=3D 62=
(P)  OK
> [   10.683341] raid6test: test_disks(48, 63): faila=3D 48(D)  failb=3D 63=
(Q)  OK
> [   10.684678] raid6test: test_disks(49, 50): faila=3D 49(D)  failb=3D 50=
(D)  OK
> [   10.686023] raid6test: test_disks(49, 51): faila=3D 49(D)  failb=3D 51=
(D)  OK
> [   10.687293] raid6test: test_disks(49, 52): faila=3D 49(D)  failb=3D 52=
(D)  OK
> [   10.688640] raid6test: test_disks(49, 53): faila=3D 49(D)  failb=3D 53=
(D)  OK
> [   10.689984] raid6test: test_disks(49, 54): faila=3D 49(D)  failb=3D 54=
(D)  OK
> [   10.691328] raid6test: test_disks(49, 55): faila=3D 49(D)  failb=3D 55=
(D)  OK
> [   10.692669] raid6test: test_disks(49, 56): faila=3D 49(D)  failb=3D 56=
(D)  OK
> [   10.694015] raid6test: test_disks(49, 57): faila=3D 49(D)  failb=3D 57=
(D)  OK
> [   10.695315] raid6test: test_disks(49, 58): faila=3D 49(D)  failb=3D 58=
(D)  OK
> [   10.696762] raid6test: test_disks(49, 59): faila=3D 49(D)  failb=3D 59=
(D)  OK
> [   10.698103] raid6test: test_disks(49, 60): faila=3D 49(D)  failb=3D 60=
(D)  OK
> [   10.699372] raid6test: test_disks(49, 61): faila=3D 49(D)  failb=3D 61=
(D)  OK
> [   10.700710] raid6test: test_disks(49, 62): faila=3D 49(D)  failb=3D 62=
(P)  OK
> [   10.702144] raid6test: test_disks(49, 63): faila=3D 49(D)  failb=3D 63=
(Q)  OK
> [   10.703425] raid6test: test_disks(50, 51): faila=3D 50(D)  failb=3D 51=
(D)  OK
> [   10.704770] raid6test: test_disks(50, 52): faila=3D 50(D)  failb=3D 52=
(D)  OK
> [   10.706119] raid6test: test_disks(50, 53): faila=3D 50(D)  failb=3D 53=
(D)  OK
> [   10.707376] raid6test: test_disks(50, 54): faila=3D 50(D)  failb=3D 54=
(D)  OK
> [   10.708712] raid6test: test_disks(50, 55): faila=3D 50(D)  failb=3D 55=
(D)  OK
> [   10.710058] raid6test: test_disks(50, 56): faila=3D 50(D)  failb=3D 56=
(D)  OK
> [   10.711466] raid6test: test_disks(50, 57): faila=3D 50(D)  failb=3D 57=
(D)  OK
> [   10.712810] raid6test: test_disks(50, 58): faila=3D 50(D)  failb=3D 58=
(D)  OK
> [   10.714156] raid6test: test_disks(50, 59): faila=3D 50(D)  failb=3D 59=
(D)  OK
> [   10.715503] raid6test: test_disks(50, 60): faila=3D 50(D)  failb=3D 60=
(D)  OK
> [   10.716855] raid6test: test_disks(50, 61): faila=3D 50(D)  failb=3D 61=
(D)  OK
> [   10.718192] raid6test: test_disks(50, 62): faila=3D 50(D)  failb=3D 62=
(P)  OK
> [   10.719547] raid6test: test_disks(50, 63): faila=3D 50(D)  failb=3D 63=
(Q)  OK
> [   10.720898] raid6test: test_disks(51, 52): faila=3D 51(D)  failb=3D 52=
(D)  OK
> [   10.722247] raid6test: test_disks(51, 53): faila=3D 51(D)  failb=3D 53=
(D)  OK
> [   10.723600] raid6test: test_disks(51, 54): faila=3D 51(D)  failb=3D 54=
(D)  OK
> [   10.724947] raid6test: test_disks(51, 55): faila=3D 51(D)  failb=3D 55=
(D)  OK
> [   10.726446] raid6test: test_disks(51, 56): faila=3D 51(D)  failb=3D 56=
(D)  OK
> [   10.727788] raid6test: test_disks(51, 57): faila=3D 51(D)  failb=3D 57=
(D)  OK
> [   10.729139] raid6test: test_disks(51, 58): faila=3D 51(D)  failb=3D 58=
(D)  OK
> [   10.730484] raid6test: test_disks(51, 59): faila=3D 51(D)  failb=3D 59=
(D)  OK
> [   10.731896] raid6test: test_disks(51, 60): faila=3D 51(D)  failb=3D 60=
(D)  OK
> [   10.733241] raid6test: test_disks(51, 61): faila=3D 51(D)  failb=3D 61=
(D)  OK
> [   10.734578] raid6test: test_disks(51, 62): faila=3D 51(D)  failb=3D 62=
(P)  OK
> [   10.735928] raid6test: test_disks(51, 63): faila=3D 51(D)  failb=3D 63=
(Q)  OK
> [   10.737279] raid6test: test_disks(52, 53): faila=3D 52(D)  failb=3D 53=
(D)  OK
> [   10.738624] raid6test: test_disks(52, 54): faila=3D 52(D)  failb=3D 54=
(D)  OK
> [   10.739975] raid6test: test_disks(52, 55): faila=3D 52(D)  failb=3D 55=
(D)  OK
> [   10.741387] raid6test: test_disks(52, 56): faila=3D 52(D)  failb=3D 56=
(D)  OK
> [   10.742726] raid6test: test_disks(52, 57): faila=3D 52(D)  failb=3D 57=
(D)  OK
> [   10.744074] raid6test: test_disks(52, 58): faila=3D 52(D)  failb=3D 58=
(D)  OK
> [   10.745419] raid6test: test_disks(52, 59): faila=3D 52(D)  failb=3D 59=
(D)  OK
> [   10.746763] raid6test: test_disks(52, 60): faila=3D 52(D)  failb=3D 60=
(D)  OK
> [   10.748110] raid6test: test_disks(52, 61): faila=3D 52(D)  failb=3D 61=
(D)  OK
> [   10.749454] raid6test: test_disks(52, 62): faila=3D 52(D)  failb=3D 62=
(P)  OK
> [   10.750870] raid6test: test_disks(52, 63): faila=3D 52(D)  failb=3D 63=
(Q)  OK
> [   10.752221] raid6test: test_disks(53, 54): faila=3D 53(D)  failb=3D 54=
(D)  OK
> [   10.753565] raid6test: test_disks(53, 55): faila=3D 53(D)  failb=3D 55=
(D)  OK
> [   10.754908] raid6test: test_disks(53, 56): faila=3D 53(D)  failb=3D 56=
(D)  OK
> [   10.756393] raid6test: test_disks(53, 57): faila=3D 53(D)  failb=3D 57=
(D)  OK
> [   10.757742] raid6test: test_disks(53, 58): faila=3D 53(D)  failb=3D 58=
(D)  OK
> [   10.759097] raid6test: test_disks(53, 59): faila=3D 53(D)  failb=3D 59=
(D)  OK
> [   10.760442] raid6test: test_disks(53, 60): faila=3D 53(D)  failb=3D 60=
(D)  OK
> [   10.761758] raid6test: test_disks(53, 61): faila=3D 53(D)  failb=3D 61=
(D)  OK
> [   10.763053] raid6test: test_disks(53, 62): faila=3D 53(D)  failb=3D 62=
(P)  OK
> [   10.764396] raid6test: test_disks(53, 63): faila=3D 53(D)  failb=3D 63=
(Q)  OK
> [   10.765813] raid6test: test_disks(54, 55): faila=3D 54(D)  failb=3D 55=
(D)  OK
> [   10.767109] raid6test: test_disks(54, 56): faila=3D 54(D)  failb=3D 56=
(D)  OK
> [   10.768428] raid6test: test_disks(54, 57): faila=3D 54(D)  failb=3D 57=
(D)  OK
> [   10.769773] raid6test: test_disks(54, 58): faila=3D 54(D)  failb=3D 58=
(D)  OK
> [   10.771161] raid6test: test_disks(54, 59): faila=3D 54(D)  failb=3D 59=
(D)  OK
> [   10.772509] raid6test: test_disks(54, 60): faila=3D 54(D)  failb=3D 60=
(D)  OK
> [   10.773877] raid6test: test_disks(54, 61): faila=3D 54(D)  failb=3D 61=
(D)  OK
> [   10.775225] raid6test: test_disks(54, 62): faila=3D 54(D)  failb=3D 62=
(P)  OK
> [   10.776633] raid6test: test_disks(54, 63): faila=3D 54(D)  failb=3D 63=
(Q)  OK
> [   10.777983] raid6test: test_disks(55, 56): faila=3D 55(D)  failb=3D 56=
(D)  OK
> [   10.779324] raid6test: test_disks(55, 57): faila=3D 55(D)  failb=3D 57=
(D)  OK
> [   10.780659] raid6test: test_disks(55, 58): faila=3D 55(D)  failb=3D 58=
(D)  OK
> [   10.782078] raid6test: test_disks(55, 59): faila=3D 55(D)  failb=3D 59=
(D)  OK
> [   10.783414] raid6test: test_disks(55, 60): faila=3D 55(D)  failb=3D 60=
(D)  OK
> [   10.784720] raid6test: test_disks(55, 61): faila=3D 55(D)  failb=3D 61=
(D)  OK
> [   10.786180] raid6test: test_disks(55, 62): faila=3D 55(D)  failb=3D 62=
(P)  OK
> [   10.787524] raid6test: test_disks(55, 63): faila=3D 55(D)  failb=3D 63=
(Q)  OK
> [   10.788872] raid6test: test_disks(56, 57): faila=3D 56(D)  failb=3D 57=
(D)  OK
> [   10.790221] raid6test: test_disks(56, 58): faila=3D 56(D)  failb=3D 58=
(D)  OK
> [   10.791628] raid6test: test_disks(56, 59): faila=3D 56(D)  failb=3D 59=
(D)  OK
> [   10.792979] raid6test: test_disks(56, 60): faila=3D 56(D)  failb=3D 60=
(D)  OK
> [   10.794333] raid6test: test_disks(56, 61): faila=3D 56(D)  failb=3D 61=
(D)  OK
> [   10.795680] raid6test: test_disks(56, 62): faila=3D 56(D)  failb=3D 62=
(P)  OK
> [   10.797036] raid6test: test_disks(56, 63): faila=3D 56(D)  failb=3D 63=
(Q)  OK
> [   10.798382] raid6test: test_disks(57, 58): faila=3D 57(D)  failb=3D 58=
(D)  OK
> [   10.799728] raid6test: test_disks(57, 59): faila=3D 57(D)  failb=3D 59=
(D)  OK
> [   10.801142] raid6test: test_disks(57, 60): faila=3D 57(D)  failb=3D 60=
(D)  OK
> [   10.802488] raid6test: test_disks(57, 61): faila=3D 57(D)  failb=3D 61=
(D)  OK
> [   10.803829] raid6test: test_disks(57, 62): faila=3D 57(D)  failb=3D 62=
(P)  OK
> [   10.805180] raid6test: test_disks(57, 63): faila=3D 57(D)  failb=3D 63=
(Q)  OK
> [   10.806529] raid6test: test_disks(58, 59): faila=3D 58(D)  failb=3D 59=
(D)  OK
> [   10.807730] raid6test: test_disks(58, 60): faila=3D 58(D)  failb=3D 60=
(D)  OK
> [   10.808991] raid6test: test_disks(58, 61): faila=3D 58(D)  failb=3D 61=
(D)  OK
> [   10.810259] raid6test: test_disks(58, 62): faila=3D 58(D)  failb=3D 62=
(P)  OK
> [   10.811561] raid6test: test_disks(58, 63): faila=3D 58(D)  failb=3D 63=
(Q)  OK
> [   10.812793] raid6test: test_disks(59, 60): faila=3D 59(D)  failb=3D 60=
(D)  OK
> [   10.814032] raid6test: test_disks(59, 61): faila=3D 59(D)  failb=3D 61=
(D)  OK
> [   10.815303] raid6test: test_disks(59, 62): faila=3D 59(D)  failb=3D 62=
(P)  OK
> [   10.816788] raid6test: test_disks(59, 63): faila=3D 59(D)  failb=3D 63=
(Q)  OK
> [   10.818129] raid6test: test_disks(60, 61): faila=3D 60(D)  failb=3D 61=
(D)  OK
> [   10.819355] raid6test: test_disks(60, 62): faila=3D 60(D)  failb=3D 62=
(P)  OK
> [   10.820532] raid6test: test_disks(60, 63): faila=3D 60(D)  failb=3D 63=
(Q)  OK
> [   10.821831] raid6test: test_disks(61, 62): faila=3D 61(D)  failb=3D 62=
(P)  OK
> [   10.823063] raid6test: test_disks(61, 63): faila=3D 61(D)  failb=3D 63=
(Q)  OK
> [   10.824288] raid6test: test_disks(62, 63): faila=3D 62(P)  failb=3D 63=
(Q)  OK
> [   10.825297] raid6test: =

> [   10.825675] raid6test: complete (2429 tests, 0 failures)
> [   10.875863]   Magic number: 3:818:612
> [   10.876445] tty ptye2: hash matches
> [   10.876939] tty tty: hash matches
> [   10.877646] BIOS EDD facility v0.16 2004-Jun-25, 6 devices found
> [   10.903039] Unregister pv shared memory for cpu 0
> [   10.983752] CPU 0 is now offline
> [   10.999836] Freeing unused kernel memory: 1292K (ffffffff8c3a2000 - ff=
ffffff8c4e5000)
> [   11.001051] Write protecting the kernel read-only data: 22528k
> [   11.004006] Freeing unused kernel memory: 1200K (ffff88000b4d4000 - ff=
ff88000b600000)
> [   11.006656] Freeing unused kernel memory: 1360K (ffff88000bcac000 - ff=
ff88000be00000)
> [   11.010492] ------------[ cut here ]------------
> [   11.011035] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:3561 ch=
eck_flags+0x2f6/0x330()
> [   11.011035] DEBUG_LOCKS_WARN_ON(!current->hardirqs_enabled)
> [   11.011035] CPU: 1 PID: 1 Comm: init Not tainted 4.1.0-01336-ge9c469c =
#1
> [   11.011035]  ffffffff8bb7f2e0 ffff880010d0fdd8 ffffffff8b4a70ee 000000=
000000002f
> [   11.011035]  ffff880010d0fe28 ffff880010d0fe18 ffffffff8a8ac643 ffff88=
00100dc120
> [   11.011035]  0000000000000202 0000000000000000 0000000000000000 000000=
0000000000
> [   11.011035] Call Trace:
> [   11.011035]  [<ffffffff8b4a70ee>] dump_stack+0x84/0xb9
> [   11.011035]  [<ffffffff8a8ac643>] warn_slowpath_common+0xa3/0x100
> [   11.011035]  [<ffffffff8a8ac731>] warn_slowpath_fmt+0x51/0x60
> [   11.011035]  [<ffffffff8a91af46>] check_flags+0x2f6/0x330
> [   11.011035]  [<ffffffff8a920991>] lock_acquire+0xb1/0x1a0
> [   11.011035]  [<ffffffff8a8dd8ee>] ? task_work_run+0x12e/0x160
> [   11.011035]  [<ffffffff8a8dd30f>] __task_pid_nr_ns+0x5f/0x290
> [   11.011035]  [<ffffffff8a8dd2b0>] ? pid_vnr+0x80/0x80
> [   11.011035]  [<ffffffff8a8ab09e>] SyS_set_tid_address+0x2e/0x40
> [   11.011035]  [<ffffffff8b4b99f6>] entry_SYSCALL_64_fastpath+0x16/0x7a
> [   11.011035] ---[ end trace 3806fbdbe2666144 ]---
> [   11.011035] possible reason: unannotated irqs-on.
> [   11.011035] irq event stamp: 1318470
> [   11.011035] hardirqs last  enabled at (1318469): [<ffffffff8a948c44>] =
__call_rcu+0x224/0x6d0
> [   11.011035] hardirqs last disabled at (1318470): [<ffffffff8a80198a>] =
prepare_exit_to_usermode+0x11a/0x280
> [   11.011035] softirqs last  enabled at (1311358): [<ffffffff8a8b2bf5>] =
__do_softirq+0x2f5/0x3c0
> [   11.011035] softirqs last disabled at (1311333): [<ffffffff8a8b33ee>] =
irq_exit+0x16e/0x190
> [   11.052250] random: init urandom read with 3 bits of entropy available
> [   11.062514] hostname (94) used greatest stack depth: 14240 bytes left
> [   11.077654] plymouthd (95) used greatest stack depth: 14032 bytes left
> [   11.094112] mountall (102) used greatest stack depth: 13744 bytes left
> mountall: Event failed
> [   11.134734] init: Failed to create pty - disabling logging for job
> [   11.135784] init: Temporary process spawn error: No space left on devi=
ce
> udevd[172]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYSTM:': No such file or directory
> udevd[173]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv input:=
b0019v0000p0001e0000-e0,1,k74,ramlsfw': No such file or directory
> udevd[181]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00007010sv00001AF4sd00001100bc01sc01i80': No such file or directory
> udevd[194]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[195]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[196]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00001237sv00001AF4sd00001100bc06sc00i00': No such file or directory
> udevd[197]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00007000sv00001AF4sd00001100bc06sc01i00': No such file or directory
> udevd[198]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00007113sv00001AF4sd00001100bc06sc80i00': No such file or directory
> udevd[199]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001013d000000B8sv00001AF4sd00001100bc03sc00i00': No such file or directory
> udevd[200]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d0000100Esv00001AF4sd00001100bc02sc00i00': No such file or directory
> udevd[201]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[193]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[202]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[204]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[207]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYBUS:': No such file or directory
> udevd[208]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[209]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d000025ABsv00001AF4sd00001100bc08sc80i00': No such file or directory
> udevd[210]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYBUS:': No such file or directory
> udevd[217]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:platform-framebuffer': No such file or directory
> udevd[218]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0103:': No such file or directory
> udevd[220]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXCPU:': No such file or directory
> udevd[224]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A06:': No such file or directory
> udevd[223]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A03:': No such file or directory
> udevd[226]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[222]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0103:': No such file or directory
> udevd[225]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[227]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[228]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[229]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[221]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXCPU:': No such file or directory
> udevd[231]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv input:=
b0011v0001p0001eAB41-e0,1,4,11,14,k71,72,73,74,75,76,77,79,7A,7B,7C,7D,7E,7=
F,80,8C,8E,8F,9B,9C,9D,9E,9F,A3,A4,A5,A6,AC,AD,B7,B8,B9,D9,E2,ram4,l0,1,2,s=
fw': No such file or directory
> udevd[230]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv serio:=
ty01pr00id00ex00': No such file or directory
> udevd[232]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A06:': No such file or directory
> udevd[252]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0303:': No such file or directory
> udevd[254]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0501:': No such file or directory
> udevd[255]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0501:': No such file or directory
> udevd[257]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0B00:': No such file or directory
> udevd[253]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0400:': No such file or directory
> udevd[251]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:A=
PP0001:': No such file or directory
> udevd[256]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0700:': No such file or directory
> udevd[258]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0F13:': No such file or directory
> udevd[259]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:Q=
EMU0001:': No such file or directory
> Kernel tests: Boot OK!
> Kernel tests: Boot OK!
> Trinity v1.4pre  Dave Jones <davej@redhat.com>
> [init] Marking syscall get_robust_list (64bit:274 32bit:312) as to be dis=
abled.
> Done parsing arguments.
> Marking all syscalls as enabled.
> [init] Disabling syscalls marked as disabled by command line options
> [init] Marked 64-bit syscall get_robust_list (274) as deactivated.
> [init] Marked 32-bit syscall get_robust_list (312) as deactivated.
> [init] 32-bit syscalls: 350 enabled, 1 disabled.  64-bit syscalls: 313 en=
abled, 1 disabled.
> DANGER: RUNNING AS ROOT.
> Unless you are running in a virtual machine, this could cause serious pro=
blems such as overwriting CMOS
> or similar which could potentially make this machine unbootable without a=
 firmware reset.
> =

> ctrl-c now unless you really know what you are doing.
> [init] Kernel was tainted on startup. Will ignore flags that are already =
set.
> [init] Started watchdog process, PID is 350
> [main] Main thread is alive.
> [main] Setsockopt(1 8 693000 3c) on fd 8 [1:1:1]
> [main] Setsockopt(1 a 693000 42) on fd 9 [1:5:1]
> [main] Setsockopt(1 1 693000 b2) on fd 13 [1:5:1]
> [main] Setsockopt(1 21 693000 8) on fd 14 [1:1:1]
> [main] Setsockopt(1 e 693000 4) on fd 15 [1:2:1]
> [main] Setsockopt(1 15 693000 10) on fd 17 [1:1:1]
> [main] Setsockopt(1 1 693000 4) on fd 18 [1:1:1]
> [main] Setsockopt(1 20 693000 4) on fd 20 [1:1:1]
> [main] Setsockopt(1 20 693000 4) on fd 21 [1:1:1]
> [main] Setsockopt(1 2a 693000 4) on fd 24 [1:2:1]
> [main] Setsockopt(10e 5 693000 db) on fd 25 [16:3:2]
> [main] Setsockopt(1 2c 693000 4) on fd 27 [1:2:1]
> [main] Setsockopt(1 10 693000 4) on fd 32 [1:5:1]
> [main] Setsockopt(1 5 693000 89) on fd 33 [1:2:1]
> [main] Setsockopt(1 6 693000 9) on fd 35 [1:5:1]
> [main] Setsockopt(10e 3 693000 4) on fd 38 [16:2:4]
> [main] Setsockopt(1 5 693000 e2) on fd 39 [1:2:1]
> [main] Setsockopt(1 7 693000 4) on fd 40 [1:2:1]
> [main] Setsockopt(1 25 693000 4) on fd 41 [16:2:4]
> [main] Setsockopt(1 1 693000 4) on fd 43 [1:5:1]
> [main] Setsockopt(1 2a 693000 4) on fd 44 [1:1:1]
> [main] Setsockopt(1 1d 693000 4) on fd 46 [1:1:1]
> [main] Setsockopt(1 e 693000 4) on fd 49 [1:1:1]
> [main] Setsockopt(1 23 693000 4) on fd 50 [1:5:1]
> [main] Setsockopt(1 1 693000 4) on fd 52 [1:2:1]
> [main] Setsockopt(10e 4 693000 4) on fd 56 [16:3:16]
> [main] Setsockopt(1 23 693000 4) on fd 58 [1:2:1]
> [main] Setsockopt(1 1d 693000 94) on fd 59 [1:1:1]
> [main] Setsockopt(1 2d 693000 4) on fd 63 [1:1:1]
> [main] Setsockopt(1 7 693000 bf) on fd 65 [1:2:1]
> [main] Setsockopt(1 c 693000 9e) on fd 67 [1:5:1]
> [main] Setsockopt(1 1 693000 1c) on fd 69 [1:5:1]
> [main] Setsockopt(1 d 693000 8) on fd 70 [1:1:1]
> [main] Setsockopt(1 2 693000 a9) on fd 71 [16:3:16]
> [main] Setsockopt(1 2b 693000 5b) on fd 72 [1:5:1]
> [main] Setsockopt(1 2e 693000 4) on fd 73 [1:5:1]
> [main] Setsockopt(1 2f 693000 4) on fd 74 [16:2:16]
> [main] Setsockopt(1 14 693000 10) on fd 75 [1:2:1]
> [main] Setsockopt(1 12 693000 5) on fd 78 [1:2:1]
> [main] Setsockopt(10e 4 693000 1) on fd 79 [16:3:2]
> [main] Setsockopt(1 e 693000 4) on fd 81 [16:2:0]
> [main] Setsockopt(1 a 693000 b7) on fd 82 [1:2:1]
> [main] Setsockopt(1 5 693000 f) on fd 83 [1:2:1]
> [main] Setsockopt(1 12 693000 ba) on fd 84 [1:2:1]
> [main] Setsockopt(1 9 693000 ec) on fd 86 [1:1:1]
> [main] Setsockopt(1 1d 693000 dd) on fd 88 [1:1:1]
> [main] Setsockopt(1 23 693000 51) on fd 89 [1:1:1]
> [main] Setsockopt(1 29 693000 4) on fd 90 [1:1:1]
> [main] Setsockopt(1 2f 693000 1a) on fd 92 [1:5:1]
> [main] Setsockopt(1 28 693000 4) on fd 94 [1:2:1]
> [main] Setsockopt(10e 5 693000 4) on fd 95 [16:3:15]
> [main] Setsockopt(1 6 693000 f8) on fd 96 [1:5:1]
> [main] Setsockopt(1 6 693000 4) on fd 97 [1:5:1]
> [main] Setsockopt(10e 3 693000 4) on fd 98 [16:3:0]
> [main] Setsockopt(1 23 693000 4) on fd 99 [1:5:1]
> [main] Setsockopt(1 d 693000 8) on fd 101 [1:5:1]
> [main] Setsockopt(1 28 693000 4) on fd 104 [1:5:1]
> [main] Setsockopt(1 2 693000 4) on fd 105 [1:5:1]
> [main] Setsockopt(1 7 693000 4) on fd 108 [16:3:4]
> [main] Setsockopt(1 e 693000 4) on fd 111 [1:1:1]
> [main] Setsockopt(1 10 693000 4) on fd 113 [1:1:1]
> [main] Setsockopt(1 2c 693000 4) on fd 118 [1:2:1]
> [main] Setsockopt(1 d 693000 8) on fd 120 [1:5:1]
> [main] Setsockopt(1 12 693000 c5) on fd 121 [1:5:1]
> [main] Setsockopt(1 28 693000 47) on fd 122 [1:2:1]
> [main] Setsockopt(10e 4 693000 4) on fd 124 [16:3:0]
> [main] Setsockopt(1 25 693000 4) on fd 127 [1:2:1]
> [main] Setsockopt(1 2e 693000 4) on fd 129 [1:2:1]
> [main] Setsockopt(1 10 693000 37) on fd 130 [1:2:1]
> [main] Setsockopt(1 25 693000 7c) on fd 134 [1:2:1]
> [main] Setsockopt(1 1 693000 e9) on fd 135 [1:2:1]
> [main] Setsockopt(1 b 693000 e7) on fd 136 [1:5:1]
> [main] Setsockopt(1 1d 693000 4) on fd 139 [16:2:16]
> [main] Setsockopt(1 29 693000 4) on fd 141 [1:1:1]
> [main] Setsockopt(1 5 693000 ee) on fd 142 [1:2:1]
> [main] Setsockopt(1 a 693000 4) on fd 143 [1:5:1]
> [main] Setsockopt(1 2a 693000 4) on fd 148 [1:1:1]
> [main] Setsockopt(1 12 693000 b2) on fd 149 [1:5:1]
> [main] Setsockopt(1 28 693000 8f) on fd 151 [1:1:1]
> [main] Setsockopt(1 6 693000 4) on fd 152 [1:2:1]
> [main] Setsockopt(1 1d 693000 1e) on fd 153 [1:2:1]
> [main] Setsockopt(1 25 693000 4) on fd 154 [1:5:1]
> [main] Setsockopt(1 9 693000 16) on fd 156 [1:1:1]
> [main] Setsockopt(10e 3 693000 79) on fd 157 [16:3:15]
> [main] Setsockopt(1 12 693000 4) on fd 159 [1:1:1]
> [main] Setsockopt(1 12 693000 d0) on fd 160 [1:5:1]
> [main] Setsockopt(1 23 693000 2c) on fd 164 [1:2:1]
> [main] Setsockopt(1 1 693000 4) on fd 165 [16:3:0]
> [main] Setsockopt(1 8 693000 c6) on fd 166 [1:2:1]
> [main] Setsockopt(1 d 693000 8) on fd 168 [16:3:0]
> [main] Setsockopt(1 21 693000 61) on fd 169 [1:5:1]
> [main] Setsockopt(1 2c 693000 4) on fd 171 [1:1:1]
> [main] Setsockopt(1 10 693000 4) on fd 172 [16:2:0]
> [main] Setsockopt(1 5 693000 4) on fd 174 [1:5:1]
> [main] Setsockopt(1 b 693000 20) on fd 176 [1:1:1]
> [main] Setsockopt(1 d 693000 8) on fd 177 [16:2:15]
> [main] Setsockopt(1 23 693000 4) on fd 179 [1:2:1]
> [main] Setsockopt(1 21 693000 4) on fd 180 [1:1:1]
> [main] Setsockopt(1 5 693000 4) on fd 181 [1:1:1]
> [main] Setsockopt(1 6 693000 4) on fd 182 [1:5:1]
> [main] Setsockopt(1 28 693000 4) on fd 183 [16:2:15]
> [main] Setsockopt(1 f 693000 c1) on fd 186 [1:1:1]
> [main] Setsockopt(1 20 693000 43) on fd 187 [1:1:1]
> [main] Setsockopt(1 24 693000 4) on fd 188 [1:1:1]
> [main] Setsockopt(1 2f 693000 bc) on fd 189 [1:5:1]
> [main] Setsockopt(1 1 693000 14) on fd 190 [1:5:1]
> [main] Setsockopt(1 25 693000 4) on fd 191 [1:2:1]
> [main] Setsockopt(1 23 693000 4) on fd 192 [16:2:2]
> [main] Setsockopt(1 5 693000 4) on fd 193 [1:5:1]
> [main] Setsockopt(1 23 693000 4) on fd 195 [1:5:1]
> [main] Setsockopt(1 28 693000 18) on fd 198 [1:1:1]
> [main] Setsockopt(1 2e 693000 46) on fd 200 [1:2:1]
> [main] Setsockopt(1 12 693000 e) on fd 201 [1:2:1]
> [main] Setsockopt(10e 4 693000 4) on fd 202 [16:2:0]
> [main] Setsockopt(1 8 693000 b6) on fd 203 [1:5:1]
> [main] Setsockopt(10e 5 693000 4) on fd 207 [16:3:16]
> [main] Setsockopt(1 7 693000 43) on fd 208 [1:1:1]
> [main] Setsockopt(1 2c 693000 4) on fd 209 [1:2:1]
> [main] Setsockopt(1 2c 693000 4) on fd 212 [1:2:1]
> [main] Setsockopt(1 7 693000 4) on fd 213 [1:1:1]
> [main] Setsockopt(1 28 693000 52) on fd 216 [1:2:1]
> [main] Setsockopt(1 24 693000 4) on fd 217 [1:1:1]
> [main] Setsockopt(1 23 693000 9a) on fd 218 [1:5:1]
> [main] Setsockopt(10e 5 693000 1f) on fd 219 [16:2:2]
> [main] Setsockopt(1 2b 693000 4) on fd 220 [1:2:1]
> [main] Setsockopt(10e 3 693000 8c) on fd 221 [16:3:16]
> [main] Setsockopt(1 8 693000 4) on fd 222 [1:1:1]
> [main] Setsockopt(1 d 693000 8) on fd 224 [1:1:1]
> [main] Setsockopt(1 f 693000 d9) on fd 225 [1:1:1]
> [main] Setsockopt(1 e 693000 66) on fd 226 [1:5:1]
> [main] Setsockopt(1 10 693000 4) on fd 228 [16:2:2]
> [main] Setsockopt(1 23 693000 81) on fd 230 [1:1:1]
> [main] Setsockopt(1 2b 693000 82) on fd 232 [1:1:1]
> [main] Setsockopt(1 29 693000 66) on fd 234 [1:2:1]
> [main] Setsockopt(1 8 693000 4) on fd 237 [1:5:1]
> [main] Setsockopt(1 21 693000 4) on fd 239 [1:1:1]
> [main] Setsockopt(1 1 693000 4b) on fd 240 [1:5:1]
> [main] Setsockopt(1 2b 693000 d0) on fd 241 [1:5:1]
> [main] Setsockopt(1 12 693000 4) on fd 243 [16:2:4]
> [main] Setsockopt(1 24 693000 4) on fd 244 [1:2:1]
> [main] Setsockopt(1 c 693000 32) on fd 245 [1:1:1]
> [main] Setsockopt(1 5 693000 ae) on fd 247 [1:2:1]
> [main] Setsockopt(1 9 693000 c9) on fd 250 [1:2:1]
> [main] Setsockopt(10e 4 693000 9e) on fd 251 [16:2:15]
> [main] Setsockopt(1 d 693000 8) on fd 252 [1:1:1]
> [main] Setsockopt(10e 4 693000 9e) on fd 253 [16:3:4]
> [main] Setsockopt(1 23 693000 87) on fd 255 [1:2:1]
> [main] Setsockopt(1 2 693000 4) on fd 257 [1:1:1]
> [main] Setsockopt(1 a 693000 81) on fd 258 [1:2:1]
> [main] Setsockopt(1 12 693000 c9) on fd 259 [1:5:1]
> [main] Setsockopt(1 2f 693000 4) on fd 260 [1:5:1]
> [main] Setsockopt(1 22 693000 67) on fd 264 [1:2:1]
> [main] Setsockopt(1 7 693000 6b) on fd 265 [1:2:1]
> [main] Setsockopt(1 2b 693000 4) on fd 267 [1:1:1]
> [main] Setsockopt(1 1d 693000 a7) on fd 268 [1:1:1]
> [main] Setsockopt(1 2d 693000 8d) on fd 269 [1:1:1]
> [main] Setsockopt(1 2f 693000 a3) on fd 270 [1:1:1]
> [main] Setsockopt(1 7 693000 8) on fd 272 [1:1:1]
> [main] Setsockopt(1 f 693000 6f) on fd 273 [16:2:15]
> [main] Setsockopt(1 2f 693000 e4) on fd 274 [1:5:1]
> [main] Setsockopt(1 2c 693000 4) on fd 277 [1:5:1]
> [main] Setsockopt(1 2a 693000 da) on fd 278 [1:5:1]
> [main] Setsockopt(1 1 693000 5e) on fd 281 [1:1:1]
> [main] Setsockopt(1 7 693000 a) on fd 282 [1:2:1]
> [main] Setsockopt(1 5 693000 52) on fd 283 [1:5:1]
> [main] Setsockopt(1 9 693000 56) on fd 284 [1:1:1]
> [main] Setsockopt(1 7 693000 7d) on fd 285 [1:2:1]
> [main] Setsockopt(1 b 693000 18) on fd 286 [1:1:1]
> [main] Setsockopt(1 c 693000 4) on fd 288 [1:1:1]
> [main] Setsockopt(1 22 693000 4) on fd 289 [16:2:16]
> [main] Setsockopt(1 10 693000 b2) on fd 290 [1:2:1]
> [main] Setsockopt(1 23 693000 9e) on fd 291 [1:1:1]
> [main] Setsockopt(1 20 693000 4) on fd 292 [1:1:1]
> [main] Setsockopt(1 b 693000 5) on fd 293 [1:5:1]
> [main] Setsockopt(1 15 693000 10) on fd 294 [1:1:1]
> [main] Setsockopt(1 b 693000 41) on fd 296 [1:1:1]
> [main] Setsockopt(1 7 693000 c) on fd 298 [1:2:1]
> [main] Setsockopt(1 22 693000 31) on fd 300 [1:2:1]
> [main] Setsockopt(1 25 693000 56) on fd 301 [1:5:1]
> [main] Setsockopt(1 2 693000 4) on fd 303 [1:5:1]
> [main] Setsockopt(1 23 693000 5) on fd 305 [16:2:2]
> [main] Setsockopt(1 10 693000 4) on fd 306 [1:1:1]
> [main] Setsockopt(1 5 693000 4) on fd 307 [1:1:1]
> [main] Setsockopt(1 2f 693000 4) on fd 308 [1:1:1]
> [main] Setsockopt(1 b 693000 4) on fd 311 [1:1:1]
> [main] Setsockopt(1 8 693000 4) on fd 312 [1:2:1]
> [main] Setsockopt(1 2b 693000 4) on fd 317 [1:2:1]
> [main] Setsockopt(1 14 693000 10) on fd 318 [1:2:1]
> [main] Setsockopt(1 24 693000 4) on fd 320 [1:1:1]
> [main] Setsockopt(1 10 693000 4) on fd 321 [1:2:1]
> [main] Setsockopt(1 22 693000 4) on fd 322 [1:1:1]
> [main] Setsockopt(1 1d 693000 4) on fd 324 [1:1:1]
> [main] Setsockopt(10e 3 693000 4) on fd 325 [16:2:0]
> [main] Setsockopt(1 2d 693000 61) on fd 326 [1:5:1]
> [main] Setsockopt(1 c 693000 4) on fd 328 [1:5:1]
> [main] Setsockopt(1 e 693000 4) on fd 332 [16:3:16]
> [main] Setsockopt(1 12 693000 4) on fd 334 [1:5:1]
> [main] Setsockopt(1 22 693000 c7) on fd 335 [1:1:1]
> [main] Setsockopt(10e 2 693000 4) on fd 336 [16:2:2]
> [main] Setsockopt(1 d 693000 8) on fd 337 [1:2:1]
> [main] Setsockopt(1 22 693000 4) on fd 341 [1:5:1]
> [main] Setsockopt(10e 2 693000 4) on fd 342 [16:3:16]
> [main] Setsockopt(1 7 693000 55) on fd 345 [1:5:1]
> [main] Setsockopt(1 6 693000 d2) on fd 346 [1:5:1]
> [main] Setsockopt(1 20 693000 4) on fd 348 [1:1:1]
> [main] Setsockopt(1 29 693000 af) on fd 351 [1:1:1]
> [main] Setsockopt(1 25 693000 50) on fd 352 [1:5:1]
> [main] Setsockopt(1 5 693000 b1) on fd 354 [16:2:4]
> [main] Setsockopt(1 28 693000 cb) on fd 355 [1:5:1]
> [main] Setsockopt(1 e 693000 ac) on fd 357 [16:3:15]
> [main] Setsockopt(10e 5 693000 4) on fd 359 [16:3:2]
> [main] Setsockopt(1 9 693000 86) on fd 362 [1:2:1]
> [main] Setsockopt(1 b 693000 4) on fd 364 [1:5:1]
> [main] Setsockopt(1 d 693000 8) on fd 365 [16:3:16]
> [main] Setsockopt(1 25 693000 fb) on fd 366 [1:2:1]
> [main] Setsockopt(10e 5 693000 4) on fd 367 [16:3:15]
> [main] Setsockopt(1 2d 693000 4) on fd 368 [1:5:1]
> [main] Setsockopt(1 d 693000 8) on fd 369 [1:5:1]
> [main] Setsockopt(1 2c 693000 df) on fd 371 [1:5:1]
> [main] Setsockopt(1 2e 693000 b0) on fd 374 [1:2:1]
> [main] Setsockopt(1 9 693000 4) on fd 375 [1:1:1]
> [main] Setsockopt(1 24 693000 4) on fd 376 [1:2:1]
> [main] Setsockopt(1 c 693000 ab) on fd 377 [1:5:1]
> [main] Setsockopt(1 f 693000 fb) on fd 379 [1:1:1]
> [main] 375 sockets created based on info from socket cachefile.
> [main] Generating file descriptors
> [main] Added 301 filenames from /dev
> [main] Added 7480 filenames from /proc
> [main] Added 13379 filenames from /sys
> [child0:352] delete_module (129) returned ENOSYS, marking as inactive.
> [child0:352] uid changed! Was: 0, now 162
> Bailing main loop. Exit reason: UID changed.
> [watchdog] [350] Watchdog exiting
> [init] =

> Ran 8 syscalls. Successes: 2  Failures: 6
> [   63.721644] Writes:  Total: 4  Max/Min: 0/0   Fail: 0 =

> error: 'rc.local' exited outside the expected code flow.
> umount: /run/lock: not mounted
>  * Will now restart
> [   71.505555] spin_lock-torture: Unscheduled system shutdown detected
> [   71.507393] reboot: Restarting system
> =

> Elapsed time: 80
> qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /pkg/linux/x86_64-randc=
onfig-h0-06261249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-=
4.1.0-01336-ge9c469c -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,11520=
0 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.=
rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3D=
panic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1152=
00 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/ru=
n-queue/kvm/x86_64-randconfig-h0-06261249/linux-devel:devel-spot-2015062612=
20:e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8:bisect-linux-8/.vmlinuz-e9c469c=
b57d2ccf6e7e5e8e6f869fc579adb58e8-20150627024253-9-ivb42 branch=3Dlinux-dev=
el/devel-spot-201506261220 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-h0-062=
61249/gcc-4.9/e9c469cb57d2ccf6e7e5e8e6f869fc579adb58e8/vmlinuz-4.1.0-01336-=
ge9c469c drbd.minor_count=3D8'  -initrd /osimage/quantal/quantal-core-x86_6=
4.cgz -m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boo=
t order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive fil=
e=3D/fs/sda4/disk0-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/sda4/disk1-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=3D=
/fs/sda4/disk2-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=3D/fs=
/sda4/disk3-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sd=
a4/disk4-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda4/=
disk5-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda4/dis=
k6-quantal-ivb42-116,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-q=
uantal-ivb42-116 -serial file:/dev/shm/kboot/serial-quantal-ivb42-116 -daem=
onize -display none -monitor null =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.1.0 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-sa=
ved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -=
fcall-saved-r11"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> CONFIG_KERNEL_LZO=3Dy
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SWAP is not set
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=3Dy
> # CONFIG_NO_HZ_FULL is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> # CONFIG_RCU_NOCB_CPU_NONE is not set
> # CONFIG_RCU_NOCB_CPU_ZERO is not set
> CONFIG_RCU_NOCB_CPU_ALL=3Dy
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> # CONFIG_NUMA_BALANCING is not set
> CONFIG_CGROUPS=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CFS_BANDWIDTH is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_SLUB_DEBUG is not set
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_OPROFILE=3Dy
> CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_ATTRS=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> # CONFIG_GCOV_FORMAT_3_4 is not set
> # CONFIG_GCOV_FORMAT_4_7 is not set
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_STOP_MACHINE=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> # CONFIG_BLK_DEV_BSGLIB is not set
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_AMIGA_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> CONFIG_BLOCK_COMPAT=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> # CONFIG_IOSCHED_CFQ is not set
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_VSMP is not set
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> # CONFIG_IOSF_MBI is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_DEBUG=3Dy
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> # CONFIG_GART_IOMMU is not set
> # CONFIG_CALGARY_IOMMU is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_MICROCODE is not set
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_NUMA=3Dy
> CONFIG_AMD_NUMA=3Dy
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_MEMORY_PROBE=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_NEED_MULTIPLE_NODES=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_MOVABLE_NODE=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_CLEANCACHE=3Dy
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> # CONFIG_ZPOOL is not set
> CONFIG_ZBUD=3Dy
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_X86_PMEM_LEGACY is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_INTEL_MPX=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_RANDOMIZE_BASE_MAX_OFFSET=3D0x40000000
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> CONFIG_PM_TRACE=3Dy
> CONFIG_PM_TRACE_RTC=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_SFI is not set
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> # CONFIG_CPU_FREQ_STAT is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> # CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Memory power savings
> #
> # CONFIG_I7300_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> CONFIG_IA32_EMULATION=3Dy
> CONFIG_IA32_AOUT=3Dy
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_PMC_ATOM=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> # CONFIG_NET_KEY is not set
> # CONFIG_INET is not set
> # CONFIG_NETWORK_SECMARK is not set
> # CONFIG_NET_PTP_CLASSIFY is not set
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> # CONFIG_IEEE802154 is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_MMAP is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_IRDA is not set
> # CONFIG_BT is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_RFKILL_REGULATOR is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> CONFIG_HAVE_BPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER=3Dy
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_FENCE_TRACE is not set
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D0
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> # CONFIG_CMA_SIZE_SEL_MIN is not set
> CONFIG_CMA_SIZE_SEL_MAX=3Dy
> CONFIG_CMA_ALIGNMENT=3D8
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> # CONFIG_FTL is not set
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dy
> # CONFIG_RFD_FTL is not set
> # CONFIG_SSFDC is not set
> CONFIG_SM_FTL=3Dy
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> CONFIG_MTD_JEDECPROBE=3Dy
> CONFIG_MTD_GEN_PROBE=3Dy
> # CONFIG_MTD_CFI_ADV_OPTIONS is not set
> CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_2=3Dy
> CONFIG_MTD_MAP_BANK_WIDTH_4=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_8 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=3Dy
> CONFIG_MTD_CFI_I2=3Dy
> # CONFIG_MTD_CFI_I4 is not set
> # CONFIG_MTD_CFI_I8 is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_SBC_GXX=3Dy
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=3Dy
> # CONFIG_MTD_ESB2ROM is not set
> # CONFIG_MTD_CK804XROM is not set
> # CONFIG_MTD_SCB2_FLASH is not set
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_PCI is not set
> CONFIG_MTD_GPIO_ADDR=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_DATAFLASH=3Dy
> CONFIG_MTD_DATAFLASH_WRITE_VERIFY=3Dy
> CONFIG_MTD_DATAFLASH_OTP=3Dy
> CONFIG_MTD_M25P80=3Dy
> # CONFIG_MTD_SST25L is not set
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> # CONFIG_MTD_MTDRAM is not set
> # CONFIG_MTD_BLOCK2MTD is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> # CONFIG_MTD_NAND_ECC_SMC is not set
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_BCH=3Dy
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> # CONFIG_MTD_SM_COMMON is not set
> CONFIG_MTD_NAND_DENALI=3Dy
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> # CONFIG_MTD_NAND_RICOH is not set
> # CONFIG_MTD_NAND_DISKONCHIP is not set
> # CONFIG_MTD_NAND_DOCG4 is not set
> # CONFIG_MTD_NAND_CAFE is not set
> CONFIG_MTD_NAND_NANDSIM=3Dy
> # CONFIG_MTD_NAND_PLATFORM is not set
> # CONFIG_MTD_NAND_HISI504 is not set
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_SPI_NOR=3Dy
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> # CONFIG_MTD_UBI is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_BLK_DEV_PMEM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # Misc devices
> #
> # CONFIG_SENSORS_LIS3LV02D is not set
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> # CONFIG_AD525X_DPOT_SPI is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> # CONFIG_APDS9802ALS is not set
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1780 is not set
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_TI_DAC7512=3Dy
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> CONFIG_BMP085_SPI=3Dy
> CONFIG_USB_SWITCH_FSA9480=3Dy
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> CONFIG_SRAM=3Dy
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_93XX46=3Dy
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> =

> #
> # Altera FPGA firmware download module
> #
> # CONFIG_ALTERA_STAPL is not set
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> # CONFIG_INTEL_MIC_BUS is not set
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> CONFIG_HAVE_IDE=3Dy
> CONFIG_IDE=3Dy
> =

> #
> # Please see Documentation/ide/ide.txt for help/info on IDE drives
> #
> CONFIG_IDE_ATAPI=3Dy
> CONFIG_BLK_DEV_IDE_SATA=3Dy
> CONFIG_IDE_GD=3Dy
> # CONFIG_IDE_GD_ATA is not set
> # CONFIG_IDE_GD_ATAPI is not set
> # CONFIG_BLK_DEV_DELKIN is not set
> CONFIG_BLK_DEV_IDECD=3Dy
> # CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS is not set
> # CONFIG_BLK_DEV_IDETAPE is not set
> # CONFIG_BLK_DEV_IDEACPI is not set
> CONFIG_IDE_TASK_IOCTL=3Dy
> CONFIG_IDE_PROC_FS=3Dy
> =

> #
> # IDE chipset support/bugfixes
> #
> CONFIG_IDE_GENERIC=3Dy
> CONFIG_BLK_DEV_PLATFORM=3Dy
> # CONFIG_BLK_DEV_CMD640 is not set
> # CONFIG_BLK_DEV_IDEPNP is not set
> =

> #
> # PCI IDE chipsets support
> #
> # CONFIG_BLK_DEV_GENERIC is not set
> # CONFIG_BLK_DEV_OPTI621 is not set
> # CONFIG_BLK_DEV_RZ1000 is not set
> # CONFIG_BLK_DEV_AEC62XX is not set
> # CONFIG_BLK_DEV_ALI15X3 is not set
> # CONFIG_BLK_DEV_AMD74XX is not set
> # CONFIG_BLK_DEV_ATIIXP is not set
> # CONFIG_BLK_DEV_CMD64X is not set
> # CONFIG_BLK_DEV_TRIFLEX is not set
> # CONFIG_BLK_DEV_HPT366 is not set
> # CONFIG_BLK_DEV_JMICRON is not set
> # CONFIG_BLK_DEV_PIIX is not set
> # CONFIG_BLK_DEV_IT8172 is not set
> # CONFIG_BLK_DEV_IT8213 is not set
> # CONFIG_BLK_DEV_IT821X is not set
> # CONFIG_BLK_DEV_NS87415 is not set
> # CONFIG_BLK_DEV_PDC202XX_OLD is not set
> # CONFIG_BLK_DEV_PDC202XX_NEW is not set
> # CONFIG_BLK_DEV_SVWKS is not set
> # CONFIG_BLK_DEV_SIIMAGE is not set
> # CONFIG_BLK_DEV_SIS5513 is not set
> # CONFIG_BLK_DEV_SLC90E66 is not set
> # CONFIG_BLK_DEV_TRM290 is not set
> # CONFIG_BLK_DEV_VIA82CXXX is not set
> # CONFIG_BLK_DEV_TC86C001 is not set
> # CONFIG_BLK_DEV_IDEDMA is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_SCSI_MQ_DEFAULT is not set
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dy
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_CHR_DEV_OSST is not set
> # CONFIG_BLK_DEV_SR is not set
> CONFIG_CHR_DEV_SG=3Dy
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_ENCLOSURE=3Dy
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> # CONFIG_SCSI_SAS_ATA is not set
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> # CONFIG_SCSI_SRP_ATTRS is not set
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_BOOT_SYSFS=3Dy
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_MPT3SAS is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_VMWARE_PVSCSI is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FUTURE_DOMAIN is not set
> # CONFIG_SCSI_ISCI is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> # CONFIG_SCSI_DEBUG is not set
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_VIRTIO is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> # CONFIG_SCSI_DH_ALUA is not set
> # CONFIG_SCSI_OSD_INITIATOR is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> # CONFIG_ATA_PIIX is not set
> # CONFIG_SATA_MV is not set
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> CONFIG_PATA_PLATFORM=3Dy
> # CONFIG_PATA_RZ1000 is not set
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> # CONFIG_ATA_GENERIC is not set
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> # CONFIG_MD_AUTODETECT is not set
> CONFIG_MD_LINEAR=3Dy
> CONFIG_MD_RAID0=3Dy
> CONFIG_MD_RAID1=3Dy
> # CONFIG_MD_RAID10 is not set
> CONFIG_MD_RAID456=3Dy
> CONFIG_MD_MULTIPATH=3Dy
> # CONFIG_MD_FAULTY is not set
> # CONFIG_BCACHE is not set
> # CONFIG_BLK_DEV_DM is not set
> CONFIG_TARGET_CORE=3Dy
> # CONFIG_TCM_IBLOCK is not set
> CONFIG_TCM_FILEIO=3Dy
> CONFIG_TCM_PSCSI=3Dy
> # CONFIG_TCM_USER2 is not set
> CONFIG_LOOPBACK_TARGET=3Dy
> # CONFIG_ISCSI_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> # CONFIG_VHOST_NET is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5520 is not set
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> CONFIG_KEYBOARD_GPIO=3Dy
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=3Dy
> # CONFIG_KEYBOARD_LM8333 is not set
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> CONFIG_KEYBOARD_SUNKBD=3Dy
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_INPUT_MOUSE is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> CONFIG_JOYSTICK_ANALOG=3Dy
> CONFIG_JOYSTICK_A3D=3Dy
> CONFIG_JOYSTICK_ADI=3Dy
> CONFIG_JOYSTICK_COBRA=3Dy
> # CONFIG_JOYSTICK_GF2K is not set
> CONFIG_JOYSTICK_GRIP=3Dy
> # CONFIG_JOYSTICK_GRIP_MP is not set
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_USB=3Dy
> # CONFIG_JOYSTICK_IFORCE_232 is not set
> # CONFIG_JOYSTICK_WARRIOR is not set
> # CONFIG_JOYSTICK_MAGELLAN is not set
> CONFIG_JOYSTICK_SPACEORB=3Dy
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> # CONFIG_JOYSTICK_STINGER is not set
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_AS5011 is not set
> # CONFIG_JOYSTICK_JOYDUMP is not set
> CONFIG_JOYSTICK_XPAD=3Dy
> # CONFIG_JOYSTICK_XPAD_FF is not set
> # CONFIG_JOYSTICK_XPAD_LEDS is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> CONFIG_TABLET_USB_AIPTEK=3Dy
> CONFIG_TABLET_USB_GTCO=3Dy
> # CONFIG_TABLET_USB_HANWANG is not set
> CONFIG_TABLET_USB_KBTAB=3Dy
> CONFIG_TABLET_SERIAL_WACOM4=3Dy
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> # CONFIG_SERIO_RAW is not set
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> CONFIG_TRACE_ROUTER=3Dy
> CONFIG_TRACE_SINK=3Dy
> CONFIG_DEVMEM=3Dy
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_FINTEK is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> # CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
> CONFIG_SERIAL_IFX6X60=3Dy
> CONFIG_SERIAL_ARC=3Dy
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> CONFIG_SERIAL_MEN_Z135=3Dy
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> # CONFIG_IPMI_SI_PROBE_DEFAULTS is not set
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> # CONFIG_HW_RANDOM_VIRTIO is not set
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_NVRAM=3Dy
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> CONFIG_MWAVE=3Dy
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_CRB is not set
> # CONFIG_TCG_TIS_ST33ZP24 is not set
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
> # CONFIG_XILLYBUS is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_I801 is not set
> # CONFIG_I2C_ISCH is not set
> # CONFIG_I2C_ISMT is not set
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> # CONFIG_I2C_VIAPRO is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_I2C_SCMI is not set
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> CONFIG_I2C_TAOS_EVM=3Dy
> CONFIG_I2C_TINY_USB=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_ALTERA=3Dy
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_CADENCE=3Dy
> # CONFIG_SPI_GPIO is not set
> CONFIG_SPI_OC_TINY=3Dy
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> CONFIG_SPI_SC18IS602=3Dy
> CONFIG_SPI_XCOMM=3Dy
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_DESIGNWARE is not set
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dy
> CONFIG_SPI_TLE62X0=3Dy
> CONFIG_SPMI=3Dy
> # CONFIG_HSI is not set
> =

> #
> # PPS support
> #
> # CONFIG_PPS is not set
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> # CONFIG_PTP_1588_CLOCK is not set
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_DWAPB=3Dy
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_ICH is not set
> CONFIG_GPIO_IT8761E=3Dy
> # CONFIG_GPIO_LYNXPOINT is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_VX855 is not set
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> CONFIG_GPIO_MAX7300=3Dy
> CONFIG_GPIO_MAX732X=3Dy
> # CONFIG_GPIO_MAX732X_IRQ is not set
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_SX150X is not set
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ADP5520 is not set
> CONFIG_GPIO_DA9055=3Dy
> # CONFIG_GPIO_LP3943 is not set
> CONFIG_GPIO_RC5T583=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> CONFIG_GPIO_TWL6040=3Dy
> # CONFIG_GPIO_WM831X is not set
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_INTEL_MID is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX7301 is not set
> CONFIG_GPIO_MCP23S08=3Dy
> CONFIG_GPIO_MC33880=3Dy
> =

> #
> # USB GPIO expanders
> #
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2490=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_MAX8925_POWER=3Dy
> CONFIG_WM831X_BACKUP=3Dy
> # CONFIG_WM831X_POWER is not set
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_BATTERY_BQ27x00=3Dy
> CONFIG_BATTERY_BQ27X00_I2C=3Dy
> # CONFIG_BATTERY_BQ27X00_PLATFORM is not set
> CONFIG_BATTERY_DA9030=3Dy
> # CONFIG_CHARGER_DA9150 is not set
> CONFIG_AXP288_FUEL_GAUGE=3Dy
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_ISP1704=3Dy
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_LP8788=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_MAX8998 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_CHARGER_TPS65090 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_BATTERY_RT5033=3Dy
> # CONFIG_POWER_RESET is not set
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dy
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=3Dy
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> # CONFIG_SENSORS_ADT7310 is not set
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DA9055=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> # CONFIG_SENSORS_F71882FG is not set
> # CONFIG_SENSORS_F75375S is not set
> # CONFIG_SENSORS_MC13783_ADC is not set
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_GPIO_FAN is not set
> CONFIG_SENSORS_HIH6130=3Dy
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4222=3Dy
> CONFIG_SENSORS_LTC4245=3Dy
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_HTU21=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_ADCXX=3Dy
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM70=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dy
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dy
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> # CONFIG_PMBUS is not set
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> # CONFIG_SENSORS_SCH5627 is not set
> # CONFIG_SENSORS_SCH5636 is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> CONFIG_SENSORS_ADS1015=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_THMC50=3Dy
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> # CONFIG_SENSORS_W83L785TS is not set
> # CONFIG_SENSORS_W83L786NG is not set
> # CONFIG_SENSORS_W83627HF is not set
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_WM831X is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INT340X_THERMAL is not set
> =

> #
> # Texas Instruments thermal drivers
> #
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> =

> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_DA9055_WATCHDOG=3Dy
> CONFIG_MENF21BMC_WATCHDOG=3Dy
> # CONFIG_WM831X_WATCHDOG is not set
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_RN5T618_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> # CONFIG_ACQUIRE_WDT is not set
> CONFIG_ADVANTECH_WDT=3Dy
> # CONFIG_ALIM1535_WDT is not set
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> # CONFIG_IT8712F_WDT is not set
> # CONFIG_IT87_WDT is not set
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_SC1200_WDT=3Dy
> CONFIG_PC87413_WDT=3Dy
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> CONFIG_CPU5_WDT=3Dy
> CONFIG_SMSC_SCH311X_WDT=3Dy
> CONFIG_SMSC37B787_WDT=3Dy
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dy
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dy
> CONFIG_MACHZ_WDT=3Dy
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> # CONFIG_WDTPCI is not set
> =

> #
> # USB-based Watchdog Cards
> #
> CONFIG_USBPCWATCHDOG=3Dy
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> # CONFIG_SSB_SDIOHOST is not set
> CONFIG_SSB_SILENT=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> # CONFIG_BCMA_DRIVER_GPIO is not set
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=3Dy
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_AXP20X=3Dy
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_EZX_PCAP=3Dy
> # CONFIG_MFD_VIPERBOARD is not set
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RTSX_USB=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RN5T618=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> # CONFIG_MFD_SYSCON is not set
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> CONFIG_MFD_LP8788=3Dy
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65090=3Dy
> # CONFIG_MFD_TPS65217 is not set
> # CONFIG_MFD_TPS65218 is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> CONFIG_MFD_TPS65912_SPI=3Dy
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM831X_SPI=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AAT2870=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> # CONFIG_REGULATOR_BCM590XX is not set
> CONFIG_REGULATOR_DA903X=3Dy
> # CONFIG_REGULATOR_DA9055 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dy
> CONFIG_REGULATOR_MAX8660=3Dy
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8925=3Dy
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MAX8998=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> # CONFIG_REGULATOR_MC13783 is not set
> CONFIG_REGULATOR_MC13892=3Dy
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PCAP is not set
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> # CONFIG_REGULATOR_RC5T583 is not set
> CONFIG_REGULATOR_RN5T618=3Dy
> # CONFIG_REGULATOR_RT5033 is not set
> CONFIG_REGULATOR_S2MPA01=3Dy
> CONFIG_REGULATOR_S2MPS11=3Dy
> CONFIG_REGULATOR_S5M8767=3Dy
> # CONFIG_REGULATOR_SKY81452 is not set
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65090=3Dy
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8400=3Dy
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_RC_SUPPORT=3Dy
> # CONFIG_MEDIA_CONTROLLER is not set
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_VIDEO_TUNER=3Dy
> CONFIG_VIDEOBUF_GEN=3Dy
> CONFIG_VIDEOBUF_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> =

> #
> # Media drivers
> #
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_LIRC=3Dy
> CONFIG_IR_LIRC_CODEC=3Dy
> CONFIG_IR_NEC_DECODER=3Dy
> CONFIG_IR_RC5_DECODER=3Dy
> CONFIG_IR_RC6_DECODER=3Dy
> # CONFIG_IR_JVC_DECODER is not set
> CONFIG_IR_SONY_DECODER=3Dy
> # CONFIG_IR_SANYO_DECODER is not set
> CONFIG_IR_SHARP_DECODER=3Dy
> CONFIG_IR_MCE_KBD_DECODER=3Dy
> # CONFIG_IR_XMP_DECODER is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_USB_SUPPORT=3Dy
> =

> #
> # Analog TV USB devices
> #
> # CONFIG_VIDEO_PVRUSB2 is not set
> # CONFIG_VIDEO_HDPVR is not set
> CONFIG_VIDEO_USBVISION=3Dy
> CONFIG_VIDEO_STK1160_COMMON=3Dy
> CONFIG_VIDEO_STK1160=3Dy
> =

> #
> # Analog/digital TV USB devices
> #
> CONFIG_VIDEO_CX231XX=3Dy
> CONFIG_VIDEO_CX231XX_RC=3Dy
> # CONFIG_VIDEO_TM6000 is not set
> =

> #
> # Webcam, TV (analog/digital) USB devices
> #
> CONFIG_VIDEO_EM28XX=3Dy
> CONFIG_VIDEO_EM28XX_V4L2=3Dy
> CONFIG_VIDEO_EM28XX_RC=3Dy
> =

> #
> # Software defined radio USB devices
> #
> CONFIG_USB_AIRSPY=3Dy
> CONFIG_USB_HACKRF=3Dy
> CONFIG_USB_MSI2500=3Dy
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_RADIO_ADAPTERS=3Dy
> CONFIG_RADIO_TEA575X=3Dy
> CONFIG_RADIO_SI470X=3Dy
> # CONFIG_USB_SI470X is not set
> CONFIG_I2C_SI470X=3Dy
> # CONFIG_RADIO_SI4713 is not set
> CONFIG_USB_MR800=3Dy
> CONFIG_USB_DSBR=3Dy
> # CONFIG_RADIO_MAXIRADIO is not set
> CONFIG_RADIO_SHARK=3Dy
> # CONFIG_RADIO_SHARK2 is not set
> CONFIG_USB_KEENE=3Dy
> CONFIG_USB_RAREMONO=3Dy
> CONFIG_USB_MA901=3Dy
> CONFIG_RADIO_TEA5764=3Dy
> # CONFIG_RADIO_TEA5764_XTAL is not set
> CONFIG_RADIO_SAA7706H=3Dy
> CONFIG_RADIO_TEF6862=3Dy
> # CONFIG_RADIO_WL1273 is not set
> =

> #
> # Texas Instruments WL128x FM driver (ST based)
> #
> CONFIG_VIDEO_CX2341X=3Dy
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_CYPRESS_FIRMWARE=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> CONFIG_VIDEO_IR_I2C=3Dy
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_MSP3400=3Dy
> =

> #
> # RDS decoders
> #
> =

> #
> # Video decoders
> #
> CONFIG_VIDEO_SAA711X=3Dy
> CONFIG_VIDEO_TVP5150=3Dy
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_CX25840=3Dy
> =

> #
> # Video encoders
> #
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_MT9V011=3Dy
> =

> #
> # Flash devices
> #
> =

> #
> # Video improvement chips
> #
> =

> #
> # Audio/Video compression chips
> #
> =

> #
> # Miscellaneous helper chips
> #
> =

> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dy
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> CONFIG_MEDIA_TUNER_TEA5761=3Dy
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> CONFIG_MEDIA_TUNER_MSI001=3Dy
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> =

> #
> # Direct Rendering Manager
> #
> CONFIG_DRM=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_ADV7511=3Dy
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> CONFIG_DRM_UDL=3Dy
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_SVGALIB is not set
> # CONFIG_FB_MACMODES is not set
> # CONFIG_FB_BACKLIGHT is not set
> # CONFIG_FB_MODE_HELPERS is not set
> # CONFIG_FB_TILEBLITTING is not set
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> CONFIG_FB_ARC=3Dy
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> CONFIG_FB_SM501=3Dy
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dy
> # CONFIG_FB_AUO_K1901 is not set
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_L4F00242T03=3Dy
> # CONFIG_LCD_LMS283GF05 is not set
> CONFIG_LCD_LTV350QV=3Dy
> CONFIG_LCD_ILI922X=3Dy
> CONFIG_LCD_ILI9320=3Dy
> # CONFIG_LCD_TDO24M is not set
> CONFIG_LCD_VGG2432A4=3Dy
> CONFIG_LCD_PLATFORM=3Dy
> # CONFIG_LCD_S6E63M0 is not set
> CONFIG_LCD_LD9040=3Dy
> CONFIG_LCD_AMS369FG06=3Dy
> CONFIG_LCD_LMS501KF03=3Dy
> # CONFIG_LCD_HX8357 is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> # CONFIG_BACKLIGHT_PWM is not set
> # CONFIG_BACKLIGHT_DA903X is not set
> # CONFIG_BACKLIGHT_MAX8925 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP5520 is not set
> CONFIG_BACKLIGHT_ADP8860=3Dy
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_PCF50633 is not set
> CONFIG_BACKLIGHT_AAT2870=3Dy
> # CONFIG_BACKLIGHT_LM3630A is not set
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_LP8788=3Dy
> CONFIG_BACKLIGHT_SKY81452=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> CONFIG_LOGO=3Dy
> CONFIG_LOGO_LINUX_MONO=3Dy
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_APPLEIR=3Dy
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_BETOP_FF=3Dy
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> CONFIG_HID_CP2112=3Dy
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_ELO=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_HOLTEK=3Dy
> # CONFIG_HOLTEK_FF is not set
> # CONFIG_HID_GT683R is not set
> # CONFIG_HID_KEYTOUCH is not set
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_UCLOGIC=3Dy
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> CONFIG_HID_LENOVO=3Dy
> CONFIG_HID_LOGITECH=3Dy
> # CONFIG_HID_LOGITECH_HIDPP is not set
> CONFIG_LOGITECH_FF=3Dy
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> # CONFIG_LOGIG940_FF is not set
> CONFIG_LOGIWHEELS_FF=3Dy
> CONFIG_HID_MAGICMOUSE=3Dy
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> # CONFIG_HID_MULTITOUCH is not set
> CONFIG_HID_NTRIG=3Dy
> # CONFIG_HID_ORTEK is not set
> CONFIG_HID_PANTHERLORD=3Dy
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PENMOUNT is not set
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dy
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> # CONFIG_HID_PICOLCD_CIR is not set
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_ROCCAT is not set
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SONY=3Dy
> CONFIG_SONY_FF=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> # CONFIG_HID_RMI is not set
> # CONFIG_HID_GREENASIA is not set
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_WACOM=3Dy
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> CONFIG_ZEROPLUS_FF=3Dy
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> # CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_OTG=3Dy
> CONFIG_USB_OTG_WHITELIST=3Dy
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> CONFIG_USB_OTG_FSM=3Dy
> # CONFIG_USB_MON is not set
> CONFIG_USB_WUSB=3Dy
> CONFIG_USB_WUSB_CBAF=3Dy
> # CONFIG_USB_WUSB_CBAF_DEBUG is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_XHCI_PCI=3Dy
> CONFIG_USB_XHCI_PLATFORM=3Dy
> CONFIG_USB_EHCI_HCD=3Dy
> # CONFIG_USB_EHCI_ROOT_HUB_TT is not set
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_PCI=3Dy
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dy
> # CONFIG_USB_ISP116X_HCD is not set
> CONFIG_USB_ISP1362_HCD=3Dy
> CONFIG_USB_FUSBH200_HCD=3Dy
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> CONFIG_USB_OHCI_HCD_SSB=3Dy
> CONFIG_USB_OHCI_HCD_PLATFORM=3Dy
> # CONFIG_USB_UHCI_HCD is not set
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_WHCI_HCD is not set
> CONFIG_USB_HWA_HCD=3Dy
> # CONFIG_USB_HCD_BCMA is not set
> CONFIG_USB_HCD_SSB=3Dy
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=3Dy
> # CONFIG_USB_PRINTER is not set
> CONFIG_USB_WDM=3Dy
> CONFIG_USB_TMC=3Dy
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dy
> CONFIG_USB_STORAGE_DEBUG=3Dy
> CONFIG_USB_STORAGE_REALTEK=3Dy
> # CONFIG_REALTEK_AUTOPM is not set
> CONFIG_USB_STORAGE_DATAFAB=3Dy
> # CONFIG_USB_STORAGE_FREECOM is not set
> CONFIG_USB_STORAGE_ISD200=3Dy
> CONFIG_USB_STORAGE_USBAT=3Dy
> # CONFIG_USB_STORAGE_SDDR09 is not set
> # CONFIG_USB_STORAGE_SDDR55 is not set
> CONFIG_USB_STORAGE_JUMPSHOT=3Dy
> # CONFIG_USB_STORAGE_ALAUDA is not set
> CONFIG_USB_STORAGE_ONETOUCH=3Dy
> # CONFIG_USB_STORAGE_KARMA is not set
> CONFIG_USB_STORAGE_CYPRESS_ATACB=3Dy
> CONFIG_USB_STORAGE_ENE_UB6250=3Dy
> # CONFIG_USB_UAS is not set
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> CONFIG_USB_MICROTEK=3Dy
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_MUSB_HDRC is not set
> CONFIG_USB_DWC3=3Dy
> # CONFIG_USB_DWC3_HOST is not set
> # CONFIG_USB_DWC3_GADGET is not set
> CONFIG_USB_DWC3_DUAL_ROLE=3Dy
> =

> #
> # Platform Glue Driver Support
> #
> CONFIG_USB_DWC3_PCI=3Dy
> =

> #
> # Debugging features
> #
> CONFIG_USB_DWC3_DEBUG=3Dy
> CONFIG_USB_DWC2=3Dy
> CONFIG_USB_DWC2_HOST=3Dy
> =

> #
> # Gadget/Dual-role mode requires USB Gadget support to be enabled
> #
> # CONFIG_USB_DWC2_PERIPHERAL is not set
> # CONFIG_USB_DWC2_DUAL_ROLE is not set
> CONFIG_USB_DWC2_PLATFORM=3Dy
> # CONFIG_USB_DWC2_PCI is not set
> # CONFIG_USB_DWC2_DEBUG is not set
> # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> CONFIG_USB_CHIPIDEA=3Dy
> CONFIG_USB_CHIPIDEA_UDC=3Dy
> # CONFIG_USB_CHIPIDEA_HOST is not set
> # CONFIG_USB_CHIPIDEA_DEBUG is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> CONFIG_USB_SERIAL=3Dy
> # CONFIG_USB_SERIAL_CONSOLE is not set
> # CONFIG_USB_SERIAL_GENERIC is not set
> CONFIG_USB_SERIAL_SIMPLE=3Dy
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> CONFIG_USB_SERIAL_ARK3116=3Dy
> CONFIG_USB_SERIAL_BELKIN=3Dy
> CONFIG_USB_SERIAL_CH341=3Dy
> CONFIG_USB_SERIAL_WHITEHEAT=3Dy
> CONFIG_USB_SERIAL_DIGI_ACCELEPORT=3Dy
> CONFIG_USB_SERIAL_CP210X=3Dy
> CONFIG_USB_SERIAL_CYPRESS_M8=3Dy
> # CONFIG_USB_SERIAL_EMPEG is not set
> CONFIG_USB_SERIAL_FTDI_SIO=3Dy
> CONFIG_USB_SERIAL_VISOR=3Dy
> # CONFIG_USB_SERIAL_IPAQ is not set
> CONFIG_USB_SERIAL_IR=3Dy
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> CONFIG_USB_SERIAL_EDGEPORT_TI=3Dy
> CONFIG_USB_SERIAL_F81232=3Dy
> CONFIG_USB_SERIAL_GARMIN=3Dy
> CONFIG_USB_SERIAL_IPW=3Dy
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> CONFIG_USB_SERIAL_KEYSPAN=3Dy
> # CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
> CONFIG_USB_SERIAL_KEYSPAN_USA28=3Dy
> CONFIG_USB_SERIAL_KEYSPAN_USA28X=3Dy
> CONFIG_USB_SERIAL_KEYSPAN_USA28XA=3Dy
> # CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
> # CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
> CONFIG_USB_SERIAL_KEYSPAN_USA18X=3Dy
> CONFIG_USB_SERIAL_KEYSPAN_USA19W=3Dy
> # CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
> # CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
> # CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
> CONFIG_USB_SERIAL_KEYSPAN_USA49WLC=3Dy
> CONFIG_USB_SERIAL_KLSI=3Dy
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> CONFIG_USB_SERIAL_MCT_U232=3Dy
> CONFIG_USB_SERIAL_METRO=3Dy
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> CONFIG_USB_SERIAL_MXUPORT=3Dy
> CONFIG_USB_SERIAL_NAVMAN=3Dy
> CONFIG_USB_SERIAL_PL2303=3Dy
> CONFIG_USB_SERIAL_OTI6858=3Dy
> CONFIG_USB_SERIAL_QCAUX=3Dy
> CONFIG_USB_SERIAL_QUALCOMM=3Dy
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> CONFIG_USB_SERIAL_SAFE=3Dy
> CONFIG_USB_SERIAL_SAFE_PADDED=3Dy
> CONFIG_USB_SERIAL_SIERRAWIRELESS=3Dy
> # CONFIG_USB_SERIAL_SYMBOL is not set
> # CONFIG_USB_SERIAL_TI is not set
> CONFIG_USB_SERIAL_CYBERJACK=3Dy
> CONFIG_USB_SERIAL_XIRCOM=3Dy
> CONFIG_USB_SERIAL_WWAN=3Dy
> CONFIG_USB_SERIAL_OPTION=3Dy
> # CONFIG_USB_SERIAL_OMNINET is not set
> CONFIG_USB_SERIAL_OPTICON=3Dy
> CONFIG_USB_SERIAL_XSENS_MT=3Dy
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> # CONFIG_USB_SERIAL_QT2 is not set
> CONFIG_USB_SERIAL_DEBUG=3Dy
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> CONFIG_USB_EMI26=3Dy
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=3Dy
> # CONFIG_USB_RIO500 is not set
> CONFIG_USB_LEGOTOWER=3Dy
> # CONFIG_USB_LCD is not set
> CONFIG_USB_LED=3Dy
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=3Dy
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=3Dy
> # CONFIG_USB_SISUSBVGA is not set
> CONFIG_USB_LD=3Dy
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> CONFIG_USB_TEST=3Dy
> CONFIG_USB_EHSET_TEST_FIXTURE=3Dy
> # CONFIG_USB_ISIGHTFW is not set
> CONFIG_USB_YUREX=3Dy
> CONFIG_USB_EZUSB_FX2=3Dy
> # CONFIG_USB_HSIC_USB3503 is not set
> CONFIG_USB_LINK_LAYER_TEST=3Dy
> CONFIG_USB_CHAOSKEY=3Dy
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> # CONFIG_NOP_USB_XCEIV is not set
> CONFIG_USB_GPIO_VBUS=3Dy
> CONFIG_TAHVO_USB=3Dy
> # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
> CONFIG_USB_ISP1301=3Dy
> CONFIG_USB_GADGET=3Dy
> CONFIG_USB_GADGET_DEBUG=3Dy
> # CONFIG_USB_GADGET_VERBOSE is not set
> # CONFIG_USB_GADGET_DEBUG_FILES is not set
> CONFIG_USB_GADGET_DEBUG_FS=3Dy
> CONFIG_USB_GADGET_VBUS_DRAW=3D2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> =

> #
> # USB Peripheral Controller
> #
> # CONFIG_USB_FOTG210_UDC is not set
> # CONFIG_USB_GR_UDC is not set
> CONFIG_USB_R8A66597=3Dy
> CONFIG_USB_PXA27X=3Dy
> CONFIG_USB_MV_UDC=3Dy
> # CONFIG_USB_MV_U3D is not set
> CONFIG_USB_M66592=3Dy
> CONFIG_USB_BDC_UDC=3Dy
> =

> #
> # Platform Support
> #
> CONFIG_USB_BDC_PCI=3Dy
> # CONFIG_USB_AMD5536UDC is not set
> CONFIG_USB_NET2272=3Dy
> CONFIG_USB_NET2272_DMA=3Dy
> # CONFIG_USB_NET2280 is not set
> # CONFIG_USB_GOKU is not set
> # CONFIG_USB_EG20T is not set
> CONFIG_USB_DUMMY_HCD=3Dy
> CONFIG_USB_LIBCOMPOSITE=3Dy
> CONFIG_USB_F_FS=3Dy
> # CONFIG_USB_CONFIGFS is not set
> # CONFIG_USB_ZERO is not set
> # CONFIG_USB_ETH is not set
> # CONFIG_USB_G_NCM is not set
> # CONFIG_USB_GADGETFS is not set
> CONFIG_USB_FUNCTIONFS=3Dy
> # CONFIG_USB_FUNCTIONFS_ETH is not set
> # CONFIG_USB_FUNCTIONFS_RNDIS is not set
> CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
> # CONFIG_USB_MASS_STORAGE is not set
> # CONFIG_USB_GADGET_TARGET is not set
> # CONFIG_USB_G_SERIAL is not set
> # CONFIG_USB_G_PRINTER is not set
> # CONFIG_USB_CDC_COMPOSITE is not set
> # CONFIG_USB_G_ACM_MS is not set
> # CONFIG_USB_G_MULTI is not set
> # CONFIG_USB_G_HID is not set
> # CONFIG_USB_G_DBGP is not set
> # CONFIG_USB_G_WEBCAM is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_HWA=3Dy
> # CONFIG_UWB_WHCI is not set
> # CONFIG_UWB_I1480U is not set
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_CLKGATE is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_MMC_BLOCK_BOUNCE=3Dy
> # CONFIG_SDIO_UART is not set
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> # CONFIG_MMC_TIFM_SD is not set
> CONFIG_MMC_SPI=3Dy
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_VUB300 is not set
> CONFIG_MMC_USHC=3Dy
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_REALTEK_USB=3Dy
> # CONFIG_MMC_TOSHIBA_PCI is not set
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> # CONFIG_MSPRO_BLOCK is not set
> CONFIG_MS_BLOCK=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_MEMSTICK_REALTEK_USB=3Dy
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_LM3530=3Dy
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> # CONFIG_LEDS_LP8501 is not set
> # CONFIG_LEDS_LP8788 is not set
> CONFIG_LEDS_LP8860=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_WM831X_STATUS is not set
> # CONFIG_LEDS_DA903X is not set
> CONFIG_LEDS_DAC124S085=3Dy
> CONFIG_LEDS_PWM=3Dy
> # CONFIG_LEDS_REGULATOR is not set
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> # CONFIG_LEDS_PM8941_WLED is not set
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACERHDF is not set
> # CONFIG_ASUS_LAPTOP is not set
> CONFIG_DELL_LAPTOP=3Dy
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_ACPI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_IBM_RTL is not set
> CONFIG_SAMSUNG_LAPTOP=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_CHROME_PLATFORMS is not set
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> # CONFIG_PCC is not set
> CONFIG_ALTERA_MBOX=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> CONFIG_STE_MODEM_RPROC=3Dy
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> CONFIG_SOC_TI=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> # CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_PM_DEVFREQ_EVENT=3Dy
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_RT8973A is not set
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=3Dy
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> =

> #
> # Accelerometers
> #
> # CONFIG_BMA180 is not set
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=3Dy
> CONFIG_MMA8452=3Dy
> # CONFIG_KXCJK1013 is not set
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> # CONFIG_AD7266 is not set
> CONFIG_AD7291=3Dy
> CONFIG_AD7298=3Dy
> CONFIG_AD7476=3Dy
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> CONFIG_AD7923=3Dy
> CONFIG_AD799X=3Dy
> # CONFIG_AXP288_ADC is not set
> CONFIG_DA9150_GPADC=3Dy
> CONFIG_CC10001_ADC=3Dy
> CONFIG_LP8788_ADC=3Dy
> CONFIG_MAX1027=3Dy
> # CONFIG_MAX1363 is not set
> # CONFIG_MCP320X is not set
> CONFIG_MCP3422=3Dy
> # CONFIG_MEN_Z188_ADC is not set
> CONFIG_NAU7802=3Dy
> CONFIG_QCOM_SPMI_IADC=3Dy
> CONFIG_QCOM_SPMI_VADC=3Dy
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADC128S052=3Dy
> CONFIG_TI_AM335X_ADC=3Dy
> =

> #
> # Amplifiers
> #
> # CONFIG_AD8366 is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> =

> #
> # SSP Sensor Common
> #
> # CONFIG_IIO_SSP_SENSORHUB is not set
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5360=3Dy
> # CONFIG_AD5380 is not set
> CONFIG_AD5421=3Dy
> CONFIG_AD5446=3Dy
> CONFIG_AD5449=3Dy
> # CONFIG_AD5504 is not set
> # CONFIG_AD5624R_SPI is not set
> # CONFIG_AD5686 is not set
> # CONFIG_AD5755 is not set
> # CONFIG_AD5764 is not set
> # CONFIG_AD5791 is not set
> CONFIG_AD7303=3Dy
> # CONFIG_MAX517 is not set
> # CONFIG_MCP4725 is not set
> # CONFIG_MCP4922 is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> # CONFIG_AD9523 is not set
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> CONFIG_ADF4350=3Dy
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=3Dy
> CONFIG_ADIS16130=3Dy
> # CONFIG_ADIS16136 is not set
> CONFIG_ADIS16260=3Dy
> # CONFIG_ADXRS450 is not set
> CONFIG_BMG160=3Dy
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> =

> #
> # Humidity sensors
> #
> CONFIG_DHT11=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dy
> # CONFIG_ADIS16480 is not set
> CONFIG_KMX61=3Dy
> # CONFIG_INV_MPU6050_IIO is not set
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ADJD_S311 is not set
> CONFIG_AL3320A=3Dy
> CONFIG_APDS9300=3Dy
> CONFIG_CM32181=3Dy
> CONFIG_CM3232=3Dy
> CONFIG_CM3323=3Dy
> # CONFIG_CM36651 is not set
> # CONFIG_GP2AP020A00F is not set
> CONFIG_ISL29125=3Dy
> CONFIG_HID_SENSOR_ALS=3Dy
> CONFIG_HID_SENSOR_PROX=3Dy
> CONFIG_JSA1212=3Dy
> CONFIG_LTR501=3Dy
> CONFIG_TCS3414=3Dy
> # CONFIG_TCS3472 is not set
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL4531=3Dy
> CONFIG_VCNL4000=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> # CONFIG_AK09911 is not set
> CONFIG_MAG3110=3Dy
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> =

> #
> # Inclinometer sensors
> #
> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> =

> #
> # Pressure sensors
> #
> CONFIG_BMP280=3Dy
> CONFIG_HID_SENSOR_PRESS=3Dy
> CONFIG_MPL115=3Dy
> # CONFIG_MPL3115 is not set
> CONFIG_MS5611=3Dy
> # CONFIG_MS5611_I2C is not set
> CONFIG_MS5611_SPI=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> CONFIG_IIO_ST_PRESS_SPI=3Dy
> CONFIG_T5403=3Dy
> =

> #
> # Lightning sensors
> #
> CONFIG_AS3935=3Dy
> =

> #
> # Proximity sensors
> #
> CONFIG_SX9500=3Dy
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_LP3943=3Dy
> # CONFIG_PWM_LPSS is not set
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_SERIAL_IPOCTAL=3Dy
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_USE_FOR_EXT23 is not set
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_ENCRYPTION is not set
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> # CONFIG_XFS_FS is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> # CONFIG_NILFS2_FS is not set
> # CONFIG_F2FS_FS is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dy
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> # CONFIG_JOLIET is not set
> CONFIG_ZISOFS=3Dy
> # CONFIG_UDF_FS is not set
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_NTFS_FS=3Dy
> # CONFIG_NTFS_DEBUG is not set
> # CONFIG_NTFS_RW is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ADFS_FS=3Dy
> CONFIG_ADFS_FS_RW=3Dy
> CONFIG_AFFS_FS=3Dy
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> CONFIG_BEFS_FS=3Dy
> CONFIG_BEFS_DEBUG=3Dy
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> # CONFIG_JFFS2_FS is not set
> # CONFIG_LOGFS is not set
> # CONFIG_CRAMFS is not set
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> CONFIG_SQUASHFS_DECOMP_SINGLE=3Dy
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU is not set
> CONFIG_SQUASHFS_XATTR=3Dy
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> # CONFIG_SQUASHFS_XZ is not set
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> CONFIG_MINIX_FS=3Dy
> CONFIG_OMFS_FS=3Dy
> CONFIG_HPFS_FS=3Dy
> CONFIG_QNX4FS_FS=3Dy
> CONFIG_QNX6FS_FS=3Dy
> # CONFIG_QNX6FS_DEBUG is not set
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> # CONFIG_ROMFS_BACKED_BY_MTD is not set
> CONFIG_ROMFS_BACKED_BY_BOTH=3Dy
> CONFIG_ROMFS_ON_BLOCK=3Dy
> CONFIG_ROMFS_ON_MTD=3Dy
> # CONFIG_PSTORE is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> # CONFIG_NLS_CODEPAGE_863 is not set
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=3Dy
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
> # CONFIG_NLS_MAC_ROMANIAN is not set
> # CONFIG_NLS_MAC_TURKISH is not set
> CONFIG_NLS_UTF8=3Dy
> =

> #
> # Kernel hacking
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D2048
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=3Dy
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_DEBUG_OBJECTS=3Dy
> CONFIG_DEBUG_OBJECTS_SELFTEST=3Dy
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> CONFIG_DEBUG_OBJECTS_WORK=3Dy
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> CONFIG_DEBUG_VM_RB=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_KMEMCHECK is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_KASAN_SHADOW_OFFSET=3D0xdffffc0000000000
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_TIMER_STATS is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> CONFIG_SPARSE_RCU_POINTER=3Dy
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_TORTURE_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST_RUNNABLE is not set
> # CONFIG_RCU_TORTURE_TEST_SLOW_PREINIT is not set
> CONFIG_RCU_TORTURE_TEST_SLOW_INIT=3Dy
> CONFIG_RCU_TORTURE_TEST_SLOW_INIT_DELAY=3D3
> # CONFIG_RCU_TORTURE_TEST_SLOW_CLEANUP is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> =

> #
> # Runtime Testing
> #
> CONFIG_LKDTM=3Dy
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> CONFIG_ASYNC_RAID6_TEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_UDELAY is not set
> CONFIG_MEMTEST=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DOUBLEFAULT is not set
> CONFIG_DEBUG_TLBFLUSH=3Dy
> # CONFIG_IOMMU_STRESS is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D0
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_STATIC_CPU_HAS=3Dy
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> =

> #
> # Security options
> #
> # CONFIG_KEYS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_MEMCPY=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
> CONFIG_ASYNC_RAID6_RECOV=3Dy
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_BLKCIPHER=3Dy
> CONFIG_CRYPTO_BLKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> # CONFIG_CRYPTO_NULL is not set
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> # CONFIG_CRYPTO_GCM is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> # CONFIG_CRYPTO_CRCT10DIF_PCLMUL is not set
> CONFIG_CRYPTO_GHASH=3Dy
> # CONFIG_CRYPTO_MD4 is not set
> # CONFIG_CRYPTO_MD5 is not set
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA1_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_TGR192 is not set
> # CONFIG_CRYPTO_WP512 is not set
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> # CONFIG_CRYPTO_ANUBIS is not set
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_X86_64=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> # CONFIG_CRYPTO_ZLIB is not set
> # CONFIG_CRYPTO_LZO is not set
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> # CONFIG_CRYPTO_DRBG_HMAC is not set
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_HW is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> CONFIG_BITREVERSE=3Dy
> # CONFIG_HAVE_ARCH_BITREVERSE is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_BCH=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_AVERAGE=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy


--===============8844366063355348648==--

