Content-Type: multipart/mixed; boundary="===============5644355062759965160=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [RCU] BUG: sleeping function called from invalid context at kernel/rcu/update.c:871
Date: Wed, 30 Jul 2014 08:53:32 -0700
Message-ID: <20140730155332.GN11241@linux.vnet.ibm.com>
In-Reply-To: <20140730034047.GA16537@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============5644355062759965160==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 11:40:47AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu_t=
asks.2014.07.28d
> commit bd14ddc45614b61210fdf0ee4e94152948dd9d5e
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Mon Jul 28 12:41:25 2014 -0700
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Mon Jul 28 14:57:56 2014 -0700
> =

>     rcu: Make RCU-tasks track exiting tasks
>     =

>     This commit adds synchronization with exiting tasks, so that RCU-tasks
>     avoids waiting on tasks that no longer exist.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>     =

>     Conflicts:
>     	kernel/rcu/update.c
> =

> +------------------------------------------------------------------------=
--+------------+------------+
> |                                                                        =
  | 4e73c5aafb | bd14ddc456 |
> +------------------------------------------------------------------------=
--+------------+------------+
> | boot_successes                                                         =
  | 60         | 0          |
> | boot_failures                                                          =
  | 0          | 20         |
> | BUG:sleeping_function_called_from_invalid_context_at_kernel/rcu/update.=
c | 0          | 20         |
> | backtrace:do_group_exit                                                =
  | 0          | 20         |
> | backtrace:SyS_exit_group                                               =
  | 0          | 20         |
> | backtrace:do_exit                                                      =
  | 0          | 0          |
> +------------------------------------------------------------------------=
--+------------+------------+
> =

> [    4.702913] Freeing unused kernel memory: 2000K (ffff88000200c000 - ff=
ff880002200000)
> [    4.730428] Freeing unused kernel memory: 1880K (ffff88000262a000 - ff=
ff880002800000)
> [    4.770934] random: init urandom read with 6 bits of entropy available
> [    4.793994] BUG: sleeping function called from invalid context at kern=
el/rcu/update.c:871
> [    4.802080] in_atomic(): 1, irqs_disabled(): 0, pid: 94, name: hostname
> [    4.808864] CPU: 0 PID: 94 Comm: hostname Not tainted 3.16.0-rc1-00010=
-gbd14ddc #1
> [    4.814520] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [    4.821278]  ffff88000f2acac0 ffff88001322fe88 ffffffff81fdcc15 ffff88=
000f2acad0
> [    4.829295]  ffff88001322fe98 ffffffff810cc549 ffff88001322feb0 ffffff=
ff811099f9
> [    4.837254]  ffff88000f2ad0d8 ffff88001322fec0 ffffffff81110a01 ffff88=
001322ff38
> [    4.845685] Call Trace:
> [    4.849022]  [<ffffffff81fdcc15>] dump_stack+0x85/0xba
> [    4.853129]  [<ffffffff810cc549>] __might_sleep+0x129/0x180

OK, looks like I need to invoke exit_rcu_tasks() a few lines earlier
in do_exit().  Good catch!

							Thanx, Paul

> [    4.857319]  [<ffffffff811099f9>] exit_rcu_tasks+0x29/0xa0
> [    4.861615]  [<ffffffff81110a01>] exit_rcu+0x11/0x20
> [    4.865672]  [<ffffffff81097e65>] do_exit+0xa05/0xfc0
> [    4.870864]  [<ffffffff810985b6>] do_group_exit+0x46/0x130
> [    4.875191]  [<ffffffff810986b7>] SyS_exit_group+0x17/0x20
> [    4.878693]  [<ffffffff81ff1ba9>] system_call_fastpath+0x16/0x1b
> [    5.081134] init: Failed to create pty - disabling logging for job
> [    5.083491] init: Temporary process spawn error: No such file or direc=
tory
> [    5.112668] init: Failed to create pty - disabling logging for job
> =

> git bisect start d4762699d270faa2e5f8cc9b4a1feefb98270e5b 64aa90f26c06e1c=
b2aacfb98a7d0eccfbd6c1a91 --
> git bisect good c34f8002be490ebe4490ed028648598c8067fff7  # 10:55     16+=
      0  Merge 'skn/cacheinfo' into devel-hourly-2014072909
> git bisect good 27df6032094f4633a974397e845f76a6ed00bf89  # 10:58     16+=
      0  Merge 'jolsa-perf/perf/ctf_convert_4' into devel-hourly-2014072909
> git bisect good 93bb3907de114a5ada548126cdd99475fd2b5ae8  # 11:27     16+=
      0  Merge 'jcmvbkbc-xtensa/xtensa-debug' into devel-hourly-2014072909
> git bisect good 8d443796938e40aeedf7e9b38d56729fc3070d18  # 12:30     16+=
      0  Merge 'wireless-testing/master' into devel-hourly-2014072909
> git bisect good e45ccc6c7f65c2d6823eaf4c082417c455b9af4b  # 12:38     16+=
      0  Merge 'robclark/msm-next' into devel-hourly-2014072909
> git bisect  bad 21fa7826ce4c9938067972a47d8fa8fdba2805a3  # 12:41      0-=
     16  Merge 'rcu/rcu/rcu_tasks' into devel-hourly-2014072909
> git bisect good 41d8e02382e1e79c17a78c0898bc938531000716  # 13:05     20+=
      0  rcutorture: Add torture tests for RCU-tasks
> git bisect good 4e73c5aafbe9108c83de0f8f5294e6ccad2e29c3  # 13:10     20+=
      0  rcu: Add stall-warning checks for RCU-tasks
> git bisect  bad ebc6436166ae583e6db906eb7ffdb1c198921380  # 13:21      0-=
      4  rcu: Improve RCU-tasks energy efficiency
> git bisect  bad bd14ddc45614b61210fdf0ee4e94152948dd9d5e  # 13:40      0-=
     20  rcu: Make RCU-tasks track exiting tasks
> # first bad commit: [bd14ddc45614b61210fdf0ee4e94152948dd9d5e] rcu: Make =
RCU-tasks track exiting tasks
> git bisect good 4e73c5aafbe9108c83de0f8f5294e6ccad2e29c3  # 13:45     60+=
      0  rcu: Add stall-warning checks for RCU-tasks
> git bisect  bad d4762699d270faa2e5f8cc9b4a1feefb98270e5b  # 14:30      0-=
     11  0day head guard for 'devel-hourly-2014072909'
> git bisect good 31dab719fa50cf56d56d3dc25980fecd336f6ca8  # 14:38     60+=
      0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto=
-2.6
> git bisect good e40cff4a7990e5d73eaad0a2f2593fe725e24cdd  # 15:26     60+=
      0  Add linux-next specific files for 20140728
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-m 320
> 	-smp 2
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
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
> 	debug
> 	apic=3Ddebug
> 	sysrq_always_enabled
> 	rcupdate.rcu_cpu_stall_timeout=3D100
> 	panic=3D10
> 	softlockup_panic=3D1
> 	nmi_watchdog=3Dpanic
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

> Thanks,
> Fengguang

> early console in setup code
> Probing EDD (edd=3Doff to disable)... ok
> early console in decompress_kernel
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.16.0-rc1-00010-gbd14ddc (kbuild(a)lkp-hsx0=
1) (gcc version 4.8.2 (Debian 4.8.2-18) ) #1 SMP Tue Jul 29 21:23:40 CST 20=
14
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=
=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 r=
w link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-hsxa1-07291824/linux=
-devel:devel-hourly-2014072909:bd14ddc45614b61210fdf0ee4e94152948dd9d5e:bis=
ect-linux-3/.vmlinuz-bd14ddc45614b61210fdf0ee4e94152948dd9d5e-2014072921244=
2-16-lkp-nex05 branch=3Dlinux-devel/devel-hourly-2014072909 BOOT_IMAGE=3D/k=
ernel/x86_64-randconfig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152948dd=
9d5e/vmlinuz-3.16.0-rc1-00010-gbd14ddc drbd.minor_count=3D8
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000013ffdfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000013ffe000-0x0000000013ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01=
/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x400000000
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
> [    0.000000]   8 disabled
> [    0.000000]   9 disabled
> [    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600=
070106
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0eb0-0x000f0ebf] mapped a=
t [ffff8800000f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x03454000, 0x03454fff] PGTABLE
> [    0.000000] BRK [0x03455000, 0x03455fff] PGTABLE
> [    0.000000] BRK [0x03456000, 0x03456fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x12600000-0x127fffff]
> [    0.000000]  [mem 0x12600000-0x127fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x125fffff]
> [    0.000000]  [mem 0x10000000-0x125fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x0fffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x12800000-0x13ffdfff]
> [    0.000000]  [mem 0x12800000-0x13dfffff] page 2M
> [    0.000000]  [mem 0x13e00000-0x13ffdfff] page 4k
> [    0.000000] BRK [0x03457000, 0x03457fff] PGTABLE
> [    0.000000] cma: CMA: reserved 16 MiB at 11800000
> [    0.000000] RAMDISK: [mem 0x1293d000-0x13feffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0D00 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000013FFFC2A 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000013FFF1C0 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000013FFE040 001180 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000013FFE000 000040
> [    0.000000] ACPI: SSDT 0x0000000013FFF234 00093E (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000013FFFB72 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000013FFFBF2 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x0000000013ffdff=
f]
> [    0.000000] Initmem setup node 0 [mem 0x00000000-0x13ffdfff]
> [    0.000000]   NODE_DATA [mem 0x13ff9000-0x13ffdfff]
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ff8001, primary cpu clock
> [    0.000000]  [ffffea0000000000-ffffea00005fffff] PMD -> [ffff880010a00=
000-ffff880010ffffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81820
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1216 pages used for memmap
> [    0.000000]   DMA32 zone: 77822 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
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
> [    0.000000] ACPI: IRQ2 used by override.
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
> [    0.000000] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 26 pages/cpu @ffff880011600000 s73792 r81=
92 d24512 u1048576
> [    0.000000] pcpu-alloc: s73792 r8192 d24512 u1048576 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1160cf00
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.  To=
tal pages: 80519
> [    0.000000] Policy zone: DMA32
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-hsxa1-07291824/=
linux-devel:devel-hourly-2014072909:bd14ddc45614b61210fdf0ee4e94152948dd9d5=
e:bisect-linux-3/.vmlinuz-bd14ddc45614b61210fdf0ee4e94152948dd9d5e-20140729=
212442-16-lkp-nex05 branch=3Dlinux-devel/devel-hourly-2014072909 BOOT_IMAGE=
=3D/kernel/x86_64-randconfig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152=
948dd9d5e/vmlinuz-3.16.0-rc1-00010-gbd14ddc drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Calgary: detecting Calgary via BIOS EBDA area
> [    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - baili=
ng!
> [    0.000000] Memory: 243912K/327280K available (16344K kernel code, 493=
5K rwdata, 4264K rodata, 1124K init, 6520K bss, 83368K reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:4352 nr_irqs:512 16
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.16.0-rc1-00010-gbd14ddc (kbuild(a)lkp-hsx0=
1) (gcc version 4.8.2 (Debian 4.8.2-18) ) #1 SMP Tue Jul 29 21:23:40 CST 20=
14
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=
=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 r=
w link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-hsxa1-07291824/linux=
-devel:devel-hourly-2014072909:bd14ddc45614b61210fdf0ee4e94152948dd9d5e:bis=
ect-linux-3/.vmlinuz-bd14ddc45614b61210fdf0ee4e94152948dd9d5e-2014072921244=
2-16-lkp-nex05 branch=3Dlinux-devel/devel-hourly-2014072909 BOOT_IMAGE=3D/k=
ernel/x86_64-randconfig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152948dd=
9d5e/vmlinuz-3.16.0-rc1-00010-gbd14ddc drbd.minor_count=3D8
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000013ffdfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000013ffe000-0x0000000013ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01=
/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x400000000
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
> [    0.000000]   8 disabled
> [    0.000000]   9 disabled
> [    0.000000] x86 PAT enabled: cpu 0, old 0x7040600070406, new 0x7010600=
070106
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0eb0-0x000f0ebf] mapped a=
t [ffff8800000f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x03454000, 0x03454fff] PGTABLE
> [    0.000000] BRK [0x03455000, 0x03455fff] PGTABLE
> [    0.000000] BRK [0x03456000, 0x03456fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x12600000-0x127fffff]
> [    0.000000]  [mem 0x12600000-0x127fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x125fffff]
> [    0.000000]  [mem 0x10000000-0x125fffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x0fffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x12800000-0x13ffdfff]
> [    0.000000]  [mem 0x12800000-0x13dfffff] page 2M
> [    0.000000]  [mem 0x13e00000-0x13ffdfff] page 4k
> [    0.000000] BRK [0x03457000, 0x03457fff] PGTABLE
> [    0.000000] cma: CMA: reserved 16 MiB at 11800000
> [    0.000000] RAMDISK: [mem 0x1293d000-0x13feffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0D00 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000013FFFC2A 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000013FFF1C0 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000013FFE040 001180 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000013FFE000 000040
> [    0.000000] ACPI: SSDT 0x0000000013FFF234 00093E (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000013FFFB72 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000013FFFBF2 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x0000000013ffdff=
f]
> [    0.000000] Initmem setup node 0 [mem 0x00000000-0x13ffdfff]
> [    0.000000]   NODE_DATA [mem 0x13ff9000-0x13ffdfff]
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ff8001, primary cpu clock
> [    0.000000]  [ffffea0000000000-ffffea00005fffff] PMD -> [ffff880010a00=
000-ffff880010ffffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81820
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1216 pages used for memmap
> [    0.000000]   DMA32 zone: 77822 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
> [    0.000000] ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
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
> [    0.000000] ACPI: IRQ2 used by override.
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
> [    0.000000] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 26 pages/cpu @ffff880011600000 s73792 r81=
92 d24512 u1048576
> [    0.000000] pcpu-alloc: s73792 r8192 d24512 u1048576 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1160cf00
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.  To=
tal pages: 80519
> [    0.000000] Policy zone: DMA32
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-hsxa1-07291824/=
linux-devel:devel-hourly-2014072909:bd14ddc45614b61210fdf0ee4e94152948dd9d5=
e:bisect-linux-3/.vmlinuz-bd14ddc45614b61210fdf0ee4e94152948dd9d5e-20140729=
212442-16-lkp-nex05 branch=3Dlinux-devel/devel-hourly-2014072909 BOOT_IMAGE=
=3D/kernel/x86_64-randconfig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152=
948dd9d5e/vmlinuz-3.16.0-rc1-00010-gbd14ddc drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Calgary: detecting Calgary via BIOS EBDA area
> [    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - baili=
ng!
> [    0.000000] Memory: 243912K/327280K available (16344K kernel code, 493=
5K rwdata, 4264K rodata, 1124K init, 6520K bss, 83368K reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:4352 nr_irqs:512 16
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] console [ttyS0] enabled
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 1994.997 MHz processor
> [    0.003000] Calibrating delay loop (skipped) preset value.. 3989.99 Bo=
goMIPS (lpj=3D1994997)
> [    0.004010] pid_max: default: 32768 minimum: 301
> [    0.005058] ACPI: Core revision 20140424
> [    0.033412] ACPI: All ACPI Tables successfully acquired
> [    0.035256] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.036391] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.037198] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
> [    0.038025] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.041159] Initializing cgroup subsys net_cls
> [    0.042032] Initializing cgroup subsys blkio
> [    0.043025] Initializing cgroup subsys debug
> [    0.044197] mce: CPU supports 10 MCE banks
> [    0.046064] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.046064] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.046064] tlb_flushall_shift: 6
> [    0.048126] Freeing SMP alternatives memory: 36K (ffffffff82dec000 - f=
fffffff82df5000)
> [    0.056202] Getting VERSION: 1050014
> [    0.057021] Getting VERSION: 1050014
> [    0.058019] Getting ID: 0
> [    0.059032] Getting ID: ff000000
> [    0.060027] Getting LVT0: 8700
> [    0.061016] Getting LVT1: 8400
> [    0.062128] enabled ExtINT on CPU#0
> [    0.065457] ENABLING IO-APIC IRQs
> [    0.066016] init IO_APIC IRQs
> [    0.067010]  apic 0 pin 0 not connected
> [    0.068029] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.069048] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.070060] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.071047] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.072042] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.073044] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.074044] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.075053] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.076042] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.077042] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.078044] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.079041] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.080047] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.081043] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.082042] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.083038]  apic 0 pin 16 not connected
> [    0.084007]  apic 0 pin 17 not connected
> [    0.085007]  apic 0 pin 18 not connected
> [    0.086007]  apic 0 pin 19 not connected
> [    0.087006]  apic 0 pin 20 not connected
> [    0.088006]  apic 0 pin 21 not connected
> [    0.089006]  apic 0 pin 22 not connected
> [    0.090007]  apic 0 pin 23 not connected
> [    0.091265] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.092006] smpboot: CPU0: Intel Common KVM processor (fam: 0f, model:=
 06, stepping: 01)
> [    0.096006] Using local APIC timer interrupts.
> [    0.096006] calibrating APIC timer ...
> [    0.098000] ... lapic delta =3D 6249661
> [    0.098000] ... PM-Timer delta =3D 357934
> [    0.098000] ... PM-Timer result ok
> [    0.098000] ..... delta 6249661
> [    0.098000] ..... mult: 268420896
> [    0.098000] ..... calibration result: 999945
> [    0.098000] ..... CPU clock speed is 1994.0819 MHz.
> [    0.098000] ..... host bus clock speed is 999.0945 MHz.
> [    0.098193] Performance Events: unsupported Netburst CPU model 6 no PM=
U driver, software events only.
> [    0.105076] x86: Booting SMP configuration:
> [    0.106022] .... node  #0, CPUs:      #1
> [    0.104637] kvm-clock: cpu 1, msr 0:13ff8041, secondary cpu clock
> [    0.104637] masked ExtINT on CPU#1
> [    0.122192] x86: Booted up 1 node, 2 CPUs
> [    0.123018] smpboot: Total of 2 processors activated (7979.98 BogoMIPS)
> [    0.123045] KVM setup async PF for cpu 1
> [    0.123059] kvm-stealtime: cpu 1, msr 1170cf00
> [    0.128020] devtmpfs: initialized
> [    0.130768] gcov: version magic: 0x3430382a
> [    0.134211] xor: measuring software checksum speed
> [    0.145039]    prefetch64-sse:  6060.000 MB/sec
> [    0.156017]    generic_sse:  5280.000 MB/sec
> [    0.157010] xor: using function: prefetch64-sse (6060.000 MB/sec)
> [    0.158042] prandom: seed boundary self test passed
> [    0.161370] prandom: 100 self tests passed
> [    0.162709] regulator-dummy: no parameters
> [    0.164129] NET: Registered protocol family 16
> [    0.166818] cpuidle: using governor ladder
> [    0.167018] cpuidle: using governor menu
> [    0.169136] ACPI: bus type PCI registered
> [    0.171005] PCI: Using configuration type 1 for base access
> [    0.173203] mtrr: your CPUs had inconsistent variable MTRR settings
> [    0.174005] mtrr: your CPUs had inconsistent MTRRdefType settings
> [    0.175005] mtrr: probably your BIOS does not setup all CPUs.
> [    0.176005] mtrr: corrected configuration.
> [    0.226090] raid6: sse2x1     757 MB/s
> [    0.244021] raid6: sse2x2     937 MB/s
> [    0.262053] raid6: sse2x4     929 MB/s
> [    0.263009] raid6: using algorithm sse2x2 (937 MB/s)
> [    0.264008] raid6: using intx1 recovery algorithm
> [    0.268025] ACPI: Added _OSI(Module Device)
> [    0.269008] ACPI: Added _OSI(Processor Device)
> [    0.270007] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.272008] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.296461] ACPI: Interpreter enabled
> [    0.297058] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S1_] (20140424/hwxface-580)
> [    0.300026] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S2_] (20140424/hwxface-580)
> [    0.303060] ACPI: (supports S0 S3 S5)
> [    0.304008] ACPI: Using IOAPIC for interrupt routing
> [    0.305167] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.336039] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.337047] acpi PNP0A03:00: _OSC: OS supports [Segments]
> [    0.339051] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.342250] PCI host bridge to bus 0000:00
> [    0.343014] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.344016] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.345014] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff]
> [    0.346017] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff]
> [    0.347017] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf]
> [    0.348015] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff]
> [    0.349019] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff]
> [    0.350015] pci_bus 0000:00: root bus resource [mem 0x14000000-0xfebff=
fff]
> [    0.351115] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.353846] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.356309] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.362011] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
> [    0.365056] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    0.366009] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.367011] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    0.368009] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.370850] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.372083] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    0.373031] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    0.375161] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.378022] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    0.381020] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    0.392032] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    0.395210] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.398014] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    0.402010] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    0.414000] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    0.417553] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> [    0.419010] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
> [    0.435155] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> [    0.440190] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> [    0.446036] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> [    0.452132] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> [    0.456435] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> [    0.463000] ACPI: Enabled 16 GPEs in block 00 to 0F
> [    0.464396] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    0.465008] vgaarb: loaded
> [    0.466007] vgaarb: bridge control possible 0000:00:02.0
> [    0.470503] SCSI subsystem initialized
> [    0.471133] libata version 3.00 loaded.
> [    0.472602] pps_core: LinuxPPS API ver. 1 registered
> [    0.473007] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.474070] PTP clock support registered
> [    0.476167] PCI: Using ACPI for IRQ routing
> [    0.477010] PCI: pci_cache_line_size set to 64 bytes
> [    0.478259] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.479030] e820: reserve RAM buffer [mem 0x13ffe000-0x13ffffff]
> [    0.481444] Bluetooth: Core ver 2.19
> [    0.482069] NET: Registered protocol family 31
> [    0.483006] Bluetooth: HCI device and connection manager initialized
> [    0.484029] Bluetooth: HCI socket layer initialized
> [    0.485020] Bluetooth: L2CAP socket layer initialized
> [    0.486061] Bluetooth: SCO socket layer initialized
> [    0.487031] NET: Registered protocol family 8
> [    0.488007] NET: Registered protocol family 20
> [    0.492531] Switched to clocksource kvm-clock
> [    0.495401] pnp: PnP ACPI init
> [    0.496919] ACPI: bus type PNP registered
> [    0.498789] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:3)
> [    0.508625] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.524318] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:3)
> [    0.527716] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.530317] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:3)
> [    0.533671] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.536369] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:3)
> [    0.539656] pnp 00:03: [dma 2]
> [    0.541209] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.543900] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:3)
> [    0.547256] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.549937] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:3)
> [    0.553340] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.557964] pnp: PnP ACPI: found 6 devices
> [    0.559659] ACPI: bus type PNP unregistered
> [    0.585260] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.587400] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff]
> [    0.589668] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff]
> [    0.591972] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf]
> [    0.594092] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff]
> [    0.596232] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff]
> [    0.598291] pci_bus 0000:00: resource 10 [mem 0x14000000-0xfebfffff]
> [    0.600387] NET: Registered protocol family 1
> [    0.601960] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.603898] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.605796] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.607759] pci 0000:00:02.0: Boot video device
> [    0.609479] PCI: CLS 0 bytes, default 64
> [    0.619527] Trying to unpack rootfs image as initramfs...
> [    2.360489] Freeing initrd memory: 23244K (ffff88001293d000 - ffff8800=
13ff0000)
> [    2.377624] camellia-x86_64: performance on this CPU would be suboptim=
al: disabling camellia-x86_64.
> [    2.381314] sha1_ssse3: Neither AVX nor AVX2 nor SSSE3 is available/us=
able.
> [    2.383820] sha256_ssse3: Neither AVX nor SSSE3 is available/usable.
> [    2.390327] AVX or AES-NI instructions are not detected.
> [    2.392693] AVX instructions are not detected.
> [    2.394865] AVX instructions are not detected.
> [    2.396934] AVX2 or AES-NI instructions are not detected.
> [    2.400518] futex hash table entries: 512 (order: 3, 32768 bytes)
> [    2.403289] Initialise system trusted keyring
> [    3.370397] tsc: Refined TSC clocksource calibration: 1994.996 MHz
> [    3.651229] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    3.678931] VFS: Disk quotas dquot_6.5.2
> [    3.680865] Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    3.689743] QNX4 filesystem 0.2.3 registered.
> [    3.692383] JFS: nTxBlock =3D 2215, nTxLock =3D 17723
> [    3.708424] msgmni has been set to 553
> [    3.715030] NET: Registered protocol family 38
> [    3.716840] Key type asymmetric registered
> [    3.718707] Asymmetric key parser 'x509' registered
> [    3.720736] bounce: pool size: 64 pages
> [    3.722894] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 251)
> [    3.735120] io scheduler noop registered (default)
> [    3.736957] test_string_helpers: Running tests...
> [    3.741711] hgafb: HGA card not detected.
> [    3.743451] hgafb: probe of hgafb.0 failed with error -22
> [    3.761511] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    3.764116] ACPI: Power Button [PWRF]
> [    3.942802] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    3.998094] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    4.015605] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw=
2 Exp $
> [    4.017740] ac.o: No PCI boards found.
> [    4.019116] ac.o: For an ISA board you must supply memory and irq para=
meters.
> [    4.021518] Non-volatile memory driver v1.3
> [    4.029999] ppdev: user-space parallel port driver
> [    4.031789] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    4.037156] Linux agpgart interface v0.103
> [    4.039398] [drm] Initialized drm 1.1.0 20060810
> [    4.041272] [drm] radeon kernel modesetting enabled.
> [    4.043398] drm/i810 does not support SMP
> [    4.070340] brd: module loaded
> [    4.084262] loop: module loaded
> [    4.085794] mtip32xx Version 1.3.1
> [    4.087870]  nullb0: unknown partition table
> [    4.090306]  nullb1: unknown partition table
> [    4.092163] null: module loaded
> [    4.093966] Guest personality initialized and is inactive
> [    4.096252] VMCI host device registered (name=3Dvmci, major=3D10, mino=
r=3D62)
> [    4.098243] Initialized host personality
> [    4.100866] Loading iSCSI transport class v2.0-870.
> [    4.112334] alua: device handler registered
> [    4.119468] qla2xxx [0000:00:00.0]-0005: : QLogic Fibre Channel HBA Dr=
iver: 8.07.00.08-k.
> [    4.123309] mpt2sas version 16.100.00.00 loaded
> [    4.125863] GDT-HA: Storage RAID Controller Driver. Version: 3.05
> [    4.128353] 3ware 9000 Storage Controller device driver for Linux v2.2=
6.02.014.
> [    4.131952] Broadcom NetXtreme II iSCSI Driver bnx2i v2.7.6.2 (Jun 06,=
 2013)
> [    4.134600] iscsi: registered transport (bnx2i)
> [    4.141201] esas2r: driver will not be loaded because no ATTO esas2r d=
evices were found
> [    4.147318] arcnet loaded.
> [    4.148860] arcnet: COM90xx IO-mapped mode support (by David Woodhouse=
 et el.)
> [    4.151968] E-mail me if you actually test this driver, please!
> [    4.154298]  arc%d: No autoprobe for IO mapped cards; you must specify=
 the base address!
> [    4.158050] Atheros(R) L2 Ethernet Driver - version 2.2.3
> [    4.160199] Copyright (c) 2007 Atheros Corporation.
> [    4.162590] cnic: Broadcom NetXtreme II CNIC Driver cnic v2.5.20 (Marc=
h 14, 2014)
> [    4.175319] sky2: driver version 1.30
> [    4.177392] QLogic 1/10 GbE Converged/Intelligent Ethernet Driver v5.3=
.60
> [    4.180463] PPP generic driver version 2.4.2
> [    4.182575] PPP BSD Compression module registered
> [    4.184495] SLIP: version 0.8.4-NET3.019-NEWTTY (dynamic channels, max=
=3D256) (6 bit encapsulation enabled).
> [    4.188645] hdlc: HDLC support module revision 1.22
> [    4.191121] adummy: version 1.0
> [    4.193081] Fusion MPT base driver 3.04.20
> [    4.194863] Copyright (c) 1999-2008 LSI Corporation
> [    4.196938] Fusion MPT SPI Host driver 3.04.20
> [    4.198949] Fusion MPT misc device (ioctl) driver 3.04.20
> [    4.201401] mptctl: Registered with Fusion MPT base driver
> [    4.203602] mptctl: /dev/mptctl @ (major,minor=3D10,220)
> [    4.210983] aoe: AoE v85 initialised.
> [    4.215941] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    4.220909] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    4.222997] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    4.226695] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    4.243191] sdhci: Secure Digital Host Controller Interface driver
> [    4.248622] sdhci: Copyright(c) Pierre Ossman
> [    4.253492] wbsd: Winbond W83L51xD SD/MMC card interface driver
> [    4.259028] wbsd: Copyright(c) Pierre Ossman
> [    4.263211] sdhci-pltfm: SDHCI platform and OF driver helper
> [    4.288144] panel: driver version 0.9.5 not yet registered
> [    4.294493] cxt1e1: No boards found
> [    4.298530] input: Speakup as /devices/virtual/input/input3
> [    4.308910] initialized device: /dev/synth, node (MAJOR 10, MINOR 25)
> [    4.316654] speakup 3.1.6: initialized
> [    4.320528] synth name on entry is: (null)
> [    4.328112] ashmem: initialized
> [    4.329697] logger: created 256K log 'log_main'
> [    4.331919] logger: created 256K log 'log_events'
> [    4.333978] logger: created 256K log 'log_radio'
> [    4.336038] logger: created 256K log 'log_system'
> [    4.338272] FPGA DOWNLOAD --->
> [    4.339596] FPGA image file name: xlinx_fpga_firmware.bit
> [    4.341864] GPIO INIT FAIL!!
> [    4.345972] intel_rapl: driver does not support CPU family 15 model 6
> [    4.350425] oprofile: using NMI interrupt.
> [    4.354180] NET: Registered protocol family 15
> [    4.358634] NET: Registered protocol family 4
> [    4.362734] NET: Registered protocol family 5
> [    4.367259] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [    4.371376] Bluetooth: BNEP filters: protocol multicast
> [    4.375403] Bluetooth: BNEP socket layer initialized
> [    4.379325] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
> [    4.383552] Bluetooth: HIDP socket layer initialized
> [    4.396996] lec:lane_module_init: lec.c: initialized
> [    4.399980] NET4: DECnet for Linux: V.2.5.68s (C) 1995-2003 Linux DECn=
et Project Team
> [    4.409950] DECnet: Routing cache hash table of 1024 buckets, 16Kbytes
> [    4.412484] NET: Registered protocol family 12
> [    4.414448] 9pnet: Installing 9P2000 support
> [    4.423508] NET: Registered protocol family 36
> [    4.428651] batman_adv: B.A.T.M.A.N. advanced 2014.3.0 (compatibility =
version 15) loaded
> [    4.435888] mpls_gso: MPLS GSO support
> [    4.438649] =

> [    4.438649] printing PIC contents
> [    4.440719] ... PIC  IMR: ffff
> [    4.441693] ... PIC  IRR: 1013
> [    4.443317] ... PIC  ISR: 0000
> [    4.444590] ... PIC ELCR: 0c00
> [    4.453199] printing local APIC contents on CPU#0/0:
> [    4.454183] ... APIC ID:      00000000 (0)
> [    4.454183] ... APIC VERSION: 01050014
> [    4.454183] ... APIC TASKPRI: 00000000 (00)
> [    4.454183] ... APIC PROCPRI: 00000000
> [    4.454183] ... APIC LDR: 01000000
> [    4.454183] ... APIC DFR: ffffffff
> [    4.454183] ... APIC SPIV: 000001ff
> [    4.454183] ... APIC ISR field:
> [    4.454183] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    4.454183] ... APIC TMR field:
> [    4.454183] 0000000002000000000000000000000000000000000000000000000000=
000000
> [    4.454183] ... APIC IRR field:
> [    4.454183] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    4.454183] ... APIC ESR: 00000000
> [    4.454183] ... APIC ICR: 000008fd
> [    4.454183] ... APIC ICR2: 02000000
> [    4.454183] ... APIC LVTT: 000000ef
> [    4.454183] ... APIC LVTPC: 00010000
> [    4.454183] ... APIC LVT0: 00010700
> [    4.454183] ... APIC LVT1: 00000400
> [    4.454183] ... APIC LVTERR: 000000fe
> [    4.454183] ... APIC TMICT: 01a94235
> [    4.454183] ... APIC TMCCT: 0157779b
> [    4.454183] ... APIC TDCR: 00000003
> [    4.454183] =

> [    4.533011] number of MP IRQ sources: 15.
> [    4.534818] number of IO-APIC #0 registers: 24.
> [    4.536740] testing the IO APIC.......................
> [    4.538918] IO APIC #0......
> [    4.540306] .... register #00: 00000000
> [    4.542056] .......    : physical APIC id: 00
> [    4.543962] .......    : Delivery Type: 0
> [    4.545693] .......    : LTS          : 0
> [    4.547449] .... register #01: 00170011
> [    4.549266] .......     : max redirection entries: 17
> [    4.551369] .......     : PRQ implemented: 0
> [    4.553202] .......     : IO APIC version: 11
> [    4.555059] .... register #02: 00000000
> [    4.556722] .......     : arbitration: 00
> [    4.558471] .... IRQ redirection table:
> [    4.560138] 1    0    0   0   0    0    0    00
> [    4.562031] 0    0    0   0   0    1    1    31
> [    4.563927] 0    0    0   0   0    1    1    30
> [    4.565762] 0    0    0   0   0    1    1    33
> [    4.567526] 1    0    0   0   0    1    1    34
> [    4.569210] 1    1    0   0   0    1    1    35
> [    4.570920] 0    0    0   0   0    1    1    36
> [    4.572490] 0    0    0   0   0    1    1    37
> [    4.574180] 0    0    0   0   0    1    1    38
> [    4.576220] 0    1    0   0   0    1    1    39
> [    4.578135] 1    1    0   0   0    1    1    3A
> [    4.579820] 1    1    0   0   0    1    1    3B
> [    4.581650] 0    0    0   0   0    1    1    3C
> [    4.583607] 0    0    0   0   0    1    1    3D
> [    4.585739] 0    0    0   0   0    1    1    3E
> [    4.587642] 0    0    0   0   0    1    1    3F
> [    4.589559] 1    0    0   0   0    0    0    00
> [    4.591524] 1    0    0   0   0    0    0    00
> [    4.593380] 1    0    0   0   0    0    0    00
> [    4.595320] 1    0    0   0   0    0    0    00
> [    4.597256] 1    0    0   0   0    0    0    00
> [    4.599195] 1    0    0   0   0    0    0    00
> [    4.601367] 1    0    0   0   0    0    0    00
> [    4.603600] 1    0    0   0   0    0    0    00
> [    4.605813] IRQ to pin mappings:
> [    4.607259] IRQ0 -> 0:2
> [    4.609034] IRQ1 -> 0:1
> [    4.610869] IRQ3 -> 0:3
> [    4.612718] IRQ4 -> 0:4
> [    4.614592] IRQ5 -> 0:5
> [    4.616408] IRQ6 -> 0:6
> [    4.618218] IRQ7 -> 0:7
> [    4.620073] IRQ8 -> 0:8
> [    4.621672] IRQ9 -> 0:9
> [    4.623210] IRQ10 -> 0:10
> [    4.624709] IRQ11 -> 0:11
> [    4.626484] IRQ12 -> 0:12
> [    4.628095] IRQ13 -> 0:13
> [    4.629738] IRQ14 -> 0:14
> [    4.631653] IRQ15 -> 0:15
> [    4.633654] .................................... done.
> [    4.636895] Loading compiled-in X.509 certificates
> [    4.642322] Loaded X.509 cert 'Magrathea: Glacier signing key: de0e73d=
cd1d4fb71cabd58b0275980997a5773be'
> [    4.660278] Btrfs loaded, assert=3Don, integrity-checker=3Don
> [    4.670234] hd: no drives specified - use hd=3Dcyl,head,sectors on ker=
nel command line
> [    4.680123] Freeing unused kernel memory: 1124K (ffffffff82cd3000 - ff=
ffffff82dec000)
> [    4.683295] Write protecting the kernel read-only data: 24576k
> [    4.702913] Freeing unused kernel memory: 2000K (ffff88000200c000 - ff=
ff880002200000)
> [    4.730428] Freeing unused kernel memory: 1880K (ffff88000262a000 - ff=
ff880002800000)
> [    4.770934] random: init urandom read with 6 bits of entropy available
> [    4.793994] BUG: sleeping function called from invalid context at kern=
el/rcu/update.c:871
> [    4.802080] in_atomic(): 1, irqs_disabled(): 0, pid: 94, name: hostname
> [    4.808864] CPU: 0 PID: 94 Comm: hostname Not tainted 3.16.0-rc1-00010=
-gbd14ddc #1
> [    4.814520] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [    4.821278]  ffff88000f2acac0 ffff88001322fe88 ffffffff81fdcc15 ffff88=
000f2acad0
> [    4.829295]  ffff88001322fe98 ffffffff810cc549 ffff88001322feb0 ffffff=
ff811099f9
> [    4.837254]  ffff88000f2ad0d8 ffff88001322fec0 ffffffff81110a01 ffff88=
001322ff38
> [    4.845685] Call Trace:
> [    4.849022]  [<ffffffff81fdcc15>] dump_stack+0x85/0xba
> [    4.853129]  [<ffffffff810cc549>] __might_sleep+0x129/0x180
> [    4.857319]  [<ffffffff811099f9>] exit_rcu_tasks+0x29/0xa0
> [    4.861615]  [<ffffffff81110a01>] exit_rcu+0x11/0x20
> [    4.865672]  [<ffffffff81097e65>] do_exit+0xa05/0xfc0
> [    4.870864]  [<ffffffff810985b6>] do_group_exit+0x46/0x130
> [    4.875191]  [<ffffffff810986b7>] SyS_exit_group+0x17/0x20
> [    4.878693]  [<ffffffff81ff1ba9>] system_call_fastpath+0x16/0x1b
> [    5.081134] init: Failed to create pty - disabling logging for job
> [    5.083491] init: Temporary process spawn error: No such file or direc=
tory
> [    5.112668] init: Failed to create pty - disabling logging for job
> [    5.116411] init: Temporary process spawn error: No such file or direc=
tory
> [    5.218761] init: Failed to create pty - disabling logging for job
> [    5.220984] init: Temporary process spawn error: No such file or direc=
tory
> [    5.227731] init: Failed to create pty - disabling logging for job
> [    5.230430] init: Temporary process spawn error: No such file or direc=
tory
> [    5.365865] init: Failed to create pty - disabling logging for job
> [    5.368282] init: Temporary process spawn error: No such file or direc=
tory
> [    5.381860] init: Failed to create pty - disabling logging for job
> [    5.397554] init: Failed to create pty - disabling logging for job
> [    5.407596] init: Failed to create pty - disabling logging for job
> [    5.420115] init: Failed to create pty - disabling logging for job
> [    5.439304] init: Failed to create pty - disabling logging for job
> [    5.455575] init: Failed to create pty - disabling logging for job
> [    5.463590] init: Failed to create pty - disabling logging for job
> [    5.847252] BUG: sleeping function called from invalid context at kern=
el/rcu/update.c:871
> [    5.847254] in_atomic(): 1, irqs_disabled(): 0, pid: 223, name: blkid
> [    6.233627] init: Failed to create pty - disabling logging for job
> [    6.252822] init: Failed to create pty - disabling logging for job
> [    6.408431] init: Failed to create pty - disabling logging for job
> [    6.449882] init: Failed to create pty - disabling logging for job
> [    6.850709] BUG: sleeping function called from invalid context at kern=
el/rcu/update.c:871
> [    6.867929] in_atomic(): 1, irqs_disabled(): 0, pid: 336, name: dd
> [    6.955156] init: Failed to create pty - disabling logging for job
> [    6.984268] init: Failed to create pty - disabling logging for job
> [    7.018709] init: Failed to create pty - disabling logging for job
> [    7.025327] init: Failed to create pty - disabling logging for job
> [    7.049876] init: Failed to create pty - disabling logging for job
> Kernel tests: Boot OK!
> [    7.477133] init: Failed to create pty - disabling logging for job
> [    7.510609] init: Failed to create pty - disabling logging for job
> [    7.528460] init: Failed to create pty - disabling logging for job
> [    7.563764] init: Failed to create pty - disabling logging for job
> =

> Elapsed time: 15
> qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/x86_64-randconf=
ig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152948dd9d5e/vmlinuz-3.16.0-r=
c1-00010-gbd14ddc -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 d=
ebug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100=
 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=3D0 c=
onsole=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=
=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-hsxa1-07291824/linux-devel=
:devel-hourly-2014072909:bd14ddc45614b61210fdf0ee4e94152948dd9d5e:bisect-li=
nux-3/.vmlinuz-bd14ddc45614b61210fdf0ee4e94152948dd9d5e-20140729212442-16-l=
kp-nex05 branch=3Dlinux-devel/devel-hourly-2014072909 BOOT_IMAGE=3D/kernel/=
x86_64-randconfig-hsxa1-07291824/bd14ddc45614b61210fdf0ee4e94152948dd9d5e/v=
mlinuz-3.16.0-rc1-00010-gbd14ddc drbd.minor_count=3D8'  -initrd /kernel-tes=
ts/initrd/quantal-core-x86_64.cgz -m 320 -smp 2 -net nic,vlan=3D1,model=3De=
1000 -net user,vlan=3D1 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc=
 base=3Dlocaltime -pidfile /dev/shm/kboot/pid-quantal-lkp-nex05-169 -serial=
 file:/dev/shm/kboot/serial-quantal-lkp-nex05-169 -daemonize -display none =
-monitor null =



> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 3.16.0-rc1 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
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
> CONFIG_X86_64_SMP=3Dy
> CONFIG_X86_HT=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-sa=
ved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -=
fcall-saved-r11"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
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
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
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
> CONFIG_GENERIC_IRQ_LEGACY_ALLOC_HWIRQ=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BUILD=3Dy
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
> CONFIG_NO_HZ_FULL_SYSIDLE=3Dy
> CONFIG_NO_HZ_FULL_SYSIDLE_SMALL=3D8
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_PREEMPT_RCU is not set
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> CONFIG_RCU_USER_QS=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> CONFIG_RCU_FANOUT_EXACT=3Dy
> CONFIG_RCU_FAST_NO_HZ=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_RCU_NOCB_CPU_ALL=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_ARCH_WANTS_PROT_NUMA_PROT_NONE=3Dy
> CONFIG_ARCH_USES_NUMA_PROT_NONE=3Dy
> # CONFIG_NUMA_BALANCING_DEFAULT_ENABLED is not set
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_RESOURCE_COUNTERS is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_BLK_CGROUP=3Dy
> # CONFIG_DEBUG_BLK_CGROUP is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_IPC_NS is not set
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
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
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> # CONFIG_KALLSYMS_ALL is not set
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> CONFIG_COMPAT_BRK=3Dy
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLUB_CPU_PARTIAL is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_OPROFILE=3Dy
> CONFIG_OPROFILE_EVENT_MULTIPLEX=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_KPROBES=3Dy
> # CONFIG_JUMP_LABEL is not set
> CONFIG_OPTPROBES=3Dy
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
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
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_GCOV_PROFILE_ALL=3Dy
> CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> # CONFIG_GCOV_FORMAT_3_4 is not set
> # CONFIG_GCOV_FORMAT_4_7 is not set
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> # CONFIG_MODULE_UNLOAD is not set
> CONFIG_MODVERSIONS=3Dy
> CONFIG_MODULE_SRCVERSION_ALL=3Dy
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> CONFIG_MODULE_SIG_SHA256=3Dy
> # CONFIG_MODULE_SIG_SHA384 is not set
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha256"
> CONFIG_STOP_MACHINE=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> # CONFIG_BLK_DEV_THROTTLING is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=3Dy
> CONFIG_OSF_PARTITION=3Dy
> # CONFIG_AMIGA_PARTITION is not set
> # CONFIG_ATARI_PARTITION is not set
> # CONFIG_MAC_PARTITION is not set
> # CONFIG_MSDOS_PARTITION is not set
> CONFIG_LDM_PARTITION=3Dy
> CONFIG_LDM_DEBUG=3Dy
> # CONFIG_SGI_PARTITION is not set
> # CONFIG_ULTRIX_PARTITION is not set
> # CONFIG_SUN_PARTITION is not set
> # CONFIG_KARMA_PARTITION is not set
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> CONFIG_CMDLINE_PARTITION=3Dy
> CONFIG_BLOCK_COMPAT=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> # CONFIG_IOSCHED_DEADLINE is not set
> # CONFIG_IOSCHED_CFQ is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUE_RWLOCK=3Dy
> CONFIG_QUEUE_RWLOCK=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
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
> CONFIG_MEMTEST=3Dy
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
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_CALGARY_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> # CONFIG_MAXSMP is not set
> CONFIG_NR_CPUS=3D8
> # CONFIG_SCHED_SMT is not set
> CONFIG_SCHED_MC=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_I8K=3Dy
> CONFIG_MICROCODE=3Dm
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> # CONFIG_MICROCODE_INTEL_EARLY is not set
> # CONFIG_MICROCODE_AMD_EARLY is not set
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_DIRECT_GBPAGES=3Dy
> CONFIG_NUMA=3Dy
> # CONFIG_AMD_NUMA is not set
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NODES_SPAN_OTHER_NODES=3Dy
> # CONFIG_NUMA_EMU is not set
> CONFIG_NODES_SHIFT=3D6
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
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
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> # CONFIG_COMPACTION is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_BOUNCE=3Dy
> CONFIG_NEED_BOUNCE_POOL=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_MEMORY_FAILURE is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
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
> # CONFIG_PM_RUNTIME is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_NUMA=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_EXTLOG is not set
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
> CONFIG_CPU_IDLE_MULTIPLE_DRIVERS=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> CONFIG_INTEL_IDLE=3Dy
> =

> #
> # Memory power savings
> #
> CONFIG_I7300_IDLE_IOAT_CHANNEL=3Dy
> CONFIG_I7300_IDLE=3Dy
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dy
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> # CONFIG_PCI_IOV is not set
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> # CONFIG_PCI_IOAPIC is not set
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dm
> # CONFIG_PCMCIA is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dm
> CONFIG_YENTA_O2=3Dy
> CONFIG_YENTA_RICOH=3Dy
> CONFIG_YENTA_TI=3Dy
> CONFIG_YENTA_ENE_TUNE=3Dy
> CONFIG_YENTA_TOSHIBA=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> CONFIG_IA32_EMULATION=3Dy
> CONFIG_IA32_AOUT=3Dm
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_IOSF_MBI=3Dm
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dm
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> # CONFIG_UNIX_DIAG is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_SUB_POLICY=3Dy
> # CONFIG_XFRM_MIGRATE is not set
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> # CONFIG_INET is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> # CONFIG_NETFILTER is not set
> CONFIG_ATM=3Dy
> CONFIG_ATM_LANE=3Dy
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_HAVE_NET_DSA=3Dy
> CONFIG_NET_DSA=3Dy
> CONFIG_NET_DSA_TAG_EDSA=3Dy
> # CONFIG_VLAN_8021Q is not set
> CONFIG_DECNET=3Dy
> # CONFIG_DECNET_ROUTER is not set
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> CONFIG_IPX=3Dy
> # CONFIG_IPX_INTERN is not set
> CONFIG_ATALK=3Dy
> # CONFIG_DEV_APPLETALK is not set
> CONFIG_X25=3Dm
> CONFIG_LAPB=3Dy
> # CONFIG_PHONET is not set
> CONFIG_IEEE802154=3Dy
> CONFIG_MAC802154=3Dm
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_DNS_RESOLVER is not set
> CONFIG_BATMAN_ADV=3Dy
> # CONFIG_BATMAN_ADV_NC is not set
> CONFIG_BATMAN_ADV_MCAST=3Dy
> # CONFIG_BATMAN_ADV_DEBUG is not set
> CONFIG_OPENVSWITCH=3Dm
> CONFIG_VSOCKETS=3Dy
> # CONFIG_VMWARE_VMCI_VSOCKETS is not set
> CONFIG_NETLINK_MMAP=3Dy
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_NET_MPLS_GSO=3Dy
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> # CONFIG_BPF_JIT is not set
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_HAMRADIO is not set
> # CONFIG_CAN is not set
> CONFIG_IRDA=3Dm
> =

> #
> # IrDA protocols
> #
> CONFIG_IRLAN=3Dm
> CONFIG_IRNET=3Dm
> # CONFIG_IRCOMM is not set
> CONFIG_IRDA_ULTRA=3Dy
> =

> #
> # IrDA options
> #
> CONFIG_IRDA_CACHE_LAST_LSAP=3Dy
> CONFIG_IRDA_FAST_RR=3Dy
> # CONFIG_IRDA_DEBUG is not set
> =

> #
> # Infrared-port device drivers
> #
> =

> #
> # SIR device drivers
> #
> # CONFIG_IRTTY_SIR is not set
> =

> #
> # Dongle support
> #
> =

> #
> # FIR device drivers
> #
> CONFIG_NSC_FIR=3Dm
> # CONFIG_WINBOND_FIR is not set
> CONFIG_SMC_IRCC_FIR=3Dm
> CONFIG_ALI_FIR=3Dm
> # CONFIG_VLSI_FIR is not set
> CONFIG_VIA_FIR=3Dm
> CONFIG_BT=3Dy
> # CONFIG_BT_RFCOMM is not set
> CONFIG_BT_BNEP=3Dy
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dy
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_HCIBTSDIO=3Dm
> CONFIG_BT_HCIUART=3Dm
> # CONFIG_BT_HCIUART_H4 is not set
> # CONFIG_BT_HCIUART_BCSP is not set
> # CONFIG_BT_HCIUART_ATH3K is not set
> # CONFIG_BT_HCIUART_LL is not set
> # CONFIG_BT_HCIUART_3WIRE is not set
> # CONFIG_BT_HCIVHCI is not set
> CONFIG_BT_MRVL=3Dm
> CONFIG_BT_MRVL_SDIO=3Dm
> # CONFIG_WIRELESS is not set
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_RFKILL_REGULATOR is not set
> CONFIG_NET_9P=3Dy
> # CONFIG_NET_9P_VIRTIO is not set
> CONFIG_NET_9P_DEBUG=3Dy
> CONFIG_CAIF=3Dm
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dm
> CONFIG_CAIF_USB=3Dm
> CONFIG_NFC=3Dm
> CONFIG_NFC_DIGITAL=3Dm
> CONFIG_NFC_NCI=3Dm
> CONFIG_NFC_HCI=3Dm
> CONFIG_NFC_SHDLC=3Dy
> =

> #
> # Near Field Communication (NFC) devices
> #
> CONFIG_NFC_SIM=3Dm
> CONFIG_NFC_PN544=3Dm
> CONFIG_NFC_PN544_I2C=3Dm
> CONFIG_NFC_MICROREAD=3Dm
> CONFIG_NFC_MICROREAD_I2C=3Dm
> CONFIG_NFC_MRVL=3Dm
> # CONFIG_NFC_ST21NFCA is not set
> CONFIG_HAVE_BPF_JIT=3Dy
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
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D16
> CONFIG_CMA_SIZE_PERCENTAGE=3D10
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=3Dy
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> CONFIG_CMA_AREAS=3D7
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dm
> CONFIG_MTD=3Dm
> CONFIG_MTD_TESTS=3Dm
> # CONFIG_MTD_REDBOOT_PARTS is not set
> CONFIG_MTD_CMDLINE_PARTS=3Dm
> CONFIG_MTD_AR7_PARTS=3Dm
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dm
> CONFIG_MTD_BLOCK=3Dm
> # CONFIG_MTD_BLOCK_RO is not set
> CONFIG_FTL=3Dm
> CONFIG_NFTL=3Dm
> CONFIG_NFTL_RW=3Dy
> # CONFIG_INFTL is not set
> CONFIG_RFD_FTL=3Dm
> CONFIG_SSFDC=3Dm
> # CONFIG_SM_FTL is not set
> # CONFIG_MTD_OOPS is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
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
> # CONFIG_MTD_CFI_AMDSTD is not set
> CONFIG_MTD_CFI_STAA=3Dm
> CONFIG_MTD_CFI_UTIL=3Dm
> CONFIG_MTD_RAM=3Dm
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=3Dm
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_SBC_GXX is not set
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=3Dm
> # CONFIG_MTD_ESB2ROM is not set
> CONFIG_MTD_CK804XROM=3Dm
> # CONFIG_MTD_SCB2_FLASH is not set
> CONFIG_MTD_NETtel=3Dm
> CONFIG_MTD_L440GX=3Dm
> # CONFIG_MTD_PCI is not set
> CONFIG_MTD_GPIO_ADDR=3Dm
> CONFIG_MTD_INTEL_VR_NOR=3Dm
> # CONFIG_MTD_PLATRAM is not set
> CONFIG_MTD_LATCH_ADDR=3Dm
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dm
> # CONFIG_MTD_PMC551_BUGFIX is not set
> CONFIG_MTD_PMC551_DEBUG=3Dy
> CONFIG_MTD_SLRAM=3Dm
> CONFIG_MTD_PHRAM=3Dm
> CONFIG_MTD_MTDRAM=3Dm
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> # CONFIG_MTD_BLOCK2MTD is not set
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
> # CONFIG_MTD_SM_COMMON is not set
> CONFIG_MTD_NAND_DENALI=3Dm
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> CONFIG_MTD_NAND_GPIO=3Dm
> CONFIG_MTD_NAND_IDS=3Dm
> # CONFIG_MTD_NAND_RICOH is not set
> # CONFIG_MTD_NAND_DISKONCHIP is not set
> CONFIG_MTD_NAND_DOCG4=3Dm
> CONFIG_MTD_NAND_CAFE=3Dm
> CONFIG_MTD_NAND_NANDSIM=3Dm
> CONFIG_MTD_NAND_PLATFORM=3Dm
> CONFIG_MTD_ONENAND=3Dm
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dm
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dm
> CONFIG_MTD_QINFO_PROBE=3Dm
> CONFIG_MTD_SPI_NOR=3Dm
> # CONFIG_MTD_UBI is not set
> CONFIG_PARPORT=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dm
> # CONFIG_PARPORT_SERIAL is not set
> # CONFIG_PARPORT_PC_FIFO is not set
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dy
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dy
> CONFIG_BLK_DEV_FD=3Dm
> # CONFIG_PARIDE is not set
> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=3Dy
> CONFIG_BLK_CPQ_CISS_DA=3Dm
> # CONFIG_CISS_SCSI_TAPE is not set
> CONFIG_BLK_DEV_DAC960=3Dy
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=3Dy
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> CONFIG_BLK_DEV_NVME=3Dm
> CONFIG_BLK_DEV_SKD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> CONFIG_BLK_DEV_XIP=3Dy
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
> CONFIG_ATA_OVER_ETH=3Dy
> # CONFIG_VIRTIO_BLK is not set
> CONFIG_BLK_DEV_HD=3Dy
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dm
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dm
> # CONFIG_SGI_IOC4 is not set
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dm
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> CONFIG_CS5535_MFGPT=3Dm
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> # CONFIG_CS5535_CLOCK_EVENT_SRC is not set
> CONFIG_HP_ILO=3Dm
> # CONFIG_APDS9802ALS is not set
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dm
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dm
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dm
> CONFIG_USB_SWITCH_FSA9480=3Dy
> CONFIG_SRAM=3Dy
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> # CONFIG_EEPROM_93CX6 is not set
> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dy
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC Host Driver
> #
> CONFIG_INTEL_MIC_HOST=3Dm
> =

> #
> # Intel MIC Card Driver
> #
> CONFIG_INTEL_MIC_CARD=3Dm
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_TGT is not set
> CONFIG_SCSI_NETLINK=3Dy
> # CONFIG_SCSI_PROC_FS is not set
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> # CONFIG_CHR_DEV_ST is not set
> # CONFIG_CHR_DEV_OSST is not set
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_BLK_DEV_SR_VENDOR=3Dy
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> # CONFIG_SCSI_MULTI_LUN is not set
> # CONFIG_SCSI_CONSTANTS is not set
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> CONFIG_SCSI_FC_ATTRS=3Dy
> CONFIG_SCSI_ISCSI_ATTRS=3Dy
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> # CONFIG_SCSI_SAS_ATA is not set
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=3Dy
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_BOOT_SYSFS=3Dm
> CONFIG_SCSI_BNX2_ISCSI=3Dy
> CONFIG_SCSI_BNX2X_FCOE=3Dm
> CONFIG_BE2ISCSI=3Dm
> CONFIG_BLK_DEV_3W_XXXX_RAID=3Dm
> CONFIG_SCSI_HPSA=3Dm
> CONFIG_SCSI_3W_9XXX=3Dy
> # CONFIG_SCSI_3W_SAS is not set
> CONFIG_SCSI_ACARD=3Dm
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> CONFIG_SCSI_AIC79XX=3Dm
> CONFIG_AIC79XX_CMDS_PER_DEVICE=3D32
> CONFIG_AIC79XX_RESET_DELAY_MS=3D5000
> CONFIG_AIC79XX_DEBUG_ENABLE=3Dy
> CONFIG_AIC79XX_DEBUG_MASK=3D0
> CONFIG_AIC79XX_REG_PRETTY_PRINT=3Dy
> CONFIG_SCSI_AIC94XX=3Dm
> CONFIG_AIC94XX_DEBUG=3Dy
> CONFIG_SCSI_MVSAS=3Dy
> CONFIG_SCSI_MVSAS_DEBUG=3Dy
> # CONFIG_SCSI_MVSAS_TASKLET is not set
> CONFIG_SCSI_MVUMI=3Dy
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> CONFIG_SCSI_ESAS2R=3Dy
> # CONFIG_MEGARAID_NEWGEN is not set
> CONFIG_MEGARAID_LEGACY=3Dy
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT2SAS=3Dy
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> # CONFIG_SCSI_MPT2SAS_LOGGING is not set
> # CONFIG_SCSI_MPT3SAS is not set
> CONFIG_SCSI_UFSHCD=3Dm
> # CONFIG_SCSI_UFSHCD_PCI is not set
> CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_VMWARE_PVSCSI is not set
> CONFIG_LIBFC=3Dy
> CONFIG_LIBFCOE=3Dy
> CONFIG_FCOE=3Dy
> # CONFIG_FCOE_FNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_EATA is not set
> # CONFIG_SCSI_FUTURE_DOMAIN is not set
> CONFIG_SCSI_GDTH=3Dy
> # CONFIG_SCSI_ISCI is not set
> CONFIG_SCSI_IPS=3Dy
> CONFIG_SCSI_INITIO=3Dm
> CONFIG_SCSI_INIA100=3Dy
> CONFIG_SCSI_PPA=3Dm
> CONFIG_SCSI_IMM=3Dm
> CONFIG_SCSI_IZIP_EPP16=3Dy
> CONFIG_SCSI_IZIP_SLOW_CTR=3Dy
> CONFIG_SCSI_STEX=3Dm
> CONFIG_SCSI_SYM53C8XX_2=3Dy
> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1
> CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
> CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
> CONFIG_SCSI_SYM53C8XX_MMIO=3Dy
> CONFIG_SCSI_IPR=3Dm
> # CONFIG_SCSI_IPR_TRACE is not set
> CONFIG_SCSI_IPR_DUMP=3Dy
> CONFIG_SCSI_QLOGIC_1280=3Dy
> CONFIG_SCSI_QLA_FC=3Dy
> CONFIG_TCM_QLA2XXX=3Dm
> CONFIG_SCSI_QLA_ISCSI=3Dm
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_DC395x is not set
> CONFIG_SCSI_DC390T=3Dm
> CONFIG_SCSI_DEBUG=3Dm
> CONFIG_SCSI_PMCRAID=3Dy
> CONFIG_SCSI_PM8001=3Dy
> # CONFIG_SCSI_SRP is not set
> CONFIG_SCSI_BFA_FC=3Dm
> CONFIG_SCSI_VIRTIO=3Dm
> CONFIG_SCSI_CHELSIO_FCOE=3Dm
> CONFIG_SCSI_DH=3Dy
> # CONFIG_SCSI_DH_RDAC is not set
> CONFIG_SCSI_DH_HP_SW=3Dm
> # CONFIG_SCSI_DH_EMC is not set
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> # CONFIG_SCSI_OSD_ULD is not set
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> # CONFIG_SCSI_OSD_DEBUG is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dy
> # CONFIG_SATA_AHCI_PLATFORM is not set
> CONFIG_SATA_INIC162X=3Dy
> CONFIG_SATA_ACARD_AHCI=3Dm
> CONFIG_SATA_SIL24=3Dm
> # CONFIG_ATA_SFF is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dm
> CONFIG_MD_LINEAR=3Dm
> # CONFIG_MD_RAID0 is not set
> # CONFIG_MD_RAID1 is not set
> CONFIG_MD_RAID10=3Dm
> CONFIG_MD_RAID456=3Dm
> # CONFIG_MD_MULTIPATH is not set
> CONFIG_MD_FAULTY=3Dm
> CONFIG_BCACHE=3Dy
> CONFIG_BCACHE_DEBUG=3Dy
> CONFIG_BCACHE_CLOSURES_DEBUG=3Dy
> # CONFIG_BLK_DEV_DM is not set
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> # CONFIG_TCM_FILEIO is not set
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_TCM_FC=3Dm
> # CONFIG_ISCSI_TARGET is not set
> CONFIG_FUSION=3Dy
> CONFIG_FUSION_SPI=3Dy
> CONFIG_FUSION_FC=3Dm
> # CONFIG_FUSION_SAS is not set
> CONFIG_FUSION_MAX_SGE=3D128
> CONFIG_FUSION_CTL=3Dy
> CONFIG_FUSION_LOGGING=3Dy
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dm
> # CONFIG_I2O is not set
> # CONFIG_MACINTOSH_DRIVERS is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> # CONFIG_NET_CORE is not set
> CONFIG_ARCNET=3Dy
> # CONFIG_ARCNET_1201 is not set
> CONFIG_ARCNET_1051=3Dm
> # CONFIG_ARCNET_RAW is not set
> # CONFIG_ARCNET_CAP is not set
> CONFIG_ARCNET_COM90xx=3Dm
> CONFIG_ARCNET_COM90xxIO=3Dy
> # CONFIG_ARCNET_RIM_I is not set
> CONFIG_ARCNET_COM20020=3Dy
> CONFIG_ARCNET_COM20020_PCI=3Dm
> CONFIG_ATM_DRIVERS=3Dy
> CONFIG_ATM_DUMMY=3Dy
> CONFIG_ATM_LANAI=3Dy
> CONFIG_ATM_ENI=3Dm
> CONFIG_ATM_ENI_DEBUG=3Dy
> # CONFIG_ATM_ENI_TUNE_BURST is not set
> CONFIG_ATM_FIRESTREAM=3Dy
> CONFIG_ATM_ZATM=3Dy
> # CONFIG_ATM_ZATM_DEBUG is not set
> CONFIG_ATM_NICSTAR=3Dm
> CONFIG_ATM_NICSTAR_USE_SUNI=3Dy
> # CONFIG_ATM_NICSTAR_USE_IDT77105 is not set
> CONFIG_ATM_IDT77252=3Dm
> CONFIG_ATM_IDT77252_DEBUG=3Dy
> # CONFIG_ATM_IDT77252_RCV_ALL is not set
> CONFIG_ATM_IDT77252_USE_SUNI=3Dy
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> CONFIG_ATM_FORE200E=3Dm
> CONFIG_ATM_FORE200E_USE_TASKLET=3Dy
> CONFIG_ATM_FORE200E_TX_RETRY=3D16
> CONFIG_ATM_FORE200E_DEBUG=3D0
> CONFIG_ATM_HE=3Dy
> CONFIG_ATM_HE_USE_SUNI=3Dy
> CONFIG_ATM_SOLOS=3Dm
> =

> #
> # CAIF transport drivers
> #
> # CONFIG_CAIF_TTY is not set
> # CONFIG_CAIF_SPI_SLAVE is not set
> CONFIG_CAIF_HSI=3Dm
> CONFIG_CAIF_VIRTIO=3Dm
> CONFIG_VHOST_NET=3Dm
> CONFIG_VHOST_SCSI=3Dm
> CONFIG_VHOST_RING=3Dm
> CONFIG_VHOST=3Dm
> =

> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_NET_DSA_MV88E6XXX=3Dy
> # CONFIG_NET_DSA_MV88E6060 is not set
> # CONFIG_NET_DSA_MV88E6XXX_NEED_PPU is not set
> # CONFIG_NET_DSA_MV88E6131 is not set
> CONFIG_NET_DSA_MV88E6123_61_65=3Dy
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dm
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> # CONFIG_NET_VENDOR_ADAPTEC is not set
> # CONFIG_NET_VENDOR_ALTEON is not set
> CONFIG_ALTERA_TSE=3Dm
> CONFIG_NET_VENDOR_AMD=3Dy
> CONFIG_AMD8111_ETH=3Dm
> # CONFIG_PCNET32 is not set
> # CONFIG_NET_VENDOR_ARC is not set
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> CONFIG_ATL2=3Dy
> # CONFIG_ATL1 is not set
> CONFIG_ATL1E=3Dy
> # CONFIG_ATL1C is not set
> CONFIG_ALX=3Dm
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> CONFIG_B44=3Dm
> CONFIG_B44_PCI_AUTOSELECT=3Dy
> CONFIG_B44_PCICORE_AUTOSELECT=3Dy
> CONFIG_B44_PCI=3Dy
> CONFIG_BNX2=3Dy
> CONFIG_CNIC=3Dy
> CONFIG_TIGON3=3Dy
> # CONFIG_BNX2X is not set
> # CONFIG_NET_VENDOR_BROCADE is not set
> CONFIG_NET_CALXEDA_XGMAC=3Dm
> # CONFIG_NET_VENDOR_CHELSIO is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> CONFIG_ENIC=3Dm
> CONFIG_CX_ECAT=3Dm
> CONFIG_DNET=3Dy
> # CONFIG_NET_VENDOR_DEC is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> CONFIG_SUNDANCE=3Dm
> CONFIG_SUNDANCE_MMIO=3Dy
> # CONFIG_NET_VENDOR_EMULEX is not set
> # CONFIG_NET_VENDOR_EXAR is not set
> # CONFIG_NET_VENDOR_HP is not set
> # CONFIG_NET_VENDOR_INTEL is not set
> # CONFIG_IP1000 is not set
> CONFIG_JME=3Dm
> CONFIG_NET_VENDOR_MARVELL=3Dy
> CONFIG_MVMDIO=3Dy
> CONFIG_SKGE=3Dm
> CONFIG_SKGE_DEBUG=3Dy
> # CONFIG_SKGE_GENESIS is not set
> CONFIG_SKY2=3Dy
> CONFIG_SKY2_DEBUG=3Dy
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> CONFIG_MLX4_EN=3Dm
> CONFIG_MLX4_CORE=3Dm
> CONFIG_MLX4_DEBUG=3Dy
> # CONFIG_MLX5_CORE is not set
> # CONFIG_NET_VENDOR_MICREL is not set
> CONFIG_FEALNX=3Dm
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> CONFIG_NATSEMI=3Dy
> # CONFIG_NS83820 is not set
> # CONFIG_NET_VENDOR_8390 is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> # CONFIG_NET_PACKET_ENGINE is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> CONFIG_QLA3XXX=3Dy
> CONFIG_QLCNIC=3Dy
> CONFIG_QLCNIC_HWMON=3Dy
> # CONFIG_QLGE is not set
> CONFIG_NETXEN_NIC=3Dm
> # CONFIG_NET_VENDOR_REALTEK is not set
> # CONFIG_SH_ETH is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> CONFIG_R6040=3Dm
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SILAN=3Dy
> CONFIG_SC92031=3Dy
> CONFIG_NET_VENDOR_SIS=3Dy
> CONFIG_SIS900=3Dy
> # CONFIG_SIS190 is not set
> CONFIG_SFC=3Dm
> CONFIG_SFC_MTD=3Dy
> CONFIG_SFC_MCDI_MON=3Dy
> # CONFIG_NET_VENDOR_SMSC is not set
> CONFIG_NET_VENDOR_STMICRO=3Dy
> CONFIG_STMMAC_ETH=3Dy
> CONFIG_STMMAC_PLATFORM=3Dy
> # CONFIG_STMMAC_PCI is not set
> CONFIG_STMMAC_DEBUG_FS=3Dy
> # CONFIG_STMMAC_DA is not set
> # CONFIG_NET_VENDOR_SUN is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> CONFIG_TEHUTI=3Dm
> # CONFIG_NET_VENDOR_TI is not set
> # CONFIG_NET_VENDOR_VIA is not set
> # CONFIG_NET_VENDOR_WIZNET is not set
> CONFIG_FDDI=3Dy
> CONFIG_DEFXX=3Dm
> CONFIG_DEFXX_MMIO=3Dy
> CONFIG_SKFP=3Dm
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> =

> #
> # MII PHY device drivers
> #
> CONFIG_AT803X_PHY=3Dy
> CONFIG_AMD_PHY=3Dm
> CONFIG_MARVELL_PHY=3Dy
> # CONFIG_DAVICOM_PHY is not set
> CONFIG_QSEMI_PHY=3Dy
> CONFIG_LXT_PHY=3Dm
> # CONFIG_CICADA_PHY is not set
> CONFIG_VITESSE_PHY=3Dy
> # CONFIG_SMSC_PHY is not set
> # CONFIG_BROADCOM_PHY is not set
> CONFIG_BCM7XXX_PHY=3Dy
> # CONFIG_BCM87XX_PHY is not set
> CONFIG_ICPLUS_PHY=3Dy
> # CONFIG_REALTEK_PHY is not set
> CONFIG_NATIONAL_PHY=3Dy
> # CONFIG_STE10XP is not set
> CONFIG_LSI_ET1011C_PHY=3Dy
> CONFIG_MICREL_PHY=3Dm
> # CONFIG_FIXED_PHY is not set
> CONFIG_MDIO_BITBANG=3Dm
> CONFIG_MDIO_GPIO=3Dm
> # CONFIG_PLIP is not set
> CONFIG_PPP=3Dy
> CONFIG_PPP_BSDCOMP=3Dy
> CONFIG_PPP_DEFLATE=3Dm
> # CONFIG_PPP_FILTER is not set
> CONFIG_PPP_MPPE=3Dm
> CONFIG_PPP_MULTILINK=3Dy
> CONFIG_PPPOATM=3Dm
> CONFIG_PPPOE=3Dm
> CONFIG_PPP_ASYNC=3Dy
> CONFIG_PPP_SYNC_TTY=3Dm
> CONFIG_SLIP=3Dy
> CONFIG_SLHC=3Dy
> CONFIG_SLIP_COMPRESSED=3Dy
> # CONFIG_SLIP_SMART is not set
> CONFIG_SLIP_MODE_SLIP6=3Dy
> # CONFIG_WLAN is not set
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> CONFIG_WAN=3Dy
> # CONFIG_LANMEDIA is not set
> CONFIG_HDLC=3Dy
> CONFIG_HDLC_RAW=3Dm
> # CONFIG_HDLC_RAW_ETH is not set
> CONFIG_HDLC_CISCO=3Dy
> # CONFIG_HDLC_FR is not set
> CONFIG_HDLC_PPP=3Dy
> CONFIG_HDLC_X25=3Dm
> CONFIG_PCI200SYN=3Dy
> CONFIG_WANXL=3Dy
> # CONFIG_PC300TOO is not set
> CONFIG_FARSYNC=3Dy
> CONFIG_DSCC4=3Dm
> # CONFIG_DSCC4_PCISYNC is not set
> CONFIG_DSCC4_PCI_RST=3Dy
> # CONFIG_DLCI is not set
> CONFIG_LAPBETHER=3Dm
> CONFIG_X25_ASY=3Dm
> CONFIG_SBNI=3Dy
> # CONFIG_SBNI_MULTILINE is not set
> # CONFIG_IEEE802154_DRIVERS is not set
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
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
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TC3589X is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> CONFIG_INPUT_MOUSE=3Dy
> # CONFIG_MOUSE_PS2 is not set
> CONFIG_MOUSE_SERIAL=3Dm
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> CONFIG_MOUSE_GPIO=3Dm
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_88PM860X=3Dy
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP_I2C=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dm
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dm
> CONFIG_TOUCHSCREEN_DA9034=3Dm
> # CONFIG_TOUCHSCREEN_DA9052 is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dm
> CONFIG_TOUCHSCREEN_EETI=3Dm
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> # CONFIG_TOUCHSCREEN_GUNZE is not set
> CONFIG_TOUCHSCREEN_ELO=3Dm
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dm
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> CONFIG_TOUCHSCREEN_MMS114=3Dm
> CONFIG_TOUCHSCREEN_MTOUCH=3Dm
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dm
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dm
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dm
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dm
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> # CONFIG_TOUCHSCREEN_PIXCIR is not set
> # CONFIG_TOUCHSCREEN_WM831X is not set
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dm
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> CONFIG_TOUCHSCREEN_ST1232=3Dm
> CONFIG_TOUCHSCREEN_TPS6507X=3Dm
> CONFIG_TOUCHSCREEN_ZFORCE=3Dm
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM860X_ONKEY=3Dy
> # CONFIG_INPUT_AD714X is not set
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_PCSPKR=3Dm
> CONFIG_INPUT_MAX8925_ONKEY=3Dm
> # CONFIG_INPUT_MMA8450 is not set
> # CONFIG_INPUT_MPU3050 is not set
> # CONFIG_INPUT_GP2A is not set
> CONFIG_INPUT_GPIO_BEEPER=3Dm
> # CONFIG_INPUT_GPIO_TILT_POLLED is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dm
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_RETU_PWRBUTTON=3Dm
> # CONFIG_INPUT_TWL4030_PWRBUTTON is not set
> # CONFIG_INPUT_TWL4030_VIBRA is not set
> CONFIG_INPUT_TWL6040_VIBRA=3Dy
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PCF50633_PMU is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dm
> CONFIG_INPUT_DA9052_ONKEY=3Dy
> # CONFIG_INPUT_DA9055_ONKEY is not set
> CONFIG_INPUT_WM831X_ON=3Dm
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dm
> CONFIG_INPUT_CMA3000=3Dm
> # CONFIG_INPUT_CMA3000_I2C is not set
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dm
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_GAMEPORT=3Dm
> CONFIG_GAMEPORT_NS558=3Dm
> CONFIG_GAMEPORT_L4=3Dm
> CONFIG_GAMEPORT_EMU10K1=3Dm
> CONFIG_GAMEPORT_FM801=3Dm
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_VT_CONSOLE_SLEEP=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> CONFIG_DEVPTS_MULTIPLE_INSTANCES=3Dy
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> CONFIG_NOZOMI=3Dm
> CONFIG_N_GSM=3Dm
> # CONFIG_TRACE_SINK is not set
> # CONFIG_DEVKMEM is not set
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
> # CONFIG_SERIAL_8250_DW is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_MFD_HSU=3Dy
> # CONFIG_SERIAL_MFD_HSU_CONSOLE is not set
> CONFIG_SERIAL_UARTLITE=3Dy
> CONFIG_SERIAL_UARTLITE_CONSOLE=3Dy
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dy
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> CONFIG_SERIAL_SC16IS7XX=3Dm
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dm
> # CONFIG_SERIAL_MEN_Z135 is not set
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dm
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SI_PROBE_DEFAULTS=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> CONFIG_APPLICOM=3Dy
> CONFIG_MWAVE=3Dm
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> # CONFIG_TCG_TPM is not set
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dm
> # CONFIG_I2C_MUX is not set
> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dm
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
> CONFIG_I2C_ALI1563=3Dm
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=3Dy
> # CONFIG_I2C_I801 is not set
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> # CONFIG_I2C_NFORCE2_S4985 is not set
> CONFIG_I2C_SIS5595=3Dy
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dy
> CONFIG_I2C_VIA=3Dy
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
> CONFIG_I2C_CBUS_GPIO=3Dm
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dm
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> # CONFIG_I2C_STUB is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> CONFIG_SPMI=3Dy
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
> =

> #
> # PPS support
> #
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=3Dm
> # CONFIG_PPS_CLIENT_LDISC is not set
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> # CONFIG_PPS_CLIENT_GPIO is not set
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> =

> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_DA9052=3Dm
> CONFIG_GPIO_DA9055=3Dm
> =

> #
> # Memory mapped GPIO drivers:
> #
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> # CONFIG_GPIO_IT8761E is not set
> CONFIG_GPIO_F7188X=3Dm
> CONFIG_GPIO_SCH311X=3Dm
> CONFIG_GPIO_SCH=3Dm
> CONFIG_GPIO_ICH=3Dm
> CONFIG_GPIO_VX855=3Dm
> # CONFIG_GPIO_LYNXPOINT is not set
> =

> #
> # I2C GPIO expanders:
> #
> CONFIG_GPIO_ARIZONA=3Dy
> # CONFIG_GPIO_LP3943 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_RC5T583=3Dy
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_TC3589X=3Dy
> CONFIG_GPIO_TPS65912=3Dm
> # CONFIG_GPIO_TWL4030 is not set
> CONFIG_GPIO_TWL6040=3Dy
> CONFIG_GPIO_WM831X=3Dm
> CONFIG_GPIO_WM8350=3Dm
> # CONFIG_GPIO_ADP5588 is not set
> =

> #
> # PCI GPIO expanders:
> #
> # CONFIG_GPIO_CS5535 is not set
> CONFIG_GPIO_BT8XX=3Dm
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_INTEL_MID=3Dy
> CONFIG_GPIO_ML_IOH=3Dm
> # CONFIG_GPIO_TIMBERDALE is not set
> CONFIG_GPIO_RDC321X=3Dy
> =

> #
> # SPI GPIO expanders:
> #
> =

> #
> # AC97 GPIO expanders:
> #
> =

> #
> # LPC GPIO expanders:
> #
> CONFIG_GPIO_KEMPLD=3Dy
> =

> #
> # MODULbus GPIO expanders:
> #
> CONFIG_GPIO_JANZ_TTL=3Dy
> # CONFIG_GPIO_PALMAS is not set
> =

> #
> # USB GPIO expanders:
> #
> CONFIG_W1=3Dm
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dm
> CONFIG_W1_MASTER_DS2482=3Dm
> CONFIG_W1_MASTER_DS1WM=3Dm
> CONFIG_W1_MASTER_GPIO=3Dm
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dm
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> # CONFIG_W1_SLAVE_DS2423 is not set
> CONFIG_W1_SLAVE_DS2431=3Dm
> CONFIG_W1_SLAVE_DS2433=3Dm
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2760=3Dm
> CONFIG_W1_SLAVE_DS2780=3Dm
> # CONFIG_W1_SLAVE_DS2781 is not set
> CONFIG_W1_SLAVE_DS28E04=3Dm
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_MAX8925_POWER=3Dy
> CONFIG_WM831X_BACKUP=3Dy
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_WM8350_POWER is not set
> CONFIG_TEST_POWER=3Dm
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_BATTERY_DS2760 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dm
> CONFIG_BATTERY_SBS=3Dm
> # CONFIG_BATTERY_BQ27x00 is not set
> # CONFIG_BATTERY_DA9030 is not set
> CONFIG_BATTERY_DA9052=3Dm
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_CHARGER_88PM860X=3Dy
> CONFIG_CHARGER_PCF50633=3Dm
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_BQ2415X=3Dm
> # CONFIG_CHARGER_BQ24190 is not set
> CONFIG_CHARGER_BQ24735=3Dm
> CONFIG_CHARGER_SMB347=3Dy
> # CONFIG_CHARGER_TPS65090 is not set
> # CONFIG_POWER_RESET is not set
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dm
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dy
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> CONFIG_SENSORS_K10TEMP=3Dy
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dm
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dm
> # CONFIG_SENSORS_DS1621 is not set
> # CONFIG_SENSORS_DA9052_ADC is not set
> CONFIG_SENSORS_DA9055=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_FSCHMD=3Dm
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dm
> CONFIG_SENSORS_G762=3Dm
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IBMAEM=3Dm
> # CONFIG_SENSORS_IBMPEX is not set
> # CONFIG_SENSORS_CORETEMP is not set
> # CONFIG_SENSORS_IT87 is not set
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dm
> # CONFIG_SENSORS_LTC4151 is not set
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> # CONFIG_SENSORS_LTC4245 is not set
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dy
> # CONFIG_SENSORS_MAX197 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> CONFIG_SENSORS_MAX6642=3Dy
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_HTU21=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dm
> # CONFIG_SENSORS_LM85 is not set
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> # CONFIG_SENSORS_PC87360 is not set
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> CONFIG_SENSORS_SIS5595=3Dy
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dy
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dm
> CONFIG_SENSORS_ADS1015=3Dm
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_THMC50=3Dm
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dm
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dy
> # CONFIG_SENSORS_WM831X is not set
> # CONFIG_SENSORS_WM8350 is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> # CONFIG_ACPI_INT3403_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # Texas Instruments thermal drivers
> #
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dm
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> # CONFIG_SSB_SDIOHOST is not set
> CONFIG_SSB_DEBUG=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> CONFIG_SSB_DRIVER_PCICORE=3Dy
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> # CONFIG_BCMA_HOST_PCI is not set
> CONFIG_BCMA_HOST_SOC=3Dy
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_AXP20X is not set
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> CONFIG_PMIC_DA903X=3Dy
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_LPC_ICH=3Dm
> CONFIG_LPC_SCH=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_RETU=3Dm
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> # CONFIG_PCF50633_GPIO is not set
> CONFIG_MFD_RDC321X=3Dy
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dm
> # CONFIG_MFD_SM501 is not set
> # CONFIG_MFD_SMSC is not set
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dm
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dm
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dm
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dm
> CONFIG_MFD_TPS65218=3Dm
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_MFD_TWL4030_AUDIO is not set
> CONFIG_TWL6040_CORE=3Dy
> # CONFIG_MFD_WL1273_CORE is not set
> CONFIG_MFD_LM3533=3Dm
> CONFIG_MFD_TIMBERDALE=3Dy
> CONFIG_MFD_TC3589X=3Dy
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dm
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> CONFIG_MFD_WM8997=3Dy
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> # CONFIG_MFD_WM8994 is not set
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PM8607=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_ANATOP=3Dy
> # CONFIG_REGULATOR_AAT2870 is not set
> CONFIG_REGULATOR_BCM590XX=3Dm
> CONFIG_REGULATOR_DA903X=3Dm
> CONFIG_REGULATOR_DA9052=3Dm
> CONFIG_REGULATOR_DA9055=3Dm
> CONFIG_REGULATOR_DA9063=3Dm
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL6271A=3Dy
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dm
> # CONFIG_REGULATOR_LP872X is not set
> CONFIG_REGULATOR_LP8755=3Dm
> # CONFIG_REGULATOR_LTC3589 is not set
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dm
> CONFIG_REGULATOR_MAX8660=3Dy
> CONFIG_REGULATOR_MAX8925=3Dm
> CONFIG_REGULATOR_MAX8952=3Dm
> # CONFIG_REGULATOR_MAX8973 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> CONFIG_REGULATOR_PALMAS=3Dm
> CONFIG_REGULATOR_PCF50633=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_RC5T583=3Dm
> CONFIG_REGULATOR_S2MPA01=3Dy
> CONFIG_REGULATOR_S2MPS11=3Dy
> CONFIG_REGULATOR_S5M8767=3Dm
> CONFIG_REGULATOR_TPS51632=3Dm
> # CONFIG_REGULATOR_TPS6105X is not set
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dm
> CONFIG_REGULATOR_TPS6507X=3Dy
> CONFIG_REGULATOR_TPS65090=3Dy
> CONFIG_REGULATOR_TPS65217=3Dm
> # CONFIG_REGULATOR_TPS65912 is not set
> CONFIG_REGULATOR_TPS80031=3Dy
> CONFIG_REGULATOR_TWL4030=3Dm
> # CONFIG_REGULATOR_WM831X is not set
> # CONFIG_REGULATOR_WM8350 is not set
> CONFIG_REGULATOR_WM8400=3Dm
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_AMD64=3Dy
> CONFIG_AGP_INTEL=3Dy
> # CONFIG_AGP_SIS is not set
> CONFIG_AGP_VIA=3Dm
> CONFIG_INTEL_GTT=3Dy
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
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> # CONFIG_DRM_I2C_SIL164 is not set
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> CONFIG_DRM_PTN3460=3Dm
> CONFIG_DRM_TDFX=3Dm
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_UMS=3Dy
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I810=3Dy
> CONFIG_DRM_I915=3Dy
> # CONFIG_DRM_I915_KMS is not set
> # CONFIG_DRM_I915_FBDEV is not set
> # CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT is not set
> CONFIG_DRM_MGA=3Dy
> CONFIG_DRM_SIS=3Dm
> CONFIG_DRM_VIA=3Dy
> CONFIG_DRM_SAVAGE=3Dm
> CONFIG_DRM_VMWGFX=3Dy
> # CONFIG_DRM_VMWGFX_FBCON is not set
> CONFIG_DRM_GMA500=3Dm
> CONFIG_DRM_GMA600=3Dy
> CONFIG_DRM_GMA3600=3Dy
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> CONFIG_DRM_MGAG200=3Dy
> CONFIG_DRM_CIRRUS_QEMU=3Dm
> CONFIG_DRM_QXL=3Dm
> CONFIG_DRM_BOCHS=3Dm
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_DDC=3Dy
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
> CONFIG_FB_SVGALIB=3Dm
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> CONFIG_FB_PM2=3Dy
> # CONFIG_FB_PM2_FIFO_DISCONNECT is not set
> CONFIG_FB_CYBER2000=3Dy
> CONFIG_FB_CYBER2000_DDC=3Dy
> CONFIG_FB_ARC=3Dy
> CONFIG_FB_ASILIANT=3Dy
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> # CONFIG_FB_VESA is not set
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=3Dy
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> # CONFIG_FB_RIVA is not set
> CONFIG_FB_I740=3Dy
> CONFIG_FB_LE80578=3Dm
> CONFIG_FB_CARILLO_RANCH=3Dm
> CONFIG_FB_MATROX=3Dy
> CONFIG_FB_MATROX_MILLENIUM=3Dy
> CONFIG_FB_MATROX_MYSTIQUE=3Dy
> CONFIG_FB_MATROX_G=3Dy
> CONFIG_FB_MATROX_I2C=3Dy
> # CONFIG_FB_MATROX_MAVEN is not set
> # CONFIG_FB_RADEON is not set
> CONFIG_FB_ATY128=3Dm
> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> CONFIG_FB_ATY=3Dm
> CONFIG_FB_ATY_CT=3Dy
> # CONFIG_FB_ATY_GENERIC_LCD is not set
> CONFIG_FB_ATY_GX=3Dy
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> # CONFIG_FB_S3 is not set
> CONFIG_FB_SAVAGE=3Dm
> # CONFIG_FB_SAVAGE_I2C is not set
> CONFIG_FB_SAVAGE_ACCEL=3Dy
> CONFIG_FB_SIS=3Dm
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> CONFIG_FB_VIA=3Dm
> # CONFIG_FB_VIA_DIRECT_PROCFS is not set
> CONFIG_FB_VIA_X_COMPATIBILITY=3Dy
> CONFIG_FB_NEOMAGIC=3Dy
> CONFIG_FB_KYRO=3Dy
> CONFIG_FB_3DFX=3Dy
> CONFIG_FB_3DFX_ACCEL=3Dy
> CONFIG_FB_3DFX_I2C=3Dy
> CONFIG_FB_VOODOO1=3Dy
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=3Dm
> CONFIG_FB_ARK=3Dm
> CONFIG_FB_PM3=3Dy
> # CONFIG_FB_CARMINE is not set
> CONFIG_FB_VIRTUAL=3Dm
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> # CONFIG_FB_MB862XX_I2C is not set
> CONFIG_FB_BROADSHEET=3Dy
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dm
> # CONFIG_FB_AUO_K1901 is not set
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dm
> # CONFIG_LCD_PLATFORM is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> CONFIG_BACKLIGHT_LM3533=3Dm
> CONFIG_BACKLIGHT_CARILLO_RANCH=3Dm
> CONFIG_BACKLIGHT_DA903X=3Dm
> CONFIG_BACKLIGHT_DA9052=3Dy
> CONFIG_BACKLIGHT_MAX8925=3Dm
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_WM831X=3Dm
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_88PM860X=3Dm
> CONFIG_BACKLIGHT_PCF50633=3Dy
> # CONFIG_BACKLIGHT_AAT2870 is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> # CONFIG_BACKLIGHT_PANDORA is not set
> CONFIG_BACKLIGHT_TPS65217=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> CONFIG_LOGO=3Dy
> CONFIG_LOGO_LINUX_MONO=3Dy
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dy
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dm
> CONFIG_HID_ACRUX_FF=3Dy
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_AUREAL=3Dy
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CYPRESS=3Dy
> # CONFIG_HID_DRAGONRISE is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELECOM is not set
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_UCLOGIC=3Dm
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_TWINHAN=3Dy
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> # CONFIG_HID_LENOVO_TPKBD is not set
> CONFIG_HID_LOGITECH=3Dy
> CONFIG_LOGITECH_FF=3Dy
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> CONFIG_LOGIG940_FF=3Dy
> # CONFIG_LOGIWHEELS_FF is not set
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> CONFIG_PANTHERLORD_FF=3Dy
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_SAITEK is not set
> # CONFIG_HID_SAMSUNG is not set
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_SMARTJOYPLUS=3Dm
> CONFIG_SMARTJOYPLUS_FF=3Dy
> # CONFIG_HID_TIVO is not set
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THRUSTMASTER=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dy
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dy
> # CONFIG_HID_SENSOR_HUB is not set
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dy
> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
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
> # CONFIG_SAMSUNG_USB2PHY is not set
> # CONFIG_SAMSUNG_USB3PHY is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_GADGET is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_WHCI=3Dy
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> # CONFIG_MMC_CLKGATE is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> # CONFIG_MMC_BLOCK_BOUNCE is not set
> CONFIG_SDIO_UART=3Dm
> CONFIG_MMC_TEST=3Dm
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dy
> # CONFIG_MMC_RICOH_MMC is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_MMC_WBSD=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_USDHI6ROL0=3Dy
> # CONFIG_MEMSTICK is not set
> # CONFIG_NEW_LEDS is not set
> CONFIG_ACCESSIBILITY=3Dy
> CONFIG_A11Y_BRAILLE_CONSOLE=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> CONFIG_RTC_DRV_TEST=3Dm
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dy
> # CONFIG_RTC_DRV_DS1307 is not set
> # CONFIG_RTC_DRV_DS1374 is not set
> CONFIG_RTC_DRV_DS1672=3Dy
> # CONFIG_RTC_DRV_DS3232 is not set
> # CONFIG_RTC_DRV_MAX6900 is not set
> CONFIG_RTC_DRV_MAX8925=3Dy
> CONFIG_RTC_DRV_RS5C372=3Dy
> CONFIG_RTC_DRV_ISL1208=3Dm
> # CONFIG_RTC_DRV_ISL12022 is not set
> CONFIG_RTC_DRV_ISL12057=3Dm
> CONFIG_RTC_DRV_X1205=3Dm
> # CONFIG_RTC_DRV_PALMAS is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_PCF8523=3Dy
> # CONFIG_RTC_DRV_PCF8563 is not set
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=3Dm
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TWL4030=3Dm
> CONFIG_RTC_DRV_TPS80031=3Dm
> CONFIG_RTC_DRV_RC5T583=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> CONFIG_RTC_DRV_FM3130=3Dy
> CONFIG_RTC_DRV_RX8581=3Dm
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dm
> CONFIG_RTC_DRV_RV3029C2=3Dy
> CONFIG_RTC_DRV_S5M=3Dm
> =

> #
> # SPI RTC drivers
> #
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dm
> CONFIG_RTC_DRV_DS1286=3Dm
> # CONFIG_RTC_DRV_DS1511 is not set
> # CONFIG_RTC_DRV_DS1553 is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DA9052=3Dm
> # CONFIG_RTC_DRV_DA9055 is not set
> # CONFIG_RTC_DRV_DA9063 is not set
> CONFIG_RTC_DRV_STK17TA8=3Dm
> CONFIG_RTC_DRV_M48T86=3Dy
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dm
> # CONFIG_RTC_DRV_MSM6242 is not set
> # CONFIG_RTC_DRV_BQ4802 is not set
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dy
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_WM831X=3Dy
> CONFIG_RTC_DRV_WM8350=3Dm
> CONFIG_RTC_DRV_PCF50633=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_MOXART=3Dm
> # CONFIG_RTC_DRV_XGENE is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_DMADEVICES is not set
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_KS0108=3Dm
> CONFIG_KS0108_PORT=3D0x378
> CONFIG_KS0108_DELAY=3D2
> CONFIG_CFAG12864B=3Dm
> CONFIG_CFAG12864B_RATE=3D20
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dm
> # CONFIG_UIO_PDRV_GENIRQ is not set
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=3Dm
> CONFIG_UIO_MF624=3Dy
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> # CONFIG_ET131X is not set
> CONFIG_SLICOSS=3Dm
> # CONFIG_COMEDI is not set
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> CONFIG_RTS5208=3Dm
> # CONFIG_RTS5208_DEBUG is not set
> CONFIG_DX_SEP=3Dy
> # CONFIG_CRYSTALHD is not set
> CONFIG_CXT1E1=3Dy
> CONFIG_SBE_PMCC4_NCOMM=3Dy
> # CONFIG_FB_XGI is not set
> # CONFIG_ACPI_QUICKSTART is not set
> # CONFIG_FT1000 is not set
> =

> #
> # Speakup console speech
> #
> CONFIG_SPEAKUP=3Dy
> # CONFIG_SPEAKUP_SYNTH_ACNTSA is not set
> CONFIG_SPEAKUP_SYNTH_APOLLO=3Dm
> CONFIG_SPEAKUP_SYNTH_AUDPTR=3Dy
> CONFIG_SPEAKUP_SYNTH_BNS=3Dy
> CONFIG_SPEAKUP_SYNTH_DECTLK=3Dy
> # CONFIG_SPEAKUP_SYNTH_DECEXT is not set
> CONFIG_SPEAKUP_SYNTH_LTLK=3Dm
> # CONFIG_SPEAKUP_SYNTH_SOFT is not set
> # CONFIG_SPEAKUP_SYNTH_SPKOUT is not set
> CONFIG_SPEAKUP_SYNTH_TXPRT=3Dy
> CONFIG_SPEAKUP_SYNTH_DUMMY=3Dy
> CONFIG_TOUCHSCREEN_CLEARPAD_TM1217=3Dm
> # CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ASHMEM=3Dy
> CONFIG_ANDROID_LOGGER=3Dy
> # CONFIG_ANDROID_TIMED_OUTPUT is not set
> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> CONFIG_ANDROID_INTF_ALARM_DEV=3Dy
> CONFIG_SYNC=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_ION is not set
> CONFIG_WIMAX_GDM72XX=3Dy
> # CONFIG_WIMAX_GDM72XX_QOS is not set
> CONFIG_WIMAX_GDM72XX_K_MODE=3Dy
> # CONFIG_WIMAX_GDM72XX_WIMAX2 is not set
> CONFIG_WIMAX_GDM72XX_SDIO=3Dy
> # CONFIG_NET_VENDOR_SILICOM is not set
> # CONFIG_DGRP is not set
> # CONFIG_XILLYBUS is not set
> CONFIG_DGNC=3Dm
> # CONFIG_DGAP is not set
> CONFIG_GS_FPGABOOT=3Dy
> # CONFIG_CRYPTO_SKEIN is not set
> CONFIG_CRYPTO_THREEFISH=3Dy
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_LAPTOP=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Hardware Spinlock drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> # CONFIG_AMD_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_STE_MODEM_RPROC is not set
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> # CONFIG_VME_CA91CX42 is not set
> CONFIG_VME_TSI148=3Dm
> =

> #
> # VME Board Drivers
> #
> CONFIG_VMIVME_7805=3Dy
> =

> #
> # VME Device Drivers
> #
> # CONFIG_VME_USER is not set
> CONFIG_VME_PIO2=3Dm
> # CONFIG_PWM is not set
> # CONFIG_IPACK_BUS is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dm
> CONFIG_FMC_TRIVIAL=3Dy
> CONFIG_FMC_WRITE_EEPROM=3Dm
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> CONFIG_PHY_SAMSUNG_USB2=3Dy
> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL=3Dy
> CONFIG_MCB=3Dy
> CONFIG_MCB_PCI=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dm
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DCDBAS is not set
> # CONFIG_DMIID is not set
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_EXT2_FS=3Dm
> # CONFIG_EXT2_FS_XATTR is not set
> CONFIG_EXT2_FS_XIP=3Dy
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_DEFAULTS_TO_ORDERED=3Dy
> CONFIG_EXT3_FS_XATTR=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=3Dy
> # CONFIG_EXT4_FS_POSIX_ACL is not set
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_FS_XIP=3Dy
> CONFIG_JBD=3Dy
> # CONFIG_JBD_DEBUG is not set
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> CONFIG_REISERFS_CHECK=3Dy
> CONFIG_REISERFS_PROC_INFO=3Dy
> # CONFIG_REISERFS_FS_XATTR is not set
> CONFIG_JFS_FS=3Dy
> CONFIG_JFS_POSIX_ACL=3Dy
> CONFIG_JFS_SECURITY=3Dy
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> CONFIG_XFS_FS=3Dm
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_GFS2_FS=3Dm
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> # CONFIG_OCFS2_FS_STATS is not set
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> CONFIG_OCFS2_DEBUG_FS=3Dy
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> CONFIG_BTRFS_ASSERT=3Dy
> CONFIG_NILFS2_FS=3Dm
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dm
> CONFIG_QFMT_V1=3Dm
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> # CONFIG_CUSE is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> # CONFIG_JOLIET is not set
> # CONFIG_ZISOFS is not set
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
> CONFIG_NTFS_FS=3Dm
> # CONFIG_NTFS_DEBUG is not set
> # CONFIG_NTFS_RW is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> # CONFIG_PROC_KCORE is not set
> # CONFIG_PROC_VMCORE is not set
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dm
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ADFS_FS=3Dm
> CONFIG_ADFS_FS_RW=3Dy
> CONFIG_AFFS_FS=3Dy
> # CONFIG_ECRYPT_FS is not set
> CONFIG_HFS_FS=3Dy
> CONFIG_HFSPLUS_FS=3Dy
> CONFIG_HFSPLUS_FS_POSIX_ACL=3Dy
> CONFIG_BEFS_FS=3Dm
> CONFIG_BEFS_DEBUG=3Dy
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_JFFS2_FS=3Dm
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_SUMMARY=3Dy
> CONFIG_JFFS2_FS_XATTR=3Dy
> CONFIG_JFFS2_FS_POSIX_ACL=3Dy
> # CONFIG_JFFS2_FS_SECURITY is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_LOGFS is not set
> CONFIG_CRAMFS=3Dm
> CONFIG_SQUASHFS=3Dm
> CONFIG_SQUASHFS_FILE_CACHE=3Dy
> # CONFIG_SQUASHFS_FILE_DIRECT is not set
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZO is not set
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> CONFIG_SQUASHFS_EMBEDDED=3Dy
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dm
> CONFIG_MINIX_FS=3Dm
> CONFIG_OMFS_FS=3Dy
> # CONFIG_HPFS_FS is not set
> CONFIG_QNX4FS_FS=3Dy
> CONFIG_QNX6FS_FS=3Dm
> CONFIG_QNX6FS_DEBUG=3Dy
> # CONFIG_ROMFS_FS is not set
> # CONFIG_PSTORE is not set
> CONFIG_SYSV_FS=3Dm
> # CONFIG_UFS_FS is not set
> CONFIG_F2FS_FS=3Dm
> # CONFIG_F2FS_STAT_FS is not set
> # CONFIG_F2FS_FS_XATTR is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_NETWORK_FILESYSTEMS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dm
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dm
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dm
> # CONFIG_NLS_MAC_GREEK is not set
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dm
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
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
> CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_DEBUG_ON=3Dy
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_KMEMCHECK is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_TIMER_STATS is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_RT_MUTEX_TESTER is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
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
> # CONFIG_SPARSE_RCU_POINTER is not set
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> # CONFIG_RCU_CPU_STALL_INFO is not set
> # CONFIG_RCU_TRACE is not set
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
> CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
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
> CONFIG_LKDTM=3Dm
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_ASYNC_RAID6_TEST is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_BUILD_DOCSRC is not set
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_MODULE=3Dm
> CONFIG_TEST_USER_COPY=3Dm
> CONFIG_TEST_BPF=3Dm
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_X86_PTDUMP is not set
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_SET_MODULE_RONX=3Dy
> # CONFIG_DEBUG_NX_TEST is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> # CONFIG_IOMMU_STRESS is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> # CONFIG_X86_DECODER_SELFTEST is not set
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
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_STATIC_CPU_HAS is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dm
> # CONFIG_KEYS_DEBUG_PROC_KEYS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> # CONFIG_SECURITY is not set
> # CONFIG_SECURITYFS is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dm
> CONFIG_ASYNC_MEMCPY=3Dm
> CONFIG_ASYNC_XOR=3Dm
> CONFIG_ASYNC_PQ=3Dm
> CONFIG_ASYNC_RAID6_RECOV=3Dm
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
> CONFIG_CRYPTO_PCOMP=3Dy
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dm
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> # CONFIG_CRYPTO_TEST is not set
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
> CONFIG_CRYPTO_CBC=3Dm
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dy
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dm
> CONFIG_CRYPTO_XCBC=3Dy
> # CONFIG_CRYPTO_VMAC is not set
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dm
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD128=3Dm
> CONFIG_CRYPTO_RMD160=3Dm
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dy
> # CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> # CONFIG_CRYPTO_BLOWFISH_X86_64 is not set
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dm
> CONFIG_CRYPTO_SALSA20_X86_64=3Dm
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_ZLIB=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dy
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> # CONFIG_BINARY_PRINTF is not set
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dy
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dm
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
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dm
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dm
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_BTREE=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> # CONFIG_AVERAGE is not set
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dm
> CONFIG_DDR=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> CONFIG_FONTS=3Dy
> # CONFIG_FONT_8x8 is not set
> CONFIG_FONT_8x16=3Dy
> CONFIG_FONT_6x11=3Dy
> CONFIG_FONT_7x14=3Dy
> CONFIG_FONT_PEARL_8x8=3Dy
> # CONFIG_FONT_ACORN_8x8 is not set
> # CONFIG_FONT_MINI_4x6 is not set
> # CONFIG_FONT_SUN8x16 is not set
> # CONFIG_FONT_SUN12x22 is not set
> CONFIG_FONT_10x18=3Dy

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


--===============5644355062759965160==--

