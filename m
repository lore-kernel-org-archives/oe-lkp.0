Content-Type: multipart/mixed; boundary="===============4558415663891116824=="
MIME-Version: 1.0
From: Baoquan He <bhe@redhat.com>
To: lkp@lists.01.org
Subject: Re: 61f7875c75 ("resource: Use list_head to link sibling resource"): BUG: unable to handle kernel paging request at ffffffe0
Date: Thu, 26 Apr 2018 11:27:14 +0800
Message-ID: <20180426032714.GB19030@localhost.localdomain>
In-Reply-To: <20180426025317.dom32bnmg4qg3zrk@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4558415663891116824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/26/18 at 10:53am, Fengguang Wu wrote:
> Hi Baoquan,
> =

> =

> This looks like a 100% reproducible error (4 out of 4):
> =

> testcase/path_params/tbox_group/run: boot/1/vm-vp-quantal-i386
> =

> 87ef12027b9b1dd0  61f7875c750d6d5e3f999c89f2
> ----------------  --------------------------
>       fail:runs  %reproduction    fail:runs
>           |             |             |
>           :4          100%           4:4     dmesg.BUG:unable_to_handle_k=
ernel
>           :4          100%           4:4     dmesg.Oops:#[##]
>           :4          100%           4:4     dmesg.EIP:__request_resource
>           :4          100%           4:4     dmesg.Kernel_panic-not_synci=
ng:Fatal_exception
> =

> So it may indicate some problem with our reproduce script or image.
> =

> Your dmesg says:
> =

>        >[    9.320297] Failed to execute /init (error -8)
>        >[    9.321178] Starting init: /sbin/init exists but couldn't exec=
ute it (error -8)
>        >[    9.322566] Starting init: /bin/sh exists but couldn't execute=
 it (error -8)
> =

> So it's likely the problem lies in image. What's the size and md5sum
> of your downloaded openwrt-trinity-i386.cgz?

Sorry, Fengguang, my testing machine located in redhat beaker system is
withdrew. I am applying a new one, will retry and check the size and
md5sum and reply asap.

> On Wed, Apr 25, 2018 at 03:39:36PM +0800, Baoquan He wrote:
> > Hi Fengguang,
> > =

> > I find a i386 system and clone git repo and insall qemu-system-x86_64,
> > then fetch the attached reproduce-openwrt-xxx.sh and config to reproduce
> > the bug, but it's not reproduced.
> > =

> > From the bug trace, I can know the root cause and make a fix, however it
> > can't be verified on my test environment.
> > =

> > Do you have suggestion about this case?
> > =

> > Thanks
> > Baoquan
> > =

> > On 04/20/18 at 06:05pm, kernel test robot wrote:
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > https://github.com/0day-ci/linux/commits/Baoquan-He/resource-Use-list=
_head-to-link-sibling-resource/20180419-223752
> > > =

> =

> > [root(a)dell-pem710-02 linux]# ~/reproduce-poenwrt.sh arch/x86/boot/bzI=
mage
> > File =E2=80=98openwrt-trinity-i386.cgz=E2=80=99 already there; not retr=
ieving.
> > =

> > warning: host doesn't support requested feature: CPUID.01H:ECX.fma [bit=
 12]
> > warning: host doesn't support requested feature: CPUID.01H:ECX.movbe [b=
it 22]
> > warning: host doesn't support requested feature: CPUID.01H:ECX.xsave [b=
it 26]
> > warning: host doesn't support requested feature: CPUID.01H:ECX.avx [bit=
 28]
> > warning: host doesn't support requested feature: CPUID.01H:ECX.f16c [bi=
t 29]
> > warning: host doesn't support requested feature: CPUID.01H:ECX.rdrand [=
bit 30]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.fsgsbase=
 [bit 0]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.bmi1 [bi=
t 3]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.hle [bit=
 4]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.avx2 [bi=
t 5]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.smep [bi=
t 7]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.bmi2 [bi=
t 8]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.erms [bi=
t 9]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.invpcid =
[bit 10]
> > warning: host doesn't support requested feature: CPUID.07H:EBX.rtm [bit=
 11]
> > warning: host doesn't support requested feature: CPUID.80000001H:ECX.ab=
m [bit 5]
> > warning: host doesn't support requested feature: CPUID.0DH:EAX.xsaveopt=
 [bit 0]
> > warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 0]
> > warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 1]
> > warning: host doesn't support requested feature: CPUID.0DH:EAX [bit 2]
> > early console in setup code
> > Probing EDD (edd=3Doff to disable)... ok
> > early console in extract_kernel
> > input_data: 0x00000000026c7295
> > input_len: 0x0000000000905b90
> > output: 0x0000000001000000
> > output_len: 0x0000000001f9c830
> > kernel_total_size: 0x0000000001d88000
> > trampoline_32bit: 0x000000000009d000
> > =

> > Decompressing Linux... Parsing ELF... done.
> > Booting the kernel.
> > [    0.000000] Linux version 4.17.0-rc2-00063-g48cc8c3cf0a1 (root(a)del=
l-pem710-02.rhts.eng.bos.redhat.com) (gcc version 7.2.1 20170915 (Red Hat 7=
.2.1-2) (GCC)) #1 SMP Wed Apr 25 03:00:44 EDT 2018
> > [    0.000000] Command line: root=3D/dev/ram0 hung_task_panic=3D1 debug=
 apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net=
.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchd=
og=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_coun=
t=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3D=
ttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw drbd.minor_count=3D8 rc=
uperf.shutdown=3D0
> > [    0.000000] x86/fpu: x87 FPU will use FXSAVE
> > [    0.000000] e820: BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000000ffdffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000000ffe0000-0x000000000fffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] r=
eserved
> > [    0.000000] debug: ignoring loglevel setting.
> > [    0.000000] bootconsole [earlyser0] enabled
> > [    0.000000] NX (Execute Disable) protection: active
> > [    0.000000] SMBIOS 2.8 present.
> > [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2=
-2.fc27 04/01/2014
> > [    0.000000] Hypervisor detected: KVM
> > [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> =
reserved
> > [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> > [    0.000000] e820: last_pfn =3D 0xffe0 max_arch_pfn =3D 0x400000000
> > [    0.000000] MTRR default type: write-back
> > [    0.000000] MTRR fixed ranges enabled:
> > [    0.000000]   00000-9FFFF write-back
> > [    0.000000]   A0000-BFFFF uncachable
> > [    0.000000]   C0000-FFFFF write-protect
> > [    0.000000] MTRR variable ranges enabled:
> > [    0.000000]   0 base 0080000000 mask FF80000000 uncachable
> > [    0.000000]   1 disabled
> > [    0.000000]   2 disabled
> > [    0.000000]   3 disabled
> > [    0.000000]   4 disabled
> > [    0.000000]   5 disabled
> > [    0.000000]   6 disabled
> > [    0.000000]   7 disabled
> > [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC=
- WT
> > [    0.000000] Base memory trampoline at [        (ptrval)] 99000 size =
24576
> > [    0.000000] BRK [0x02d63000, 0x02d63fff] PGTABLE
> > [    0.000000] BRK [0x02d64000, 0x02d64fff] PGTABLE
> > [    0.000000] BRK [0x02d65000, 0x02d65fff] PGTABLE
> > [    0.000000] BRK [0x02d66000, 0x02d66fff] PGTABLE
> > [    0.000000] RAMDISK: [mem 0x0fddb000-0x0ffdffff]
> > [    0.000000] ACPI: Early table checksum verification disabled
> > [    0.000000] ACPI: RSDP 0x00000000000F6A50 000014 (v00 BOCHS )
> > [    0.000000] ACPI: RSDT 0x000000000FFE15CE 000030 (v01 BOCHS  BXPCRSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACP 0x000000000FFE142A 000074 (v01 BOCHS  BXPCFAC=
P 00000001 BXPC 00000001)
> > [    0.000000] ACPI: DSDT 0x000000000FFE0040 0013EA (v01 BOCHS  BXPCDSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACS 0x000000000FFE0000 000040
> > [    0.000000] ACPI: APIC 0x000000000FFE151E 000078 (v01 BOCHS  BXPCAPI=
C 00000001 BXPC 00000001)
> > [    0.000000] ACPI: HPET 0x000000000FFE1596 000038 (v01 BOCHS  BXPCHPE=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] mapped APIC to ffffffffff5fd000 (        fee00000)
> > [    0.000000] No NUMA configuration found
> > [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000000ffdf=
fff]
> > [    0.000000] NODE_DATA(0) allocated [mem 0x0fdd9000-0x0fddafff]
> > [    0.000000] kvm-clock: cpu 0, msr 0:fdd7001, primary cpu clock
> > [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > [    0.000000] kvm-clock: using sched offset of 1677241986 cycles
> > [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.000000]   DMA32    [mem 0x0000000001000000-0x000000000ffdffff]
> > [    0.000000]   Normal   empty
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > [    0.000000]   node   0: [mem 0x0000000000100000-0x000000000ffdffff]
> > [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000000=
ffdffff]
> > [    0.000000] On node 0 totalpages: 65406
> > [    0.000000]   DMA zone: 64 pages used for memmap
> > [    0.000000]   DMA zone: 21 pages reserved
> > [   0.000000]   DMA zone: 3998 pages, LIFO batch:0
> > [    0.000000]   DMA32 zone: 960 pages used for memmap
> > [    0.000000]   DMA32 zone: 61408 pages, LIFO batch:15
> > [    0.000000] Reserved but unavailable: 98 pages
> > [    0.000000] ACPI: PM-Timer IO Port: 0x608
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> > [    0.000000] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GS=
I 0-23
> > [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, A=
PIC INT 02
> > [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high lev=
el)
> > [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, A=
PIC INT 05
> > [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high lev=
el)
> > [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, A=
PIC INT 09
> > [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high l=
evel)
> > [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, A=
PIC INT 0a
> > [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high l=
evel)
> > [    0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, A=
PIC INT 0b
> > [    0.000000] ACPI: IRQ0 used by override.
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 0, A=
PIC INT 01
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 0, A=
PIC INT 03
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 0, A=
PIC INT 04
> > [    0.000000] ACPI: IRQ5 used by override.
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 0, A=
PIC INT 06
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 0, A=
PIC INT 07
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 0, A=
PIC INT 08
> > [    0.000000] ACPI: IRQ9 used by override.
> > [    0.000000] ACPI: IRQ10 used by override.
> > [    0.000000] ACPI: IRQ11 used by override.
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 0, A=
PIC INT 0c
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 0, A=
PIC INT 0d
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 0, A=
PIC INT 0e
> > [    0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 0, A=
PIC INT 0f
> > [    0.000000] Using ACPI (MADT) for SMP configuration information
> > [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> > [    0.000000] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
> > [    0.000000] mapped IOAPIC to ffffffffff5fc000 (fec00000)
> > [    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
> > [    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
> > [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
> > [    0.000000] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
> > [    0.000000] e820: [mem 0x10000000-0xfeffbfff] available for PCI devi=
ces
> > [    0.000000] Booting paravirtualized kernel on KVM
> > [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycle=
s: 0xffffffff, max_idle_ns: 7645519600211568 ns
> > [    0.000000] random: get_random_bytes called from start_kernel+0x9b/0=
x4f9 with crng_init=3D0
> > [    0.000000] setup_percpu: NR_CPUS:32 nr_cpumask_bits:32 nr_cpu_ids:1=
 nr_node_ids:1
> > [    0.000000] percpu: Embedded 40 pages/cpu @        (ptrval) s132056 =
r0 d31784 u2097152
> > [    0.000000] pcpu-alloc: s132056 r0 d31784 u2097152 alloc=3D1*2097152
> > [    0.000000] pcpu-alloc: [0] 0
> > [    0.000000] KVM setup async PF for cpu 0
> > [    0.000000] kvm-stealtime: cpu 0, msr fa15180
> > [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 6=
4361
> > [    0.000000] Policy zone: DMA32
> > [    0.000000] Kernel command line: root=3D/dev/ram0 hung_task_panic=3D=
1 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D=
100 net.ifnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi=
_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.min=
or_count=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlypr=
intk=3DttyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw drbd.minor_count=
=3D8 rcuperf.shutdown=3D0
> > [    0.000000] sysrq: sysrq always enabled.
> > [    0.000000] Memory: 225012K/261624K available (16392K kernel code, 2=
171K rwdata, 5548K rodata, 1364K init, 1816K bss, 36612K reserved, 0K cma-r=
eserved)
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
1, Nodes=3D1
> > [    0.000000] Kernel/User pag tables isolation: enabled
> > [    0.004000] Hierarchical RCU implementation.
> > [    0.004000] 	RCU event tracing is enabled.
> > [    0.004000] 	RCU restricting CPUs from NR_CPUS=3D32 to nr_cpu_ids=3D=
1.
> > [    0.004000] 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_stal=
l_timeout).
> > [    0.004000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu=
_ids=3D1
> > [    0.004000] NR_IRQS: 4352, nr_irqs: 48, preallocated irqs: 16
> > [    0.004000] Console: colour VGA+ 80x25
> > [    0.004000] console [tty0] enabled
> > [    0.004000] console [ttyS0] enabled
> > [    0.004000] console [ttyS0] enabled
> > [    0.004000] bootconsole [earlyser0] disabled
> > [    0.004000] bootconsole [earlyser0] disabled
> > [    0.004000] ACPI: Core revision 20180313
> > [    0.004000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604467 ns
> > [    0.004000] hpet clockevent registered
> > [    0.004009] APIC: Switch to symmetric I/O mode setup
> > [    0.004968] enabled ExtINT on CPU#0
> > [    0.008728] ENABLING IO-APIC IRQs
> > [    0.009403] init IO_APIC IRQs
> > [    0.010031]  apic 0 pin 0 not connected
> > [    0.012020] IOAPIC[0]: Set routing entry (0-1 -> 0xef -> IRQ 1 Mode:=
0 Active:0 Dest:1)
> > [    0.013464] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:=
0 Active:0 Dest:1)
> > [    0.014918] IOAPIC[0]: Set routing entry (0-3 -> 0xef -> IRQ 3 Mode:=
0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-4 -> 0xef -> IRQ 4 Mode:=
0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-5 -> 0xef -> IRQ 5 Mode:=
1 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-6 -> 0xef -> IRQ 6 Mode:=
0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-7 -> 0xef -> IRQ 7 Mode:=
0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-8 -> 0xef -> IRQ 8 Mode:=
0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-9 -> 0xef -> IRQ 9 Mode:=
1 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-10 -> 0xef -> IRQ 10 Mod=
e:1 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-11 -> 0xef -> IRQ 11 Mod=
e:1 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-12 -> 0xef -> IRQ 12 Mod=
e:0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-13 -> 0xef -> IRQ 13 Mod=
e:0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-14 -> 0xef -> IRQ 14 Mod=
e:0 Active:0 Dest:1)
> > [    0.016000] IOAPIC[0]: Set routing entry (0-15 -> 0xef -> IRQ 15 Mod=
e:0 Active:0 Dest:1)
> > [    0.016000]  apic 0 pin 16 not connected
> > [    0.016000]  apic 0 pin 17 not connected
> > [    0.016000]  apic 0 pin 18 not connected
> > [    0.016000]  apic 0 pin 19 not connected
> > [    0.016000]  apic 0 pin 20 not connected
> > [    0.016000]  apic 0 pin 21 not connected
> > [    0.016000]  apic 0 pin 22 not connected
> > [    0.016000]  apic 0 pin 23 not connected
> > [    0.016000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin=
2=3D-1
> > [    0.016000] tsc: Detected 2393.998 MHz processor
> > [    0.016000] clocksource: tsc-early: mask: 0xffffffffffffffff max_cyc=
les: 0x22821188adc, max_idle_ns: 440795282349 ns
> > [    0.016004] Calibrating delay loop (skipped) preset value.. 4787.99 =
BogoMIPS (lpj=3D9575992)
> > [    0.017430] pid_max: default: 32768 minimum: 301
> > [    0.018344] Security Framework initialized
> > [    0.020006] Yama: becoming mindful.
> > [    0.020737] Dentry cache hash table entries: 32768 (order: 6, 262144=
 bytes)
> > [    0.021963] Inode-cache hash table entries: 16384 (order: 5, 131072 =
bytes)
> > [    0.023162] Mount-cache hash table entries: 512 (order: 0, 4096 byte=
s)
> > [    0.024012] Mountpoint-cache hash table entries: 512 (order: 0, 4096=
 bytes)
> > [    0.025614] CPU: Physical Processor ID: 0
> > [    0.026374] mce: CPU supports 10 MCE banks
> > [    0.027164] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> > [    0.028003] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> > [    0.029024] Spectre V2 : Vulnerable: Minimal generic ASM retpoline
> > [    0.043154] Freeing SMP alternatives memory: 48K
> > [    0.044968] TSC deadline timer enabled
> > [    0.045689] smpboot: CPU0: Intel Core Processor (Haswell) (family: 0=
x6, model: 0x3c, stepping: 0x4)
> > [    0.047415] Performance Events: unsupported p6 CPU model 60 no PMU d=
river, software events only.
> > [    0.048000] Hierarchical SRCU implementation.
> > [    0.050143] smp: Bringing up secondary CPUs ...
> > [    0.050966] smp: Brought up 1 node, 1 CPU
> > [    0.051707] smpboot: Max logical packages: 1
> > [    0.052006] smpboot: Total of 1 processors activated (4787.99 BogoMI=
PS)
> > [    0.053383] devtmpfs: initialized
> > [    0.055227] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 7645041785100000 ns
> > [    0.056016] futex hash table entries: 256 (order: 2, 16384 bytes)
> > [    0.057136] xor: measuring software checksum speed
> > [    0.096004]    prefetch64-sse: 12480.000 MB/sec
> > [    0.136004]    generic_sse: 10700.000 MB/sec
> > [    0.136769] xor: using function: prefetch64-sse (12480.000 MB/sec)
> > [    0.138365] NET: Registered protocol family 16
> > [    0.140187] cpuidle: using governor ladder
> > [    0.141307] ACPI: bus type PCI registered
> > [    0.142340] PCI: Using configuration type 1 for base access
> > [    0.155120] cryptd: max_cpu_qlen set to 1000
> > [    0.224010] raid6: sse2x1   gen()  6001 MB/s
> > [    0.292008] raid6: sse2x1   xor()  4382 MB/s
> > [    0.360005] raid6: sse2x2   gen()  7140 MB/s
> > [    0.428009] raid6: sse2x2   xor()  5255 MB/s
> > [    0.496011] raid6: sse2x4   gen()  8156 MB/s
> > [    0.564007] raid6: sse2x4   xor()  5485 MB/s
> > [    0.564804] raid6: using algorithm sse2x4 gen() 8156 MB/s
> > [    0.565725] raid6: .... xor() 5485 MB/s, rmw enabled
> > [    0.566622] raid6: using ssse3x2 recovery algorithm
> > [    0.567874] ACPI: Added _OSI(Module Device)
> > [    0.568006] ACPI: Added _OSI(Processor Device)
> > [    0.568821] ACPI: Added _OSI(3.0 _SCP Extensions)
> > [    0.569653] ACPI: Added _OSI(Processor Aggregator Device)
> > [    0.570592] ACPI: Added _OSI(Linux-Dell-Video)
> > [    0.581923] ACPI: 1 ACPI AML tables successfully acquired and loaded
> > [    0.585310] ACPI: Interpreter enabled
> > [    0.586069] ACPI: (supports S0 S3 S4 S5)
> > [    0.586791] ACPI: Using IOAPIC for interrupt routing
> > [    0.587740] PCI: Using host bridge windows from ACPI; if necessary, =
use "pci=3Dnocrs" and report a bug
> > [    0.588648] ACPI: Enabled 2 GPEs in block 00 to 0F
> > [    0.609336] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> > [    0.610414] acpi PNP0A03:00: _OSC: OS supports [Segments]
> > [    0.611402] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling A=
SPM
> > [    0.612054] acpi PNP0A03:00: fail to add MMCONFIG information, can't=
 access extended PCI configuration space under this bridge.
> > [    0.614128] PCI host bridge to bus 0000:00
> > [    0.614897] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wi=
ndow]
> > [    0.616009] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wi=
ndow]
> > [    0.617182] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000=
bffff window]
> > [    0.618479] pci_bus 0000:00: root bus resource [mem 0x10000000-0xfeb=
fffff window]
> > [    0.619767] pci_bus 0000:00: root bus resource [bus 00-ff]
> > [    0.620052] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> > [    0.621980] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> > [    0.625009] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> > [    0.631321] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
> > [    0.633756] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f=
0-0x01f7]
> > [    0.634973] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f=
6]
> > [    0.636007] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x017=
0-0x0177]
> > [    0.637674] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x037=
6]
> > [    0.639359] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> > [    0.640463] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by =
PIIX4 ACPI
> > [    0.641751] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by =
PIIX4 SMB
> > [    0.643631] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
> > [    0.645867] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff p=
ref]
> > [    0.649904] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
> > [    0.657346] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff p=
ref]
> > [    0.659166] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> > [    0.661226] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> > [    0.663551] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> > [    0.670981] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff p=
ref]
> > [    0.672690] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> > [    0.674479] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
> > [    0.682649] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> > [    0.684205] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> > [    0.685750] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> > [    0.687289] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> > [    0.688263] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> > [    0.690202] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> > [    0.691253] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio=
+mem,owns=3Dio+mem,locks=3Dnone
> > [    0.692007] pci 0000:00:02.0: vgaarb: bridge control possible
> > [    0.693016] vgaarb: loaded
> > [    0.694293] SCSI subsystem initialized
> > [    0.695114] libata version 3.00 loaded.
> > [    0.696000] pps_core: LinuxPPS API ver. 1 registered
> > [    0.696006] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodo=
lfo Giometti <giometti@linux.it>
> > [    0.697602] PTP clock support registered
> > [    0.698754] FPGA manager framework
> > [    0.699549] Advanced Linux Sound Architecture Driver Initialized.
> > [    0.700071] PCI: Using ACPI for IRQ routing
> > [    0.700849] PCI: pci_cache_line_size set to 64 bytes
> > [    0.701834] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> > [    0.702881] e820: reserve RAM buffer [mem 0x0ffe0000-0x0fffffff]
> > [    0.704342] dcdbas dcdbas: Dell Systems Management Base Driver (vers=
ion 5.6.0-3.2)
> > [    0.706023] clocksource: Switched to clocksource kvm-clock
> > [    0.748570] VFS: Disk quotas dquot_6.6.0
> > [    0.749384] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 =
bytes)
> > [    0.750674] FS-Cache: Loaded
> > [    0.751348] pnp: PnP ACPI init
> > [    0.752136] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (activ=
e)
> > [    0.753429] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (activ=
e)
> > [    0.754698] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (activ=
e)
> > [    0.755908] pnp 00:03: [dma 2]
> > [    0.756580] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (activ=
e)
> > [    0.757971] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (activ=
e)
> > [    0.759342] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (activ=
e)
> > [    0.761972] pnp: PnP ACPI: found 6 devices
> > [    0.772156] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xfffff=
f, max_idle_ns: 2085701024 ns
> > [    0.773702] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> > [    0.774754] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> > [    0.777138] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff w=
indow]
> > [    0.778309] pci_bus 0000:00: resource 7 [mem 0x10000000-0xfebfffff w=
indow]
> > [    0.779733] NET: Registered protocol family 2
> > [    0.780891] tcp_listen_portaddr_hash hash table entries: 256 (order:=
 0, 4096 bytes)
> > [    0.782296] TCP established hash table entries: 2048 (order: 2, 1638=
4 bytes)
> > [    0.783504] TCP bind hash table entries: 2048 (order: 3, 32768 bytes)
> > [    0.784609] TCP: Hash tables configured (established 2048 bind 2048)
> > [    0.785749] UDP hash table entries: 256 (order: 1, 8192 bytes)
> > [    0.786800] UDP-Lite hash table entries: 256 (order: 1, 8192 bytes)
> > [    0.787966] NET: Registered protocol family 1
> > [    0.789023] RPC: Registered named UNIX socket transport module.
> > [    0.790044] RPC: Registered udp transport module.
> > [    0.790863] RPC: Registered tcp transport module.
> > [    0.791704] RPC: Registered tcp NFSv4.1 backchannel transport module.
> > [    0.792813] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> > [    0.793830] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> > [    0.794848] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> > [    0.795964] pci 0000:00:02.0: Video device with shadowed ROM at [mem=
 0x000c0000-0x000dffff]
> > [    0.797441] PCI: CLS 0 bytes, default 64
> > [    0.798300] Unpacking initramfs...
> > [    0.865424] Freeing initrd memory: 2068K
> > [    0.866589] Machine check injector initialized
> > [    1.888153] tsc: Refined TSC clocksource calibration: 2393.985 MHz
> > [    1.889794] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0=
x22820552d36, max_idle_ns: 440795305269 ns
> > [    7.391922] Key type blacklist registered
> > [    7.392873] workingset: timestamp_bits=3D59 max_order=3D16 bucket_or=
der=3D0
> > [    7.402833] zbud: loaded
> > [    7.406220] squashfs: version 4.0 (2009/01/31) Phillip Lougher
> > [    7.409781] NFS: Registering the id_resolver key type
> > [    7.410710] Key type id_resolver registered
> > [    7.411469] Key type id_legacy registered
> > [    7.412919] ntfs: driver 2.1.32 [Flags: R/O].
> > [    7.414132] efs: 1.0a - http://aeschi.ch.eu.org/efs/
> > [    7.415100] jffs2: version 2.2. =C2=A9 2001-2006 Red Hat, Inc.
> > [    7.416763] QNX4 filesystem 0.2.3 registered.
> > [    7.417647] qnx6: QNX6 filesystem 1.0.0 registered.
> > [    7.418654] fuse init (API version 7.26)
> > [    7.419884] orangefs_debugfs_init: called with debug mask: :none: :0:
> > [    7.421149] orangefs_init: module version upstream loaded
> > [    7.422406] JFS: nTxBlock =3D 1774, nTxLock =3D 14195
> > [    7.424260] NILFS version 2 loaded
> > [    7.424941] befs: version: 0.9.3
> > [    7.426685] pstore: using lzo compression
> > [    7.430088] async_tx: api initialized (async)
> > [    7.430983] Block layer SCSI generic (bsg) driver version 0.4 loaded=
 (major 248)
> > [    7.432306] io scheduler noop registered (default)
> > [    7.433172] io scheduler deadline registered
> > [    7.434111] io scheduler cfq registered
> > [    7.434840] io scheduler mq-deadline registered
> > [    7.435654] io scheduler kyber registered
> > [    7.651639] String selftests succeeded
> > [    7.652895] xz_dec_test: module loaded
> > [    7.653590] xz_dec_test: Create a device node with 'mknod xz_dec_tes=
t c 247 0' and write .xz files to it.
> > [    7.655227] glob: 64 self-tests passed, 0 failed
> > [    7.656755] gpio_it87: no device
> > [    7.657885] no IO addresses supplied
> > [    7.658702] ipmi message handler version 39.2
> > [    7.659516] ipmi device interface
> > [    7.660180] IPMI System Interface driver.
> > [    7.661026] ipmi_si: Unable to find any System Interface(s)
> > [    7.662022] IPMI SSIF Interface driver
> > [    7.662753] IPMI Watchdog: driver initialized
> > [    7.663560] Copyright (C) 2004 MontaVista Software - IPMI Powerdown =
via sys_reboot.
> > [    7.665096] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/=
input/input0
> > [    7.666423] ACPI: Power Button [PWRF]
> > [    7.698359] r3964: Philips r3964 Driver $Revision: 1.10 $
> > [    7.699313] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> > [    7.724215] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 1152=
00) is a 16550A
> > [    7.727102] lp: driver loaded but no devices found
> > [    7.728149] ppdev: user-space parallel port driver
> > [    7.729051] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> > [    7.729944] smapi::smapi_init, ERROR invalid usSmapiID
> > [    7.730828] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAP=
I is not available on this machine
> > [    7.732440] mwave: mwavedd::mwave_init: Error: Failed to initialize =
board data
> > [    7.733715] mwave: mwavedd::mwave_init: Error: Failed to initialize
> > [    7.735185] parport_pc 00:04: reported by Plug and Play ACPI
> > [    7.736328] parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]
> > [    7.737485] lp0: using parport0 (interrupt-driven).
> > [    7.738379] lp0: console ready
> > [    7.740217] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolf=
o Giometti
> > [    7.741623] c2port c2port0: C2 port uc added
> > [    7.742394] c2port c2port0: uc flash has 30 blocks x 512 bytes (1536=
0 bytes total)
> > [    7.744723] hp_sw: device handler registered
> > [    7.745531] emc: device handler registered
> > [    7.746291] SCSI Media Changer driver v0.25
> > [    7.747162] osd: LOADED open-osd 0.2.1
> > [    7.748635] SSFDC read-only Flash Translation layer
> > [    7.749532] mtdoops: mtd device (mtddev=3Dname/number) must be suppl=
ied
> > [    7.750653] platform physmap-flash.0: failed to claim resource 0: [m=
em 0x08000000-0x07ffffff]
> > [    7.752208] slram: not enough parameters.
> > [    7.753704] ftl_cs: FTL header not found.
> > [    7.785351] No valid DiskOnChip devices found
> > [    7.786195] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.787789] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.789381] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.790955] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.792536] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.794166] [nandsim] warning: read_byte: unexpected data output cyc=
le, state is STATE_READY return 0x0
> > [    7.795753] nand: device found, Manufacturer ID: 0x98, Chip ID: 0x39
> > [    7.796848] nand: Toshiba NAND 128MiB 1,8V 8-bit
> > [    7.797668] nand: 128 MiB, SLC, erase size: 16 KiB, page size: 512, =
OOB size: 16
> > [    7.798974] flash size: 128 MiB
> > [    7.799598] page size: 512 bytes
> > [    7.800224] OOB area size: 16 bytes
> > [    7.800896] sector size: 16 KiB
> > [    7.801486] pages number: 262144
> > [    7.802121] pages per sector: 32
> > [    7.802721] bus width: 8
> > [    7.803231] bits in sector size: 14
> > [    7.803873] bits in page size: 9
> > [    7.804503] bits in OOB size: 4
> > [    7.805130] flash size with OOB: 135168 KiB
> > [    7.805876] page address bytes: 4
> > [    7.806523] sector address bytes: 3
> > [    7.809209] options: 0x42
> > [    7.810692] Scanning device for bad blocks
> > [    7.821089] Creating 1 MTD partitions on "NAND 128MiB 1,8V 8-bit":
> > [    7.822165] 0x000000000000-0x000008000000 : "NAND simulator partitio=
n 0"
> > [    7.824387] ftl_cs: FTL header not found.
> > [    7.825458] [nandsim] warning: CONFIG_MTD_PARTITIONED_MASTER must be=
 enabled to expose debugfs stuff
> > [    7.827039] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21=
-k8-NAPI
> > [    7.828230] e1000: Copyright (c) 1999-2006 Intel Corporation.
> > [    8.246703] PCI Interrupt Link [LNKC] enabled at IRQ 11
> > [    8.602561] e1000 0000:00:03.0 eth0: (PCI:33MHz:32-bit) 52:54:00:12:=
34:56
> > [    8.603861] e1000 0000:00:03.0 eth0: Intel(R) PRO/1000 Network Conne=
ction
> > [    8.605063] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
> > [    8.606099] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> > [    8.607151] igb: Intel(R) Gigabit Ethernet Network Driver - version =
5.4.0-k
> > [    8.608344] igb: Copyright (c) 2007-2014 Intel Corporation.
> > [    8.609343] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver - =
version 5.1.0-k
> > [    8.610656] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
> > [    8.754027] panel: panel driver registered on parport0 (io=3D0x378).
> > [    8.755572] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at=
 0x60,0x64 irq 1,12
> > [    8.758043] serio: i8042 KBD port at 0x60,0x64 irq 1
> > [    8.759065] serio: i8042 AUX port at 0x60,0x64 irq 12
> > [    8.760317] parport0: cannot grant exclusive access for device parkbd
> > [    8.826127] mousedev: PS/2 mouse device common for all mice
> > [    8.827220] evbug: Connected device: input0 (Power Button at LNXPWRB=
N/button/input0)
> > [    8.829030] input: AT Translated Set 2 keyboard as /devices/platform=
/i8042/serio0/input/input1
> > [    8.830770] evbug: Connected device: input1 (AT Translated Set 2 key=
board at isa0060/serio0/input0)
> > [    8.832878] parport0: cannot grant exclusive access for device walke=
ra0701
> > [    8.834064] walkera0701: failed to register parport device
> > [    8.835104] apanel: Fujitsu BIOS signature 'FJKEYINF' not found...
> > [    8.836680] input: PC Speaker as /devices/platform/pcspkr/input/inpu=
t3
> > [    8.837871] evbug: Connected device: input3 (PC Speaker at isa0061/i=
nput0)
> > [    8.839262] ideapad_slidebar: DMI does not match
> > [    8.840498] pps_ldisc: PPS line discipline registered
> > [    8.841430] pps_parport: parallel port PPS client
> > [    8.842314] parport0: cannot grant exclusive access for device pps_p=
arport
> > [    8.843462] pps_parport: couldn't register with parport0
> > [    8.844482] Driver for 1-wire Dallas network protocol.
> > [    8.845509] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> > [    8.846608] w1_f0d_init()
> > [    8.847944] applesmc: supported laptop not found!
> > [    8.850091] applesmc: driver init failed (ret=3D-19)!
> > [    8.852472] pc87360: PC8736x not detected, module not inserted
> > [    8.854110] intel_powerclamp: CPU does not support MWAIT
> > [    8.855646] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initiali=
sed: dm-devel(a)redhat.com
> > [    8.857418] device-mapper: multipath round-robin: version 1.2.0 load=
ed
> > [    8.858538] device-mapper: multipath queue-length: version 0.2.0 loa=
ded
> > [    8.859672] device-mapper: multipath service-time: version 0.3.0 loa=
ded
> > [    8.861136] sdhci: Secure Digital Host Controller Interface driver
> > [    8.862219] sdhci: Copyright(c) Pierre Ossman
> > [    8.863053] sdhci-pltfm: SDHCI platform and OF driver helper
> > [    8.864212] No PC Engines board detected
> > [    8.866118] hidraw: raw HID events driver (C) Jiri Kosina
> > [    8.868281] ashmem: initialized
> > [    8.868929] most_core: init()
> > [    8.869565] most_cdev: init()
> > [    8.870198] most_core: registered new core component cdev
> > [    8.871132] most_sound: init()
> > [    8.871710] most_core: registered new core component sound
> > [    8.872950] greybus: registered new driver hid
> > [    8.873772] greybus: registered new driver power_supply
> > [    8.874737] greybus: registered new driver vibrator
> > [    8.875670] greybus: registered new driver gbphy
> > [    8.876525] gb_gbphy: registered new driver gpio
> > [    8.877394] gb_gbphy: registered new driver i2c
> > [    8.878225] gb_gbphy: registered new driver pwm
> > [    8.879052] gb_gbphy: registered new driver sdio
> > [    8.879892] dell_smbios: Unable to run on non-Dell system
> > [    8.880821] hdaps: supported laptop not found!
> > [    8.881619] hdaps: driver init failed (ret=3D-19)!
> > [    8.886868] NET: Registered protocol family 10
> > [    8.888396] Segment Routing with IPv6
> > [    8.889126] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> > [    8.890552] Key type dns_resolver registered
> > [    8.891828] ... APIC ID:      00000000 (0)
> > [    8.892007] ... APIC VERSION: 01050014
> > [    8.892007] 00000000000000000000000000000000000000000000000000000000=
00000000
> > [    8.892007] 00000000000000000000000000000000000000000000000000000000=
00000000
> > [    8.892007] 00000000000000000000000000000000000000000000000000000000=
00001000
> > [    8.896999] number of MP IRQ sources: 15.
> > [    8.897750] number of IO-APIC #0 registers: 24.
> > [    8.898561] testing the IO APIC.......................
> > [    8.899485] IO APIC #0......
> > [    8.900059] .... register #00: 00000000
> > [    8.900779] .......    : physical APIC id: 00
> > [    8.901558] .......    : Delivery Type: 0
> > [    8.902305] .......    : LTS          : 0
> > [    8.903034] .... register #01: 00170011
> > [    8.903729] .......     : max redirection entries: 17
> > [    8.904611] .......     : PRQ implemented: 0
> > [    8.905392] .......     : IO APIC version: 11
> > [    8.906205] .... register #02: 00000000
> > [    8.906912] .......     : arbitration: 00
> > [    8.907657] .... IRQ redirection table:
> > [    8.908370] IOAPIC 0:
> > [    8.908871]  pin00, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.910217]  pin01, enabled , edge , high, V(24), IRR(0), S(0), logi=
cal , D(01), M(0)
> > [    8.911577]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logi=
cal , D(01), M(0)
> > [    8.912942]  pin03, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.914300]  pin04, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.915652]  pin05, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.917040]  pin06, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.918393]  pin07, enabled , edge , high, V(22), IRR(0), S(0), logi=
cal , D(01), M(0)
> > [    8.919758]  pin08, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    8.921148]  pin09, enabled , level, high, V(21), IRR(0), S(0), logi=
cal , D(01), M(0)
> > [    8.922498]  pin0a, disabled, edge , high, V(00), IRR(0), physical, =
D(00), M(0)
> > [    9.256090]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.257465]  pin0c, enabled , edge , high, V(23), IRR(0), S(0), logi=
cal , D(01), M(0)
> > [    9.258842]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.260235]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.261619]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.262989]  pin10, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.264380]  pin11, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.265759]  pin12, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.267156]  pin13, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.268543]  pin14, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.269919]  pin15, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.271306]  pin16, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.272687]  pin17, disabled, edge , high, V(00), IRR(0), S(0), phys=
ical, D(00), M(0)
> > [    9.274062] IRQ to pin mappings:
> > [    9.274667] IRQ0 -> 0:2
> > [    9.275175] IRQ1 -> 0:1
> > [    9.275672] IRQ3 -> 0:3
> > [    9.276184] IRQ4 -> 0:4
> > [    9.276685] IRQ5 -> 0:5
> > [    9.277187] IRQ6 -> 0:6
> > [    9.277704] IRQ7 -> 0:7
> > [    9.278209] IRQ8 -> 0:8
> > [    9.278702] IRQ9 -> 0:9
> > [    9.279234] IRQ10 -> 0:10
> > [    9.279755] IRQ11 -> 0:11
> > [    9.280318] IRQ12 -> 0:12
> > [    9.280845] IRQ13 -> 0:13
> > [    9.281383] IRQ14 -> 0:14
> > [    9.281928] IRQ15 -> 0:15
> > [    9.282452] .................................... done.
> > [    9.283388] sched_clock: Marking stable (9280286973, 0)->(1011361213=
5, -833325162)
> > [    9.287179] Btrfs loaded, crc32c=3Dcrc32c-generic, assert=3Don
> > [    9.288436] Key type big_key registered
> > [    9.290129] Duplicate name in testcase-data, renamed to "duplicate-n=
ame#1"
> > [    9.293303] ### dt-test ### start of unittest - you will see error m=
essages
> > [    9.294634] OF: /testcase-data/phandle-tests/consumer-a: could not g=
et #phandle-cells-missing for /testcase-data/phandle-tests/provider1
> > [    9.296659] OF: /testcase-data/phandle-tests/consumer-a: could not g=
et #phandle-cells-missing for /testcase-data/phandle-tests/provider1
> > [    9.298701] OF: /testcase-data/phandle-tests/consumer-a: could not f=
ind phandle
> > [    9.299990] OF: /testcase-data/phandle-tests/consumer-a: could not f=
ind phandle
> > [    9.301262] OF: /testcase-data/phandle-tests/consumer-a: arguments l=
onger than property
> > [    9.302624] OF: /testcase-data/phandle-tests/consumer-a: arguments l=
onger than property
> > [    9.304159] OF: /testcase-data/phandle-tests/consumer-b: could not g=
et #phandle-missing-cells for /testcase-data/phandle-tests/provider1
> > [    9.306199] OF: /testcase-data/phandle-tests/consumer-b: could not f=
ind phandle
> > [    9.307496] OF: /testcase-data/phandle-tests/consumer-b: arguments l=
onger than property
> > [    9.310010] ### dt-test ### end of unittest - 162 passed, 0 failed
> > [    9.311113] ALSA device list:
> > [    9.311689]   No soundcards found.
> > [    9.313573] Freeing unused kernel memory: 1364K
> > [    9.314400] Write protecting the kernel read-only data: 24576k
> > [    9.316096] Freeing unused kernel memory: 2016K
> > [    9.318490] Freeing unused kernel memory: 596K
> > [    9.319335] rodata_test: all tests were successful
> > [    9.320297] Failed to execute /init (error -8)
> > [    9.321178] Starting init: /sbin/init exists but couldn't execute it=
 (error -8)
> > [    9.322566] Starting init: /bin/sh exists but couldn't execute it (e=
rror -8)
> > [    9.323782] Kernel panic - not syncing: No working init found.  Try =
passing init=3D option to kernel. See Linux Documentation/admin-guide/init.=
rst for guidance.
> > [    9.326151] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc2-000=
63-g48cc8c3cf0a1 #1
> > [    9.327535] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-2.fc27 04/01/2014
> > [    9.329053] Call Trace:
> > [    9.329559]  dump_stack+0x8e/0xd5
> > [    9.330198]  ? rest_init+0xa0/0xd0
> > [    9.330847]  panic+0xe4/0x216
> > [    9.331433]  ? rest_init+0xd0/0xd0
> > [    9.332101]  kernel_init+0xe6/0x100
> > [    9.332761]  ret_from_fork+0x3a/0x50
> > [    9.345765] Kernel Offset: disabled
>=20

--===============4558415663891116824==--

