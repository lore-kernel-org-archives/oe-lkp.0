Content-Type: multipart/mixed; boundary="===============1194066198219283135=="
MIME-Version: 1.0
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: lkp@lists.01.org
Subject: Re: [pci] BUG: unable to handle kernel NULL pointer dereference at 00000064
Date: Mon, 14 Jul 2014 17:06:11 +0100
Message-ID: <20140714160611.GC825@e106497-lin.cambridge.arm.com>
In-Reply-To: <53C14170.70106@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1194066198219283135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2014 at 03:08:48PM +0100, Jet Chen wrote:
> Hi Liviu,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.linaro.org/people/cdall/linux-kvm-arm apm_linux_v3.16-rc1
> commit 6f99bc949b1c90ff342a7d44ac4122322a7ccb78
> Author:     Liviu Dudau <Liviu.Dudau@arm.com>
> AuthorDate: Thu Jun 5 15:20:38 2014 +0530
> Commit:     Christoffer Dall <christoffer.dall@linaro.org>
> CommitDate: Fri Jul 11 06:34:50 2014 -0700
> =

>     pci: Create pci_host_bridge before its associated bus in pci_create_r=
oot_bus.
>         Before commit 7b5436635800 the pci_host_bridge was created before=
 the root bus.
>     As that commit has added a needless dependency on the bus for pci_all=
oc_host_bridge()
>     the creation order has been changed for no good reason. Revert the or=
der of
>     creation as we are going to depend on the pci_host_bridge structure t=
o retrieve the
>     domain number of the root bus.
>         Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
>     Acked-by: Grant Likely <grant.likely@linaro.org>
>     Tested-by: Tanmay Inamdar <tinamdar@apm.com>

Jet,

This is the third time the patch I have provided you got lost and the bot s=
ent this
email. Is it not possible to roll that patch into the stack that you have?

Best regards,
Liviu


> =

> +------------------------------------------------------------+-----------=
-+------------+
> |                                                            | 175e014331=
 | 6f99bc949b |
> +------------------------------------------------------------+-----------=
-+------------+
> | boot_successes                                             | 60        =
 | 0          |
> | boot_failures                                              | 0         =
 | 20         |
> | BUG:unable_to_handle_kernel_NULL_pointer_dereference       | 0         =
 | 20         |
> | Oops                                                       | 0         =
 | 20         |
> | EIP_is_at_pcibios_root_bridge_prepare                      | 0         =
 | 20         |
> | WARNING:CPU:PID:at_kernel/smp.c:smp_call_function_single() | 0         =
 | 20         |
> | Kernel_panic-not_syncing:Attempted_to_kill_init_exitcode=3D  | 0       =
   | 20         |
> | backtrace:acpi_bus_scan                                    | 0         =
 | 20         |
> | backtrace:acpi_scan_init                                   | 0         =
 | 20         |
> | backtrace:acpi_init                                        | 0         =
 | 20         |
> | backtrace:kernel_init_freeable                             | 0         =
 | 20         |
> +------------------------------------------------------------+-----------=
-+------------+
> =

> [    0.351550] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.352949] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments]
> [    0.353402] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.355122] BUG: unable to handle kernel NULL pointer dereference at 0=
0000064
> [    0.356666] IP: [<c17b762e>] pcibios_root_bridge_prepare+0xe/0x20
> [    0.356666] *pde =3D 00000000 [    0.356666] Oops: 0000 [#1] PREEMPT S=
MP DEBUG_PAGEALLOC
> [    0.356666] Modules linked in:
> [    0.356666] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.16.0-rc1-00005=
-g6f99bc9 #2
> [    0.356666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [    0.356666] task: cfc7e010 ti: cfcc0000 task.ti: cfcc0000
> [    0.356666] EIP: 0060:[<c17b762e>] EFLAGS: 00010286 CPU: 0
> [    0.356666] EIP is at pcibios_root_bridge_prepare+0xe/0x20
> [    0.356666] EAX: cfe0a000 EBX: c1d83d20 ECX: 00000000 EDX: 00000000
> [    0.356666] ESI: 00000000 EDI: cfe0a000 EBP: cfcc1d20 ESP: cfcc1d20
> [    0.356666]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [    0.356666] CR0: 8005003b CR2: 00000064 CR3: 01e77000 CR4: 000006d0
> [    0.356666] Stack:
> [    0.356666]  cfcc1da4 c13d7a8b cfcc1dd4 cfe56e00 cfcc1dd4 cfe56d40 cfc=
c1dd4 cfc00180
> [    0.356666]  cfcc1d88 c11a77d2 cfe0a184 00000001 00000000 00000000 c10=
93cf9 00000246
> [    0.356666]  000080d0 00000282 00000010 000080d0 00000020 00000246 c13=
d5a48 cfcc1dd4
> [    0.356666] Call Trace:
> [    0.356666]  [<c13d7a8b>] pci_create_root_bus+0x5b/0x340
> [    0.356666]  [<c11a77d2>] ? kmem_cache_alloc_trace+0x3a2/0x4b0
> [    0.356666]  [<c1093cf9>] ? insert_resource_conflict+0x19/0x40
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c17b750b>] pci_acpi_scan_root+0x25b/0x370
> [    0.356666]  [<c1401686>] acpi_pci_root_add+0x223/0x2c9
> [    0.356666]  [<c13fc8ed>] ? acpi_bus_get_status_handle+0x18/0x3a
> [    0.356666]  [<c13fedb3>] acpi_bus_attach+0xb5/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c13feea7>] acpi_bus_scan+0x49/0x59
> [    0.356666]  [<c1ddfa74>] acpi_scan_init+0x5b/0x16b
> [    0.356666]  [<c1ddf8cc>] acpi_init+0x205/0x220
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c100044e>] do_one_initcall+0x7e/0x1b0
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c1da7500>] ? initcall_blacklist+0x23/0x81
> [    0.356666]  [<c10ae039>] ? parse_args+0x1d9/0x360
> [    0.356666]  [<c10a5361>] ? __usermodehelper_set_disable_depth+0x41/0x=
50
> [    0.356666]  [<c1da7d9c>] kernel_init_freeable+0x1b2/0x249
> [    0.356666]  [<c1da755e>] ? initcall_blacklist+0x81/0x81
> [    0.356666]  [<c194b840>] kernel_init+0x10/0xe0
> [    0.356666]  [<c195f681>] ret_from_kernel_thread+0x21/0x30
> [    0.356666]  [<c194b830>] ? rest_init+0x130/0x130
> [    0.356666] Code: 8b 45 e0 89 44 24 04 e8 26 ab 19 00 31 c0 e9 8f fd f=
f ff 8d 76 00 8d bc 27 00 00 00 00 55 89 e5 3e 8d 74 26 00 8b 90 80 01 00 0=
0 <8b> 52 64 8b 52 08 89 90 28 01 00 00 31 c0 5d c3 66 90 55 89 e5
> [    0.356666] EIP: [<c17b762e>] pcibios_root_bridge_prepare+0xe/0x20 SS:=
ESP 0068:cfcc1d20
> [    0.356666] CR2: 0000000000000064
> [    0.356666] ---[ end trace 849b10f6fad5eb6f ]---
> [    0.356666] ------------[ cut here ]------------
> =

> git bisect start 263df82c9fb5fc5b3504d294f7ab813c274bf1d1 7171511eaec5bf2=
3fb06078f59784a3a0626b38f --
> git bisect  bad 56485a95d9ffdb6b431ea00171e320112a992b40  # 01:09      0-=
      9  rtc: Fix suspend/resume for APM X-Gene SoC RTC driver
> git bisect  bad 2a146bde9a2b55d8d9e98a1f4b72ca694aa67879  # 01:22      0-=
     19  dt-bindings: pci: xgene pcie device tree bindings
> git bisect  bad 6f99bc949b1c90ff342a7d44ac4122322a7ccb78  # 02:11      0-=
      1  pci: Create pci_host_bridge before its associated bus in pci_creat=
e_root_bus.
> git bisect good d1eee6a841dd73ecd3cce0e70686152cc5789c91  # 02:14     20+=
      0  arm64: Add architecture support for PCI
> git bisect good ab84a1c5bef2092f87cf22239df5592c68a83978  # 02:17     20+=
      0  pci: Introduce pci_register_io_range() helper function.
> git bisect good 175e0143313927c52fd7b6b5b66c202e3d6ab31c  # 02:39     20+=
      0  pci: OF: Fix the conversion of IO ranges into IO resources.
> # first bad commit: [6f99bc949b1c90ff342a7d44ac4122322a7ccb78] pci: Creat=
e pci_host_bridge before its associated bus in pci_create_root_bus.
> git bisect good 175e0143313927c52fd7b6b5b66c202e3d6ab31c  # 02:40     60+=
      0  pci: OF: Fix the conversion of IO ranges into IO resources.
> git bisect  bad 263df82c9fb5fc5b3504d294f7ab813c274bf1d1  # 02:40      0-=
     11  arm64: Add defconfig and dts for Xen on APM X-Gene Mustang board
> git bisect good 67b9d76f9e2f9f87f94a11521cc996dc2e43ce14  # 02:45     60+=
      0  Merge tag 'dm-3.16-fixes' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/device-mapper/linux-dm
> git bisect good b7079aa6ab3e23d080fa9b79d7f414d8287c32b4  # 02:48     60+=
      0  Add linux-next specific files for 20140711
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
> 	-monitor null )
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
> Jet

> early console in setup code
> early console in decompress_kernel
> =

> Decompressing Linux... Parsing ELF... No relocation needed... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.16.0-rc1-00005-g6f99bc9 (kbuild(a)lkp-hsx0=
1) (gcc version 4.8.2 (Debian 4.8.2-18) ) #2 SMP PREEMPT Sat Jul 12 09:26:3=
7 CST 2014
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
> [    0.000000] Notice: NX (Execute Disable) protection cannot be enabled:=
 non-PAE kernel!
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01=
/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x100000
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
t [c00f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x02bfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12000000-0x123fffff]
> [    0.000000]  [mem 0x12000000-0x123fffff] page 4k
> [    0.000000] BRK [0x026fd000, 0x026fdfff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x11ffffff]
> [    0.000000]  [mem 0x10000000-0x11ffffff] page 4k
> [    0.000000] BRK [0x026fe000, 0x026fefff] PGTABLE
> [    0.000000] BRK [0x026ff000, 0x026fffff] PGTABLE
> [    0.000000] BRK [0x02700000, 0x02700fff] PGTABLE
> [    0.000000] BRK [0x02701000, 0x02701fff] PGTABLE
> [    0.000000] BRK [0x02702000, 0x02702fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x0fffffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12400000-0x13ffdfff]
> [    0.000000]  [mem 0x12400000-0x13ffdfff] page 4k
> [    0.000000] cma: dma_contiguous_reserve(limit 13ffe000)
> [    0.000000] cma: dma_contiguous_reserve: reserving 31 MiB for global a=
rea
> [    0.000000] cma: dma_contiguous_reserve_area(size 1ff6000, base 000000=
00, limit 13ffe000)
> [    0.000000] cma: CMA: reserved 32 MiB at 10000000
> [    0.000000] RAMDISK: [mem 0x127ab000-0x13feffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000F0D00 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x13FFFC2A 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x13FFF1C0 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x13FFE040 001180 (v01 BOCHS  BXPCDSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x13FFE000 000040
> [    0.000000] ACPI: SSDT 0x13FFF234 00093E (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x13FFFB72 000080 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x13FFFBF2 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] 0MB HIGHMEM available.
> [    0.000000] 319MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 13ffe000
> [    0.000000]   low ram: 0 - 13ffe000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, primary cpu clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x13ffdfff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81820
> [    0.000000]   DMA zone: 36 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 684 pages used for memmap
> [    0.000000]   Normal zone: 77822 pages, LIFO batch:15
> [    0.000000] Using APIC driver default
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
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
> [    0.000000] mapped IOAPIC to ffffb000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 14 pages/cpu @d246f000 s32928 r0 d24416 u=
57344
> [    0.000000] pcpu-alloc: s32928 r0 d24416 u57344 alloc=3D14*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 12471840
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 81100
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/i386-randconfig-r1-0711/cdall-kvm=
-arm:apm_linux_v3.16-rc1:6f99bc949b1c90ff342a7d44ac4122322a7ccb78:bisect-li=
nux-1/.vmlinuz-6f99bc949b1c90ff342a7d44ac4122322a7ccb78-20140712092656-2-iv=
b41 branch=3Dcdall-kvm-arm/apm_linux_v3.16-rc1 BOOT_IMAGE=3D/kernel/i386-ra=
ndconfig-r1-0711/6f99bc949b1c90ff342a7d44ac4122322a7ccb78/vmlinuz-3.16.0-rc=
1-00005-g6f99bc9 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] Memory: 242052K/327280K available (9609K kernel code, 727K=
 rwdata, 3632K rodata, 788K init, 8692K bss, 85228K reserved, 0K highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffe6f000 - 0xfffff000   (1600 kB)
> [    0.000000]     pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
> [    0.000000]     vmalloc : 0xd47fe000 - 0xff7fe000   ( 688 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd3ffe000   ( 319 MB)
> [    0.000000]       .init : 0xc1da7000 - 0xc1e6c000   ( 788 kB)
> [    0.000000]       .data : 0xc1962957 - 0xc1da5c00   (4364 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc1962957   (9610 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:2304 nr_irqs:512 16
> [    0.000000] CPU 0 irqstacks, hard=3Dcfc0a000 soft=3Dcfc0c000
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.16.0-rc1-00005-g6f99bc9 (kbuild(a)lkp-hsx0=
1) (gcc version 4.8.2 (Debian 4.8.2-18) ) #2 SMP PREEMPT Sat Jul 12 09:26:3=
7 CST 2014
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
> [    0.000000] Notice: NX (Execute Disable) protection cannot be enabled:=
 non-PAE kernel!
> [    0.000000] SMBIOS 2.4 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Bochs 01=
/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x100000
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
t [c00f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x02bfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12000000-0x123fffff]
> [    0.000000]  [mem 0x12000000-0x123fffff] page 4k
> [    0.000000] BRK [0x026fd000, 0x026fdfff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x11ffffff]
> [    0.000000]  [mem 0x10000000-0x11ffffff] page 4k
> [    0.000000] BRK [0x026fe000, 0x026fefff] PGTABLE
> [    0.000000] BRK [0x026ff000, 0x026fffff] PGTABLE
> [    0.000000] BRK [0x02700000, 0x02700fff] PGTABLE
> [    0.000000] BRK [0x02701000, 0x02701fff] PGTABLE
> [    0.000000] BRK [0x02702000, 0x02702fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x0fffffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12400000-0x13ffdfff]
> [    0.000000]  [mem 0x12400000-0x13ffdfff] page 4k
> [    0.000000] cma: dma_contiguous_reserve(limit 13ffe000)
> [    0.000000] cma: dma_contiguous_reserve: reserving 31 MiB for global a=
rea
> [    0.000000] cma: dma_contiguous_reserve_area(size 1ff6000, base 000000=
00, limit 13ffe000)
> [    0.000000] cma: CMA: reserved 32 MiB at 10000000
> [    0.000000] RAMDISK: [mem 0x127ab000-0x13feffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000F0D00 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x13FFFC2A 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x13FFF1C0 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x13FFE040 001180 (v01 BOCHS  BXPCDSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x13FFE000 000040
> [    0.000000] ACPI: SSDT 0x13FFF234 00093E (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x13FFFB72 000080 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x13FFFBF2 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] 0MB HIGHMEM available.
> [    0.000000] 319MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 13ffe000
> [    0.000000]   low ram: 0 - 13ffe000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, primary cpu clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x13ffdfff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81820
> [    0.000000]   DMA zone: 36 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 684 pages used for memmap
> [    0.000000]   Normal zone: 77822 pages, LIFO batch:15
> [    0.000000] Using APIC driver default
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
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
> [    0.000000] mapped IOAPIC to ffffb000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 14 pages/cpu @d246f000 s32928 r0 d24416 u=
57344
> [    0.000000] pcpu-alloc: s32928 r0 d24416 u57344 alloc=3D14*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 12471840
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 81100
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/i386-randconfig-r1-0711/cdall-kvm=
-arm:apm_linux_v3.16-rc1:6f99bc949b1c90ff342a7d44ac4122322a7ccb78:bisect-li=
nux-1/.vmlinuz-6f99bc949b1c90ff342a7d44ac4122322a7ccb78-20140712092656-2-iv=
b41 branch=3Dcdall-kvm-arm/apm_linux_v3.16-rc1 BOOT_IMAGE=3D/kernel/i386-ra=
ndconfig-r1-0711/6f99bc949b1c90ff342a7d44ac4122322a7ccb78/vmlinuz-3.16.0-rc=
1-00005-g6f99bc9 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] Memory: 242052K/327280K available (9609K kernel code, 727K=
 rwdata, 3632K rodata, 788K init, 8692K bss, 85228K reserved, 0K highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffe6f000 - 0xfffff000   (1600 kB)
> [    0.000000]     pkmap   : 0xff800000 - 0xffc00000   (4096 kB)
> [    0.000000]     vmalloc : 0xd47fe000 - 0xff7fe000   ( 688 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd3ffe000   ( 319 MB)
> [    0.000000]       .init : 0xc1da7000 - 0xc1e6c000   ( 788 kB)
> [    0.000000]       .data : 0xc1962957 - 0xc1da5c00   (4364 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc1962957   (9610 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:2304 nr_irqs:512 16
> [    0.000000] CPU 0 irqstacks, hard=3Dcfc0a000 soft=3Dcfc0c000
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] console [ttyS0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc=
., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000]  memory used by lock dependency info: 4911 kB
> [    0.000000]  per task-struct memory footprint: 1152 bytes
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.006666] Calibrating delay loop (skipped) preset value.. 5389.47 Bo=
goMIPS (lpj=3D8978360)
> [    0.006678] pid_max: default: 32768 minimum: 301
> [    0.007825] ACPI: Core revision 20140424
> [    0.014195] ACPI: All ACPI Tables successfully acquired
> [    0.015744] Security Framework initialized
> [    0.016679] SELinux:  Initializing.
> [    0.017847] SELinux:  Starting in enforcing mode
> [    0.019055] AppArmor: AppArmor disabled by boot time parameter
> [    0.020011] Yama: becoming mindful.
> [    0.021253] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.023349] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.027014] Initializing cgroup subsys devices
> [    0.028398] Initializing cgroup subsys freezer
> [    0.029557] Initializing cgroup subsys perf_event
> [    0.030112] mce: CPU supports 10 MCE banks
> [    0.031198] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.031198] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.031198] tlb_flushall_shift: 6
> [    0.034225] debug: unmapping init [mem 0xc1e6c000-0xc1e73fff]
> [    0.042587] ftrace: allocating 32816 entries in 65 pages
> [    0.053751] Getting VERSION: 1050014
> [    0.054729] Getting VERSION: 1050014
> [    0.056676] Getting ID: 0
> [    0.057474] Getting ID: f000000
> [    0.058360] Getting LVT0: 8700
> [    0.059226] Getting LVT1: 8400
> [    0.060011] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.061283] enabled ExtINT on CPU#0
> [    0.063447] ENABLING IO-APIC IRQs
> [    0.064398] init IO_APIC IRQs
> [    0.065309]  apic 0 pin 0 not connected
> [    0.066365] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.066705] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.070036] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.072048] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.073368] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.076701] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.078887] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.080040] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.083366] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.086697] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.088699] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.090033] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.093372] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.096710] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.100028] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.101870]  apic 0 pin 16 not connected
> [    0.103339]  apic 0 pin 17 not connected
> [    0.104274]  apic 0 pin 18 not connected
> [    0.105212]  apic 0 pin 19 not connected
> [    0.106674]  apic 0 pin 20 not connected
> [    0.107685]  apic 0 pin 21 not connected
> [    0.108681]  apic 0 pin 22 not connected
> [    0.110006]  apic 0 pin 23 not connected
> [    0.111195] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.113338] smpboot: CPU0: Intel Common KVM processor (fam: 0f, model:=
 06, stepping: 01)
> [    0.116674] Using local APIC timer interrupts.
> [    0.116674] calibrating APIC timer ...
> [    0.123333] ... lapic delta =3D 7487116
> [    0.123333] ... PM-Timer delta =3D 428799
> [    0.123333] APIC calibration not consistent with PM-Timer: 119ms inste=
ad of 100ms
> [    0.123333] APIC delta adjusted to PM-Timer: 6250115 (7487116)
> [    0.123333] TSC delta adjusted to PM-Timer: 269346507 (322654623)
> [    0.123333] ..... delta 6250115
> [    0.123333] ..... mult: 268440422
> [    0.123333] ..... calibration result: 3333394
> [    0.123333] ..... CPU clock speed is 2693.2447 MHz.
> [    0.123333] ..... host bus clock speed is 1000.0394 MHz.
> [    0.123426] Performance Events: unsupported Netburst CPU model 6 no PM=
U driver, software events only.
> [    0.143512] NMI watchdog: disabled (cpu0): hardware events not enabled
> [    0.150705] CPU 1 irqstacks, hard=3Dcfd90000 soft=3Dcfd92000
> [    0.153349] x86: Booting SMP configuration:
> [    0.154411] .... node  #0, CPUs:      #1
> [    0.006666] Initializing CPU#1
> [    0.006666] kvm-clock: cpu 1, msr 0:13ffd021, secondary cpu clock
> [    0.006666] masked ExtINT on CPU#1
> [    0.176816] x86: Booted up 1 node, 2 CPUs
> [    0.178159] smpboot: Total of 2 processors activated (10778.95 BogoMIP=
S)
> [    0.176678] KVM setup async PF for cpu 1
> [    0.176678] kvm-stealtime: cpu 1, msr 1247f840
> [    0.197498] devtmpfs: initialized
> [    0.201230] evm: security.selinux
> [    0.202202] evm: security.SMACK64
> [    0.203186] evm: security.SMACK64EXEC
> [    0.204389] evm: security.SMACK64TRANSMUTE
> [    0.205490] evm: security.SMACK64MMAP
> [    0.206518] evm: security.ima
> [    0.206673] evm: security.capability
> [    0.213547] prandom: seed boundary self test passed
> [    0.215534] prandom: 100 self tests passed
> [    0.216679] atomic64_test: passed for i386+ platform with CX8 and with=
 SSE
> [    0.218941] regulator-dummy: no parameters
> [    0.223210] RTC time:  2:11:48, date: 07/12/14
> [    0.223724] NET: Registered protocol family 16
> [    0.226729] cpuidle: using governor ladder
> [    0.227863] cpuidle: using governor menu
> [    0.229391] ACPI: bus type PCI registered
> [    0.230257] PCI: Using configuration type 1 for base access
> [    0.232081] mtrr: your CPUs had inconsistent variable MTRR settings
> [    0.233346] mtrr: your CPUs had inconsistent MTRRdefType settings
> [    0.234811] mtrr: probably your BIOS does not setup all CPUs.
> [    0.236672] mtrr: corrected configuration.
> [    0.320070] ACPI: Added _OSI(Module Device)
> [    0.321186] ACPI: Added _OSI(Processor Device)
> [    0.322362] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.323340] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.332583] ACPI: Interpreter enabled
> [    0.333346] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S1_] (20140424/hwxface-580)
> [    0.335632] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State=
 [\_S2_] (20140424/hwxface-580)
> [    0.337450] ACPI: (supports S0 S3 S5)
> [    0.338417] ACPI: Using IOAPIC for interrupt routing
> [    0.340054] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.351550] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.352949] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments]
> [    0.353402] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.355122] BUG: unable to handle kernel NULL pointer dereference at 0=
0000064
> [    0.356666] IP: [<c17b762e>] pcibios_root_bridge_prepare+0xe/0x20
> [    0.356666] *pde =3D 00000000 =

> [    0.356666] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
> [    0.356666] Modules linked in:
> [    0.356666] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.16.0-rc1-00005=
-g6f99bc9 #2
> [    0.356666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [    0.356666] task: cfc7e010 ti: cfcc0000 task.ti: cfcc0000
> [    0.356666] EIP: 0060:[<c17b762e>] EFLAGS: 00010286 CPU: 0
> [    0.356666] EIP is at pcibios_root_bridge_prepare+0xe/0x20
> [    0.356666] EAX: cfe0a000 EBX: c1d83d20 ECX: 00000000 EDX: 00000000
> [    0.356666] ESI: 00000000 EDI: cfe0a000 EBP: cfcc1d20 ESP: cfcc1d20
> [    0.356666]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [    0.356666] CR0: 8005003b CR2: 00000064 CR3: 01e77000 CR4: 000006d0
> [    0.356666] Stack:
> [    0.356666]  cfcc1da4 c13d7a8b cfcc1dd4 cfe56e00 cfcc1dd4 cfe56d40 cfc=
c1dd4 cfc00180
> [    0.356666]  cfcc1d88 c11a77d2 cfe0a184 00000001 00000000 00000000 c10=
93cf9 00000246
> [    0.356666]  000080d0 00000282 00000010 000080d0 00000020 00000246 c13=
d5a48 cfcc1dd4
> [    0.356666] Call Trace:
> [    0.356666]  [<c13d7a8b>] pci_create_root_bus+0x5b/0x340
> [    0.356666]  [<c11a77d2>] ? kmem_cache_alloc_trace+0x3a2/0x4b0
> [    0.356666]  [<c1093cf9>] ? insert_resource_conflict+0x19/0x40
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c17b750b>] pci_acpi_scan_root+0x25b/0x370
> [    0.356666]  [<c1401686>] acpi_pci_root_add+0x223/0x2c9
> [    0.356666]  [<c13fc8ed>] ? acpi_bus_get_status_handle+0x18/0x3a
> [    0.356666]  [<c13fedb3>] acpi_bus_attach+0xb5/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c13feea7>] acpi_bus_scan+0x49/0x59
> [    0.356666]  [<c1ddfa74>] acpi_scan_init+0x5b/0x16b
> [    0.356666]  [<c1ddf8cc>] acpi_init+0x205/0x220
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c100044e>] do_one_initcall+0x7e/0x1b0
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c1da7500>] ? initcall_blacklist+0x23/0x81
> [    0.356666]  [<c10ae039>] ? parse_args+0x1d9/0x360
> [    0.356666]  [<c10a5361>] ? __usermodehelper_set_disable_depth+0x41/0x=
50
> [    0.356666]  [<c1da7d9c>] kernel_init_freeable+0x1b2/0x249
> [    0.356666]  [<c1da755e>] ? initcall_blacklist+0x81/0x81
> [    0.356666]  [<c194b840>] kernel_init+0x10/0xe0
> [    0.356666]  [<c195f681>] ret_from_kernel_thread+0x21/0x30
> [    0.356666]  [<c194b830>] ? rest_init+0x130/0x130
> [    0.356666] Code: 8b 45 e0 89 44 24 04 e8 26 ab 19 00 31 c0 e9 8f fd f=
f ff 8d 76 00 8d bc 27 00 00 00 00 55 89 e5 3e 8d 74 26 00 8b 90 80 01 00 0=
0 <8b> 52 64 8b 52 08 89 90 28 01 00 00 31 c0 5d c3 66 90 55 89 e5
> [    0.356666] EIP: [<c17b762e>] pcibios_root_bridge_prepare+0xe/0x20 SS:=
ESP 0068:cfcc1d20
> [    0.356666] CR2: 0000000000000064
> [    0.356666] ---[ end trace 849b10f6fad5eb6f ]---
> [    0.356666] ------------[ cut here ]------------
> [    0.356666] WARNING: CPU: 0 PID: 1 at kernel/smp.c:242 smp_call_functi=
on_single+0x9c/0xc0()
> [    0.356666] Modules linked in:
> [    0.356666] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G      D       3.16=
.0-rc1-00005-g6f99bc9 #2
> [    0.356666] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [    0.356666]  00000000 00000000 cfcc1aa0 c1955423 00000000 cfcc1ad0 c10=
8c29e c1bc72f8
> [    0.356666]  00000000 00000001 c1bccf80 000000f2 c110fb2c c110fb2c fff=
fffff 00000000
> [    0.356666]  c1159340 cfcc1ae0 c108c362 00000009 00000000 cfcc1b00 c11=
0fb2c cfcc1af0
> [    0.356666] Call Trace:
> [    0.356666]  [<c1955423>] dump_stack+0x48/0x69
> [    0.356666]  [<c108c29e>] warn_slowpath_common+0x7e/0xa0
> [    0.356666]  [<c110fb2c>] ? smp_call_function_single+0x9c/0xc0
> [    0.356666]  [<c110fb2c>] ? smp_call_function_single+0x9c/0xc0
> [    0.356666]  [<c1159340>] ? rcu_read_lock_held+0x40/0x40
> [    0.356666]  [<c108c362>] warn_slowpath_null+0x22/0x30
> [    0.356666]  [<c110fb2c>] smp_call_function_single+0x9c/0xc0
> [    0.356666]  [<c10de04b>] ? trace_hardirqs_off+0xb/0x10
> [    0.356666]  [<c11587bc>] task_function_call+0x3c/0x50
> [    0.356666]  [<c115fb50>] ? perf_cgroup_switch+0x380/0x380
> [    0.356666]  [<c115942d>] perf_cgroup_exit+0x1d/0x20
> [    0.356666]  [<c111e65f>] cgroup_exit+0xcf/0x220
> [    0.356666]  [<c108dca6>] do_exit+0x276/0xaf0
> [    0.356666]  [<c10ed2c0>] ? kmsg_dump+0x190/0x200
> [    0.356666]  [<c10ed151>] ? kmsg_dump+0x21/0x200
> [    0.356666]  [<c1049027>] oops_end+0x77/0xa0
> [    0.356666]  [<c1950975>] no_context+0x1a9/0x1b1
> [    0.356666]  [<c1950af6>] __bad_area_nosemaphore+0x179/0x181
> [    0.356666]  [<c10ddd43>] ? __bfs+0x13/0x1e0
> [    0.356666]  [<c10dd990>] ? noop_count+0x10/0x10
> [    0.356666]  [<c1950b15>] bad_area_nosemaphore+0x17/0x19
> [    0.356666]  [<c107f975>] __do_page_fault+0x85/0x4b0
> [    0.356666]  [<c1115904>] ? is_module_text_address+0x14/0x30
> [    0.356666]  [<c10ad21f>] ? __kernel_text_address+0x4f/0x70
> [    0.356666]  [<c1048deb>] ? print_context_stack+0x5b/0xa0
> [    0.356666]  [<c1047ead>] ? dump_trace+0xbd/0x1d0
> [    0.356666]  [<c10dff5e>] ? mark_held_locks+0x5e/0x80
> [    0.356666]  [<c107ff6a>] trace_do_page_fault+0x3a/0x200
> [    0.356666]  [<c107d350>] ? kvm_read_and_reset_pf_reason+0x40/0x40
> [    0.356666]  [<c107d373>] do_async_page_fault+0x23/0x80
> [    0.356666]  [<c196066f>] error_code+0x5f/0x70
> [    0.356666]  [<c107d350>] ? kvm_read_and_reset_pf_reason+0x40/0x40
> [    0.356666]  [<c17b762e>] ? pcibios_root_bridge_prepare+0xe/0x20
> [    0.356666]  [<c13d7a8b>] pci_create_root_bus+0x5b/0x340
> [    0.356666]  [<c11a77d2>] ? kmem_cache_alloc_trace+0x3a2/0x4b0
> [    0.356666]  [<c1093cf9>] ? insert_resource_conflict+0x19/0x40
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c13d5a48>] ? pci_add_resource_offset+0x28/0x60
> [    0.356666]  [<c17b750b>] pci_acpi_scan_root+0x25b/0x370
> [    0.356666]  [<c1401686>] acpi_pci_root_add+0x223/0x2c9
> [    0.356666]  [<c13fc8ed>] ? acpi_bus_get_status_handle+0x18/0x3a
> [    0.356666]  [<c13fedb3>] acpi_bus_attach+0xb5/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c195d60d>] ? mutex_unlock+0xd/0x10
> [    0.356666]  [<c1474b9c>] ? device_attach+0x8c/0xa0
> [    0.356666]  [<c13fee1c>] acpi_bus_attach+0x11e/0x160
> [    0.356666]  [<c13feea7>] acpi_bus_scan+0x49/0x59
> [    0.356666]  [<c1ddfa74>] acpi_scan_init+0x5b/0x16b
> [    0.356666]  [<c1ddf8cc>] acpi_init+0x205/0x220
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c100044e>] do_one_initcall+0x7e/0x1b0
> [    0.356666]  [<c1ddf6c7>] ? acpi_sleep_proc_init+0x23/0x23
> [    0.356666]  [<c1da7500>] ? initcall_blacklist+0x23/0x81
> [    0.356666]  [<c10ae039>] ? parse_args+0x1d9/0x360
> [    0.356666]  [<c10a5361>] ? __usermodehelper_set_disable_depth+0x41/0x=
50
> [    0.356666]  [<c1da7d9c>] kernel_init_freeable+0x1b2/0x249
> [    0.356666]  [<c1da755e>] ? initcall_blacklist+0x81/0x81
> [    0.356666]  [<c194b840>] kernel_init+0x10/0xe0
> [    0.356666]  [<c195f681>] ret_from_kernel_thread+0x21/0x30
> [    0.356666]  [<c194b830>] ? rest_init+0x130/0x130
> [    0.356666] ---[ end trace 849b10f6fad5eb70 ]---
> [    0.356673] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x00000009
> [    0.356673] =

> [    0.359999] Rebooting in 10 seconds..
> Elapsed time: 10
> qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/i386-randconfig=
-r1-0711/6f99bc949b1c90ff342a7d44ac4122322a7ccb78/vmlinuz-3.16.0-rc1-00005-=
g6f99bc9 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 debug apic=
=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D=
10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=3D0 console=3D=
ttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuil=
d-tests/run-queue/kvm/i386-randconfig-r1-0711/cdall-kvm-arm:apm_linux_v3.16=
-rc1:6f99bc949b1c90ff342a7d44ac4122322a7ccb78:bisect-linux-1/.vmlinuz-6f99b=
c949b1c90ff342a7d44ac4122322a7ccb78-20140712092656-2-ivb41 branch=3Dcdall-k=
vm-arm/apm_linux_v3.16-rc1 BOOT_IMAGE=3D/kernel/i386-randconfig-r1-0711/6f9=
9bc949b1c90ff342a7d44ac4122322a7ccb78/vmlinuz-3.16.0-rc1-00005-g6f99bc9 drb=
d.minor_count=3D8'  -initrd /kernel-tests/initrd/quantal-core-i386.cgz -m 3=
20 -smp 2 -net nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3D=
nc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kb=
oot/pid-quantal-ivb41-111 -serial file:/dev/shm/kboot/serial-quantal-ivb41-=
111 -daemonize -display none -monitor null =



> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 3.16.0-rc1 Kernel Configuration
> #
> # CONFIG_64BIT is not set
> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
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
> # CONFIG_ZONE_DMA32 is not set
> # CONFIG_AUDIT_ARCH is not set
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_32_SMP=3Dy
> CONFIG_X86_HT=3Dy
> CONFIG_X86_32_LAZY_GS=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
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
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SWAP is not set
> # CONFIG_SYSVIPC is not set
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> CONFIG_AUDIT_WATCH=3Dy
> CONFIG_AUDIT_TREE=3Dy
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
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_KTIME_SCALAR=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> CONFIG_TASK_XACCT=3Dy
> CONFIG_TASK_IO_ACCOUNTING=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_PREEMPT_RCU=3Dy
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FANOUT_EXACT is not set
> CONFIG_TREE_RCU_TRACE=3Dy
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_NOCB_CPU=3Dy
> # CONFIG_RCU_NOCB_CPU_NONE is not set
> CONFIG_RCU_NOCB_CPU_ZERO=3Dy
> # CONFIG_RCU_NOCB_CPU_ALL is not set
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_WANTS_PROT_NUMA_PROT_NONE=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_RESOURCE_COUNTERS=3Dy
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_HUGETLB is not set
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> CONFIG_IPC_NS=3Dy
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
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
> CONFIG_KALLSYMS_ALL=3Dy
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
> CONFIG_PERF_USE_VMALLOC=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
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
> CONFIG_USER_RETURN_NOTIFIER=3Dy
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
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
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
> # CONFIG_MODULE_SIG_ALL is not set
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> # CONFIG_MODULE_SIG_SHA256 is not set
> CONFIG_MODULE_SIG_SHA384=3Dy
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha384"
> CONFIG_STOP_MACHINE=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBDAF is not set
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> # CONFIG_BLK_CMDLINE_PARSER is not set
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dm
> # CONFIG_IOSCHED_CFQ is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
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
> # CONFIG_X86_BIGSMP is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_RDC321X is not set
> CONFIG_X86_32_NON_STANDARD=3Dy
> # CONFIG_STA2X11 is not set
> # CONFIG_X86_32_IRIS is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> CONFIG_MEMTEST=3Dy
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> CONFIG_M586TSC=3Dy
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> # CONFIG_MPENTIUMIII is not set
> # CONFIG_MPENTIUMM is not set
> # CONFIG_MPENTIUM4 is not set
> # CONFIG_MK6 is not set
> # CONFIG_MK7 is not set
> # CONFIG_MK8 is not set
> # CONFIG_MCRUSOE is not set
> # CONFIG_MEFFICEON is not set
> # CONFIG_MWINCHIPC6 is not set
> # CONFIG_MWINCHIP3D is not set
> # CONFIG_MELAN is not set
> # CONFIG_MGEODEGX1 is not set
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> CONFIG_X86_L1_CACHE_SHIFT=3D5
> # CONFIG_X86_PPRO_FENCE is not set
> CONFIG_X86_F00F_BUG=3Dy
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_NR_CPUS=3D8
> # CONFIG_SCHED_SMT is not set
> CONFIG_SCHED_MC=3Dy
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> # CONFIG_X86_ANCIENT_MCE is not set
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dy
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_VM86=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> # CONFIG_TOSHIBA is not set
> # CONFIG_I8K is not set
> CONFIG_X86_REBOOTFIXUPS=3Dy
> # CONFIG_MICROCODE is not set
> # CONFIG_MICROCODE_INTEL_EARLY is not set
> # CONFIG_MICROCODE_AMD_EARLY is not set
> CONFIG_X86_MSR=3Dm
> # CONFIG_X86_CPUID is not set
> # CONFIG_NOHIGHMEM is not set
> CONFIG_HIGHMEM4G=3Dy
> # CONFIG_HIGHMEM64G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_NEED_NODE_MEMMAP_SIZE=3Dy
> CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_FLATMEM_MANUAL is not set
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_STATIC=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTREMOVE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> # CONFIG_PHYS_ADDR_T_64BIT is not set
> CONFIG_ZONE_DMA_FLAG=3D1
> # CONFIG_BOUNCE is not set
> CONFIG_NEED_BOUNCE_POOL=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> # CONFIG_ZBUD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_HIGHPTE is not set
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MATH_EMULATION=3Dy
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
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> CONFIG_SCHED_HRTICK=3Dy
> # CONFIG_KEXEC is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> CONFIG_COMPAT_VDSO=3Dy
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> CONFIG_PM_WAKELOCKS_GC=3Dy
> # CONFIG_PM_RUNTIME is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> CONFIG_PM_TRACE=3Dy
> CONFIG_PM_TRACE_RTC=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
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
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> # CONFIG_ACPI_HOTPLUG_MEMORY is not set
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_APEI is not set
> # CONFIG_ACPI_EXTLOG is not set
> # CONFIG_SFI is not set
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dm
> # CONFIG_APM_IGNORE_USER_SUSPEND is not set
> # CONFIG_APM_DO_ENABLE is not set
> # CONFIG_APM_CPU_IDLE is not set
> # CONFIG_APM_DISPLAY_BLANK is not set
> # CONFIG_APM_ALLOW_INTS is not set
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dm
> # CONFIG_CPU_FREQ_STAT_DETAILS is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> # CONFIG_CPU_FREQ_GOV_CONSERVATIVE is not set
> =

> #
> # x86 CPU frequency scaling drivers
> #
> # CONFIG_X86_INTEL_PSTATE is not set
> # CONFIG_X86_PCC_CPUFREQ is not set
> # CONFIG_X86_ACPI_CPUFREQ is not set
> CONFIG_X86_POWERNOW_K6=3Dm
> CONFIG_X86_POWERNOW_K7=3Dm
> CONFIG_X86_POWERNOW_K7_ACPI=3Dy
> CONFIG_X86_GX_SUSPMOD=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dm
> CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> # CONFIG_X86_SPEEDSTEP_ICH is not set
> # CONFIG_X86_SPEEDSTEP_SMI is not set
> CONFIG_X86_P4_CLOCKMOD=3Dy
> # CONFIG_X86_CPUFREQ_NFORCE2 is not set
> # CONFIG_X86_LONGRUN is not set
> # CONFIG_X86_LONGHAUL is not set
> # CONFIG_X86_E_POWERSAVER is not set
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
> # CONFIG_CPU_IDLE_MULTIPLE_DRIVERS is not set
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> # CONFIG_PCI_GOBIOS is not set
> # CONFIG_PCI_GOMMCONFIG is not set
> # CONFIG_PCI_GODIRECT is not set
> CONFIG_PCI_GOOLPC=3Dy
> # CONFIG_PCI_GOANY is not set
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_OLPC=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> # CONFIG_PCIEAER is not set
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEBUG is not set
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> # CONFIG_PCI_PASID is not set
> # CONFIG_PCI_IOAPIC is not set
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> # CONFIG_ISA is not set
> # CONFIG_SCx200 is not set
> CONFIG_OLPC=3Dy
> CONFIG_OLPC_XO1_PM=3Dy
> # CONFIG_OLPC_XO1_SCI is not set
> # CONFIG_OLPC_XO15_SCI is not set
> # CONFIG_ALIX is not set
> CONFIG_NET5501=3Dy
> CONFIG_GEOS=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dm
> CONFIG_PCMCIA=3Dm
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> CONFIG_I82092=3Dm
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> CONFIG_HOTPLUG_PCI_CPCI=3Dy
> CONFIG_HOTPLUG_PCI_CPCI_ZT5550=3Dy
> # CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> CONFIG_RAPIDIO=3Dm
> CONFIG_RAPIDIO_TSI721=3Dm
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_ENUM_BASIC=3Dm
> =

> #
> # RapidIO Switch drivers
> #
> # CONFIG_RAPIDIO_TSI57X is not set
> CONFIG_RAPIDIO_CPS_XX=3Dm
> CONFIG_RAPIDIO_TSI568=3Dm
> CONFIG_RAPIDIO_CPS_GEN2=3Dm
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> # CONFIG_BINFMT_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> CONFIG_IOSF_MBI=3Dm
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dm
> # CONFIG_PACKET_DIAG is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dm
> # CONFIG_XFRM_SUB_POLICY is not set
> # CONFIG_XFRM_MIGRATE is not set
> # CONFIG_XFRM_STATISTICS is not set
> CONFIG_XFRM_IPCOMP=3Dy
> CONFIG_NET_KEY=3Dy
> # CONFIG_NET_KEY_MIGRATE is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> # CONFIG_IP_ADVANCED_ROUTER is not set
> # CONFIG_IP_PNP is not set
> CONFIG_NET_IPIP=3Dy
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dy
> CONFIG_NET_IPGRE=3Dm
> # CONFIG_NET_IPGRE_BROADCAST is not set
> # CONFIG_IP_MROUTE is not set
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_INET_AH=3Dy
> CONFIG_INET_ESP=3Dy
> CONFIG_INET_IPCOMP=3Dy
> CONFIG_INET_XFRM_TUNNEL=3Dy
> CONFIG_INET_TUNNEL=3Dy
> CONFIG_INET_XFRM_MODE_TRANSPORT=3Dm
> CONFIG_INET_XFRM_MODE_TUNNEL=3Dm
> CONFIG_INET_XFRM_MODE_BEET=3Dm
> # CONFIG_INET_LRO is not set
> CONFIG_INET_DIAG=3Dy
> CONFIG_INET_TCP_DIAG=3Dy
> CONFIG_INET_UDP_DIAG=3Dm
> # CONFIG_TCP_CONG_ADVANCED is not set
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> # CONFIG_IPV6 is not set
> CONFIG_NETLABEL=3Dy
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> # CONFIG_NETFILTER_DEBUG is not set
> # CONFIG_NETFILTER_ADVANCED is not set
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_NETLINK=3Dy
> # CONFIG_NETFILTER_NETLINK_LOG is not set
> # CONFIG_NF_CONNTRACK is not set
> CONFIG_NF_TABLES=3Dy
> CONFIG_NFT_EXTHDR=3Dm
> CONFIG_NFT_META=3Dm
> CONFIG_NFT_RBTREE=3Dm
> CONFIG_NFT_HASH=3Dm
> # CONFIG_NFT_COUNTER is not set
> # CONFIG_NFT_LOG is not set
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_REJECT=3Dm
> # CONFIG_NFT_COMPAT is not set
> CONFIG_NETFILTER_XTABLES=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dm
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> # CONFIG_NETFILTER_XT_TARGET_NFLOG is not set
> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dy
> # CONFIG_NETFILTER_XT_TARGET_TCPMSS is not set
> =

> #
> # Xtables matches
> #
> # CONFIG_NETFILTER_XT_MATCH_POLICY is not set
> # CONFIG_IP_SET is not set
> CONFIG_IP_VS=3Dy
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> # CONFIG_IP_VS_PROTO_TCP is not set
> CONFIG_IP_VS_PROTO_UDP=3Dy
> # CONFIG_IP_VS_PROTO_AH_ESP is not set
> # CONFIG_IP_VS_PROTO_ESP is not set
> # CONFIG_IP_VS_PROTO_AH is not set
> # CONFIG_IP_VS_PROTO_SCTP is not set
> =

> #
> # IPVS scheduler
> #
> # CONFIG_IP_VS_RR is not set
> CONFIG_IP_VS_WRR=3Dy
> CONFIG_IP_VS_LC=3Dm
> CONFIG_IP_VS_WLC=3Dm
> CONFIG_IP_VS_LBLC=3Dy
> # CONFIG_IP_VS_LBLCR is not set
> # CONFIG_IP_VS_DH is not set
> CONFIG_IP_VS_SH=3Dm
> # CONFIG_IP_VS_SED is not set
> CONFIG_IP_VS_NQ=3Dy
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS application helper
> #
> =

> #
> # IP: Netfilter Configuration
> #
> # CONFIG_NF_DEFRAG_IPV4 is not set
> CONFIG_NF_TABLES_IPV4=3Dm
> CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NF_TABLES_ARP=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> # CONFIG_IP_NF_TARGET_REJECT is not set
> CONFIG_IP_NF_TARGET_ULOG=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> CONFIG_IP_NF_RAW=3Dm
> CONFIG_NF_TABLES_BRIDGE=3Dm
> CONFIG_NFT_BRIDGE_META=3Dm
> CONFIG_BRIDGE_NF_EBTABLES=3Dy
> # CONFIG_BRIDGE_EBT_BROUTE is not set
> CONFIG_BRIDGE_EBT_T_FILTER=3Dy
> CONFIG_BRIDGE_EBT_T_NAT=3Dy
> CONFIG_BRIDGE_EBT_802_3=3Dy
> # CONFIG_BRIDGE_EBT_AMONG is not set
> # CONFIG_BRIDGE_EBT_ARP is not set
> # CONFIG_BRIDGE_EBT_IP is not set
> # CONFIG_BRIDGE_EBT_LIMIT is not set
> CONFIG_BRIDGE_EBT_MARK=3Dy
> # CONFIG_BRIDGE_EBT_PKTTYPE is not set
> CONFIG_BRIDGE_EBT_STP=3Dy
> CONFIG_BRIDGE_EBT_VLAN=3Dy
> # CONFIG_BRIDGE_EBT_ARPREPLY is not set
> CONFIG_BRIDGE_EBT_DNAT=3Dm
> CONFIG_BRIDGE_EBT_MARK_T=3Dm
> CONFIG_BRIDGE_EBT_REDIRECT=3Dy
> CONFIG_BRIDGE_EBT_SNAT=3Dm
> CONFIG_BRIDGE_EBT_LOG=3Dm
> # CONFIG_BRIDGE_EBT_ULOG is not set
> # CONFIG_BRIDGE_EBT_NFLOG is not set
> # CONFIG_IP_DCCP is not set
> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_RDS is not set
> # CONFIG_TIPC is not set
> # CONFIG_ATM is not set
> # CONFIG_L2TP is not set
> CONFIG_STP=3Dy
> CONFIG_BRIDGE=3Dy
> # CONFIG_BRIDGE_IGMP_SNOOPING is not set
> CONFIG_HAVE_NET_DSA=3Dy
> CONFIG_NET_DSA=3Dy
> CONFIG_NET_DSA_TAG_DSA=3Dy
> # CONFIG_VLAN_8021Q is not set
> CONFIG_DECNET=3Dm
> CONFIG_DECNET_ROUTER=3Dy
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> CONFIG_IPX=3Dy
> # CONFIG_IPX_INTERN is not set
> CONFIG_ATALK=3Dm
> CONFIG_DEV_APPLETALK=3Dm
> # CONFIG_IPDDP is not set
> # CONFIG_X25 is not set
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dm
> CONFIG_IEEE802154=3Dy
> CONFIG_MAC802154=3Dm
> # CONFIG_NET_SCHED is not set
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> CONFIG_VSOCKETS=3Dm
> # CONFIG_VMWARE_VMCI_VSOCKETS is not set
> CONFIG_NETLINK_MMAP=3Dy
> # CONFIG_NETLINK_DIAG is not set
> CONFIG_NET_MPLS_GSO=3Dm
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
> # CONFIG_NET_PKTGEN is not set
> # CONFIG_NET_DROP_MONITOR is not set
> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> # CONFIG_AX25 is not set
> CONFIG_CAN=3Dy
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dy
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> # CONFIG_CAN_SLCAN is not set
> # CONFIG_CAN_DEV is not set
> # CONFIG_CAN_DEBUG_DEVICES is not set
> CONFIG_IRDA=3Dy
> =

> #
> # IrDA protocols
> #
> CONFIG_IRLAN=3Dm
> CONFIG_IRNET=3Dm
> CONFIG_IRCOMM=3Dy
> # CONFIG_IRDA_ULTRA is not set
> =

> #
> # IrDA options
> #
> # CONFIG_IRDA_CACHE_LAST_LSAP is not set
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
> CONFIG_IRTTY_SIR=3Dm
> =

> #
> # Dongle support
> #
> # CONFIG_DONGLE is not set
> =

> #
> # FIR device drivers
> #
> CONFIG_NSC_FIR=3Dy
> # CONFIG_WINBOND_FIR is not set
> CONFIG_TOSHIBA_FIR=3Dm
> # CONFIG_SMC_IRCC_FIR is not set
> CONFIG_ALI_FIR=3Dm
> CONFIG_VLSI_FIR=3Dy
> CONFIG_VIA_FIR=3Dm
> # CONFIG_BT is not set
> CONFIG_AF_RXRPC=3Dy
> CONFIG_AF_RXRPC_DEBUG=3Dy
> CONFIG_RXKAD=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_WIRELESS_EXT=3Dy
> CONFIG_WEXT_CORE=3Dy
> CONFIG_WEXT_PROC=3Dy
> CONFIG_WEXT_SPY=3Dy
> CONFIG_WEXT_PRIV=3Dy
> CONFIG_CFG80211=3Dy
> CONFIG_NL80211_TESTMODE=3Dy
> CONFIG_CFG80211_DEVELOPER_WARNINGS=3Dy
> CONFIG_CFG80211_REG_DEBUG=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> # CONFIG_CFG80211_INTERNAL_REGDB is not set
> # CONFIG_CFG80211_WEXT is not set
> CONFIG_LIB80211=3Dm
> CONFIG_LIB80211_CRYPT_WEP=3Dm
> CONFIG_LIB80211_CRYPT_CCMP=3Dm
> CONFIG_LIB80211_CRYPT_TKIP=3Dm
> CONFIG_LIB80211_DEBUG=3Dy
> # CONFIG_MAC80211 is not set
> # CONFIG_WIMAX is not set
> CONFIG_RFKILL=3Dy
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> # CONFIG_RFKILL_REGULATOR is not set
> CONFIG_RFKILL_GPIO=3Dy
> # CONFIG_NET_9P is not set
> CONFIG_CAIF=3Dy
> CONFIG_CAIF_DEBUG=3Dy
> # CONFIG_CAIF_NETDEV is not set
> CONFIG_CAIF_USB=3Dm
> # CONFIG_CEPH_LIB is not set
> CONFIG_NFC=3Dy
> CONFIG_NFC_DIGITAL=3Dm
> CONFIG_NFC_NCI=3Dy
> # CONFIG_NFC_HCI is not set
> =

> #
> # Near Field Communication (NFC) devices
> #
> # CONFIG_NFC_SIM is not set
> CONFIG_NFC_MRVL=3Dy
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
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
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
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> # CONFIG_DMA_SHARED_BUFFER is not set
> CONFIG_DMA_CMA=3Dy
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D16
> CONFIG_CMA_SIZE_PERCENTAGE=3D10
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> # CONFIG_CMA_SIZE_SEL_MIN is not set
> CONFIG_CMA_SIZE_SEL_MAX=3Dy
> CONFIG_CMA_ALIGNMENT=3D8
> CONFIG_CMA_AREAS=3D7
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dm
> # CONFIG_MTD is not set
> CONFIG_OF=3Dy
> =

> #
> # Device Tree and Open Firmware support
> #
> # CONFIG_OF_SELFTEST is not set
> CONFIG_OF_PROMTREE=3Dy
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_ADDRESS_PCI=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_MDIO=3Dy
> CONFIG_OF_PCI=3Dy
> CONFIG_OF_PCI_IRQ=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
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
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RBD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> CONFIG_AD525X_DPOT=3Dm
> CONFIG_AD525X_DPOT_I2C=3Dm
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dm
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_CS5535_MFGPT=3Dy
> CONFIG_CS5535_MFGPT_DEFAULT_IRQ=3D7
> CONFIG_CS5535_CLOCK_EVENT_SRC=3Dy
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1780=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> # CONFIG_SENSORS_APDS990X is not set
> CONFIG_HMC6352=3Dm
> CONFIG_DS1682=3Dm
> # CONFIG_VMWARE_BALLOON is not set
> # CONFIG_BMP085_I2C is not set
> CONFIG_PCH_PHUB=3Dm
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_SRAM=3Dy
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dm
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> CONFIG_SENSORS_LIS3_I2C=3Dm
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> CONFIG_INTEL_MEI_TXE=3Dm
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> CONFIG_ECHO=3Dm
> CONFIG_HAVE_IDE=3Dy
> CONFIG_IDE=3Dm
> =

> #
> # Please see Documentation/ide/ide.txt for help/info on IDE drives
> #
> CONFIG_IDE_XFER_MODE=3Dy
> CONFIG_IDE_TIMINGS=3Dy
> CONFIG_IDE_ATAPI=3Dy
> # CONFIG_BLK_DEV_IDE_SATA is not set
> # CONFIG_IDE_GD is not set
> # CONFIG_BLK_DEV_IDECS is not set
> # CONFIG_BLK_DEV_IDECD is not set
> CONFIG_BLK_DEV_IDETAPE=3Dm
> # CONFIG_BLK_DEV_IDEACPI is not set
> CONFIG_IDE_TASK_IOCTL=3Dy
> # CONFIG_IDE_PROC_FS is not set
> =

> #
> # IDE chipset support/bugfixes
> #
> # CONFIG_IDE_GENERIC is not set
> CONFIG_BLK_DEV_PLATFORM=3Dm
> CONFIG_BLK_DEV_CMD640=3Dm
> # CONFIG_BLK_DEV_CMD640_ENHANCED is not set
> # CONFIG_BLK_DEV_IDEPNP is not set
> CONFIG_BLK_DEV_IDEDMA_SFF=3Dy
> =

> #
> # PCI IDE chipsets support
> #
> CONFIG_BLK_DEV_IDEPCI=3Dy
> CONFIG_BLK_DEV_OFFBOARD=3Dy
> CONFIG_BLK_DEV_GENERIC=3Dm
> # CONFIG_BLK_DEV_OPTI621 is not set
> CONFIG_BLK_DEV_RZ1000=3Dm
> CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
> # CONFIG_BLK_DEV_AEC62XX is not set
> # CONFIG_BLK_DEV_ALI15X3 is not set
> CONFIG_BLK_DEV_AMD74XX=3Dm
> # CONFIG_BLK_DEV_ATIIXP is not set
> # CONFIG_BLK_DEV_CMD64X is not set
> CONFIG_BLK_DEV_TRIFLEX=3Dm
> CONFIG_BLK_DEV_CS5520=3Dm
> # CONFIG_BLK_DEV_CS5530 is not set
> CONFIG_BLK_DEV_CS5535=3Dm
> # CONFIG_BLK_DEV_CS5536 is not set
> # CONFIG_BLK_DEV_HPT366 is not set
> # CONFIG_BLK_DEV_JMICRON is not set
> CONFIG_BLK_DEV_SC1200=3Dm
> # CONFIG_BLK_DEV_PIIX is not set
> CONFIG_BLK_DEV_IT8172=3Dm
> # CONFIG_BLK_DEV_IT8213 is not set
> CONFIG_BLK_DEV_IT821X=3Dm
> CONFIG_BLK_DEV_NS87415=3Dm
> CONFIG_BLK_DEV_PDC202XX_OLD=3Dm
> CONFIG_BLK_DEV_PDC202XX_NEW=3Dm
> # CONFIG_BLK_DEV_SVWKS is not set
> CONFIG_BLK_DEV_SIIMAGE=3Dm
> # CONFIG_BLK_DEV_SIS5513 is not set
> CONFIG_BLK_DEV_SLC90E66=3Dm
> CONFIG_BLK_DEV_TRM290=3Dm
> CONFIG_BLK_DEV_VIA82CXXX=3Dm
> # CONFIG_BLK_DEV_TC86C001 is not set
> CONFIG_BLK_DEV_IDEDMA=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_TGT=3Dm
> CONFIG_SCSI_NETLINK=3Dy
> # CONFIG_SCSI_PROC_FS is not set
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_CHR_DEV_OSST=3Dm
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_BLK_DEV_SR_VENDOR=3Dy
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> # CONFIG_SCSI_MULTI_LUN is not set
> # CONFIG_SCSI_CONSTANTS is not set
> CONFIG_SCSI_LOGGING=3Dy
> # CONFIG_SCSI_SCAN_ASYNC is not set
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
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dy
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_TCP=3Dm
> CONFIG_ISCSI_BOOT_SYSFS=3Dy
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> CONFIG_SCSI_CXGB4_ISCSI=3Dm
> CONFIG_SCSI_BNX2_ISCSI=3Dm
> # CONFIG_SCSI_BNX2X_FCOE is not set
> # CONFIG_BE2ISCSI is not set
> CONFIG_BLK_DEV_3W_XXXX_RAID=3Dm
> # CONFIG_SCSI_HPSA is not set
> CONFIG_SCSI_3W_9XXX=3Dy
> CONFIG_SCSI_3W_SAS=3Dy
> CONFIG_SCSI_ACARD=3Dm
> CONFIG_SCSI_AACRAID=3Dm
> CONFIG_SCSI_AIC7XXX=3Dy
> CONFIG_AIC7XXX_CMDS_PER_DEVICE=3D32
> CONFIG_AIC7XXX_RESET_DELAY_MS=3D5000
> CONFIG_AIC7XXX_DEBUG_ENABLE=3Dy
> CONFIG_AIC7XXX_DEBUG_MASK=3D0
> CONFIG_AIC7XXX_REG_PRETTY_PRINT=3Dy
> CONFIG_SCSI_AIC79XX=3Dm
> CONFIG_AIC79XX_CMDS_PER_DEVICE=3D32
> CONFIG_AIC79XX_RESET_DELAY_MS=3D5000
> CONFIG_AIC79XX_DEBUG_ENABLE=3Dy
> CONFIG_AIC79XX_DEBUG_MASK=3D0
> # CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
> CONFIG_SCSI_AIC94XX=3Dy
> # CONFIG_AIC94XX_DEBUG is not set
> # CONFIG_SCSI_MVSAS is not set
> CONFIG_SCSI_MVUMI=3Dy
> # CONFIG_SCSI_DPT_I2O is not set
> CONFIG_SCSI_ADVANSYS=3Dy
> CONFIG_SCSI_ARCMSR=3Dm
> CONFIG_SCSI_ESAS2R=3Dy
> # CONFIG_MEGARAID_NEWGEN is not set
> CONFIG_MEGARAID_LEGACY=3Dy
> CONFIG_MEGARAID_SAS=3Dm
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_MPT3SAS is not set
> CONFIG_SCSI_UFSHCD=3Dm
> # CONFIG_SCSI_UFSHCD_PCI is not set
> CONFIG_SCSI_UFSHCD_PLATFORM=3Dm
> CONFIG_SCSI_HPTIOP=3Dy
> CONFIG_SCSI_BUSLOGIC=3Dy
> CONFIG_SCSI_FLASHPOINT=3Dy
> CONFIG_VMWARE_PVSCSI=3Dm
> CONFIG_LIBFC=3Dm
> CONFIG_LIBFCOE=3Dm
> CONFIG_FCOE=3Dm
> CONFIG_FCOE_FNIC=3Dm
> CONFIG_SCSI_DMX3191D=3Dm
> CONFIG_SCSI_EATA=3Dy
> CONFIG_SCSI_EATA_TAGGED_QUEUE=3Dy
> # CONFIG_SCSI_EATA_LINKED_COMMANDS is not set
> CONFIG_SCSI_EATA_MAX_TAGS=3D16
> # CONFIG_SCSI_FUTURE_DOMAIN is not set
> CONFIG_SCSI_GDTH=3Dm
> # CONFIG_SCSI_ISCI is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> CONFIG_SCSI_INIA100=3Dm
> CONFIG_SCSI_STEX=3Dm
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> CONFIG_SCSI_IPR=3Dm
> # CONFIG_SCSI_IPR_TRACE is not set
> CONFIG_SCSI_IPR_DUMP=3Dy
> CONFIG_SCSI_QLOGIC_1280=3Dm
> # CONFIG_SCSI_QLA_FC is not set
> CONFIG_SCSI_QLA_ISCSI=3Dy
> # CONFIG_SCSI_LPFC is not set
> CONFIG_SCSI_DC395x=3Dm
> # CONFIG_SCSI_DC390T is not set
> CONFIG_SCSI_NSP32=3Dy
> # CONFIG_SCSI_DEBUG is not set
> CONFIG_SCSI_PMCRAID=3Dm
> # CONFIG_SCSI_PM8001 is not set
> CONFIG_SCSI_SRP=3Dm
> # CONFIG_SCSI_BFA_FC is not set
> # CONFIG_SCSI_VIRTIO is not set
> CONFIG_SCSI_CHELSIO_FCOE=3Dy
> CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> CONFIG_PCMCIA_AHA152X=3Dm
> # CONFIG_PCMCIA_FDOMAIN is not set
> # CONFIG_PCMCIA_NINJA_SCSI is not set
> # CONFIG_PCMCIA_QLOGIC is not set
> # CONFIG_PCMCIA_SYM53C500 is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dm
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dm
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> # CONFIG_SCSI_OSD_ULD is not set
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> # CONFIG_SCSI_OSD_DEBUG is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_ACPI=3Dy
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> CONFIG_SATA_INIC162X=3Dm
> CONFIG_SATA_ACARD_AHCI=3Dy
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> CONFIG_PDC_ADMA=3Dm
> CONFIG_SATA_QSTOR=3Dy
> CONFIG_SATA_SX4=3Dy
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=3Dm
> CONFIG_SATA_MV=3Dm
> CONFIG_SATA_NV=3Dy
> CONFIG_SATA_PROMISE=3Dy
> # CONFIG_SATA_SIL is not set
> CONFIG_SATA_SIS=3Dm
> CONFIG_SATA_SVW=3Dy
> CONFIG_SATA_ULI=3Dy
> CONFIG_SATA_VIA=3Dm
> CONFIG_SATA_VITESSE=3Dy
> =

> #
> # PATA SFF controllers with BMDMA
> #
> CONFIG_PATA_ALI=3Dy
> # CONFIG_PATA_AMD is not set
> CONFIG_PATA_ARTOP=3Dy
> CONFIG_PATA_ATIIXP=3Dy
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> CONFIG_PATA_CS5520=3Dm
> # CONFIG_PATA_CS5530 is not set
> # CONFIG_PATA_CS5535 is not set
> # CONFIG_PATA_CS5536 is not set
> CONFIG_PATA_CYPRESS=3Dy
> CONFIG_PATA_EFAR=3Dm
> CONFIG_PATA_HPT366=3Dm
> # CONFIG_PATA_HPT37X is not set
> CONFIG_PATA_HPT3X2N=3Dm
> CONFIG_PATA_HPT3X3=3Dy
> CONFIG_PATA_HPT3X3_DMA=3Dy
> # CONFIG_PATA_IT8213 is not set
> CONFIG_PATA_IT821X=3Dy
> CONFIG_PATA_JMICRON=3Dm
> # CONFIG_PATA_MARVELL is not set
> CONFIG_PATA_NETCELL=3Dm
> CONFIG_PATA_NINJA32=3Dm
> CONFIG_PATA_NS87415=3Dy
> # CONFIG_PATA_OLDPIIX is not set
> CONFIG_PATA_OPTIDMA=3Dy
> # CONFIG_PATA_PDC2027X is not set
> CONFIG_PATA_PDC_OLD=3Dm
> # CONFIG_PATA_RADISYS is not set
> CONFIG_PATA_RDC=3Dy
> # CONFIG_PATA_SC1200 is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> CONFIG_PATA_SIL680=3Dy
> CONFIG_PATA_SIS=3Dm
> CONFIG_PATA_TOSHIBA=3Dy
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> CONFIG_PATA_CMD640_PCI=3Dy
> CONFIG_PATA_MPIIX=3Dm
> CONFIG_PATA_NS87410=3Dm
> CONFIG_PATA_OPTI=3Dy
> # CONFIG_PATA_PCMCIA is not set
> CONFIG_PATA_RZ1000=3Dy
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> # CONFIG_ATA_GENERIC is not set
> # CONFIG_PATA_LEGACY is not set
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> # CONFIG_TCM_FILEIO is not set
> # CONFIG_TCM_PSCSI is not set
> CONFIG_LOOPBACK_TARGET=3Dm
> # CONFIG_TCM_FC is not set
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> CONFIG_I2O=3Dm
> # CONFIG_I2O_LCT_NOTIFY_ON_CHANGES is not set
> # CONFIG_I2O_EXT_ADAPTEC is not set
> CONFIG_I2O_CONFIG=3Dm
> CONFIG_I2O_CONFIG_OLD_IOCTL=3Dy
> CONFIG_I2O_BUS=3Dm
> CONFIG_I2O_BLOCK=3Dm
> CONFIG_I2O_SCSI=3Dm
> # CONFIG_I2O_PROC is not set
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_MAC_EMUMOUSEBTN is not set
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> # CONFIG_NET_CORE is not set
> CONFIG_ARCNET=3Dm
> CONFIG_ARCNET_1201=3Dm
> # CONFIG_ARCNET_1051 is not set
> CONFIG_ARCNET_RAW=3Dm
> CONFIG_ARCNET_CAP=3Dm
> CONFIG_ARCNET_COM90xx=3Dm
> # CONFIG_ARCNET_COM90xxIO is not set
> CONFIG_ARCNET_RIM_I=3Dm
> CONFIG_ARCNET_COM20020=3Dm
> CONFIG_ARCNET_COM20020_PCI=3Dm
> CONFIG_ARCNET_COM20020_CS=3Dm
> =

> #
> # CAIF transport drivers
> #
> # CONFIG_CAIF_TTY is not set
> CONFIG_CAIF_SPI_SLAVE=3Dy
> # CONFIG_CAIF_SPI_SYNC is not set
> # CONFIG_CAIF_HSI is not set
> CONFIG_CAIF_VIRTIO=3Dy
> CONFIG_VHOST_NET=3Dm
> CONFIG_VHOST_SCSI=3Dm
> CONFIG_VHOST_RING=3Dy
> CONFIG_VHOST=3Dm
> =

> #
> # Distributed Switch Architecture drivers
> #
> CONFIG_NET_DSA_MV88E6XXX=3Dy
> # CONFIG_NET_DSA_MV88E6060 is not set
> CONFIG_NET_DSA_MV88E6XXX_NEED_PPU=3Dy
> CONFIG_NET_DSA_MV88E6131=3Dy
> # CONFIG_NET_DSA_MV88E6123_61_65 is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> # CONFIG_NET_VENDOR_3COM is not set
> # CONFIG_NET_VENDOR_ADAPTEC is not set
> # CONFIG_NET_VENDOR_ALTEON is not set
> CONFIG_ALTERA_TSE=3Dy
> CONFIG_NET_VENDOR_AMD=3Dy
> CONFIG_AMD8111_ETH=3Dm
> CONFIG_PCNET32=3Dy
> CONFIG_PCMCIA_NMCLAN=3Dm
> CONFIG_AMD_XGBE=3Dy
> # CONFIG_NET_VENDOR_ARC is not set
> # CONFIG_NET_VENDOR_ATHEROS is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> CONFIG_B44=3Dy
> CONFIG_B44_PCI_AUTOSELECT=3Dy
> CONFIG_B44_PCICORE_AUTOSELECT=3Dy
> CONFIG_B44_PCI=3Dy
> CONFIG_BCMGENET=3Dm
> CONFIG_BNX2=3Dm
> CONFIG_CNIC=3Dm
> CONFIG_TIGON3=3Dy
> CONFIG_BNX2X=3Dy
> CONFIG_BNX2X_SRIOV=3Dy
> # CONFIG_SYSTEMPORT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_CALXEDA_XGMAC=3Dy
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> CONFIG_CHELSIO_T1=3Dy
> # CONFIG_CHELSIO_T1_1G is not set
> # CONFIG_CHELSIO_T3 is not set
> CONFIG_CHELSIO_T4=3Dy
> # CONFIG_CHELSIO_T4VF is not set
> # CONFIG_NET_VENDOR_CISCO is not set
> # CONFIG_CX_ECAT is not set
> CONFIG_DNET=3Dy
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> # CONFIG_NET_VENDOR_DLINK is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> CONFIG_BE2NET=3Dy
> # CONFIG_NET_VENDOR_EXAR is not set
> # CONFIG_NET_VENDOR_FUJITSU is not set
> CONFIG_NET_VENDOR_HP=3Dy
> CONFIG_HP100=3Dm
> # CONFIG_NET_VENDOR_INTEL is not set
> CONFIG_IP1000=3Dm
> # CONFIG_JME is not set
> # CONFIG_NET_VENDOR_MARVELL is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> CONFIG_MLX4_CORE=3Dm
> CONFIG_MLX4_DEBUG=3Dy
> CONFIG_MLX5_CORE=3Dm
> # CONFIG_NET_VENDOR_MICREL is not set
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> CONFIG_FEALNX=3Dm
> # CONFIG_NET_VENDOR_NATSEMI is not set
> # CONFIG_NET_VENDOR_NVIDIA is not set
> # CONFIG_NET_VENDOR_OKI is not set
> CONFIG_ETHOC=3Dy
> CONFIG_NET_PACKET_ENGINE=3Dy
> CONFIG_HAMACHI=3Dm
> CONFIG_YELLOWFIN=3Dm
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> CONFIG_QLA3XXX=3Dy
> CONFIG_QLCNIC=3Dm
> CONFIG_QLCNIC_SRIOV=3Dy
> CONFIG_QLCNIC_DCB=3Dy
> # CONFIG_QLCNIC_HWMON is not set
> # CONFIG_QLGE is not set
> CONFIG_NETXEN_NIC=3Dy
> # CONFIG_NET_VENDOR_REALTEK is not set
> # CONFIG_SH_ETH is not set
> # CONFIG_NET_VENDOR_RDC is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> CONFIG_SXGBE_ETH=3Dm
> CONFIG_NET_VENDOR_SEEQ=3Dy
> # CONFIG_NET_VENDOR_SILAN is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> CONFIG_SIS190=3Dm
> # CONFIG_SFC is not set
> # CONFIG_NET_VENDOR_SMSC is not set
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> # CONFIG_NET_VENDOR_SUN is not set
> # CONFIG_NET_VENDOR_TEHUTI is not set
> # CONFIG_NET_VENDOR_TI is not set
> # CONFIG_NET_VENDOR_VIA is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> CONFIG_WIZNET_W5100=3Dm
> CONFIG_WIZNET_W5300=3Dm
> # CONFIG_WIZNET_BUS_DIRECT is not set
> # CONFIG_WIZNET_BUS_INDIRECT is not set
> CONFIG_WIZNET_BUS_ANY=3Dy
> CONFIG_NET_VENDOR_XIRCOM=3Dy
> CONFIG_PCMCIA_XIRC2PS=3Dm
> CONFIG_FDDI=3Dm
> CONFIG_DEFXX=3Dm
> # CONFIG_DEFXX_MMIO is not set
> CONFIG_SKFP=3Dm
> CONFIG_HIPPI=3Dy
> CONFIG_ROADRUNNER=3Dm
> CONFIG_ROADRUNNER_LARGE_RINGS=3Dy
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> =

> #
> # MII PHY device drivers
> #
> CONFIG_AT803X_PHY=3Dy
> CONFIG_AMD_PHY=3Dm
> CONFIG_AMD_XGBE_PHY=3Dy
> CONFIG_MARVELL_PHY=3Dy
> CONFIG_DAVICOM_PHY=3Dy
> CONFIG_QSEMI_PHY=3Dy
> CONFIG_LXT_PHY=3Dy
> CONFIG_CICADA_PHY=3Dm
> CONFIG_VITESSE_PHY=3Dm
> CONFIG_SMSC_PHY=3Dy
> # CONFIG_BROADCOM_PHY is not set
> CONFIG_BCM7XXX_PHY=3Dm
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_ICPLUS_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> # CONFIG_NATIONAL_PHY is not set
> CONFIG_STE10XP=3Dy
> CONFIG_LSI_ET1011C_PHY=3Dm
> # CONFIG_MICREL_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> CONFIG_MDIO_BITBANG=3Dy
> # CONFIG_MDIO_GPIO is not set
> CONFIG_MDIO_BUS_MUX=3Dy
> # CONFIG_MDIO_BUS_MUX_GPIO is not set
> CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
> CONFIG_PPP=3Dm
> CONFIG_PPP_BSDCOMP=3Dm
> CONFIG_PPP_DEFLATE=3Dm
> # CONFIG_PPP_FILTER is not set
> CONFIG_PPP_MPPE=3Dm
> CONFIG_PPP_MULTILINK=3Dy
> # CONFIG_PPPOE is not set
> CONFIG_PPTP=3Dm
> CONFIG_PPP_ASYNC=3Dm
> CONFIG_PPP_SYNC_TTY=3Dm
> # CONFIG_SLIP is not set
> CONFIG_SLHC=3Dy
> CONFIG_WLAN=3Dy
> CONFIG_PCMCIA_RAYCS=3Dm
> CONFIG_AIRO=3Dm
> CONFIG_ATMEL=3Dy
> CONFIG_PCI_ATMEL=3Dy
> # CONFIG_PCMCIA_ATMEL is not set
> CONFIG_AIRO_CS=3Dm
> # CONFIG_PCMCIA_WL3501 is not set
> # CONFIG_PRISM54 is not set
> # CONFIG_ATH_CARDS is not set
> CONFIG_BRCMUTIL=3Dm
> CONFIG_BRCMFMAC=3Dm
> # CONFIG_BRCM_TRACING is not set
> # CONFIG_BRCMDBG is not set
> # CONFIG_HOSTAP is not set
> CONFIG_IPW2100=3Dm
> CONFIG_IPW2100_MONITOR=3Dy
> CONFIG_IPW2100_DEBUG=3Dy
> CONFIG_LIBIPW=3Dm
> # CONFIG_LIBIPW_DEBUG is not set
> # CONFIG_LIBERTAS is not set
> CONFIG_WL_TI=3Dy
> CONFIG_MWIFIEX=3Dm
> # CONFIG_MWIFIEX_PCIE is not set
> =

> #
> # Enable WiMAX (Networking options) to see the WiMAX drivers
> #
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dy
> CONFIG_IEEE802154_FAKEHARD=3Dy
> CONFIG_IEEE802154_FAKELB=3Dm
> # CONFIG_VMXNET3 is not set
> CONFIG_ISDN=3Dy
> CONFIG_ISDN_I4L=3Dy
> CONFIG_ISDN_PPP=3Dy
> # CONFIG_ISDN_PPP_VJ is not set
> # CONFIG_ISDN_MPP is not set
> # CONFIG_IPPP_FILTER is not set
> # CONFIG_ISDN_PPP_BSDCOMP is not set
> # CONFIG_ISDN_AUDIO is not set
> =

> #
> # ISDN feature submodules
> #
> # CONFIG_ISDN_DIVERSION is not set
> =

> #
> # ISDN4Linux hardware drivers
> #
> =

> #
> # Passive cards
> #
> CONFIG_ISDN_DRV_HISAX=3Dy
> =

> #
> # D-channel protocol features
> #
> # CONFIG_HISAX_EURO is not set
> CONFIG_HISAX_1TR6=3Dy
> CONFIG_HISAX_NI1=3Dy
> CONFIG_HISAX_MAX_CARDS=3D8
> =

> #
> # HiSax supported cards
> #
> CONFIG_HISAX_16_3=3Dy
> CONFIG_HISAX_TELESPCI=3Dy
> CONFIG_HISAX_S0BOX=3Dy
> CONFIG_HISAX_FRITZPCI=3Dy
> # CONFIG_HISAX_AVM_A1_PCMCIA is not set
> # CONFIG_HISAX_ELSA is not set
> CONFIG_HISAX_DIEHLDIVA=3Dy
> # CONFIG_HISAX_SEDLBAUER is not set
> CONFIG_HISAX_NETJET=3Dy
> # CONFIG_HISAX_NETJET_U is not set
> # CONFIG_HISAX_NICCY is not set
> # CONFIG_HISAX_BKM_A4T is not set
> # CONFIG_HISAX_SCT_QUADRO is not set
> CONFIG_HISAX_GAZEL=3Dy
> # CONFIG_HISAX_HFC_PCI is not set
> CONFIG_HISAX_W6692=3Dy
> # CONFIG_HISAX_HFC_SX is not set
> # CONFIG_HISAX_ENTERNOW_PCI is not set
> CONFIG_HISAX_DEBUG=3Dy
> =

> #
> # HiSax PCMCIA card service modules
> #
> CONFIG_HISAX_AVM_A1_CS=3Dm
> CONFIG_HISAX_TELES_CS=3Dm
> =

> #
> # HiSax sub driver modules
> #
> CONFIG_HISAX_HFC4S8S=3Dm
> CONFIG_HISAX_FRITZ_PCIPNP=3Dm
> =

> #
> # Active cards
> #
> # CONFIG_ISDN_CAPI is not set
> CONFIG_ISDN_DRV_GIGASET=3Dm
> CONFIG_GIGASET_I4L=3Dy
> # CONFIG_GIGASET_DUMMYLL is not set
> # CONFIG_GIGASET_M101 is not set
> CONFIG_GIGASET_DEBUG=3Dy
> CONFIG_HYSDN=3Dm
> # CONFIG_MISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dm
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dm
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> CONFIG_KEYBOARD_ADP5589=3Dm
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dm
> CONFIG_KEYBOARD_QT2160=3Dm
> # CONFIG_KEYBOARD_LKKBD is not set
> CONFIG_KEYBOARD_GPIO=3Dm
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dm
> CONFIG_KEYBOARD_TCA8418=3Dm
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=3Dm
> # CONFIG_KEYBOARD_LM8333 is not set
> CONFIG_KEYBOARD_MAX7359=3Dm
> CONFIG_KEYBOARD_MCS=3Dm
> # CONFIG_KEYBOARD_MPR121 is not set
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dm
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> CONFIG_KEYBOARD_SUNKBD=3Dy
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_KEYBOARD_CROS_EC=3Dm
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_WACOM is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_OF_TOUCHSCREEN=3Dy
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dm
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dm
> # CONFIG_TOUCHSCREEN_BU21013 is not set
> # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dm
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dm
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dm
> CONFIG_TOUCHSCREEN_EETI=3Dm
> CONFIG_TOUCHSCREEN_EGALAX=3Dm
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dm
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dm
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dm
> CONFIG_TOUCHSCREEN_MAX11801=3Dm
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> CONFIG_TOUCHSCREEN_MTOUCH=3Dm
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dm
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dm
> CONFIG_TOUCHSCREEN_TOUCHRIGHT=3Dy
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dm
> CONFIG_TOUCHSCREEN_PIXCIR=3Dm
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dm
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dm
> CONFIG_TOUCHSCREEN_TSC2007=3Dm
> CONFIG_TOUCHSCREEN_ST1232=3Dm
> CONFIG_TOUCHSCREEN_TPS6507X=3Dm
> CONFIG_TOUCHSCREEN_ZFORCE=3Dm
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_AD714X=3Dm
> CONFIG_INPUT_AD714X_I2C=3Dm
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_PCSPKR=3Dm
> CONFIG_INPUT_MMA8450=3Dm
> CONFIG_INPUT_MPU3050=3Dm
> CONFIG_INPUT_APANEL=3Dm
> # CONFIG_INPUT_GP2A is not set
> # CONFIG_INPUT_GPIO_BEEPER is not set
> CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
> # CONFIG_INPUT_WISTRON_BTNS is not set
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dm
> CONFIG_INPUT_KXTJ9_POLLED_MODE=3Dy
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_UINPUT is not set
> CONFIG_INPUT_PCF50633_PMU=3Dm
> CONFIG_INPUT_PCF8574=3Dm
> CONFIG_INPUT_PWM_BEEPER=3Dy
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> # CONFIG_INPUT_ADXL34X is not set
> CONFIG_INPUT_CMA3000=3Dm
> # CONFIG_INPUT_CMA3000_I2C is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dm
> CONFIG_INPUT_SOC_BUTTON_ARRAY=3Dm
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dm
> CONFIG_SERIO_CT82C710=3Dm
> CONFIG_SERIO_PCIPS2=3Dm
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> CONFIG_SERIO_PS2MULT=3Dm
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_SERIO_OLPC_APSP=3Dm
> # CONFIG_GAMEPORT is not set
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
> CONFIG_SERIAL_8250_CS=3Dm
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
> CONFIG_SERIAL_UARTLITE=3Dm
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> CONFIG_SERIAL_OF_PLATFORM=3Dm
> CONFIG_SERIAL_SCCNXP=3Dm
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_PCH_UART=3Dy
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> CONFIG_SERIAL_XILINX_PS_UART=3Dy
> CONFIG_SERIAL_XILINX_PS_UART_CONSOLE=3Dy
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dm
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> # CONFIG_IPMI_DEVICE_INTERFACE is not set
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SI_PROBE_DEFAULTS=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dm
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dm
> # CONFIG_HW_RANDOM_AMD is not set
> CONFIG_HW_RANDOM_GEODE=3Dm
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dm
> CONFIG_HW_RANDOM_TPM=3Dm
> CONFIG_NVRAM=3Dy
> CONFIG_R3964=3Dm
> CONFIG_APPLICOM=3Dm
> # CONFIG_SONYPI is not set
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dm
> # CONFIG_CARDMAN_4000 is not set
> CONFIG_CARDMAN_4040=3Dm
> CONFIG_IPWIRELESS=3Dm
> CONFIG_MWAVE=3Dm
> # CONFIG_PC8736x_GPIO is not set
> # CONFIG_NSC_GPIO is not set
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> # CONFIG_TCG_INFINEON is not set
> # CONFIG_TCG_ST33_I2C is not set
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_I2C=3Dm
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dm
> CONFIG_I2C_MUX_GPIO=3Dm
> CONFIG_I2C_MUX_PCA9541=3Dm
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dm
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dm
> CONFIG_I2C_ALGOPCF=3Dm
> CONFIG_I2C_ALGOPCA=3Dm
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
> CONFIG_I2C_ALI15X3=3Dm
> CONFIG_I2C_AMD756=3Dm
> # CONFIG_I2C_AMD756_S4882 is not set
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_I801=3Dm
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> CONFIG_I2C_NFORCE2_S4985=3Dm
> CONFIG_I2C_SIS5595=3Dm
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
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
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dm
> CONFIG_I2C_EG20T=3Dm
> CONFIG_I2C_GPIO=3Dm
> CONFIG_I2C_OCORES=3Dm
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA is not set
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT_LIGHT=3Dm
> CONFIG_I2C_TAOS_EVM=3Dm
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_CROS_EC_TUNNEL=3Dm
> # CONFIG_SCx200_ACB is not set
> # CONFIG_I2C_STUB is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> CONFIG_HSI=3Dm
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
> # CONFIG_PPS_CLIENT_KTIMER is not set
> # CONFIG_PPS_CLIENT_LDISC is not set
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
> CONFIG_PTP_1588_CLOCK_PCH=3Dy
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dm
> =

> #
> # Memory mapped GPIO drivers:
> #
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_DWAPB is not set
> CONFIG_GPIO_IT8761E=3Dy
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_SCH311X=3Dy
> # CONFIG_GPIO_SYSCON is not set
> CONFIG_GPIO_SCH=3Dm
> CONFIG_GPIO_ICH=3Dm
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> CONFIG_GPIO_GRGPIO=3Dy
> =

> #
> # I2C GPIO expanders:
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_LP3943=3Dm
> CONFIG_GPIO_MAX7300=3Dm
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dm
> CONFIG_GPIO_ADP5588=3Dm
> # CONFIG_GPIO_ADNP is not set
> =

> #
> # PCI GPIO expanders:
> #
> # CONFIG_GPIO_CS5535 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_AMD8111 is not set
> CONFIG_GPIO_INTEL_MID=3Dy
> CONFIG_GPIO_PCH=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_SODAVILLE=3Dy
> CONFIG_GPIO_TIMBERDALE=3Dy
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders:
> #
> CONFIG_GPIO_MCP23S08=3Dm
> =

> #
> # AC97 GPIO expanders:
> #
> =

> #
> # LPC GPIO expanders:
> #
> =

> #
> # MODULbus GPIO expanders:
> #
> # CONFIG_GPIO_JANZ_TTL is not set
> CONFIG_GPIO_BCM_KONA=3Dy
> =

> #
> # USB GPIO expanders:
> #
> CONFIG_W1=3Dm
> # CONFIG_W1_CON is not set
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dm
> CONFIG_W1_MASTER_DS1WM=3Dm
> CONFIG_W1_MASTER_GPIO=3Dm
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dm
> CONFIG_W1_SLAVE_DS2408=3Dm
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dm
> CONFIG_W1_SLAVE_DS2423=3Dm
> # CONFIG_W1_SLAVE_DS2431 is not set
> # CONFIG_W1_SLAVE_DS2433 is not set
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dm
> CONFIG_W1_SLAVE_DS2781=3Dm
> CONFIG_W1_SLAVE_DS28E04=3Dm
> CONFIG_W1_SLAVE_BQ27000=3Dm
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dm
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_DS2780=3Dm
> CONFIG_BATTERY_DS2781=3Dm
> CONFIG_BATTERY_DS2782=3Dm
> CONFIG_BATTERY_OLPC=3Dm
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_BATTERY_BQ27x00 is not set
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dm
> # CONFIG_CHARGER_PCF50633 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_LP8727=3Dm
> # CONFIG_CHARGER_GPIO is not set
> CONFIG_CHARGER_MANAGER=3Dy
> CONFIG_CHARGER_BQ2415X=3Dm
> # CONFIG_CHARGER_BQ24190 is not set
> CONFIG_CHARGER_BQ24735=3Dm
> CONFIG_CHARGER_SMB347=3Dm
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_GPIO=3Dy
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=3Dm
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dm
> CONFIG_SENSORS_ASC7621=3Dm
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dy
> # CONFIG_SENSORS_FAM15H_POWER is not set
> # CONFIG_SENSORS_APPLESMC is not set
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dm
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dm
> CONFIG_SENSORS_LINEAGE=3Dm
> CONFIG_SENSORS_LTC2945=3Dm
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dm
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> # CONFIG_SENSORS_MAX1668 is not set
> # CONFIG_SENSORS_MAX197 is not set
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> # CONFIG_SENSORS_MAX6697 is not set
> CONFIG_SENSORS_HTU21=3Dm
> CONFIG_SENSORS_MCP3021=3Dm
> # CONFIG_SENSORS_LM63 is not set
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dm
> # CONFIG_SENSORS_LM77 is not set
> # CONFIG_SENSORS_LM78 is not set
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dm
> # CONFIG_SENSORS_LM85 is not set
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=3Dm
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dy
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dm
> CONFIG_SENSORS_SHTC1=3Dm
> CONFIG_SENSORS_SIS5595=3Dm
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> # CONFIG_SENSORS_EMC2103 is not set
> # CONFIG_SENSORS_EMC6W201 is not set
> # CONFIG_SENSORS_SMSC47M1 is not set
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_SMM665=3Dm
> CONFIG_SENSORS_ADC128D818=3Dm
> # CONFIG_SENSORS_ADS1015 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_THMC50=3Dm
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dm
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dm
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> CONFIG_SENSORS_W83L786NG=3Dm
> CONFIG_SENSORS_W83627HF=3Dm
> # CONFIG_SENSORS_W83627EHF is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_OF=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_CPU_THERMAL is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> # CONFIG_ACPI_INT3403_THERMAL is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
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
> CONFIG_SOFT_WATCHDOG=3Dm
> CONFIG_GPIO_WATCHDOG=3Dm
> CONFIG_XILINX_WATCHDOG=3Dm
> CONFIG_DW_WATCHDOG=3Dm
> CONFIG_ACQUIRE_WDT=3Dy
> CONFIG_ADVANTECH_WDT=3Dy
> # CONFIG_ALIM1535_WDT is not set
> CONFIG_ALIM7101_WDT=3Dm
> CONFIG_F71808E_WDT=3Dm
> CONFIG_SP5100_TCO=3Dm
> CONFIG_GEODE_WDT=3Dm
> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> CONFIG_IBMASR=3Dm
> CONFIG_WAFER_WDT=3Dm
> CONFIG_I6300ESB_WDT=3Dm
> CONFIG_IE6XX_WDT=3Dm
> CONFIG_ITCO_WDT=3Dy
> # CONFIG_ITCO_VENDOR_SUPPORT is not set
> # CONFIG_IT8712F_WDT is not set
> # CONFIG_IT87_WDT is not set
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_SC1200_WDT=3Dm
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dm
> CONFIG_60XX_WDT=3Dy
> CONFIG_SBC8360_WDT=3Dy
> # CONFIG_SBC7240_WDT is not set
> # CONFIG_CPU5_WDT is not set
> # CONFIG_SMSC_SCH311X_WDT is not set
> CONFIG_SMSC37B787_WDT=3Dy
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dm
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dm
> # CONFIG_MACHZ_WDT is not set
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dm
> # CONFIG_WDTPCI is not set
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
> # CONFIG_SSB_DEBUG is not set
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> CONFIG_SSB_DRIVER_PCICORE=3Dy
> CONFIG_SSB_DRIVER_GPIO=3Dy
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> # CONFIG_BCMA is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> # CONFIG_MFD_BCM590XX is not set
> CONFIG_MFD_CROS_EC=3Dm
> # CONFIG_MFD_CROS_EC_I2C is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> CONFIG_MFD_JANZ_CMODIO=3Dy
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dm
> # CONFIG_PCF50633_ADC is not set
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RTSX_PCI=3Dy
> CONFIG_MFD_SI476X_CORE=3Dm
> CONFIG_MFD_SM501=3Dm
> # CONFIG_MFD_SM501_GPIO is not set
> CONFIG_ABX500_CORE=3Dy
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dm
> CONFIG_MFD_LP3943=3Dm
> CONFIG_TPS6105X=3Dm
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dm
> # CONFIG_MFD_TPS65217 is not set
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> CONFIG_MFD_TIMBERDALE=3Dy
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> CONFIG_MFD_WM5102=3Dy
> CONFIG_MFD_WM5110=3Dy
> CONFIG_MFD_WM8997=3Dy
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dm
> CONFIG_REGULATOR_ACT8865=3Dm
> # CONFIG_REGULATOR_AD5398 is not set
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_DA9210=3Dm
> CONFIG_REGULATOR_FAN53555=3Dm
> CONFIG_REGULATOR_GPIO=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LP3971=3Dm
> CONFIG_REGULATOR_LP3972=3Dm
> # CONFIG_REGULATOR_LP872X is not set
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LTC3589=3Dm
> CONFIG_REGULATOR_MAX1586=3Dm
> # CONFIG_REGULATOR_MAX8649 is not set
> CONFIG_REGULATOR_MAX8660=3Dm
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8973=3Dm
> CONFIG_REGULATOR_PCF50633=3Dm
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_TPS51632=3Dm
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dm
> # CONFIG_REGULATOR_TPS65023 is not set
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> # CONFIG_MEDIA_CAMERA_SUPPORT is not set
> # CONFIG_MEDIA_ANALOG_TV_SUPPORT is not set
> # CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_RC_SUPPORT=3Dy
> CONFIG_VIDEO_DEV=3Dy
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_ADV_DEBUG=3Dy
> CONFIG_VIDEO_FIXED_MINOR_RANGES=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> =

> #
> # Media drivers
> #
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dm
> CONFIG_RC_DECODERS=3Dy
> # CONFIG_LIRC is not set
> CONFIG_IR_NEC_DECODER=3Dm
> # CONFIG_IR_RC5_DECODER is not set
> # CONFIG_IR_RC6_DECODER is not set
> CONFIG_IR_JVC_DECODER=3Dy
> CONFIG_IR_SONY_DECODER=3Dy
> CONFIG_IR_RC5_SZ_DECODER=3Dy
> # CONFIG_IR_SANYO_DECODER is not set
> CONFIG_IR_SHARP_DECODER=3Dm
> # CONFIG_IR_MCE_KBD_DECODER is not set
> # CONFIG_RC_DEVICES is not set
> CONFIG_MEDIA_PCI_SUPPORT=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> # CONFIG_RADIO_ADAPTERS is not set
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Encoders, decoders, sensors and other helper chips
> #
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> CONFIG_VIDEO_TDA7432=3Dm
> CONFIG_VIDEO_TDA9840=3Dm
> # CONFIG_VIDEO_TEA6415C is not set
> CONFIG_VIDEO_TEA6420=3Dm
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> CONFIG_VIDEO_TLV320AIC23B=3Dm
> CONFIG_VIDEO_UDA1342=3Dm
> CONFIG_VIDEO_WM8775=3Dm
> CONFIG_VIDEO_WM8739=3Dm
> # CONFIG_VIDEO_VP27SMPX is not set
> CONFIG_VIDEO_SONY_BTF_MPX=3Dm
> =

> #
> # RDS decoders
> #
> CONFIG_VIDEO_SAA6588=3Dm
> =

> #
> # Video decoders
> #
> CONFIG_VIDEO_ADV7180=3Dm
> CONFIG_VIDEO_ADV7183=3Dm
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> CONFIG_VIDEO_SAA7110=3Dm
> CONFIG_VIDEO_SAA711X=3Dm
> # CONFIG_VIDEO_SAA7191 is not set
> CONFIG_VIDEO_TVP514X=3Dm
> # CONFIG_VIDEO_TVP5150 is not set
> CONFIG_VIDEO_TVP7002=3Dm
> CONFIG_VIDEO_TW2804=3Dm
> CONFIG_VIDEO_TW9903=3Dm
> CONFIG_VIDEO_TW9906=3Dm
> CONFIG_VIDEO_VPX3220=3Dm
> =

> #
> # Video and audio decoders
> #
> CONFIG_VIDEO_SAA717X=3Dm
> CONFIG_VIDEO_CX25840=3Dm
> =

> #
> # Video encoders
> #
> CONFIG_VIDEO_SAA7127=3Dm
> CONFIG_VIDEO_SAA7185=3Dm
> CONFIG_VIDEO_ADV7170=3Dm
> CONFIG_VIDEO_ADV7175=3Dm
> CONFIG_VIDEO_ADV7343=3Dm
> CONFIG_VIDEO_ADV7393=3Dm
> CONFIG_VIDEO_AK881X=3Dm
> # CONFIG_VIDEO_THS8200 is not set
> =

> #
> # Camera sensor devices
> #
> =

> #
> # Flash devices
> #
> =

> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> CONFIG_VIDEO_UPD64083=3Dm
> =

> #
> # Audio/Video compression chips
> #
> CONFIG_VIDEO_SAA6752HS=3Dm
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> CONFIG_VIDEO_M52790=3Dm
> =

> #
> # Sensors used on soc_camera driver
> #
> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> # CONFIG_MEDIA_TUNER_MT20XX is not set
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> # CONFIG_MEDIA_TUNER_MT2266 is not set
> # CONFIG_MEDIA_TUNER_MT2131 is not set
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> # CONFIG_MEDIA_TUNER_XC2028 is not set
> # CONFIG_MEDIA_TUNER_XC5000 is not set
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> # CONFIG_MEDIA_TUNER_MXL5007T is not set
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> # CONFIG_MEDIA_TUNER_TDA18218 is not set
> # CONFIG_MEDIA_TUNER_FC0011 is not set
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> # CONFIG_MEDIA_TUNER_FC0013 is not set
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dm
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88TS2022=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dm
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> # CONFIG_MEDIA_TUNER_IT913X is not set
> CONFIG_MEDIA_TUNER_R820T=3Dm
> =

> #
> # Customise DVB Frontends
> #
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> # CONFIG_DVB_TUNER_DIB0070 is not set
> CONFIG_DVB_TUNER_DIB0090=3Dm
> =

> #
> # Tools to develop new frontends
> #
> CONFIG_DVB_DUMMY_FE=3Dm
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_ALI=3Dm
> CONFIG_AGP_ATI=3Dy
> CONFIG_AGP_AMD=3Dm
> CONFIG_AGP_AMD64=3Dy
> # CONFIG_AGP_INTEL is not set
> CONFIG_AGP_NVIDIA=3Dm
> # CONFIG_AGP_SIS is not set
> CONFIG_AGP_SWORKS=3Dm
> CONFIG_AGP_VIA=3Dm
> CONFIG_AGP_EFFICEON=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> =

> #
> # Direct Rendering Manager
> #
> # CONFIG_DRM is not set
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dm
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_DDC=3Dm
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dm
> CONFIG_FB_CFB_COPYAREA=3Dm
> CONFIG_FB_CFB_IMAGEBLIT=3Dm
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> CONFIG_FB_FOREIGN_ENDIAN=3Dy
> CONFIG_FB_BOTH_ENDIAN=3Dy
> # CONFIG_FB_BIG_ENDIAN is not set
> # CONFIG_FB_LITTLE_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dm
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
> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
> # CONFIG_FB_CYBER2000 is not set
> CONFIG_FB_ARC=3Dm
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_UVESA=3Dm
> CONFIG_FB_N411=3Dm
> CONFIG_FB_HGA=3Dm
> CONFIG_FB_OPENCORES=3Dm
> CONFIG_FB_S1D13XXX=3Dm
> CONFIG_FB_NVIDIA=3Dm
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> CONFIG_FB_RIVA=3Dm
> CONFIG_FB_RIVA_I2C=3Dy
> CONFIG_FB_RIVA_DEBUG=3Dy
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> CONFIG_FB_I740=3Dm
> CONFIG_FB_LE80578=3Dm
> CONFIG_FB_CARILLO_RANCH=3Dm
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dm
> # CONFIG_FB_RADEON_I2C is not set
> CONFIG_FB_RADEON_BACKLIGHT=3Dy
> CONFIG_FB_RADEON_DEBUG=3Dy
> CONFIG_FB_ATY128=3Dm
> # CONFIG_FB_ATY128_BACKLIGHT is not set
> CONFIG_FB_ATY=3Dm
> CONFIG_FB_ATY_CT=3Dy
> CONFIG_FB_ATY_GENERIC_LCD=3Dy
> CONFIG_FB_ATY_GX=3Dy
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> CONFIG_FB_S3=3Dm
> CONFIG_FB_S3_DDC=3Dy
> CONFIG_FB_SAVAGE=3Dm
> CONFIG_FB_SAVAGE_I2C=3Dy
> # CONFIG_FB_SAVAGE_ACCEL is not set
> CONFIG_FB_SIS=3Dm
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> CONFIG_FB_NEOMAGIC=3Dm
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> CONFIG_FB_VT8623=3Dm
> # CONFIG_FB_TRIDENT is not set
> CONFIG_FB_ARK=3Dm
> CONFIG_FB_PM3=3Dm
> # CONFIG_FB_CARMINE is not set
> CONFIG_FB_GEODE=3Dy
> CONFIG_FB_GEODE_LX=3Dm
> # CONFIG_FB_GEODE_GX is not set
> # CONFIG_FB_GEODE_GX1 is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_VIRTUAL is not set
> CONFIG_FB_METRONOME=3Dm
> CONFIG_FB_MB862XX=3Dm
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> CONFIG_FB_BROADSHEET=3Dm
> CONFIG_FB_AUO_K190X=3Dm
> # CONFIG_FB_AUO_K1900 is not set
> # CONFIG_FB_AUO_K1901 is not set
> CONFIG_FB_SSD1307=3Dm
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dm
> # CONFIG_BACKLIGHT_GENERIC is not set
> # CONFIG_BACKLIGHT_LM3533 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_SAHARA=3Dm
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> CONFIG_BACKLIGHT_PCF50633=3Dm
> CONFIG_BACKLIGHT_LM3630A=3Dm
> CONFIG_BACKLIGHT_LM3639=3Dm
> CONFIG_BACKLIGHT_LP855X=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dm
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_VGASTATE=3Dm
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_VGACON_SOFT_SCROLLBACK=3Dy
> CONFIG_VGACON_SOFT_SCROLLBACK_SIZE=3D64
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE=3Dm
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
> # CONFIG_LOGO is not set
> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dm
> # CONFIG_HIDRAW is not set
> CONFIG_UHID=3Dm
> # CONFIG_HID_GENERIC is not set
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dm
> CONFIG_HID_CHERRY=3Dm
> CONFIG_HID_CHICONY=3Dm
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dm
> CONFIG_HID_ELECOM=3Dm
> CONFIG_HID_EZKEY=3Dm
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> CONFIG_HID_UCLOGIC=3Dm
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_GYRATION is not set
> # CONFIG_HID_ICADE is not set
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> # CONFIG_HID_LENOVO_TPKBD is not set
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_LOGITECH_FF=3Dy
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> CONFIG_LOGIG940_FF=3Dy
> CONFIG_LOGIWHEELS_FF=3Dy
> CONFIG_HID_MAGICMOUSE=3Dm
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> CONFIG_HID_PRIMAX=3Dm
> CONFIG_HID_SAITEK=3Dm
> # CONFIG_HID_SAMSUNG is not set
> CONFIG_HID_SPEEDLINK=3Dm
> CONFIG_HID_STEELSERIES=3Dm
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dm
> # CONFIG_HID_GREENASIA is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> CONFIG_THRUSTMASTER_FF=3Dy
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dm
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=3Dm
> =

> #
> # I2C HID support
> #
> CONFIG_I2C_HID=3Dm
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
> CONFIG_UWB=3Dm
> # CONFIG_UWB_WHCI is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dm
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_LM3530=3Dm
> CONFIG_LEDS_LM3533=3Dm
> CONFIG_LEDS_LM3642=3Dm
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> CONFIG_LEDS_LP55XX_COMMON=3Dm
> CONFIG_LEDS_LP5521=3Dm
> CONFIG_LEDS_LP5523=3Dm
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dm
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> CONFIG_LEDS_PCA955X=3Dm
> CONFIG_LEDS_PCA963X=3Dm
> CONFIG_LEDS_PWM=3Dm
> # CONFIG_LEDS_REGULATOR is not set
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_INTEL_SS4200 is not set
> # CONFIG_LEDS_LT3593 is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_LM355x=3Dm
> CONFIG_LEDS_OT200=3Dm
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dm
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> # CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> CONFIG_ACCESSIBILITY=3Dy
> # CONFIG_A11Y_BRAILLE_CONSOLE is not set
> CONFIG_INFINIBAND=3Dm
> CONFIG_INFINIBAND_USER_MAD=3Dm
> CONFIG_INFINIBAND_USER_ACCESS=3Dm
> CONFIG_INFINIBAND_USER_MEM=3Dy
> CONFIG_INFINIBAND_ADDR_TRANS=3Dy
> CONFIG_INFINIBAND_MTHCA=3Dm
> CONFIG_INFINIBAND_MTHCA_DEBUG=3Dy
> # CONFIG_INFINIBAND_AMSO1100 is not set
> CONFIG_INFINIBAND_CXGB4=3Dm
> CONFIG_MLX4_INFINIBAND=3Dm
> CONFIG_MLX5_INFINIBAND=3Dm
> # CONFIG_INFINIBAND_NES is not set
> CONFIG_INFINIBAND_OCRDMA=3Dm
> CONFIG_INFINIBAND_IPOIB=3Dm
> # CONFIG_INFINIBAND_IPOIB_CM is not set
> CONFIG_INFINIBAND_IPOIB_DEBUG=3Dy
> # CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
> CONFIG_INFINIBAND_SRP=3Dm
> CONFIG_INFINIBAND_SRPT=3Dm
> CONFIG_INFINIBAND_ISER=3Dm
> # CONFIG_INFINIBAND_ISERT is not set
> CONFIG_EDAC=3Dy
> # CONFIG_EDAC_LEGACY_SYSFS is not set
> CONFIG_EDAC_DEBUG=3Dy
> CONFIG_EDAC_DECODE_MCE=3Dm
> # CONFIG_EDAC_MCE_INJ is not set
> CONFIG_EDAC_MM_EDAC=3Dy
> CONFIG_EDAC_AMD76X=3Dm
> CONFIG_EDAC_E7XXX=3Dy
> CONFIG_EDAC_E752X=3Dm
> # CONFIG_EDAC_I82875P is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> CONFIG_EDAC_I3200=3Dm
> CONFIG_EDAC_X38=3Dy
> # CONFIG_EDAC_I5400 is not set
> CONFIG_EDAC_I7CORE=3Dy
> CONFIG_EDAC_I82860=3Dy
> CONFIG_EDAC_R82600=3Dm
> CONFIG_EDAC_I5000=3Dy
> CONFIG_EDAC_I5100=3Dy
> CONFIG_EDAC_I7300=3Dm
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> CONFIG_RTC_DEBUG=3Dy
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
> # CONFIG_RTC_DRV_DS1307 is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1672 is not set
> CONFIG_RTC_DRV_DS3232=3Dm
> # CONFIG_RTC_DRV_HYM8563 is not set
> # CONFIG_RTC_DRV_MAX6900 is not set
> CONFIG_RTC_DRV_RS5C372=3Dm
> # CONFIG_RTC_DRV_ISL1208 is not set
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12057 is not set
> # CONFIG_RTC_DRV_X1205 is not set
> CONFIG_RTC_DRV_PCF2127=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> CONFIG_RTC_DRV_PCF8563=3Dm
> # CONFIG_RTC_DRV_PCF8583 is not set
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> CONFIG_RTC_DRV_S35390A=3Dm
> CONFIG_RTC_DRV_FM3130=3Dm
> CONFIG_RTC_DRV_RX8581=3Dm
> CONFIG_RTC_DRV_RX8025=3Dm
> CONFIG_RTC_DRV_EM3027=3Dm
> CONFIG_RTC_DRV_RV3029C2=3Dm
> =

> #
> # SPI RTC drivers
> #
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=3Dm
> # CONFIG_RTC_DRV_DS1511 is not set
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dy
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> CONFIG_RTC_DRV_MSM6242=3Dy
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dy
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_PCF50633=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_SNVS is not set
> # CONFIG_RTC_DRV_MOXART is not set
> CONFIG_RTC_DRV_XGENE=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_DMADEVICES is not set
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dm
> # CONFIG_UIO_PCI_GENERIC is not set
> CONFIG_UIO_NETX=3Dm
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dm
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_MMIO=3Dm
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> CONFIG_ET131X=3Dy
> CONFIG_SLICOSS=3Dy
> CONFIG_COMEDI=3Dm
> CONFIG_COMEDI_DEBUG=3Dy
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> # CONFIG_COMEDI_MISC_DRIVERS is not set
> CONFIG_COMEDI_ISA_DRIVERS=3Dy
> CONFIG_COMEDI_PCL711=3Dm
> CONFIG_COMEDI_PCL724=3Dm
> # CONFIG_COMEDI_PCL726 is not set
> CONFIG_COMEDI_PCL730=3Dm
> CONFIG_COMEDI_PCL812=3Dm
> CONFIG_COMEDI_PCL816=3Dm
> CONFIG_COMEDI_PCL818=3Dm
> CONFIG_COMEDI_PCM3724=3Dm
> # CONFIG_COMEDI_AMPLC_DIO200_ISA is not set
> CONFIG_COMEDI_AMPLC_PC236_ISA=3Dm
> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
> # CONFIG_COMEDI_RTI800 is not set
> CONFIG_COMEDI_RTI802=3Dm
> # CONFIG_COMEDI_DAC02 is not set
> CONFIG_COMEDI_DAS16M1=3Dm
> # CONFIG_COMEDI_DAS08_ISA is not set
> CONFIG_COMEDI_DAS16=3Dm
> CONFIG_COMEDI_DAS800=3Dm
> CONFIG_COMEDI_DAS1800=3Dm
> # CONFIG_COMEDI_DAS6402 is not set
> # CONFIG_COMEDI_DT2801 is not set
> # CONFIG_COMEDI_DT2811 is not set
> CONFIG_COMEDI_DT2814=3Dm
> CONFIG_COMEDI_DT2815=3Dm
> CONFIG_COMEDI_DT2817=3Dm
> CONFIG_COMEDI_DT282X=3Dm
> CONFIG_COMEDI_DMM32AT=3Dm
> CONFIG_COMEDI_UNIOXX5=3Dm
> CONFIG_COMEDI_FL512=3Dm
> # CONFIG_COMEDI_AIO_AIO12_8 is not set
> CONFIG_COMEDI_AIO_IIRO_16=3Dm
> CONFIG_COMEDI_II_PCI20KC=3Dm
> CONFIG_COMEDI_C6XDIGIO=3Dm
> # CONFIG_COMEDI_MPC624 is not set
> CONFIG_COMEDI_ADQ12B=3Dm
> CONFIG_COMEDI_NI_AT_A2150=3Dm
> CONFIG_COMEDI_NI_AT_AO=3Dm
> # CONFIG_COMEDI_NI_ATMIO is not set
> CONFIG_COMEDI_NI_ATMIO16D=3Dm
> # CONFIG_COMEDI_NI_LABPC_ISA is not set
> CONFIG_COMEDI_PCMAD=3Dm
> # CONFIG_COMEDI_PCMDA12 is not set
> # CONFIG_COMEDI_PCMMIO is not set
> # CONFIG_COMEDI_PCMUIO is not set
> # CONFIG_COMEDI_MULTIQ3 is not set
> CONFIG_COMEDI_S526=3Dm
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> # CONFIG_COMEDI_PCMCIA_DRIVERS is not set
> CONFIG_COMEDI_8255=3Dm
> CONFIG_COMEDI_FC=3Dm
> CONFIG_COMEDI_AMPLC_PC236=3Dm
> CONFIG_FB_OLPC_DCON=3Dm
> CONFIG_FB_OLPC_DCON_1_5=3Dy
> CONFIG_RTLLIB=3Dm
> # CONFIG_RTLLIB_CRYPTO_CCMP is not set
> CONFIG_RTLLIB_CRYPTO_TKIP=3Dm
> CONFIG_RTLLIB_CRYPTO_WEP=3Dm
> # CONFIG_RTL8192E is not set
> CONFIG_RTS5208=3Dy
> # CONFIG_RTS5208_DEBUG is not set
> CONFIG_IDE_PHISON=3Dy
> CONFIG_VT6655=3Dm
> # CONFIG_DX_SEP is not set
> CONFIG_WLAGS49_H2=3Dm
> # CONFIG_WLAGS49_H25 is not set
> CONFIG_CRYSTALHD=3Dy
> # CONFIG_FB_XGI is not set
> # CONFIG_ACPI_QUICKSTART is not set
> CONFIG_FT1000=3Dy
> CONFIG_FT1000_PCMCIA=3Dm
> =

> #
> # Speakup console speech
> #
> CONFIG_SPEAKUP=3Dy
> CONFIG_SPEAKUP_SYNTH_ACNTSA=3Dm
> # CONFIG_SPEAKUP_SYNTH_APOLLO is not set
> # CONFIG_SPEAKUP_SYNTH_AUDPTR is not set
> CONFIG_SPEAKUP_SYNTH_BNS=3Dm
> CONFIG_SPEAKUP_SYNTH_DECTLK=3Dy
> CONFIG_SPEAKUP_SYNTH_DECEXT=3Dm
> # CONFIG_SPEAKUP_SYNTH_LTLK is not set
> CONFIG_SPEAKUP_SYNTH_SOFT=3Dy
> CONFIG_SPEAKUP_SYNTH_SPKOUT=3Dy
> CONFIG_SPEAKUP_SYNTH_TXPRT=3Dy
> # CONFIG_SPEAKUP_SYNTH_DUMMY is not set
> CONFIG_TOUCHSCREEN_CLEARPAD_TM1217=3Dm
> # CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> # CONFIG_ANDROID_BINDER_IPC is not set
> CONFIG_ASHMEM=3Dy
> # CONFIG_ANDROID_LOGGER is not set
> CONFIG_ANDROID_TIMED_OUTPUT=3Dy
> CONFIG_ANDROID_TIMED_GPIO=3Dy
> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> # CONFIG_ANDROID_INTF_ALARM_DEV is not set
> # CONFIG_SYNC is not set
> # CONFIG_ION is not set
> # CONFIG_NET_VENDOR_SILICOM is not set
> CONFIG_DGRP=3Dm
> # CONFIG_LUSTRE_FS is not set
> # CONFIG_XILLYBUS is not set
> CONFIG_DGNC=3Dy
> CONFIG_DGAP=3Dm
> CONFIG_GS_FPGABOOT=3Dm
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACERHDF is not set
> # CONFIG_ASUS_LAPTOP is not set
> CONFIG_DELL_LAPTOP=3Dm
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> CONFIG_AMILO_RFKILL=3Dm
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_MSI_LAPTOP is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_COMPAL_LAPTOP is not set
> # CONFIG_SONY_LAPTOP is not set
> # CONFIG_IDEAPAD_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_EEEPC_LAPTOP is not set
> # CONFIG_ACPI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_XO1_RFKILL is not set
> # CONFIG_XO15_EBOOK is not set
> CONFIG_SAMSUNG_LAPTOP=3Dm
> # CONFIG_INTEL_OAKTRAIL is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> # CONFIG_CHROMEOS_LAPTOP is not set
> CONFIG_CHROMEOS_PSTORE=3Dm
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Hardware Spinlock drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
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
> # CONFIG_STE_MODEM_RPROC is not set
> =

> #
> # Rpmsg drivers
> #
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm
> CONFIG_DEVFREQ_GOV_PERFORMANCE=3Dy
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dm
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dm
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_GPIO=3Dy
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dy
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_FSL_FTM is not set
> # CONFIG_PWM_LP3943 is not set
> # CONFIG_PWM_LPSS is not set
> CONFIG_PWM_PCA9685=3Dm
> CONFIG_IRQCHIP=3Dy
> CONFIG_IPACK_BUS=3Dy
> CONFIG_BOARD_TPCI200=3Dy
> # CONFIG_SERIAL_IPOCTAL is not set
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_PHY_SAMSUNG_USB2 is not set
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dm
> CONFIG_DCDBAS=3Dy
> CONFIG_DMIID=3Dy
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> # CONFIG_GOOGLE_MEMCONSOLE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=3Dm
> # CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
> # CONFIG_EXT3_FS_XATTR is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_USE_FOR_EXT23=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD=3Dm
> CONFIG_JBD_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=3Dy
> CONFIG_JFS_POSIX_ACL=3Dy
> # CONFIG_JFS_SECURITY is not set
> CONFIG_JFS_DEBUG=3Dy
> # CONFIG_JFS_STATISTICS is not set
> # CONFIG_XFS_FS is not set
> CONFIG_OCFS2_FS=3Dm
> # CONFIG_OCFS2_FS_O2CB is not set
> # CONFIG_OCFS2_FS_USERSPACE_CLUSTER is not set
> # CONFIG_OCFS2_FS_STATS is not set
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> # CONFIG_INOTIFY_USER is not set
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> # CONFIG_PRINT_QUOTA_WARNING is not set
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dm
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> CONFIG_UDF_FS=3Dm
> CONFIG_UDF_NLS=3Dy
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
> # CONFIG_VFAT_FS is not set
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> CONFIG_NTFS_RW=3Dy
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
> # CONFIG_TMPFS is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dm
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> # CONFIG_NFS_FS is not set
> CONFIG_NFSD=3Dm
> CONFIG_NFSD_V2_ACL=3Dy
> CONFIG_NFSD_V3=3Dy
> CONFIG_NFSD_V3_ACL=3Dy
> # CONFIG_NFSD_V4 is not set
> CONFIG_LOCKD=3Dm
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_ACL_SUPPORT=3Dm
> CONFIG_NFS_COMMON=3Dy
> CONFIG_SUNRPC=3Dm
> CONFIG_SUNRPC_DEBUG=3Dy
> CONFIG_SUNRPC_XPRT_RDMA_CLIENT=3Dm
> CONFIG_SUNRPC_XPRT_RDMA_SERVER=3Dm
> # CONFIG_CEPH_FS is not set
> # CONFIG_CIFS is not set
> # CONFIG_NCP_FS is not set
> CONFIG_CODA_FS=3Dy
> # CONFIG_AFS_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dm
> # CONFIG_NLS_CODEPAGE_850 is not set
> CONFIG_NLS_CODEPAGE_852=3Dm
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dm
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> CONFIG_NLS_CODEPAGE_936=3Dm
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dm
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dy
> # CONFIG_NLS_ISO8859_7 is not set
> CONFIG_NLS_ISO8859_9=3Dm
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> # CONFIG_NLS_ISO8859_15 is not set
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dm
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> CONFIG_NLS_MAC_TURKISH=3Dy
> CONFIG_NLS_UTF8=3Dm
> CONFIG_DLM=3Dm
> # CONFIG_DLM_DEBUG is not set
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
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D1024
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
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_WANT_PAGE_DEBUG_FLAGS=3Dy
> CONFIG_PAGE_GUARD=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> # CONFIG_DEBUG_OBJECTS_RCU_HEAD is not set
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dm
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_DEBUG_HIGHMEM=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
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
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # CONFIG_TIMER_STATS is not set
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_RT_MUTEX_TESTER=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
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
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> # CONFIG_PROVE_RCU_DELAY is not set
> # CONFIG_SPARSE_RCU_POINTER is not set
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_VERBOSE=3Dy
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_CPU_NOTIFIER_ERROR_INJECT=3Dy
> CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> # CONFIG_FUNCTION_GRAPH_TRACER is not set
> CONFIG_IRQSOFF_TRACER=3Dy
> # CONFIG_PREEMPT_TRACER is not set
> # CONFIG_SCHED_TRACER is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> # CONFIG_STACK_TRACER is not set
> # CONFIG_BLK_DEV_IO_TRACE is not set
> CONFIG_UPROBE_EVENT=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> # CONFIG_FUNCTION_PROFILER is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> CONFIG_MMIOTRACE=3Dy
> # CONFIG_MMIOTRACE_TEST is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dm
> # CONFIG_INTERVAL_TREE_TEST is not set
> CONFIG_PERCPU_TEST=3Dm
> CONFIG_ATOMIC64_SELFTEST=3Dy
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_BUILD_DOCSRC is not set
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_MODULE=3Dm
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=3Dm
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_SET_MODULE_RONX=3Dy
> # CONFIG_DEBUG_NX_TEST is not set
> CONFIG_DOUBLEFAULT=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> # CONFIG_IOMMU_STRESS is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> CONFIG_IO_DELAY_UDELAY=3Dy
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D2
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_STATIC_CPU_HAS=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=3Dm
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEYS_DEBUG_PROC_KEYS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_LSM_MMAP_MIN_ADDR=3D65536
> CONFIG_SECURITY_SELINUX=3Dy
> # CONFIG_SECURITY_SELINUX_BOOTPARAM is not set
> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> # CONFIG_SECURITY_SELINUX_DEVELOP is not set
> # CONFIG_SECURITY_SELINUX_AVC_STATS is not set
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> CONFIG_SECURITY_SELINUX_POLICYDB_VERSION_MAX=3Dy
> CONFIG_SECURITY_SELINUX_POLICYDB_VERSION_MAX_VALUE=3D19
> CONFIG_SECURITY_SMACK=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1
> # CONFIG_SECURITY_APPARMOR_HASH is not set
> CONFIG_SECURITY_YAMA=3Dy
> CONFIG_SECURITY_YAMA_STACKED=3Dy
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_LSM_RULES=3Dy
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> # CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> CONFIG_IMA_DEFAULT_HASH_SHA512=3Dy
> # CONFIG_IMA_DEFAULT_HASH_WP512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha512"
> CONFIG_IMA_APPRAISE=3Dy
> CONFIG_EVM=3Dy
> =

> #
> # EVM options
> #
> CONFIG_EVM_ATTR_FSUUID=3Dy
> CONFIG_EVM_EXTRA_SMACK_XATTRS=3Dy
> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> # CONFIG_DEFAULT_SECURITY_SMACK is not set
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> # CONFIG_DEFAULT_SECURITY_YAMA is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_DEFAULT_SECURITY=3D"selinux"
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> # CONFIG_CRYPTO_FIPS is not set
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
> CONFIG_CRYPTO_PCOMP=3Dm
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_ABLK_HELPER=3Dm
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=3Dm
> CONFIG_CRYPTO_LRW=3Dy
> CONFIG_CRYPTO_PCBC=3Dy
> CONFIG_CRYPTO_XTS=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> # CONFIG_CRYPTO_CRC32 is not set
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dm
> CONFIG_CRYPTO_AES_NI_INTEL=3Dm
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> CONFIG_CRYPTO_SALSA20_586=3Dm
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_586=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_ZLIB=3Dm
> CONFIG_CRYPTO_LZO=3Dm
> # CONFIG_CRYPTO_LZ4 is not set
> CONFIG_CRYPTO_LZ4HC=3Dm
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_USER_API=3Dm
> # CONFIG_CRYPTO_USER_API_HASH is not set
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dm
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_APIC_ARCHITECTURE=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dy
> CONFIG_KVM_INTEL=3Dy
> CONFIG_KVM_AMD=3Dm
> CONFIG_KVM_MMU_AUDIT=3Dy
> CONFIG_LGUEST=3Dm
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> CONFIG_PERCPU_RWSEM=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dm
> CONFIG_AUDIT_GENERIC=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4HC_COMPRESS=3Dm
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
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> # CONFIG_CPUMASK_OFFSTACK is not set
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_AVERAGE=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_CORDIC is not set
> # CONFIG_DDR is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_FONT_SUPPORT=3Dm
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com


-- =

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF


--===============1194066198219283135==--

