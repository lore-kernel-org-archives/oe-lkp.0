Content-Type: multipart/mixed; boundary="===============5525262084409423545=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] 048a5ca579 [ 57.925504] BUG: unable to handle kernel paging request at ffffa22f56e1f000
Date: Tue, 18 Sep 2018 14:33:30 +0800
Message-ID: <20180918063330.quehz4cqswhkm4sv@shbuild888>
In-Reply-To: <20180918054955.GM7632@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5525262084409423545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi LKP team,

Thanks for helping me verifying the patch!

I just tried biuld 2 bzImages, one is my patch + 4.19-rc4, and my patch + 4=
.19-rc2,
and used your script to run the qemu boot test. They both
booted fine. I paste the log below, don't know if there is
some differenc between my machine and yours, please help to
check, thanks

- Feng

----------------------------------------------------------------

feng(a)feng-iot:~$  cp b9/ws2/projects/linux-2.6/arch/x86/boot/bzImage . &&=
 ./lkp_yocto.sh bzImage
File =E2=80=98yocto-trinity-x86_64.cgz=E2=80=99 already there; not retrievi=
ng.

qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
01H:ECX.fma [bit 12]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
01H:ECX.movbe [bit 22]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.bmi1 [bit 3]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.hle [bit 4]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.avx2 [bit 5]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.bmi2 [bit 8]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.invpcid [bit 10]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.rtm [bit 11]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
07H:EBX.smap [bit 20]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
80000001H:ECX.abm [bit 5]
early console in setup code
Probing EDD (edd=3Doff to disable)... ok
[    0.000000] Linux version 4.19.0-rc2-00001-gb669845 (feng(a)shbuild999) =
(gcc version 5.4.0 20160609 (Ubuntu 5.4.0-6ubuntu1~16.04.10)) #107 Tue Sep =
18 14:12:50 CST 2018
[    0.000000] Command line: root=3D/dev/ram0 hung_task_panic=3D1 debug api=
c=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifn=
ames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=
=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3Dt=
tyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw drbd.minor_count=3D8 rcu=
perf.shutdown=3D0
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'standard' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001ffdffff] usable
[    0.000000] BIOS-e820: [mem 0x000000001ffe0000-0x000000001fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reser=
ved
[    0.000000] debug: ignoring loglevel setting.
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.8 present.
[    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1ub=
untu1 04/01/2014
[    0.000000] Hypervisor detected: KVM
[    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000] kvm-clock: cpu 0, msr e637001, primary cpu clock
[    0.000000] kvm-clock: using sched offset of 1147795969 cycles
[    0.000003] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles:=
 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.000008] tsc: Detected 2394.560 MHz processor
[    0.000787] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000793] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000798] last_pfn =3D 0x1ffe0 max_arch_pfn =3D 0x400000000
[    0.000827] MTRR default type: write-back
[    0.000829] MTRR fixed ranges enabled:
[    0.000831]   00000-9FFFF write-back
[    0.000833]   A0000-BFFFF uncachable
[    0.000835]   C0000-FFFFF write-protect
[    0.000836] MTRR variable ranges enabled:
[    0.000839]   0 base 0080000000 mask FF80000000 uncachable
[    0.000841]   1 disabled
[    0.000842]   2 disabled
[    0.000844]   3 disabled
[    0.000845]   4 disabled
[    0.000847]   5 disabled
[    0.000848]   6 disabled
[    0.000850]   7 disabled
[    0.000864] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC- UC
[    0.000867] Scan for SMP in [mem 0x00000000-0x000003ff]
[    0.000893] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
[    0.000922] Scan for SMP in [mem 0x000f0000-0x000fffff]
[    0.007474] found SMP MP-table at [mem 0x000f6aa0-0x000f6aaf] mapped at =
[(____ptrval____)]
[    0.007477]   mpc: f6ab0-f6b80
[    0.007689] Base memory trampoline at [(____ptrval____)] 99000 size 24576
[    0.007731] BRK [0x0f9db000, 0x0f9dbfff] PGTABLE
[    0.007734] BRK [0x0f9dc000, 0x0f9dcfff] PGTABLE
[    0.007737] BRK [0x0f9dd000, 0x0f9ddfff] PGTABLE
[    0.007781] BRK [0x0f9de000, 0x0f9defff] PGTABLE
[    0.007784] BRK [0x0f9df000, 0x0f9dffff] PGTABLE
[    0.010344] BRK [0x0f9e0000, 0x0f9e0fff] PGTABLE
[    0.010355] BRK [0x0f9e1000, 0x0f9e1fff] PGTABLE
[    0.010397] RAMDISK: [mem 0x1fc09000-0x1ffdffff]
[    0.010417] ACPI: Early table checksum verification disabled
[    0.010462] ACPI: RSDP 0x00000000000F68C0 000014 (v00 BOCHS )
[    0.010467] ACPI: RSDT 0x000000001FFE15FC 000030 (v01 BOCHS  BXPCRSDT 00=
000001 BXPC 00000001)
[    0.010475] ACPI: FACP 0x000000001FFE1458 000074 (v01 BOCHS  BXPCFACP 00=
000001 BXPC 00000001)
[    0.010482] ACPI: DSDT 0x000000001FFE0040 001418 (v01 BOCHS  BXPCDSDT 00=
000001 BXPC 00000001)
[    0.010488] ACPI: FACS 0x000000001FFE0000 000040
[    0.010493] ACPI: APIC 0x000000001FFE154C 000078 (v01 BOCHS  BXPCAPIC 00=
000001 BXPC 00000001)
[    0.010498] ACPI: HPET 0x000000001FFE15C4 000038 (v01 BOCHS  BXPCHPET 00=
000001 BXPC 00000001)
[    0.010508] ACPI: Local APIC address 0xfee00000
[    0.010513] mapped APIC to ffffffffff5fc000 (        fee00000)
[    0.010528] cma: dma_contiguous_reserve(limit 1ffe0000)
[    0.011524] Zone ranges:
[    0.011530]   DMA32    [mem 0x0000000000001000-0x000000001ffdffff]
[    0.011533]   Normal   empty
[    0.011535] Movable zone start for each node
[    0.011537] Early memory node ranges
[    0.011539]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.011541]   node   0: [mem 0x0000000000100000-0x000000001ffdffff]
[    0.011555] Reserved but unavailable: 130 pages
[    0.011557] Initmem setup node 0 [mem 0x0000000000001000-0x000000001ffdf=
fff]
[    0.011560] On node 0 totalpages: 130942
[    0.011563]   DMA32 zone: 2048 pages used for memmap
[    0.011565]   DMA32 zone: 21 pages reserved
[    0.011567]   DMA32 zone: 130942 pages, LIFO batch:31
[    0.014437] ACPI: PM-Timer IO Port: 0x608
[    0.014442] ACPI: Local APIC address 0xfee00000
[    0.014449] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
[    0.014486] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-=
23
[    0.014489] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.014492] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, APIC =
INT 02
[    0.014495] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[    0.014497] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, APIC =
INT 05
[    0.014499] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.014501] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, APIC =
INT 09
[    0.014503] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[    0.014505] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, APIC =
INT 0a
[    0.014507] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[    0.014509] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, APIC =
INT 0b
[    0.014511] ACPI: IRQ0 used by override.
[    0.014514] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, APIC =
INT 01
[    0.014516] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, APIC =
INT 03
[    0.014518] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, APIC =
INT 04
[    0.014520] ACPI: IRQ5 used by override.
[    0.014522] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, APIC =
INT 06
[    0.014524] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, APIC =
INT 07
[    0.014526] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, APIC =
INT 08
[    0.014528] ACPI: IRQ9 used by override.
[    0.014530] ACPI: IRQ10 used by override.
[    0.014531] ACPI: IRQ11 used by override.
[    0.014533] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, APIC =
INT 0c
[    0.014536] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, APIC =
INT 0d
[    0.014538] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, APIC =
INT 0e
[    0.014540] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, APIC =
INT 0f
[    0.014543] Using ACPI (MADT) for SMP configuration information
[    0.014546] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.014554] mapped IOAPIC to ffffffffff5fb000 (fec00000)
[    0.014578] KVM setup async PF for cpu 0
[    0.014583] kvm-stealtime: cpu 0, msr dfe3dc0
[    0.014590] [mem 0x20000000-0xfeffbfff] available for PCI devices
[    0.014592] Booting paravirtualized kernel on KVM
[    0.014595] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 6370452778343963 ns
[    0.157136] random: get_random_bytes called from start_kernel+0x82/0x5c5=
 with crng_init=3D0
[    0.157151] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.157154] pcpu-alloc: [0] 0
[    0.157170] Built 1 zonelists, mobility grouping on.  Total pages: 128873
[    0.157174] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D1 de=
bug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 =
net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_c=
ount=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=
=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw drbd.minor_count=3D8=
 rcuperf.shutdown=3D0
[    0.157432] sysrq: sysrq always enabled.
[    0.158247] Dentry cache hash table entries: 65536 (order: 7, 524288 byt=
es)
[    0.158260] Inode-cache hash table entries: 32768 (order: 6, 262144 byte=
s)
[    0.158294] Calgary: detecting Calgary via BIOS EBDA area
[    0.158297] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
[    0.187845] Memory: 445296K/523768K available (20488K kernel code, 3983K=
 rwdata, 8788K rodata, 1160K init, 20192K bss, 78472K reserved, 0K cma-rese=
rved)
[    0.187891] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1, N=
odes=3D1
[    0.187903]
[    0.187905] **********************************************************
[    0.187906] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.187908] **                                                      **
[    0.187910] ** trace_printk() being used. Allocating extra memory.  **
[    0.187912] **                                                      **
[    0.187913] ** This means that this is a DEBUG kernel and it is     **
[    0.187915] ** unsafe for production use.                           **
[    0.187917] **                                                      **
[    0.187918] ** If you see this message and you are not debugging    **
[    0.187920] ** the kernel, report this immediately to your vendor!  **
[    0.187922] **                                                      **
[    0.187923] **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
[    0.187925] **********************************************************
[    0.189039] NR_IRQS: 4352, nr_irqs: 256, preallocated irqs: 16
[    0.340618] console [ttyS0] enabled
[    0.341239] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,=
 Ingo Molnar
[    0.342563] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.343263] ... MAX_LOCK_DEPTH:          48
[    0.344006] ... MAX_LOCKDEP_KEYS:        8191
[    0.344779] ... CLASSHASH_SIZE:          4096
[    0.345550] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.346330] ... MAX_LOCKDEP_CHAINS:      65536
[    0.347110] ... CHAINHASH_SIZE:          32768
[    0.347896]  memory used by lock dependency info: 7359 kB
[    0.348852]  per task-struct memory footprint: 1920 bytes
[    0.349810] ------------------------
[    0.350448] | Locking API testsuite:
[    0.351081] ------------------------------------------------------------=
----------------
[    0.352231]                                  | spin |wlock |rlock |mutex=
 | wsem | rsem |
[    0.353650]   ----------------------------------------------------------=
----------------
[    0.355087]                      A-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.358341]                  A-B-B-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.361548]              A-B-B-C-C-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.364756]              A-B-C-A-B-C deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.367965]          A-B-B-C-C-D-D-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.370918]          A-B-C-D-B-D-D-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.373992]          A-B-C-D-B-C-D-A deadlock:failed|failed|  ok  |faile=
d|failed|failed|failed|
[    0.377208]                     double unlock:  ok  |  ok  |  ok  |  ok =
 |  ok  |  ok  |  ok  |
[    0.380076]                   initialize held:  ok  |  ok  |  ok  |  ok =
 |  ok  |  ok  |  ok  |
[    0.383239]   ----------------------------------------------------------=
----------------
[    0.384675]               recursive read-lock:             |  ok  |     =
        |failed|
[    0.386595]            recursive read-lock #2:             |  ok  |     =
        |failed|
[    0.388494]             mixed read-write-lock:             |failed|     =
        |failed|
[    0.390405]             mixed write-read-lock:             |failed|     =
        |failed|
[    0.392051]   mixed read-lock/lock-write ABBA:             |failed|     =
        |failed|
[    0.392531]    mixed read-lock/lock-read ABBA:             |  ok  |     =
        |failed|
[    0.394375]  mixed write-lock/lock-write ABBA:             |failed|     =
        |failed|
[    0.396284]   ----------------------------------------------------------=
----------------
[    0.398942]      hard-irqs-on + irq-safe-A/12:failed|failed|  ok  |
[    0.400633]      soft-irqs-on + irq-safe-A/12:failed|failed|  ok  |
[    0.402448]      hard-irqs-on + irq-safe-A/21:failed|failed|  ok  |
[    0.404260]      soft-irqs-on + irq-safe-A/21:failed|failed|  ok  |
[    0.406085]        sirq-safe-A =3D> hirqs-on/12:failed|failed|  ok  |
[    0.407900]        sirq-safe-A =3D> hirqs-on/21:failed|failed|  ok  |
[    0.409576]          hard-safe-A + irqs-on/12:failed|failed|  ok  |
[    0.411392]          soft-safe-A + irqs-on/12:failed|failed|  ok  |
[    0.413217]          hard-safe-A + irqs-on/21:failed|failed|  ok  |
[    0.415045]          soft-safe-A + irqs-on/21:failed|failed|  ok  |
[    0.416869]     hard-safe-A + unsafe-B #1/123:failed|failed|  ok  |
[    0.418695]     soft-safe-A + unsafe-B #1/123:failed|failed|  ok  |
[    0.420513]     hard-safe-A + unsafe-B #1/132:failed|failed|  ok  |
[    0.422339]     soft-safe-A + unsafe-B #1/132:failed|failed|  ok  |
[    0.424177]     hard-safe-A + unsafe-B #1/213:failed|failed|  ok  |
[    0.426004]     soft-safe-A + unsafe-B #1/213:failed|failed|  ok  |
[    0.427765]     hard-safe-A + unsafe-B #1/231:failed|failed|  ok  |
[    0.429340]     soft-safe-A + unsafe-B #1/231:failed|failed|  ok  |
[    0.430980]     hard-safe-A + unsafe-B #1/312:failed|failed|  ok  |
[    0.432821]     soft-safe-A + unsafe-B #1/312:failed|failed|  ok  |
[    0.434566]     hard-safe-A + unsafe-B #1/321:failed|failed|  ok  |
[    0.436514]     soft-safe-A + unsafe-B #1/321:failed|failed|  ok  |
[    0.438099]     hard-safe-A + unsafe-B #2/123:failed|failed|  ok  |
[    0.439670]     soft-safe-A + unsafe-B #2/123:failed|failed|  ok  |
[    0.441240]     hard-safe-A + unsafe-B #2/132:failed|failed|  ok  |
[    0.442816]     soft-safe-A + unsafe-B #2/132:failed|failed|  ok  |
[    0.444385]     hard-safe-A + unsafe-B #2/213:failed|failed|  ok  |
[    0.445953]     soft-safe-A + unsafe-B #2/213:failed|failed|  ok  |
[    0.447511]     hard-safe-A + unsafe-B #2/231:failed|failed|  ok  |
[    0.449070]     soft-safe-A + unsafe-B #2/231:failed|failed|  ok  |
[    0.450637]     hard-safe-A + unsafe-B #2/312:failed|failed|  ok  |
[    0.452194]     soft-safe-A + unsafe-B #2/312:failed|failed|  ok  |
[    0.453864]     hard-safe-A + unsafe-B #2/321:failed|failed|  ok  |
[    0.455642]     soft-safe-A + unsafe-B #2/321:failed|failed|  ok  |
[    0.457444]       hard-irq lock-inversion/123:failed|failed|  ok  |
[    0.459214]       soft-irq lock-inversion/123:failed|failed|  ok  |
[    0.460985]       hard-irq lock-inversion/132:failed|failed|  ok  |
[    0.462769]       soft-irq lock-inversion/132:failed|failed|  ok  |
[    0.464547]       hard-irq lock-inversion/213:failed|failed|  ok  |
[    0.466314]       soft-irq lock-inversion/213:failed|failed|  ok  |
[    0.468039]       hard-irq lock-inversion/231:failed|failed|  ok  |
[    0.469788]       soft-irq lock-inversion/231:failed|failed|  ok  |
[    0.471524]       hard-irq lock-inversion/312:failed|failed|  ok  |
[    0.473243]       soft-irq lock-inversion/312:failed|failed|  ok  |
[    0.475009]       hard-irq lock-inversion/321:failed|failed|  ok  |
[    0.476741]       soft-irq lock-inversion/321:failed|failed|  ok  |
[    0.478348]       hard-irq read-recursion/123:  ok  |
[    0.479288]       soft-irq read-recursion/123:  ok  |
[    0.480272]       hard-irq read-recursion/132:  ok  |
[    0.481398]       soft-irq read-recursion/132:  ok  |
[    0.482519]       hard-irq read-recursion/213:  ok  |
[    0.483586]       soft-irq read-recursion/213:  ok  |
[    0.484650]       hard-irq read-recursion/231:  ok  |
[    0.485746]       soft-irq read-recursion/231:  ok  |
[    0.486824]       hard-irq read-recursion/312:  ok  |
[    0.487738]       soft-irq read-recursion/312:  ok  |
[    0.488760]       hard-irq read-recursion/321:  ok  |
[    0.489842]       soft-irq read-recursion/321:  ok  |
[    0.490830]   ----------------------------------------------------------=
----------------
[    0.491883]   | Wound/wait tests |
[    0.492334]   ---------------------
[    0.492799]                   ww api failures:  ok  |  ok  |  ok  |
[    0.494525]                ww contexts mixing:failed|  ok  |
[    0.495917]              finishing ww context:  ok  |  ok  |  ok  |  ok =
 |
[    0.498020]                locking mismatches:  ok  |  ok  |  ok  |
[    0.499784]                  EDEADLK handling:  ok  |  ok  |  ok  |  ok =
 |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
[    0.503926]            spinlock nest unlocked:  ok  |
[    0.505034]   -----------------------------------------------------
[    0.505999]                                  |block | try  |context|
[    0.507075]   -----------------------------------------------------
[    0.508149]                           context:failed|  ok  |  ok  |
[    0.509947]                               try:failed|  ok  |failed|
[    0.511737]                             block:failed|  ok  |failed|
[    0.513353]                          spinlock:failed|  ok  |failed|
[    0.515151] --------------------------------------------------------
[    0.516227] 153 out of 262 testcases failed, as expected. |
[    0.517173] ----------------------------------------------------
[    0.518434] ACPI: Core revision 20180810
[    0.519375] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 19112604467 ns
[    0.521028] hpet clockevent registered
[    0.521797] APIC: Switch to symmetric I/O mode setup
[    0.522707] enabled ExtINT on CPU#0
[    0.524016] ENABLING IO-APIC IRQs
[    0.524652] init IO_APIC IRQs
[    0.525174]  apic 0 pin 0 not connected
[    0.525887] IOAPIC[0]: Set routing entry (0-1 -> 0xef -> IRQ 1 Mode:0 Ac=
tive:0 Dest:1)
[    0.527279] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 Ac=
tive:0 Dest:1)
[    0.528671] IOAPIC[0]: Set routing entry (0-3 -> 0xef -> IRQ 3 Mode:0 Ac=
tive:0 Dest:1)
[    0.529903] IOAPIC[0]: Set routing entry (0-4 -> 0xef -> IRQ 4 Mode:0 Ac=
tive:0 Dest:1)
[    0.531293] IOAPIC[0]: Set routing entry (0-5 -> 0xef -> IRQ 5 Mode:1 Ac=
tive:0 Dest:1)
[    0.532647] IOAPIC[0]: Set routing entry (0-6 -> 0xef -> IRQ 6 Mode:0 Ac=
tive:0 Dest:1)
[    0.534021] IOAPIC[0]: Set routing entry (0-7 -> 0xef -> IRQ 7 Mode:0 Ac=
tive:0 Dest:1)
[    0.535410] IOAPIC[0]: Set routing entry (0-8 -> 0xef -> IRQ 8 Mode:0 Ac=
tive:0 Dest:1)
[    0.536763] IOAPIC[0]: Set routing entry (0-9 -> 0xef -> IRQ 9 Mode:1 Ac=
tive:0 Dest:1)
[    0.538174] IOAPIC[0]: Set routing entry (0-10 -> 0xef -> IRQ 10 Mode:1 =
Active:0 Dest:1)
[    0.539570] IOAPIC[0]: Set routing entry (0-11 -> 0xef -> IRQ 11 Mode:1 =
Active:0 Dest:1)
[    0.540985] IOAPIC[0]: Set routing entry (0-12 -> 0xef -> IRQ 12 Mode:0 =
Active:0 Dest:1)
[    0.542507] IOAPIC[0]: Set routing entry (0-13 -> 0xef -> IRQ 13 Mode:0 =
Active:0 Dest:1)
[    0.543867] IOAPIC[0]: Set routing entry (0-14 -> 0xef -> IRQ 14 Mode:0 =
Active:0 Dest:1)
[    0.545233] IOAPIC[0]: Set routing entry (0-15 -> 0xef -> IRQ 15 Mode:0 =
Active:0 Dest:1)
[    0.546640]  apic 0 pin 16 not connected
[    0.547323]  apic 0 pin 17 not connected
[    0.548037]  apic 0 pin 18 not connected
[    0.548708]  apic 0 pin 19 not connected
[    0.549417]  apic 0 pin 20 not connected
[    0.550107]  apic 0 pin 21 not connected
[    0.550825]  apic 0 pin 22 not connected
[    0.551549]  apic 0 pin 23 not connected
[    0.552326] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.553348] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2284248580e, max_idle_ns: 440795288736 ns
[    0.554818] Calibrating delay loop (skipped) preset value.. 4791.66 Bogo=
MIPS (lpj=3D7981866)
[    0.556205] pid_max: default: 32768 minimum: 301
[    0.556999] Security Framework initialized
[    0.558157] Smack:  Initializing.
[    0.558724] Smack:  IPv6 port labeling enabled.
[    0.559527] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
[    0.560648] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 by=
tes)
[    0.561805] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.562618] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.563370] CPU: Intel Core Processor (Haswell) (family: 0x6, model: 0x3=
c, stepping: 0x4)
[    0.564822] Spectre V2 : Mitigation: Full generic retpoline
[    0.565715] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    0.567131] Speculative Store Bypass: Vulnerable
[    0.568593] Performance Events: unsupported p6 CPU model 60 no PMU drive=
r, software events only.
[    0.570220] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.571269] TSC deadline timer enabled
[    0.571483] devtmpfs: initialized
[    0.571483] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 6370867519511994 ns
[    0.571497] futex hash table entries: 256 (order: 2, 20480 bytes)
[    0.572344] prandom: seed boundary self test passed
[    0.573435] prandom: 100 self tests passed
[    0.574130] pinctrl core: initialized pinctrl subsystem
[    0.575001] regulator-dummy: no parameters
[    0.575788]
[    0.576062] *************************************************************
[    0.577221] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    **
[    0.578155] **                                                         **
[    0.579306] **  IOMMU DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL  **
[    0.580440] **                                                         **
[    0.581488] ** This means that this kernel is built to expose internal **
[    0.582630] ** IOMMU data structures, which may compromise security on **
[    0.583776] ** your system.                                            **
[    0.584821] **                                                         **
[    0.585993] ** If you see this message and you are not debugging the   **
[    0.587140] ** kernel, report this immediately to your vendor!         **
[    0.588155] **                                                         **
[    0.589335] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    **
[    0.590537] *************************************************************
[    0.591667] NET: Registered protocol family 16
[    0.593556] cpuidle: using governor ladder
[    0.595004] ACPI: bus type PCI registered
[    0.595604] dca service started, version 1.12.1
[    0.596375] PCI: Using configuration type 1 for base access
[    0.620910] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.621614] cryptd: max_cpu_qlen set to 1000
[    0.622435] gpio-f7188x: Not a Fintek device at 0x0000002e
[    0.623393] gpio-f7188x: Not a Fintek device at 0x0000004e
[    0.624267] ACPI: Added _OSI(Module Device)
[    0.624823] ACPI: Added _OSI(Processor Device)
[    0.625582] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.626385] ACPI: Added _OSI(Processor Aggregator Device)
[    0.627304] ACPI: Added _OSI(Linux-Dell-Video)
[    0.628083] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.629985] ACPI: 1 ACPI AML tables successfully acquired and loaded
[    0.633144] ACPI: Interpreter enabled
[    0.633768] ACPI: (supports S0 S3 S5)
[    0.634247] ACPI: Using IOAPIC for interrupt routing
[    0.634843] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.636586] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.643637] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.644696] acpi PNP0A03:00: _OSC: OS supports [Segments MSI]
[    0.644837] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
[    0.645837] acpi PNP0A03:00: fail to add MMCONFIG information, can't acc=
ess extended PCI configuration space under this bridge.
[    0.647864] PCI host bridge to bus 0000:00
[    0.648158] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.649315] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.650492] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.651490] pci_bus 0000:00: root bus resource [mem 0x20000000-0xfebffff=
f window]
[    0.652710] pci_bus 0000:00: root bus resource [mem 0x100000000-0x17ffff=
fff window]
[    0.653981] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.654870] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.656458] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.658058] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.659941] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
[    0.661690] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x=
01f7]
[    0.662930] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.664072] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x=
0177]
[    0.664823] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.666212] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.667440] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX=
4 ACPI
[    0.668167] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX=
4 SMB
[    0.669789] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    0.671496] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
[    0.674337] pci 0000:00:02.0: reg 0x18: [mem 0xfebb0000-0xfebb0fff]
[    0.678680] pci 0000:00:02.0: reg 0x30: [mem 0xfeba0000-0xfebaffff pref]
[    0.680565] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
[    0.682123] pci 0000:00:03.0: reg 0x10: [mem 0xfeb80000-0xfeb9ffff]
[    0.683512] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
[    0.686772] pci 0000:00:03.0: reg 0x30: [mem 0xfeb00000-0xfeb7ffff pref]
[    0.687977] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
[    0.688903] pci 0000:00:04.0: reg 0x10: [mem 0xfebb1000-0xfebb100f]
[    0.692128] pci_bus 0000:00: on NUMA node 0
[    0.693576] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
[    0.694562] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
[    0.694994] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
[    0.696119] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
[    0.697190] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
[    0.698736] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.699799] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.701065] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.701489] vgaarb: loaded
[    0.702202] videodev: Linux video capture interface: v2.00
[    0.703482] FPGA manager framework
[    0.704120] PCI: Using ACPI for IRQ routing
[    0.704823] PCI: pci_cache_line_size set to 64 bytes
[    0.705786] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    0.706798] e820: reserve RAM buffer [mem 0x1ffe0000-0x1fffffff]
[    0.708039] Bluetooth: Core ver 2.22
[    0.708171] NET: Registered protocol family 31
[    0.708939] Bluetooth: HCI device and connection manager initialized
[    0.710019] Bluetooth: HCI socket layer initialized
[    0.710844] Bluetooth: L2CAP socket layer initialized
[    0.711513] Bluetooth: SCO socket layer initialized
[    0.712380] NET: Registered protocol family 8
[    0.713119] NET: Registered protocol family 20
[    0.713883] NetLabel: Initializing
[    0.714469] NetLabel:  domain hash size =3D 128
[    0.714822] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.715807] NetLabel:  unlabeled traffic allowed by default
[    0.717850] clocksource: Switched to clocksource kvm-clock
[    0.744920] Warning: could not register annotated branches stats
[    0.746096] FS-Cache: Loaded
[    0.746679] pnp: PnP ACPI init
[    0.747300] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
[    0.748513] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
[    0.749523] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
[    0.750612] pnp 00:03: [dma 2]
[    0.751165] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
[    0.752232] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
[    0.753366] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
[    0.754907] pnp: PnP ACPI: found 6 devices
[    0.760682] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.761949] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.762935] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.764007] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.765187] pci_bus 0000:00: resource 7 [mem 0x20000000-0xfebfffff windo=
w]
[    0.766337] pci_bus 0000:00: resource 8 [mem 0x100000000-0x17fffffff win=
dow]
[    0.767473] NET: Registered protocol family 2
[    0.768358] tcp_listen_portaddr_hash hash table entries: 256 (order: 2, =
18432 bytes)
[    0.769786] TCP established hash table entries: 4096 (order: 3, 32768 by=
tes)
[    0.770994] TCP bind hash table entries: 4096 (order: 6, 262144 bytes)
[    0.772219] TCP: Hash tables configured (established 4096 bind 4096)
[    0.773367] UDP hash table entries: 256 (order: 3, 40960 bytes)
[    0.774397] UDP-Lite hash table entries: 256 (order: 3, 40960 bytes)
[    0.775542] NET: Registered protocol family 1
[    0.776495] RPC: Registered named UNIX socket transport module.
[    0.777507] RPC: Registered udp transport module.
[    0.778315] RPC: Registered tcp transport module.
[    0.778925] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.779801] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.780790] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.781811] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    0.782899] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.784346] PCI: CLS 0 bytes, default 64
[    0.785064] Unpacking initramfs...
[    0.858819] debug: unmapping init [mem 0xffff92821fc09000-0xffff92821ffd=
ffff]
[    0.860853] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x228=
4248580e, max_idle_ns: 440795288736 ns
[    0.862914] cryptomgr_test (24) used greatest stack depth: 15216 bytes l=
eft
[    0.866629] spin_lock-torture:--- Start of test [debug]: nwriters_stress=
=3D2 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=3D=
3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
[    0.869511] spin_lock-torture: Creating torture_shuffle task
[    0.870503] spin_lock-torture: Creating torture_stutter task
[    0.871523] spin_lock-torture: torture_shuffle task started
[    0.872476] spin_lock-torture: Creating lock_torture_writer task

[    0.873517] spin_lock-torture: torture_stutter task started
[    0.874370] spin_lock-torture: Creating lock_torture_writer task
[    0.875249] spin_lock-torture: lock_torture_writer task started
[    0.876287] spin_lock-torture: Creating lock_torture_stats task
[    0.877334] spin_lock-torture: lock_torture_writer task started
[    0.878452] torture_init_begin: Refusing rcu init: spin_lock running.
[    0.879578] torture_init_begin: One torture test at a time!
[    0.881145] spin_lock-torture: lock_torture_stats task started
[    0.882324] workingset: timestamp_bits=3D62 max_order=3D17 bucket_order=
=3D0
[    0.887566] zbud: loaded
[    0.901610] DLM installed
[    0.902882] NFS: Registering the id_resolver key type
[    0.903616] Key type id_resolver registered
[    0.904325] Key type id_legacy registered
[    0.905111] FS-Cache: Netfs 'cifs' registered for caching
[    0.906232] Key type cifs.spnego registered
[    0.907151] orangefs_debugfs_init: called with debug mask: :none: :0:
[    0.908346] orangefs_init: module version upstream loaded
[    0.909545] ceph: loaded (mds proto 32)
[    0.910213] pstore: using lz4hc compression
[    0.915538] NET: Registered protocol family 38
[    0.916278] Key type asymmetric registered
[    0.916836] Asymmetric key parser 'x509' registered
[    1.064303] String selftests succeeded
[    1.065004] glob: 64 self-tests passed, 0 failed
[    1.065887] gpio_it87: no device
[    1.066638] gpio_winbond: chip ID at 2e is ffff
[    1.067419] gpio_winbond: not an our chip
[    1.068123] gpio_winbond: chip ID at 4e is ffff
[    1.068911] gpio_winbond: not an our chip
[    1.069850] switchtec: loaded.
[    1.070637] nvidiafb_setup START
[    1.071290] vmlfb: initializing
[    1.071777] Could not find Carillo Ranch MCH device.
[    1.073517] v86d (170) used greatest stack depth: 14344 bytes left
[    1.081508] uvesafb: Getting VBE info block failed (eax=3D0x4f00, err=3D=
-3)
[    1.082628] uvesafb: vbe_init() failed with -22
[    1.083396] uvesafb: probe of uvesafb.0 failed with error -22
[    1.084237] ipmi message handler version 39.2
[    1.084841] IPMI System Interface driver.
[    1.085557] ipmi_si: Unable to find any System Interface(s)
[    1.086958] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input0
[    1.093111] ACPI: Power Button [PWRF]
[    1.093871] EINJ: EINJ table not found.
[    1.094523] ERST DBG: ERST support is disabled.
[    1.095442] ioatdma: Intel(R) QuickData Technology Driver 4.00
[    1.117819] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.141623] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    1.143451] ppdev: user-space parallel port driver
[    1.144269] Linux agpgart interface v0.103
[    1.145040] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 secon=
ds, margin is 60 seconds).
[    1.146556] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    1.147597] AMD IOMMUv2 functionality not available on this system
[    1.148677] drm_mm: Testing DRM range manger (struct drm_mm), with rando=
m_seed=3D0x12130812 max_iterations=3D8192 max_prime=3D128
[    1.150591] drm_mm: igt_sanitycheck - ok!
[    1.151312] igt_debug 0x0000000000000000-0x0000000000000200: 512: free
[    1.152448] igt_debug 0x0000000000000200-0x0000000000000600: 1024: used
[    1.153479] igt_debug 0x0000000000000600-0x0000000000000a00: 1024: free
[    1.154330] igt_debug 0x0000000000000a00-0x0000000000000e00: 1024: used
[    1.155196] igt_debug 0x0000000000000e00-0x0000000000001000: 512: free
[    1.156293] igt_debug total: 4096, used 2048 free 2048
[   47.025502] chash: self test took 551623 us, 1856340 iterations/s
[   47.051529] CRAT table not found
[   47.052060] Virtual CRAT table created for CPU
[   47.052655] Parsing CRAT table with 1 nodes
[   47.053230] Creating topology SYSFS entries
[   47.053811] Topology: Add CPU node
[   47.054269] Finished initializing topology
[   47.054919] kfd kfd: Initialized module
[   47.055474] [drm] radeon kernel modesetting enabled.
[   47.056283] [drm] amdgpu kernel modesetting enabled.
[   47.057335] [drm] Initialized vgem 1.0.0 20120112 for virtual device on =
minor 0
[   47.058395] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   47.059311] [drm] Driver supports precise vblank timestamp query.
[   47.060332] [drm] Initialized vkms 1.0.0 20180514 for virtual device on =
minor 1
[   47.062154] parport_pc 00:04: reported by Plug and Play ACPI
[   47.063020] parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]
[   47.064050] parport_pc parport_pc.956: Unable to set coherent dma mask: =
disabling DMA
[   47.065355] parport_pc parport_pc.888: Unable to set coherent dma mask: =
disabling DMA
[   47.066528] parport_pc parport_pc.632: Unable to set coherent dma mask: =
disabling DMA
[   47.067900] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
[   47.068793] dummy-irq: no IRQ given.  Use irq=3DN
[   47.069420] Phantom Linux Driver, version n0.9.8, init OK
[   47.070190] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo Gi=
ometti
[   47.071282] Guest personality initialized and is inactive
[   47.072097] VMCI host device registered (name=3Dvmci, major=3D10, minor=
=3D56)
[   47.072982] Initialized host personality
[   47.074208] parport0: powerup/reset Butterfly
[   47.191557] parport_pc 00:04: registered master spi42
[   47.194868] spi spi42.1: spi_bitbang_setup, 66 nsec/bit
[   47.195589] spi spi42.1: setup mode 0, 8 bits/w, 15000000 Hz max --> 0
[   47.196509] parport_pc 00:04: registered child spi42.1
[   47.197198] parport0: dataflash at spi42.1
[   47.197748] parport0: AVR Butterfly
[   47.198265] parport0: cannot grant exclusive access for device spi-lm70l=
lp
[   47.199193] spi_lm70llp: spi_lm70llp probe fail, status -12
[   47.200000] vcan: Virtual CAN interface driver
[   47.200598] vxcan: Virtual CAN Tunnel driver
[   47.201187] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-=
NAPI
[   47.202130] e1000: Copyright (c) 1999-2006 Intel Corporation.
[   47.291150] PCI Interrupt Link [LNKC] enabled at IRQ 11
[   47.647485] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:34:56
[   47.648432] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Connection
[   47.649394] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[   47.650172] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[   47.650984] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.=
0-k
[   47.651914] igb: Copyright (c) 2007-2014 Intel Corporation.
[   47.652672] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver - vers=
ion 5.1.0-k
[   47.653684] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
[   47.654765] parport0: cannot grant exclusive access for device ks0108
[   47.655644] ks0108: ERROR: parport didn't register new device
[   47.656407] cfag12864b: ERROR: ks0108 is not initialized
[   47.657111] cfag12864bfb: ERROR: cfag12864b is not initialized
[   47.657987] panel: could not claim access to parport0. Aborting.
[   47.658843] panel: panel driver not yet registered
[   47.659637] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x6=
0,0x64 irq 1,12
[   47.661470] serio: i8042 KBD port at 0x60,0x64 irq 1
[   47.662150] serio: i8042 AUX port at 0x60,0x64 irq 12
[   47.662859] parport0: cannot grant exclusive access for device parkbd
[   47.725157] mousedev: PS/2 mouse device common for all mice
[   47.726358] mk712: device not present
[   47.727060] apanel: Fujitsu BIOS signature 'FJKEYINF' not found...
[   47.728074] ideapad_slidebar: DMI does not match
[   47.729152] i2c /dev entries driver
[   47.729773] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, re=
vision 0
[   47.731162] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input1
[   47.784965] i2c-parport: adapter type unspecified
[   47.785607] i2c-parport-light: adapter type unspecified
[   47.786776] Error: Driver 'tw9910' is already registered, aborting...
[   47.787879] Error: Driver 'ov772x' is already registered, aborting...
[   47.788768] Error: Driver 'mt9t112' is already registered, aborting...
[   47.789987] IR RC5(x/sz) protocol handler initialized
[   47.790665] IR RC6 protocol handler initialized
[   47.791265] IR SANYO protocol handler initialized
[   47.791898] b2c2-flexcop: B2C2 FlexcopII/II(b)/III digital TV receiver c=
hip loaded successfully
[   47.793081] saa7146: register extension 'budget dvb'
[   47.793762] saa7146: register extension 'budget_av'
[   47.794427] saa7146: register extension 'budget_ci dvb'
[   47.795148] saa7146: register extension 'budget_patch dvb'
[   47.795890] saa7146: register extension 'av7110'
[   47.796548] ngene: nGene PCIE bridge driver, Copyright (C) 2005-2007 Mic=
ronas
[   47.797506] saa7146: register extension 'Multimedia eXtension Board'
[   47.798372] saa7146: register extension 'hexium gemini'
[   47.799086] ivtv: Start initialization, version 1.4.3
[   47.799831] ivtv: End initialization
[   47.800315] ivtvfb: no cards found
[   47.800773] cx25821: driver loaded
[   47.801266] cx88_blackbird: cx2388x blackbird driver version 1.0.0 loaded
[   47.802177] cx8802: registering cx8802 driver, type: blackbird access: s=
hared
[   47.803129] cx88_dvb: cx2388x dvb driver version 1.0.0 loaded
[   47.803974] cx8802: registering cx8802 driver, type: dvb access: shared
[   47.804853] saa7134: saa7130/34: v4l2 driver version 0, 2, 17 loaded
[   47.805705] saa7164 driver loaded
[   47.806220] Driver for 1-wire Dallas network protocol.
[   47.806950] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
[   47.807788] w1_f0d_init()
[   48.028181] applesmc: supported laptop not found!
[   48.028814] applesmc: driver init failed (ret=3D-19)!
[   48.065157] f71882fg: Not a Fintek device
[   48.065709] f71882fg: Not a Fintek device
[   48.349290] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/=
i8042/serio1/input/input3
[   48.551626] sch56xx_common: Unsupported device id: 0xff
[   48.552421] sch56xx_common: Unsupported device id: 0xff
[   48.638430] intel_powerclamp: CPU does not support MWAIT
[   48.639435] acquirewdt: WDT driver for Acquire single board computer ini=
tialising
[   48.640555] acquirewdt: I/O address 0x0043 already in use
[   48.641290] acquirewdt: probe of acquirewdt failed with error -5
[   48.642142] alim7101_wdt: Steve Hill <steve@navaho.co.uk>
[   48.642861] alim7101_wdt: ALi M7101 PMU not present - WDT not set
[   48.643721] wafer5823wdt: WDT driver for Wafer 5823 single board compute=
r initialising
[   48.651499] wafer5823wdt: initialized. timeout=3D60 sec (nowayout=3D1)
[   48.652500] watchdog: i6300ESB timer: cannot register miscdev on minor=
=3D130 (err=3D-16).
[   48.653544] watchdog: i6300ESB timer: a legacy watchdog module is probab=
ly present.
[   48.654619] i6300ESB timer 0000:00:04.0: initialized (0x00000000f4e1beae=
). heartbeat=3D30 sec (nowayout=3D1)
[   48.655960] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
[   48.656718] iTCO_vendor_support: vendor-support=3D0
[   48.657398] sc1200wdt: build 20020303
[   48.658023] sc1200wdt: io parameter must be specified
[   48.658708] pc87413_wdt: Version 1.1 at io 0x2E
[   48.659320] pc87413_wdt: cannot register miscdev on minor=3D130 (err=3D-=
16)
[   48.660195] sbc60xxwdt: I/O address 0x0443 already in use
[   48.660961] smsc37b787_wdt: SMsC 37B787 watchdog component driver 1.1 in=
itialising...
[   48.663074] smsc37b787_wdt: Unable to register miscdev on minor 130
[   48.663927] w83877f_wdt: I/O address 0x0443 already in use
[   48.664655] w83977f_wdt: driver v1.00
[   48.665155] w83977f_wdt: cannot register miscdev on minor=3D130 (err=3D-=
16)
[   48.666023] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D-1=
6)
[   48.666956] watchdog: Software Watchdog: cannot register miscdev on mino=
r=3D130 (err=3D-16).
[   48.668033] watchdog: Software Watchdog: a legacy watchdog module is pro=
bably present.
[   48.669141] softdog: initialized. soft_noboot=3D0 soft_margin=3D60 sec s=
oft_panic=3D0 (nowayout=3D1)
[   48.670345] No PC Engines board detected
[   48.671053] leds_ss4200: no LED devices found
[   48.671735] ledtrig-cpu: registered to indicate activity on CPUs
[   48.673287] hidraw: raw HID events driver (C) Jiri Kosina
[   48.676607]  fake-fmc-carrier: mezzanine 0
[   48.677164]       Manufacturer: fake-vendor
[   48.677723]       Product name: fake-design-for-testing
[   48.678468] fmc fake-design-for-testing-f001: Driver has no ID: matches =
all
[   48.679412] fmc_trivial: probe of fake-design-for-testing-f001 failed wi=
th error -95
[   48.680697] gnss: GNSS driver registered with major 511
[   48.681416] pktgen: Packet Generator for packet performance testing. Ver=
sion: 2.75
[   48.682498] drop_monitor: Initializing network drop monitor service
[   48.683390] NET: Registered protocol family 26
[   48.684084] IPsec XFRM device driver
[   48.684939] NET: Registered protocol family 10
[   48.685999] Segment Routing with IPv6
[   48.686522] mip6: Mobile IPv6
[   48.687282] NET: Registered protocol family 15
[   48.687889] NET: Registered protocol family 5
[   48.688499] NET: Registered protocol family 9
[   48.689094] X25: Linux Version 0.2
[   48.689554] can: controller area network core (rev 20170425 abi 9)
[   48.690438] NET: Registered protocol family 29
[   48.691038] can: raw protocol (rev 20170425)
[   48.691632] can: broadcast manager protocol (rev 20170425 t)
[   48.692383] can: netlink gateway (rev 20170425) max_hops=3D1
[   48.693233] Bluetooth: RFCOMM socket layer initialized
[   48.693932] Bluetooth: RFCOMM ver 1.11
[   48.694442] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[   48.695242] Bluetooth: HIDP socket layer initialized
[   48.696235] NET: Registered protocol family 33
[   48.696842] Key type rxrpc registered
[   48.697337] Key type rxrpc_s registered
[   48.697902] l2tp_core: L2TP core driver, V2.0
[   48.698501] l2tp_netlink: L2TP netlink interface
[   48.699125] l2tp_eth: L2TP ethernet pseudowire support (L2TPv3)
[   48.699922] l2tp_debugfs: L2TP debugfs support
[   48.700528] NET: Registered protocol family 35
[   48.701236] 8021q: 802.1Q VLAN Support v1.8
[   48.702206] DCCP: Activated CCID 2 (TCP-like)
[   48.703322] sctp: Hash tables configured (bind 64/64)
[   48.704119] tipc: Activated (version 2.0.0)
[   48.704753] NET: Registered protocol family 30
[   48.705437] tipc: Started in single node mode
[   48.706141] NET: Registered protocol family 43
[   48.706752] 9pnet: Installing 9P2000 support
[   48.707359] NET: Registered protocol family 37
[   48.708057] NET: Registered protocol family 36
[   48.708689] Key type dns_resolver registered
[   48.709268] Key type ceph registered
[   48.709931] libceph: loaded (mon/osd proto 15/24)
[   48.710912] batman_adv: B.A.T.M.A.N. advanced 2018.2 (compatibility vers=
ion 15) loaded
[   48.711963] openvswitch: Open vSwitch switching datapath
[   48.712812] mpls_gso: MPLS GSO support
[   48.713353] start plist test
[   48.716310] end plist test
[   48.717667] ... APIC ID:      00000000 (0)
[   48.718150] ... APIC VERSION: 01050014
[   48.718150] 000000000000000000000000000000000000000000000000000000000000=
0000
[   48.718150] 000000000000000000000000000000000000000000000000000000000000=
0000
[   48.718150] 000000000000000000000000000000000000000000000000000000000000=
1000
[   48.721628] number of MP IRQ sources: 15.
[   48.722164] number of IO-APIC #0 registers: 24.
[   48.722760] testing the IO APIC.......................
[   48.723458] IO APIC #0......
[   48.723847] .... register #00: 00000000
[   48.724357] .......    : physical APIC id: 00
[   48.724943] .......    : Delivery Type: 0
[   48.725477] .......    : LTS          : 0
[   48.726012] .... register #01: 00170011
[   48.726525] .......     : max redirection entries: 17
[   48.727199] .......     : PRQ implemented: 0
[   48.727769] .......     : IO APIC version: 11
[   48.728354] .... register #02: 00000000
[   48.728868] .......     : arbitration: 00
[   48.729401] .... IRQ redirection table:
[   48.729914] IOAPIC 0:
[   48.730234]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.731276]  pin01, enabled , edge , high, V(23), IRR(0), S(0), logical =
, D(01), M(0)
[   48.732317]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logical =
, D(01), M(0)
[   48.733350]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.734385]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.735431]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.736470]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.737505]  pin07, enabled , edge , high, V(21), IRR(0), S(0), logical =
, D(01), M(0)
[   48.738544]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.739586]  pin09, enabled , level, high, V(20), IRR(0), S(0), logical =
, D(01), M(0)
[   48.740619]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.741662]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.742699]  pin0c, enabled , edge , high, V(22), IRR(0), S(0), logical =
, D(01), M(0)
[   48.743740]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.744777]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.745812]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.746849]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.747889]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.748931]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.749967]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.751001]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.752050]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.753090]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.754125]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physical=
, D(00), M(0)
[   48.755154] IRQ to pin mappings:
[   48.755590] IRQ0 -> 0:2
[   48.755926] IRQ1 -> 0:1
[   48.756259] IRQ3 -> 0:3
[   48.756594] IRQ4 -> 0:4
[   48.756927] IRQ5 -> 0:5
[   48.757262] IRQ6 -> 0:6
[   48.757594] IRQ7 -> 0:7
[   48.757930] IRQ8 -> 0:8
[   48.758272] IRQ9 -> 0:9
[   48.758609] IRQ10 -> 0:10
[   48.758962] IRQ11 -> 0:11
[   48.759325] IRQ12 -> 0:12
[   48.759680] IRQ13 -> 0:13
[   48.760037] IRQ14 -> 0:14
[   48.760393] IRQ15 -> 0:15
[   48.760749] .................................... done.
[   48.761441] AVX version of gcm_enc/dec engaged.
[   48.762043] AES CTR mode by8 optimization enabled
[   48.763617] sched_clock: Marking stable (48406435459, 355603094)->(48780=
017762, -17979209)
[   48.764997] registered taskstats version 1
[   48.765611] page_owner is disabled
[   48.766248] Key type trusted registered
[   48.766877] Key type encrypted registered
[   48.767452] ima: No TPM chip found, activating TPM-bypass!
[   48.768198] ima: Allocated hash algorithm: sha1
[   48.769157] hctosys: unable to open rtc device (rtc0)
[   48.770393] debug: unmapping init [mem 0xffffffff8e500000-0xffffffff8e62=
1fff]
[   48.771468] Write protecting the kernel read-only data: 32768k
[   48.773016] debug: unmapping init [mem 0xffffffff8d004000-0xffffffff8d1f=
ffff]
[   48.774049] debug: unmapping init [mem 0xffffffff8da95000-0xffffffff8dbf=
ffff]
[   48.785140] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   48.785997] rodata_test: all tests were successful
[   48.786636] Run /init as init process
INIT: version 2.88 booting
[   48.802255] mount (208) used greatest stack depth: 14328 bytes left
/etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
[   48.807388] S00fbsetup (210) used greatest stack depth: 14248 bytes left

Please wait: booting...
Starting udev
[   48.815578] awk (220) used greatest stack depth: 14136 bytes left
[   48.831633] pidof (224) used greatest stack depth: 13896 bytes left
/etc/rcS.d/S03udev: line 72: can't create /proc/sys/kernel/hotplug: nonexis=
tent directory
[   48.940861] pci-db (317) used greatest stack depth: 13816 bytes left
[   49.024098] cat (392) used greatest stack depth: 13784 bytes left
[   49.105290] udevadm (228) used greatest stack depth: 13656 bytes left
Starting Bootlog daemon: bootlogd.
Configuring network interfaces... done.
hwclock: can't open '/dev/misc/rtc': No such file or directory
Running postinst /etc/rpm-postinsts/100...
INIT: Entering runlevel: 5
wfg: skip syslogd
Kernel tests: Boot OK!
Kernel tests: Boot OK!
sed: /lib/modules/4.19.0-rc2-00001-gb669845/modules.dep: No such file or di=
rectory
xargs: modprobe: No such file or directory
run-parts: /etc/kernel-tests/01-modprobe exited with code 127
/etc/kernel-tests/90-trinity: line 18: /usr/sbin/chroot: not found[   49.44=
0782] random: fast init done

/etc/kernel-tests/90-trinity: line 17: /usr/sbin/chroot: not found
Trinity 1.8  Dave Jones <davej@codemonkey.org.uk>
Trinity 1.8  Dave Jones <davej@codemonkey.org.uk>
shm:0x7f69f2a13000-0x7f69ff60fd00 (4 pages)
shm:0x7f8fbd485000-0x7f8fca081d00 (4 pages)
[main] Marking syscall get_robust_list (64bit:274 32bit:312) as to be disab=
led.
[main] Done parsing arguments.
[main] Done parsing arguments.
[   49.493475] random: trinity: uninitialized urandom read (4 bytes read)
[main] Initial random seed: 2512879031
[   49.494884] random: trinity: uninitialized urandom read (4 bytes read)
[main] Initial random seed: 3455774936
Marking all syscalls as enabled.
Marking all syscalls as enabled.
[main] 32-bit syscalls: 384 enabled.  64-bit syscalls: 333 enabled.
[main] Disabling syscalls marked as disabled by command line options
[main] Marked 64-bit syscall get_robust_list (274) as deactivated.
[main] Marked 32-bit syscall get_robust_list (312) as deactivated.
DANGER: RUNNING AS ROOT.
[main] 32-bit syscalls: 383 enabled, 1 disabled.  64-bit syscalls: 332 enab=
led, 1 disabled.
DANGER: RUNNING AS ROOT.
Unless you are running in a virtual machine, this could cause serious probl=
ems such as overwriting CMOS
or similar which could potentially make this machine unbootable without a f=
irmware reset.
You might want to check out running with --dropprivs (currently experimenta=
l).

ctrl-c now unless you really know what you are doing.
Unless you are running in a virtual machine, this could cause serious probl=
ems such as overwriting CMOS
or similar which could potentially make this machine unbootable without a f=
irmware reset.
You might want to check out running with --dropprivs (currently experimenta=
l).

ctrl-c now unless you really know what you are doing.
[main] Using pid_max =3D 32768
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] Reserved/initialized 5 futexes.
[main] Generating file descriptors
[main] Using pid_max =3D 32768
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] futex: 0 owner:0
[main] Reserved/initialized 5 futexes.
[main] Generating file descriptors
[main] Added 318 filenames from /dev
[main] Added 318 filenames from /dev
[main] Added 19672 filenames from /proc
[main] Added 19678 filenames from /proc
[main] Added 25415 filenames from /sys
[main] Added 25415 filenames from /sys
01 01 00 00 00 70 00 00 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 b0 26 4a 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 48 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 0b 00 00 00 00 00 00 00 1b be e4 0d 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00
01 01 00 00 00 50 00 00 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 48 00 00 00 =
00 00 00 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 20 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 ff 00 00 00 00
00 01 00 00 00 00 00 02 00 00 00 60 00 00 00 00 00 00 00 08 00 00 00 44 00 =
5c 00 32 00 00 00 00 00 00 00 00 00 00 00 50 00 50 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0d 94 00 94 00 00 =
00 00 00 00 00 00 00 00 00 00 01 a1 00 e2 00 dd 75 00 00 00 00 00 00 00 00 =
00 00 8c 00 00 00 00 00 00 00 00 00 00 00 00 00 00 bd 00 bd 00 bd 00 bd 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 02 00 00 00 00 00 =
00 00 50 00 00 00 00 00 00 00 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
f8
ff 02 ff ff 00 00 00 00 52 00 00 00 00 00 00 00 0f 00 00 00 00 00 00 00 dd =
e1 7c 01 00 00 00 00 f8 ff 00 00 02 00 00 00 00 30 6f f2 69 7f 00 00 02 00 =
00 00 00 00 00 00 4e 00 00 00 00 00 00 00 f8 ff ff ff ff ff ff ff 0e 0e 0e =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 48 00 00 00 00 00 00 =
00 78 00 00 00 00
00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 07 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 60 00 00 00 00 00 00 00 0a 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 01 00 00 00 00 00 00 80 00 00 00 00 00 00 20 00 d7 00 16 =
00 0a 00 00 00
00 00 00 01 00 00 00 00 00 00 00 3c f9 85 09 00 00 00 00 f8 ff 00 00 00 00 =
00 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 00 00 00 =
00 ef a7 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3a 08 00 00 00 00 00 00 =
00 00 00 00 00 00 00 49 00 60 ce 00 45 04 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 44 00 44 00 00 da 00 55 00 90 45 00 =
00 00 00
00 06 00 00 80 80 11 00 00 00 00 00 00 00 00 00 00 00 00 00 c3 b3 b1 00 d2 =
13 7d 5b fb ff ff ff ff ff ff ff 01 00 00 00 00 00 00 00 b5 00 00 00 00 00 =
00 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 01 00 00 00 00 00 00 00 0d 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00
01 00 00 00 50 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 05 00 00 00 00 00 00 00 b9 cf a1 0d 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 60 =
00 00 00 00 00 00 00 04 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00
02 00 00 00 00 00 00 00 00 00 00 00 0b 00 00 00 00 00 00 00 eb 67 58 04 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 40 00 00 00 =
00 00 00 00 2e 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 02 00 36 00 00 00 00 00 00 00 00 50 00 00 00 00 00 00 00 63 00 03 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0c 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00
00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 70 00 00 =
00 00 00 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 00 00 00 00 00 00 =
00 00 00 00
00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 50 00 00 00 00 00 00 00 07 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 ff 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 1a =
00 05 00 00 00 00 00 00 00 00 00 00 00 00 00 04 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 d0
18 02 3d 00 00 00 00 00 00 c8 00 30 00 00 40 00 00 00 00 00 00 c6 00 00 00 =
00 36 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 34 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 f6 00 ff ff 00 00 ff 00 00 ff 04 ff ff 00 ff 00 01 =
00 00 00 00 00 00 00 00 00 00 6b 00 20 00 1f 00 00 00 00 00 00 40 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00
00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 40 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00
00 01 00 00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00 00 00 00 00 04 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 60 00 00 00 00 00 00 00 02 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 06 00 00 00 00 00 00 00 00 00 00 00 00 00 db =
43 00 d8 00 00 09 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 05 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00
[main] Couldn't find socket cachefile. Regenerating.
[   60.477932] do_dccp_setsockopt: sockopt(CHANGE_L/R) is deprecated: fix y=
our app
[   60.478992] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
00 00 00 48 00 00 00 00 00 00 00 00 00 00 00 a8 c7 ff 0c 00 00 00 00 00 00 =
00 00 00 00 00 00 03 00 00 00 00 00 00 00 30 91 84 00 00 00 00 00 00 60 67 =
67 03 00 00 00 00 50 26 bd 8f 7f 00 00 02 00 00 00 00 00 00 00 00 b0 00 00 =
00 00 00 00 fb ff ff ff ff ff ff ff c8 45 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00
[main] 97 sockets created based on info from socket cachefile.
[main] Enabled 14/14 fd providers. initialized:14.
[main] Error opening tracing_on : No such file or directory
[main] created 97 sockets
[main] Enabled 14/14 fd providers. initialized:14.
[main] Error opening tracing_on : No such file or directory
[child1:601] shmctl (31) returned ENOSYS, marking as inactive.
[child1:601] move_pages (279) returned ENOSYS, marking as inactive.
[child1:601] semop (65) returned ENOSYS, marking as inactive.
[   60.512487] trinity-c1 (601) used greatest stack depth: 13544 bytes left
[child0:600] ioprio_get (252) returned ENOSYS, marking as inactive.
[child2:604] process_vm_readv (310) returned ENOSYS, marking as inactive.
[child2:604] semctl (66) returned ENOSYS, marking as inactive.
[child0:607] msgctl (71) returned ENOSYS, marking as inactive.
[child3:603] swapon (167) returned ENOSYS, marking as inactive.
[child3:603] mbind (237) returned ENOSYS, marking as inactive.
[child2:609] shmat (30) returned ENOSYS, marking as inactive.
[child1:606] semget (64) returned ENOSYS, marking as inactive.
[   60.539006] mmap: trinity-c2 (611) uses deprecated remap_file_pages() sy=
scall. See Documentation/vm/remap_file_pages.rst.
[child2:611] userfaultfd (323) returned ENOSYS, marking as inactive.
[child3:610] swapoff (168) returned ENOSYS, marking as inactive.
[child3:610] finit_module (313) returned ENOSYS, marking as inactive.
[child3:610] migrate_pages (256) returned ENOSYS, marking as inactive.
[child1:608] kexec_load (246) returned ENOSYS, marking as inactive.
[child2:611] delete_module (176) returned ENOSYS, marking as inactive.
[child2:611] kexec_load (246) returned ENOSYS, marking as inactive.
[child3:612] msgsnd (69) returned ENOSYS, marking as inactive.
[child3:612] quotactl (179) returned ENOSYS, marking as inactive.
[child3:612] msgctl (71) returned ENOSYS, marking as inactive.
[child3:612] shmdt (67) returned ENOSYS, marking as inactive.
[child1:614] Tried 8 32-bit syscalls unsuccessfully. Disabling all 32-bit s=
yscalls.
[child0:617] shmget (29) returned ENOSYS, marking as inactive.
[child3:610] fadvise64 (221) returned ENOSYS, marking as inactive.
[child0:617] process_vm_writev (311) returned ENOSYS, marking as inactive.
[child0:617] swapoff (168) returned ENOSYS, marking as inactive.
[child0:617] mq_open (240) returned ENOSYS, marking as inactive.
[child0:617] mq_timedreceive (243) returned ENOSYS, marking as inactive.
[child2:615] semget (64) returned ENOSYS, marking as inactive.
[   60.578078] raw_sendmsg: trinity-c2 forgot to set AF_INET. Fix it!
[child0:617] mq_unlink (241) returned ENOSYS, marking as inactive.
[child0:617] nfsservctl (180) returned ENOSYS, marking as inactive.
[child3:612] finit_module (313) returned ENOSYS, marking as inactive.
[child3:612] get_mempolicy (239) returned ENOSYS, marking as inactive.
[child3:612] acct (163) returned ENOSYS, marking as inactive.
[child1:620] madvise (28) returned ENOSYS, marking as inactive.
[child1:620] migrate_pages (256) returned ENOSYS, marking as inactive.
[child1:626] madvise (28) returned ENOSYS, marking as inactive.
[child2:618] shmat (30) returned ENOSYS, marking as inactive.
[child0:617] bpf (321) returned ENOSYS, marking as inactive.
[child0:617] semtimedop (220) returned ENOSYS, marking as inactive.
[child0:617] msgget (68) returned ENOSYS, marking as inactive.
[child1:620] mq_timedsend (242) returned ENOSYS, marking as inactive.
[child1:626] Tried 8 32-bit syscalls unsuccessfully. Disabling all 32-bit s=
yscalls.
[child2:627] bpf (321) returned ENOSYS, marking as inactive.
[child2:627] nfsservctl (180) returned ENOSYS, marking as inactive.
[child1:631] mq_unlink (241) returned ENOSYS, marking as inactive.
[child1:620] ioprio_set (251) returned ENOSYS, marking as inactive.
[child1:631] mq_timedsend (242) returned ENOSYS, marking as inactive.
[child1:631] init_module (175) returned ENOSYS, marking as inactive.
[child2:618] fadvise64 (221) returned ENOSYS, marking as inactive.
[child1:620] mq_getsetattr (245) returned ENOSYS, marking as inactive.
[child1:620] set_mempolicy (238) returned ENOSYS, marking as inactive.
[child1:631] getrandom (317) returned ENOSYS, marking as inactive.
[child1:631] semop (65) returned ENOSYS, marking as inactive.
[child1:631] uselib (134) returned ENOSYS, marking as inactive.
[child0:607] move_pages (279) returned ENOSYS, marking as inactive.
[   61.665231] Writes:  Total: 8698961  Max/Min: 0/0   Fail: 0
[   61.667506] warning: process `trinity-c0' used the deprecated sysctl sys=
tem call with
[child0:617] mq_notify (244) returned ENOSYS, marking as inactive.
[child3:628] ioprio_get (252) returned ENOSYS, marking as inactive.
[child3:628] quotactl (179) returned ENOSYS, marking as inactive.
[child0:617] sysctl (156) returned ENOSYS, marking as inactive.
[child2:627] mq_getsetattr (245) returned ENOSYS, marking as inactive.
[child2:627] process_vm_writev (311) returned ENOSYS, marking as inactive.
[child2:627] delete_module (176) returned ENOSYS, marking as inactive.
[child2:627] get_mempolicy (239) returned ENOSYS, marking as inactive.
[child2:618] getrandom (317) returned ENOSYS, marking as inactive.
[child2:618] uselib (134) returned ENOSYS, marking as inactive.
[child0:632] mq_open (240) returned ENOSYS, marking as inactive.
[child0:632] mbind (237) returned ENOSYS, marking as inactive.
[child3:628] mq_notify (244) returned ENOSYS, marking as inactive.
[child3:628] shmdt (67) returned ENOSYS, marking as inactive.
[child3:628] process_vm_readv (310) returned ENOSYS, marking as inactive.
[child1:631] ioprio_set (251) returned ENOSYS, marking as inactive.
[child1:631] set_mempolicy (238) returned ENOSYS, marking as inactive.
[child0:632] shmget (29) returned ENOSYS, marking as inactive.
[child0:632] swapon (167) returned ENOSYS, marking as inactive.
[child0:632] mq_timedreceive (243) returned ENOSYS, marking as inactive.
[child3:628] userfaultfd (323) returned ENOSYS, marking as inactive.
[child1:631] acct (163) returned ENOSYS, marking as inactive.
[child1:631] semtimedop (220) returned ENOSYS, marking as inactive.
[child3:612] init_module (175) returned ENOSYS, marking as inactive.
[   91.888627] trinity-c2 (618) used greatest stack depth: 13224 bytes left
[   91.901029] synth uevent: /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A03:00/de=
vice:01/PNP0501:00: unknown uevent action string
[   91.902465] acpi PNP0501:00: uevent: failed to send synthetic uevent
[child2:643] semctl (66) returned ENOSYS, marking as inactive.
[child2:643] sysctl (156) returned ENOSYS, marking as inactive.
[child2:643] msgget (68) returned ENOSYS, marking as inactive.
[child2:643] msgsnd (69) returned ENOSYS, marking as inactive.
[child1:655] shmctl (31) returned ENOSYS, marking as inactive.
lsmod: can't open '/proc/modules': No such file or directory
BusyBox v1.19.4 (2012-04-22 08:49:11 PDT) multi-call binary.

Usage: rmmod [-wfa] [MODULE]...

lsmod: can't open '/proc/modules': No such file or directory
BusyBox v1.19.4 (2012-04-22 08:49:11 PDT) multi-call binary.

Usage: rmmod [-wfa] [MODULE]...

lsmod: can't open '/proc/modules': No such file or directory
BusyBox v1.19.4 (2012-04-22 08:49:11 PDT) multi-call binary.

Usage: rmmod [-wfa] [MODULE]...

run-parts: /etc/kernel-tests/99-rmmod exited with code 123
INIT: Switching to runlevel: 6
INIT: Sending processes the TERM signal
wfg: skip syslogd
Deconfiguring network interfaces... done.
Sending all processes the TERM signal...
[  110.597471] caif:caif_disconnect_client(): nothing to disconnect
[  110.603286] caif:caif_disconnect_client(): nothing to disconnect
[  110.604623] caif:caif_disconnect_client(): nothing to disconnect
[  110.607075] caif:caif_disconnect_client(): nothing to disconnect
[  110.608379] caif:caif_disconnect_client(): nothing to disconnect
[  110.609681] caif:caif_disconnect_client(): nothing to disconnect
[  110.610967] caif:caif_disconnect_client(): nothing to disconnect
[  110.615463] caif:caif_disconnect_client(): nothing to disconnect
[  110.616869] caif:caif_disconnect_client(): nothing to disconnect
[  110.618165] caif:caif_disconnect_client(): nothing to disconnect
[  110.619476] caif:caif_disconnect_client(): nothing to disconnect
[  110.620904] caif:caif_disconnect_client(): nothing to disconnect
[  110.622221] caif:caif_disconnect_client(): nothing to disconnect
[  110.623501] caif:caif_disconnect_client(): nothing to disconnect
[  110.624779] caif:caif_disconnect_client(): nothing to disconnect
[  110.626143] caif:caif_disconnect_client(): nothing to disconnect
[  110.627425] caif:caif_disconnect_client(): nothing to disconnect
[  110.628688] caif:caif_disconnect_client(): nothing to disconnect
[  110.629973] caif:caif_disconnect_client(): nothing to disconnect
[  110.631068] caif:caif_disconnect_client(): nothing to disconnect
[  110.631910] caif:caif_disconnect_client(): nothing to disconnect
[  110.632716] caif:caif_disconnect_client(): nothing to disconnect
[  110.633848] caif:caif_disconnect_client(): nothing to disconnect
[  110.634648] caif:caif_disconnect_client(): nothing to disconnect
Sending all processes the KILL signal...
Unmounting remote filesystems...
Deactivating swap...
Unmounting local filesystems...
Rebooting... [  117.934902] Unregister pv shared memory for cpu 0
[  117.935834] spin_lock-torture: Unscheduled system shutdown detected
[  118.027723] reboot: Restarting system
[  118.028262] reboot: machine restart



On Tue, Sep 18, 2018 at 01:49:55PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Feng-Tang/x86-mm-Expand-static-p=
age-table-for-fixmap-space/20180917-174030
> =

> commit 048a5ca57972eefccec1c57b00c9f24bd75b8cec
> Author:     Feng Tang <feng.tang@intel.com>
> AuthorDate: Mon Sep 17 17:14:23 2018 +0800
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Mon Sep 17 17:40:31 2018 +0800
> =

>     x86/mm: Expand static page table for fixmap space
>     =

>     We met a kernel panic when enabling earlycon, which is due to
>     the fixmap address of earlycon is not statically setup.
>     =

>     Currently the static fixmap setup in head_64.S only covers 2M
>     virtual address space, while it acutually could be in 4M space
>     with different kernel configurations.
>     =

>     So increase the static space to 4M for now by defining FIXMAP_PMD_NUM
>     to 2, and add a build time check for future possible overflow so that
>     the macro could be increased accordingly.
>     =

>     Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>     Reviewed-by: Juergen Gross <jgross@suse.com> (Xen parts)
>     Signed-off-by: Feng Tang <feng.tang@intel.com>
> =

> bef459026b  lkdtm: Test copy_to_user() on bad kernel pointer under KERNEL=
_DS
> 048a5ca579  x86/mm: Expand static page table for fixmap space
> +------------------------------------------------------------------------=
--------------+------------+------------+
> |                                                                        =
              | bef459026b | 048a5ca579 |
> +------------------------------------------------------------------------=
--------------+------------+------------+
> | boot_successes                                                         =
              | 41         | 1          |
> | boot_failures                                                          =
              | 0          | 15         |
> | BUG:kernel_hang_in_early-boot_stage,last_printk:Probing_EDD(edd=3Doff_t=
o_disable)...ok | 0          | 8          |
> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page                    =
              | 0          | 1          |
> | RIP:note_page                                                          =
              | 0          | 1          |
> | BUG:unable_to_handle_kernel                                            =
              | 0          | 6          |
> | Oops:#[##]                                                             =
              | 0          | 6          |
> | RIP:ptdump_walk_pgd_level_core                                         =
              | 0          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception                               =
              | 0          | 6          |
> +------------------------------------------------------------------------=
--------------+------------+------------+
> =

> [   57.906959] BIOS EDD facility v0.16 2004-Jun-25, 6 devices found
> [   57.908440] debug: unmapping init [mem 0xffffffff976ff000-0xffffffff97=
821fff]
> [   57.911623] Write protecting the kernel read-only data: 30720k
> [   57.913109] debug: unmapping init [mem 0xffffffff96203000-0xffffffff96=
3fffff]
> [   57.914070] debug: unmapping init [mem 0xffffffff96ca1000-0xffffffff96=
dfffff]
> [   57.925504] BUG: unable to handle kernel paging request at ffffa22f56e=
1f000
> [   57.926358] PGD 95db067 P4D 95db067 PUD 95dc067 PMD 1f949067 PTE 800ff=
fffe91e0060
> [   57.927263] Oops: 0000 [#1] DEBUG_PAGEALLOC
> [   57.927772] CPU: 0 PID: 1 Comm: swapper Not tainted 4.19.0-rc2-00012-g=
048a5ca #1
> [   57.928657] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   57.929650] RIP: 0010:ptdump_walk_pgd_level_core+0x2f6/0x43a
> [   57.930330] Code: 0f 00 00 48 be 00 00 00 00 00 00 00 80 41 b8 05 00 0=
0 00 48 01 c8 48 8b 0d 03 5e c4 01 4c 89 e7 48 81 e2 00 f0 ff ff 48 f7 d2 <=
48> 23 14 08 48 8b 4c 24 08 48 8b 44 24 08 83 e1 06 48 09 d0 48 21
> [   57.932531] RSP: 0018:ffffa22f5e87fe80 EFLAGS: 00010206
> [   57.933152] RAX: 0000000016e1f000 RBX: 0000000016e1f067 RCX: ffffa22f4=
0000000
> [   57.934005] RDX: fff0000000000fff RSI: 8000000000000000 RDI: 000000000=
0000000
> [   57.934853] RBP: ffffffff96e1aff8 R08: 0000000000000005 R09: 000000000=
0000000
> [   57.935700] R10: ffffa22f5e888000 R11: 8000000000000100 R12: 000000000=
0000000
> [   57.936551] R13: 00000000000001ff R14: 0000000000000ff8 R15: 000000000=
0000fd8
> [   57.937399] FS:  0000000000000000(0000) GS:ffffffff96e41000(0000) knlG=
S:0000000000000000
> [   57.938388] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   57.939064] CR2: ffffa22f56e1f000 CR3: 000000000781a001 CR4: 000000000=
01606b0
> [   57.940027] Call Trace:
> [   57.940339]  ? rest_init+0xc8/0xc8
> [   57.940749]  kernel_init+0x22/0xe6
> [   57.941160]  ret_from_fork+0x35/0x40
> [   57.941598] CR2: ffffa22f56e1f000
> [   57.942002] ---[ end trace 06de9b5b70b65eb4 ]---
> [   57.942562] RIP: 0010:ptdump_walk_pgd_level_core+0x2f6/0x43a
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start b9c65f97a13bbb6f17daabd7a9453a12bf9dc231 7876320f88802b2=
2d4e2daf7eb027dd14175a0f8 --
> git bisect good e8d3f3a64047bbb45bab2fc36e505e3a37bbf0b3  # 08:25  G     =
14     0    0   0  Merge 'hwmon/hwmon-next' into devel-spot-201809180610
> git bisect  bad efb3be6643316f263b292eae419c7394df5c674b  # 08:41  B     =
 0     2   16   0  Merge 'renesas/arm-soc-for-v4.20' into devel-spot-201809=
180610
> git bisect  bad 4be96bf03336c87032f2c9d989ce8801b51fdd28  # 08:56  B     =
 0     3   17   0  Merge 'sailus-media/for-4.20-3' into devel-spot-20180918=
0610
> git bisect good 3aa555edd5cea24f80e9a4a4a73fee40501c9dda  # 09:18  G     =
14     0    0   0  Merge 'linux-review/Oder-Chiou/ASoC-rt5514-spi-Get-the-p=
eriod_bytes-in-the-copy-work-to-make-sure-the-value-correctly/20180917-1913=
21' into devel-spot-201809180610
> git bisect  bad 888c60b78e9326012a6d56a56671cac53a84c586  # 09:37  B     =
 0     4   19   1  Merge 'linux-review/Gao-Xiang/lib-lz4-update-LZ4-decompr=
essor-module/20180917-175302' into devel-spot-201809180610
> git bisect  bad 6e83b0274c57337c368fba0fff8381e13d248844  # 09:52  B     =
 0     8   22   0  Merge 'linux-review/Feng-Tang/x86-mm-Expand-static-page-=
table-for-fixmap-space/20180917-174030' into devel-spot-201809180610
> git bisect good 348a9bc56dfb44b23d3924bde23d0fd0f9e86e7f  # 10:10  G     =
14     0    0   0  Merge 'hverkuil-media/for-v4.20c' into devel-spot-201809=
180610
> git bisect  bad 048a5ca57972eefccec1c57b00c9f24bd75b8cec  # 10:21  B     =
 0     6   20   0  x86/mm: Expand static page table for fixmap space
> # first bad commit: [048a5ca57972eefccec1c57b00c9f24bd75b8cec] x86/mm: Ex=
pand static page table for fixmap space
> git bisect good bef459026b161fbc39d20dcba698ed0cfffbac38  # 10:39  G     =
42     0    1   1  lkdtm: Test copy_to_user() on bad kernel pointer under K=
ERNEL_DS
> # extra tests with debug options
> git bisect  bad 048a5ca57972eefccec1c57b00c9f24bd75b8cec  # 10:51  B     =
 0     5   19   0  x86/mm: Expand static page table for fixmap space
> # extra tests on HEAD of linux-devel/devel-spot-201809180610
> git bisect  bad b9c65f97a13bbb6f17daabd7a9453a12bf9dc231  # 10:51  B     =
 0    10   33   6  0day head guard for 'devel-spot-201809180610'
> # extra tests on tree/branch linux-review/Feng-Tang/x86-mm-Expand-static-=
page-table-for-fixmap-space/20180917-174030
> git bisect  bad 048a5ca57972eefccec1c57b00c9f24bd75b8cec  # 10:53  B     =
 1     7    0   8  x86/mm: Expand static page table for fixmap space
> # extra tests with first bad commit reverted
> git bisect good eb6a69571be4864589841d7e5c8f15c595ea4b78  # 11:11  G     =
17     0    0   0  Revert "x86/mm: Expand static page table for fixmap spac=
e"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



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
> 	-cpu Haswell,+smep,+smap
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
> 	rcuperf.shutdown=3D0
> )
> =

> "${kvm[@]}" -append "${append[*]}"

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.19.0-rc2 Kernel Configuration
> #
> =

> #
> # Compiler: gcc-6 (Debian 6.4.0-9) 6.4.0 20171026
> #
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D60400
> CONFIG_CLANG_VERSION=3D0
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=3Dy
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> CONFIG_KERNEL_LZMA=3Dy
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_SIM=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> # CONFIG_HIGH_RES_TIMERS is not set
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> # CONFIG_TICK_CPU_ACCOUNTING is not set
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_TASKSTATS=3Dy
> # CONFIG_TASK_DELAY_ACCT is not set
> # CONFIG_TASK_XACCT is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TINY_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_MEMCG is not set
> CONFIG_CGROUP_SCHED=3Dy
> # CONFIG_FAIR_GROUP_SCHED is not set
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_CGROUP_PIDS is not set
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_SOCK_CGROUP_DATA=3Dy
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> CONFIG_USER_NS=3Dy
> # CONFIG_PID_NS is not set
> # CONFIG_NET_NS is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_SCHED_AUTOGROUP is not set
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
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
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
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_SYSCALL is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_RSEQ=3Dy
> CONFIG_DEBUG_RSEQ=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PERF_USE_VMALLOC=3Dy
> # CONFIG_PC104 is not set
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_SLUB_DEBUG is not set
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> # CONFIG_SLAB_FREELIST_RANDOM is not set
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
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
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
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
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> # CONFIG_ZONE_DMA is not set
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_INTEL_RDT is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
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
> # CONFIG_PROCESSOR_SELECT is not set
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_GART_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D1
> CONFIG_NR_CPUS_RANGE_END=3D1
> CONFIG_NR_CPUS_DEFAULT=3D1
> CONFIG_NR_CPUS=3D1
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> # CONFIG_PERF_EVENTS_INTEL_RAPL is not set
> # CONFIG_PERF_EVENTS_INTEL_CSTATE is not set
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> # CONFIG_I8K is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> # CONFIG_X86_CPUID is not set
> # CONFIG_X86_5LEVEL is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> # CONFIG_X86_PAT is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_UMIP is not set
> # CONFIG_X86_INTEL_MPX is not set
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> # CONFIG_KEXEC is not set
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> CONFIG_KEXEC_VERIFY_SIG=3Dy
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0x0
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_SUSPEND_SKIP_SYNC=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> CONFIG_PM_ADVANCED_DEBUG=3Dy
> CONFIG_PM_TEST_SUSPEND=3Dy
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_DPM_WATCHDOG is not set
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_PM_GENERIC_DOMAINS=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_PM_GENERIC_DOMAINS_SLEEP=3Dy
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> # CONFIG_ACPI_DEBUGGER_USER is not set
> # CONFIG_ACPI_SPCR_TABLE is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_REV_OVERRIDE_POSSIBLE is not set
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> # CONFIG_ACPI_PROCESSOR is not set
> CONFIG_ACPI_IPMI=3Dy
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> # CONFIG_ACPI_APEI_GHES is not set
> CONFIG_ACPI_APEI_EINJ=3Dy
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> CONFIG_DPTF_POWER=3Dy
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_PMIC_OPREGION=3Dy
> # CONFIG_CRC_PMIC_OPREGION is not set
> CONFIG_CHT_DC_TI_PMIC_OPREGION=3Dy
> CONFIG_ACPI_CONFIGFS=3Dy
> CONFIG_TPS68470_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_SFI is not set
> =

> #
> # CPU Frequency scaling
> #
> # CONFIG_CPU_FREQ is not set
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_PCIEPORTBUS=3Dy
> # CONFIG_PCIEAER is not set
> # CONFIG_PCIEASPM is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> # CONFIG_PCI_IOV is not set
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> =

> #
> # PCI controller drivers
> #
> =

> #
> # Cadence PCIe controllers support
> #
> CONFIG_VMD=3Dy
> =

> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=3Dy
> CONFIG_PCIE_DW_HOST=3Dy
> CONFIG_PCIE_DW_PLAT=3Dy
> CONFIG_PCIE_DW_PLAT_HOST=3Dy
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> CONFIG_ISA_BUS=3Dy
> # CONFIG_ISA_DMA_API is not set
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> # CONFIG_YENTA_O2 is not set
> # CONFIG_YENTA_RICOH is not set
> CONFIG_YENTA_TI=3Dy
> CONFIG_YENTA_TOSHIBA=3Dy
> CONFIG_PD6729=3Dy
> # CONFIG_I82092 is not set
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_TSI721=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> CONFIG_RAPIDIO_CHMAN=3Dy
> # CONFIG_RAPIDIO_MPORT_CDEV is not set
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dy
> CONFIG_RAPIDIO_CPS_XX=3Dy
> CONFIG_RAPIDIO_TSI568=3Dy
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> CONFIG_RAPIDIO_RXS_GEN3=3Dy
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Binary Emulations
> #
> # CONFIG_IA32_EMULATION is not set
> # CONFIG_X86_X32 is not set
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_HAVE_GENERIC_GUP=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> # CONFIG_EDD_OFF is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DCDBAS is not set
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_FW_CFG_SYSFS=3Dy
> CONFIG_FW_CFG_SYSFS_CMDLINE=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> CONFIG_GOOGLE_COREBOOT_TABLE=3Dy
> CONFIG_GOOGLE_COREBOOT_TABLE_ACPI=3Dy
> CONFIG_GOOGLE_MEMCONSOLE=3Dy
> CONFIG_GOOGLE_MEMCONSOLE_X86_LEGACY=3Dy
> # CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT is not set
> CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=3Dy
> CONFIG_GOOGLE_VPD=3Dy
> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> =

> #
> # Tegra firmware driver
> #
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_VHOST_NET=3Dy
> CONFIG_VHOST=3Dy
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> # CONFIG_OPROFILE is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_JUMP_LABEL is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_RCU_TABLE_FREE=3Dy
> CONFIG_HAVE_RCU_TABLE_INVALIDATE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_CC_HAS_STACKPROTECTOR_NONE=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> # CONFIG_STACKPROTECTOR_STRONG is not set
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
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_ISA_BUS_API=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> # CONFIG_VMAP_STACK is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_ARCH_HAS_REFCOUNT=3Dy
> CONFIG_REFCOUNT_FULL=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_PLUGIN_HOSTCC=3D"g++"
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # CONFIG_GCC_PLUGINS is not set
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> # CONFIG_COREDUMP is not set
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> # CONFIG_SPARSEMEM_VMEMMAP is not set
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_TRANSPARENT_HUGE_PAGECACHE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D7
> CONFIG_MEM_SOFT_DIRTY=3Dy
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_Z3FOLD=3Dy
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_ZONE_DEVICE=3Dy
> CONFIG_FRAME_VECTOR=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_PERCPU_STATS=3Dy
> # CONFIG_GUP_BENCHMARK is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> CONFIG_TLS=3Dy
> CONFIG_TLS_DEVICE=3Dy
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> # CONFIG_XFRM_USER is not set
> CONFIG_XFRM_INTERFACE=3Dy
> # CONFIG_XFRM_SUB_POLICY is not set
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_NET_KEY=3Dy
> CONFIG_NET_KEY_MIGRATE=3Dy
> CONFIG_SMC=3Dy
> CONFIG_SMC_DIAG=3Dy
> CONFIG_INET=3Dy
> # CONFIG_IP_MULTICAST is not set
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> # CONFIG_IP_FIB_TRIE_STATS is not set
> # CONFIG_IP_MULTIPLE_TABLES is not set
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> # CONFIG_IP_ROUTE_VERBOSE is not set
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> # CONFIG_NET_IPIP is not set
> # CONFIG_NET_IPGRE_DEMUX is not set
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_SYN_COOKIES=3Dy
> # CONFIG_NET_IPVTI is not set
> CONFIG_NET_UDP_TUNNEL=3Dy
> CONFIG_NET_FOU=3Dy
> CONFIG_INET_AH=3Dy
> CONFIG_INET_ESP=3Dy
> CONFIG_INET_ESP_OFFLOAD=3Dy
> # CONFIG_INET_IPCOMP is not set
> # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
> CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> # CONFIG_INET_XFRM_MODE_BEET is not set
> # CONFIG_INET_DIAG is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dy
> # CONFIG_TCP_CONG_CUBIC is not set
> CONFIG_TCP_CONG_WESTWOOD=3Dy
> CONFIG_TCP_CONG_HTCP=3Dy
> # CONFIG_TCP_CONG_HSTCP is not set
> CONFIG_TCP_CONG_HYBLA=3Dy
> CONFIG_TCP_CONG_VEGAS=3Dy
> # CONFIG_TCP_CONG_NV is not set
> CONFIG_TCP_CONG_SCALABLE=3Dy
> CONFIG_TCP_CONG_LP=3Dy
> CONFIG_TCP_CONG_VENO=3Dy
> CONFIG_TCP_CONG_YEAH=3Dy
> # CONFIG_TCP_CONG_ILLINOIS is not set
> CONFIG_TCP_CONG_DCTCP=3Dy
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dy
> # CONFIG_DEFAULT_BIC is not set
> # CONFIG_DEFAULT_HTCP is not set
> # CONFIG_DEFAULT_HYBLA is not set
> # CONFIG_DEFAULT_VEGAS is not set
> # CONFIG_DEFAULT_VENO is not set
> # CONFIG_DEFAULT_WESTWOOD is not set
> CONFIG_DEFAULT_DCTCP=3Dy
> # CONFIG_DEFAULT_BBR is not set
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"dctcp"
> # CONFIG_TCP_MD5SIG is not set
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> CONFIG_INET6_AH=3Dy
> CONFIG_INET6_ESP=3Dy
> CONFIG_INET6_ESP_OFFLOAD=3Dy
> # CONFIG_INET6_IPCOMP is not set
> CONFIG_IPV6_MIP6=3Dy
> CONFIG_INET6_TUNNEL=3Dy
> # CONFIG_INET6_XFRM_MODE_TRANSPORT is not set
> CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> CONFIG_INET6_XFRM_MODE_BEET=3Dy
> CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=3Dy
> CONFIG_IPV6_VTI=3Dy
> # CONFIG_IPV6_SIT is not set
> CONFIG_IPV6_TUNNEL=3Dy
> CONFIG_IPV6_FOU=3Dy
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> # CONFIG_IPV6_MROUTE is not set
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> CONFIG_NETLABEL=3Dy
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> # CONFIG_NETFILTER is not set
> # CONFIG_BPFILTER is not set
> CONFIG_IP_DCCP=3Dy
> =

> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> # CONFIG_IP_DCCP_CCID3 is not set
> =

> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> CONFIG_IP_SCTP=3Dy
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE=3Dy
> # CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
> # CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dy
> CONFIG_TIPC_MEDIA_UDP=3Dy
> # CONFIG_TIPC_DIAG is not set
> CONFIG_ATM=3Dy
> # CONFIG_ATM_CLIP is not set
> # CONFIG_ATM_LANE is not set
> # CONFIG_ATM_BR2684 is not set
> CONFIG_L2TP=3Dy
> CONFIG_L2TP_DEBUGFS=3Dy
> CONFIG_L2TP_V3=3Dy
> # CONFIG_L2TP_IP is not set
> CONFIG_L2TP_ETH=3Dy
> CONFIG_STP=3Dy
> CONFIG_GARP=3Dy
> CONFIG_MRP=3Dy
> # CONFIG_BRIDGE is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dy
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dy
> CONFIG_LLC2=3Dy
> CONFIG_ATALK=3Dy
> # CONFIG_DEV_APPLETALK is not set
> CONFIG_X25=3Dy
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> # CONFIG_6LOWPAN is not set
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dy
> CONFIG_MAC802154=3Dy
> # CONFIG_NET_SCHED is not set
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> CONFIG_BATMAN_ADV=3Dy
> CONFIG_BATMAN_ADV_BATMAN_V=3Dy
> # CONFIG_BATMAN_ADV_BLA is not set
> CONFIG_BATMAN_ADV_DAT=3Dy
> CONFIG_BATMAN_ADV_NC=3Dy
> # CONFIG_BATMAN_ADV_MCAST is not set
> # CONFIG_BATMAN_ADV_DEBUGFS is not set
> CONFIG_OPENVSWITCH=3Dy
> # CONFIG_VSOCKETS is not set
> CONFIG_NETLINK_DIAG=3Dy
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dy
> # CONFIG_MPLS_IPTUNNEL is not set
> CONFIG_NET_NSH=3Dy
> CONFIG_HSR=3Dy
> # CONFIG_NET_SWITCHDEV is not set
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_NET_NCSI is not set
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dy
> CONFIG_NET_DROP_MONITOR=3Dy
> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dy
> CONFIG_CAN_RAW=3Dy
> CONFIG_CAN_BCM=3Dy
> CONFIG_CAN_GW=3Dy
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dy
> CONFIG_CAN_VXCAN=3Dy
> # CONFIG_CAN_SLCAN is not set
> # CONFIG_CAN_DEV is not set
> # CONFIG_CAN_DEBUG_DEVICES is not set
> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dy
> # CONFIG_BT_RFCOMM_TTY is not set
> # CONFIG_BT_BNEP is not set
> CONFIG_BT_HIDP=3Dy
> # CONFIG_BT_HS is not set
> # CONFIG_BT_LE is not set
> CONFIG_BT_LEDS=3Dy
> # CONFIG_BT_SELFTEST is not set
> CONFIG_BT_DEBUGFS=3Dy
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIUART is not set
> CONFIG_BT_HCIDTL1=3Dy
> CONFIG_BT_HCIBT3C=3Dy
> # CONFIG_BT_HCIBLUECARD is not set
> CONFIG_BT_HCIVHCI=3Dy
> # CONFIG_BT_MRVL is not set
> CONFIG_AF_RXRPC=3Dy
> CONFIG_AF_RXRPC_IPV6=3Dy
> # CONFIG_AF_RXRPC_INJECT_LOSS is not set
> # CONFIG_AF_RXRPC_DEBUG is not set
> CONFIG_RXKAD=3Dy
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> # CONFIG_CFG80211 is not set
> =

> #
> # CFG80211 needs to be enabled for MAC80211
> #
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_WIMAX=3Dy
> CONFIG_WIMAX_DEBUG_LEVEL=3D8
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> # CONFIG_RFKILL_INPUT is not set
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> CONFIG_NET_9P_DEBUG=3Dy
> CONFIG_CAIF=3Dy
> CONFIG_CAIF_DEBUG=3Dy
> CONFIG_CAIF_NETDEV=3Dy
> # CONFIG_CAIF_USB is not set
> CONFIG_CEPH_LIB=3Dy
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> # CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
> # CONFIG_NFC is not set
> # CONFIG_PSAMPLE is not set
> CONFIG_NET_IFE=3Dy
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> # CONFIG_NET_DEVLINK is not set
> CONFIG_MAY_USE_DEVLINK=3Dy
> # CONFIG_FAILOVER is not set
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
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_WANT_DEV_COREDUMP=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> CONFIG_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_W1=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D0
> CONFIG_CMA_SIZE_PERCENTAGE=3D0
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=3Dy
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> CONFIG_GNSS=3Dy
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> # CONFIG_PARPORT_PC_PCMCIA is not set
> CONFIG_PARPORT_AX88796=3Dy
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # NVME Support
> #
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> # CONFIG_AD525X_DPOT_I2C is not set
> # CONFIG_AD525X_DPOT_SPI is not set
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dy
> CONFIG_SGI_IOC4=3Dy
> # CONFIG_TIFM_CORE is not set
> # CONFIG_ICS932S401 is not set
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_USB_SWITCH_FSA9480=3Dy
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> CONFIG_SRAM=3Dy
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> CONFIG_MISC_RTSX=3Dy
> CONFIG_C2PORT=3Dy
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_EEPROM_93XX46=3Dy
> CONFIG_EEPROM_IDT_89HPESX=3Dy
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dy
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> CONFIG_INTEL_MEI_TXE=3Dy
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC & related support
> #
> =

> #
> # Intel MIC Bus Driver
> #
> # CONFIG_INTEL_MIC_BUS is not set
> =

> #
> # SCIF Bus Driver
> #
> CONFIG_SCIF_BUS=3Dy
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
> CONFIG_SCIF=3Dy
> =

> #
> # Intel MIC Coprocessor State Management (COSM) Drivers
> #
> CONFIG_MIC_COSM=3Dy
> =

> #
> # VOP Driver
> #
> CONFIG_GENWQE=3Dy
> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
> # CONFIG_ECHO is not set
> CONFIG_MISC_RTSX_PCI=3Dy
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> # CONFIG_NETCONSOLE is not set
> # CONFIG_RIONET is not set
> # CONFIG_TUN is not set
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> # CONFIG_VIRTIO_NET is not set
> # CONFIG_NLMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> =

> #
> # CAIF transport drivers
> #
> # CONFIG_CAIF_TTY is not set
> # CONFIG_CAIF_SPI_SLAVE is not set
> # CONFIG_CAIF_HSI is not set
> # CONFIG_CAIF_VIRTIO is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_PCMCIA_3C574 is not set
> # CONFIG_PCMCIA_3C589 is not set
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_PCMCIA_NMCLAN is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_AURORA=3Dy
> # CONFIG_AURORA_NB8800 is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_FUJITSU=3Dy
> # CONFIG_PCMCIA_FMVJ18X is not set
> CONFIG_NET_VENDOR_HP=3Dy
> # CONFIG_HP100 is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dy
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dy
> CONFIG_IGB_HWMON=3Dy
> CONFIG_IGB_DCA=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dy
> CONFIG_IXGBE_HWMON=3Dy
> CONFIG_IXGBE_DCA=3Dy
> # CONFIG_IXGBE_DCB is not set
> # CONFIG_IXGBEVF is not set
> # CONFIG_I40E is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_PCMCIA_AXNET is not set
> # CONFIG_NE2K_PCI is not set
> # CONFIG_PCMCIA_PCNET is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_QLGE is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_PCMCIA_SMC91C92 is not set
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_ALE is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XIRCOM=3Dy
> # CONFIG_PCMCIA_XIRC2PS is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> # CONFIG_MDIO_DEVICE is not set
> # CONFIG_PHYLIB is not set
> # CONFIG_MICREL_KS8995MA is not set
> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> CONFIG_WLAN=3Dy
> # CONFIG_WIRELESS_WDS is not set
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K_PCI is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> CONFIG_WLAN_VENDOR_RSI=3Dy
> CONFIG_WLAN_VENDOR_ST=3Dy
> CONFIG_WLAN_VENDOR_TI=3Dy
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_PCMCIA_RAYCS is not set
> =

> #
> # WiMAX Wireless Broadband devices
> #
> =

> #
> # Enable USB support to see WiMAX USB drivers
> #
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_THUNDERBOLT_NET is not set
> # CONFIG_NETDEVSIM is not set
> # CONFIG_NET_FAILOVER is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
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
> CONFIG_INPUT_JOYDEV=3Dy
> # CONFIG_INPUT_EVDEV is not set
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADC=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_DLINK_DIR685=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> CONFIG_KEYBOARD_GPIO=3Dy
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dy
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> CONFIG_KEYBOARD_SAMSUNG=3Dy
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> CONFIG_KEYBOARD_SUNKBD=3Dy
> CONFIG_KEYBOARD_TM2_TOUCHKEY=3Dy
> # CONFIG_KEYBOARD_TWL4030 is not set
> CONFIG_KEYBOARD_XTKBD=3Dy
> # CONFIG_KEYBOARD_CROS_EC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> # CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS is not set
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> # CONFIG_MOUSE_PS2_TRACKPOINT is not set
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> # CONFIG_MOUSE_SERIAL is not set
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dy
> CONFIG_MOUSE_ELAN_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_GPIO=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_PEGASUS is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dy
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> CONFIG_TOUCHSCREEN_ADS7846=3Dy
> # CONFIG_TOUCHSCREEN_AD7877 is not set
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> CONFIG_TOUCHSCREEN_AD7879_SPI=3Dy
> # CONFIG_TOUCHSCREEN_ADC is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> CONFIG_TOUCHSCREEN_ATMEL_MXT_T37=3Dy
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_BU21029 is not set
> CONFIG_TOUCHSCREEN_CHIPONE_ICN8505=3Dy
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP4_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
> CONFIG_TOUCHSCREEN_DA9034=3Dy
> # CONFIG_TOUCHSCREEN_DYNAPRO is not set
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX_SERIAL=3Dy
> CONFIG_TOUCHSCREEN_EXC3000=3Dy
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> # CONFIG_TOUCHSCREEN_HIDEEP is not set
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_S6SY761=3Dy
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> # CONFIG_TOUCHSCREEN_EKTF2127 is not set
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> CONFIG_TOUCHSCREEN_MMS114=3Dy
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dy
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_WDT87XX_I2C is not set
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> # CONFIG_TOUCHSCREEN_TOUCHIT213 is not set
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> # CONFIG_TOUCHSCREEN_TSC2005 is not set
> CONFIG_TOUCHSCREEN_TSC2007=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
> CONFIG_TOUCHSCREEN_PCAP=3Dy
> CONFIG_TOUCHSCREEN_RM_TS=3Dy
> CONFIG_TOUCHSCREEN_SILEAD=3Dy
> # CONFIG_TOUCHSCREEN_SIS_I2C is not set
> CONFIG_TOUCHSCREEN_ST1232=3Dy
> CONFIG_TOUCHSCREEN_STMFTS=3Dy
> CONFIG_TOUCHSCREEN_SURFACE3_SPI=3Dy
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> # CONFIG_TOUCHSCREEN_ZFORCE is not set
> CONFIG_TOUCHSCREEN_ROHM_BU21023=3Dy
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_AD714X=3Dy
> CONFIG_INPUT_AD714X_I2C=3Dy
> # CONFIG_INPUT_AD714X_SPI is not set
> CONFIG_INPUT_BMA150=3Dy
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> # CONFIG_INPUT_PCSPKR is not set
> CONFIG_INPUT_MAX77693_HAPTIC=3Dy
> CONFIG_INPUT_MAX8997_HAPTIC=3Dy
> # CONFIG_INPUT_MMA8450 is not set
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GP2A=3Dy
> CONFIG_INPUT_GPIO_BEEPER=3Dy
> CONFIG_INPUT_GPIO_DECODER=3Dy
> CONFIG_INPUT_ATLAS_BTNS=3Dy
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_REGULATOR_HAPTIC=3Dy
> CONFIG_INPUT_TWL4030_PWRBUTTON=3Dy
> CONFIG_INPUT_TWL4030_VIBRA=3Dy
> # CONFIG_INPUT_UINPUT is not set
> CONFIG_INPUT_PCF50633_PMU=3Dy
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_PWM_BEEPER=3Dy
> CONFIG_INPUT_PWM_VIBRA=3Dy
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> # CONFIG_INPUT_PCAP is not set
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dy
> CONFIG_INPUT_ADXL34X_SPI=3Dy
> CONFIG_INPUT_CMA3000=3Dy
> # CONFIG_INPUT_CMA3000_I2C is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> # CONFIG_INPUT_SOC_BUTTON_ARRAY is not set
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> # CONFIG_INPUT_DRV2665_HAPTICS is not set
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_SPI=3Dy
> # CONFIG_RMI4_SMB is not set
> # CONFIG_RMI4_F03 is not set
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> # CONFIG_RMI4_F12 is not set
> # CONFIG_RMI4_F30 is not set
> # CONFIG_RMI4_F34 is not set
> CONFIG_RMI4_F54=3Dy
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=3Dy
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
> # CONFIG_DEVMEM is not set
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> # CONFIG_SERIAL_8250_CS is not set
> # CONFIG_SERIAL_8250_MEN_MCB is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> # CONFIG_SERIAL_8250_MOXA is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_IFX6X60 is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_SERIAL_DEV_BUS is not set
> # CONFIG_TTY_PRINTK is not set
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_DMI_DECODE=3Dy
> # CONFIG_IPMI_PANIC_EVENT is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dy
> # CONFIG_IPMI_SSIF is not set
> # CONFIG_IPMI_WATCHDOG is not set
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> # CONFIG_HW_RANDOM_VIA is not set
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_NVRAM is not set
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> CONFIG_SCR24X=3Dy
> # CONFIG_IPWIRELESS is not set
> # CONFIG_MWAVE is not set
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_SPI=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> # CONFIG_TCG_NSC is not set
> # CONFIG_TCG_ATMEL is not set
> # CONFIG_TCG_INFINEON is not set
> CONFIG_TCG_CRB=3Dy
> CONFIG_TCG_VTPM_PROXY=3Dy
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> # CONFIG_TCG_TIS_ST33ZP24_I2C is not set
> CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
> # CONFIG_TELCLOCK is not set
> # CONFIG_DEVPORT is not set
> CONFIG_XILLYBUS=3Dy
> CONFIG_XILLYBUS_PCIE=3Dy
> # CONFIG_RANDOM_TRUST_CPU is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> # CONFIG_ACPI_I2C_OPREGION is not set
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_MUX_MLXCPLD is not set
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
> # CONFIG_I2C_ALI1535 is not set
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> CONFIG_I2C_AMD756_S4882=3Dy
> # CONFIG_I2C_AMD8111 is not set
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> # CONFIG_I2C_SIS5595 is not set
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> # CONFIG_I2C_VIAPRO is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> CONFIG_I2C_DESIGNWARE_SLAVE=3Dy
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> # CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
> CONFIG_I2C_EMEV2=3Dy
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dy
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dy
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> CONFIG_I2C_SLAVE=3Dy
> CONFIG_I2C_SLAVE_EEPROM=3Dy
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_DEBUG=3Dy
> CONFIG_SPI_MASTER=3Dy
> CONFIG_SPI_MEM=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> CONFIG_SPI_ALTERA=3Dy
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_BUTTERFLY=3Dy
> CONFIG_SPI_CADENCE=3Dy
> CONFIG_SPI_DESIGNWARE=3Dy
> # CONFIG_SPI_DW_PCI is not set
> # CONFIG_SPI_DW_MMIO is not set
> # CONFIG_SPI_GPIO is not set
> CONFIG_SPI_LM70_LLP=3Dy
> # CONFIG_SPI_OC_TINY is not set
> CONFIG_SPI_PXA2XX=3Dy
> CONFIG_SPI_PXA2XX_PCI=3Dy
> CONFIG_SPI_ROCKCHIP=3Dy
> # CONFIG_SPI_SC18IS602 is not set
> CONFIG_SPI_XCOMM=3Dy
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> CONFIG_SPI_TLE62X0=3Dy
> # CONFIG_SPI_SLAVE is not set
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> # CONFIG_PPS is not set
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
> CONFIG_PINCTRL_AMD=3Dy
> CONFIG_PINCTRL_MCP23S08=3Dy
> CONFIG_PINCTRL_SX150X=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> # CONFIG_PINCTRL_CANNONLAKE is not set
> # CONFIG_PINCTRL_CEDARFORK is not set
> CONFIG_PINCTRL_DENVERTON=3Dy
> CONFIG_PINCTRL_GEMINILAKE=3Dy
> CONFIG_PINCTRL_ICELAKE=3Dy
> CONFIG_PINCTRL_LEWISBURG=3Dy
> # CONFIG_PINCTRL_SUNRISEPOINT is not set
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_LYNXPOINT=3Dy
> CONFIG_GPIO_MB86S7X=3Dy
> # CONFIG_GPIO_MENZ127 is not set
> CONFIG_GPIO_MOCKUP=3Dy
> CONFIG_GPIO_VX855=3Dy
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_IT87=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_WINBOND=3Dy
> CONFIG_GPIO_WS16C48=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> CONFIG_GPIO_MAX7300=3Dy
> CONFIG_GPIO_MAX732X=3Dy
> # CONFIG_GPIO_MAX732X_IRQ is not set
> CONFIG_GPIO_PCA953X=3Dy
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_TPIC2810 is not set
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_BD9571MWV=3Dy
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_KEMPLD=3Dy
> CONFIG_GPIO_LP3943=3Dy
> # CONFIG_GPIO_LP873X is not set
> # CONFIG_GPIO_TPS65086 is not set
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> # CONFIG_GPIO_TPS68470 is not set
> CONFIG_GPIO_TWL4030=3Dy
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> CONFIG_GPIO_PCIE_IDIO_24=3Dy
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX3191X is not set
> CONFIG_GPIO_MAX7301=3Dy
> # CONFIG_GPIO_MC33880 is not set
> CONFIG_GPIO_PISOSR=3Dy
> CONFIG_GPIO_XRA1403=3Dy
> CONFIG_W1=3Dy
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2405=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2805=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> # CONFIG_W1_SLAVE_DS2433 is not set
> CONFIG_W1_SLAVE_DS2438=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> # CONFIG_W1_SLAVE_DS28E17 is not set
> CONFIG_POWER_AVS=3Dy
> # CONFIG_POWER_RESET is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_CHARGER_SBS=3Dy
> CONFIG_MANAGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> CONFIG_BATTERY_BQ27XXX_HDQ=3Dy
> # CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
> CONFIG_BATTERY_DA9030=3Dy
> CONFIG_BATTERY_DA9150=3Dy
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=3Dy
> CONFIG_BATTERY_TWL4030_MADC=3Dy
> # CONFIG_CHARGER_PCF50633 is not set
> CONFIG_BATTERY_RX51=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> # CONFIG_CHARGER_TWL4030 is not set
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LTC3651=3Dy
> CONFIG_CHARGER_MAX14577=3Dy
> CONFIG_CHARGER_MAX8997=3Dy
> # CONFIG_CHARGER_MAX8998 is not set
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_CHARGER_TPS65090 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> # CONFIG_BATTERY_RT5033 is not set
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_CHARGER_CROS_USBPD=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7314=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> # CONFIG_SENSORS_ADM1026 is not set
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> # CONFIG_SENSORS_K10TEMP is not set
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ASPEED=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> # CONFIG_SENSORS_DS620 is not set
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_FSCHMD is not set
> CONFIG_SENSORS_FTSTEUTATES=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> # CONFIG_SENSORS_GL520SM is not set
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> CONFIG_SENSORS_I5500=3Dy
> # CONFIG_SENSORS_CORETEMP is not set
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> # CONFIG_SENSORS_MAX1111 is not set
> CONFIG_SENSORS_MAX16065=3Dy
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX31722 is not set
> CONFIG_SENSORS_MAX6621=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_TC654=3Dy
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> # CONFIG_SENSORS_ADCXX is not set
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> # CONFIG_SENSORS_LM95245 is not set
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dy
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NCT7904=3Dy
> # CONFIG_SENSORS_NPCM7XX is not set
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> CONFIG_SENSORS_ADM1275=3Dy
> CONFIG_SENSORS_IBM_CFFPS=3Dy
> CONFIG_SENSORS_IR35221=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> CONFIG_SENSORS_LTC3815=3Dy
> # CONFIG_SENSORS_MAX16064 is not set
> CONFIG_SENSORS_MAX20751=3Dy
> CONFIG_SENSORS_MAX31785=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> CONFIG_SENSORS_TPS40422=3Dy
> CONFIG_SENSORS_TPS53679=3Dy
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> CONFIG_SENSORS_ZL6100=3Dy
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> # CONFIG_SENSORS_SHT3x is not set
> CONFIG_SENSORS_SHTC1=3Dy
> CONFIG_SENSORS_SIS5595=3Dy
> CONFIG_SENSORS_DME1737=3Dy
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dy
> CONFIG_SENSORS_ADS1015=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_INA3221=3Dy
> # CONFIG_SENSORS_TC74 is not set
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> CONFIG_SENSORS_TMP103=3Dy
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dy
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83773G=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dy
> CONFIG_SENSORS_ATK0110=3Dy
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> CONFIG_INT3406_THERMAL=3Dy
> CONFIG_INTEL_PCH_THERMAL=3Dy
> CONFIG_GENERIC_ADC_THERMAL=3Dy
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> # CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
> # CONFIG_WATCHDOG_SYSFS is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_SOFT_WATCHDOG_PRETIMEOUT=3Dy
> CONFIG_DA9063_WATCHDOG=3Dy
> CONFIG_MENF21BMC_WATCHDOG=3Dy
> CONFIG_MENZ069_WATCHDOG=3Dy
> CONFIG_WDAT_WDT=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dy
> CONFIG_TWL4030_WATCHDOG=3Dy
> CONFIG_MAX63XX_WATCHDOG=3Dy
> CONFIG_ACQUIRE_WDT=3Dy
> # CONFIG_ADVANTECH_WDT is not set
> # CONFIG_ALIM1535_WDT is not set
> CONFIG_ALIM7101_WDT=3Dy
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dy
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dy
> # CONFIG_IT87_WDT is not set
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_KEMPLD_WDT=3Dy
> CONFIG_SC1200_WDT=3Dy
> CONFIG_PC87413_WDT=3Dy
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> CONFIG_SMSC37B787_WDT=3Dy
> CONFIG_VIA_WDT=3Dy
> # CONFIG_W83627HF_WDT is not set
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> # CONFIG_INTEL_MEI_WDT is not set
> # CONFIG_NI903X_WDT is not set
> CONFIG_NIC7018_WDT=3Dy
> CONFIG_MEN_A21_WDT=3Dy
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> CONFIG_WDTPCI=3Dy
> =

> #
> # Watchdog Pretimeout Governors
> #
> CONFIG_WATCHDOG_PRETIMEOUT_GOV=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=3Dy
> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
> CONFIG_SSB_POSSIBLE=3Dy
> CONFIG_SSB=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> # CONFIG_BCMA is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> CONFIG_MFD_BD9571MWV=3Dy
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_CROS_EC=3Dy
> # CONFIG_MFD_CROS_EC_CHARDEV is not set
> # CONFIG_MFD_MADERA is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> CONFIG_MFD_DA9150=3Dy
> # CONFIG_MFD_MC13XXX_SPI is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> # CONFIG_INTEL_SOC_PMIC_CHTWC is not set
> CONFIG_INTEL_SOC_PMIC_CHTDC_TI=3Dy
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX77843=3Dy
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_EZX_PCAP=3Dy
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT5033=3Dy
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS68470=3Dy
> CONFIG_MFD_TI_LP873X=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS65912_SPI=3Dy
> # CONFIG_MFD_TPS80031 is not set
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> # CONFIG_MFD_ARIZONA_I2C is not set
> CONFIG_MFD_ARIZONA_SPI=3Dy
> CONFIG_MFD_CS47L24=3Dy
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PG86X=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_ANATOP is not set
> # CONFIG_REGULATOR_AAT2870 is not set
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_BD9571MWV=3Dy
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9063=3Dy
> # CONFIG_REGULATOR_DA9210 is not set
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> # CONFIG_REGULATOR_ISL9305 is not set
> CONFIG_REGULATOR_ISL6271A=3Dy
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_LTC3676 is not set
> # CONFIG_REGULATOR_MAX14577 is not set
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX8998=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MT6311=3Dy
> CONFIG_REGULATOR_PCAP=3Dy
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> CONFIG_REGULATOR_PV88090=3Dy
> # CONFIG_REGULATOR_PWM is not set
> CONFIG_REGULATOR_RT5033=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dy
> # CONFIG_REGULATOR_TPS65090 is not set
> CONFIG_REGULATOR_TPS65132=3Dy
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> CONFIG_REGULATOR_WM8994=3Dy
> CONFIG_CEC_CORE=3Dy
> CONFIG_RC_CORE=3Dy
> # CONFIG_RC_MAP is not set
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_IR_NEC_DECODER is not set
> CONFIG_IR_RC5_DECODER=3Dy
> CONFIG_IR_RC6_DECODER=3Dy
> # CONFIG_IR_JVC_DECODER is not set
> # CONFIG_IR_SONY_DECODER is not set
> CONFIG_IR_SANYO_DECODER=3Dy
> # CONFIG_IR_SHARP_DECODER is not set
> # CONFIG_IR_MCE_KBD_DECODER is not set
> # CONFIG_IR_XMP_DECODER is not set
> # CONFIG_IR_IMON_DECODER is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> # CONFIG_MEDIA_RADIO_SUPPORT is not set
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> CONFIG_MEDIA_CEC_RC=3Dy
> # CONFIG_MEDIA_CONTROLLER is not set
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> CONFIG_VIDEO_PCI_SKELETON=3Dy
> CONFIG_VIDEO_TUNER=3Dy
> CONFIG_V4L2_MEM2MEM_DEV=3Dy
> CONFIG_V4L2_FWNODE=3Dy
> CONFIG_VIDEOBUF_GEN=3Dy
> CONFIG_VIDEOBUF_DMA_SG=3Dy
> CONFIG_DVB_CORE=3Dy
> CONFIG_DVB_MMAP=3Dy
> CONFIG_DVB_NET=3Dy
> CONFIG_TTPCI_EEPROM=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> CONFIG_DVB_ULE_DEBUG=3Dy
> =

> #
> # Media drivers
> #
> CONFIG_MEDIA_PCI_SUPPORT=3Dy
> =

> #
> # Media capture support
> #
> CONFIG_VIDEO_TW5864=3Dy
> CONFIG_VIDEO_TW68=3Dy
> =

> #
> # Media capture/analog TV support
> #
> CONFIG_VIDEO_IVTV=3Dy
> CONFIG_VIDEO_IVTV_DEPRECATED_IOCTLS=3Dy
> CONFIG_VIDEO_FB_IVTV=3Dy
> CONFIG_VIDEO_HEXIUM_GEMINI=3Dy
> # CONFIG_VIDEO_HEXIUM_ORION is not set
> CONFIG_VIDEO_MXB=3Dy
> CONFIG_VIDEO_DT3155=3Dy
> =

> #
> # Media capture/analog/hybrid TV support
> #
> # CONFIG_VIDEO_CX18 is not set
> CONFIG_VIDEO_CX25821=3Dy
> CONFIG_VIDEO_CX88=3Dy
> CONFIG_VIDEO_CX88_BLACKBIRD=3Dy
> CONFIG_VIDEO_CX88_DVB=3Dy
> CONFIG_VIDEO_CX88_ENABLE_VP3054=3Dy
> CONFIG_VIDEO_CX88_VP3054=3Dy
> CONFIG_VIDEO_CX88_MPEG=3Dy
> CONFIG_VIDEO_SAA7134=3Dy
> # CONFIG_VIDEO_SAA7134_RC is not set
> CONFIG_VIDEO_SAA7134_DVB=3Dy
> CONFIG_VIDEO_SAA7164=3Dy
> =

> #
> # Media digital TV PCI Adapters
> #
> CONFIG_DVB_AV7110=3Dy
> CONFIG_DVB_AV7110_OSD=3Dy
> CONFIG_DVB_BUDGET_CORE=3Dy
> CONFIG_DVB_BUDGET=3Dy
> CONFIG_DVB_BUDGET_CI=3Dy
> CONFIG_DVB_BUDGET_AV=3Dy
> CONFIG_DVB_BUDGET_PATCH=3Dy
> CONFIG_DVB_B2C2_FLEXCOP_PCI=3Dy
> # CONFIG_DVB_B2C2_FLEXCOP_PCI_DEBUG is not set
> CONFIG_DVB_PLUTO2=3Dy
> # CONFIG_DVB_DM1105 is not set
> # CONFIG_DVB_PT1 is not set
> # CONFIG_DVB_PT3 is not set
> CONFIG_MANTIS_CORE=3Dy
> # CONFIG_DVB_MANTIS is not set
> # CONFIG_DVB_HOPPER is not set
> CONFIG_DVB_NGENE=3Dy
> # CONFIG_DVB_DDBRIDGE is not set
> CONFIG_DVB_SMIPCIE=3Dy
> # CONFIG_DVB_NETUP_UNIDVB is not set
> CONFIG_V4L_PLATFORM_DRIVERS=3Dy
> # CONFIG_VIDEO_CAFE_CCIC is not set
> # CONFIG_VIDEO_CADENCE is not set
> CONFIG_SOC_CAMERA=3Dy
> CONFIG_SOC_CAMERA_PLATFORM=3Dy
> CONFIG_V4L_MEM2MEM_DRIVERS=3Dy
> CONFIG_VIDEO_MEM2MEM_DEINTERLACE=3Dy
> # CONFIG_VIDEO_SH_VEU is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_CEC_PLATFORM_DRIVERS is not set
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_VIDEO_CX2341X=3Dy
> CONFIG_VIDEO_TVEEPROM=3Dy
> CONFIG_VIDEOBUF2_CORE=3Dy
> CONFIG_VIDEOBUF2_V4L2=3Dy
> CONFIG_VIDEOBUF2_MEMOPS=3Dy
> CONFIG_VIDEOBUF2_DMA_CONTIG=3Dy
> CONFIG_VIDEOBUF2_VMALLOC=3Dy
> CONFIG_VIDEOBUF2_DMA_SG=3Dy
> CONFIG_VIDEOBUF2_DVB=3Dy
> CONFIG_DVB_B2C2_FLEXCOP=3Dy
> CONFIG_VIDEO_SAA7146=3Dy
> CONFIG_VIDEO_SAA7146_VV=3Dy
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, spi, frontends)
> #
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> CONFIG_VIDEO_IR_I2C=3Dy
> =

> #
> # I2C Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> CONFIG_VIDEO_TVAUDIO=3Dy
> CONFIG_VIDEO_TDA7432=3Dy
> CONFIG_VIDEO_TDA9840=3Dy
> CONFIG_VIDEO_TEA6415C=3Dy
> CONFIG_VIDEO_TEA6420=3Dy
> CONFIG_VIDEO_MSP3400=3Dy
> CONFIG_VIDEO_CS3308=3Dy
> CONFIG_VIDEO_CS5345=3Dy
> CONFIG_VIDEO_CS53L32A=3Dy
> # CONFIG_VIDEO_TLV320AIC23B is not set
> CONFIG_VIDEO_UDA1342=3Dy
> CONFIG_VIDEO_WM8775=3Dy
> CONFIG_VIDEO_WM8739=3Dy
> CONFIG_VIDEO_VP27SMPX=3Dy
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dy
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7183 is not set
> CONFIG_VIDEO_BT819=3Dy
> # CONFIG_VIDEO_BT856 is not set
> CONFIG_VIDEO_BT866=3Dy
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> CONFIG_VIDEO_SAA711X=3Dy
> CONFIG_VIDEO_TVP514X=3Dy
> CONFIG_VIDEO_TVP5150=3Dy
> CONFIG_VIDEO_TVP7002=3Dy
> CONFIG_VIDEO_TW2804=3Dy
> # CONFIG_VIDEO_TW9903 is not set
> CONFIG_VIDEO_TW9906=3Dy
> CONFIG_VIDEO_TW9910=3Dy
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dy
> CONFIG_VIDEO_CX25840=3Dy
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dy
> CONFIG_VIDEO_SAA7185=3Dy
> CONFIG_VIDEO_ADV7170=3Dy
> CONFIG_VIDEO_ADV7175=3Dy
> CONFIG_VIDEO_ADV7343=3Dy
> # CONFIG_VIDEO_ADV7393 is not set
> CONFIG_VIDEO_AK881X=3Dy
> CONFIG_VIDEO_THS8200=3Dy
> =

> #
> # Camera sensor devices
> #
> CONFIG_VIDEO_OV2640=3Dy
> CONFIG_VIDEO_OV2659=3Dy
> CONFIG_VIDEO_OV6650=3Dy
> # CONFIG_VIDEO_OV5695 is not set
> CONFIG_VIDEO_OV772X=3Dy
> CONFIG_VIDEO_OV7640=3Dy
> CONFIG_VIDEO_OV7670=3Dy
> CONFIG_VIDEO_OV7740=3Dy
> CONFIG_VIDEO_VS6624=3Dy
> CONFIG_VIDEO_MT9M111=3Dy
> CONFIG_VIDEO_MT9T112=3Dy
> # CONFIG_VIDEO_MT9V011 is not set
> CONFIG_VIDEO_MT9V111=3Dy
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> =

> #
> # Flash devices
> #
> =

> #
> # Video improvement chips
> #
> CONFIG_VIDEO_UPD64031A=3Dy
> CONFIG_VIDEO_UPD64083=3Dy
> =

> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=3Dy
> =

> #
> # SDR tuner chips
> #
> =

> #
> # Miscellaneous helper chips
> #
> CONFIG_VIDEO_THS7303=3Dy
> CONFIG_VIDEO_M52790=3Dy
> CONFIG_VIDEO_I2C=3Dy
> =

> #
> # Sensors used on soc_camera driver
> #
> =

> #
> # soc_camera sensor drivers
> #
> CONFIG_SOC_CAMERA_MT9M001=3Dy
> # CONFIG_SOC_CAMERA_MT9M111 is not set
> CONFIG_SOC_CAMERA_MT9T112=3Dy
> # CONFIG_SOC_CAMERA_MT9V022 is not set
> CONFIG_SOC_CAMERA_OV5642=3Dy
> CONFIG_SOC_CAMERA_OV772X=3Dy
> CONFIG_SOC_CAMERA_OV9640=3Dy
> CONFIG_SOC_CAMERA_OV9740=3Dy
> CONFIG_SOC_CAMERA_RJ54N1=3Dy
> CONFIG_SOC_CAMERA_TW9910=3Dy
> =

> #
> # SPI helper chips
> #
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dy
> CONFIG_MEDIA_TUNER=3Dy
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dy
> CONFIG_MEDIA_TUNER_TDA18250=3Dy
> CONFIG_MEDIA_TUNER_TDA8290=3Dy
> CONFIG_MEDIA_TUNER_TDA827X=3Dy
> CONFIG_MEDIA_TUNER_TDA18271=3Dy
> CONFIG_MEDIA_TUNER_TDA9887=3Dy
> # CONFIG_MEDIA_TUNER_TEA5761 is not set
> # CONFIG_MEDIA_TUNER_TEA5767 is not set
> # CONFIG_MEDIA_TUNER_MSI001 is not set
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_MT2060=3Dy
> # CONFIG_MEDIA_TUNER_MT2063 is not set
> CONFIG_MEDIA_TUNER_MT2266=3Dy
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> # CONFIG_MEDIA_TUNER_QT1010 is not set
> # CONFIG_MEDIA_TUNER_XC2028 is not set
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MXL5005S=3Dy
> CONFIG_MEDIA_TUNER_MXL5007T=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> # CONFIG_MEDIA_TUNER_MAX2165 is not set
> CONFIG_MEDIA_TUNER_TDA18218=3Dy
> CONFIG_MEDIA_TUNER_FC0011=3Dy
> CONFIG_MEDIA_TUNER_FC0012=3Dy
> CONFIG_MEDIA_TUNER_FC0013=3Dy
> CONFIG_MEDIA_TUNER_TDA18212=3Dy
> # CONFIG_MEDIA_TUNER_E4000 is not set
> CONFIG_MEDIA_TUNER_FC2580=3Dy
> # CONFIG_MEDIA_TUNER_M88RS6000T is not set
> CONFIG_MEDIA_TUNER_TUA9001=3Dy
> CONFIG_MEDIA_TUNER_SI2157=3Dy
> CONFIG_MEDIA_TUNER_IT913X=3Dy
> # CONFIG_MEDIA_TUNER_R820T is not set
> # CONFIG_MEDIA_TUNER_MXL301RF is not set
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dy
> # CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> # CONFIG_DVB_STB0899 is not set
> CONFIG_DVB_STB6100=3Dy
> # CONFIG_DVB_STV090x is not set
> CONFIG_DVB_STV0910=3Dy
> # CONFIG_DVB_STV6110x is not set
> # CONFIG_DVB_STV6111 is not set
> CONFIG_DVB_MXL5XX=3Dy
> CONFIG_DVB_M88DS3103=3Dy
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> # CONFIG_DVB_DRXK is not set
> # CONFIG_DVB_TDA18271C2DD is not set
> # CONFIG_DVB_SI2165 is not set
> # CONFIG_DVB_MN88472 is not set
> CONFIG_DVB_MN88473=3Dy
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dy
> CONFIG_DVB_CX24123=3Dy
> CONFIG_DVB_MT312=3Dy
> CONFIG_DVB_ZL10036=3Dy
> CONFIG_DVB_ZL10039=3Dy
> CONFIG_DVB_S5H1420=3Dy
> CONFIG_DVB_STV0288=3Dy
> # CONFIG_DVB_STB6000 is not set
> # CONFIG_DVB_STV0299 is not set
> CONFIG_DVB_STV6110=3Dy
> CONFIG_DVB_STV0900=3Dy
> CONFIG_DVB_TDA8083=3Dy
> CONFIG_DVB_TDA10086=3Dy
> CONFIG_DVB_TDA8261=3Dy
> CONFIG_DVB_VES1X93=3Dy
> CONFIG_DVB_TUNER_ITD1000=3Dy
> CONFIG_DVB_TUNER_CX24113=3Dy
> CONFIG_DVB_TDA826X=3Dy
> CONFIG_DVB_TUA6100=3Dy
> CONFIG_DVB_CX24116=3Dy
> # CONFIG_DVB_CX24117 is not set
> # CONFIG_DVB_CX24120 is not set
> CONFIG_DVB_SI21XX=3Dy
> CONFIG_DVB_TS2020=3Dy
> CONFIG_DVB_DS3000=3Dy
> CONFIG_DVB_MB86A16=3Dy
> CONFIG_DVB_TDA10071=3Dy
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dy
> CONFIG_DVB_SP887X=3Dy
> # CONFIG_DVB_CX22700 is not set
> # CONFIG_DVB_CX22702 is not set
> CONFIG_DVB_S5H1432=3Dy
> CONFIG_DVB_DRXD=3Dy
> CONFIG_DVB_L64781=3Dy
> CONFIG_DVB_TDA1004X=3Dy
> CONFIG_DVB_NXT6000=3Dy
> CONFIG_DVB_MT352=3Dy
> # CONFIG_DVB_ZL10353 is not set
> CONFIG_DVB_DIB3000MB=3Dy
> CONFIG_DVB_DIB3000MC=3Dy
> CONFIG_DVB_DIB7000M=3Dy
> # CONFIG_DVB_DIB7000P is not set
> CONFIG_DVB_DIB9000=3Dy
> CONFIG_DVB_TDA10048=3Dy
> CONFIG_DVB_AF9013=3Dy
> # CONFIG_DVB_EC100 is not set
> # CONFIG_DVB_STV0367 is not set
> CONFIG_DVB_CXD2820R=3Dy
> # CONFIG_DVB_CXD2841ER is not set
> CONFIG_DVB_RTL2830=3Dy
> # CONFIG_DVB_RTL2832 is not set
> CONFIG_DVB_SI2168=3Dy
> CONFIG_DVB_ZD1301_DEMOD=3Dy
> CONFIG_DVB_CXD2880=3Dy
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dy
> CONFIG_DVB_TDA10021=3Dy
> # CONFIG_DVB_TDA10023 is not set
> CONFIG_DVB_STV0297=3Dy
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> # CONFIG_DVB_NXT200X is not set
> CONFIG_DVB_OR51211=3Dy
> # CONFIG_DVB_OR51132 is not set
> CONFIG_DVB_BCM3510=3Dy
> # CONFIG_DVB_LGDT330X is not set
> CONFIG_DVB_LGDT3305=3Dy
> CONFIG_DVB_LGDT3306A=3Dy
> # CONFIG_DVB_LG2160 is not set
> CONFIG_DVB_S5H1409=3Dy
> CONFIG_DVB_AU8522=3Dy
> CONFIG_DVB_AU8522_DTV=3Dy
> CONFIG_DVB_AU8522_V4L=3Dy
> # CONFIG_DVB_S5H1411 is not set
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dy
> CONFIG_DVB_DIB8000=3Dy
> # CONFIG_DVB_MB86A20S is not set
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dy
> CONFIG_DVB_MN88443X=3Dy
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> # CONFIG_DVB_PLL is not set
> CONFIG_DVB_TUNER_DIB0070=3Dy
> CONFIG_DVB_TUNER_DIB0090=3Dy
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dy
> CONFIG_DVB_LNBH25=3Dy
> CONFIG_DVB_LNBP21=3Dy
> # CONFIG_DVB_LNBP22 is not set
> # CONFIG_DVB_ISL6405 is not set
> CONFIG_DVB_ISL6421=3Dy
> CONFIG_DVB_ISL6423=3Dy
> CONFIG_DVB_A8293=3Dy
> CONFIG_DVB_LGS8GL5=3Dy
> CONFIG_DVB_LGS8GXX=3Dy
> # CONFIG_DVB_ATBM8830 is not set
> CONFIG_DVB_TDA665x=3Dy
> CONFIG_DVB_IX2505V=3Dy
> CONFIG_DVB_M88RS2000=3Dy
> CONFIG_DVB_AF9033=3Dy
> # CONFIG_DVB_HORUS3A is not set
> CONFIG_DVB_ASCOT2E=3Dy
> CONFIG_DVB_HELENE=3Dy
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> # CONFIG_DVB_CXD2099 is not set
> CONFIG_DVB_SP2=3Dy
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> # CONFIG_AGP_AMD64 is not set
> # CONFIG_AGP_INTEL is not set
> CONFIG_AGP_SIS=3Dy
> # CONFIG_AGP_VIA is not set
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> CONFIG_DRM_DEBUG_MM=3Dy
> CONFIG_DRM_DEBUG_SELFTEST=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_DP_CEC=3Dy
> CONFIG_DRM_TTM=3Dy
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_VM=3Dy
> CONFIG_DRM_SCHED=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> CONFIG_DRM_I2C_SIL164=3Dy
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> CONFIG_DRM_RADEON=3Dy
> # CONFIG_DRM_RADEON_USERPTR is not set
> CONFIG_DRM_AMDGPU=3Dy
> # CONFIG_DRM_AMDGPU_SI is not set
> # CONFIG_DRM_AMDGPU_CIK is not set
> # CONFIG_DRM_AMDGPU_USERPTR is not set
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=3Dy
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> CONFIG_DRM_AMD_ACP=3Dy
> =

> #
> # Display Engine Configuration
> #
> CONFIG_DRM_AMD_DC=3Dy
> CONFIG_DRM_AMD_DC_DCN1_0=3Dy
> CONFIG_DEBUG_KERNEL_DC=3Dy
> =

> #
> # AMD Library routines
> #
> CONFIG_CHASH=3Dy
> CONFIG_CHASH_STATS=3Dy
> CONFIG_CHASH_SELFTEST=3Dy
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dy
> CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> # CONFIG_DRM_I915_COMPRESS_ERROR is not set
> # CONFIG_DRM_I915_USERPTR is not set
> CONFIG_DRM_I915_GVT=3Dy
> =

> #
> # drm/i915 Debugging
> #
> # CONFIG_DRM_I915_WERROR is not set
> CONFIG_DRM_I915_DEBUG=3Dy
> CONFIG_DRM_I915_SW_FENCE_DEBUG_OBJECTS=3Dy
> # CONFIG_DRM_I915_SW_FENCE_CHECK_DAG is not set
> # CONFIG_DRM_I915_DEBUG_GUC is not set
> CONFIG_DRM_I915_SELFTEST=3Dy
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS=3Dy
> CONFIG_DRM_I915_DEBUG_VBLANK_EVADE=3Dy
> CONFIG_DRM_VGEM=3Dy
> CONFIG_DRM_VKMS=3Dy
> CONFIG_DRM_VMWGFX=3Dy
> CONFIG_DRM_VMWGFX_FBCON=3Dy
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dy
> CONFIG_DRM_MGAG200=3Dy
> # CONFIG_DRM_CIRRUS_QEMU is not set
> CONFIG_DRM_QXL=3Dy
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> CONFIG_HSA_AMD=3Dy
> # CONFIG_DRM_HISI_HIBMC is not set
> CONFIG_DRM_TINYDRM=3Dy
> CONFIG_TINYDRM_MIPI_DBI=3Dy
> CONFIG_TINYDRM_ILI9225=3Dy
> CONFIG_TINYDRM_ILI9341=3Dy
> # CONFIG_TINYDRM_MI0283QT is not set
> CONFIG_TINYDRM_REPAPER=3Dy
> CONFIG_TINYDRM_ST7586=3Dy
> # CONFIG_TINYDRM_ST7735R is not set
> CONFIG_DRM_LEGACY=3Dy
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_MGA=3Dy
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> CONFIG_DRM_SAVAGE=3Dy
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> CONFIG_DRM_LIB_RANDOM=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> CONFIG_FB_BOTH_ENDIAN=3Dy
> # CONFIG_FB_BIG_ENDIAN is not set
> # CONFIG_FB_LITTLE_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_SVGALIB=3Dy
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=3Dy
> CONFIG_FB_PM2=3Dy
> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> CONFIG_FB_CYBER2000=3Dy
> # CONFIG_FB_CYBER2000_DDC is not set
> # CONFIG_FB_ARC is not set
> CONFIG_FB_ASILIANT=3Dy
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_UVESA=3Dy
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=3Dy
> CONFIG_FB_NVIDIA_I2C=3Dy
> CONFIG_FB_NVIDIA_DEBUG=3Dy
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> # CONFIG_FB_RIVA is not set
> CONFIG_FB_I740=3Dy
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dy
> CONFIG_FB_RADEON_I2C=3Dy
> CONFIG_FB_RADEON_BACKLIGHT=3Dy
> # CONFIG_FB_RADEON_DEBUG is not set
> CONFIG_FB_ATY128=3Dy
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> CONFIG_FB_ATY_GENERIC_LCD=3Dy
> CONFIG_FB_ATY_GX=3Dy
> # CONFIG_FB_ATY_BACKLIGHT is not set
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dy
> CONFIG_FB_SAVAGE_I2C=3Dy
> # CONFIG_FB_SAVAGE_ACCEL is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> CONFIG_FB_NEOMAGIC=3Dy
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> CONFIG_FB_PM3=3Dy
> CONFIG_FB_CARMINE=3Dy
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> CONFIG_FB_SM501=3Dy
> CONFIG_FB_IBM_GXT4500=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> # CONFIG_FB_METRONOME is not set
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> CONFIG_FB_BROADSHEET=3Dy
> CONFIG_FB_SIMPLE=3Dy
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> CONFIG_LCD_ILI922X=3Dy
> # CONFIG_LCD_ILI9320 is not set
> CONFIG_LCD_TDO24M=3Dy
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dy
> CONFIG_LCD_S6E63M0=3Dy
> CONFIG_LCD_LD9040=3Dy
> # CONFIG_LCD_AMS369FG06 is not set
> # CONFIG_LCD_LMS501KF03 is not set
> CONFIG_LCD_HX8357=3Dy
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> # CONFIG_BACKLIGHT_CARILLO_RANCH is not set
> CONFIG_BACKLIGHT_PWM=3Dy
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_AAT2870 is not set
> CONFIG_BACKLIGHT_LM3630A=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_LP855X=3Dy
> # CONFIG_BACKLIGHT_PANDORA is not set
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> CONFIG_LOGO=3Dy
> CONFIG_LOGO_LINUX_MONO=3Dy
> CONFIG_LOGO_LINUX_VGA16=3Dy
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dy
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> # CONFIG_HID_A4TECH is not set
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_ASUS=3Dy
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dy
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_COUGAR is not set
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dy
> # CONFIG_HID_ELECOM is not set
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_GEMBIRD is not set
> CONFIG_HID_GFRM=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> CONFIG_HID_ITE=3Dy
> CONFIG_HID_JABRA=3Dy
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> # CONFIG_HID_LENOVO is not set
> CONFIG_HID_LOGITECH=3Dy
> # CONFIG_HID_LOGITECH_DJ is not set
> # CONFIG_HID_LOGITECH_HIDPP is not set
> # CONFIG_LOGITECH_FF is not set
> CONFIG_LOGIRUMBLEPAD2_FF=3Dy
> CONFIG_LOGIG940_FF=3Dy
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MAYFLASH is not set
> CONFIG_HID_REDRAGON=3Dy
> # CONFIG_HID_MICROSOFT is not set
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NTI=3Dy
> CONFIG_HID_ORTEK=3Dy
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> # CONFIG_HID_PICOLCD_LCD is not set
> # CONFIG_HID_PICOLCD_LEDS is not set
> # CONFIG_HID_PICOLCD_CIR is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEAM=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> # CONFIG_HID_THRUSTMASTER is not set
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WIIMOTE is not set
> CONFIG_HID_XINMO=3Dy
> # CONFIG_HID_ZEROPLUS is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
> # CONFIG_HID_ALPS is not set
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dy
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
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_GADGET is not set
> # CONFIG_TYPEC is not set
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_WHCI=3Dy
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
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
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> # CONFIG_LEDS_LP5521 is not set
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_CLEVO_MAIL=3Dy
> CONFIG_LEDS_PCA955X=3Dy
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=3Dy
> CONFIG_LEDS_DA903X=3Dy
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_PWM=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dy
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> # CONFIG_LEDS_MAX8997 is not set
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_MENF21BMC is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> # CONFIG_LEDS_MLXCPLD is not set
> CONFIG_LEDS_MLXREG=3Dy
> CONFIG_LEDS_USER=3Dy
> # CONFIG_LEDS_NIC78BX is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_ACTIVITY=3Dy
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> CONFIG_LEDS_TRIGGER_NETDEV=3Dy
> CONFIG_ACCESSIBILITY=3Dy
> CONFIG_INFINIBAND=3Dy
> # CONFIG_INFINIBAND_USER_MAD is not set
> CONFIG_INFINIBAND_USER_ACCESS=3Dy
> CONFIG_INFINIBAND_EXP_LEGACY_VERBS_NEW_UAPI=3Dy
> CONFIG_INFINIBAND_USER_MEM=3Dy
> CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
> # CONFIG_INFINIBAND_ADDR_TRANS is not set
> # CONFIG_INFINIBAND_MTHCA is not set
> CONFIG_INFINIBAND_QIB=3Dy
> # CONFIG_MLX4_INFINIBAND is not set
> CONFIG_INFINIBAND_NES=3Dy
> # CONFIG_INFINIBAND_NES_DEBUG is not set
> # CONFIG_INFINIBAND_OCRDMA is not set
> # CONFIG_INFINIBAND_USNIC is not set
> # CONFIG_INFINIBAND_IPOIB is not set
> # CONFIG_INFINIBAND_OPA_VNIC is not set
> CONFIG_INFINIBAND_RDMAVT=3Dy
> # CONFIG_RDMA_RXE is not set
> CONFIG_INFINIBAND_HFI1=3Dy
> # CONFIG_HFI1_DEBUG_SDMA_ORDER is not set
> CONFIG_SDMA_VERBOSITY=3Dy
> # CONFIG_INFINIBAND_BNXT_RE is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_SYSTOHC_DEVICE=3D"rtc0"
> CONFIG_RTC_DEBUG=3Dy
> # CONFIG_RTC_NVMEM is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> # CONFIG_RTC_INTF_DEV is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_ABB5ZES3=3Dy
> CONFIG_RTC_DRV_ABX80X=3Dy
> CONFIG_RTC_DRV_DS1307=3Dy
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> # CONFIG_RTC_DRV_DS1374 is not set
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_MAX6900=3Dy
> CONFIG_RTC_DRV_MAX8998=3Dy
> CONFIG_RTC_DRV_MAX8997=3Dy
> CONFIG_RTC_DRV_RS5C372=3Dy
> # CONFIG_RTC_DRV_ISL1208 is not set
> CONFIG_RTC_DRV_ISL12022=3Dy
> CONFIG_RTC_DRV_X1205=3Dy
> # CONFIG_RTC_DRV_PCF8523 is not set
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> # CONFIG_RTC_DRV_PCF8563 is not set
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=3Dy
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> # CONFIG_RTC_DRV_BQ32K is not set
> CONFIG_RTC_DRV_TPS65910=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> # CONFIG_RTC_DRV_FM3130 is not set
> CONFIG_RTC_DRV_RX8010=3Dy
> # CONFIG_RTC_DRV_RX8581 is not set
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dy
> # CONFIG_RTC_DRV_RV8803 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> CONFIG_RTC_DRV_M41T94=3Dy
> CONFIG_RTC_DRV_DS1302=3Dy
> CONFIG_RTC_DRV_DS1305=3Dy
> # CONFIG_RTC_DRV_DS1343 is not set
> CONFIG_RTC_DRV_DS1347=3Dy
> # CONFIG_RTC_DRV_DS1390 is not set
> CONFIG_RTC_DRV_MAX6916=3Dy
> CONFIG_RTC_DRV_R9701=3Dy
> CONFIG_RTC_DRV_RX4581=3Dy
> CONFIG_RTC_DRV_RX6110=3Dy
> CONFIG_RTC_DRV_RS5C348=3Dy
> CONFIG_RTC_DRV_MAX6902=3Dy
> CONFIG_RTC_DRV_PCF2123=3Dy
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> # CONFIG_RTC_DRV_DS3232 is not set
> CONFIG_RTC_DRV_PCF2127=3Dy
> CONFIG_RTC_DRV_RV3029C2=3Dy
> CONFIG_RTC_DRV_RV3029_HWMON=3Dy
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> # CONFIG_RTC_DRV_DS1286 is not set
> CONFIG_RTC_DRV_DS1511=3Dy
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> # CONFIG_RTC_DRV_DS17485 is not set
> CONFIG_RTC_DRV_DS17885=3Dy
> CONFIG_RTC_DS1685_PROC_REGS=3Dy
> CONFIG_RTC_DRV_DS1742=3Dy
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9063=3Dy
> # CONFIG_RTC_DRV_STK17TA8 is not set
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> # CONFIG_RTC_DRV_MSM6242 is not set
> CONFIG_RTC_DRV_BQ4802=3Dy
> CONFIG_RTC_DRV_RP5C01=3Dy
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_PCF50633=3Dy
> CONFIG_RTC_DRV_CROS_EC=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_FTRTC010=3Dy
> CONFIG_RTC_DRV_PCAP=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_ALTERA_MSGDMA=3Dy
> CONFIG_INTEL_IDMA64=3Dy
> CONFIG_INTEL_IOATDMA=3Dy
> # CONFIG_QCOM_HIDMA_MGMT is not set
> CONFIG_QCOM_HIDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> # CONFIG_DW_DMAC_PCI is not set
> CONFIG_HSU_DMA=3Dy
> =

> #
> # DMA Clients
> #
> # CONFIG_ASYNC_TX_DMA is not set
> CONFIG_DMATEST=3Dy
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_DCA=3Dy
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_HD44780=3Dy
> CONFIG_KS0108=3Dy
> CONFIG_KS0108_PORT=3D0x378
> CONFIG_KS0108_DELAY=3D2
> CONFIG_CFAG12864B=3Dy
> CONFIG_CFAG12864B_RATE=3D20
> # CONFIG_IMG_ASCII_LCD is not set
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> CONFIG_CHARLCD=3Dy
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> CONFIG_UIO_PCI_GENERIC=3Dy
> CONFIG_UIO_NETX=3Dy
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VFIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VBOXGUEST=3Dy
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_BALLOON is not set
> # CONFIG_VIRTIO_INPUT is not set
> CONFIG_VIRTIO_MMIO=3Dy
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> # CONFIG_STAGING is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_LAPTOP is not set
> # CONFIG_CHROMEOS_PSTORE is not set
> CONFIG_CHROMEOS_TBMC=3Dy
> CONFIG_CROS_EC_I2C=3Dy
> CONFIG_CROS_EC_SPI=3Dy
> # CONFIG_CROS_EC_LPC is not set
> CONFIG_CROS_EC_PROTO=3Dy
> CONFIG_CROS_KBD_LED_BACKLIGHT=3Dy
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> CONFIG_COMMON_CLK_MAX9485=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> CONFIG_COMMON_CLK_SI544=3Dy
> CONFIG_COMMON_CLK_CDCE706=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_PWM=3Dy
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_MAILBOX is not set
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_DEBUGFS=3Dy
> CONFIG_IOMMU_DEFAULT_PASSTHROUGH=3Dy
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_AMD_IOMMU=3Dy
> CONFIG_AMD_IOMMU_V2=3Dy
> # CONFIG_AMD_IOMMU_DEBUGFS is not set
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> CONFIG_IRQ_REMAP=3Dy
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> =

> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=3Dy
> # CONFIG_RPMSG_CHAR is not set
> CONFIG_RPMSG_VIRTIO=3Dy
> # CONFIG_SOUNDWIRE is not set
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
> # NXP/Freescale QorIQ SoC drivers
> #
> =

> #
> # i.MX SoC drivers
> #
> =

> #
> # Qualcomm SoC drivers
> #
> CONFIG_SOC_TI=3Dy
> =

> #
> # Xilinx SoC drivers
> #
> CONFIG_XILINX_VCU=3Dy
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_INTEL_INT3496 is not set
> # CONFIG_EXTCON_MAX14577 is not set
> CONFIG_EXTCON_MAX3355=3Dy
> CONFIG_EXTCON_MAX77843=3Dy
> CONFIG_EXTCON_MAX8997=3Dy
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> CONFIG_EXTCON_USB_GPIO=3Dy
> # CONFIG_EXTCON_USBC_CROS_EC is not set
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> # CONFIG_IIO_BUFFER_HW_CONSUMER is not set
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> CONFIG_IIO_TRIGGERED_EVENT=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16201=3Dy
> CONFIG_ADIS16209=3Dy
> # CONFIG_BMA180 is not set
> # CONFIG_BMA220 is not set
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_BMC150_ACCEL_I2C=3Dy
> CONFIG_BMC150_ACCEL_SPI=3Dy
> # CONFIG_DA280 is not set
> # CONFIG_DA311 is not set
> # CONFIG_DMARD09 is not set
> CONFIG_DMARD10=3Dy
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> CONFIG_IIO_CROS_EC_ACCEL_LEGACY=3Dy
> CONFIG_KXSD9=3Dy
> CONFIG_KXSD9_SPI=3Dy
> CONFIG_KXSD9_I2C=3Dy
> CONFIG_KXCJK1013=3Dy
> CONFIG_MC3230=3Dy
> CONFIG_MMA7455=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7455_SPI=3Dy
> CONFIG_MMA7660=3Dy
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dy
> CONFIG_MMA9551=3Dy
> # CONFIG_MMA9553 is not set
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> CONFIG_SCA3000=3Dy
> CONFIG_STK8312=3Dy
> # CONFIG_STK8BA50 is not set
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> CONFIG_AD7266=3Dy
> # CONFIG_AD7291 is not set
> # CONFIG_AD7298 is not set
> CONFIG_AD7476=3Dy
> # CONFIG_AD7766 is not set
> CONFIG_AD7791=3Dy
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> # CONFIG_AD7923 is not set
> # CONFIG_AD799X is not set
> CONFIG_CC10001_ADC=3Dy
> # CONFIG_DA9150_GPADC is not set
> CONFIG_HI8435=3Dy
> CONFIG_HX711=3Dy
> CONFIG_LTC2471=3Dy
> CONFIG_LTC2485=3Dy
> CONFIG_LTC2497=3Dy
> CONFIG_MAX1027=3Dy
> CONFIG_MAX11100=3Dy
> CONFIG_MAX1118=3Dy
> # CONFIG_MAX1363 is not set
> # CONFIG_MAX9611 is not set
> CONFIG_MCP320X=3Dy
> # CONFIG_MCP3422 is not set
> CONFIG_MEN_Z188_ADC=3Dy
> # CONFIG_NAU7802 is not set
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADC0832=3Dy
> CONFIG_TI_ADC084S021=3Dy
> CONFIG_TI_ADC12138=3Dy
> # CONFIG_TI_ADC108S102 is not set
> CONFIG_TI_ADC128S052=3Dy
> CONFIG_TI_ADC161S626=3Dy
> # CONFIG_TI_ADS7950 is not set
> CONFIG_TI_TLC4541=3Dy
> CONFIG_TWL4030_MADC=3Dy
> CONFIG_TWL6030_GPADC=3Dy
> =

> #
> # Analog Front Ends
> #
> =

> #
> # Amplifiers
> #
> CONFIG_AD8366=3Dy
> =

> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=3Dy
> # CONFIG_BME680 is not set
> CONFIG_CCS811=3Dy
> CONFIG_IAQCORE=3Dy
> # CONFIG_VZ89X is not set
> CONFIG_IIO_CROS_EC_SENSORS_CORE=3Dy
> CONFIG_IIO_CROS_EC_SENSORS=3Dy
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> CONFIG_IIO_MS_SENSORS_I2C=3Dy
> =

> #
> # SSP Sensor Common
> #
> CONFIG_IIO_SSP_SENSORS_COMMONS=3Dy
> CONFIG_IIO_SSP_SENSORHUB=3Dy
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Counters
> #
> =

> #
> # Digital to analog converters
> #
> CONFIG_AD5064=3Dy
> CONFIG_AD5360=3Dy
> CONFIG_AD5380=3Dy
> # CONFIG_AD5421 is not set
> CONFIG_AD5446=3Dy
> CONFIG_AD5449=3Dy
> CONFIG_AD5592R_BASE=3Dy
> # CONFIG_AD5592R is not set
> CONFIG_AD5593R=3Dy
> # CONFIG_AD5504 is not set
> CONFIG_AD5624R_SPI=3Dy
> # CONFIG_LTC2632 is not set
> CONFIG_AD5686=3Dy
> CONFIG_AD5686_SPI=3Dy
> # CONFIG_AD5696_I2C is not set
> CONFIG_AD5755=3Dy
> CONFIG_AD5758=3Dy
> CONFIG_AD5761=3Dy
> CONFIG_AD5764=3Dy
> CONFIG_AD5791=3Dy
> CONFIG_AD7303=3Dy
> CONFIG_CIO_DAC=3Dy
> CONFIG_AD8801=3Dy
> CONFIG_DS4424=3Dy
> CONFIG_M62332=3Dy
> # CONFIG_MAX517 is not set
> CONFIG_MCP4725=3Dy
> # CONFIG_MCP4922 is not set
> CONFIG_TI_DAC082S085=3Dy
> CONFIG_TI_DAC5571=3Dy
> =

> #
> # IIO dummy driver
> #
> CONFIG_IIO_SIMPLE_DUMMY=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> =

> #
> # Frequency Synthesizers DDS/PLL
> #
> =

> #
> # Clock Generator/Distribution
> #
> CONFIG_AD9523=3Dy
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # CONFIG_ADF4350 is not set
> =

> #
> # Digital gyroscope sensors
> #
> # CONFIG_ADIS16080 is not set
> CONFIG_ADIS16130=3Dy
> # CONFIG_ADIS16136 is not set
> # CONFIG_ADIS16260 is not set
> CONFIG_ADXRS450=3Dy
> # CONFIG_BMG160 is not set
> CONFIG_HID_SENSOR_GYRO_3D=3Dy
> CONFIG_MPU3050=3Dy
> CONFIG_MPU3050_I2C=3Dy
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> =

> #
> # Health Sensors
> #
> =

> #
> # Heart Rate Monitors
> #
> # CONFIG_AFE4403 is not set
> CONFIG_AFE4404=3Dy
> # CONFIG_MAX30100 is not set
> CONFIG_MAX30102=3Dy
> =

> #
> # Humidity sensors
> #
> CONFIG_AM2315=3Dy
> CONFIG_DHT11=3Dy
> # CONFIG_HDC100X is not set
> # CONFIG_HID_SENSOR_HUMIDITY is not set
> # CONFIG_HTS221 is not set
> # CONFIG_HTU21 is not set
> # CONFIG_SI7005 is not set
> # CONFIG_SI7020 is not set
> =

> #
> # Inertial measurement units
> #
> # CONFIG_ADIS16400 is not set
> CONFIG_ADIS16480=3Dy
> CONFIG_BMI160=3Dy
> CONFIG_BMI160_I2C=3Dy
> CONFIG_BMI160_SPI=3Dy
> # CONFIG_KMX61 is not set
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_INV_MPU6050_I2C=3Dy
> CONFIG_INV_MPU6050_SPI=3Dy
> CONFIG_IIO_ST_LSM6DSX=3Dy
> CONFIG_IIO_ST_LSM6DSX_I2C=3Dy
> CONFIG_IIO_ST_LSM6DSX_SPI=3Dy
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> # CONFIG_ADJD_S311 is not set
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> # CONFIG_APDS9960 is not set
> # CONFIG_BH1750 is not set
> # CONFIG_BH1780 is not set
> CONFIG_CM32181=3Dy
> # CONFIG_CM3232 is not set
> # CONFIG_CM3323 is not set
> CONFIG_CM36651=3Dy
> CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dy
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_SENSORS_ISL29018=3Dy
> # CONFIG_SENSORS_ISL29028 is not set
> # CONFIG_ISL29125 is not set
> # CONFIG_HID_SENSOR_ALS is not set
> # CONFIG_HID_SENSOR_PROX is not set
> # CONFIG_JSA1212 is not set
> # CONFIG_RPR0521 is not set
> # CONFIG_SENSORS_LM3533 is not set
> CONFIG_LTR501=3Dy
> CONFIG_LV0104CS=3Dy
> # CONFIG_MAX44000 is not set
> CONFIG_OPT3001=3Dy
> CONFIG_PA12203001=3Dy
> # CONFIG_SI1133 is not set
> # CONFIG_SI1145 is not set
> # CONFIG_STK3310 is not set
> CONFIG_ST_UVIS25=3Dy
> CONFIG_ST_UVIS25_I2C=3Dy
> CONFIG_ST_UVIS25_SPI=3Dy
> CONFIG_TCS3414=3Dy
> CONFIG_TCS3472=3Dy
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dy
> # CONFIG_TSL2772 is not set
> CONFIG_TSL4531=3Dy
> CONFIG_US5182D=3Dy
> # CONFIG_VCNL4000 is not set
> CONFIG_VEML6070=3Dy
> CONFIG_VL6180=3Dy
> CONFIG_ZOPT2201=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> CONFIG_BMC150_MAGN=3Dy
> CONFIG_BMC150_MAGN_I2C=3Dy
> CONFIG_BMC150_MAGN_SPI=3Dy
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> CONFIG_SENSORS_HMC5843_I2C=3Dy
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> =

> #
> # Multiplexers
> #
> =

> #
> # Inclinometer sensors
> #
> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
> # CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
> =

> #
> # Triggers - standalone
> #
> # CONFIG_IIO_HRTIMER_TRIGGER is not set
> # CONFIG_IIO_INTERRUPT_TRIGGER is not set
> CONFIG_IIO_TIGHTLOOP_TRIGGER=3Dy
> CONFIG_IIO_SYSFS_TRIGGER=3Dy
> =

> #
> # Digital potentiometers
> #
> CONFIG_AD5272=3Dy
> # CONFIG_DS1803 is not set
> CONFIG_MAX5481=3Dy
> # CONFIG_MAX5487 is not set
> CONFIG_MCP4018=3Dy
> CONFIG_MCP4131=3Dy
> CONFIG_MCP4531=3Dy
> CONFIG_TPL0102=3Dy
> =

> #
> # Digital potentiostats
> #
> # CONFIG_LMP91000 is not set
> =

> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=3Dy
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> CONFIG_BMP280_SPI=3Dy
> CONFIG_IIO_CROS_EC_BARO=3Dy
> CONFIG_HID_SENSOR_PRESS=3Dy
> CONFIG_HP03=3Dy
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> CONFIG_MPL115_SPI=3Dy
> CONFIG_MPL3115=3Dy
> CONFIG_MS5611=3Dy
> CONFIG_MS5611_I2C=3Dy
> CONFIG_MS5611_SPI=3Dy
> CONFIG_MS5637=3Dy
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> CONFIG_IIO_ST_PRESS_SPI=3Dy
> # CONFIG_T5403 is not set
> CONFIG_HP206C=3Dy
> # CONFIG_ZPA2326 is not set
> =

> #
> # Lightning sensors
> #
> # CONFIG_AS3935 is not set
> =

> #
> # Proximity and distance sensors
> #
> CONFIG_ISL29501=3Dy
> CONFIG_LIDAR_LITE_V2=3Dy
> CONFIG_RFD77402=3Dy
> CONFIG_SRF04=3Dy
> CONFIG_SX9500=3Dy
> CONFIG_SRF08=3Dy
> =

> #
> # Resolver to digital converters
> #
> CONFIG_AD2S1200=3Dy
> =

> #
> # Temperature sensors
> #
> CONFIG_MAXIM_THERMOCOUPLE=3Dy
> CONFIG_HID_SENSOR_TEMP=3Dy
> # CONFIG_MLX90614 is not set
> CONFIG_MLX90632=3Dy
> CONFIG_TMP006=3Dy
> CONFIG_TMP007=3Dy
> CONFIG_TSYS01=3Dy
> CONFIG_TSYS02D=3Dy
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_CRC=3Dy
> # CONFIG_PWM_CROS_EC is not set
> CONFIG_PWM_LP3943=3Dy
> CONFIG_PWM_LPSS=3Dy
> # CONFIG_PWM_LPSS_PCI is not set
> CONFIG_PWM_LPSS_PLATFORM=3Dy
> CONFIG_PWM_PCA9685=3Dy
> # CONFIG_PWM_TWL is not set
> CONFIG_PWM_TWL_LED=3Dy
> =

> #
> # IRQ chip support
> #
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_RESET_TI_SYSCON=3Dy
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> CONFIG_FMC_TRIVIAL=3Dy
> # CONFIG_FMC_WRITE_EEPROM is not set
> # CONFIG_FMC_CHARDEV is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> # CONFIG_PHY_CPCAP_USB is not set
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> CONFIG_MCB_PCI=3Dy
> CONFIG_MCB_LPC=3Dy
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
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ANDROID_BINDER_DEVICES=3D"binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> CONFIG_DAX=3Dy
> # CONFIG_DEV_DAX is not set
> CONFIG_NVMEM=3Dy
> =

> #
> # HW tracing support
> #
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_ACPI is not set
> CONFIG_INTEL_TH_GTH=3Dy
> # CONFIG_INTEL_TH_MSU is not set
> CONFIG_INTEL_TH_PTI=3Dy
> # CONFIG_INTEL_TH_DEBUG is not set
> CONFIG_FPGA=3Dy
> CONFIG_ALTERA_PR_IP_CORE=3Dy
> # CONFIG_FPGA_MGR_ALTERA_PS_SPI is not set
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_MGR_XILINX_SPI=3Dy
> CONFIG_FPGA_MGR_MACHXO2_SPI=3Dy
> CONFIG_FPGA_BRIDGE=3Dy
> CONFIG_XILINX_PR_DECOUPLER=3Dy
> CONFIG_FPGA_REGION=3Dy
> # CONFIG_FPGA_DFL is not set
> CONFIG_UNISYS_VISORBUS=3Dy
> CONFIG_SIOX=3Dy
> CONFIG_SIOX_BUS_GPIO=3Dy
> # CONFIG_SLIMBUS is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> # CONFIG_FS_ENCRYPTION is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> # CONFIG_QUOTA is not set
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_DIR=3Dy
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=3Dy
> CONFIG_OVERLAY_FS_INDEX=3Dy
> CONFIG_OVERLAY_FS_XINO_AUTO=3Dy
> CONFIG_OVERLAY_FS_METACOPY=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_STATS is not set
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_FSCACHE_OBJECT_LIST=3Dy
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ECRYPT_FS=3Dy
> CONFIG_ECRYPT_FS_MESSAGING=3Dy
> # CONFIG_CRAMFS is not set
> CONFIG_PSTORE=3Dy
> # CONFIG_PSTORE_DEFLATE_COMPRESS is not set
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> CONFIG_PSTORE_LZ4HC_COMPRESS=3Dy
> CONFIG_PSTORE_842_COMPRESS=3Dy
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT=3Dy
> # CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"lz4hc"
> CONFIG_PSTORE_CONSOLE=3Dy
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> CONFIG_NFS_V2=3Dy
> CONFIG_NFS_V3=3Dy
> # CONFIG_NFS_V3_ACL is not set
> CONFIG_NFS_V4=3Dy
> # CONFIG_NFS_SWAP is not set
> # CONFIG_NFS_V4_1 is not set
> # CONFIG_ROOT_NFS is not set
> # CONFIG_NFS_FSCACHE is not set
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> # CONFIG_NFSD is not set
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dy
> # CONFIG_SUNRPC_DEBUG is not set
> CONFIG_CEPH_FS=3Dy
> # CONFIG_CEPH_FSCACHE is not set
> CONFIG_CEPH_FS_POSIX_ACL=3Dy
> CONFIG_CIFS=3Dy
> # CONFIG_CIFS_STATS2 is not set
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> CONFIG_CIFS_WEAK_PW_HASH=3Dy
> CONFIG_CIFS_UPCALL=3Dy
> # CONFIG_CIFS_XATTR is not set
> # CONFIG_CIFS_DEBUG is not set
> # CONFIG_CIFS_DFS_UPCALL is not set
> CONFIG_CIFS_FSCACHE=3Dy
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dy
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> # CONFIG_NLS_CODEPAGE_863 is not set
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> # CONFIG_NLS_CODEPAGE_866 is not set
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dy
> # CONFIG_NLS_ISO8859_1 is not set
> # CONFIG_NLS_ISO8859_2 is not set
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> # CONFIG_NLS_MAC_CYRILLIC is not set
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dy
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dy
> CONFIG_DLM=3Dy
> # CONFIG_DLM_DEBUG is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> # CONFIG_BIG_KEYS is not set
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_PAGE_TABLE_ISOLATION is not set
> CONFIG_SECURITY_INFINIBAND=3Dy
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_INTEL_TXT is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> # CONFIG_HARDENED_USERCOPY is not set
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SMACK=3Dy
> # CONFIG_SECURITY_SMACK_BRINGUP is not set
> CONFIG_SECURITY_SMACK_APPEND_SIGNALS=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> # CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_TEMPLATE=3Dy
> # CONFIG_IMA_NG_TEMPLATE is not set
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> # CONFIG_IMA_READ_POLICY is not set
> # CONFIG_IMA_APPRAISE is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_SMACK=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_DEFAULT_SECURITY=3D"smack"
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
> # CONFIG_CRYPTO_RSA is not set
> # CONFIG_CRYPTO_DH is not set
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_AEGIS128=3Dy
> CONFIG_CRYPTO_AEGIS128L=3Dy
> CONFIG_CRYPTO_AEGIS256=3Dy
> CONFIG_CRYPTO_AEGIS128_AESNI_SSE2=3Dy
> # CONFIG_CRYPTO_AEGIS128L_AESNI_SSE2 is not set
> # CONFIG_CRYPTO_AEGIS256_AESNI_SSE2 is not set
> CONFIG_CRYPTO_MORUS640=3Dy
> CONFIG_CRYPTO_MORUS640_GLUE=3Dy
> CONFIG_CRYPTO_MORUS640_SSE2=3Dy
> CONFIG_CRYPTO_MORUS1280=3Dy
> # CONFIG_CRYPTO_MORUS1280_SSE2 is not set
> # CONFIG_CRYPTO_MORUS1280_AVX2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> # CONFIG_CRYPTO_LRW is not set
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> CONFIG_CRYPTO_KEYWRAP=3Dy
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dy
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA256_SSSE3 is not set
> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
> CONFIG_CRYPTO_SHA1_MB=3Dy
> # CONFIG_CRYPTO_SHA256_MB is not set
> CONFIG_CRYPTO_SHA512_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_SM3=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> # CONFIG_CRYPTO_WP512 is not set
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64 is not set
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
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_SM4=3Dy
> CONFIG_CRYPTO_SPECK=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> # CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
> CONFIG_CRYPTO_ZSTD=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> # CONFIG_CRYPTO_DRBG_HASH is not set
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS7_MESSAGE_PARSER is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> CONFIG_CRC32_BIT=3Dy
> CONFIG_CRC64=3Dy
> CONFIG_CRC4=3Dy
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> # CONFIG_CRC8 is not set
> CONFIG_XXHASH=3Dy
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dy
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> # CONFIG_XZ_DEC_X86 is not set
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> # CONFIG_XZ_DEC_ARM is not set
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_RADIX_TREE_MULTIORDER=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_DMA_DIRECT_OPS=3Dy
> CONFIG_DMA_VIRT_OPS=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_PRIME_NUMBERS=3Dy
> CONFIG_STRING_SELFTEST=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
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
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D2048
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_STACK_VALIDATION=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> # CONFIG_MAGIC_SYSRQ_SERIAL is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=3Dy
> CONFIG_PAGE_POISONING=3Dy
> # CONFIG_PAGE_POISONING_NO_SANITY is not set
> CONFIG_PAGE_POISONING_ZERO=3Dy
> # CONFIG_DEBUG_PAGE_REF is not set
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> # CONFIG_DEBUG_OBJECTS_TIMERS is not set
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> CONFIG_SLUB_STATS=3Dy
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VM_PGFLAGS=3Dy
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> # CONFIG_KASAN is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> CONFIG_KCOV=3Dy
> # CONFIG_KCOV_INSTRUMENT_ALL is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> # CONFIG_WW_MUTEX_SELFTEST is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=3Dy
> # CONFIG_RCU_PERF_TEST is not set
> CONFIG_RCU_TORTURE_TEST=3Dy
> CONFIG_RCU_TRACE=3Dy
> CONFIG_RCU_EQS_DEBUG=3Dy
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAILSLAB is not set
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> CONFIG_FAIL_FUTEX=3Dy
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> CONFIG_LATENCYTOP=3Dy
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
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_FUNCTION_TRACER is not set
> # CONFIG_PREEMPTIRQ_EVENTS is not set
> # CONFIG_IRQSOFF_TRACER is not set
> # CONFIG_SCHED_TRACER is not set
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> # CONFIG_TRACER_SNAPSHOT is not set
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> CONFIG_PROFILE_ANNOTATED_BRANCHES=3Dy
> # CONFIG_BRANCH_TRACER is not set
> # CONFIG_STACK_TRACER is not set
> # CONFIG_UPROBE_EVENTS is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_MMIOTRACE is not set
> # CONFIG_HIST_TRIGGERS is not set
> CONFIG_TRACEPOINT_BENCHMARK=3Dy
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> CONFIG_TRACING_EVENTS_GPIO=3Dy
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_RUNTIME_TESTING_MENU is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP_CORE=3Dy
> # CONFIG_X86_PTDUMP is not set
> CONFIG_DEBUG_WX=3Dy
> # CONFIG_DOUBLEFAULT is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_DEBUG=3Dy
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
> # CONFIG_DEBUG_ENTRY is not set
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> CONFIG_X86_DEBUG_FPU=3Dy
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set


--===============5525262084409423545==--

