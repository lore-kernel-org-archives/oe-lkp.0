Content-Type: multipart/mixed; boundary="===============7271029000131160230=="
MIME-Version: 1.0
From: Thomas Meyer <thomas@m3y3r.de>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: use-after-free in cmp_ex_search+0x29/0x71
Date: Thu, 30 Nov 2017 06:16:58 +0100
Message-ID: <20171130045443.2pflxxr2da2gk6ys@olymp>
In-Reply-To: <20171130033606.phku2zulvuhrexke@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7271029000131160230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2017 at 11:36:06AM +0800, Fengguang Wu wrote:
> Hello,

Hi,

I've no idea what is going on here, maybe perf related?
I did CC Ingo and Peter, maybe they can help.

maybe related to modules and perf, but thats just a guess.

> =

> FYI this happens in mainline kernel 4.15.0-rc1.
> It looks like a new regression and hard to bisect.
> =

> It occurs in 1 out of 19 boots.
> =

> Starting udev
> /etc/rcS.d/S03udev: line 72: can't create /proc/sys/kernel/hotplug: nonex=
istent directory
> [   23.684970] gfs2: path_lookup on rootfs returned error -2
> Kernel tests: Boot OK!
> [   40.847825] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   40.848720] BUG: KASAN: use-after-free in cmp_ex_search+0x29/0x71:
> 						ex_to_insn at lib/extable.c:23
> 						 (inlined by) cmp_ex_search at lib/extable.c:104
> [   40.849362] Read of size 8 at addr ffff8800155d8578 by task trinity-ma=
in/504
> [   40.850085]
> [   40.850317] CPU: 0 PID: 504 Comm: trinity-main Not tainted 4.15.0-rc1 =
#204
> [   40.851013] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   40.851880] Call Trace:
> [   40.852190]
> [   40.852424] Allocated by task 504:
> [   40.852845]  kasan_kmalloc+0x62/0xee
> [   40.853315]  kasan_kmalloc+0x7f/0x8b:
> 						kasan_kmalloc at mm/kasan/kasan.c:552
> [   40.853735]  kmem_cache_alloc_trace+0x289/0x29b:
> 						kmem_cache_alloc_trace at mm/slub.c:2754
> [   40.854234]  perf_event_alloc+0x20e/0x1cb7:
> 						perf_event_alloc at kernel/events/core.c:9368
> [   40.854714]  SyS_perf_event_open+0xa89/0x200a
> [   40.855201]  entry_SYSCALL_64_fastpath+0x1a/0x7d:
> 						entry_SYSCALL_64_fastpath at arch/x86/entry/entry_64.S:210
> [   40.855705]
> [   40.855931] Freed by task 504:
> [   40.856296]  kasan_slab_free+0xc8/0x171:
> 						filter_irq_stacks at mm/kasan/kasan.c:427
> 						 (inlined by) save_stack at mm/kasan/kasan.c:448
> 						 (inlined by) set_track at mm/kasan/kasan.c:459
> 						 (inlined by) kasan_slab_free at mm/kasan/kasan.c:524
> [   40.856736]  kfree+0x1ef/0x333:
> 						slab_free at mm/slub.c:2973
> 						 (inlined by) kfree at mm/slub.c:3899
> [   40.857098]  perf_event_alloc+0x1c73/0x1cb7:
> 						perf_event_alloc at kernel/events/core.c:9532
> [   40.857567]  SyS_perf_event_open+0xa89/0x200a
> [   40.858048]  entry_SYSCALL_64_fastpath+0x1a/0x7d:
> 						entry_SYSCALL_64_fastpath at arch/x86/entry/entry_64.S:210
> [   40.858549]
> [   40.858777] The buggy address belongs to the object at ffff8800155d8008
> [   40.858777]  which belongs to the cache kmalloc-2048 of size 2048
> =

> Attached the full dmesg, kconfig and reproduce scripts.
> =

> Thanks,
> Fengguang

> early console in setup code
> early console in extract_kernel
> input_data: 0x0000000003884255
> input_len: 0x0000000000c55337
> output: 0x0000000001000000
> output_len: 0x0000000002f1d960
> kernel_total_size: 0x00000000034f9000
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> [    0.000000] Linux version 4.15.0-rc1 (kbuild(a)ivytown2) (gcc version =
7.2.1 20171025 (Debian 7.2.0-12)) #204 SMP PREEMPT Thu Nov 30 02:25:05 CST =
2017
> [    0.000000] Command line: root=3D/dev/ram0 hung_task_panic=3D1 debug a=
pic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.i=
fnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=
=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3Dt=
tyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw link=3D/kbuild-tests/run=
-queue/kvm/x86_64-randconfig-v0-11300145/linux-devel:devel-hourly-201711291=
5:4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/.vmlinuz-4fbd8d194f06c8a3fd2af1c=
e560ddb31f7ec8323-20171130034954-19:yocto-lkp-hsw01-33 branch=3Dlinux-devel=
/devel-hourly-2017112915 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-v0-11300=
145/gcc-7/4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/vmlinuz-4.15.0-rc1 drbd.=
minor_count=3D8
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 =
bytes, using 'standard' format.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001ffdbfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000001ffdc000-0x000000001fffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] debug: ignoring loglevel setting.
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] random: fast init done
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1=
 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x1ffdc max_arch_pfn =3D 0x400000000
> [    0.000000] MTRR default type: write-back
> [    0.000000] MTRR fixed ranges enabled:
> [    0.000000]   00000-9FFFF write-back
> [    0.000000]   A0000-BFFFF uncachable
> [    0.000000]   C0000-FFFFF write-protect
> [    0.000000] MTRR variable ranges enabled:
> [    0.000000]   0 base 0080000000 mask FF80000000 uncachable
> [    0.000000]   1 disabled
> [    0.000000]   2 disabled
> [    0.000000]   3 disabled
> [    0.000000]   4 disabled
> [    0.000000]   5 disabled
> [    0.000000]   6 disabled
> [    0.000000]   7 disabled
> [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT  =

> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f6a90-0x000f6a9f] mapped a=
t [ffffffffff200a90]
> [    0.000000]   mpc: f6aa0-f6b80
> [    0.000000] Scanning 1 areas for low memory corruption
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] BRK [0x044d4000, 0x044d4fff] PGTABLE
> [    0.000000] BRK [0x044d5000, 0x044d5fff] PGTABLE
> [    0.000000] BRK [0x044d6000, 0x044d6fff] PGTABLE
> [    0.000000] BRK [0x044d7000, 0x044d7fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x1fbf9000-0x1ffcffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F68C0 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x000000001FFE15CE 000030 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x000000001FFE142A 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x000000001FFE0040 0013EA (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x000000001FFE0000 000040
> [    0.000000] ACPI: APIC 0x000000001FFE151E 000078 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x000000001FFE1596 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] kvm-clock: cpu 0, msr 0:1ffda001, primary cpu clock
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: using sched offset of 603241343 cycles
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x000000001ffdbfff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x000000001ffdbfff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000001ff=
dbfff]
> [    0.000000] On node 0 totalpages: 130938
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1984 pages used for memmap
> [    0.000000]   DMA32 zone: 126940 pages, LIFO batch:31
> [    0.000000] Reserved but unavailable: 98 pages
> [    0.000000] kasan: KernelAddressSanitizer initialized
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
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
> [    0.000000] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
> [    0.000000] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> [    0.000000] e820: [mem 0x20000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.000000] setup_percpu: NR_CPUS:64 nr_cpumask_bits:64 nr_cpu_ids:1 n=
r_node_ids:1
> [    0.000000] percpu: Embedded 46 pages/cpu @ffff88001aa00000 s151552 r8=
192 d28672 u2097152
> [    0.000000] pcpu-alloc: s151552 r8192 d28672 u2097152 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1aa24040
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 128=
869
> [    0.000000] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 =
debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D10=
0 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor=
_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprin=
tk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw link=3D/kbuild-tes=
ts/run-queue/kvm/x86_64-randconfig-v0-11300145/linux-devel:devel-hourly-201=
7112915:4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/.vmlinuz-4fbd8d194f06c8a3f=
d2af1ce560ddb31f7ec8323-20171130034954-19:yocto-lkp-hsw01-33 branch=3Dlinux=
-devel/devel-hourly-2017112915 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-v0=
-11300145/gcc-7/4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323/vmlinuz-4.15.0-rc1=
 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.000000] Memory: 383980K/523752K available (25720K kernel code, 727=
5K rwdata, 6920K rodata, 1944K init, 9944K bss, 139772K reserved, 0K cma-re=
served)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1,=
 Nodes=3D1
> [    0.000000] ftrace: allocating 34926 entries in 137 pages
> [    0.010000] Preemptible hierarchical RCU implementation.
> [    0.010000] 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D1.
> [    0.010000] 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stall_=
timeout).
> [    0.010000] 	Tasks RCU enabled.
> [    0.010000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D1
> [    0.010000] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
> [    0.010000] 	Offload RCU callbacks from CPUs: .
> [    0.010000] Console: colour VGA+ 80x25
> [    0.010000] console [tty0] enabled
> [    0.010000] console [ttyS0] enabled
> [    0.010000] bootconsole [earlyser0] disabled
> [    0.010000] ACPI: Core revision 20170831
> [    0.010000] ACPI: 1 ACPI AML tables successfully acquired and loaded
> [    0.010000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.010000] hpet clockevent registered
> [    0.010067] APIC: Switch to symmetric I/O mode setup
> [    0.010687] enabled ExtINT on CPU#0
> [    0.011601] ENABLING IO-APIC IRQs
> [    0.012059] init IO_APIC IRQs
> [    0.012416]  apic 0 pin 0 not connected
> [    0.012905] IOAPIC[0]: Set routing entry (0-1 -> 0xef -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.013776] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.014653] IOAPIC[0]: Set routing entry (0-3 -> 0xef -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.015702] IOAPIC[0]: Set routing entry (0-4 -> 0xef -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.016593] IOAPIC[0]: Set routing entry (0-5 -> 0xef -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.017440] IOAPIC[0]: Set routing entry (0-6 -> 0xef -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.018271] IOAPIC[0]: Set routing entry (0-7 -> 0xef -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.019205] IOAPIC[0]: Set routing entry (0-8 -> 0xef -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-9 -> 0xef -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-10 -> 0xef -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-11 -> 0xef -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-12 -> 0xef -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-13 -> 0xef -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-14 -> 0xef -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.020000] IOAPIC[0]: Set routing entry (0-15 -> 0xef -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.020000]  apic 0 pin 16 not connected
> [    0.020000]  apic 0 pin 17 not connected
> [    0.020000]  apic 0 pin 18 not connected
> [    0.020000]  apic 0 pin 19 not connected
> [    0.020000]  apic 0 pin 20 not connected
> [    0.020000]  apic 0 pin 21 not connected
> [    0.020000]  apic 0 pin 22 not connected
> [    0.020000]  apic 0 pin 23 not connected
> [    0.020000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.020000] tsc: Detected 2593.992 MHz processor
> [    0.020000] Calibrating delay loop (skipped) preset value.. 5187.98 Bo=
goMIPS (lpj=3D25939920)
> [    0.020000] pid_max: default: 32768 minimum: 301
> [    0.020000] Security Framework initialized
> [    0.020000] LoadPin: ready to pin (currently enabled)
> [    0.020000] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
> [    0.020000] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.020000] CPU: Physical Processor ID: 0
> [    0.020000] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.020000] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.033943] Freeing SMP alternatives memory: 28K
> [    0.035870] TSC deadline timer enabled
> [    0.036293] smpboot: CPU0: Intel Core Processor (Haswell) (family: 0x6=
, model: 0x3c, stepping: 0x4)
> [    0.070096] Performance Events: unsupported p6 CPU model 60 no PMU dri=
ver, software events only.
> [    0.090037] Hierarchical SRCU implementation.
> [    0.130053] smp: Bringing up secondary CPUs ...
> [    0.130602] smp: Brought up 1 node, 1 CPU
> [    0.131032] smpboot: Max logical packages: 1
> [    0.131490] smpboot: Total of 1 processors activated (5187.98 BogoMIPS)
> [    0.133401] devtmpfs: initialized
> [    0.135301] x86/mm: Memory block size: 128MB
> [    0.152228] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.154050] futex hash table entries: 256 (order: 2, 16384 bytes)
> [    0.156227] xor: automatically using best checksumming function   avx =
      =

> [    0.157476] prandom: seed boundary self test passed
> [    0.160120] prandom: 100 self tests passed
> [    0.161029] pinctrl core: initialized pinctrl subsystem
> [    0.167931] NET: Registered protocol family 16
> [    0.180179] cpuidle: using governor ladder
> [    0.181037] cpuidle: using governor menu
> [    0.183430] ACPI: bus type PCI registered
> [    0.185015] dca service started, version 1.12.1
> [    0.186126] PCI: Using configuration type 1 for base access
> [    0.450079] raid6: sse2x1   gen()  7045 MB/s
> [    0.620056] raid6: sse2x1   xor()  2942 MB/s
> [    0.790028] raid6: sse2x2   gen()  5595 MB/s
> [    0.960026] raid6: sse2x2   xor()  3784 MB/s
> [    1.130099] raid6: sse2x4   gen()  6901 MB/s
> [    1.300033] raid6: sse2x4   xor()  4281 MB/s
> [    1.470029] raid6: avx2x1   gen()  7330 MB/s
> [    1.640030] raid6: avx2x1   xor()  5589 MB/s
> [    1.810032] raid6: avx2x2   gen() 11663 MB/s
> [    1.980032] raid6: avx2x2   xor()  6923 MB/s
> [    2.150142] raid6: avx2x4   gen() 11750 MB/s
> [    2.320026] raid6: avx2x4   xor()  7660 MB/s
> [    2.320835] raid6: using algorithm avx2x4 gen() 11750 MB/s
> [    2.321761] raid6: .... xor() 7660 MB/s, rmw enabled
> [    2.322614] raid6: using avx2x2 recovery algorithm
> [    2.325982] ACPI: Added _OSI(Module Device)
> [    2.326748] ACPI: Added _OSI(Processor Device)
> [    2.327542] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    2.328363] ACPI: Added _OSI(Processor Aggregator Device)
> [    2.409148] ACPI: Interpreter enabled
> [    2.409974] ACPI: (supports S0 S5)
> [    2.410049] ACPI: Using IOAPIC for interrupt routing
> [    2.411271] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    2.417653] ACPI: Enabled 2 GPEs in block 00 to 0F
> [    2.576986] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    2.578098] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments]
> [    2.579448] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    2.581369] PCI host bridge to bus 0000:00
> [    2.582122] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    2.583213] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    2.584340] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    2.585656] pci_bus 0000:00: root bus resource [mem 0x20000000-0xfebff=
fff window]
> [    2.586944] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.588056] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    2.594006] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    2.600049] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    2.608194] pci 0000:00:01.1: reg 0x20: [io  0xc0c0-0xc0cf]
> [    2.612176] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    2.613349] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    2.614392] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    2.615510] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    2.621006] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    2.622733] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    2.623982] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    2.629809] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
> [    2.636569] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pre=
f]
> [    2.644128] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
> [    2.656936] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    2.663601] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    2.667039] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    2.670035] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    2.682211] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    2.689303] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> [    2.693636] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    2.698688] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    2.709703] pci 0000:00:04.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64b=
it pref]
> [    2.718583] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> [    2.721813] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> [    2.726131] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> [    2.736897] pci 0000:00:05.0: reg 0x20: [mem 0xfe004000-0xfe007fff 64b=
it pref]
> [    2.746830] pci 0000:00:06.0: [8086:25ab] type 00 class 0x088000
> [    2.749715] pci 0000:00:06.0: reg 0x10: [mem 0xfebf3000-0xfebf300f]
> [    2.762910] pci_bus 0000:00: on NUMA node 0
> [    2.780500] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> [    2.785222] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> [    2.790176] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> [    2.794861] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> [    2.797478] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> [    2.807395] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [    2.808625] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+m=
em,owns=3Dio+mem,locks=3Dnone
> [    2.810040] pci 0000:00:02.0: vgaarb: bridge control possible
> [    2.811061] vgaarb: loaded
> [    2.819765] SCSI subsystem initialized
> [    2.820462] libata version 3.00 loaded.
> [    2.822736] pps_core: LinuxPPS API ver. 1 registered
> [    2.823603] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    2.825564] EDAC MC: Ver: 3.0.0
> [    2.840900] PCI: Using ACPI for IRQ routing
> [    2.841742] PCI: pci_cache_line_size set to 64 bytes
> [    2.850231] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    2.851252] e820: reserve RAM buffer [mem 0x1ffdc000-0x1fffffff]
> [    2.856814] clocksource: Switched to clocksource kvm-clock
> [    2.861803] Warning: could not register annotated branches stats
> [    3.061030] FS-Cache: Loaded
> [    3.065151] CacheFiles: Loaded
> [    3.066185] pnp: PnP ACPI init
> [    3.068114] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    3.070452] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    3.072549] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    3.074056] pnp 00:03: [dma 2]
> [    3.075038] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    3.077763] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    3.080449] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    3.083097] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
> [    3.092445] pnp: PnP ACPI: found 7 devices
> [    3.192370] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    3.195127] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    3.196158] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [    3.197181] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff win=
dow]
> [    3.198313] pci_bus 0000:00: resource 7 [mem 0x20000000-0xfebfffff win=
dow]
> [    3.200751] NET: Registered protocol family 1
> [    3.201675] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    3.202663] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    3.203635] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    3.204766] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
> [    3.206190] PCI: CLS 0 bytes, default 64
> [    3.208209] Unpacking initramfs...
> [    3.712989] Freeing initrd memory: 3932K
> [    3.714884] Scanning for low memory corruption every 60 seconds
> [    4.720108] tsc: Refined TSC clocksource calibration: 2593.990 MHz
> [    4.721172] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
5640ebfed9, max_idle_ns: 440795320785 ns
> [   10.362736] Initialise system trusted keyrings
> [   10.364040] workingset: timestamp_bits=3D46 max_order=3D17 bucket_orde=
r=3D0
> [   10.456114] qnx6: QNX6 filesystem 1.0.0 registered.
> [   10.459359] orangefs_debugfs_init: called with debug mask: :none: :0:
> [   10.460645] orangefs_init: module version upstream loaded
> [   10.487453] gfs2: GFS2 installed
> [   10.495825] Key type asymmetric registered
> [   10.496300] Asymmetric key parser 'x509' registered
> [   10.496803] Key type pkcs7_test registered
> [   10.497902] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 247)
> [   10.498672] io scheduler noop registered (default)
> [   10.499168] io scheduler deadline registered
> [   10.499668] =

> [   10.499668] Start testing find_bit() with random-filled bitmap
> [   10.505039] find_next_bit:		9986505 cycles,	163448 iterations
> [   10.509383] find_next_zero_bit:	9685577 cycles,	164233 iterations
> [   10.511383] find_last_bit:		2317596 cycles,	163447 iterations
> [   11.029947] find_first_bit:		1343612271 cycles,	163448 iterations
> [   11.032365] =

> [   11.032365] Start testing find_bit() with sparse bitmap
> [   11.033727] find_next_bit:		110252 cycles,	655 iterations
> [   11.046578] find_next_zero_bit:	31015870 cycles,	327026 iterations
> [   11.047639] find_last_bit:		55049 cycles,	655 iterations
> [   11.051485] find_first_bit:		7650763 cycles,	655 iterations
> [   11.064940] test_hash: __hash_32() has no arch implementation to test.
> [   11.066031] test_hash: hash_32() has no arch implementation to test.
> [   11.067057] test_hash: hash_64() has no arch implementation to test.
> [   11.068085] test_hash: 33152 tests passed.
> [   11.068830] test_siphash: self-tests: pass
> [   11.070452] Running rhashtable test nelem=3D8, max_size=3D0, shrinking=
=3D0
> [   11.071371] Test 00:
> [   11.071883]   Adding 50000 keys
> [   11.194006]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.218572]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.219789]   Deleting 50000 keys
> [   11.260487]   Duration of test: 188064203 ns
> [   11.261228] Test 01:
> [   11.261835]   Adding 50000 keys
> [   11.389397]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.413559]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.414780]   Deleting 50000 keys
> [   11.455366]   Duration of test: 193014286 ns
> [   11.456115] Test 02:
> [   11.456721]   Adding 50000 keys
> [   11.585201]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.607627]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.608876]   Deleting 50000 keys
> [   11.649072]   Duration of test: 191832524 ns
> [   11.649836] Test 03:
> [   11.650507]   Adding 50000 keys
> [   11.768687]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.797078]   Traversal complete: counted=3D50000, nelems=3D50000, ent=
ries=3D50000, table-jumps=3D0
> [   11.798383]   Deleting 50000 keys
> [   11.844732]   Duration of test: 193687978 ns
> [   11.863054] test if its possible to exceed max_size 8192: no, ok
> [   11.864238] Average test time: 191649747
> [   11.864847] Testing concurrent rhashtable access from 10 threads
> [   18.598781] test 3125 add/delete pairs into rhlist
> [   18.842898] test 3125 random rhlist add/delete operations
> [   18.865171] Started 10 threads, 0 failed, rhltable test returns 0
> [   18.878191] crc32: CRC_LE_BITS =3D 8, CRC_BE BITS =3D 8
> [   18.878759] crc32: self tests passed, processed 225944 bytes in 713772=
 nsec
> [   18.880494] crc32c: CRC_LE_BITS =3D 8
> [   18.880898] crc32c: self tests passed, processed 225944 bytes in 30624=
5 nsec
> [   18.914084] crc32_combine: 8373 self tests passed
> [   18.954169] crc32c_combine: 8373 self tests passed
> [   18.971981] xz_dec_test: module loaded
> [   18.972671] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 246 0' and write .xz files to it.
> [   18.982581] gpio-mockup: probe of gpio-mockup failed with error -22
> [   18.986933] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [   18.989037] ipmi message handler version 39.2
> [   18.989932] ipmi device interface
> [   18.990759] IPMI System Interface driver.
> [   18.992232] ipmi_si: Unable to find any System Interface(s)
> [   18.993227] IPMI SSIF Interface driver
> [   18.994295] IPMI Watchdog: driver initialized
> [   18.996245] ERST DBG: ERST support is disabled.
> [   18.997648] ioatdma: Intel(R) QuickData Technology Driver 4.00
> [   19.243883] HDLC line discipline maxframe=3D4096
> [   19.244691] N_HDLC line discipline registered.
> [   19.245457] r3964: Philips r3964 Driver $Revision: 1.10 $
> [   19.246348] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [   19.271884] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [   19.298722] 00:06: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200=
) is a 16550A
> [   19.305294] Cyclades driver 2.6
> [   19.306269] MOXA Intellio family driver version 6.0k
> [   19.307550] MOXA Smartio/Industio family driver version 2.0.5
> [   19.308801] RocketPort device driver module, version 2.09, 12-June-2003
> [   19.310111] No rocketport ports found; unloading driver
> [   19.311013] SyncLink MultiPort driver $Revision: 4.38 $
> [   19.379550] SyncLink MultiPort driver $Revision: 4.38 $, tty major#241
> [   19.380686] SyncLink serial driver $Revision: 4.38 $
> [   19.439846] SyncLink serial driver $Revision: 4.38 $, tty major#240
> [   19.443455] Guest personality initialized and is inactive
> [   19.444620] VMCI host device registered (name=3Dvmci, major=3D10, mino=
r=3D60)
> [   19.446820] Initialized host personality
> [   19.462669] Fusion MPT base driver 3.04.20
> [   19.463514] Copyright (c) 1999-2008 LSI Corporation
> [   19.464496] Fusion MPT SPI Host driver 3.04.20
> [   19.467957] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [   19.471273] serio: i8042 KBD port at 0x60,0x64 irq 1
> [   19.472761] serio: i8042 AUX port at 0x60,0x64 irq 12
> [   19.484752] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input0
> [   19.486372] evbug: Connected device: input0 (AT Translated Set 2 keybo=
ard at isa0060/serio0/input0)
> [   19.493505] apanel: Fujitsu BIOS signature 'FJKEYINF' not found...
> [   19.497206] i2c-parport-light: adapter type unspecified
> [   19.500761] pps pps0: new PPS source ktimer
> [   19.501566] pps pps0: ktimer PPS source registered
> [   19.502591] Driver for 1-wire Dallas network protocol.
> [   19.504429] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> [   19.515261] acquirewdt: WDT driver for Acquire single board computer i=
nitialising
> [   19.517325] acquirewdt: I/O address 0x0043 already in use
> [   19.518347] acquirewdt: probe of acquirewdt failed with error -5
> [   19.519836] advantechwdt: WDT driver for Advantech single board comput=
er initialising
> [   19.522465] advantechwdt: initialized. timeout=3D60 sec (nowayout=3D1)
> [   19.523769] alim7101_wdt: Steve Hill <steve@navaho.co.uk>
> [   19.524739] alim7101_wdt: ALi M7101 PMU not present - WDT not set
> [   19.525796] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [   19.527696] ib700wdt: START method I/O 443 is not available
> [   19.528725] ib700wdt: probe of ib700wdt failed with error -5
> [   19.530325] it87_wdt: no device
> [   19.530980] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [   19.532673] cpu5wdt: misc_register failed
> [   19.533694] w83977f_wdt: driver v1.00
> [   19.534455] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [   19.538426] No PC Engines board detected
> [   19.543918] comedi: version 0.7.76 - http://www.comedi.org
> [   19.549142] input: Speakup as /devices/virtual/input/input2
> [   19.558966] evbug: Connected device: input2 (Speakup at speakup/input0)
> [   19.561291] initialized device: /dev/synth, node (MAJOR 10, MINOR 25)
> [   19.562671] speakup 3.1.6: initialized
> [   19.563418] synth name on entry is: (null)
> [   19.573996] mostcore: init()
> [   19.578170] greybus: registered new driver log
> [   19.579174] greybus: registered new driver power_supply
> [   19.580472] greybus: registered new driver vibrator
> [   19.581709] greybus: registered new driver gbphy
> [   19.582717] gb_gbphy: registered new driver gpio
> [   19.594880] ... APIC ID:      00000000 (0)
> [   19.595705] ... APIC VERSION: 01050014
> [   19.596428] 0000000000000000000000000000000000000000000000000000000000=
000000
> [   19.597630] 0000000000000000000000000000000000000000000000000000000000=
000000
> [   19.598866] 0000000000000000000000000000000000000000000000000000000000=
000000
> [   19.600276] number of MP IRQ sources: 15.
> [   19.601047] number of IO-APIC #0 registers: 24.
> [   19.601876] testing the IO APIC.......................
> [   19.602810] IO APIC #0......
> [   19.603416] .... register #00: 00000000
> [   19.604161] .......    : physical APIC id: 00
> [   19.604990] .......    : Delivery Type: 0
> [   19.605763] .......    : LTS          : 0
> [   19.606521] .... register #01: 00170011
> [   19.607248] .......     : max redirection entries: 17
> [   19.608150] .......     : PRQ implemented: 0
> [   19.608967] .......     : IO APIC version: 11
> [   19.609797] .... register #02: 00000000
> [   19.610662] .......     : arbitration: 00
> [   19.611428] .... IRQ redirection table:
> [   19.612150] IOAPIC 0:
> [   19.612669]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.614090]  pin01, enabled , edge , high, V(23), IRR(0), S(0), logica=
l , D(01), M(1)
> [   19.615527]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logica=
l , D(01), M(1)
> [   19.616915]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.618302]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.619685]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.621224]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.622673]  pin07, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.624096]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.625484]  pin09, enabled , level, high, V(21), IRR(0), S(0), logica=
l , D(01), M(1)
> [   19.626904]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.628325]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.629765]  pin0c, enabled , edge , high, V(22), IRR(0), S(0), logica=
l , D(01), M(1)
> [   19.631197]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.632610]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.634039]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.635461]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.636854]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.638253]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.639692]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.641118]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.642533]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.643960]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.645377]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [   19.646758] IRQ to pin mappings:
> [   19.647404] IRQ0 -> 0:2
> [   19.647962] IRQ1 -> 0:1
> [   19.648528] IRQ3 -> 0:3
> [   19.649076] IRQ4 -> 0:4
> [   19.649638] IRQ5 -> 0:5
> [   19.650233] IRQ6 -> 0:6
> [   19.650795] IRQ7 -> 0:7
> [   19.651328] IRQ8 -> 0:8
> [   19.651871] IRQ9 -> 0:9
> [   19.652405] IRQ10 -> 0:10
> [   19.652989] IRQ11 -> 0:11
> [   19.653564] IRQ12 -> 0:12
> [   19.654131] IRQ13 -> 0:13
> [   19.654709] IRQ14 -> 0:14
> [   19.655258] IRQ15 -> 0:15
> [   19.655841] .................................... done.
> [   19.656975] sched_clock: Marking stable (19650195421, 0)->(20292600300=
, -642404879)
> [   19.660832] Loading compiled-in X.509 certificates
> [   19.681106] Btrfs loaded, crc32c=3Dcrc32c-generic, debug=3Don, assert=
=3Don, integrity-checker=3Don, ref-verify=3Don
> [   19.685174] Key type encrypted registered
> [   19.731257] Freeing unused kernel memory: 1944K
> [   19.732171] Write protecting the kernel read-only data: 34816k
> [   19.735366] Freeing unused kernel memory: 896K
> [   19.746892] Freeing unused kernel memory: 1272K
> /etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
> Starting udev
> /etc/rcS.d/S03udev: line 72: can't create /proc/sys/kernel/hotplug: nonex=
istent directory
> [   23.684970] gfs2: path_lookup on rootfs returned error -2
> Kernel tests: Boot OK!
> [   40.847825] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   40.848720] BUG: KASAN: use-after-free in cmp_ex_search+0x29/0x71
> [   40.849362] Read of size 8 at addr ffff8800155d8578 by task trinity-ma=
in/504
> [   40.850085] =

> [   40.850317] CPU: 0 PID: 504 Comm: trinity-main Not tainted 4.15.0-rc1 =
#204
> [   40.851013] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   40.851880] Call Trace:
> [   40.852190] =

> [   40.852424] Allocated by task 504:
> [   40.852845]  kasan_kmalloc+0x62/0xee
> [   40.853315]  kasan_kmalloc+0x7f/0x8b
> [   40.853735]  kmem_cache_alloc_trace+0x289/0x29b
> [   40.854234]  perf_event_alloc+0x20e/0x1cb7
> [   40.854714]  SyS_perf_event_open+0xa89/0x200a
> [   40.855201]  entry_SYSCALL_64_fastpath+0x1a/0x7d
> [   40.855705] =

> [   40.855931] Freed by task 504:
> [   40.856296]  kasan_slab_free+0xc8/0x171
> [   40.856736]  kfree+0x1ef/0x333
> [   40.857098]  perf_event_alloc+0x1c73/0x1cb7
> [   40.857567]  SyS_perf_event_open+0xa89/0x200a
> [   40.858048]  entry_SYSCALL_64_fastpath+0x1a/0x7d
> [   40.858549] =

> [   40.858777] The buggy address belongs to the object at ffff8800155d8008
> [   40.858777]  which belongs to the cache kmalloc-2048 of size 2048
> [   40.860036] The buggy address is located 1392 bytes inside of
> [   40.860036]  2048-byte region [ffff8800155d8008, ffff8800155d8808)
> [   40.861203] The buggy address belongs to the page:
> [   40.861729] page:ffffea0000557600 count:1 mapcount:0 mapping:         =
 (null) index:0xffff8800155daee8 compound_mapcount: 0
> [   40.862840] flags: 0x4000000000008100(slab|head)
> [   40.863360] raw: 4000000000008100 0000000000000000 ffff8800155daee8 00=
000001000d000c
> [   40.864176] raw: ffff88001a401450 ffff88001a401450 ffff88001a40c340 00=
00000000000000
> [   40.865008] page dumped because: kasan: bad access detected
> [   40.865586] =

> [   40.865811] Memory state around the buggy address:
> [   40.866326]  ffff8800155d8400: 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00
> [   40.867090]  ffff8800155d8480: 00 00 fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
> [   40.867854] >ffff8800155d8500: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
> [   40.868616]                                                           =
      ^
> [   40.869343]  ffff8800155d8580: fb fb fb fb fb fb fb fb fb fb fb fb fb =
fb fb fb
> [   40.870108]  ffff8800155d8600: fb f1 f1 f1 f1 04 f2 f2 f2 f3 f3 f3 f3 =
fb 00 00
> [   40.870873] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   40.871644] Disabling lock debugging due to kernel taint
> [   40.872223] kernel tried to execute NX-protected page - exploit attemp=
t? (uid: 0)
> [   40.873011] BUG: unable to handle kernel paging request at fffffbfff07=
66694
> [   40.874648] IP: 0xfffffbfff0766694
> [   40.875112] PGD 1b3df067 P4D 1b3df067 PUD 1b3de067 PMD 800000001ac001e=
3 =

> [   40.876293] Thread overran stack, or stack corrupted
> [   40.877235] Oops: 0011 [#1] PREEMPT SMP KASAN
> [   40.878123] Modules linked in:
> [   40.878776] CPU: 0 PID: 504 Comm: trinity-main Tainted: G    B        =
    4.15.0-rc1 #204
> [   40.880289] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   40.881800] task: ffff8800161955c0 task.stack: ffff880016170000
> [   40.882843] RIP: 0010:0xfffffbfff0766694
> [   40.883619] RSP: 0018:ffff8800155d8c70 EFLAGS: 00010246
> [   40.884601] RAX: dffffc0000000000 RBX: 0000000000000400 RCX: 000000000=
0000000
> [   40.885834] RDX: ffff8800155d8d00 RSI: ffffffff81221618 RDI: ffffffff8=
121cdb3
> [   40.893792] RBP: ffff8800155d8cb0 R08: fffffbfff0766694 R09: fffffbfff=
0766694
> [   40.895279] R10: fffffbfff0766695 R11: fffffbfff0766694 R12: ffff88001=
55d8d00
> [   40.896723] R13: ffff8800161955c0 R14: ffffffff81221618 R15: 000000000=
0000000
> [   40.898167] FS:  0000000002c06880(0000) GS:ffff88001aa00000(0000) knlG=
S:0000000000000000
> [   40.899908] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   40.901095] CR2: fffffbfff0766694 CR3: 0000000014db2003 CR4: 000000000=
01606b0
> [   40.902557] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [   40.903938] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [   40.905355] Call Trace:
> [   40.905972] Code: 00 00 00 00 00 00 00 fa fa fa fa 04 fa fa fa fa fa f=
a fa 04 fa fa fa fa fa fa fa 04 fa fa fa fa fa fa fa 05 fa fa fa fa fa fa f=
a <05> fa fa fa fa fa fa fa 00 fa fa fa fa fa fa fa 04 fa fa fa fa =

> [   40.911480] RIP: 0xfffffbfff0766694 RSP: ffff8800155d8c70
> [   40.912625] CR2: fffffbfff0766694
> [   40.913400] ---[ end trace 44871bb701f7f1f9 ]---
> [   40.914384] Kernel panic - not syncing: Fatal exception in interrupt
> [   40.915746] Kernel Offset: disabled
> =

> Elapsed time: 50
> =

> qemu-img create -f qcow2 disk-yocto-lkp-hsw01-33-0 256G
> qemu-img create -f qcow2 disk-yocto-lkp-hsw01-33-1 256G
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep
> 	-kernel $kernel
> 	-initrd /osimage/yocto/yocto-trinity-x86_64.cgz
> 	-m 512
> 	-smp 1
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-drive file=3Ddisk-yocto-lkp-hsw01-33-0,media=3Ddisk,if=3Dvirtio
> 	-drive file=3Ddisk-yocto-lkp-hsw01-33-1,media=3Ddisk,if=3Dvirtio
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	root=3D/dev/ram0
> 	hung_task_panic=3D1
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	branch=3Dlinux-devel/devel-hourly-2017112915
> 	BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-v0-11300145/gcc-7/4fbd8d194f06=
c8a3fd2af1ce560ddb31f7ec8323/vmlinuz-4.15.0-rc1
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" -append "${append[*]}"

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.15.0-rc1 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
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
> CONFIG_KASAN_SHADOW_OFFSET=3D0xdffffc0000000000
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_CONSTRUCTORS=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
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
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> CONFIG_USELIB=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_GENERIC_IRQ_DEBUGFS=3Dy
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
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> # CONFIG_NO_HZ_FULL_ALL is not set
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
> # CONFIG_CPU_ISOLATION is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FAST_NO_HZ is not set
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> # CONFIG_MEMCG_SWAP is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_SOCK_CGROUP_DATA is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_USER_NS is not set
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_MEMBARRIER=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_KALLSYMS=3Dy
> # CONFIG_KALLSYMS_ALL is not set
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_USERFAULTFD=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_SLUB_MEMCG_SYSFS_ON is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> CONFIG_SLAB_FREELIST_HARDENED=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> # CONFIG_JUMP_LABEL is not set
> CONFIG_UPROBES=3Dy
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_DMA_API_DEBUG=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_THIN_ARCHIVES=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> # CONFIG_HAVE_ARCH_HASH is not set
> # CONFIG_ISA_BUS_API is not set
> # CONFIG_CPU_NO_EFFICIENT_FFS is not set
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX is not set
> # CONFIG_ARCH_OPTIONAL_KERNEL_RWX_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> CONFIG_REFCOUNT_FULL=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> CONFIG_MODULE_UNLOAD=3Dy
> CONFIG_MODULE_FORCE_UNLOAD=3Dy
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> # CONFIG_MODULE_COMPRESS is not set
> CONFIG_TRIM_UNUSED_KSYMS=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_ZONED=3Dy
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> # CONFIG_BLK_WBT is not set
> # CONFIG_BLK_DEBUG_FS is not set
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=3Dy
> CONFIG_OSF_PARTITION=3Dy
> # CONFIG_AMIGA_PARTITION is not set
> CONFIG_ATARI_PARTITION=3Dy
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> # CONFIG_BSD_DISKLABEL is not set
> CONFIG_MINIX_SUBPARTITION=3Dy
> CONFIG_SOLARIS_X86_PARTITION=3Dy
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> CONFIG_LDM_PARTITION=3Dy
> CONFIG_LDM_DEBUG=3Dy
> # CONFIG_SGI_PARTITION is not set
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> # CONFIG_KARMA_PARTITION is not set
> # CONFIG_EFI_PARTITION is not set
> CONFIG_SYSV68_PARTITION=3Dy
> CONFIG_CMDLINE_PARTITION=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dm
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_MQ_IOSCHED_DEADLINE=3Dm
> # CONFIG_MQ_IOSCHED_KYBER is not set
> # CONFIG_IOSCHED_BFQ is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
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
> CONFIG_X86_FAST_FEATURE_TESTS=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> # CONFIG_INTEL_RDT is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
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
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_CALGARY_IOMMU=3Dy
> # CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> # CONFIG_MAXSMP is not set
> CONFIG_NR_CPUS=3D64
> # CONFIG_SCHED_SMT is not set
> # CONFIG_SCHED_MC is not set
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> # CONFIG_I8K is not set
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dy
> # CONFIG_X86_5LEVEL is not set
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_MEMORY_PROBE=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_COMPACTION is not set
> # CONFIG_MIGRATION is not set
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> # CONFIG_CLEANCACHE is not set
> # CONFIG_FRONTSWAP is not set
> # CONFIG_CMA is not set
> # CONFIG_ZPOOL is not set
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> # CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_BENCHMARK is not set
> # CONFIG_X86_PMEM_LEGACY is not set
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_INTEL_UMIP=3Dy
> # CONFIG_X86_INTEL_MPX is not set
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_EFI=3Dy
> # CONFIG_EFI_STUB is not set
> # CONFIG_SECCOMP is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> # CONFIG_KEXEC_FILE is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> # CONFIG_HIBERNATION is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> # CONFIG_ACPI_DEBUGGER_USER is not set
> CONFIG_ACPI_LPIT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dm
> CONFIG_ACPI_VIDEO=3Dm
> # CONFIG_ACPI_FAN is not set
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dm
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dm
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dm
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_BGRT is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> # CONFIG_ACPI_APEI_PCIEAER is not set
> # CONFIG_ACPI_APEI_EINJ is not set
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> CONFIG_DPTF_POWER=3Dy
> CONFIG_ACPI_WATCHDOG=3Dy
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dm
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dm
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
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
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> # CONFIG_HOTPLUG_PCI_PCIE is not set
> CONFIG_PCIEAER=3Dy
> # CONFIG_PCIE_ECRC is not set
> CONFIG_PCIEAER_INJECT=3Dy
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEBUG is not set
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> # CONFIG_PCIE_DPC is not set
> # CONFIG_PCIE_PTM is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> # CONFIG_PCI_MSI is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dm
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # DesignWare PCI Core Support
> #
> =

> #
> # PCI host controller drivers
> #
> =

> #
> # PCI Endpoint
> #
> CONFIG_PCI_ENDPOINT=3Dy
> CONFIG_PCI_ENDPOINT_CONFIGFS=3Dy
> # CONFIG_PCI_EPF_TEST is not set
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dm
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_PCCARD is not set
> CONFIG_RAPIDIO=3Dm
> CONFIG_RAPIDIO_TSI721=3Dm
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> CONFIG_RAPIDIO_CHMAN=3Dm
> # CONFIG_RAPIDIO_MPORT_CDEV is not set
> =

> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_TSI57X is not set
> # CONFIG_RAPIDIO_CPS_XX is not set
> CONFIG_RAPIDIO_TSI568=3Dm
> CONFIG_RAPIDIO_CPS_GEN2=3Dm
> CONFIG_RAPIDIO_RXS_GEN3=3Dm
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> # CONFIG_X86_X32 is not set
> CONFIG_X86_DEV_DMA_OPS=3Dy
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
> # CONFIG_DNS_RESOLVER is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_NET_NSH is not set
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> # CONFIG_BPF_STREAM_PARSER is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> # CONFIG_BT is not set
> # CONFIG_STREAM_PARSER is not set
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> # CONFIG_LIB80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> # CONFIG_NET_IFE is not set
> # CONFIG_LWTUNNEL is not set
> # CONFIG_DST_CACHE is not set
> # CONFIG_GRO_CELLS is not set
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_TEST_ASYNC_DRIVER_PROBE=3Dm
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> # CONFIG_DMA_SHARED_BUFFER is not set
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dm
> # CONFIG_MTD_TESTS is not set
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dm
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # Partition parsers
> #
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dm
> CONFIG_MTD_BLOCK=3Dm
> CONFIG_MTD_BLOCK_RO=3Dm
> CONFIG_FTL=3Dm
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dm
> CONFIG_RFD_FTL=3Dm
> # CONFIG_SSFDC is not set
> CONFIG_SM_FTL=3Dm
> # CONFIG_MTD_OOPS is not set
> CONFIG_MTD_SWAP=3Dm
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dm
> CONFIG_MTD_JEDECPROBE=3Dm
> CONFIG_MTD_GEN_PROBE=3Dm
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
> CONFIG_MTD_CFI_INTELEXT=3Dm
> CONFIG_MTD_CFI_AMDSTD=3Dm
> CONFIG_MTD_CFI_STAA=3Dm
> CONFIG_MTD_CFI_UTIL=3Dm
> CONFIG_MTD_RAM=3Dm
> CONFIG_MTD_ROM=3Dm
> # CONFIG_MTD_ABSENT is not set
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dm
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_AMD76XROM=3Dm
> # CONFIG_MTD_ICHXROM is not set
> CONFIG_MTD_ESB2ROM=3Dm
> CONFIG_MTD_CK804XROM=3Dm
> CONFIG_MTD_SCB2_FLASH=3Dm
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dm
> CONFIG_MTD_INTEL_VR_NOR=3Dm
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dm
> # CONFIG_MTD_PMC551_BUGFIX is not set
> # CONFIG_MTD_PMC551_DEBUG is not set
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dm
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTD_BLOCK2MTD=3Dm
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dm
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> CONFIG_MTD_NAND_ECC=3Dm
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dm
> # CONFIG_MTD_NAND_ECC_BCH is not set
> CONFIG_MTD_SM_COMMON=3Dm
> CONFIG_MTD_NAND_DENALI=3Dm
> CONFIG_MTD_NAND_DENALI_PCI=3Dm
> CONFIG_MTD_NAND_GPIO=3Dm
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_RICOH=3Dm
> CONFIG_MTD_NAND_DISKONCHIP=3Dm
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> # CONFIG_MTD_NAND_DOCG4 is not set
> CONFIG_MTD_NAND_CAFE=3Dm
> CONFIG_MTD_NAND_NANDSIM=3Dm
> CONFIG_MTD_NAND_PLATFORM=3Dm
> CONFIG_MTD_ONENAND=3Dm
> # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> CONFIG_MTD_ONENAND_GENERIC=3Dm
> # CONFIG_MTD_ONENAND_OTP is not set
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dm
> CONFIG_MTD_QINFO_PROBE=3Dm
> CONFIG_MTD_SPI_NOR=3Dm
> # CONFIG_MTD_MT81xx_NOR is not set
> CONFIG_MTD_SPI_NOR_USE_4K_SECTORS=3Dy
> CONFIG_SPI_INTEL_SPI=3Dm
> # CONFIG_SPI_INTEL_SPI_PCI is not set
> CONFIG_SPI_INTEL_SPI_PLATFORM=3Dm
> # CONFIG_MTD_UBI is not set
> # CONFIG_OF is not set
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
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SKD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dy
> CONFIG_BLK_DEV_NVME=3Dm
> # CONFIG_NVME_MULTIPATH is not set
> CONFIG_NVME_FABRICS=3Dy
> CONFIG_NVME_FC=3Dy
> CONFIG_NVME_TARGET=3Dy
> CONFIG_NVME_TARGET_LOOP=3Dy
> CONFIG_NVME_TARGET_FC=3Dy
> # CONFIG_NVME_TARGET_FCLOOP is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dm
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dm
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_USB_SWITCH_FSA9480=3Dm
> CONFIG_SRAM=3Dy
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> # CONFIG_EEPROM_LEGACY is not set
> # CONFIG_EEPROM_MAX6875 is not set
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_IDT_89HPESX=3Dm
> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dm
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=3Dm
> # CONFIG_INTEL_MEI_ME is not set
> CONFIG_INTEL_MEI_TXE=3Dm
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC & related support
> #
> =

> #
> # Intel MIC Bus Driver
> #
> CONFIG_INTEL_MIC_BUS=3Dm
> =

> #
> # SCIF Bus Driver
> #
> # CONFIG_SCIF_BUS is not set
> =

> #
> # VOP Bus Driver
> #
> # CONFIG_VOP_BUS is not set
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> =

> #
> # SCIF Driver
> #
> =

> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
> =

> #
> # VOP Driver
> #
> # CONFIG_GENWQE is not set
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> # CONFIG_CXL_LIB is not set
> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_RAID_ATTRS is not set
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_NETLINK is not set
> CONFIG_SCSI_MQ_DEFAULT=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> # CONFIG_CHR_DEV_OSST is not set
> # CONFIG_BLK_DEV_SR is not set
> # CONFIG_CHR_DEV_SG is not set
> # CONFIG_CHR_DEV_SCH is not set
> CONFIG_SCSI_ENCLOSURE=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> # CONFIG_SCSI_ISCSI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=3Dm
> CONFIG_SCSI_SAS_LIBSAS=3Dm
> CONFIG_SCSI_SAS_ATA=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> # CONFIG_SCSI_OSD_ULD is not set
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> CONFIG_SCSI_OSD_DEBUG=3Dy
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
> CONFIG_SATA_AHCI=3Dy
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> # CONFIG_ATA_SFF is not set
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> # CONFIG_TCM_FILEIO is not set
> CONFIG_TCM_PSCSI=3Dm
> # CONFIG_TCM_USER2 is not set
> # CONFIG_LOOPBACK_TARGET is not set
> # CONFIG_ISCSI_TARGET is not set
> CONFIG_SBP_TARGET=3Dm
> CONFIG_FUSION=3Dy
> CONFIG_FUSION_SPI=3Dy
> # CONFIG_FUSION_SAS is not set
> CONFIG_FUSION_MAX_SGE=3D128
> CONFIG_FUSION_CTL=3Dm
> CONFIG_FUSION_LOGGING=3Dy
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dm
> CONFIG_FIREWIRE_SBP2=3Dy
> CONFIG_FIREWIRE_NOSY=3Dm
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> # CONFIG_NVM is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dm
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> # CONFIG_INPUT_SPARSEKMAP is not set
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> CONFIG_INPUT_JOYDEV=3Dy
> # CONFIG_INPUT_EVDEV is not set
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
> # CONFIG_KEYBOARD_ADP5520 is not set
> CONFIG_KEYBOARD_ADP5588=3Dm
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dm
> CONFIG_KEYBOARD_QT2160=3Dy
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dm
> CONFIG_KEYBOARD_GPIO_POLLED=3Dm
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> CONFIG_KEYBOARD_MATRIX=3Dy
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> # CONFIG_KEYBOARD_SAMSUNG is not set
> CONFIG_KEYBOARD_STOWAWAY=3Dm
> CONFIG_KEYBOARD_SUNKBD=3Dy
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> CONFIG_KEYBOARD_TWL4030=3Dy
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_KEYBOARD_CROS_EC=3Dy
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_GPIO=3Dm
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> CONFIG_JOYSTICK_A3D=3Dy
> CONFIG_JOYSTICK_ADI=3Dm
> CONFIG_JOYSTICK_COBRA=3Dm
> CONFIG_JOYSTICK_GF2K=3Dm
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dm
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dm
> # CONFIG_JOYSTICK_TMDC is not set
> CONFIG_JOYSTICK_IFORCE=3Dm
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> # CONFIG_JOYSTICK_WARRIOR is not set
> CONFIG_JOYSTICK_MAGELLAN=3Dy
> CONFIG_JOYSTICK_SPACEORB=3Dm
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> CONFIG_JOYSTICK_STINGER=3Dm
> # CONFIG_JOYSTICK_TWIDJOY is not set
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_AS5011=3Dm
> CONFIG_JOYSTICK_JOYDUMP=3Dm
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_PEGASUS is not set
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dm
> CONFIG_TOUCHSCREEN_BU21013=3Dm
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dm
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> CONFIG_TOUCHSCREEN_EETI=3Dy
> # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> CONFIG_TOUCHSCREEN_EXC3000=3Dm
> CONFIG_TOUCHSCREEN_FUJITSU=3Dm
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> # CONFIG_TOUCHSCREEN_S6SY761 is not set
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
> # CONFIG_TOUCHSCREEN_ELAN is not set
> CONFIG_TOUCHSCREEN_ELO=3Dy
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dm
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> CONFIG_TOUCHSCREEN_MK712=3Dm
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dm
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dm
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dm
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> # CONFIG_TOUCHSCREEN_MC13783 is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_RM_TS is not set
> CONFIG_TOUCHSCREEN_SILEAD=3Dm
> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> # CONFIG_TOUCHSCREEN_ST1232 is not set
> # CONFIG_TOUCHSCREEN_STMFTS is not set
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> # CONFIG_TOUCHSCREEN_ZFORCE is not set
> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dm
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM80X_ONKEY=3Dm
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> CONFIG_INPUT_PCSPKR=3Dm
> # CONFIG_INPUT_MAX77693_HAPTIC is not set
> # CONFIG_INPUT_MAX8925_ONKEY is not set
> # CONFIG_INPUT_MAX8997_HAPTIC is not set
> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
> # CONFIG_INPUT_MMA8450 is not set
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GP2A=3Dm
> CONFIG_INPUT_GPIO_BEEPER=3Dy
> # CONFIG_INPUT_GPIO_TILT_POLLED is not set
> # CONFIG_INPUT_GPIO_DECODER is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dm
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> # CONFIG_INPUT_AXP20X_PEK is not set
> CONFIG_INPUT_TWL4030_PWRBUTTON=3Dm
> # CONFIG_INPUT_TWL4030_VIBRA is not set
> CONFIG_INPUT_TWL6040_VIBRA=3Dy
> CONFIG_INPUT_UINPUT=3Dm
> CONFIG_INPUT_PALMAS_PWRBUTTON=3Dy
> CONFIG_INPUT_PCF50633_PMU=3Dy
> # CONFIG_INPUT_PCF8574 is not set
> # CONFIG_INPUT_PWM_BEEPER is not set
> # CONFIG_INPUT_PWM_VIBRA is not set
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA9055_ONKEY=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> CONFIG_INPUT_ADXL34X=3Dm
> # CONFIG_INPUT_ADXL34X_I2C is not set
> CONFIG_INPUT_CMA3000=3Dm
> CONFIG_INPUT_CMA3000_I2C=3Dm
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dm
> CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dm
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> CONFIG_INPUT_DRV2665_HAPTICS=3Dm
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> # CONFIG_RMI4_SMB is not set
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> # CONFIG_RMI4_F34 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dm
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> # CONFIG_SERIO_RAW is not set
> CONFIG_SERIO_ALTERA_PS2=3Dm
> CONFIG_SERIO_PS2MULT=3Dm
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_GPIO_PS2=3Dm
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dm
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=3Dm
> CONFIG_GAMEPORT_FM801=3Dy
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_ROCKETPORT=3Dy
> CONFIG_CYCLADES=3Dy
> CONFIG_CYZ_INTR=3Dy
> CONFIG_MOXA_INTELLIO=3Dy
> CONFIG_MOXA_SMARTIO=3Dy
> CONFIG_SYNCLINK=3Dy
> CONFIG_SYNCLINKMP=3Dy
> CONFIG_SYNCLINK_GT=3Dm
> CONFIG_NOZOMI=3Dm
> # CONFIG_ISI is not set
> CONFIG_N_HDLC=3Dy
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> # CONFIG_SERIAL_8250_PCI is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=3Dm
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dm
> CONFIG_SERIAL_8250_MID=3Dm
> CONFIG_SERIAL_8250_MOXA=3Dm
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> CONFIG_SERIAL_SCCNXP=3Dm
> CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> # CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> CONFIG_SERIAL_DEV_BUS=3Dm
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_DMI_DECODE=3Dy
> # CONFIG_IPMI_PROC_INTERFACE is not set
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> CONFIG_IPMI_WATCHDOG=3Dy
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dm
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> # CONFIG_HW_RANDOM_INTEL is not set
> CONFIG_HW_RANDOM_AMD=3Dm
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> CONFIG_HW_RANDOM_TPM=3Dm
> # CONFIG_NVRAM is not set
> CONFIG_R3964=3Dy
> CONFIG_APPLICOM=3Dm
> # CONFIG_MWAVE is not set
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> CONFIG_TCG_CRB=3Dy
> CONFIG_TCG_VTPM_PROXY=3Dm
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> # CONFIG_TELCLOCK is not set
> # CONFIG_DEVPORT is not set
> # CONFIG_XILLYBUS is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dm
> CONFIG_I2C_ALI1563=3Dm
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD756_S4882 is not set
> CONFIG_I2C_AMD8111=3Dm
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dy
> # CONFIG_I2C_PIIX4 is not set
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_SIS5595=3Dm
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dy
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> CONFIG_I2C_EMEV2=3Dm
> CONFIG_I2C_GPIO=3Dm
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> CONFIG_I2C_TAOS_EVM=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dy
> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dm
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> CONFIG_HSI=3Dy
> CONFIG_HSI_BOARDINFO=3Dy
> =

> #
> # HSI controllers
> #
> =

> #
> # HSI clients
> #
> CONFIG_HSI_CHAR=3Dm
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
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
> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dm
> # CONFIG_PINCTRL_MCP23S08 is not set
> CONFIG_PINCTRL_SX150X=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dm
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> CONFIG_PINCTRL_CANNONLAKE=3Dy
> CONFIG_PINCTRL_CEDARFORK=3Dy
> CONFIG_PINCTRL_DENVERTON=3Dm
> # CONFIG_PINCTRL_GEMINILAKE is not set
> CONFIG_PINCTRL_LEWISBURG=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dy
> # CONFIG_GPIO_AXP209 is not set
> CONFIG_GPIO_DWAPB=3Dy
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_LYNXPOINT=3Dy
> # CONFIG_GPIO_MB86S7X is not set
> CONFIG_GPIO_MOCKUP=3Dy
> # CONFIG_GPIO_VX855 is not set
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> CONFIG_GPIO_SCH311X=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> CONFIG_GPIO_PCA953X=3Dm
> CONFIG_GPIO_PCF857X=3Dm
> CONFIG_GPIO_TPIC2810=3Dy
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ADP5520 is not set
> # CONFIG_GPIO_BD9571MWV is not set
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> CONFIG_GPIO_DA9055=3Dm
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_KEMPLD=3Dm
> CONFIG_GPIO_LP3943=3Dm
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> # CONFIG_GPIO_TPS65910 is not set
> # CONFIG_GPIO_TWL4030 is not set
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WM8994=3Dm
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dm
> CONFIG_GPIO_BT8XX=3Dm
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> CONFIG_GPIO_RDC321X=3Dm
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> # CONFIG_W1_MASTER_GPIO is not set
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2405=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2805=3Dm
> CONFIG_W1_SLAVE_DS2431=3Dm
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dm
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dm
> CONFIG_W1_SLAVE_DS28E17=3Dy
> # CONFIG_POWER_AVS is not set
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dm
> # CONFIG_GENERIC_ADC_BATTERY is not set
> CONFIG_MAX8925_POWER=3Dm
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dm
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> CONFIG_MANAGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dm
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> # CONFIG_BATTERY_BQ27XXX_HDQ is not set
> CONFIG_CHARGER_AXP20X=3Dm
> CONFIG_BATTERY_AXP20X=3Dm
> # CONFIG_AXP20X_POWER is not set
> # CONFIG_AXP288_FUEL_GAUGE is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_BATTERY_MAX1721X is not set
> CONFIG_BATTERY_TWL4030_MADC=3Dm
> CONFIG_CHARGER_PCF50633=3Dm
> CONFIG_BATTERY_RX51=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dm
> # CONFIG_CHARGER_MANAGER is not set
> # CONFIG_CHARGER_LTC3651 is not set
> CONFIG_CHARGER_MAX14577=3Dy
> # CONFIG_CHARGER_MAX77693 is not set
> CONFIG_CHARGER_MAX8997=3Dy
> # CONFIG_CHARGER_MAX8998 is not set
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dy
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ25890=3Dm
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dm
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dy
> CONFIG_SENSORS_ABITUGURU3=3Dm
> CONFIG_SENSORS_AD7414=3Dm
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> # CONFIG_SENSORS_ADM1031 is not set
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dm
> # CONFIG_SENSORS_ADT7475 is not set
> # CONFIG_SENSORS_ASC7621 is not set
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dm
> CONFIG_SENSORS_ASPEED=3Dy
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dy
> # CONFIG_SENSORS_DELL_SMM is not set
> # CONFIG_SENSORS_DA9055 is not set
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_MC13783_ADC=3Dm
> # CONFIG_SENSORS_FSCHMD is not set
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dm
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4222=3Dm
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dy
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dm
> CONFIG_SENSORS_MAX6621=3Dy
> CONFIG_SENSORS_MAX6639=3Dm
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_MAX31790 is not set
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_TC654=3Dy
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dm
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dy
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dm
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dm
> CONFIG_SENSORS_NCT6775=3Dm
> CONFIG_SENSORS_NCT7802=3Dm
> CONFIG_SENSORS_NCT7904=3Dm
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> # CONFIG_SENSORS_ADM1275 is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> CONFIG_SENSORS_IR35221=3Dy
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> CONFIG_SENSORS_LTC3815=3Dm
> CONFIG_SENSORS_MAX16064=3Dm
> CONFIG_SENSORS_MAX20751=3Dy
> CONFIG_SENSORS_MAX31785=3Dm
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dm
> CONFIG_SENSORS_TPS40422=3Dm
> CONFIG_SENSORS_TPS53679=3Dm
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> # CONFIG_SENSORS_ZL6100 is not set
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHT3x=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dy
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_STTS751=3Dy
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dm
> CONFIG_SENSORS_ADS1015=3Dm
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_AMC6821 is not set
> # CONFIG_SENSORS_INA209 is not set
> CONFIG_SENSORS_INA2XX=3Dm
> CONFIG_SENSORS_INA3221=3Dy
> # CONFIG_SENSORS_TC74 is not set
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> CONFIG_SENSORS_TMP108=3Dy
> # CONFIG_SENSORS_TMP401 is not set
> # CONFIG_SENSORS_TMP421 is not set
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> CONFIG_SENSORS_VIA686A=3Dy
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dm
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dm
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dy
> CONFIG_SENSORS_W83795=3Dy
> CONFIG_SENSORS_W83795_FANCTRL=3Dy
> CONFIG_SENSORS_W83L785TS=3Dy
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> # CONFIG_THERMAL_GOV_STEP_WISE is not set
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_CLOCK_THERMAL is not set
> # CONFIG_DEVFREQ_THERMAL is not set
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> # CONFIG_GENERIC_ADC_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_DA9055_WATCHDOG=3Dy
> CONFIG_DA9063_WATCHDOG=3Dm
> # CONFIG_MENF21BMC_WATCHDOG is not set
> CONFIG_WDAT_WDT=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_ZIIRAVE_WATCHDOG=3Dy
> # CONFIG_CADENCE_WATCHDOG is not set
> CONFIG_DW_WATCHDOG=3Dm
> CONFIG_TWL4030_WATCHDOG=3Dy
> CONFIG_MAX63XX_WATCHDOG=3Dm
> CONFIG_RETU_WATCHDOG=3Dm
> CONFIG_ACQUIRE_WDT=3Dy
> CONFIG_ADVANTECH_WDT=3Dy
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> # CONFIG_F71808E_WDT is not set
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> # CONFIG_IBMASR is not set
> # CONFIG_WAFER_WDT is not set
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> CONFIG_IT8712F_WDT=3Dy
> CONFIG_IT87_WDT=3Dy
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_KEMPLD_WDT=3Dm
> # CONFIG_HPWDT_NMI_DECODING is not set
> # CONFIG_SC1200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dy
> CONFIG_60XX_WDT=3Dm
> CONFIG_CPU5_WDT=3Dy
> # CONFIG_SMSC_SCH311X_WDT is not set
> CONFIG_SMSC37B787_WDT=3Dm
> CONFIG_VIA_WDT=3Dy
> # CONFIG_W83627HF_WDT is not set
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dm
> CONFIG_NI903X_WDT=3Dm
> CONFIG_NIC7018_WDT=3Dy
> CONFIG_MEN_A21_WDT=3Dm
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dy
> # CONFIG_WDTPCI is not set
> =

> #
> # Watchdog Pretimeout Governors
> #
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP is not set
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> CONFIG_BCMA_HOST_SOC=3Dy
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_SFLASH=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_AS3711=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dm
> CONFIG_MFD_AXP20X=3Dm
> CONFIG_MFD_AXP20X_I2C=3Dm
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dm
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_MC13XXX=3Dm
> CONFIG_MFD_MC13XXX_I2C=3Dm
> CONFIG_HTC_PASIC3=3Dm
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dm
> CONFIG_MFD_JANZ_CMODIO=3Dm
> CONFIG_MFD_KEMPLD=3Dm
> CONFIG_MFD_88PM800=3Dm
> CONFIG_MFD_88PM805=3Dm
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dm
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> CONFIG_MFD_MT6397=3Dy
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_MFD_RETU=3Dm
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> CONFIG_PCF50633_GPIO=3Dy
> CONFIG_MFD_RDC321X=3Dm
> CONFIG_MFD_RTSX_PCI=3Dm
> # CONFIG_MFD_RT5033 is not set
> CONFIG_MFD_RC5T583=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dm
> CONFIG_MFD_LP3943=3Dm
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TPS68470 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dm
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PM800=3Dm
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dm
> CONFIG_REGULATOR_ANATOP=3Dm
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_AXP20X=3Dm
> CONFIG_REGULATOR_BCM590XX=3Dm
> CONFIG_REGULATOR_BD9571MWV=3Dm
> # CONFIG_REGULATOR_DA9055 is not set
> CONFIG_REGULATOR_DA9063=3Dy
> CONFIG_REGULATOR_DA9210=3Dm
> CONFIG_REGULATOR_DA9211=3Dy
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dm
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dm
> CONFIG_REGULATOR_LP872X=3Dm
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LTC3589=3Dm
> CONFIG_REGULATOR_LTC3676=3Dy
> CONFIG_REGULATOR_MAX14577=3Dm
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dm
> # CONFIG_REGULATOR_MAX8660 is not set
> # CONFIG_REGULATOR_MAX8907 is not set
> CONFIG_REGULATOR_MAX8925=3Dm
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX8998=3Dm
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dm
> CONFIG_REGULATOR_MC13783=3Dm
> CONFIG_REGULATOR_MC13892=3Dm
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_MT6323=3Dy
> # CONFIG_REGULATOR_MT6397 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dm
> CONFIG_REGULATOR_PV88090=3Dm
> # CONFIG_REGULATOR_PWM is not set
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_SKY81452=3Dm
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65132=3Dm
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_REGULATOR_WM8994=3Dm
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> # CONFIG_RC_DECODERS is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> # CONFIG_MEDIA_CEC_SUPPORT is not set
> # CONFIG_MEDIA_CONTROLLER is not set
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_DVB_CORE=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> =

> #
> # Supported FireWire (IEEE 1394) Adapters
> #
> CONFIG_DVB_FIREDTV=3Dm
> CONFIG_DVB_FIREDTV_INPUT=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> CONFIG_MEDIA_TUNER_TEA5767=3Dy
> # CONFIG_MEDIA_TUNER_MT20XX is not set
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_QT1010=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> # CONFIG_MEDIA_TUNER_MXL5005S is not set
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> # CONFIG_MEDIA_TUNER_MC44S803 is not set
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> # CONFIG_MEDIA_TUNER_TDA18218 is not set
> # CONFIG_MEDIA_TUNER_FC0011 is not set
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> # CONFIG_MEDIA_TUNER_FC0013 is not set
> # CONFIG_MEDIA_TUNER_TDA18212 is not set
> CONFIG_MEDIA_TUNER_E4000=3Dy
> # CONFIG_MEDIA_TUNER_FC2580 is not set
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> # CONFIG_MEDIA_TUNER_TUA9001 is not set
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1C0042 is not set
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dy
> CONFIG_DVB_STB6100=3Dm
> CONFIG_DVB_STV090x=3Dy
> # CONFIG_DVB_STV0910 is not set
> CONFIG_DVB_STV6110x=3Dy
> CONFIG_DVB_STV6111=3Dm
> CONFIG_DVB_MXL5XX=3Dy
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dy
> CONFIG_DVB_TDA18271C2DD=3Dm
> CONFIG_DVB_SI2165=3Dy
> CONFIG_DVB_MN88472=3Dy
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dm
> CONFIG_DVB_CX24123=3Dy
> CONFIG_DVB_MT312=3Dy
> CONFIG_DVB_ZL10036=3Dm
> CONFIG_DVB_ZL10039=3Dy
> # CONFIG_DVB_S5H1420 is not set
> # CONFIG_DVB_STV0288 is not set
> # CONFIG_DVB_STB6000 is not set
> CONFIG_DVB_STV0299=3Dm
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> # CONFIG_DVB_TDA10086 is not set
> CONFIG_DVB_TDA8261=3Dy
> CONFIG_DVB_VES1X93=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> # CONFIG_DVB_TUNER_CX24113 is not set
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_TUA6100=3Dm
> # CONFIG_DVB_CX24116 is not set
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> # CONFIG_DVB_SI21XX is not set
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> # CONFIG_DVB_MB86A16 is not set
> CONFIG_DVB_TDA10071=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> # CONFIG_DVB_SP887X is not set
> # CONFIG_DVB_CX22700 is not set
> CONFIG_DVB_CX22702=3Dm
> # CONFIG_DVB_S5H1432 is not set
> CONFIG_DVB_DRXD=3Dm
> CONFIG_DVB_L64781=3Dy
> # CONFIG_DVB_TDA1004X is not set
> CONFIG_DVB_NXT6000=3Dm
> CONFIG_DVB_MT352=3Dy
> # CONFIG_DVB_ZL10353 is not set
> CONFIG_DVB_DIB3000MB=3Dy
> # CONFIG_DVB_DIB3000MC is not set
> CONFIG_DVB_DIB7000M=3Dm
> # CONFIG_DVB_DIB7000P is not set
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dm
> CONFIG_DVB_EC100=3Dm
> # CONFIG_DVB_STV0367 is not set
> CONFIG_DVB_CXD2820R=3Dm
> # CONFIG_DVB_CXD2841ER is not set
> CONFIG_DVB_RTL2830=3Dy
> CONFIG_DVB_RTL2832=3Dy
> # CONFIG_DVB_SI2168 is not set
> # CONFIG_DVB_AS102_FE is not set
> CONFIG_DVB_ZD1301_DEMOD=3Dm
> # CONFIG_DVB_GP8PSK_FE is not set
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> # CONFIG_DVB_TDA10021 is not set
> # CONFIG_DVB_TDA10023 is not set
> # CONFIG_DVB_STV0297 is not set
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> # CONFIG_DVB_NXT200X is not set
> CONFIG_DVB_OR51211=3Dm
> # CONFIG_DVB_OR51132 is not set
> # CONFIG_DVB_BCM3510 is not set
> # CONFIG_DVB_LGDT330X is not set
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LGDT3306A=3Dy
> # CONFIG_DVB_LG2160 is not set
> # CONFIG_DVB_S5H1409 is not set
> # CONFIG_DVB_AU8522_DTV is not set
> # CONFIG_DVB_S5H1411 is not set
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_S921 is not set
> CONFIG_DVB_DIB8000=3Dy
> # CONFIG_DVB_MB86A20S is not set
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> # CONFIG_DVB_TC90522 is not set
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> # CONFIG_DVB_PLL is not set
> # CONFIG_DVB_TUNER_DIB0070 is not set
> # CONFIG_DVB_TUNER_DIB0090 is not set
> =

> #
> # SEC control devices for DVB-S
> #
> # CONFIG_DVB_DRX39XYJ is not set
> CONFIG_DVB_LNBH25=3Dy
> # CONFIG_DVB_LNBP21 is not set
> # CONFIG_DVB_LNBP22 is not set
> # CONFIG_DVB_ISL6405 is not set
> CONFIG_DVB_ISL6421=3Dy
> # CONFIG_DVB_ISL6423 is not set
> CONFIG_DVB_A8293=3Dy
> # CONFIG_DVB_SP2 is not set
> # CONFIG_DVB_LGS8GL5 is not set
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dy
> CONFIG_DVB_TDA665x=3Dy
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dm
> # CONFIG_DVB_AF9033 is not set
> # CONFIG_DVB_HORUS3A is not set
> # CONFIG_DVB_ASCOT2E is not set
> # CONFIG_DVB_HELENE is not set
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dy
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> # CONFIG_DRM is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> =

> #
> # AMD Library routines
> #
> # CONFIG_CHASH is not set
> # CONFIG_DRM_LIB_RANDOM is not set
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dm
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB_DDC=3Dm
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dm
> CONFIG_FB_CFB_COPYAREA=3Dm
> CONFIG_FB_CFB_IMAGEBLIT=3Dm
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=3Dy
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_SVGALIB=3Dm
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=3Dm
> CONFIG_FB_PM2=3Dm
> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> CONFIG_FB_CYBER2000=3Dm
> # CONFIG_FB_CYBER2000_DDC is not set
> CONFIG_FB_ARC=3Dm
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=3Dm
> CONFIG_FB_OPENCORES=3Dm
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=3Dm
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> CONFIG_FB_RIVA=3Dm
> CONFIG_FB_RIVA_I2C=3Dy
> CONFIG_FB_RIVA_DEBUG=3Dy
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> CONFIG_FB_I740=3Dm
> CONFIG_FB_LE80578=3Dm
> # CONFIG_FB_CARILLO_RANCH is not set
> CONFIG_FB_MATROX=3Dm
> # CONFIG_FB_MATROX_MILLENIUM is not set
> # CONFIG_FB_MATROX_MYSTIQUE is not set
> # CONFIG_FB_MATROX_G is not set
> CONFIG_FB_MATROX_I2C=3Dm
> CONFIG_FB_RADEON=3Dm
> # CONFIG_FB_RADEON_I2C is not set
> # CONFIG_FB_RADEON_BACKLIGHT is not set
> # CONFIG_FB_RADEON_DEBUG is not set
> CONFIG_FB_ATY128=3Dm
> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> CONFIG_FB_ATY=3Dm
> # CONFIG_FB_ATY_CT is not set
> # CONFIG_FB_ATY_GX is not set
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> CONFIG_FB_S3=3Dm
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dm
> # CONFIG_FB_SAVAGE_I2C is not set
> # CONFIG_FB_SAVAGE_ACCEL is not set
> CONFIG_FB_SIS=3Dm
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=3Dm
> CONFIG_FB_3DFX=3Dm
> # CONFIG_FB_3DFX_ACCEL is not set
> CONFIG_FB_3DFX_I2C=3Dy
> CONFIG_FB_VOODOO1=3Dm
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> CONFIG_FB_ARK=3Dm
> CONFIG_FB_PM3=3Dm
> # CONFIG_FB_CARMINE is not set
> CONFIG_FB_SM501=3Dm
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_VIRTUAL=3Dm
> CONFIG_FB_METRONOME=3Dm
> CONFIG_FB_MB862XX=3Dm
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> CONFIG_FB_BROADSHEET=3Dm
> CONFIG_FB_AUO_K190X=3Dm
> CONFIG_FB_AUO_K1900=3Dm
> CONFIG_FB_AUO_K1901=3Dm
> CONFIG_FB_SM712=3Dm
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
> CONFIG_BACKLIGHT_GENERIC=3Dm
> CONFIG_BACKLIGHT_LM3533=3Dm
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_MAX8925=3Dm
> CONFIG_BACKLIGHT_APPLE=3Dm
> CONFIG_BACKLIGHT_PM8941_WLED=3Dm
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_ADP5520=3Dm
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_PCF50633=3Dm
> # CONFIG_BACKLIGHT_LM3630A is not set
> CONFIG_BACKLIGHT_LM3639=3Dm
> CONFIG_BACKLIGHT_LP855X=3Dm
> CONFIG_BACKLIGHT_PANDORA=3Dm
> CONFIG_BACKLIGHT_SKY81452=3Dm
> CONFIG_BACKLIGHT_AS3711=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_BACKLIGHT_ARCXCNN=3Dm
> CONFIG_VGASTATE=3Dm
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> # CONFIG_FRAMEBUFFER_CONSOLE is not set
> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dm
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> # CONFIG_UHID is not set
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_ASUS is not set
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> CONFIG_HID_CHERRY=3Dm
> CONFIG_HID_CHICONY=3Dm
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CYPRESS=3Dm
> # CONFIG_HID_DRAGONRISE is not set
> CONFIG_HID_EMS_FF=3Dm
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dm
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> # CONFIG_HID_LOGITECH_DJ is not set
> # CONFIG_HID_LOGITECH_HIDPP is not set
> # CONFIG_LOGITECH_FF is not set
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> # CONFIG_LOGIG940_FF is not set
> CONFIG_LOGIWHEELS_FF=3Dy
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MAYFLASH=3Dm
> # CONFIG_HID_MICROSOFT is not set
> CONFIG_HID_MONTEREY=3Dm
> # CONFIG_HID_MULTITOUCH is not set
> CONFIG_HID_NTI=3Dm
> CONFIG_HID_ORTEK=3Dm
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> # CONFIG_HID_PRIMAX is not set
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dm
> CONFIG_HID_STEELSERIES=3Dm
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> # CONFIG_HID_GREENASIA is not set
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_UDRAW_PS3=3Dm
> # CONFIG_HID_WIIMOTE is not set
> # CONFIG_HID_XINMO is not set
> CONFIG_HID_ZEROPLUS=3Dm
> CONFIG_ZEROPLUS_FF=3Dy
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dm
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dm
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dm
> =

> #
> # Intel ISH HID support
> #
> # CONFIG_INTEL_ISH_HID is not set
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> CONFIG_USB_PCI=3Dy
> =

> #
> # USB port drivers
> #
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_USB_PHY is not set
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> # CONFIG_TYPEC_UCSI is not set
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> CONFIG_UWB=3Dy
> # CONFIG_UWB_WHCI is not set
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=3Dm
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> # CONFIG_MSPRO_BLOCK is not set
> # CONFIG_MS_BLOCK is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> CONFIG_MEMSTICK_JMICRON_38X=3Dm
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_MEMSTICK_REALTEK_PCI=3Dm
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_APU=3Dy
> CONFIG_LEDS_LM3530=3Dy
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_MT6323 is not set
> CONFIG_LEDS_PCA9532=3Dy
> # CONFIG_LEDS_PCA9532_GPIO is not set
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dm
> CONFIG_LEDS_LP3952=3Dm
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> CONFIG_LEDS_PCA955X=3Dm
> # CONFIG_LEDS_PCA955X_GPIO is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=3Dm
> CONFIG_LEDS_BD2802=3Dy
> # CONFIG_LEDS_INTEL_SS4200 is not set
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_MC13783=3Dm
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dm
> CONFIG_LEDS_MAX8997=3Dm
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> # CONFIG_LEDS_MLXCPLD is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> CONFIG_LEDS_TRIGGER_DISK=3Dy
> CONFIG_LEDS_TRIGGER_MTD=3Dy
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_ACCESSIBILITY=3Dy
> # CONFIG_A11Y_BRAILLE_CONSOLE is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> # CONFIG_EDAC_LEGACY_SYSFS is not set
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_GHES=3Dy
> CONFIG_EDAC_E752X=3Dy
> CONFIG_EDAC_I82975X=3Dy
> # CONFIG_EDAC_I3000 is not set
> CONFIG_EDAC_I3200=3Dy
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> CONFIG_EDAC_I5400=3Dy
> # CONFIG_EDAC_I5000 is not set
> CONFIG_EDAC_I5100=3Dy
> CONFIG_EDAC_I7300=3Dy
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dm
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> # CONFIG_INTEL_IDMA64 is not set
> CONFIG_INTEL_IOATDMA=3Dy
> CONFIG_INTEL_MIC_X100_DMA=3Dm
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dm
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dm
> CONFIG_HSU_DMA=3Dm
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> # CONFIG_SYNC_FILE is not set
> CONFIG_DCA=3Dy
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_CHARLCD=3Dy
> CONFIG_HD44780=3Dy
> CONFIG_IMG_ASCII_LCD=3Dy
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> CONFIG_UIO_DMEM_GENIRQ=3Dm
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dm
> CONFIG_UIO_MF624=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dm
> # CONFIG_VIRTIO_PCI_LEGACY is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> # CONFIG_VIRTIO_INPUT is not set
> # CONFIG_VIRTIO_MMIO is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_HYPERV_TSCPAGE is not set
> CONFIG_STAGING=3Dy
> # CONFIG_IRDA is not set
> CONFIG_COMEDI=3Dy
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> CONFIG_COMEDI_PCI_DRIVERS=3Dy
> CONFIG_COMEDI_8255_PCI=3Dm
> CONFIG_COMEDI_ADDI_WATCHDOG=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1032 is not set
> CONFIG_COMEDI_ADDI_APCI_1500=3Dy
> # CONFIG_COMEDI_ADDI_APCI_1516 is not set
> CONFIG_COMEDI_ADDI_APCI_1564=3Dy
> CONFIG_COMEDI_ADDI_APCI_16XX=3Dm
> CONFIG_COMEDI_ADDI_APCI_2032=3Dy
> CONFIG_COMEDI_ADDI_APCI_2200=3Dm
> # CONFIG_COMEDI_ADDI_APCI_3120 is not set
> CONFIG_COMEDI_ADDI_APCI_3501=3Dy
> CONFIG_COMEDI_ADDI_APCI_3XXX=3Dm
> CONFIG_COMEDI_ADL_PCI6208=3Dm
> CONFIG_COMEDI_ADL_PCI7X3X=3Dy
> # CONFIG_COMEDI_ADL_PCI8164 is not set
> CONFIG_COMEDI_ADL_PCI9111=3Dy
> CONFIG_COMEDI_ADL_PCI9118=3Dy
> CONFIG_COMEDI_ADV_PCI1710=3Dm
> CONFIG_COMEDI_ADV_PCI1720=3Dm
> # CONFIG_COMEDI_ADV_PCI1723 is not set
> CONFIG_COMEDI_ADV_PCI1724=3Dm
> CONFIG_COMEDI_ADV_PCI1760=3Dy
> # CONFIG_COMEDI_ADV_PCI_DIO is not set
> CONFIG_COMEDI_AMPLC_DIO200_PCI=3Dm
> CONFIG_COMEDI_AMPLC_PC236_PCI=3Dy
> # CONFIG_COMEDI_AMPLC_PC263_PCI is not set
> CONFIG_COMEDI_AMPLC_PCI224=3Dm
> CONFIG_COMEDI_AMPLC_PCI230=3Dm
> CONFIG_COMEDI_CONTEC_PCI_DIO=3Dm
> # CONFIG_COMEDI_DAS08_PCI is not set
> CONFIG_COMEDI_DT3000=3Dm
> # CONFIG_COMEDI_DYNA_PCI10XX is not set
> # CONFIG_COMEDI_GSC_HPDI is not set
> CONFIG_COMEDI_MF6X4=3Dm
> CONFIG_COMEDI_ICP_MULTI=3Dm
> CONFIG_COMEDI_DAQBOARD2000=3Dm
> CONFIG_COMEDI_JR3_PCI=3Dm
> CONFIG_COMEDI_KE_COUNTER=3Dy
> CONFIG_COMEDI_CB_PCIDAS64=3Dm
> CONFIG_COMEDI_CB_PCIDAS=3Dm
> CONFIG_COMEDI_CB_PCIDDA=3Dy
> # CONFIG_COMEDI_CB_PCIMDAS is not set
> CONFIG_COMEDI_CB_PCIMDDA=3Dm
> CONFIG_COMEDI_ME4000=3Dy
> CONFIG_COMEDI_ME_DAQ=3Dy
> # CONFIG_COMEDI_NI_6527 is not set
> CONFIG_COMEDI_NI_65XX=3Dy
> CONFIG_COMEDI_NI_660X=3Dm
> CONFIG_COMEDI_NI_670X=3Dy
> CONFIG_COMEDI_NI_LABPC_PCI=3Dy
> # CONFIG_COMEDI_NI_PCIDIO is not set
> CONFIG_COMEDI_NI_PCIMIO=3Dm
> CONFIG_COMEDI_RTD520=3Dy
> # CONFIG_COMEDI_S626 is not set
> CONFIG_COMEDI_MITE=3Dm
> CONFIG_COMEDI_NI_TIOCMD=3Dm
> CONFIG_COMEDI_8254=3Dy
> CONFIG_COMEDI_8255=3Dy
> # CONFIG_COMEDI_8255_SA is not set
> CONFIG_COMEDI_KCOMEDILIB=3Dm
> CONFIG_COMEDI_AMPLC_DIO200=3Dm
> CONFIG_COMEDI_AMPLC_PC236=3Dy
> CONFIG_COMEDI_NI_LABPC=3Dy
> CONFIG_COMEDI_NI_TIO=3Dm
> CONFIG_RTS5208=3Dm
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7606 is not set
> =

> #
> # Analog digital bi-direction converters
> #
> CONFIG_ADT7316=3Dy
> CONFIG_ADT7316_I2C=3Dm
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dm
> # CONFIG_AD7152 is not set
> # CONFIG_AD7746 is not set
> =

> #
> # Direct Digital Synthesis
> #
> =

> #
> # Digital gyroscope sensors
> #
> =

> #
> # Network Analyzer, Impedance Converters
> #
> # CONFIG_AD5933 is not set
> =

> #
> # Light sensors
> #
> # CONFIG_TSL2x7x is not set
> =

> #
> # Active energy metering IC
> #
> CONFIG_ADE7854=3Dm
> # CONFIG_ADE7854_I2C is not set
> =

> #
> # Resolver to digital converters
> #
> =

> #
> # Triggers - standalone
> #
> CONFIG_FB_SM750=3Dm
> CONFIG_FB_XGI=3Dm
> =

> #
> # Speakup console speech
> #
> CONFIG_SPEAKUP=3Dy
> # CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
> CONFIG_SPEAKUP_SYNTH_APOLLO=3Dy
> CONFIG_SPEAKUP_SYNTH_AUDPTR=3Dm
> CONFIG_SPEAKUP_SYNTH_BNS=3Dy
> CONFIG_SPEAKUP_SYNTH_DECTLK=3Dm
> CONFIG_SPEAKUP_SYNTH_DECEXT=3Dy
> # CONFIG_SPEAKUP_SYNTH_LTLK is not set
> # CONFIG_SPEAKUP_SYNTH_SOFT is not set
> CONFIG_SPEAKUP_SYNTH_SPKOUT=3Dy
> CONFIG_SPEAKUP_SYNTH_TXPRT=3Dm
> CONFIG_SPEAKUP_SYNTH_DUMMY=3Dm
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> # CONFIG_ASHMEM is not set
> # CONFIG_ION is not set
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> CONFIG_DGNC=3Dy
> # CONFIG_GS_FPGABOOT is not set
> CONFIG_CRYPTO_SKEIN=3Dy
> CONFIG_UNISYSSPAR=3Dy
> # CONFIG_UNISYS_VISORBUS is not set
> CONFIG_MOST=3Dy
> CONFIG_MOSTCORE=3Dy
> # CONFIG_AIM_CDEV is not set
> # CONFIG_AIM_NETWORK is not set
> # CONFIG_HDM_DIM2 is not set
> CONFIG_HDM_I2C=3Dy
> CONFIG_GREYBUS=3Dy
> # CONFIG_GREYBUS_BOOTROM is not set
> CONFIG_GREYBUS_HID=3Dm
> # CONFIG_GREYBUS_LIGHT is not set
> CONFIG_GREYBUS_LOG=3Dy
> # CONFIG_GREYBUS_LOOPBACK is not set
> CONFIG_GREYBUS_POWER=3Dy
> CONFIG_GREYBUS_RAW=3Dm
> CONFIG_GREYBUS_VIBRATOR=3Dy
> CONFIG_GREYBUS_BRIDGED_PHY=3Dy
> CONFIG_GREYBUS_GPIO=3Dy
> # CONFIG_GREYBUS_I2C is not set
> # CONFIG_GREYBUS_PWM is not set
> CONFIG_GREYBUS_UART=3Dm
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_LAPTOP=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> CONFIG_CROS_EC_CHARDEV=3Dm
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dm
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_SI5351 is not set
> CONFIG_COMMON_CLK_CDCE706=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_CLK_TWL6040=3Dm
> # CONFIG_COMMON_CLK_NXP is not set
> # CONFIG_COMMON_CLK_PALMAS is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> # CONFIG_HWSPINLOCK is not set
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> # CONFIG_MAILBOX is not set
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_VIRTIO=3Dy
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> =

> #
> # Broadcom SoC drivers
> #
> =

> #
> # i.MX SoC drivers
> #
> =

> #
> # Qualcomm SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> CONFIG_SOC_TI=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dm
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> # CONFIG_DEVFREQ_GOV_USERSPACE is not set
> CONFIG_DEVFREQ_GOV_PASSIVE=3Dy
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
> CONFIG_EXTCON_ADC_JACK=3Dy
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_INTEL_INT3496=3Dy
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_MAX3355=3Dm
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_MAX8997=3Dy
> # CONFIG_EXTCON_PALMAS is not set
> CONFIG_EXTCON_RT8973A=3Dm
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_EXTCON_USB_GPIO=3Dm
> CONFIG_EXTCON_USBC_CROS_EC=3Dy
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> # CONFIG_IIO_SW_DEVICE is not set
> CONFIG_IIO_SW_TRIGGER=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dm
> CONFIG_BMC150_ACCEL=3Dm
> CONFIG_BMC150_ACCEL_I2C=3Dm
> CONFIG_DA280=3Dm
> CONFIG_DA311=3Dm
> # CONFIG_DMARD09 is not set
> CONFIG_DMARD10=3Dm
> CONFIG_HID_SENSOR_ACCEL_3D=3Dm
> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dy
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=3Dm
> # CONFIG_KXSD9_I2C is not set
> CONFIG_KXCJK1013=3Dy
> CONFIG_MC3230=3Dm
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7660=3Dy
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> # CONFIG_MXC6255 is not set
> # CONFIG_STK8312 is not set
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7291 is not set
> CONFIG_AD799X=3Dm
> CONFIG_AXP20X_ADC=3Dm
> CONFIG_AXP288_ADC=3Dm
> # CONFIG_CC10001_ADC is not set
> # CONFIG_HX711 is not set
> # CONFIG_INA2XX_ADC is not set
> # CONFIG_LTC2471 is not set
> # CONFIG_LTC2485 is not set
> # CONFIG_LTC2497 is not set
> CONFIG_MAX1363=3Dm
> CONFIG_MAX9611=3Dy
> CONFIG_MCP3422=3Dy
> CONFIG_NAU7802=3Dm
> # CONFIG_PALMAS_GPADC is not set
> CONFIG_TI_ADC081C=3Dm
> # CONFIG_TI_ADS1015 is not set
> # CONFIG_TI_AM335X_ADC is not set
> CONFIG_TWL4030_MADC=3Dy
> CONFIG_TWL6030_GPADC=3Dm
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> # CONFIG_ATLAS_PH_SENSOR is not set
> CONFIG_CCS811=3Dm
> # CONFIG_IAQCORE is not set
> # CONFIG_VZ89X is not set
> # CONFIG_IIO_CROS_EC_SENSORS_CORE is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dm
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dm
> CONFIG_IIO_MS_SENSORS_I2C=3Dm
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Counters
> #
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dm
> # CONFIG_AD5380 is not set
> CONFIG_AD5446=3Dm
> # CONFIG_AD5593R is not set
> CONFIG_DS4424=3Dy
> CONFIG_M62332=3Dm
> CONFIG_MAX517=3Dy
> CONFIG_MCP4725=3Dy
> =

> #
> # IIO dummy driver
> #
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_BMG160=3Dm
> CONFIG_BMG160_I2C=3Dm
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> CONFIG_MPU3050=3Dy
> CONFIG_MPU3050_I2C=3Dy
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> CONFIG_ITG3200=3Dy
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=3Dy
> CONFIG_MAX30100=3Dy
> # CONFIG_MAX30102 is not set
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> CONFIG_HDC100X=3Dy
> # CONFIG_HID_SENSOR_HUMIDITY is not set
> CONFIG_HTS221=3Dm
> CONFIG_HTS221_I2C=3Dm
> # CONFIG_HTU21 is not set
> # CONFIG_SI7005 is not set
> CONFIG_SI7020=3Dm
> =

> #
> # Inertial measurement units
> #
> # CONFIG_BMI160_I2C is not set
> CONFIG_KMX61=3Dm
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_IIO_ST_LSM6DSX=3Dm
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dm
> =

> #
> # Light sensors
> #
> CONFIG_ACPI_ALS=3Dy
> # CONFIG_ADJD_S311 is not set
> CONFIG_AL3320A=3Dm
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=3Dm
> CONFIG_BH1750=3Dm
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dm
> CONFIG_CM3232=3Dy
> # CONFIG_CM3323 is not set
> CONFIG_CM36651=3Dm
> CONFIG_GP2AP020A00F=3Dy
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_ISL29125=3Dm
> CONFIG_HID_SENSOR_ALS=3Dm
> # CONFIG_HID_SENSOR_PROX is not set
> # CONFIG_JSA1212 is not set
> CONFIG_RPR0521=3Dy
> CONFIG_SENSORS_LM3533=3Dy
> # CONFIG_LTR501 is not set
> CONFIG_MAX44000=3Dm
> CONFIG_OPT3001=3Dy
> # CONFIG_PA12203001 is not set
> CONFIG_SI1145=3Dm
> CONFIG_STK3310=3Dm
> CONFIG_TCS3414=3Dm
> CONFIG_TCS3472=3Dm
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dm
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> CONFIG_VCNL4000=3Dy
> # CONFIG_VEML6070 is not set
> # CONFIG_VL6180 is not set
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> # CONFIG_BMC150_MAGN_I2C is not set
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dm
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> =

> #
> # Multiplexers
> #
> =

> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dm
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dm
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> =

> #
> # Digital potentiometers
> #
> CONFIG_DS1803=3Dy
> CONFIG_MCP4531=3Dm
> CONFIG_TPL0102=3Dy
> =

> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=3Dy
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dm
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> # CONFIG_HID_SENSOR_PRESS is not set
> # CONFIG_HP03 is not set
> # CONFIG_MPL115_I2C is not set
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> # CONFIG_MS5611_I2C is not set
> CONFIG_MS5637=3Dm
> CONFIG_IIO_ST_PRESS=3Dm
> CONFIG_IIO_ST_PRESS_I2C=3Dm
> # CONFIG_T5403 is not set
> # CONFIG_HP206C is not set
> CONFIG_ZPA2326=3Dm
> CONFIG_ZPA2326_I2C=3Dm
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_RFD77402=3Dy
> # CONFIG_SRF04 is not set
> CONFIG_SX9500=3Dm
> CONFIG_SRF08=3Dm
> =

> #
> # Temperature sensors
> #
> CONFIG_HID_SENSOR_TEMP=3Dm
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> # CONFIG_TMP007 is not set
> CONFIG_TSYS01=3Dm
> CONFIG_TSYS02D=3Dm
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_CRC=3Dy
> CONFIG_PWM_CROS_EC=3Dm
> CONFIG_PWM_LP3943=3Dm
> CONFIG_PWM_LPSS=3Dy
> CONFIG_PWM_LPSS_PCI=3Dy
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_PWM_PCA9685=3Dy
> CONFIG_PWM_TWL=3Dm
> CONFIG_PWM_TWL_LED=3Dm
> =

> #
> # IRQ chip support
> #
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_ARM_GIC_V3_ITS is not set
> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=3Dy
> # CONFIG_RESET_ATH79 is not set
> # CONFIG_RESET_AXS10X is not set
> # CONFIG_RESET_BERLIN is not set
> # CONFIG_RESET_IMX7 is not set
> # CONFIG_RESET_LANTIQ is not set
> # CONFIG_RESET_LPC18XX is not set
> # CONFIG_RESET_MESON is not set
> # CONFIG_RESET_PISTACHIO is not set
> # CONFIG_RESET_SIMPLE is not set
> # CONFIG_RESET_SUNXI is not set
> # CONFIG_RESET_TI_SYSCON is not set
> # CONFIG_RESET_ZYNQ is not set
> # CONFIG_RESET_TEGRA_BPMP is not set
> CONFIG_FMC=3Dm
> # CONFIG_FMC_FAKEDEV is not set
> CONFIG_FMC_TRIVIAL=3Dm
> CONFIG_FMC_WRITE_EEPROM=3Dm
> CONFIG_FMC_CHARDEV=3Dm
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> CONFIG_PHY_PXA_28NM_HSIC=3Dy
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_CPCAP_USB is not set
> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL=3Dy
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> CONFIG_THUNDERBOLT=3Dy
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> # CONFIG_LIBNVDIMM is not set
> CONFIG_DAX=3Dy
> CONFIG_NVMEM=3Dy
> CONFIG_STM=3Dm
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> # CONFIG_STM_SOURCE_FTRACE is not set
> # CONFIG_INTEL_TH is not set
> # CONFIG_FPGA is not set
> =

> #
> # FSI support
> #
> CONFIG_FSI=3Dy
> CONFIG_FSI_MASTER_GPIO=3Dy
> CONFIG_FSI_MASTER_HUB=3Dm
> CONFIG_FSI_SCOM=3Dy
> CONFIG_PM_OPP=3Dy
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DCDBAS is not set
> # CONFIG_DMIID is not set
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_FW_CFG_SYSFS=3Dm
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_VARS=3Dm
> CONFIG_EFI_ESRT=3Dy
> # CONFIG_EFI_VARS_PSTORE is not set
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_BOOTLOADER_CONTROL=3Dm
> # CONFIG_EFI_CAPSULE_LOADER is not set
> CONFIG_EFI_TEST=3Dy
> CONFIG_UEFI_CPER=3Dy
> # CONFIG_EFI_DEV_PATH_PARSER is not set
> =

> #
> # Tegra firmware driver
> #
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_FS_IOMAP=3Dy
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_FS_POSIX_ACL=3Dy
> CONFIG_EXT3_FS_SECURITY=3Dy
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_USE_FOR_EXT2=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_ENCRYPTION is not set
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> # CONFIG_REISERFS_PROC_INFO is not set
> # CONFIG_REISERFS_FS_XATTR is not set
> CONFIG_JFS_FS=3Dm
> # CONFIG_JFS_POSIX_ACL is not set
> CONFIG_JFS_SECURITY=3Dy
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> CONFIG_XFS_FS=3Dm
> # CONFIG_XFS_QUOTA is not set
> # CONFIG_XFS_POSIX_ACL is not set
> # CONFIG_XFS_RT is not set
> CONFIG_XFS_ONLINE_SCRUB=3Dy
> # CONFIG_XFS_WARN is not set
> # CONFIG_XFS_DEBUG is not set
> CONFIG_GFS2_FS=3Dy
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> CONFIG_BTRFS_DEBUG=3Dy
> CONFIG_BTRFS_ASSERT=3Dy
> CONFIG_BTRFS_FS_REF_VERIFY=3Dy
> CONFIG_NILFS2_FS=3Dm
> # CONFIG_F2FS_FS is not set
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_QUOTACTL=3Dy
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> CONFIG_OVERLAY_FS=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> CONFIG_FSCACHE_STATS=3Dy
> CONFIG_FSCACHE_HISTOGRAM=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dy
> CONFIG_CACHEFILES_DEBUG=3Dy
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> # CONFIG_JOLIET is not set
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> CONFIG_UDF_NLS=3Dy
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_FAT_DEFAULT_UTF8=3Dy
> CONFIG_NTFS_FS=3Dm
> CONFIG_NTFS_DEBUG=3Dy
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
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dm
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> # CONFIG_ADFS_FS_RW is not set
> # CONFIG_AFFS_FS is not set
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_JFFS2_FS=3Dm
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> # CONFIG_JFFS2_SUMMARY is not set
> # CONFIG_JFFS2_FS_XATTR is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> # CONFIG_JFFS2_RTIME is not set
> CONFIG_JFFS2_RUBIN=3Dy
> # CONFIG_JFFS2_CMODE_NONE is not set
> CONFIG_JFFS2_CMODE_PRIORITY=3Dy
> # CONFIG_JFFS2_CMODE_SIZE is not set
> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> # CONFIG_CRAMFS is not set
> # CONFIG_SQUASHFS is not set
> CONFIG_VXFS_FS=3Dm
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> CONFIG_QNX6FS_FS=3Dy
> CONFIG_QNX6FS_DEBUG=3Dy
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_ZLIB_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> CONFIG_PSTORE_CONSOLE=3Dy
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_FTRACE=3Dy
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> CONFIG_UFS_DEBUG=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> CONFIG_NLS_CODEPAGE_775=3Dm
> # CONFIG_NLS_CODEPAGE_850 is not set
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dy
> # CONFIG_NLS_CODEPAGE_860 is not set
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dm
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=3Dy
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dm
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dm
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> # CONFIG_NLS_MAC_CROATIAN is not set
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> # CONFIG_NLS_MAC_TURKISH is not set
> # CONFIG_NLS_UTF8 is not set
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
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_GDB_SCRIPTS is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D8192
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_STACK_VALIDATION is not set
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> # CONFIG_PAGE_POISONING_ZERO is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_DEBUG_ON=3Dy
> CONFIG_SLUB_STATS=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_KASAN=3Dy
> # CONFIG_KASAN_OUTLINE is not set
> CONFIG_KASAN_INLINE=3Dy
> CONFIG_TEST_KASAN=3Dm
> CONFIG_ARCH_HAS_KCOV=3Dy
> # CONFIG_KCOV is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_SOFTLOCKUP_DETECTOR is not set
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> # CONFIG_HARDLOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> CONFIG_DEBUG_PREEMPT=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_WW_MUTEX_SELFTEST=3Dy
> CONFIG_STACKTRACE=3Dy
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_LIST is not set
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> # CONFIG_PROVE_RCU is not set
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_PERF_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> # CONFIG_FUNCTION_GRAPH_TRACER is not set
> # CONFIG_PREEMPTIRQ_EVENTS is not set
> # CONFIG_IRQSOFF_TRACER is not set
> # CONFIG_PREEMPT_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> CONFIG_PROFILE_ANNOTATED_BRANCHES=3Dy
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> CONFIG_TRACING_BRANCHES=3Dy
> CONFIG_BRANCH_TRACER=3Dy
> # CONFIG_STACK_TRACER is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> CONFIG_MMIOTRACE=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> CONFIG_MMIOTRACE_TEST=3Dm
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> CONFIG_TRACE_EVAL_MAP_FILE=3Dy
> CONFIG_TRACING_EVENTS_GPIO=3Dy
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> CONFIG_TEST_LIST_SORT=3Dm
> # CONFIG_TEST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dm
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dm
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dm
> CONFIG_TEST_BITMAP=3Dm
> CONFIG_TEST_UUID=3Dm
> CONFIG_TEST_RHASHTABLE=3Dy
> CONFIG_TEST_HASH=3Dy
> CONFIG_TEST_LKM=3Dm
> # CONFIG_TEST_USER_COPY is not set
> # CONFIG_TEST_BPF is not set
> CONFIG_TEST_FIND_BIT=3Dy
> CONFIG_TEST_FIRMWARE=3Dm
> CONFIG_TEST_SYSCTL=3Dm
> CONFIG_TEST_UDELAY=3Dy
> # CONFIG_TEST_STATIC_KEYS is not set
> CONFIG_MEMTEST=3Dy
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> # CONFIG_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> CONFIG_EARLY_PRINTK_EFI=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_X86_PTDUMP_CORE is not set
> # CONFIG_X86_PTDUMP is not set
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
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
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_OPTIMIZE_INLINING is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_FPU=3Dy
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> # CONFIG_UNWINDER_ORC is not set
> CONFIG_UNWINDER_FRAME_POINTER=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> CONFIG_TRUSTED_KEYS=3Dm
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITY_WRITABLE_HOOKS is not set
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> # CONFIG_HARDENED_USERCOPY is not set
> # CONFIG_FORTIFY_SOURCE is not set
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_LOADPIN=3Dy
> CONFIG_SECURITY_LOADPIN_ENABLED=3Dy
> # CONFIG_SECURITY_YAMA is not set
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
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
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dy
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dy
> CONFIG_CRYPTO_ECDH=3Dm
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> # CONFIG_CRYPTO_AUTHENC is not set
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> # CONFIG_CRYPTO_CCM is not set
> # CONFIG_CRYPTO_GCM is not set
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> # CONFIG_CRYPTO_PCBC is not set
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dm
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dy
> # CONFIG_CRYPTO_XCBC is not set
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> # CONFIG_CRYPTO_MD4 is not set
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA1_MB=3Dm
> # CONFIG_CRYPTO_SHA256_MB is not set
> CONFIG_CRYPTO_SHA512_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> CONFIG_CRYPTO_SM3=3Dm
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dy
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> # CONFIG_CRYPTO_BLOWFISH is not set
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dm
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dm
> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dy
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dm
> # CONFIG_CRYPTO_LZO is not set
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> CONFIG_PKCS7_TEST_KEY=3Dy
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
> # CONFIG_VHOST_NET is not set
> # CONFIG_VHOST_SCSI is not set
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> CONFIG_BINARY_PRINTF=3Dy
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
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=3Dy
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dy
> CONFIG_XXHASH=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dm
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> # CONFIG_DMA_NOOP_OPS is not set
> # CONFIG_DMA_VIRT_OPS is not set
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_AUTOSELECT=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy
> # CONFIG_STRING_SELFTEST is not set

> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-trinity-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/yocto/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu Haswell,+smep
> 	-kernel $kernel
> 	-initrd $initrd
> 	-m 512
> 	-smp 1
> 	-device e1000,netdev=3Dnet0
> 	-netdev user,id=3Dnet0
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-watchdog-action debug
> 	-rtc base=3Dlocaltime
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	root=3D/dev/ram0
> 	hung_task_panic=3D1
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	net.ifnames=3D0
> 	printk.devkmsg=3Don
> 	panic=3D-1
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
> 	oops=3Dpanic
> 	load_ramdisk=3D2
> 	prompt_ramdisk=3D0
> 	drbd.minor_count=3D8
> 	systemd.log_level=3Derr
> 	ignore_loglevel
> 	console=3Dtty0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	vga=3Dnormal
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" -append "${append[*]}"


--===============7271029000131160230==--

