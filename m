Content-Type: multipart/mixed; boundary="===============5691158415164670349=="
MIME-Version: 1.0
From: Marcelo Tosatti <mtosatti@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86: kvm] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsyscall()
Date: Fri, 13 Jun 2014 11:56:27 -0300
Message-ID: <20140613145627.GB26927@amt.cnet>
In-Reply-To: <539AB112.5030100@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5691158415164670349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2014 at 04:06:42PM +0800, Jet Chen wrote:
> Hi Marcelo,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a
> Author:     Marcelo Tosatti <mtosatti@redhat.com>
> AuthorDate: Tue Nov 27 23:28:56 2012 -0200
> Commit:     Marcelo Tosatti <mtosatti@redhat.com>
> CommitDate: Tue Nov 27 23:29:10 2012 -0200
> =

>     x86: kvm guest: pvclock vsyscall support
>         Hook into generic pvclock vsyscall code, with the aim to
>     allow userspace to have visibility into pvclock data.
>         Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

This should fix it:

commit 3d2a80a230250c2534ce5b17503670adaf1d7fff
Author: Peter Hurley <peter@hurleysoftware.com>
Date:   Wed Feb 27 15:28:28 2013 -0500

    x86/kvm: Fix pvclock vsyscall fixmap
    =

    The physical memory fixmapped for the pvclock clock_gettime vsyscall
    was allocated, and thus is not a kernel symbol. __pa() is the proper
    method to use in this case.

> +--------------------------------------------------------------+---------=
---+------------+
> |                                                              | 71056ae2=
2d | 3dc4f7cfb7 |
> +--------------------------------------------------------------+---------=
---+------------+
> | boot_successes                                               | 60      =
   | 0          |
> | boot_failures                                                | 0       =
   | 20         |
> | WARNING:at_arch/x86/kernel/pvclock.c:pvclock_init_vsyscall() | 0       =
   | 20         |
> | backtrace:pvclock_init_vsyscall                              | 0       =
   | 20         |
> | backtrace:warn_slowpath_null                                 | 0       =
   | 20         |
> | backtrace:kvm_setup_vsyscall_timeinfo                        | 0       =
   | 20         |
> | backtrace:kvm_guest_init                                     | 0       =
   | 20         |
> +--------------------------------------------------------------+---------=
---+------------+
> =

> [    0.000000] mapped IOAPIC to ffffffffff5f8000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsy=
scall+0x21/0x59()
> [    0.000000] Hardware name: Bochs
> [    0.000000] Pid: 0, comm: swapper Not tainted 3.7.0-rc3-00112-g3dc4f7c=
 #37
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff81062255>] warn_slowpath_common+0x7c/0x94
> [    0.000000]  [<ffffffff81062343>] warn_slowpath_null+0x1a/0x1c
> [    0.000000]  [<ffffffff81cdd7c9>] pvclock_init_vsyscall+0x21/0x59
> [    0.000000]  [<ffffffff81cdd75b>] kvm_setup_vsyscall_timeinfo+0x59/0x8b
> [    0.000000]  [<ffffffff81cdd4cf>] kvm_guest_init+0xe4/0xfe
> [    0.000000]  [<ffffffff81cd2f9e>] setup_arch+0xa64/0xad9
> [    0.000000]  [<ffffffff81cd0893>] start_kernel+0xdc/0x430
> [    0.000000]  [<ffffffff81cd0120>] ? early_idt_handlers+0x120/0x120
> [    0.000000]  [<ffffffff81cd02b4>] x86_64_start_reservations+0xb0/0xb3
> [    0.000000]  [<ffffffff81cd03b9>] x86_64_start_kernel+0x102/0x10f
> [    0.000000] ---[ end trace c4149eb8555303de ]---
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> =

> git bisect start 749387dc8d8270b279f27a0a794cdf4f4a4aa774 v3.7 --
> git bisect  bad e32795503de02da4e7e74a5e039cc268f6a0ecfb  # 23:38      0-=
     13  Merge tags 'dt-for-linus', 'gpio-for-linus' and 'spi-for-linus' of=
 git://git.secretlab.ca/git/linux-2.6
> git bisect  bad e777d192ffb9f2929d547a2f8a5f65b7db7a9552  # 00:25      0-=
      4  Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel=
/git/jejb/scsi
> git bisect good 50851c6248e1a13c45d97c41f6ebcf716093aa5e  # 00:43     20+=
      0  Merge branch 'release' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/rzhang/linux
> git bisect good 698d601224824bc1a5bf17f3d86be902e2aabff0  # 01:11     20+=
      0  Merge tag 'drivers' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/arm/arm-soc
> git bisect good 8d9ea7172edd2e52da26b9485b4c97969a0d2648  # 01:34     20+=
      0  Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
> git bisect  bad 66cdd0ceaf65a18996f561b770eedde1d123b019  # 01:57      0-=
      3  Merge tag 'kvm-3.8-1' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> git bisect good 3127f23f013eabe9b58132c05061684c49146ba3  # 02:12     20+=
      0  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/geert/linux-m68k
> git bisect good c7708fac5a878d6e0f2de0aa19f9749cff4f707f  # 02:31     20+=
      0  Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/ker=
nel/git/s390/linux
> git bisect good 896ea17d3da5f44b2625c9cda9874d7dfe447393  # 02:42     20+=
      0  Merge tag 'stable/for-linus-3.8-rc0-tag' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/konrad/xen
> git bisect good 8455d79e2163997e479931b8d5b7e60a92cd2b86  # 02:49     20+=
      0  KVM: PPC: Book3S HV: Run virtual core whenever any vcpus in it can=
 run
> git bisect  bad 78c634402a1825f1f5bef13077f0985f3b8a3212  # 03:10      0-=
      6  kvm: deliver msi interrupts from irq handler
> git bisect good 189e11731aa858597095fbe1e6d243bad26bd96b  # 03:44     20+=
      0  x86: pvclock: add note about rdtsc barriers
> git bisect  bad b48aa97e38206a84bf8485e7c553412274708ce5  # 04:09      0-=
     11  KVM: x86: require matched TSC offsets for master clock
> git bisect  bad 886b470cb14733a0286e365c77f1844c240c33a4  # 04:33      0-=
     13  KVM: x86: pass host_tsc to read_l1_tsc
> git bisect good 71056ae22d43f58d7e0f793af18ace2eaf5b74eb  # 04:58     20+=
      0  x86: pvclock: generic pvclock vsyscall initialization
> git bisect  bad 51c19b4f5927f5a646e93d69f73c7e89ea14e737  # 05:16      0-=
     15  x86: vdso: pvclock gettime support
> git bisect  bad 3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a  # 05:40      0-=
      6  x86: kvm guest: pvclock vsyscall support
> # first bad commit: [3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a] x86: kvm g=
uest: pvclock vsyscall support
> git bisect good 71056ae22d43f58d7e0f793af18ace2eaf5b74eb  # 05:42     60+=
      0  x86: pvclock: generic pvclock vsyscall initialization
> git bisect good d67a0e110187abd560a1de63fa172894a52839d5  # 05:45     60+=
      0  morphologies: Enable CONFIG_FHANDLE
> git bisect good 0e04c641b199435f3779454055f6a7de258ecdfc  # 06:06     60+=
      0  Merge tag 'dm-3.16-changes' of git://git.kernel.org/pub/scm/linux/=
kernel/git/device-mapper/linux-dm
> git bisect good b1cce620fd4b6864c92e7307be7839789f9c8be0  # 06:09     60+=
      0  Add linux-next specific files for 20140612
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
----
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dyocto-minimal-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/blob/=
master/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64 -cpu kvm64 -enable-kvm
>  	-kernel $kernel
> 	-initrd $initrd
> 	-smp 2
> 	-m 256M
> 	-net nic,vlan=3D0,macaddr=3D00:00:00:00:00:00,model=3Dvirtio
> 	-net user,vlan=3D0
> 	-net nic,vlan=3D1,model=3De1000
> 	-net user,vlan=3D1
> 	-boot order=3Dnc
> 	-no-reboot
> 	-watchdog i6300esb
> 	-serial stdio
> 	-display none
> 	-monitor null
> )
> =

> append=3D(
> 	debug
> 	sched_debug
> 	apic=3Ddebug
> 	ignore_loglevel
> 	sysrq_always_enabled
> 	panic=3D10
> 	prompt_ramdisk=3D0
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	root=3D/dev/ram0
> 	rw
> )
> =

> "${kvm[@]}" --append "${append[*]}"
> -------------------------------------------------------------------------=
----
> =

> Thanks,
> Jet
> =


> early console in setup code
> early console in decompress_kernel
> =

> Decompressing Linux... Parsing ELF... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.7.0-rc3-00112-g3dc4f7c (kbuild(a)jaketown)=
 (gcc version 4.8.2 (Debian 4.8.2-18) ) #37 SMP Fri Jun 13 05:38:51 CST 2014
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=
=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 r=
w link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-j1-0612/baserock:bas=
erock:morph:3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a:bisect-linux8/.vmlinuz=
-3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a-20140613053911-4-ivb42 branch=3Db=
aserock/baserock/morph BOOT_IMAGE=3D/kernel/x86_64-randconfig-j1-0612/3dc4f=
7cfb7441e5e0fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112-g3dc4f7c drbd.m=
inor_count=3D8
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
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
> [    0.000000] DMI 2.4 present.
> [    0.000000] DMI: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x0000ffff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x400000000
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000fdae0-0x000fdaef] mapped a=
t [ffff8800000fdae0]
> [    0.000000]   mpc: fdaf0-fdbe4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x1fffffff]
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x13ffdfff]
> [    0.000000]  [mem 0x00000000-0x13ffdfff] page 4k
> [    0.000000] kernel direct mapping tables up to 0x13ffdfff @ [mem 0x13c=
44000-0x13ce5fff]
> [    0.000000] RAMDISK: [mem 0x13ce6000-0x13feffff]
> [    0.000000] ACPI: RSDP 00000000000fd950 00014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0000000013ffe450 00034 (v01 BOCHS  BXPCRSDT 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0000000013ffff80 00074 (v01 BOCHS  BXPCFACP 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0000000013ffe490 011A9 (v01   BXPC   BXDSDT 000=
00001 INTL 20100528)
> [    0.000000] ACPI: FACS 0000000013ffff40 00040
> [    0.000000] ACPI: SSDT 0000000013fff7a0 00796 (v01 BOCHS  BXPCSSDT 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0000000013fff680 00080 (v01 BOCHS  BXPCAPIC 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0000000013fff640 00038 (v01 BOCHS  BXPCHPET 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5f9000 (        fee00000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, boot clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00010000-0x00ffffff]
> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00010000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81805
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 6 pages reserved
> [    0.000000]   DMA zone: 3913 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1216 pages used for memmap
> [    0.000000]   DMA32 zone: 76606 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0xb008
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5f9000 (        fee00000)
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
> [    0.000000] mapped IOAPIC to ffffffffff5f8000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsy=
scall+0x21/0x59()
> [    0.000000] Hardware name: Bochs
> [    0.000000] Pid: 0, comm: swapper Not tainted 3.7.0-rc3-00112-g3dc4f7c=
 #37
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff81062255>] warn_slowpath_common+0x7c/0x94
> [    0.000000]  [<ffffffff81062343>] warn_slowpath_null+0x1a/0x1c
> [    0.000000]  [<ffffffff81cdd7c9>] pvclock_init_vsyscall+0x21/0x59
> [    0.000000]  [<ffffffff81cdd75b>] kvm_setup_vsyscall_timeinfo+0x59/0x8b
> [    0.000000]  [<ffffffff81cdd4cf>] kvm_guest_init+0xe4/0xfe
> [    0.000000]  [<ffffffff81cd2f9e>] setup_arch+0xa64/0xad9
> [    0.000000]  [<ffffffff81cd0893>] start_kernel+0xdc/0x430
> [    0.000000]  [<ffffffff81cd0120>] ? early_idt_handlers+0x120/0x120
> [    0.000000]  [<ffffffff81cd02b4>] x86_64_start_reservations+0xb0/0xb3
> [    0.000000]  [<ffffffff81cd03b9>] x86_64_start_kernel+0x102/0x10f
> [    0.000000] ---[ end trace c4149eb8555303de ]---
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 473 pages/cpu @ffff880013600000 s1916032 =
r0 d21376 u2097152
> [    0.000000] pcpu-alloc: s1916032 r0 d21376 u2097152 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, primary cpu clock
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1360dc80
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 80519
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-j1-0612/baseroc=
k:baserock:morph:3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a:bisect-linux8/.vm=
linuz-3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a-20140613053911-4-ivb42 branc=
h=3Dbaserock/baserock/morph BOOT_IMAGE=3D/kernel/x86_64-randconfig-j1-0612/=
3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112-g3dc4f7c d=
rbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.000000] __ex_table already sorted, skipping sort
> [    0.000000] Memory: 289064k/327672k available (4465k kernel code, 452k=
 absent, 38156k reserved, 6778k data, 2312k init)
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] NR_IRQS:4352 nr_irqs:512 16
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.7.0-rc3-00112-g3dc4f7c (kbuild(a)jaketown)=
 (gcc version 4.8.2 (Debian 4.8.2-18) ) #37 SMP Fri Jun 13 05:38:51 CST 2014
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=
=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 r=
w link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-j1-0612/baserock:bas=
erock:morph:3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a:bisect-linux8/.vmlinuz=
-3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a-20140613053911-4-ivb42 branch=3Db=
aserock/baserock/morph BOOT_IMAGE=3D/kernel/x86_64-randconfig-j1-0612/3dc4f=
7cfb7441e5e0fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112-g3dc4f7c drbd.m=
inor_count=3D8
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
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
> [    0.000000] DMI 2.4 present.
> [    0.000000] DMI: Bochs Bochs, BIOS Bochs 01/01/2011
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x0000ffff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13ffe max_arch_pfn =3D 0x400000000
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000fdae0-0x000fdaef] mapped a=
t [ffff8800000fdae0]
> [    0.000000]   mpc: fdaf0-fdbe4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x1fffffff]
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x13ffdfff]
> [    0.000000]  [mem 0x00000000-0x13ffdfff] page 4k
> [    0.000000] kernel direct mapping tables up to 0x13ffdfff @ [mem 0x13c=
44000-0x13ce5fff]
> [    0.000000] RAMDISK: [mem 0x13ce6000-0x13feffff]
> [    0.000000] ACPI: RSDP 00000000000fd950 00014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0000000013ffe450 00034 (v01 BOCHS  BXPCRSDT 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0000000013ffff80 00074 (v01 BOCHS  BXPCFACP 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0000000013ffe490 011A9 (v01   BXPC   BXDSDT 000=
00001 INTL 20100528)
> [    0.000000] ACPI: FACS 0000000013ffff40 00040
> [    0.000000] ACPI: SSDT 0000000013fff7a0 00796 (v01 BOCHS  BXPCSSDT 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0000000013fff680 00080 (v01 BOCHS  BXPCAPIC 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0000000013fff640 00038 (v01 BOCHS  BXPCHPET 000=
00001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5f9000 (        fee00000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, boot clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00010000-0x00ffffff]
> [    0.000000]   DMA32    [mem 0x01000000-0xffffffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00010000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13ffdfff]
> [    0.000000] On node 0 totalpages: 81805
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 6 pages reserved
> [    0.000000]   DMA zone: 3913 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1216 pages used for memmap
> [    0.000000]   DMA32 zone: 76606 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0xb008
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5f9000 (        fee00000)
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
> [    0.000000] mapped IOAPIC to ffffffffff5f8000 (fec00000)
> [    0.000000] nr_irqs_gsi: 40
> [    0.000000] ------------[ cut here ]------------
> [    0.000000] WARNING: at arch/x86/kernel/pvclock.c:182 pvclock_init_vsy=
scall+0x21/0x59()
> [    0.000000] Hardware name: Bochs
> [    0.000000] Pid: 0, comm: swapper Not tainted 3.7.0-rc3-00112-g3dc4f7c=
 #37
> [    0.000000] Call Trace:
> [    0.000000]  [<ffffffff81062255>] warn_slowpath_common+0x7c/0x94
> [    0.000000]  [<ffffffff81062343>] warn_slowpath_null+0x1a/0x1c
> [    0.000000]  [<ffffffff81cdd7c9>] pvclock_init_vsyscall+0x21/0x59
> [    0.000000]  [<ffffffff81cdd75b>] kvm_setup_vsyscall_timeinfo+0x59/0x8b
> [    0.000000]  [<ffffffff81cdd4cf>] kvm_guest_init+0xe4/0xfe
> [    0.000000]  [<ffffffff81cd2f9e>] setup_arch+0xa64/0xad9
> [    0.000000]  [<ffffffff81cd0893>] start_kernel+0xdc/0x430
> [    0.000000]  [<ffffffff81cd0120>] ? early_idt_handlers+0x120/0x120
> [    0.000000]  [<ffffffff81cd02b4>] x86_64_start_reservations+0xb0/0xb3
> [    0.000000]  [<ffffffff81cd03b9>] x86_64_start_kernel+0x102/0x10f
> [    0.000000] ---[ end trace c4149eb8555303de ]---
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:2 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 473 pages/cpu @ffff880013600000 s1916032 =
r0 d21376 u2097152
> [    0.000000] pcpu-alloc: s1916032 r0 d21376 u2097152 alloc=3D1*2097152
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] kvm-clock: cpu 0, msr 0:13ffd001, primary cpu clock
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1360dc80
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 80519
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_ti=
meout=3D100 panic=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ra=
mdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/r=
am0 rw link=3D/kbuild-tests/run-queue/kvm/x86_64-randconfig-j1-0612/baseroc=
k:baserock:morph:3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a:bisect-linux8/.vm=
linuz-3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a-20140613053911-4-ivb42 branc=
h=3Dbaserock/baserock/morph BOOT_IMAGE=3D/kernel/x86_64-randconfig-j1-0612/=
3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112-g3dc4f7c d=
rbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.000000] __ex_table already sorted, skipping sort
> [    0.000000] Memory: 289064k/327672k available (4465k kernel code, 452k=
 absent, 38156k reserved, 6778k data, 2312k init)
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] NR_IRQS:4352 nr_irqs:512 16
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
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     16384
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      32768
> [    0.000000] ... CHAINHASH_SIZE:          16384
> [    0.000000] ... CHAINHASH_SIZE:          16384
> [    0.000000]  memory used by lock dependency info: 6367 kB
> [    0.000000]  memory used by lock dependency info: 6367 kB
> [    0.000000]  per task-struct memory footprint: 2688 bytes
> [    0.000000]  per task-struct memory footprint: 2688 bytes
> [    0.000000] ------------------------
> [    0.000000] ------------------------
> [    0.000000] | Locking API testsuite:
> [    0.000000] | Locking API testsuite:
> [    0.000000] ----------------------------------------------------------=
------------------
> [    0.000000] ----------------------------------------------------------=
------------------
> [    0.000000]                                  | spin |wlock |rlock |mut=
ex | wsem | rsem |
> [    0.000000]                                  | spin |wlock |rlock |mut=
ex | wsem | rsem |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]                      A-A deadlock:
> [    0.000000]                      A-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]                  A-B-B-A deadlock:
> [    0.000000]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]              A-B-B-C-C-A deadlock:
> [    0.000000]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]              A-B-C-A-B-C deadlock:
> [    0.000000]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]          A-B-B-C-C-D-D-A deadlock:
> [    0.000000]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]          A-B-C-D-B-D-D-A deadlock:
> [    0.000000]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]          A-B-C-D-B-C-D-A deadlock:
> [    0.000000]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]                     double unlock:
> [    0.000000]                     double unlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]                   initialize held:
> [    0.000000]                   initialize held:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]                  bad unlock order:
> [    0.000000]                  bad unlock order:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]               recursive read-lock:
> [    0.000000]               recursive read-lock:             |          =
   |  ok  |  ok  |             |             |  ok  |  ok  |
> =

> [    0.000000]            recursive read-lock #2:
> [    0.000000]            recursive read-lock #2:             |          =
   |  ok  |  ok  |             |             |  ok  |  ok  |
> =

> [    0.000000]             mixed read-write-lock:
> [    0.000000]             mixed read-write-lock:             |          =
   |  ok  |  ok  |             |             |  ok  |  ok  |
> =

> [    0.000000]             mixed write-read-lock:
> [    0.000000]             mixed write-read-lock:             |          =
   |  ok  |  ok  |             |             |  ok  |  ok  |
> =

> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]      hard-irqs-on + irq-safe-A/12:
> [    0.000000]      hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]      soft-irqs-on + irq-safe-A/12:
> [    0.000000]      soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]      hard-irqs-on + irq-safe-A/21:
> [    0.000000]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]      soft-irqs-on + irq-safe-A/21:
> [    0.000000]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]        sirq-safe-A =3D> hirqs-on/12:
> [    0.000000]        sirq-safe-A =3D> hirqs-on/12:  ok  |  ok  |  ok  | =
 ok  |  ok  |  ok  |
> =

> [    0.000000]        sirq-safe-A =3D> hirqs-on/21:
> [    0.000000]        sirq-safe-A =3D> hirqs-on/21:  ok  |  ok  |  ok  | =
 ok  |  ok  |  ok  |
> =

> [    0.000000]          hard-safe-A + irqs-on/12:
> [    0.000000]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]          soft-safe-A + irqs-on/12:
> [    0.000000]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]          hard-safe-A + irqs-on/21:
> [    0.000000]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]          soft-safe-A + irqs-on/21:
> [    0.000000]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/123:
> [    0.000000]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/123:
> [    0.000000]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/132:
> [    0.000000]     hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/132:
> [    0.000000]     soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/213:
> [    0.000000]     hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/213:
> [    0.000000]     soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/231:
> [    0.000000]     hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/231:
> [    0.000000]     soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/312:
> [    0.000000]     hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/312:
> [    0.000000]     soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #1/321:
> [    0.000000]     hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #1/321:
> [    0.000000]     soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/123:
> [    0.000000]     hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/123:
> [    0.000000]     soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/132:
> [    0.000000]     hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/132:
> [    0.000000]     soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/213:
> [    0.000000]     hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/213:
> [    0.000000]     soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/231:
> [    0.000000]     hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/231:
> [    0.000000]     soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/312:
> [    0.000000]     hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/312:
> [    0.000000]     soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     hard-safe-A + unsafe-B #2/321:
> [    0.000000]     hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]     soft-safe-A + unsafe-B #2/321:
> [    0.000000]     soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/123:
> [    0.000000]       hard-irq lock-inversion/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/123:
> [    0.000000]       soft-irq lock-inversion/123:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/132:
> [    0.000000]       hard-irq lock-inversion/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/132:
> [    0.000000]       soft-irq lock-inversion/132:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/213:
> [    0.000000]       hard-irq lock-inversion/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/213:
> [    0.000000]       soft-irq lock-inversion/213:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/231:
> [    0.000000]       hard-irq lock-inversion/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/231:
> [    0.000000]       soft-irq lock-inversion/231:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/312:
> [    0.000000]       hard-irq lock-inversion/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/312:
> [    0.000000]       soft-irq lock-inversion/312:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq lock-inversion/321:
> [    0.000000]       hard-irq lock-inversion/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       soft-irq lock-inversion/321:
> [    0.000000]       soft-irq lock-inversion/321:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/123:
> [    0.000000]       hard-irq read-recursion/123:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/123:
> [    0.000000]       soft-irq read-recursion/123:  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/132:
> [    0.000000]       hard-irq read-recursion/132:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/132:
> [    0.000000]       soft-irq read-recursion/132:  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/213:
> [    0.000000]       hard-irq read-recursion/213:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/213:
> [    0.000000]       soft-irq read-recursion/213:  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/231:
> [    0.000000]       hard-irq read-recursion/231:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/231:
> [    0.000000]       soft-irq read-recursion/231:  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/312:
> [    0.000000]       hard-irq read-recursion/312:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/312:
> [    0.000000]       soft-irq read-recursion/312:  ok  |  ok  |
> =

> [    0.000000]       hard-irq read-recursion/321:
> [    0.000000]       hard-irq read-recursion/321:  ok  |  ok  |
> =

> [    0.000000]       soft-irq read-recursion/321:
> [    0.000000]       soft-irq read-recursion/321:  ok  |  ok  |
> =

> [    0.000000] -------------------------------------------------------
> [    0.000000] -------------------------------------------------------
> [    0.000000] Good, all 218 testcases passed! |
> [    0.000000] Good, all 218 testcases passed! |
> [    0.000000] ---------------------------------
> [    0.000000] ---------------------------------
> [    0.000000] hpet clockevent registered
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.556 MHz processor
> [    0.000000] tsc: Detected 2693.556 MHz processor
> [    0.006666] Calibrating delay loop (skipped) preset value.. =

> [    0.006666] Calibrating delay loop (skipped) preset value.. 5389.57 Bo=
goMIPS (lpj=3D8978520)
> 5389.57 BogoMIPS (lpj=3D8978520)
> [    0.006666] pid_max: default: 32768 minimum: 301
> [    0.006666] pid_max: default: 32768 minimum: 301
> [    0.006860] Security Framework initialized
> [    0.006860] Security Framework initialized
> [    0.007662] Mount-cache hash table entries: 256
> [    0.007662] Mount-cache hash table entries: 256
> [    0.009182] Initializing cgroup subsys devices
> [    0.009182] Initializing cgroup subsys devices
> [    0.010097] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.010097] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.010097] tlb_flushall_shift: 6
> [    0.010097] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.010097] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.010097] tlb_flushall_shift: 6
> [    0.012518] debug: unmapping init [mem 0xffffffff81d3e000-0xffffffff81=
d3ffff]
> [    0.012518] debug: unmapping init [mem 0xffffffff81d3e000-0xffffffff81=
d3ffff]
> [    0.014208] ACPI: Core revision 20120913
> [    0.014208] ACPI: Core revision 20120913
> [    0.018132] Getting VERSION: 50014
> [    0.018132] Getting VERSION: 50014
> [    0.018759] Getting VERSION: 50014
> [    0.018759] Getting VERSION: 50014
> [    0.019352] Getting ID: 0
> [    0.019352] Getting ID: 0
> [    0.019825] Getting ID: ff000000
> [    0.019825] Getting ID: ff000000
> [    0.020010] Getting LVT0: 8700
> [    0.020010] Getting LVT0: 8700
> [    0.020566] Getting LVT1: 8400
> [    0.020566] Getting LVT1: 8400
> [    0.021140] enabled ExtINT on CPU#0
> [    0.021140] enabled ExtINT on CPU#0
> [    0.022478] ENABLING IO-APIC IRQs
> [    0.022478] ENABLING IO-APIC IRQs
> [    0.023340] init IO_APIC IRQs
> [    0.023340] init IO_APIC IRQs
> [    0.023863]  apic 0 pin 0 not connected
> [    0.023863]  apic 0 pin 0 not connected
> [    0.024561] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.024561] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.026011] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.026011] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.026690] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.026690] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.028150] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.028150] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.030022] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.030022] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.031417] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.031417] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.033360] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.033360] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.034769] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.034769] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.036208] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.036208] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.036688] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.036688] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.038111] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.038111] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.040022] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.040022] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.041471] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.041471] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.043354] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.043354] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.044780] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.044780] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.046294]  apic 0 pin 16 not connected
> [    0.046294]  apic 0 pin 16 not connected
> [    0.046671]  apic 0 pin 17 not connected
> [    0.046671]  apic 0 pin 17 not connected
> [    0.047354]  apic 0 pin 18 not connected
> [    0.047354]  apic 0 pin 18 not connected
> [    0.048079]  apic 0 pin 19 not connected
> [    0.048079]  apic 0 pin 19 not connected
> [    0.048791]  apic 0 pin 20 not connected
> [    0.048791]  apic 0 pin 20 not connected
> [    0.050004]  apic 0 pin 21 not connected
> [    0.050004]  apic 0 pin 21 not connected
> [    0.050692]  apic 0 pin 22 not connected
> [    0.050692]  apic 0 pin 22 not connected
> [    0.051397]  apic 0 pin 23 not connected
> [    0.051397]  apic 0 pin 23 not connected
> [    0.052219] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.052219] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.053337] smpboot: CPU0: =

> [    0.053337] smpboot: CPU0: Intel Intel Common KVM processorCommon KVM =
processor (fam: 0f, model: 06 (fam: 0f, model: 06, stepping: 01)
> , stepping: 01)
> [    0.055081] Using local APIC timer interrupts.
> [    0.055081] calibrating APIC timer ...
> [    0.055081] Using local APIC timer interrupts.
> [    0.055081] calibrating APIC timer ...
> [    0.059999] ... lapic delta =3D 6250126
> [    0.059999] ... lapic delta =3D 6250126
> [    0.059999] ... PM-Timer delta =3D 357928
> [    0.059999] ... PM-Timer delta =3D 357928
> [    0.059999] ... PM-Timer result ok
> [    0.059999] ... PM-Timer result ok
> [    0.059999] ..... delta 6250126
> [    0.059999] ..... delta 6250126
> [    0.059999] ..... mult: 268440894
> [    0.059999] ..... mult: 268440894
> [    0.059999] ..... calibration result: 3333400
> [    0.059999] ..... calibration result: 3333400
> [    0.059999] ..... CPU clock speed is 2693.1789 MHz.
> [    0.059999] ..... CPU clock speed is 2693.1789 MHz.
> [    0.059999] ..... host bus clock speed is 1000.0400 MHz.
> [    0.059999] ..... host bus clock speed is 1000.0400 MHz.
> [    0.060038] Performance Events: =

> [    0.060038] Performance Events: unsupported Netburst CPU model 6 unsup=
ported Netburst CPU model 6 no PMU driver, software events only.
> no PMU driver, software events only.
> [    0.062635] ftrace: Allocated trace_printk buffers
> [    0.062635] ftrace: Allocated trace_printk buffers
> [    0.064112] SMP alternatives: lockdep: fixing up alternatives
> [    0.064112] SMP alternatives: lockdep: fixing up alternatives
> [    0.065353] smpboot: Booting Node   0, Processors =

> [    0.065353] smpboot: Booting Node   0, Processors  #1 OK
>  #1 OK
> [    0.006666] kvm-clock: cpu 1, msr 0:13ffd041, secondary cpu clock
> [    0.006666] masked ExtINT on CPU#1
> [    0.080103] Brought up 2 CPUs
> [    0.080103] Brought up 2 CPUs
> [    0.080041] KVM setup async PF for cpu 1
> [    0.080041] KVM setup async PF for cpu 1
> [    0.080041] kvm-stealtime: cpu 1, msr 1380dc80
> [    0.080041] kvm-stealtime: cpu 1, msr 1380dc80
> [    0.083342] ----------------
> [    0.083342] ----------------
> [    0.083871] | NMI testsuite:
> [    0.083871] | NMI testsuite:
> [    0.084345] --------------------
> [    0.084345] --------------------
> [    0.084913]   remote IPI:
> [    0.084913]   remote IPI:  ok  |  ok  |
> =

> [    0.100221]    local IPI:
> [    0.100221]    local IPI:  ok  |  ok  |
> =

> [    0.133346] --------------------
> [    0.133346] --------------------
> [    0.133919] Good, all   2 testcases passed! |
> [    0.133919] Good, all   2 testcases passed! |
> [    0.134668] ---------------------------------
> [    0.134668] ---------------------------------
> [    0.135413] smpboot: Total of 2 processors activated (10778.15 BogoMIP=
S)
> [    0.135413] smpboot: Total of 2 processors activated (10778.15 BogoMIP=
S)
> [    0.137638] devtmpfs: initialized
> [    0.137638] devtmpfs: initialized
> [    0.141453] EVM: security.capability
> [    0.141453] EVM: security.capability
> [    0.142976] NET: Registered protocol family 16
> [    0.142976] NET: Registered protocol family 16
> [    0.144324] ACPI: bus type pci registered
> [    0.144324] ACPI: bus type pci registered
> [    0.145177] dca service started, version 1.12.1
> [    0.145177] dca service started, version 1.12.1
> [    0.146005] PCI: Using configuration type 1 for base access
> [    0.146005] PCI: Using configuration type 1 for base access
> [    0.151232] ACPI: Added _OSI(Module Device)
> [    0.151232] ACPI: Added _OSI(Module Device)
> [    0.151957] ACPI: Added _OSI(Processor Device)
> [    0.151957] ACPI: Added _OSI(Processor Device)
> [    0.152716] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.152716] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.153339] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.153339] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.156283] ACPI: EC: Look up EC in DSDT
> [    0.156283] ACPI: EC: Look up EC in DSDT
> [    0.162261] ACPI: Interpreter enabled
> [    0.162261] ACPI: Interpreter enabled
> [    0.162903] ACPI: (supports S0
> [    0.162903] ACPI: (supports S0 S3 S3 S5 S5)
> )
> [    0.163552] ACPI: Using IOAPIC for interrupt routing
> [    0.163552] ACPI: Using IOAPIC for interrupt routing
> [    0.172151] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.172151] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.173524] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.173524] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.175015] PCI host bridge to bus 0000:00
> [    0.175015] PCI host bridge to bus 0000:00
> [    0.175766] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.175766] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.176672] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.176672] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.177754] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
> [    0.177754] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
> [    0.178802] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff]
> [    0.178802] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff]
> [    0.180019] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfebff=
fff]
> [    0.180019] pci_bus 0000:00: root bus resource [mem 0x80000000-0xfebff=
fff]
> [    0.181316] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.181316] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.182668] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.182668] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.183782] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.183782] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.187815] pci 0000:00:01.1: reg 20: [io  0xc040-0xc04f]
> [    0.187815] pci 0000:00:01.1: reg 20: [io  0xc040-0xc04f]
> [    0.189791] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.189791] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.190369] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PI=
IX4 ACPI
> [    0.190369] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by PI=
IX4 ACPI
> [    0.191620] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by PI=
IX4 SMB
> [    0.191620] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by PI=
IX4 SMB
> [    0.193510] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.193510] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.197255] pci 0000:00:02.0: reg 10: [mem 0xfc000000-0xfdffffff pref]
> [    0.197255] pci 0000:00:02.0: reg 10: [mem 0xfc000000-0xfdffffff pref]
> [    0.200052] pci 0000:00:02.0: reg 14: [mem 0xfebf0000-0xfebf0fff]
> [    0.200052] pci 0000:00:02.0: reg 14: [mem 0xfebf0000-0xfebf0fff]
> [    0.207228] pci 0000:00:02.0: reg 30: [mem 0xfebe0000-0xfebeffff pref]
> [    0.207228] pci 0000:00:02.0: reg 30: [mem 0xfebe0000-0xfebeffff pref]
> [    0.208581] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.208581] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.210438] pci 0000:00:03.0: reg 10: [mem 0xfeba0000-0xfebbffff]
> [    0.210438] pci 0000:00:03.0: reg 10: [mem 0xfeba0000-0xfebbffff]
> [    0.212293] pci 0000:00:03.0: reg 14: [io  0xc000-0xc03f]
> [    0.212293] pci 0000:00:03.0: reg 14: [io  0xc000-0xc03f]
> [    0.217500] pci 0000:00:03.0: reg 30: [mem 0xfebc0000-0xfebdffff pref]
> [    0.217500] pci 0000:00:03.0: reg 30: [mem 0xfebc0000-0xfebdffff pref]
> [    0.218739] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> [    0.218739] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> [    0.220226] pci 0000:00:04.0: reg 10: [mem 0xfebf1000-0xfebf100f]
> [    0.220226] pci 0000:00:04.0: reg 10: [mem 0xfebf1000-0xfebf100f]
> [    0.224051] pci_bus 0000:00: on NUMA node 0
> [    0.224051] pci_bus 0000:00: on NUMA node 0
> [    0.224824] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
> [    0.224824] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
> [    0.227542]  pci0000:00: ACPI _OSC support notification failed, disabl=
ing PCIe ASPM
> [    0.227542]  pci0000:00: ACPI _OSC support notification failed, disabl=
ing PCIe ASPM
> [    0.228860]  pci0000:00: Unable to request _OSC control (_OSC support =
mask: 0x08)
> [    0.228860]  pci0000:00: Unable to request _OSC control (_OSC support =
mask: 0x08)
> [    0.237833] ACPI: PCI Interrupt Link [LNKA] (IRQs
> [    0.237833] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 5 *10 *10 11 11))
> =

> [    0.239021] ACPI: PCI Interrupt Link [LNKB] (IRQs
> [    0.239021] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 5 *10 *10 11 11))
> =

> [    0.240188] ACPI: PCI Interrupt Link [LNKC] (IRQs
> [    0.240188] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 5 10 10 *11 *11))
> =

> [    0.241359] ACPI: PCI Interrupt Link [LNKD] (IRQs
> [    0.241359] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 5 10 10 *11 *11))
> =

> [    0.242467] ACPI: PCI Interrupt Link [LNKS] (IRQs
> [    0.242467] ACPI: PCI Interrupt Link [LNKS] (IRQs *9 *9))
> =

> [    0.243998] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    0.243998] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    0.245423] vgaarb: loaded
> [    0.245423] vgaarb: loaded
> [    0.245912] vgaarb: bridge control possible 0000:00:02.0
> [    0.245912] vgaarb: bridge control possible 0000:00:02.0
> [    0.247002] Error: Driver '88PM80X' is already registered, aborting...
> [    0.247002] Error: Driver '88PM80X' is already registered, aborting...
> [    0.248617] wmi: Mapper loaded
> [    0.248617] wmi: Mapper loaded
> [    0.249278] Advanced Linux Sound Architecture Driver Initialized.
> [    0.249278] Advanced Linux Sound Architecture Driver Initialized.
> [    0.250008] PCI: Using ACPI for IRQ routing
> [    0.250008] PCI: Using ACPI for IRQ routing
> [    0.250741] PCI: pci_cache_line_size set to 64 bytes
> [    0.250741] PCI: pci_cache_line_size set to 64 bytes
> [    0.251746] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.251746] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.252790] e820: reserve RAM buffer [mem 0x13ffe000-0x13ffffff]
> [    0.252790] e820: reserve RAM buffer [mem 0x13ffe000-0x13ffffff]
> [    0.254268] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    0.254268] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    0.257000] Switching to clocksource kvm-clock
> [    0.257000] Switching to clocksource kvm-clock
> [    0.267038] FS-Cache: Loaded
> [    0.267038] FS-Cache: Loaded
> [    0.267605] pnp: PnP ACPI init
> [    0.267605] pnp: PnP ACPI init
> [    0.268185] ACPI: bus type pnp registered
> [    0.268185] ACPI: bus type pnp registered
> [    0.269012] pnp 00:00: [bus 00-ff]
> [    0.269012] pnp 00:00: [bus 00-ff]
> [    0.269603] pnp 00:00: [io  0x0cf8-0x0cff]
> [    0.269603] pnp 00:00: [io  0x0cf8-0x0cff]
> [    0.270324] pnp 00:00: [io  0x0000-0x0cf7 window]
> [    0.270324] pnp 00:00: [io  0x0000-0x0cf7 window]
> [    0.271133] pnp 00:00: [io  0x0d00-0xffff window]
> [    0.271133] pnp 00:00: [io  0x0d00-0xffff window]
> [    0.271949] pnp 00:00: [mem 0x000a0000-0x000bffff window]
> [    0.271949] pnp 00:00: [mem 0x000a0000-0x000bffff window]
> [    0.272870] pnp 00:00: [mem 0x80000000-0xfebfffff window]
> [    0.272870] pnp 00:00: [mem 0x80000000-0xfebfffff window]
> [    0.273905] pnp 00:00: Plug and Play ACPI device, IDs PNP0a03 (active)
> [    0.273905] pnp 00:00: Plug and Play ACPI device, IDs PNP0a03 (active)
> [    0.275073] pnp 00:01: [io  0x0070-0x0071]
> [    0.275073] pnp 00:01: [io  0x0070-0x0071]
> [    0.275797] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:3)
> [    0.275797] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:3)
> [    0.277180] pnp 00:01: [irq 8]
> [    0.277180] pnp 00:01: [irq 8]
> [    0.277715] pnp 00:01: [io  0x0072-0x0077]
> [    0.277715] pnp 00:01: [io  0x0072-0x0077]
> [    0.278477] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.278477] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.279625] pnp 00:02: [io  0x0060]
> [    0.279625] pnp 00:02: [io  0x0060]
> [    0.280250] pnp 00:02: [io  0x0064]
> [    0.280250] pnp 00:02: [io  0x0064]
> [    0.280858] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:3)
> [    0.280858] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:3)
> [    0.282228] pnp 00:02: [irq 1]
> [    0.282228] pnp 00:02: [irq 1]
> [    0.282820] pnp 00:02: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.282820] pnp 00:02: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.283993] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:3)
> [    0.283993] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:3)
> [    0.285416] pnp 00:03: [irq 12]
> [    0.285416] pnp 00:03: [irq 12]
> [    0.286030] pnp 00:03: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.286030] pnp 00:03: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.287206] pnp 00:04: [io  0x03f2-0x03f5]
> [    0.287206] pnp 00:04: [io  0x03f2-0x03f5]
> [    0.287907] pnp 00:04: [io  0x03f7]
> [    0.287907] pnp 00:04: [io  0x03f7]
> [    0.288517] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:3)
> [    0.288517] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:3)
> [    0.289928] pnp 00:04: [irq 6]
> [    0.289928] pnp 00:04: [irq 6]
> [    0.290502] pnp 00:04: [dma 2]
> [    0.290502] pnp 00:04: [dma 2]
> [    0.291092] pnp 00:04: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.291092] pnp 00:04: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.292291] pnp 00:05: [io  0x0378-0x037f]
> [    0.292291] pnp 00:05: [io  0x0378-0x037f]
> [    0.293031] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:3)
> [    0.293031] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:3)
> [    0.294442] pnp 00:05: [irq 7]
> [    0.294442] pnp 00:05: [irq 7]
> [    0.295043] pnp 00:05: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.295043] pnp 00:05: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.296216] pnp 00:06: [io  0x03f8-0x03ff]
> [    0.296216] pnp 00:06: [io  0x03f8-0x03ff]
> [    0.296945] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:3)
> [    0.296945] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:3)
> [    0.298343] pnp 00:06: [irq 4]
> [    0.298343] pnp 00:06: [irq 4]
> [    0.298937] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.298937] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.300146] pnp 00:07: [io  0x02f8-0x02ff]
> [    0.300146] pnp 00:07: [io  0x02f8-0x02ff]
> [    0.300881] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:3)
> [    0.300881] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:3)
> [    0.302261] pnp 00:07: [irq 3]
> [    0.302261] pnp 00:07: [irq 3]
> [    0.302860] pnp 00:07: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.302860] pnp 00:07: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.304267] pnp 00:08: [mem 0xfed00000-0xfed003ff]
> [    0.304267] pnp 00:08: [mem 0xfed00000-0xfed003ff]
> [    0.305166] pnp 00:08: Plug and Play ACPI device, IDs PNP0103 (active)
> [    0.305166] pnp 00:08: Plug and Play ACPI device, IDs PNP0103 (active)
> [    0.306477] pnp: PnP ACPI: found 9 devices
> [    0.306477] pnp: PnP ACPI: found 9 devices
> [    0.307199] ACPI: ACPI bus type pnp unregistered
> [    0.307199] ACPI: ACPI bus type pnp unregistered
> [    0.307995] INFO_MDMA: LNW DMA Driver Version 1.1.0
> [    0.307995] INFO_MDMA: LNW DMA Driver Version 1.1.0
> [    0.314682] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.314682] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.315641] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
> [    0.315641] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
> [    0.316587] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
> [    0.316587] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
> [    0.317658] pci_bus 0000:00: resource 7 [mem 0x80000000-0xfebfffff]
> [    0.317658] pci_bus 0000:00: resource 7 [mem 0x80000000-0xfebfffff]
> [    0.318794] NET: Registered protocol family 1
> [    0.318794] NET: Registered protocol family 1
> [    0.319557] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.319557] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.320603] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.320603] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.321601] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.321601] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.322671] pci 0000:00:02.0: Boot video device
> [    0.322671] pci 0000:00:02.0: Boot video device
> [    0.323481] PCI: CLS 0 bytes, default 64
> [    0.323481] PCI: CLS 0 bytes, default 64
> [    0.324353] Unpacking initramfs...
> [    0.324353] Unpacking initramfs...
> [    0.407913] debug: unmapping init [mem 0xffff880013ce6000-0xffff880013=
feffff]
> [    0.407913] debug: unmapping init [mem 0xffff880013ce6000-0xffff880013=
feffff]
> [    0.410474] camellia-x86_64: performance on this CPU would be suboptim=
al: disabling camellia-x86_64.
> [    0.410474] camellia-x86_64: performance on this CPU would be suboptim=
al: disabling camellia-x86_64.
> [    0.410513] cryptomgr_test (23) used greatest stack depth: 6616 bytes =
left
> [    0.410513] cryptomgr_test (23) used greatest stack depth: 6616 bytes =
left
> [    0.413213] AVX instructions are not detected.
> [    0.413213] AVX instructions are not detected.
> [    0.413991] blowfish-x86_64: performance on this CPU would be suboptim=
al: disabling blowfish-x86_64.
> [    0.413991] blowfish-x86_64: performance on this CPU would be suboptim=
al: disabling blowfish-x86_64.
> [    0.415710] twofish-x86_64-3way: performance on this CPU would be subo=
ptimal: disabling twofish-x86_64-3way.
> [    0.415710] twofish-x86_64-3way: performance on this CPU would be subo=
ptimal: disabling twofish-x86_64-3way.
> [    0.417400] AVX instructions are not detected.
> [    0.417400] AVX instructions are not detected.
> [    0.419280] AVX instructions are not detected.
> [    0.419280] AVX instructions are not detected.
> [    0.421390] Initializing RT-Tester: OK
> [    0.421390] Initializing RT-Tester: OK
> [    0.427295] ROMFS MTD (C) 2007 Red Hat, Inc.
> [    0.427295] ROMFS MTD (C) 2007 Red Hat, Inc.
> [    0.428077] fuse init (API version 7.20)
> [    0.428077] fuse init (API version 7.20)
> [    0.429047] msgmni has been set to 564
> [    0.429047] msgmni has been set to 564
> [    0.433556] Key type asymmetric registered
> [    0.433556] Key type asymmetric registered
> [    0.434289] Asymmetric key parser 'x509' registered
> [    0.434289] Asymmetric key parser 'x509' registered
> [    0.436569] list_sort_test: start testing list_sort()
> [    0.436569] list_sort_test: start testing list_sort()
> [    0.438136] crc32: CRC_LE_BITS =3D 64, CRC_BE BITS =3D 64
> [    0.438136] crc32: CRC_LE_BITS =3D 64, CRC_BE BITS =3D 64
> [    0.438998] crc32: self tests passed, processed 225944 bytes in 148882=
 nsec
> [    0.438998] crc32: self tests passed, processed 225944 bytes in 148882=
 nsec
> [    0.440329] crc32c: CRC_LE_BITS =3D 64
> [    0.440329] crc32c: CRC_LE_BITS =3D 64
> [    0.440946] crc32c: self tests passed, processed 225944 bytes in 74372=
 nsec
> [    0.440946] crc32c: self tests passed, processed 225944 bytes in 74372=
 nsec
> [    0.442252] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
> [    0.442252] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
> [    0.443313] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
> [    0.443313] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
> [    0.444505] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    0.444505] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
.4
> [    0.445887] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    0.445887] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    0.447197] ACPI: Power Button [PWRF]
> [    0.447197] ACPI: Power Button [PWRF]
> [    0.451284] GHES: HEST is not enabled!
> [    0.451284] GHES: HEST is not enabled!
> [    0.451929] ERST DBG: ERST support is disabled.
> [    0.451929] ERST DBG: ERST support is disabled.
> [    0.452699] ioatdma: Intel(R) QuickData Technology Driver 4.00
> [    0.452699] ioatdma: Intel(R) QuickData Technology Driver 4.00
> [    0.497051] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    0.497051] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    0.498000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.498000] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    0.524757] 00:06: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
> [    0.524757] 00:06: ttyS0 at I/O 0x3f8 (irq =3D 4) is a 16550A
> [    0.527081] Non-volatile memory driver v1.3
> [    0.527081] Non-volatile memory driver v1.3
> [    0.527856] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    0.527856] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
> [    0.528750] smapi::smapi_init, ERROR invalid usSmapiID
> [    0.528750] smapi::smapi_init, ERROR invalid usSmapiID
> [    0.529628] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    0.529628] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    0.531208] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    0.531208] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    0.532426] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    0.532426] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    0.533543] SyncLink PC Card driver $Revision: 4.34 $, tty major#251
> [    0.533543] SyncLink PC Card driver $Revision: 4.34 $, tty major#251
> [    0.534689] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    0.534689] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    0.536215] Hangcheck: Using getrawmonotonic().
> [    0.536215] Hangcheck: Using getrawmonotonic().
> [    0.537136] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
> [    0.537136] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
> [    0.538348] Phantom Linux Driver, version n0.9.8, init OK
> [    0.538348] Phantom Linux Driver, version n0.9.8, init OK
> [    0.539398] i2c-core: driver [apds9802als] using legacy suspend method
> [    0.539398] i2c-core: driver [apds9802als] using legacy suspend method
> [    0.540523] i2c-core: driver [apds9802als] using legacy resume method
> [    0.540523] i2c-core: driver [apds9802als] using legacy resume method
> [    0.541629] i2c-core: driver [isl29003] using legacy suspend method
> [    0.541629] i2c-core: driver [isl29003] using legacy suspend method
> [    0.542694] i2c-core: driver [isl29003] using legacy resume method
> [    0.542694] i2c-core: driver [isl29003] using legacy resume method
> [    0.543776] i2c-core: driver [tsl2550] using legacy suspend method
> [    0.543776] i2c-core: driver [tsl2550] using legacy suspend method
> [    0.544828] i2c-core: driver [tsl2550] using legacy resume method
> [    0.544828] i2c-core: driver [tsl2550] using legacy resume method
> [    0.545889] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [    0.545889] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [    0.547280] i2c-core: driver [fsa9480] using legacy suspend method
> [    0.547280] i2c-core: driver [fsa9480] using legacy suspend method
> [    0.548340] i2c-core: driver [fsa9480] using legacy resume method
> [    0.548340] i2c-core: driver [fsa9480] using legacy resume method
> [    0.549810] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    0.549810] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    0.550941] device id =3D 2440
> [    0.550941] device id =3D 2440
> [    0.551445] device id =3D 2480
> [    0.551445] device id =3D 2480
> [    0.551946] device id =3D 24c0
> [    0.551946] device id =3D 24c0
> [    0.552443] device id =3D 24d0
> [    0.552443] device id =3D 24d0
> [    0.552942] device id =3D 25a1
> [    0.552942] device id =3D 25a1
> [    0.553452] device id =3D 2670
> [    0.553452] device id =3D 2670
> [    0.554023] Generic platform RAM MTD, (c) 2004 Simtec Electronics
> [    0.554023] Generic platform RAM MTD, (c) 2004 Simtec Electronics
> [    0.555125] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Norte=
l Networks.
> [    0.555125] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Norte=
l Networks.
> [    0.556412] pmc551: not detected
> [    0.556412] pmc551: not detected
> [    0.561532] I2O subsystem v1.325
> [    0.561532] I2O subsystem v1.325
> [    0.562113] i2o: max drivers =3D 8
> [    0.562113] i2o: max drivers =3D 8
> [    0.563417] I2O Configuration OSM v1.323
> [    0.563417] I2O Configuration OSM v1.323
> [    0.564184] I2O Bus Adapter OSM v1.317
> [    0.564184] I2O Bus Adapter OSM v1.317
> [    0.564848] I2O ProcFS OSM v1.316
> [    0.564848] I2O ProcFS OSM v1.316
> [    0.696896] Generic UIO driver for PCI 2.3 devices version: 0.01.0
> [    0.696896] Generic UIO driver for PCI 2.3 devices version: 0.01.0
> [    0.698164] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    0.698164] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    0.700371] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.700371] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.701260] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    0.701260] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    0.748607] mousedev: PS/2 mouse device common for all mice
> [    0.748607] mousedev: PS/2 mouse device common for all mice
> [    0.750269] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    0.750269] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    0.827235] i2c /dev entries driver
> [    0.827235] i2c /dev entries driver
> [    0.828119] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0xb100,=
 revision 0
> [    0.828119] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0xb100,=
 revision 0
> [    0.923547] i2c-parport-light: adapter type unspecified
> [    0.923547] i2c-parport-light: adapter type unspecified
> [    0.924448] Driver for 1-wire Dallas network protocol.
> [    0.924448] Driver for 1-wire Dallas network protocol.
> [    0.925428] 1-Wire driver for the DS2760 battery monitor  chip  - (c) =
2004-2005, Szabolcs Gyurko
> [    0.925428] 1-Wire driver for the DS2760 battery monitor  chip  - (c) =
2004-2005, Szabolcs Gyurko
> [    0.927062] i2c-core: driver [max17040] using legacy suspend method
> [    0.927062] i2c-core: driver [max17040] using legacy suspend method
> [    0.928141] i2c-core: driver [max17040] using legacy resume method
> [    0.928141] i2c-core: driver [max17040] using legacy resume method
> [    1.261425] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input2
> [    1.261425] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input2
> [    1.410072] tsc: Refined TSC clocksource calibration: 2693.472 MHz
> [    1.410072] tsc: Refined TSC clocksource calibration: 2693.472 MHz
> [    1.656715] i2c i2c-0: detect fail: address match, 0x2c
> [    1.656715] i2c i2c-0: detect fail: address match, 0x2c
> [    1.670054] i2c i2c-0: detect fail: address match, 0x2d
> [    1.670054] i2c i2c-0: detect fail: address match, 0x2d
> [    1.683379] i2c i2c-0: detect fail: address match, 0x2e
> [    1.683379] i2c i2c-0: detect fail: address match, 0x2e
> [    1.696711] i2c i2c-0: detect fail: address match, 0x2f
> [    1.696711] i2c i2c-0: detect fail: address match, 0x2f
> [    1.796719] applesmc: supported laptop not found!
> [    1.796719] applesmc: supported laptop not found!
> [    1.797533] applesmc: driver init failed (ret=3D-19)!
> [    1.797533] applesmc: driver init failed (ret=3D-19)!
> [    8.613471] pc87360: PC8736x not detected, module not inserted
> [    8.613471] pc87360: PC8736x not detected, module not inserted
> [    8.840308] acquirewdt: WDT driver for Acquire single board computer i=
nitialising
> [    8.840308] acquirewdt: WDT driver for Acquire single board computer i=
nitialising
> [    8.841726] acquirewdt: I/O address 0x0043 already in use
> [    8.841726] acquirewdt: I/O address 0x0043 already in use
> [    8.842657] acquirewdt: probe of acquirewdt failed with error -5
> [    8.842657] acquirewdt: probe of acquirewdt failed with error -5
> [    8.843716] alim7101_wdt: Steve Hill <steve@navaho.co.uk>
> [    8.843716] alim7101_wdt: Steve Hill <steve@navaho.co.uk>
> [    8.844639] alim7101_wdt: ALi M7101 PMU not present - WDT not set
> [    8.844639] alim7101_wdt: ALi M7101 PMU not present - WDT not set
> [    8.845679] sp5100_tco: SP5100 TCO WatchDog Timer Driver v0.01
> [    8.845679] sp5100_tco: SP5100 TCO WatchDog Timer Driver v0.01
> [    8.850125] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [    8.850125] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [    8.851639] wafer5823wdt: WDT driver for Wafer 5823 single board compu=
ter initialising
> [    8.851639] wafer5823wdt: WDT driver for Wafer 5823 single board compu=
ter initialising
> [    8.853006] wafer5823wdt: I/O address 0x0443 already in use
> [    8.853006] wafer5823wdt: I/O address 0x0443 already in use
> [    8.853974] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
> [    8.853974] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.10
> [    8.855022] sc1200wdt: build 20020303
> [    8.855022] sc1200wdt: build 20020303
> [    8.855689] sc1200wdt: io parameter must be specified
> [    8.855689] sc1200wdt: io parameter must be specified
> [    8.856574] pc87413_wdt: Version 1.1 at io 0x2E
> [    8.856574] pc87413_wdt: Version 1.1 at io 0x2E
> [    8.857391] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.857391] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.858529] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [    8.858529] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [    8.859486] sbc60xxwdt: I/O address 0x0443 already in use
> [    8.859486] sbc60xxwdt: I/O address 0x0443 already in use
> [    8.860429] sbc8360: failed to register misc device
> [    8.860429] sbc8360: failed to register misc device
> [    8.861311] smsc37b787_wdt: SMsC 37B787 watchdog component driver 1.1 =
initialising...
> [    8.861311] smsc37b787_wdt: SMsC 37B787 watchdog component driver 1.1 =
initialising...
> [    8.863717] smsc37b787_wdt: Unable to register miscdev on minor 130
> [    8.863717] smsc37b787_wdt: Unable to register miscdev on minor 130
> [    8.864824] w83627hf_wdt: WDT driver for the Winbond(TM) W83627HF/THF/=
HG/DHG Super I/O chip initialising
> [    8.864824] w83627hf_wdt: WDT driver for the Winbond(TM) W83627HF/THF/=
HG/DHG Super I/O chip initialising
> [    8.866484] w83627hf_wdt: Watchdog already running. Resetting timeout =
to 60 sec
> [    8.866484] w83627hf_wdt: Watchdog already running. Resetting timeout =
to 60 sec
> [    8.867781] w83627hf_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.867781] w83627hf_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.868931] w83697hf_wdt: WDT driver for W83697HF/HG initializing
> [    8.868931] w83697hf_wdt: WDT driver for W83697HF/HG initializing
> [    8.869989] w83697hf_wdt: watchdog not found at address 0x2e
> [    8.869989] w83697hf_wdt: watchdog not found at address 0x2e
> [    8.870965] w83697hf_wdt: No W83697HF/HG could be found
> [    8.870965] w83697hf_wdt: No W83697HF/HG could be found
> [    8.871873] w83697ug_wdt: WDT driver for the Winbond(TM) W83697UG/UF S=
uper I/O chip initialising
> [    8.871873] w83697ug_wdt: WDT driver for the Winbond(TM) W83697UG/UF S=
uper I/O chip initialising
> [    8.873394] w83697ug_wdt: No W83697UG/UF could be found
> [    8.873394] w83697ug_wdt: No W83697UG/UF could be found
> [    8.874289] w83977f_wdt: driver v1.00
> [    8.874289] w83977f_wdt: driver v1.00
> [    8.874927] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.874927] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    8.876106] watchdog: Software Watchdog: cannot register miscdev on mi=
nor=3D130 (err=3D-16).
> [    8.876106] watchdog: Software Watchdog: cannot register miscdev on mi=
nor=3D130 (err=3D-16).
> [    8.877508] watchdog: Software Watchdog: a legacy watchdog module is p=
robably present.
> [    8.877508] watchdog: Software Watchdog: a legacy watchdog module is p=
robably present.
> [    8.878975] softdog: Software Watchdog Timer: 0.08 initialized. soft_n=
oboot=3D0 soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D1)
> [    8.878975] softdog: Software Watchdog Timer: 0.08 initialized. soft_n=
oboot=3D0 soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D1)
> [    8.880919] cpuidle: using governor ladder
> [    8.880919] cpuidle: using governor ladder
> [    8.881663] sdhci: Secure Digital Host Controller Interface driver
> [    8.881663] sdhci: Secure Digital Host Controller Interface driver
> [    8.882720] sdhci: Copyright(c) Pierre Ossman
> [    8.882720] sdhci: Copyright(c) Pierre Ossman
> [    8.883497] sdhci-pltfm: SDHCI platform and OF driver helper
> [    8.883497] sdhci-pltfm: SDHCI platform and OF driver helper
> [    8.950270] leds_ss4200: no LED devices found
> [    8.950270] leds_ss4200: no LED devices found
> [   12.300077]  (null): enodev DEV ADDR =3D 0xFF
> [   12.300077]  (null): enodev DEV ADDR =3D 0xFF
> [   12.301440] hv_vmbus: registering driver hid_hyperv
> [   12.301440] hv_vmbus: registering driver hid_hyperv
> [   12.302413] asus_wmi: Asus Management GUID not found
> [   12.302413] asus_wmi: Asus Management GUID not found
> =

> [   12.303396] asus_wmi: Management GUID not found
> [   12.303396] asus_wmi: Management GUID not found
> [   12.304579] dell_wmi: No known WMI GUID found
> [   12.304579] dell_wmi: No known WMI GUID found
> [   12.305336] acerhdf: Acer Aspire One Fan driver, v.0.5.26
> [   12.305336] acerhdf: Acer Aspire One Fan driver, v.0.5.26
> [   12.306283] acerhdf: unknown (unsupported) BIOS version Bochs/Bochs/Bo=
chs, please report, aborting!
> [   12.306283] acerhdf: unknown (unsupported) BIOS version Bochs/Bochs/Bo=
chs, please report, aborting!
> [   12.308119] FUJ02B1: call_fext_func: FUNC interface is not present
> [   12.308119] FUJ02B1: call_fext_func: FUNC interface is not present
> [   12.309186] fujitsu_laptop: driver 0.6.0 successfully loaded
> [   12.309186] fujitsu_laptop: driver 0.6.0 successfully loaded
> [   12.310170] fujitsu_tablet: Unknown (using defaults)
> [   12.310170] fujitsu_tablet: Unknown (using defaults)
> [   12.312126] =

> [   12.312126] printing PIC contents
> [   12.312126] =

> [   12.312126] printing PIC contents
> [   12.312972] ... PIC  IMR: ffff
> [   12.312972] ... PIC  IMR: ffff
> [   12.313491] ... PIC  IRR: 1013
> [   12.313491] ... PIC  IRR: 1013
> [   12.314060] ... PIC  ISR: 0000
> [   12.314060] ... PIC  ISR: 0000
> [   12.314594] ... PIC ELCR: 0c00
> [   12.314594] ... PIC ELCR: 0c00
> [   12.315122] printing local APIC contents on CPU#0/0:
> [   12.315122] printing local APIC contents on CPU#0/0:
> [   12.315987] ... APIC ID:      00000000 (0)
> [   12.315987] ... APIC ID:      00000000 (0)
> [   12.316696] ... APIC VERSION: 00050014
> [   12.316696] ... APIC VERSION: 00050014
> [   12.317333] ... APIC TASKPRI: 00000000 (00)
> [   12.317333] ... APIC TASKPRI: 00000000 (00)
> [   12.317375] ... APIC PROCPRI: 00000000
> [   12.317375] ... APIC PROCPRI: 00000000
> [   12.317375] ... APIC LDR: 01000000
> [   12.317375] ... APIC LDR: 01000000
> [   12.317375] ... APIC DFR: ffffffff
> [   12.317375] ... APIC DFR: ffffffff
> [   12.317375] ... APIC SPIV: 000001ff
> [   12.317375] ... APIC SPIV: 000001ff
> [   12.317375] ... APIC ISR field:
> [   12.317375] ... APIC ISR field:
> [   12.317375] 00000000
> [   12.317375] 0000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000000000000000000
> =

> [   12.317375] ... APIC TMR field:
> [   12.317375] ... APIC TMR field:
> [   12.317375] 00000000
> [   12.317375] 0000000002000000020000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000000000000000000
> =

> [   12.317375] ... APIC IRR field:
> [   12.317375] ... APIC IRR field:
> [   12.317375] 00000000
> [   12.317375] 0000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000000800000008000
> =

> [   12.317375] ... APIC ESR: 00000000
> [   12.317375] ... APIC ESR: 00000000
> [   12.317375] ... APIC ICR: 000008fd
> [   12.317375] ... APIC ICR: 000008fd
> [   12.317375] ... APIC ICR2: 02000000
> [   12.317375] ... APIC ICR2: 02000000
> [   12.317375] ... APIC LVTT: 000000ef
> [   12.317375] ... APIC LVTT: 000000ef
> [   12.317375] ... APIC LVTPC: 00010000
> [   12.317375] ... APIC LVTPC: 00010000
> [   12.317375] ... APIC LVT0: 00010700
> [   12.317375] ... APIC LVT0: 00010700
> [   12.317375] ... APIC LVT1: 00000400
> [   12.317375] ... APIC LVT1: 00000400
> [   12.317375] ... APIC LVTERR: 000000fe
> [   12.317375] ... APIC LVTERR: 000000fe
> [   12.317375] ... APIC TMICT: 00027fe7
> [   12.317375] ... APIC TMICT: 00027fe7
> [   12.317375] ... APIC TMCCT: 00000000
> [   12.317375] ... APIC TMCCT: 00000000
> [   12.317375] ... APIC TDCR: 00000003
> [   12.317375] ... APIC TDCR: 00000003
> [   12.317375] =

> [   12.317375] =

> [   12.332861] number of MP IRQ sources: 15.
> [   12.332861] number of MP IRQ sources: 15.
> [   12.333556] number of IO-APIC #0 registers: 24.
> [   12.333556] number of IO-APIC #0 registers: 24.
> [   12.334332] testing the IO APIC.......................
> [   12.334332] testing the IO APIC.......................
> [   12.335220] IO APIC #0......
> [   12.335220] IO APIC #0......
> [   12.335722] .... register #00: 00000000
> [   12.335722] .... register #00: 00000000
> [   12.336382] .......    : physical APIC id: 00
> [   12.336382] .......    : physical APIC id: 00
> [   12.337141] .......    : Delivery Type: 0
> [   12.337141] .......    : Delivery Type: 0
> [   12.337834] .......    : LTS          : 0
> [   12.337834] .......    : LTS          : 0
> [   12.338525] .... register #01: 00170011
> [   12.338525] .... register #01: 00170011
> [   12.339190] .......     : max redirection entries: 17
> [   12.339190] .......     : max redirection entries: 17
> [   12.340068] .......     : PRQ implemented: 0
> [   12.340068] .......     : PRQ implemented: 0
> [   12.340810] .......     : IO APIC version: 11
> [   12.340810] .......     : IO APIC version: 11
> [   12.341554] .... register #02: 00000000
> [   12.341554] .... register #02: 00000000
> [   12.342217] .......     : arbitration: 00
> [   12.342217] .......     : arbitration: 00
> [   12.342907] .... IRQ redirection table:
> [   12.342907] .... IRQ redirection table:
> [   12.343577]  NR Dst Mask Trig IRR Pol Stat Dmod Deli Vect:
> [   12.343577]  NR Dst Mask Trig IRR Pol Stat Dmod Deli Vect:
> [   12.344521]  00 00  =

> [   12.344521]  00 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.345438]  01 03  =

> [   12.345438]  01 03  0    0    0   0   0    1    1    31
> 0    0    0   0   0    1    1    31
> [   12.346361]  02 03  =

> [   12.346361]  02 03  0    0    0   0   0    1    1    30
> 0    0    0   0   0    1    1    30
> [   12.347296]  03 03  =

> [   12.347296]  03 03  0    0    0   0   0    1    1    33
> 0    0    0   0   0    1    1    33
> [   12.348221]  04 03  =

> [   12.348221]  04 03  1    0    0   0   0    1    1    34
> 1    0    0   0   0    1    1    34
> [   12.349142]  05 03  =

> [   12.349142]  05 03  1    1    0   0   0    1    1    35
> 1    1    0   0   0    1    1    35
> [   12.350082]  06 03  =

> [   12.350082]  06 03  0    0    0   0   0    1    1    36
> 0    0    0   0   0    1    1    36
> [   12.351001]  07 03  =

> [   12.351001]  07 03  0    0    0   0   0    1    1    37
> 0    0    0   0   0    1    1    37
> [   12.351919]  08 03  =

> [   12.351919]  08 03  0    0    0   0   0    1    1    38
> 0    0    0   0   0    1    1    38
> [   12.352842]  09 03  =

> [   12.352842]  09 03  0    1    0   0   0    1    1    39
> 0    1    0   0   0    1    1    39
> [   12.353771]  0a 03  =

> [   12.353771]  0a 03  1    1    0   0   0    1    1    3A
> 1    1    0   0   0    1    1    3A
> [   12.354696]  0b 03  =

> [   12.354696]  0b 03  1    1    0   0   0    1    1    3B
> 1    1    0   0   0    1    1    3B
> [   12.355614]  0c 03  =

> [   12.355614]  0c 03  0    0    0   0   0    1    1    3C
> 0    0    0   0   0    1    1    3C
> [   12.356524]  0d 03  =

> [   12.356524]  0d 03  0    0    0   0   0    1    1    3D
> 0    0    0   0   0    1    1    3D
> [   12.357458]  0e 03  =

> [   12.357458]  0e 03  0    0    0   0   0    1    1    3E
> 0    0    0   0   0    1    1    3E
> [   12.358375]  0f 03  =

> [   12.358375]  0f 03  0    0    0   0   0    1    1    3F
> 0    0    0   0   0    1    1    3F
> [   12.359293]  10 00  =

> [   12.359293]  10 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.360228]  11 00  =

> [   12.360228]  11 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.361155]  12 00  =

> [   12.361155]  12 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.362077]  13 00  =

> [   12.362077]  13 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.363004]  14 00  =

> [   12.363004]  14 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.363942]  15 00  =

> [   12.363942]  15 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.364867]  16 00  =

> [   12.364867]  16 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.365792]  17 00  =

> [   12.365792]  17 00  1    0    0   0   0    0    0    00
> 1    0    0   0   0    0    0    00
> [   12.366719] IRQ to pin mappings:
> [   12.366719] IRQ to pin mappings:
> [   12.367286] IRQ0 =

> [   12.367286] IRQ0 -> 0:2-> 0:2
> =

> [   12.367748] IRQ1 =

> [   12.367748] IRQ1 -> 0:1-> 0:1
> =

> [   12.368206] IRQ3 =

> [   12.368206] IRQ3 -> 0:3-> 0:3
> =

> [   12.368666] IRQ4 =

> [   12.368666] IRQ4 -> 0:4-> 0:4
> =

> [   12.369122] IRQ5 =

> [   12.369122] IRQ5 -> 0:5-> 0:5
> =

> [   12.369580] IRQ6 =

> [   12.369580] IRQ6 -> 0:6-> 0:6
> =

> [   12.370049] IRQ7 =

> [   12.370049] IRQ7 -> 0:7-> 0:7
> =

> [   12.370509] IRQ8 =

> [   12.370509] IRQ8 -> 0:8-> 0:8
> =

> [   12.370971] IRQ9 =

> [   12.370971] IRQ9 -> 0:9-> 0:9
> =

> [   12.371429] IRQ10 =

> [   12.371429] IRQ10 -> 0:10-> 0:10
> =

> [   12.371919] IRQ11 =

> [   12.371919] IRQ11 -> 0:11-> 0:11
> =

> [   12.372403] IRQ12 =

> [   12.372403] IRQ12 -> 0:12-> 0:12
> =

> [   12.372894] IRQ13 =

> [   12.372894] IRQ13 -> 0:13-> 0:13
> =

> [   12.373392] IRQ14 =

> [   12.373392] IRQ14 -> 0:14-> 0:14
> =

> [   12.373884] IRQ15 =

> [   12.373884] IRQ15 -> 0:15-> 0:15
> =

> [   12.374368] .................................... done.
> [   12.374368] .................................... done.
> [   12.375345] turn off boot console earlyser0
> [   12.375345] turn off boot console earlyser0
> [   12.377371] cryptomgr_probe (88) used greatest stack depth: 5808 bytes=
 left
> [   12.378042] Key type encrypted registered
> [   12.379028] dmaengine: __dma_request_channel: fail ((null))
> [   12.380075] ALSA device list:
> [   12.380361]   No soundcards found.
> [   12.381769] debug: unmapping init [mem 0xffffffff81afc000-0xffffffff81=
d3dfff]
> [   12.382576] Write protecting the kernel read-only data: 10240k
> [   12.383392] debug: unmapping init [mem 0xffff88000145d000-0xffff880001=
5fffff]
> [   12.384188] debug: unmapping init [mem 0xffff880001859000-0xffff880001=
9fffff]
> [   12.394775] mount (97) used greatest stack depth: 5656 bytes left
> /etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
> [   12.401434] S00fbsetup (99) used greatest stack depth: 5400 bytes left
> =

> Please wait: booting...
> Starting udev
> /etc/rcS.d/S03udev: line 72: can't create /proc/sys/kernel/hotplug: nonex=
istent directory
> error initializing inotify
> error sending message: Connection refused
> error sending message: Connection refused
> Starting Bootlog daemon: bootlogd: cannot find console device 4:64 under =
/dev
> bootlogd.
> Configuring network interfaces... ifconfig: socket: Address family not su=
pported by protocol
> done.
> hwclock: can't open '/dev/misc/rtc': No such file or directory
> Running postinst /etc/rpm-postinsts/100...
> [   81.154531] Unregister pv shared memory for cpu 0
> [   81.154991] Unregister pv shared memory for cpu 1
> [   81.157282] Disabling non-boot CPUs ...
> [   81.301735] Restarting system.
> [   81.302024] reboot: machine restart
> Elapsed time: 85
> qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/x86_64-randconf=
ig-j1-0612/3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112=
-g3dc4f7c -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 debug api=
c=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=
=3D10 softlockup_panic=3D1 nmi_watchdog=3Dpanic  prompt_ramdisk=3D0 console=
=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kb=
uild-tests/run-queue/kvm/x86_64-randconfig-j1-0612/baserock:baserock:morph:=
3dc4f7cfb7441e5e0fed3a02fc81cdaabd28300a:bisect-linux8/.vmlinuz-3dc4f7cfb74=
41e5e0fed3a02fc81cdaabd28300a-20140613053911-4-ivb42 branch=3Dbaserock/base=
rock/morph BOOT_IMAGE=3D/kernel/x86_64-randconfig-j1-0612/3dc4f7cfb7441e5e0=
fed3a02fc81cdaabd28300a/vmlinuz-3.7.0-rc3-00112-g3dc4f7c drbd.minor_count=
=3D8'  -initrd /kernel-tests/initrd/yocto-minimal-x86_64.cgz -m 320 -smp 2 =
-net nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3Dnc -no-reb=
oot -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-yo=
cto-ivb42-10 -serial file:/dev/shm/kboot/serial-yocto-ivb42-10 -daemonize -=
display none -monitor null =

> =



> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 3.7.0-rc3 Kernel Configuration
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
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_GENERIC_HWEIGHT=3Dy
> CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_DEFAULT_IDLE=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_CPU_AUTOPROBE=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_X86_HT=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-sa=
ved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -=
fcall-saved-r11"
> CONFIG_ARCH_CPU_PROBE_RELEASE=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_HAVE_IRQ_WORK=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> =

> #
> # General setup
> #
> # CONFIG_EXPERIMENTAL is not set
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> CONFIG_CROSS_COMPILE=3D""
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SYSVIPC=3Dy
> CONFIG_FHANDLE=3Dy
> # CONFIG_AUDIT is not set
> CONFIG_HAVE_GENERIC_HARDIRQS=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_HARDIRQS=3Dy
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
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
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=3Dy
> # CONFIG_BSD_PROCESS_ACCT_V3 is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_PREEMPT_RCU is not set
> CONFIG_RCU_USER_QS=3Dy
> # CONFIG_RCU_USER_QS_FORCE is not set
> CONFIG_RCU_FANOUT=3D64
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FANOUT_EXACT is not set
> CONFIG_TREE_RCU_TRACE=3Dy
> CONFIG_IKCONFIG=3Dy
> # CONFIG_IKCONFIG_PROC is not set
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_CGROUPS=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_CGROUP_FREEZER is not set
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_RESOURCE_COUNTERS is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> # CONFIG_IPC_NS is not set
> # CONFIG_PID_NS is not set
> CONFIG_NET_NS=3Dy
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_HOTPLUG=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> # CONFIG_PCSPKR_PLATFORM is not set
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> # CONFIG_EPOLL is not set
> CONFIG_SIGNALFD=3Dy
> # CONFIG_TIMERFD is not set
> CONFIG_EVENTFD=3Dy
> # CONFIG_SHMEM is not set
> CONFIG_AIO=3Dy
> CONFIG_EMBEDDED=3Dy
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # CONFIG_VM_EVENT_COUNTERS is not set
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_COMPAT_BRK=3Dy
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> # CONFIG_SLOB is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_JUMP_LABEL is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_ATTRS=3Dy
> CONFIG_USE_GENERIC_SMP_HELPERS=3Dy
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
> CONFIG_GENERIC_KERNEL_THREAD=3Dy
> CONFIG_GENERIC_KERNEL_EXECVE=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_RCU_USER_QS=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_STOP_MACHINE=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> CONFIG_X86_VSMP=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_PARAVIRT_GUEST=3Dy
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> # CONFIG_XEN is not set
> # CONFIG_XEN_PRIVILEGED_GUEST is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_NO_BOOTMEM=3Dy
> CONFIG_MEMTEST=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D12
> CONFIG_X86_CMPXCHG=3Dy
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_XADD=3Dy
> CONFIG_X86_WP_WORKS_OK=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D8
> # CONFIG_SCHED_SMT is not set
> # CONFIG_SCHED_MC is not set
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> # CONFIG_X86_MCE is not set
> # CONFIG_I8K is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> # CONFIG_DIRECT_GBPAGES is not set
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_MEMORY_PROBE=3Dy
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> # CONFIG_SPARSEMEM_VMEMMAP is not set
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D999999
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_CLEANCACHE is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MTRR is not set
> # CONFIG_ARCH_RANDOM is not set
> # CONFIG_X86_SMAP is not set
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> # CONFIG_SECCOMP is not set
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> CONFIG_HZ_300=3Dy
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D300
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> # CONFIG_RELOCATABLE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x1000000
> CONFIG_HOTPLUG_CPU=3Dy
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
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM_RUNTIME=3Dy
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_PROCFS is not set
> # CONFIG_ACPI_PROCFS_POWER is not set
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_PROC_EVENT=3Dy
> CONFIG_ACPI_AC=3Dy
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_FAN is not set
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_THERMAL=3Dy
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ACPI_BLACKLIST_YEAR=3D0
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_SBS=3Dy
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dy
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_TABLE=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> # CONFIG_CPU_FREQ_STAT_DETAILS is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> # CONFIG_CPU_FREQ_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # x86 CPU frequency scaling drivers
> #
> CONFIG_X86_PCC_CPUFREQ=3Dy
> # CONFIG_X86_ACPI_CPUFREQ is not set
> # CONFIG_X86_POWERNOW_K8 is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Memory power savings
> #
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> # CONFIG_PCI_MMCONFIG is not set
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIE_ECRC=3Dy
> # CONFIG_PCIEAER_INJECT is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEBUG=3Dy
> # CONFIG_PCIEASPM_DEFAULT is not set
> CONFIG_PCIEASPM_POWERSAVE=3Dy
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_ARCH_SUPPORTS_MSI=3Dy
> CONFIG_PCI_MSI=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dy
> CONFIG_HT_IRQ=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_IOAPIC=3Dy
> CONFIG_PCI_LABEL=3Dy
> # CONFIG_ISA_DMA_API is not set
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
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
> # CONFIG_PD6729 is not set
> CONFIG_I82092=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI is not set
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_TSI721=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
> # CONFIG_RAPIDIO_DEBUG is not set
> CONFIG_RAPIDIO_TSI57X=3Dy
> CONFIG_RAPIDIO_CPS_XX=3Dy
> CONFIG_RAPIDIO_TSI568=3Dy
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> # CONFIG_RAPIDIO_TSI500 is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
> # CONFIG_HAVE_AOUT is not set
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> CONFIG_HAVE_TEXT_POKE_SMP=3Dy
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
> # CONFIG_NETFILTER is not set
> # CONFIG_ATM is not set
> # CONFIG_BRIDGE is not set
> # CONFIG_VLAN_8021Q is not set
> # CONFIG_DECNET is not set
> # CONFIG_LLC2 is not set
> # CONFIG_IPX is not set
> # CONFIG_ATALK is not set
> # CONFIG_PHONET is not set
> # CONFIG_NET_SCHED is not set
> # CONFIG_DCB is not set
> # CONFIG_DNS_RESOLVER is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_OPENVSWITCH is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_NETPRIO_CGROUP is not set
> CONFIG_BQL=3Dy
> =

> #
> # Network testing
> #
> # CONFIG_NET_PKTGEN is not set
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
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> CONFIG_HAVE_BPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> CONFIG_UEVENT_HELPER_PATH=3D""
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> =

> #
> # Bus devices
> #
> # CONFIG_OMAP_OCP2SCP is not set
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> # CONFIG_MTD_CHAR is not set
> CONFIG_HAVE_MTD_OTP=3Dy
> CONFIG_MTD_OOPS=3Dy
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
> # CONFIG_MTD_CFI_INTELEXT is not set
> # CONFIG_MTD_CFI_AMDSTD is not set
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> # CONFIG_MTD_SC520CDP is not set
> # CONFIG_MTD_NETSC520 is not set
> # CONFIG_MTD_TS5500 is not set
> # CONFIG_MTD_AMD76XROM is not set
> CONFIG_MTD_ICHXROM=3Dy
> CONFIG_MTD_ESB2ROM=3Dy
> # CONFIG_MTD_CK804XROM is not set
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> # CONFIG_MTD_L440GX is not set
> # CONFIG_MTD_PCI is not set
> CONFIG_MTD_PCMCIA=3Dy
> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> CONFIG_MTD_PMC551_DEBUG=3Dy
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTDRAM_ABS_POS=3D0
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOC2000 is not set
> # CONFIG_MTD_DOC2001 is not set
> # CONFIG_MTD_DOC2001PLUS is not set
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> CONFIG_MTD_NAND_ECC_SMC=3Dy
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_BCH=3Dy
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> # CONFIG_MTD_SM_COMMON is not set
> # CONFIG_MTD_NAND_MUSEUM_IDS is not set
> CONFIG_MTD_NAND_DENALI=3Dy
> CONFIG_MTD_NAND_DENALI_SCRATCH_REG_ADDR=3D0xFF108018
> CONFIG_MTD_NAND_IDS=3Dy
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_CAFE=3Dy
> # CONFIG_MTD_NAND_NANDSIM is not set
> CONFIG_MTD_NAND_PLATFORM=3Dy
> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> CONFIG_MTD_ONENAND_GENERIC=3Dy
> CONFIG_MTD_ONENAND_OTP=3Dy
> # CONFIG_MTD_ONENAND_2X_PROGRAM is not set
> # CONFIG_MTD_ONENAND_SIM is not set
> =

> #
> # LPDDR flash memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> CONFIG_MTD_UBI_FASTMAP=3Dy
> CONFIG_MTD_UBI_GLUEBI=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> CONFIG_AD525X_DPOT=3Dy
> CONFIG_AD525X_DPOT_I2C=3Dy
> CONFIG_IBM_ASM=3Dy
> CONFIG_PHANTOM=3Dy
> # CONFIG_INTEL_MID_PTI is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_VMWARE_BALLOON=3Dy
> # CONFIG_BMP085_I2C is not set
> CONFIG_PCH_PHUB=3Dy
> CONFIG_USB_SWITCH_FSA9480=3Dy
> CONFIG_C2PORT=3Dy
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_CB710_CORE=3Dy
> CONFIG_CB710_DEBUG=3Dy
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> CONFIG_SENSORS_LIS3_I2C=3Dy
> =

> #
> # Altera FPGA firmware download module
> #
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=3Dy
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> CONFIG_FUSION=3Dy
> CONFIG_FUSION_MAX_SGE=3D128
> CONFIG_FUSION_LOGGING=3Dy
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_NOSY=3Dy
> CONFIG_I2O=3Dy
> # CONFIG_I2O_LCT_NOTIFY_ON_CHANGES is not set
> CONFIG_I2O_EXT_ADAPTEC=3Dy
> CONFIG_I2O_EXT_ADAPTEC_DMA64=3Dy
> CONFIG_I2O_CONFIG=3Dy
> CONFIG_I2O_CONFIG_OLD_IOCTL=3Dy
> CONFIG_I2O_BUS=3Dy
> CONFIG_I2O_PROC=3Dy
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_NETDEVICES is not set
> # CONFIG_ISDN is not set
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
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
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
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> # CONFIG_MOUSE_PS2_LIFEBOOK is not set
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_SERIAL=3Dy
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> # CONFIG_JOYSTICK_A3D is not set
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> # CONFIG_JOYSTICK_GF2K is not set
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> CONFIG_JOYSTICK_GUILLEMOT=3Dy
> CONFIG_JOYSTICK_INTERACT=3Dy
> CONFIG_JOYSTICK_SIDEWINDER=3Dy
> CONFIG_JOYSTICK_TMDC=3Dy
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> CONFIG_JOYSTICK_WARRIOR=3Dy
> # CONFIG_JOYSTICK_MAGELLAN is not set
> CONFIG_JOYSTICK_SPACEORB=3Dy
> # CONFIG_JOYSTICK_SPACEBALL is not set
> # CONFIG_JOYSTICK_STINGER is not set
> CONFIG_JOYSTICK_TWIDJOY=3Dy
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> CONFIG_JOYSTICK_AS5011=3Dy
> CONFIG_JOYSTICK_JOYDUMP=3Dy
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_WACOM is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> # CONFIG_TOUCHSCREEN_88PM860X is not set
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> # CONFIG_TOUCHSCREEN_ATMEL_MXT is not set
> CONFIG_TOUCHSCREEN_BU21013=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> # CONFIG_TOUCHSCREEN_DYNAPRO is not set
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> # CONFIG_TOUCHSCREEN_EETI is not set
> # CONFIG_TOUCHSCREEN_EGALAX is not set
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> # CONFIG_TOUCHSCREEN_ILI210X is not set
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> # CONFIG_TOUCHSCREEN_WACOM_W8001 is not set
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> # CONFIG_TOUCHSCREEN_MMS114 is not set
> # CONFIG_TOUCHSCREEN_MTOUCH is not set
> # CONFIG_TOUCHSCREEN_INEXIO is not set
> # CONFIG_TOUCHSCREEN_MK712 is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> # CONFIG_TOUCHSCREEN_TOUCHWIN is not set
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WM831X=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> # CONFIG_TOUCHSCREEN_TSC_SERIO is not set
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> # CONFIG_TOUCHSCREEN_ST1232 is not set
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> # CONFIG_INPUT_MISC is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> # CONFIG_VT is not set
> # CONFIG_UNIX98_PTYS is not set
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> CONFIG_TRACE_ROUTER=3Dy
> CONFIG_TRACE_SINK=3Dy
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> # CONFIG_SERIAL_8250_PCI is not set
> CONFIG_SERIAL_8250_CS=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_MFD_HSU=3Dy
> CONFIG_SERIAL_MFD_HSU_CONSOLE=3Dy
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dy
> CONFIG_SERIAL_SCCNXP=3Dy
> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> CONFIG_SERIAL_PCH_UART=3Dy
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> # CONFIG_SERIAL_XILINX_PS_UART is not set
> CONFIG_TTY_PRINTK=3Dy
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_HW_RANDOM_INTEL is not set
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> # CONFIG_HW_RANDOM_TPM is not set
> CONFIG_NVRAM=3Dy
> # CONFIG_RTC is not set
> # CONFIG_GEN_RTC is not set
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> CONFIG_MWAVE=3Dy
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_NSC=3Dy
> # CONFIG_TCG_ATMEL is not set
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_I2C=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCF=3Dy
> CONFIG_I2C_ALGOPCA=3Dy
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_I801=3Dy
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
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
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EG20T=3Dy
> # CONFIG_I2C_INTEL_MID is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT_LIGHT=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_HSI is not set
> =

> #
> # PPS support
> #
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> =

> #
> # Enable Device Drivers -> PPS to see the PTP clock options.
> #
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> # CONFIG_GPIOLIB is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> # CONFIG_W1_MASTER_DS1WM is not set
> # CONFIG_HDQ_MASTER_OMAP is not set
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> # CONFIG_W1_SLAVE_DS2781 is not set
> CONFIG_W1_SLAVE_DS28E04=3Dy
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dy
> # CONFIG_MAX8925_POWER is not set
> CONFIG_WM831X_BACKUP=3Dy
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_BATTERY_BQ27x00 is not set
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_88PM860X is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_SMB347 is not set
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
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_FSCHMD is not set
> # CONFIG_SENSORS_G760A is not set
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_CORETEMP is not set
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LM63=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> CONFIG_SENSORS_LTC4245=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_LM95241=3Dy
> # CONFIG_SENSORS_LM95245 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> CONFIG_SENSORS_ADM1275=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> # CONFIG_SENSORS_MAX16064 is not set
> CONFIG_SENSORS_MAX34440=3Dy
> # CONFIG_SENSORS_MAX8688 is not set
> # CONFIG_SENSORS_UCD9000 is not set
> CONFIG_SENSORS_UCD9200=3Dy
> CONFIG_SENSORS_ZL6100=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dy
> # CONFIG_SENSORS_SMSC47M1 is not set
> CONFIG_SENSORS_SMSC47M192=3Dy
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> # CONFIG_SENSORS_SCH5627 is not set
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_ADS1015=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> # CONFIG_SENSORS_TMP102 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> CONFIG_SENSORS_WM831X=3Dy
> CONFIG_SENSORS_APPLESMC=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_CPU_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> # CONFIG_WM831X_WATCHDOG is not set
> # CONFIG_TWL4030_WATCHDOG is not set
> CONFIG_ACQUIRE_WDT=3Dy
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> CONFIG_SP5100_TCO=3Dy
> # CONFIG_SC520_WDT is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> CONFIG_ITCO_WDT=3Dy
> # CONFIG_ITCO_VENDOR_SUPPORT is not set
> CONFIG_IT8712F_WDT=3Dy
> CONFIG_HP_WATCHDOG=3Dy
> # CONFIG_HPWDT_NMI_DECODING is not set
> CONFIG_SC1200_WDT=3Dy
> CONFIG_PC87413_WDT=3Dy
> CONFIG_NV_TCO=3Dy
> CONFIG_60XX_WDT=3Dy
> CONFIG_SBC8360_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> CONFIG_SMSC37B787_WDT=3Dy
> CONFIG_VIA_WDT=3Dy
> CONFIG_W83627HF_WDT=3Dy
> CONFIG_W83697HF_WDT=3Dy
> CONFIG_W83697UG_WDT=3Dy
> # CONFIG_W83877F_WDT is not set
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dy
> CONFIG_WDTPCI=3Dy
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
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> # CONFIG_SSB_SDIOHOST is not set
> CONFIG_SSB_SILENT=3Dy
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_SM501 is not set
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_TPS6105X is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_TWL4030_CORE=3Dy
> # CONFIG_TWL4030_MADC is not set
> # CONFIG_MFD_TWL4030_AUDIO is not set
> CONFIG_TWL6040_CORE=3Dy
> # CONFIG_MFD_STMPE is not set
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_SMSC is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_MAX77686=3Dy
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> # CONFIG_MFD_CS5535 is not set
> CONFIG_LPC_SCH=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> # CONFIG_MFD_VX855 is not set
> # CONFIG_MFD_WL1273_CORE is not set
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_REGULATOR is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> # CONFIG_DRM is not set
> # CONFIG_STUB_POULSBO is not set
> # CONFIG_VGASTATE is not set
> # CONFIG_VIDEO_OUTPUT_CONTROL is not set
> # CONFIG_FB is not set
> CONFIG_EXYNOS_VIDEO=3Dy
> # CONFIG_BACKLIGHT_LCD_SUPPORT is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_HWDEP=3Dy
> CONFIG_SND_SEQUENCER=3Dy
> # CONFIG_SND_SEQ_DUMMY is not set
> CONFIG_SND_OSSEMUL=3Dy
> CONFIG_SND_MIXER_OSS=3Dy
> # CONFIG_SND_PCM_OSS is not set
> # CONFIG_SND_SEQUENCER_OSS is not set
> # CONFIG_SND_HRTIMER is not set
> CONFIG_SND_DYNAMIC_MINORS=3Dy
> # CONFIG_SND_SUPPORT_OLD_API is not set
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> CONFIG_SND_VERBOSE_PRINTK=3Dy
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_DMA_SGBUF=3Dy
> # CONFIG_SND_RAWMIDI_SEQ is not set
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> # CONFIG_SND_SBAWE_SEQ is not set
> # CONFIG_SND_EMU10K1_SEQ is not set
> CONFIG_SND_VX_LIB=3Dy
> # CONFIG_SND_DRIVERS is not set
> # CONFIG_SND_PCI is not set
> CONFIG_SND_FIREWIRE=3Dy
> CONFIG_SND_FIREWIRE_LIB=3Dy
> # CONFIG_SND_FIREWIRE_SPEAKERS is not set
> CONFIG_SND_ISIGHT=3Dy
> CONFIG_SND_PCMCIA=3Dy
> CONFIG_SND_VXPOCKET=3Dy
> # CONFIG_SND_PDAUDIOCF is not set
> # CONFIG_SND_SOC is not set
> # CONFIG_SOUND_PRIME is not set
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
> CONFIG_HID_HYPERV_MOUSE=3Dy
> CONFIG_USB_ARCH_HAS_OHCI=3Dy
> CONFIG_USB_ARCH_HAS_EHCI=3Dy
> CONFIG_USB_ARCH_HAS_XHCI=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> # CONFIG_USB is not set
> # CONFIG_USB_OTG_WHITELIST is not set
> # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_SSB is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_OMAP_USB2 is not set
> # CONFIG_USB_GADGET is not set
> =

> #
> # OTG and related infrastructure
> #
> CONFIG_MMC=3Dy
> CONFIG_MMC_DEBUG=3Dy
> # CONFIG_MMC_UNSAFE_RESUME is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> CONFIG_SDIO_UART=3Dy
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> CONFIG_MMC_CB710=3Dy
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> =

> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dy
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP8788=3Dy
> # CONFIG_LEDS_CLEVO_MAIL is not set
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA9633 is not set
> CONFIG_LEDS_WM831X_STATUS=3Dy
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_INTEL_SS4200=3Dy
> CONFIG_LEDS_ADP5520=3Dy
> # CONFIG_LEDS_DELL_NETBOOKS is not set
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_MAX8997=3Dy
> # CONFIG_LEDS_LM355x is not set
> # CONFIG_LEDS_OT200 is not set
> CONFIG_LEDS_BLINKM=3Dy
> CONFIG_LEDS_TRIGGERS=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> # CONFIG_EDAC is not set
> # CONFIG_RTC_CLASS is not set
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMADEVICES_DEBUG=3Dy
> CONFIG_DMADEVICES_VDEBUG=3Dy
> =

> #
> # DMA Devices
> #
> CONFIG_INTEL_MID_DMAC=3Dy
> CONFIG_INTEL_IOATDMA=3Dy
> # CONFIG_TIMB_DMA is not set
> # CONFIG_PCH_DMA is not set
> CONFIG_DMA_ENGINE=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_NET_DMA=3Dy
> # CONFIG_ASYNC_TX_DMA is not set
> CONFIG_DMATEST=3Dy
> CONFIG_DCA=3Dy
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> # CONFIG_UIO_PDRV is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> CONFIG_UIO_PCI_GENERIC=3Dy
> CONFIG_UIO_NETX=3Dy
> =

> #
> # Virtio drivers
> #
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dy
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WMI is not set
> CONFIG_ACERHDF=3Dy
> CONFIG_ASUS_LAPTOP=3Dy
> CONFIG_DELL_WMI=3Dy
> # CONFIG_DELL_WMI_AIO is not set
> CONFIG_FUJITSU_LAPTOP=3Dy
> CONFIG_FUJITSU_LAPTOP_DEBUG=3Dy
> CONFIG_FUJITSU_TABLET=3Dy
> CONFIG_HP_ACCEL=3Dy
> CONFIG_HP_WMI=3Dy
> CONFIG_PANASONIC_LAPTOP=3Dy
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> CONFIG_EEEPC_LAPTOP=3Dy
> CONFIG_ASUS_WMI=3Dy
> # CONFIG_ASUS_NB_WMI is not set
> CONFIG_EEEPC_WMI=3Dy
> CONFIG_ACPI_WMI=3Dy
> # CONFIG_MSI_WMI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dy
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> CONFIG_ACPI_CMPC=3Dy
> CONFIG_INTEL_IPS=3Dy
> CONFIG_IBM_RTL=3Dy
> # CONFIG_XO15_EBOOK is not set
> CONFIG_SAMSUNG_LAPTOP=3Dy
> # CONFIG_MXM_WMI is not set
> CONFIG_SAMSUNG_Q10=3Dy
> CONFIG_APPLE_GMUX=3Dy
> =

> #
> # Hardware Spinlock drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers (EXPERIMENTAL)
> #
> =

> #
> # Rpmsg drivers (EXPERIMENTAL)
> #
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dy
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> =

> #
> # DEVFREQ Drivers
> #
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_MAX8997=3Dy
> # CONFIG_EXTCON_ARIZONA is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> # CONFIG_PWM_TWL6030 is not set
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_EFI_VARS is not set
> CONFIG_DELL_RBU=3Dy
> # CONFIG_DCDBAS is not set
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> # CONFIG_GOOGLE_SMI is not set
> # CONFIG_GOOGLE_MEMCONSOLE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_FS_POSIX_ACL is not set
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> # CONFIG_INOTIFY_USER is not set
> CONFIG_FANOTIFY=3Dy
> # CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_FSCACHE_OBJECT_LIST=3Dy
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> # CONFIG_PROC_SYSCTL is not set
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_SYSFS=3Dy
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> # CONFIG_JFFS2_ZLIB is not set
> CONFIG_JFFS2_LZO=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_JFFS2_CMODE_NONE is not set
> CONFIG_JFFS2_CMODE_PRIORITY=3Dy
> # CONFIG_JFFS2_CMODE_SIZE is not set
> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> CONFIG_UBIFS_FS=3Dy
> CONFIG_UBIFS_FS_ADVANCED_COMPR=3Dy
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> CONFIG_ROMFS_FS=3Dy
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> CONFIG_ROMFS_ON_MTD=3Dy
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_CONSOLE=3Dy
> CONFIG_PSTORE_FTRACE=3Dy
> # CONFIG_PSTORE_RAM is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> # CONFIG_NLS_CODEPAGE_950 is not set
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
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
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_DEFAULT_MESSAGE_LOGLEVEL=3D4
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_DEBUG_FS=3Dy
> # CONFIG_HEADERS_CHECK is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_SCHED_DEBUG is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_TIMER_STATS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_RT_MUTEX_TESTER=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> # CONFIG_SPARSE_RCU_POINTER is not set
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_STACKTRACE=3Dy
> CONFIG_DEBUG_STACK_USAGE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_DEBUG_VM is not set
> CONFIG_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_WRITECOUNT is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_LIST is not set
> CONFIG_TEST_LIST_SORT=3Dy
> CONFIG_DEBUG_SG=3Dy
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_DEBUG_CREDENTIALS is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> # CONFIG_CPU_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_MEMORY_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_WANT_PAGE_DEBUG_FLAGS=3Dy
> CONFIG_PAGE_GUARD=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_EVENT_POWER_TRACING_DEPRECATED=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_RING_BUFFER_ALLOW_SWAP=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_IRQSOFF_TRACER=3Dy
> # CONFIG_SCHED_TRACER is not set
> # CONFIG_FTRACE_SYSCALLS is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_UPROBE_EVENT is not set
> # CONFIG_PROBE_EVENTS is not set
> # CONFIG_DYNAMIC_FTRACE is not set
> # CONFIG_FUNCTION_PROFILER is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> CONFIG_MMIOTRACE=3Dy
> CONFIG_RING_BUFFER_BENCHMARK=3Dy
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_FIREWIRE_OHCI_REMOTE_DMA is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> # CONFIG_X86_PTDUMP is not set
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> CONFIG_DEBUG_TLBFLUSH=3Dy
> CONFIG_IOMMU_STRESS=3Dy
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> # CONFIG_IO_DELAY_0X80 is not set
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> CONFIG_IO_DELAY_NONE=3Dy
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D3
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_TRUSTED_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEYS_DEBUG_PROC_KEYS=3Dy
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_YAMA_STACKED is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_IMA is not set
> CONFIG_EVM=3Dy
> # CONFIG_DEFAULT_SECURITY_YAMA is not set
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_ASYNC_TX_DISABLE_PQ_VAL_DMA=3Dy
> CONFIG_ASYNC_TX_DISABLE_XOR_VAL_DMA=3Dy
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
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER_X86=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
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
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_HMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> # CONFIG_CRYPTO_SHA1_SSSE3 is not set
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
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> # CONFIG_CRYPTO_ARC4 is not set
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> # CONFIG_CRYPTO_CAST6_AVX_X86_64 is not set
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_ZLIB=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> =

> #
> # Random Number Generation
> #
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_GENERIC_IO=3Dy
> # CONFIG_CRC_CCITT is not set
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> CONFIG_CRC32_SELFTEST=3Dy
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> # CONFIG_LIBCRC32C is not set
> CONFIG_CRC8=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> # CONFIG_XZ_DEC_POWERPC is not set
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_AVERAGE=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_DDR is not set
> CONFIG_MPILIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> =


> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =



--===============5691158415164670349==--

