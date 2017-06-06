Content-Type: multipart/mixed; boundary="===============8119742797577930584=="
MIME-Version: 1.0
From: Bjorn Helgaas <helgaas@kernel.org>
To: lkp@lists.01.org
Subject: Re: [Merge tag 'pci-v4.12-changes' of git] 857f864014: BUG: unable to handle kernel NULL pointer dereference at 00000000000000a8
Date: Tue, 06 Jun 2017 12:55:52 -0500
Message-ID: <20170606175552.GA12672@bhelgaas-glaptop.roam.corp.google.com>
In-Reply-To: <5933fe2d.V33ODGPU9noDVuyF%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8119742797577930584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[+cc Logan]

I finally figured out after an embarrassing repeat of the
robot's bisection that the failure below is related to enabling
CONFIG_PCI_SW_SWITCHTEC, which was added by 080b47def5e5 ("MicroSemi
Switchtec management interface driver").

I haven't figured out exactly *what* the problem is yet.  Still
working on that...

On Sun, Jun 04, 2017 at 08:33:49PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 857f8640147c9fb43f20e43cbca6452710e1ca5d
> Merge: 8f3207c7eab9d 3146c8f4de9b0
> Author:     Linus Torvalds <torvalds@linux-foundation.org>
> AuthorDate: Mon May 8 19:03:25 2017 -0700
> Commit:     Linus Torvalds <torvalds@linux-foundation.org>
> CommitDate: Mon May 8 19:03:25 2017 -0700
> =

>     Merge tag 'pci-v4.12-changes' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/helgaas/pci
>     =

>     Pull PCI updates from Bjorn Helgaas:
>     =

>      - add framework for supporting PCIe devices in Endpoint mode (Kishon
>        Vijay Abraham I)
>     =

>      - use non-postable PCI config space mappings when possible (Lorenzo
>        Pieralisi)
>     =

>      - clean up and unify mmap of PCI BARs (David Woodhouse)
>     =

>      - export and unify Function Level Reset support (Christoph Hellwig)
>     =

>      - avoid FLR for Intel 82579 NICs (Sasha Neftin)
>     =

>      - add pci_request_irq() and pci_free_irq() helpers (Christoph Hellwi=
g)
>     =

>      - short-circuit config access failures for disconnected devices (Kei=
th
>        Busch)
>     =

>      - remove D3 sleep delay when possible (Adrian Hunter)
>     =

>      - freeze PME scan before suspending devices (Lukas Wunner)
>     =

>      - stop disabling MSI/MSI-X in pci_device_shutdown() (Prarit Bhargava)
>     =

>      - disable boot interrupt quirk for ASUS M2N-LR (Stefan Assmann)
>     =

>      - add arch-specific alignment control to improve device passthrough =
by
>        avoiding multiple BARs in a page (Yongji Xie)
>     =

>      - add sysfs sriov_drivers_autoprobe to control VF driver binding
>        (Bodong Wang)
>     =

>      - allow slots below PCI-to-PCIe "reverse bridges" (Bjorn Helgaas)
>     =

>      - fix crashes when unbinding host controllers that don't support
>        removal (Brian Norris)
>     =

>      - add driver for MicroSemi Switchtec management interface (Logan
>        Gunthorpe)
>     =

>      - add driver for Faraday Technology FTPCI100 host bridge (Linus
>        Walleij)
>     =

>      - add i.MX7D support (Andrey Smirnov)
>     =

>      - use generic MSI support for Aardvark (Thomas Petazzoni)
>     =

>      - make Rockchip driver modular (Brian Norris)
>     =

>      - advertise 128-byte Read Completion Boundary support for Rockchip
>        (Shawn Lin)
>     =

>      - advertise PCI_EXP_LNKSTA_SLC for Rockchip root port (Shawn Lin)
>     =

>      - convert atomic_t to refcount_t in HV driver (Elena Reshetova)
>     =

>      - add CPU IRQ affinity in HV driver (K. Y. Srinivasan)
>     =

>      - fix PCI bus removal in HV driver (Long Li)
>     =

>      - add support for ThunderX2 DMA alias topology (Jayachandran C)
>     =

>      - add ThunderX pass2.x 2nd node MCFG quirk (Tomasz Nowicki)
>     =

>      - add ITE 8893 bridge DMA alias quirk (Jarod Wilson)
>     =

>      - restrict Cavium ACS quirk only to CN81xx/CN83xx/CN88xx devices
>        (Manish Jaggi)
>     =

>     * tag 'pci-v4.12-changes' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/helgaas/pci: (146 commits)
>       PCI: Don't allow unbinding host controllers that aren't prepared
>       ARM: DRA7: clockdomain: Change the CLKTRCTRL of CM_PCIE_CLKSTCTRL t=
o SW_WKUP
>       MAINTAINERS: Add PCI Endpoint maintainer
>       Documentation: PCI: Add userguide for PCI endpoint test function
>       tools: PCI: Add sample test script to invoke pcitest
>       tools: PCI: Add a userspace tool to test PCI endpoint
>       Documentation: misc-devices: Add Documentation for pci-endpoint-tes=
t driver
>       misc: Add host side PCI driver for PCI test function device
>       PCI: Add device IDs for DRA74x and DRA72x
>       dt-bindings: PCI: dra7xx: Add DT bindings to enable unaligned access
>       PCI: dwc: dra7xx: Workaround for errata id i870
>       dt-bindings: PCI: dra7xx: Add DT bindings for PCI dra7xx EP mode
>       PCI: dwc: dra7xx: Add EP mode support
>       PCI: dwc: dra7xx: Facilitate wrapper and MSI interrupts to be enabl=
ed independently
>       dt-bindings: PCI: Add DT bindings for PCI designware EP mode
>       PCI: dwc: designware: Add EP mode support
>       Documentation: PCI: Add binding documentation for pci-test endpoint=
 function
>       ixgbe: Use pcie_flr() instead of duplicating it
>       IB/hfi1: Use pcie_flr() instead of duplicating it
>       PCI: imx6: Fix spelling mistake: "contol" -> "control"
>       ...
> =

> 8f3207c7ea  Merge tag 'tty-4.12-rc1' of git://git.kernel.org/pub/scm/linu=
x/kernel/git/gregkh/tty
> 3146c8f4de  Merge branch 'pci/remove' into next
> 857f864014  Merge tag 'pci-v4.12-changes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/helgaas/pci
> ea094f3c83  Merge tag 'hwmon-for-linus-v4.12-rc4' of git://git.kernel.org=
/pub/scm/linux/kernel/git/groeck/linux-staging
> 8adac26418  Add linux-next specific files for 20170602
> +-------------------------------------------+------------+------------+--=
----------+------------+---------------+
> |                                           | 8f3207c7ea | 3146c8f4de | 8=
57f864014 | ea094f3c83 | next-20170602 |
> +-------------------------------------------+------------+------------+--=
----------+------------+---------------+
> | boot_successes                            | 32         | 28         | 0=
          | 0          | 0             |
> | boot_failures                             | 0          | 7          | 1=
1         | 11         | 5             |
> | BUG:kernel_hang_in_boot_stage             | 0          | 5          |  =
          |            |               |
> | INFO:rcu_sched_self-detected_stall_on_CPU | 0          | 1          |  =
          |            |               |
> | invoked_oom-killer:gfp_mask=3D0x            | 0          | 2          |=
            |            |               |
> | Mem-Info                                  | 0          | 2          |  =
          |            |               |
> | Out_of_memory:Kill_process                | 0          | 2          |  =
          |            |               |
> | BUG:unable_to_handle_kernel               | 0          | 0          | 1=
1         | 11         | 5             |
> | Oops:#[##]                                | 0          | 0          | 1=
1         | 11         | 5             |
> | Kernel_panic-not_syncing:Fatal_exception  | 0          | 0          | 1=
1         | 11         | 5             |
> +-------------------------------------------+------------+------------+--=
----------+------------+---------------+
> =

> [   14.402240] CHRDEV "cmx" major number 227 goes below the dynamic alloc=
ation range
> [   14.404288] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [   14.407442] CHRDEV "aux" major number 226 goes below the dynamic alloc=
ation range
> [   14.409430] [drm] radeon kernel modesetting enabled.
> [   14.410875] [drm] amdgpu kernel modesetting enabled.
> [   14.412564] BUG: unable to handle kernel NULL pointer dereference at 0=
0000000000000a8
> [   14.414458] IP: down_write+0x2a/0x6c
> [   14.415544] PGD 0 =

> [   14.415546] P4D 0 =

> [   14.416246] =

> [   14.417528] Oops: 0002 [#1] SMP KASAN
> [   14.418502] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.0-11362-g85=
7f864 #1
> [   14.420274] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   14.422677] task: ffff880018589000 task.stack: ffff8800185a0000
> [   14.424022] RIP: 0010:down_write+0x2a/0x6c
> [   14.425088] RSP: 0000:ffff8800185a7c38 EFLAGS: 00010282
> [   14.426324] RAX: 00000000000000a8 RBX: 00000000000000a8 RCX: 000000000=
0000000
> [   14.427872] RDX: ffffffff00000001 RSI: 0000000000000034 RDI: ffff88001=
858901c
> [   14.429438] RBP: ffff8800185a7c48 R08: 00000000006d6567 R09: ffffed000=
2e928b0
> [   14.431062] R10: 0000000000000004 R11: 0000000000000001 R12: ffff88001=
3597500
> [   14.432616] R13: ffff8800185a7ce8 R14: ffff880013597530 R15: 000000000=
0000000
> [   14.434286] FS:  0000000000000000(0000) GS:ffff880018a00000(0000) knlG=
S:0000000000000000
> [   14.436222] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   14.437659] CR2: 00000000000000a8 CR3: 000000000d426000 CR4: 000000000=
00006f0
> [   14.439266] Call Trace:
> [   14.440069]  start_creating+0x91/0x1ad
> [   14.441228]  debugfs_create_dir+0x23/0x3ce
> [   14.442263]  drm_debugfs_init+0x10c/0x411
> [   14.443299]  ? drm_debugfs_create_files+0x420/0x420
> [   14.444697]  ? __kmalloc_track_caller+0xe8/0x1c4
> [   14.445927]  ? memcpy+0x45/0x4c
> [   14.446804]  drm_minor_register+0xb4/0x228
> [   14.447888]  drm_dev_register+0x135/0x665
> [   14.448808]  ? vmwgfx_init+0x5a/0x5a
> [   14.449652]  vgem_init+0x40/0x61
> [   14.450395]  do_one_initcall+0x117/0x21e
> [   14.451241]  ? start_kernel+0x603/0x603
> [   14.452074]  ? __wake_up+0x3f/0x4a
> [   14.452915]  kernel_init_freeable+0x425/0x4dd
> [   14.453826]  ? rest_init+0xaa/0xaa
> [   14.454621]  kernel_init+0x13/0x176
> [   14.455405]  ? rest_init+0xaa/0xaa
> [   14.456172]  ret_from_fork+0x2c/0x40
> [   14.456988] Code: df 55 48 89 e5 41 54 53 48 89 fb 31 d2 be 34 00 00 0=
0 48 c7 c7 60 d2 c7 a2 e8 e3 15 d6 fb 48 ba 01 00 00 00 ff ff ff ff 48 89 d=
8 <f0> 48 0f c1 10 85 d2 74 05 e8 33 e4 cf fc 65 4c 8b 24 25 00 73 =

> [   14.460590] RIP: down_write+0x2a/0x6c RSP: ffff8800185a7c38
> [   14.461759] CR2: 00000000000000a8
> [   14.462514] ---[ end trace 9e6a3be2423379f2 ]---
> [   14.463456] Kernel panic - not syncing: Fatal exception
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 5ed02dbb497422bf225783f46e6eadd237d23d6b v4.11 --
> git bisect  bad c81ee18e97e4e3162169a749eb7f2b79b3510c7a  # 12:47  B     =
 0     1   12   0  Merge tag 'armsoc-defconfig' of git://git.kernel.org/pub=
/scm/linux/kernel/git/arm/arm-soc
> git bisect good 2f34c1231bfc9f2550f934acb268ac7315fb3837  # 13:09  G     =
11     0    0   0  Merge tag 'drm-for-v4.12' of git://people.freedesktop.or=
g/~airlied/linux
> git bisect good 221656e7c4ce342b99c31eca96c1cbb6d1dce45f  # 13:40  G     =
11     0    1   1  Merge tag 'sound-4.12-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tiwai/sound
> git bisect good ab182e67ec99ea0c8d7435a32a4a1ed9bb02559a  # 14:03  G     =
10     0    0   2  Merge tag 'arm64-upstream' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/arm64/linux
> git bisect good 13e0988140374123bead1dd27c287354cb95108e  # 14:44  G     =
11     0    0   0  docs: complete bumping minimal GNU Make version to 3.81
> git bisect  bad 857f8640147c9fb43f20e43cbca6452710e1ca5d  # 14:56  B     =
 0     3   14   0  Merge tag 'pci-v4.12-changes' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/helgaas/pci
> git bisect good d9dc089583ebf28d6f02b995e2d71c85965660f9  # 15:25  G     =
11     0    0   2  Merge tag 'xtensa-20170507' of git://github.com/jcmvbkbc=
/linux-xtensa
> git bisect good 2d3e4866dea96b0506395b47bfefb234f2088dac  # 15:47  G     =
11     0    0   1  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/vi=
rt/kvm/kvm
> git bisect good bf5f89463f5b3109a72ed13ca62b57e90213387d  # 16:02  G     =
10     0    0   0  Merge branch 'akpm' (patches from Andrew)
> git bisect good 8f3207c7eab9d885cc64c778416537034a7d9c5b  # 16:23  G     =
10     0    1   1  Merge tag 'tty-4.12-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/gregkh/tty
> git bisect good 27e99676f0f15692d2b70efb8e697d9cf7091362  # 16:49  G     =
11     0    0   2  Merge branch 'pci/iommu' into next
> git bisect good acc886ec934980a45ae8962dbe88e221a40c77a2  # 17:09  G     =
11     0    0   2  Merge branch 'pci/pm' into next
> git bisect good fcdb10d6b179fde41ca94d032afda8f4ed796b8e  # 17:35  G     =
11     0    2   2  ia64: Remove redundant checks for WC in pci_mmap_page_ra=
nge()
> git bisect good 889e4dd916a1f4dc7f9e6220fed26d811e39ca71  # 18:05  G     =
11     0    0   0  Merge branch 'pci/resource-mmap' into next
> git bisect good 48f52d1a8ca9f1aff3ffad8e35b6c56eafa17b9b  # 18:20  G     =
10     0    0   0  PCI: Call pcie_flr() from reset_chelsio_generic_dev()
> git bisect good ef1b5dad5a386885998d11eb45ca7fd183079965  # 18:45  G     =
10     0    0   2  Merge branch 'pci/virtualization' into next
> git bisect good 3146c8f4de9b0858794a902f273aec13f168596e  # 19:02  G     =
10     0    0   0  Merge branch 'pci/remove' into next
> # first bad commit: [857f8640147c9fb43f20e43cbca6452710e1ca5d] Merge tag =
'pci-v4.12-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/helgaa=
s/pci
> git bisect good 8f3207c7eab9d885cc64c778416537034a7d9c5b  # 19:16  G     =
32     0    0   1  Merge tag 'tty-4.12-rc1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/gregkh/tty
> git bisect good 3146c8f4de9b0858794a902f273aec13f168596e  # 19:35  G     =
31     0    3   4  Merge branch 'pci/remove' into next
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 857f8640147c9fb43f20e43cbca6452710e1ca5d  # 19:49  B     =
 0     4   15   0  Merge tag 'pci-v4.12-changes' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/helgaas/pci
> # extra tests on HEAD of linux-devel/devel-spot-201706041110
> git bisect  bad 9a82652c052ee717f7fb831b6c375109d755344d  # 19:54  B     =
 0    15   29   0  0day head guard for 'devel-spot-201706041110'
> # extra tests on tree/branch linus/master
> git bisect  bad ea094f3c830a67f252677aacba5d04ebcf55c4d9  # 20:09  B     =
 0     1   12   0  Merge tag 'hwmon-for-linus-v4.12-rc4' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/groeck/linux-staging
> # extra tests on tree/branch linux-next/master
> git bisect  bad 8adac2641862695ac273c94b85fdd5574e2804bb  # 20:27  B     =
 0     2   13   0  Add linux-next specific files for 20170602
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion




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
> 	-m 512
> 	-smp 2
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
> 	earlyprintk=3DttyS0,115200
> 	console=3DttyS0,115200
> 	console=3Dtty0
> 	vga=3Dnormal
> 	rw
> 	drbd.minor_count=3D8
> )
> =

> "${kvm[@]}" -append "${append[*]}"

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.11.0 Kernel Configuration
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
> # CONFIG_KERNEL_GZIP is not set
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> # CONFIG_SWAP is not set
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> # CONFIG_CROSS_MEMORY_ATTACH is not set
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
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> # CONFIG_NO_HZ_FULL_ALL is not set
> CONFIG_NO_HZ_FULL_SYSIDLE=3Dy
> CONFIG_NO_HZ_FULL_SYSIDLE_SMALL=3D8
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> # CONFIG_BSD_PROCESS_ACCT is not set
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> # CONFIG_TASK_XACCT is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> # CONFIG_TASKS_RCU is not set
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_TREE_RCU_TRACE=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> CONFIG_RCU_NOCB_CPU_NONE=3Dy
> # CONFIG_RCU_NOCB_CPU_ZERO is not set
> # CONFIG_RCU_NOCB_CPU_ALL is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_BLK_CGROUP=3Dy
> # CONFIG_DEBUG_BLK_CGROUP is not set
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> CONFIG_CGROUP_PIDS=3Dy
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> CONFIG_CGROUP_DEVICE=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_CGROUP_PERF=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=3Dy
> # CONFIG_NET_NS is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
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
> CONFIG_INITRAMFS_COMPRESSION=3D".gz"
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
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
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_KALLSYMS=3Dy
> # CONFIG_KALLSYMS_ALL is not set
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> # CONFIG_USERFAULTFD is not set
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> CONFIG_PC104=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> CONFIG_VM_EVENT_COUNTERS=3Dy
> # CONFIG_COMPAT_BRK is not set
> CONFIG_SLAB=3Dy
> # CONFIG_SLUB is not set
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> CONFIG_PROFILING=3Dy
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> # CONFIG_OPROFILE is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_UPROBES is not set
> # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_CLK=3Dy
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
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGINS=3Dy
> CONFIG_GCC_PLUGIN_SANCOV=3Dy
> # CONFIG_GCC_PLUGIN_LATENT_ENTROPY is not set
> CONFIG_GCC_PLUGIN_STRUCTLEAK=3Dy
> # CONFIG_GCC_PLUGIN_STRUCTLEAK_VERBOSE is not set
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
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
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
> # CONFIG_BLK_DEV_ZONED is not set
> # CONFIG_BLK_DEV_THROTTLING is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> # CONFIG_BLK_WBT is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> =

> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_AMIGA_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> CONFIG_CFQ_GROUP_IOSCHED=3Dy
> CONFIG_DEFAULT_DEADLINE=3Dy
> # CONFIG_DEFAULT_CFQ is not set
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"deadline"
> # CONFIG_MQ_IOSCHED_DEADLINE is not set
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> # CONFIG_IOSCHED_BFQ is not set
> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
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
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_GOLDFISH=3Dy
> # CONFIG_INTEL_RDT_A is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> CONFIG_X86_VSMP=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_QUEUED_LOCK_STAT=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_PV=3Dy
> CONFIG_XEN_PV_SMP=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_PVHVM_SMP=3Dy
> CONFIG_XEN_512GB=3Dy
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> CONFIG_XEN_PVH=3Dy
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> CONFIG_MPSC=3Dy
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_GENERIC_CPU is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D12
> CONFIG_X86_L1_CACHE_SHIFT=3D7
> CONFIG_X86_P6_NOP=3Dy
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
> CONFIG_GART_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU=3Dy
> CONFIG_CALGARY_IOMMU_ENABLED_BY_DEFAULT=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> # CONFIG_MAXSMP is not set
> CONFIG_NR_CPUS=3D64
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> # CONFIG_X86_MCE_AMD is not set
> CONFIG_X86_MCE_THRESHOLD=3Dy
> # CONFIG_X86_MCE_INJECT is not set
> CONFIG_X86_THERMAL_VECTOR=3Dy
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dy
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dy
> CONFIG_PERF_EVENTS_AMD_POWER=3Dy
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> # CONFIG_I8K is not set
> # CONFIG_MICROCODE is not set
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_NUMA is not set
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
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
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> # CONFIG_COMPACTION is not set
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> # CONFIG_HWPOISON_INJECT is not set
> # CONFIG_TRANSPARENT_HUGEPAGE is not set
> # CONFIG_CLEANCACHE is not set
> CONFIG_CMA=3Dy
> # CONFIG_CMA_DEBUG is not set
> CONFIG_CMA_DEBUGFS=3Dy
> CONFIG_CMA_AREAS=3D7
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> # CONFIG_ZSMALLOC is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_MPX is not set
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> # CONFIG_EFI_MIXED is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_KEXEC_VERIFY_SIG=3Dy
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_RANDOMIZE_MEMORY is not set
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_LEGACY_VSYSCALL_NATIVE is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_PM_GENERIC_DOMAINS=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_PM_GENERIC_DOMAINS_SLEEP=3Dy
> CONFIG_PM_GENERIC_DOMAINS_OF=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> CONFIG_ACPI_DEBUGGER=3Dy
> # CONFIG_ACPI_DEBUGGER_USER is not set
> CONFIG_ACPI_PROCFS_POWER=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dy
> # CONFIG_ACPI_AC is not set
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> # CONFIG_ACPI_THERMAL is not set
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_TABLE_UPGRADE is not set
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_ACPI_NFIT=3Dy
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> # CONFIG_ACPI_APEI_GHES is not set
> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dy
> # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> CONFIG_DPTF_POWER=3Dy
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_EXTLOG=3Dy
> CONFIG_PMIC_OPREGION=3Dy
> # CONFIG_CRC_PMIC_OPREGION is not set
> CONFIG_XPOWER_PMIC_OPREGION=3Dy
> CONFIG_ACPI_CONFIGFS=3Dy
> # CONFIG_SFI is not set
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
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> # CONFIG_CPUFREQ_DT is not set
> CONFIG_X86_INTEL_PSTATE=3Dy
> CONFIG_X86_PCC_CPUFREQ=3Dy
> # CONFIG_X86_ACPI_CPUFREQ is not set
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
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
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> # CONFIG_INTEL_IDLE is not set
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> # CONFIG_PCIEAER is not set
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEBUG=3Dy
> # CONFIG_PCIEASPM_DEFAULT is not set
> CONFIG_PCIEASPM_POWERSAVE=3Dy
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> # CONFIG_PCIE_DPC is not set
> CONFIG_PCIE_PTM=3Dy
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_HT_IRQ=3Dy
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> # CONFIG_HOTPLUG_PCI_ACPI_IBM is not set
> CONFIG_HOTPLUG_PCI_CPCI=3Dy
> CONFIG_HOTPLUG_PCI_CPCI_ZT5550=3Dy
> # CONFIG_HOTPLUG_PCI_CPCI_GENERIC is not set
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
> # CONFIG_PCI_ENDPOINT_CONFIGFS is not set
> CONFIG_PCI_EPF_TEST=3Dy
> =

> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> CONFIG_PCMCIA_LOAD_CIS=3Dy
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> CONFIG_YENTA_O2=3Dy
> CONFIG_YENTA_RICOH=3Dy
> CONFIG_YENTA_TI=3Dy
> CONFIG_YENTA_ENE_TUNE=3Dy
> CONFIG_YENTA_TOSHIBA=3Dy
> CONFIG_PD6729=3Dy
> # CONFIG_I82092 is not set
> CONFIG_PCCARD_NONSTATIC=3Dy
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_TSI721=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS=3Dy
> # CONFIG_RAPIDIO_DMA_ENGINE is not set
> CONFIG_RAPIDIO_DEBUG=3Dy
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> CONFIG_RAPIDIO_CHMAN=3Dy
> CONFIG_RAPIDIO_MPORT_CDEV=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dy
> # CONFIG_RAPIDIO_CPS_XX is not set
> # CONFIG_RAPIDIO_TSI568 is not set
> CONFIG_RAPIDIO_CPS_GEN2=3Dy
> # CONFIG_RAPIDIO_RXS_GEN3 is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_X32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_KEYS_COMPAT=3Dy
> CONFIG_X86_DEV_DMA_OPS=3Dy
> CONFIG_NET=3Dy
> =

> #
> # Networking options
> #
> # CONFIG_PACKET is not set
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_DIAG=3Dy
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_ALGO=3Dy
> # CONFIG_XFRM_SUB_POLICY is not set
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_NET_KEY=3Dy
> CONFIG_NET_KEY_MIGRATE=3Dy
> # CONFIG_INET is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> # CONFIG_NETWORK_PHY_TIMESTAMPING is not set
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_DEBUG=3Dy
> # CONFIG_NETFILTER_ADVANCED is not set
> CONFIG_ATM=3Dy
> CONFIG_ATM_LANE=3Dy
> CONFIG_STP=3Dy
> CONFIG_GARP=3Dy
> CONFIG_BRIDGE=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> CONFIG_VLAN_8021Q=3Dy
> CONFIG_VLAN_8021Q_GVRP=3Dy
> # CONFIG_VLAN_8021Q_MVRP is not set
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dy
> # CONFIG_LLC2 is not set
> CONFIG_IPX=3Dy
> # CONFIG_IPX_INTERN is not set
> CONFIG_ATALK=3Dy
> CONFIG_DEV_APPLETALK=3Dy
> # CONFIG_IPDDP is not set
> CONFIG_X25=3Dy
> CONFIG_LAPB=3Dy
> CONFIG_PHONET=3Dy
> CONFIG_IEEE802154=3Dy
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> # CONFIG_IEEE802154_SOCKET is not set
> CONFIG_MAC802154=3Dy
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dy
> # CONFIG_NET_SCH_HTB is not set
> CONFIG_NET_SCH_HFSC=3Dy
> # CONFIG_NET_SCH_ATM is not set
> CONFIG_NET_SCH_PRIO=3Dy
> # CONFIG_NET_SCH_MULTIQ is not set
> CONFIG_NET_SCH_RED=3Dy
> CONFIG_NET_SCH_SFB=3Dy
> CONFIG_NET_SCH_SFQ=3Dy
> CONFIG_NET_SCH_TEQL=3Dy
> CONFIG_NET_SCH_TBF=3Dy
> CONFIG_NET_SCH_GRED=3Dy
> # CONFIG_NET_SCH_DSMARK is not set
> CONFIG_NET_SCH_NETEM=3Dy
> # CONFIG_NET_SCH_DRR is not set
> CONFIG_NET_SCH_MQPRIO=3Dy
> CONFIG_NET_SCH_CHOKE=3Dy
> CONFIG_NET_SCH_QFQ=3Dy
> CONFIG_NET_SCH_CODEL=3Dy
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> CONFIG_NET_SCH_FQ=3Dy
> CONFIG_NET_SCH_HHF=3Dy
> # CONFIG_NET_SCH_PIE is not set
> # CONFIG_NET_SCH_INGRESS is not set
> # CONFIG_NET_SCH_PLUG is not set
> # CONFIG_NET_SCH_DEFAULT is not set
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dy
> # CONFIG_NET_CLS_TCINDEX is not set
> # CONFIG_NET_CLS_FW is not set
> CONFIG_NET_CLS_U32=3Dy
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dy
> CONFIG_NET_CLS_RSVP6=3Dy
> CONFIG_NET_CLS_FLOW=3Dy
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dy
> # CONFIG_NET_CLS_FLOWER is not set
> CONFIG_NET_CLS_MATCHALL=3Dy
> # CONFIG_NET_EMATCH is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dy
> # CONFIG_NET_ACT_GACT is not set
> CONFIG_NET_ACT_MIRRED=3Dy
> CONFIG_NET_ACT_SAMPLE=3Dy
> CONFIG_NET_ACT_NAT=3Dy
> # CONFIG_NET_ACT_PEDIT is not set
> # CONFIG_NET_ACT_SIMP is not set
> # CONFIG_NET_ACT_SKBEDIT is not set
> CONFIG_NET_ACT_VLAN=3Dy
> CONFIG_NET_ACT_BPF=3Dy
> # CONFIG_NET_ACT_SKBMOD is not set
> CONFIG_NET_ACT_IFE=3Dy
> CONFIG_NET_ACT_TUNNEL_KEY=3Dy
> CONFIG_NET_IFE_SKBMARK=3Dy
> CONFIG_NET_IFE_SKBPRIO=3Dy
> # CONFIG_NET_IFE_SKBTCINDEX is not set
> # CONFIG_NET_CLS_IND is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dy
> # CONFIG_BATMAN_ADV is not set
> CONFIG_VSOCKETS=3Dy
> CONFIG_VMWARE_VMCI_VSOCKETS=3Dy
> CONFIG_VIRTIO_VSOCKETS=3Dy
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dy
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_XPS=3Dy
> # CONFIG_CGROUP_NET_PRIO is not set
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> CONFIG_HAMRADIO=3Dy
> =

> #
> # Packet Radio protocols
> #
> CONFIG_AX25=3Dy
> # CONFIG_AX25_DAMA_SLAVE is not set
> CONFIG_NETROM=3Dy
> CONFIG_ROSE=3Dy
> =

> #
> # AX.25 network device drivers
> #
> # CONFIG_MKISS is not set
> # CONFIG_6PACK is not set
> CONFIG_BPQETHER=3Dy
> CONFIG_BAYCOM_SER_FDX=3Dy
> # CONFIG_BAYCOM_SER_HDX is not set
> CONFIG_BAYCOM_PAR=3Dy
> CONFIG_YAM=3Dy
> CONFIG_CAN=3Dy
> # CONFIG_CAN_RAW is not set
> CONFIG_CAN_BCM=3Dy
> CONFIG_CAN_GW=3Dy
> =

> #
> # CAN Device Drivers
> #
> # CONFIG_CAN_VCAN is not set
> CONFIG_CAN_VXCAN=3Dy
> CONFIG_CAN_SLCAN=3Dy
> CONFIG_CAN_DEV=3Dy
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_LEDS is not set
> CONFIG_CAN_GRCAN=3Dy
> CONFIG_CAN_JANZ_ICAN3=3Dy
> CONFIG_CAN_C_CAN=3Dy
> CONFIG_CAN_C_CAN_PLATFORM=3Dy
> # CONFIG_CAN_C_CAN_PCI is not set
> # CONFIG_CAN_CC770 is not set
> # CONFIG_CAN_IFI_CANFD is not set
> CONFIG_CAN_M_CAN=3Dy
> # CONFIG_CAN_PEAK_PCIEFD is not set
> CONFIG_CAN_SJA1000=3Dy
> CONFIG_CAN_SJA1000_ISA=3Dy
> # CONFIG_CAN_SJA1000_PLATFORM is not set
> CONFIG_CAN_EMS_PCMCIA=3Dy
> # CONFIG_CAN_EMS_PCI is not set
> CONFIG_CAN_PEAK_PCMCIA=3Dy
> CONFIG_CAN_PEAK_PCI=3Dy
> # CONFIG_CAN_PEAK_PCIEC is not set
> # CONFIG_CAN_KVASER_PCI is not set
> # CONFIG_CAN_PLX_PCI is not set
> CONFIG_CAN_SOFTING=3Dy
> CONFIG_CAN_SOFTING_CS=3Dy
> =

> #
> # CAN SPI interfaces
> #
> CONFIG_CAN_HI311X=3Dy
> CONFIG_CAN_MCP251X=3Dy
> # CONFIG_CAN_DEBUG_DEVICES is not set
> CONFIG_IRDA=3Dy
> =

> #
> # IrDA protocols
> #
> CONFIG_IRLAN=3Dy
> # CONFIG_IRNET is not set
> CONFIG_IRCOMM=3Dy
> # CONFIG_IRDA_ULTRA is not set
> =

> #
> # IrDA options
> #
> # CONFIG_IRDA_CACHE_LAST_LSAP is not set
> # CONFIG_IRDA_FAST_RR is not set
> # CONFIG_IRDA_DEBUG is not set
> =

> #
> # Infrared-port device drivers
> #
> =

> #
> # SIR device drivers
> #
> CONFIG_IRTTY_SIR=3Dy
> =

> #
> # Dongle support
> #
> CONFIG_DONGLE=3Dy
> CONFIG_ESI_DONGLE=3Dy
> CONFIG_ACTISYS_DONGLE=3Dy
> CONFIG_TEKRAM_DONGLE=3Dy
> CONFIG_TOIM3232_DONGLE=3Dy
> CONFIG_LITELINK_DONGLE=3Dy
> CONFIG_MA600_DONGLE=3Dy
> CONFIG_GIRBIL_DONGLE=3Dy
> CONFIG_MCP2120_DONGLE=3Dy
> # CONFIG_OLD_BELKIN_DONGLE is not set
> CONFIG_ACT200L_DONGLE=3Dy
> =

> #
> # FIR device drivers
> #
> CONFIG_NSC_FIR=3Dy
> # CONFIG_WINBOND_FIR is not set
> CONFIG_SMC_IRCC_FIR=3Dy
> CONFIG_ALI_FIR=3Dy
> CONFIG_VLSI_FIR=3Dy
> CONFIG_VIA_FIR=3Dy
> CONFIG_BT=3Dy
> CONFIG_BT_BREDR=3Dy
> # CONFIG_BT_RFCOMM is not set
> CONFIG_BT_BNEP=3Dy
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_CMTP=3Dy
> CONFIG_BT_HIDP=3Dy
> CONFIG_BT_HS=3Dy
> # CONFIG_BT_LE is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_SELFTEST is not set
> # CONFIG_BT_DEBUGFS is not set
> =

> #
> # Bluetooth device drivers
> #
> CONFIG_BT_INTEL=3Dy
> CONFIG_BT_QCA=3Dy
> CONFIG_BT_HCIBTSDIO=3Dy
> CONFIG_BT_HCIUART=3Dy
> CONFIG_BT_HCIUART_SERDEV=3Dy
> CONFIG_BT_HCIUART_H4=3Dy
> # CONFIG_BT_HCIUART_NOKIA is not set
> CONFIG_BT_HCIUART_BCSP=3Dy
> # CONFIG_BT_HCIUART_ATH3K is not set
> CONFIG_BT_HCIUART_LL=3Dy
> CONFIG_BT_HCIUART_3WIRE=3Dy
> CONFIG_BT_HCIUART_INTEL=3Dy
> # CONFIG_BT_HCIUART_BCM is not set
> CONFIG_BT_HCIUART_QCA=3Dy
> CONFIG_BT_HCIUART_AG6XX=3Dy
> # CONFIG_BT_HCIUART_MRVL is not set
> # CONFIG_BT_HCIDTL1 is not set
> # CONFIG_BT_HCIBT3C is not set
> CONFIG_BT_HCIBLUECARD=3Dy
> CONFIG_BT_HCIBTUART=3Dy
> CONFIG_BT_HCIVHCI=3Dy
> CONFIG_BT_MRVL=3Dy
> CONFIG_BT_MRVL_SDIO=3Dy
> # CONFIG_STREAM_PARSER is not set
> CONFIG_WIRELESS=3Dy
> CONFIG_CFG80211=3Dy
> CONFIG_NL80211_TESTMODE=3Dy
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> CONFIG_CFG80211_DEBUGFS=3Dy
> # CONFIG_CFG80211_INTERNAL_REGDB is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> # CONFIG_CFG80211_WEXT is not set
> # CONFIG_LIB80211 is not set
> # CONFIG_MAC80211 is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_WIMAX=3Dy
> CONFIG_WIMAX_DEBUG_LEVEL=3D8
> # CONFIG_RFKILL is not set
> CONFIG_NET_9P=3Dy
> # CONFIG_NET_9P_VIRTIO is not set
> # CONFIG_NET_9P_XEN is not set
> # CONFIG_NET_9P_DEBUG is not set
> CONFIG_CAIF=3Dy
> # CONFIG_CAIF_DEBUG is not set
> CONFIG_CAIF_NETDEV=3Dy
> # CONFIG_CAIF_USB is not set
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dy
> CONFIG_NET_IFE=3Dy
> # CONFIG_LWTUNNEL is not set
> # CONFIG_DST_CACHE is not set
> CONFIG_GRO_CELLS=3Dy
> CONFIG_NET_DEVLINK=3Dy
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
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_WANT_DEV_COREDUMP=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> CONFIG_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> CONFIG_SYS_HYPERVISOR=3Dy
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_DMA_FENCE_TRACE=3Dy
> # CONFIG_DMA_CMA is not set
> =

> #
> # Bus devices
> #
> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_OF_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_FTL=3Dy
> # CONFIG_NFTL is not set
> CONFIG_INFTL=3Dy
> # CONFIG_RFD_FTL is not set
> CONFIG_SSFDC=3Dy
> # CONFIG_SM_FTL is not set
> CONFIG_MTD_OOPS=3Dy
> CONFIG_MTD_PARTITIONED_MASTER=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
> # CONFIG_MTD_JEDECPROBE is not set
> CONFIG_MTD_GEN_PROBE=3Dy
> CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> # CONFIG_MTD_CFI_NOSWAP is not set
> # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_LE_BYTE_SWAP=3Dy
> CONFIG_MTD_CFI_GEOMETRY=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
> # CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_8=3Dy
> # CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_32=3Dy
> # CONFIG_MTD_CFI_I1 is not set
> # CONFIG_MTD_CFI_I2 is not set
> # CONFIG_MTD_CFI_I4 is not set
> CONFIG_MTD_CFI_I8=3Dy
> # CONFIG_MTD_OTP is not set
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> CONFIG_MTD_RAM=3Dy
> # CONFIG_MTD_ROM is not set
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
> CONFIG_MTD_PHYSMAP_OF=3Dy
> # CONFIG_MTD_PHYSMAP_OF_VERSATILE is not set
> # CONFIG_MTD_PHYSMAP_OF_GEMINI is not set
> CONFIG_MTD_SBC_GXX=3Dy
> CONFIG_MTD_PCI=3Dy
> CONFIG_MTD_PCMCIA=3Dy
> CONFIG_MTD_PCMCIA_ANONYMOUS=3Dy
> # CONFIG_MTD_GPIO_ADDR is not set
> CONFIG_MTD_INTEL_VR_NOR=3Dy
> CONFIG_MTD_PLATRAM=3Dy
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_DATAFLASH is not set
> # CONFIG_MTD_SST25L is not set
> # CONFIG_MTD_SLRAM is not set
> CONFIG_MTD_PHRAM=3Dy
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTD_BLOCK2MTD=3Dy
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> # CONFIG_MTD_NAND is not set
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # CONFIG_MTD_SPI_NOR is not set
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> CONFIG_MTD_UBI_GLUEBI=3Dy
> # CONFIG_MTD_UBI_BLOCK is not set
> CONFIG_OF=3Dy
> # CONFIG_OF_UNITTEST is not set
> CONFIG_OF_ADDRESS=3Dy
> CONFIG_OF_ADDRESS_PCI=3Dy
> CONFIG_OF_IRQ=3Dy
> CONFIG_OF_NET=3Dy
> CONFIG_OF_MDIO=3Dy
> CONFIG_OF_PCI=3Dy
> CONFIG_OF_PCI_IRQ=3Dy
> # CONFIG_OF_OVERLAY is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> # CONFIG_PARPORT_PC is not set
> # CONFIG_PARPORT_GSC is not set
> CONFIG_PARPORT_AX88796=3Dy
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PARPORT_NOT_PC=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dy
> CONFIG_BLK_DEV_FD=3Dy
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> CONFIG_BLK_CPQ_CISS_DA=3Dy
> # CONFIG_CISS_SCSI_TAPE is not set
> CONFIG_BLK_DEV_DAC960=3Dy
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> CONFIG_BLK_DEV_SKD=3Dy
> CONFIG_BLK_DEV_SX8=3Dy
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> CONFIG_CDROM_PKTCDVD=3Dy
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> CONFIG_CDROM_PKTCDVD_WCACHE=3Dy
> CONFIG_ATA_OVER_ETH=3Dy
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> CONFIG_VIRTIO_BLK=3Dy
> CONFIG_VIRTIO_BLK_SCSI=3Dy
> CONFIG_BLK_DEV_RSXX=3Dy
> CONFIG_NVME_CORE=3Dy
> CONFIG_BLK_DEV_NVME=3Dy
> # CONFIG_BLK_DEV_NVME_SCSI is not set
> CONFIG_NVME_FABRICS=3Dy
> CONFIG_NVME_FC=3Dy
> # CONFIG_NVME_TARGET is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> CONFIG_PHANTOM=3Dy
> # CONFIG_SGI_IOC4 is not set
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> # CONFIG_ICS932S401 is not set
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> # CONFIG_ISL29003 is not set
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> # CONFIG_DS1682 is not set
> CONFIG_TI_DAC7512=3Dy
> CONFIG_VMWARE_BALLOON=3Dy
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> # CONFIG_SRAM is not set
> CONFIG_PCI_ENDPOINT_TEST=3Dy
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> CONFIG_EEPROM_MAX6875=3Dy
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> CONFIG_CB710_CORE=3Dy
> # CONFIG_CB710_DEBUG is not set
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
> CONFIG_INTEL_MEI=3Dy
> # CONFIG_INTEL_MEI_ME is not set
> CONFIG_INTEL_MEI_TXE=3Dy
> CONFIG_VMWARE_VMCI=3Dy
> =

> #
> # Intel MIC Bus Driver
> #
> CONFIG_INTEL_MIC_BUS=3Dy
> =

> #
> # SCIF Bus Driver
> #
> # CONFIG_SCIF_BUS is not set
> =

> #
> # VOP Bus Driver
> #
> CONFIG_VOP_BUS=3Dy
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
> # CONFIG_VOP is not set
> CONFIG_VHOST_RING=3Dy
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_AFU_DRIVER_OPS is not set
> CONFIG_HAVE_IDE=3Dy
> CONFIG_IDE=3Dy
> =

> #
> # Please see Documentation/ide/ide.txt for help/info on IDE drives
> #
> CONFIG_IDE_XFER_MODE=3Dy
> CONFIG_IDE_TIMINGS=3Dy
> CONFIG_IDE_ATAPI=3Dy
> CONFIG_BLK_DEV_IDE_SATA=3Dy
> CONFIG_IDE_GD=3Dy
> # CONFIG_IDE_GD_ATA is not set
> # CONFIG_IDE_GD_ATAPI is not set
> CONFIG_BLK_DEV_IDECS=3Dy
> CONFIG_BLK_DEV_DELKIN=3Dy
> CONFIG_BLK_DEV_IDECD=3Dy
> CONFIG_BLK_DEV_IDECD_VERBOSE_ERRORS=3Dy
> # CONFIG_BLK_DEV_IDETAPE is not set
> # CONFIG_BLK_DEV_IDEACPI is not set
> # CONFIG_IDE_TASK_IOCTL is not set
> # CONFIG_IDE_PROC_FS is not set
> =

> #
> # IDE chipset support/bugfixes
> #
> # CONFIG_IDE_GENERIC is not set
> CONFIG_BLK_DEV_PLATFORM=3Dy
> CONFIG_BLK_DEV_CMD640=3Dy
> # CONFIG_BLK_DEV_CMD640_ENHANCED is not set
> # CONFIG_BLK_DEV_IDEPNP is not set
> CONFIG_BLK_DEV_IDEDMA_SFF=3Dy
> =

> #
> # PCI IDE chipsets support
> #
> CONFIG_BLK_DEV_IDEPCI=3Dy
> # CONFIG_IDEPCI_PCIBUS_ORDER is not set
> # CONFIG_BLK_DEV_OFFBOARD is not set
> CONFIG_BLK_DEV_GENERIC=3Dy
> CONFIG_BLK_DEV_OPTI621=3Dy
> CONFIG_BLK_DEV_RZ1000=3Dy
> CONFIG_BLK_DEV_IDEDMA_PCI=3Dy
> # CONFIG_BLK_DEV_AEC62XX is not set
> CONFIG_BLK_DEV_ALI15X3=3Dy
> # CONFIG_BLK_DEV_AMD74XX is not set
> # CONFIG_BLK_DEV_ATIIXP is not set
> CONFIG_BLK_DEV_CMD64X=3Dy
> CONFIG_BLK_DEV_TRIFLEX=3Dy
> CONFIG_BLK_DEV_HPT366=3Dy
> CONFIG_BLK_DEV_JMICRON=3Dy
> # CONFIG_BLK_DEV_PIIX is not set
> CONFIG_BLK_DEV_IT8172=3Dy
> CONFIG_BLK_DEV_IT8213=3Dy
> CONFIG_BLK_DEV_IT821X=3Dy
> CONFIG_BLK_DEV_NS87415=3Dy
> CONFIG_BLK_DEV_PDC202XX_OLD=3Dy
> CONFIG_BLK_DEV_PDC202XX_NEW=3Dy
> CONFIG_BLK_DEV_SVWKS=3Dy
> CONFIG_BLK_DEV_SIIMAGE=3Dy
> CONFIG_BLK_DEV_SIS5513=3Dy
> CONFIG_BLK_DEV_SLC90E66=3Dy
> # CONFIG_BLK_DEV_TRM290 is not set
> CONFIG_BLK_DEV_VIA82CXXX=3Dy
> CONFIG_BLK_DEV_TC86C001=3Dy
> CONFIG_BLK_DEV_IDEDMA=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> # CONFIG_SCSI_NETLINK is not set
> CONFIG_SCSI_MQ_DEFAULT=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dy
> CONFIG_CHR_DEV_ST=3Dy
> CONFIG_CHR_DEV_OSST=3Dy
> # CONFIG_BLK_DEV_SR is not set
> CONFIG_CHR_DEV_SG=3Dy
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dy
> # CONFIG_SCSI_FC_ATTRS is not set
> CONFIG_SCSI_ISCSI_ATTRS=3Dy
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> # CONFIG_SCSI_SAS_ATA is not set
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=3Dy
> CONFIG_SCSI_LOWLEVEL=3Dy
> CONFIG_ISCSI_BOOT_SYSFS=3Dy
> CONFIG_SCSI_BNX2_ISCSI=3Dy
> CONFIG_BE2ISCSI=3Dy
> CONFIG_BLK_DEV_3W_XXXX_RAID=3Dy
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> CONFIG_SCSI_AACRAID=3Dy
> # CONFIG_SCSI_AIC7XXX is not set
> CONFIG_SCSI_AIC79XX=3Dy
> CONFIG_AIC79XX_CMDS_PER_DEVICE=3D32
> CONFIG_AIC79XX_RESET_DELAY_MS=3D5000
> # CONFIG_AIC79XX_DEBUG_ENABLE is not set
> CONFIG_AIC79XX_DEBUG_MASK=3D0
> # CONFIG_AIC79XX_REG_PRETTY_PRINT is not set
> # CONFIG_SCSI_AIC94XX is not set
> CONFIG_SCSI_MVSAS=3Dy
> # CONFIG_SCSI_MVSAS_DEBUG is not set
> # CONFIG_SCSI_MVSAS_TASKLET is not set
> CONFIG_SCSI_MVUMI=3Dy
> CONFIG_SCSI_DPT_I2O=3Dy
> CONFIG_SCSI_ADVANSYS=3Dy
> CONFIG_SCSI_ARCMSR=3Dy
> CONFIG_SCSI_ESAS2R=3Dy
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT3SAS=3Dy
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT2SAS=3Dy
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> CONFIG_SCSI_HPTIOP=3Dy
> CONFIG_SCSI_BUSLOGIC=3Dy
> # CONFIG_SCSI_FLASHPOINT is not set
> CONFIG_VMWARE_PVSCSI=3Dy
> CONFIG_XEN_SCSI_FRONTEND=3Dy
> CONFIG_HYPERV_STORAGE=3Dy
> CONFIG_SCSI_SNIC=3Dy
> CONFIG_SCSI_SNIC_DEBUG_FS=3Dy
> CONFIG_SCSI_DMX3191D=3Dy
> CONFIG_SCSI_EATA=3Dy
> CONFIG_SCSI_EATA_TAGGED_QUEUE=3Dy
> CONFIG_SCSI_EATA_LINKED_COMMANDS=3Dy
> CONFIG_SCSI_EATA_MAX_TAGS=3D16
> CONFIG_SCSI_FUTURE_DOMAIN=3Dy
> # CONFIG_SCSI_GDTH is not set
> # CONFIG_SCSI_ISCI is not set
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> CONFIG_SCSI_STEX=3Dy
> CONFIG_SCSI_SYM53C8XX_2=3Dy
> CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=3D1
> CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=3D16
> CONFIG_SCSI_SYM53C8XX_MAX_TAGS=3D64
> CONFIG_SCSI_SYM53C8XX_MMIO=3Dy
> # CONFIG_SCSI_IPR is not set
> CONFIG_SCSI_QLOGIC_1280=3Dy
> CONFIG_SCSI_QLA_ISCSI=3Dy
> # CONFIG_QEDI is not set
> CONFIG_SCSI_DC395x=3Dy
> # CONFIG_SCSI_AM53C974 is not set
> CONFIG_SCSI_WD719X=3Dy
> # CONFIG_SCSI_DEBUG is not set
> # CONFIG_SCSI_PMCRAID is not set
> CONFIG_SCSI_PM8001=3Dy
> CONFIG_SCSI_VIRTIO=3Dy
> CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> # CONFIG_SCSI_DH is not set
> # CONFIG_SCSI_OSD_INITIATOR is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> # CONFIG_ATA_ACPI is not set
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dy
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> CONFIG_AHCI_CEVA=3Dy
> # CONFIG_AHCI_QORIQ is not set
> CONFIG_SATA_INIC162X=3Dy
> CONFIG_SATA_ACARD_AHCI=3Dy
> CONFIG_SATA_SIL24=3Dy
> # CONFIG_ATA_SFF is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_SBP2=3Dy
> CONFIG_FIREWIRE_NOSY=3Dy
> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> # CONFIG_NET_CORE is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> CONFIG_ATM_DUMMY=3Dy
> CONFIG_ATM_LANAI=3Dy
> CONFIG_ATM_ENI=3Dy
> # CONFIG_ATM_ENI_DEBUG is not set
> CONFIG_ATM_ENI_TUNE_BURST=3Dy
> # CONFIG_ATM_ENI_BURST_TX_16W is not set
> CONFIG_ATM_ENI_BURST_TX_8W=3Dy
> # CONFIG_ATM_ENI_BURST_TX_4W is not set
> # CONFIG_ATM_ENI_BURST_TX_2W is not set
> # CONFIG_ATM_ENI_BURST_RX_16W is not set
> CONFIG_ATM_ENI_BURST_RX_8W=3Dy
> # CONFIG_ATM_ENI_BURST_RX_4W is not set
> CONFIG_ATM_ENI_BURST_RX_2W=3Dy
> CONFIG_ATM_FIRESTREAM=3Dy
> CONFIG_ATM_ZATM=3Dy
> # CONFIG_ATM_ZATM_DEBUG is not set
> CONFIG_ATM_NICSTAR=3Dy
> # CONFIG_ATM_NICSTAR_USE_SUNI is not set
> CONFIG_ATM_NICSTAR_USE_IDT77105=3Dy
> CONFIG_ATM_IDT77252=3Dy
> # CONFIG_ATM_IDT77252_DEBUG is not set
> # CONFIG_ATM_IDT77252_RCV_ALL is not set
> CONFIG_ATM_IDT77252_USE_SUNI=3Dy
> CONFIG_ATM_AMBASSADOR=3Dy
> # CONFIG_ATM_AMBASSADOR_DEBUG is not set
> # CONFIG_ATM_HORIZON is not set
> CONFIG_ATM_IA=3Dy
> CONFIG_ATM_IA_DEBUG=3Dy
> CONFIG_ATM_FORE200E=3Dy
> CONFIG_ATM_FORE200E_USE_TASKLET=3Dy
> CONFIG_ATM_FORE200E_TX_RETRY=3D16
> CONFIG_ATM_FORE200E_DEBUG=3D0
> CONFIG_ATM_HE=3Dy
> # CONFIG_ATM_HE_USE_SUNI is not set
> CONFIG_ATM_SOLOS=3Dy
> =

> #
> # CAIF transport drivers
> #
> # CONFIG_CAIF_TTY is not set
> CONFIG_CAIF_SPI_SLAVE=3Dy
> CONFIG_CAIF_SPI_SYNC=3Dy
> # CONFIG_CAIF_HSI is not set
> CONFIG_CAIF_VIRTIO=3Dy
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> CONFIG_PCMCIA_3C574=3Dy
> CONFIG_PCMCIA_3C589=3Dy
> CONFIG_VORTEX=3Dy
> CONFIG_TYPHOON=3Dy
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> CONFIG_ET131X=3Dy
> # CONFIG_NET_VENDOR_ALACRITECH is not set
> # CONFIG_NET_VENDOR_ALTEON is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_NET_VENDOR_AMD is not set
> # CONFIG_NET_VENDOR_AQUANTIA is not set
> # CONFIG_NET_VENDOR_ARC is not set
> # CONFIG_NET_VENDOR_ATHEROS is not set
> CONFIG_NET_VENDOR_AURORA=3Dy
> CONFIG_AURORA_NB8800=3Dy
> # CONFIG_NET_CADENCE is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> CONFIG_BCMGENET=3Dy
> CONFIG_BNX2=3Dy
> CONFIG_CNIC=3Dy
> CONFIG_TIGON3=3Dy
> # CONFIG_TIGON3_HWMON is not set
> # CONFIG_BNX2X is not set
> CONFIG_SYSTEMPORT=3Dy
> # CONFIG_BNXT is not set
> # CONFIG_NET_VENDOR_BROCADE is not set
> # CONFIG_NET_VENDOR_CAVIUM is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> CONFIG_CHELSIO_T1=3Dy
> # CONFIG_CHELSIO_T1_1G is not set
> CONFIG_CHELSIO_T4=3Dy
> CONFIG_CHELSIO_T4_DCB=3Dy
> CONFIG_CHELSIO_T4VF=3Dy
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_CX_ECAT=3Dy
> CONFIG_DNET=3Dy
> # CONFIG_NET_VENDOR_DEC is not set
> # CONFIG_NET_VENDOR_DLINK is not set
> # CONFIG_NET_VENDOR_EMULEX is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_EZCHIP_NPS_MANAGEMENT_ENET=3Dy
> # CONFIG_NET_VENDOR_EXAR is not set
> # CONFIG_NET_VENDOR_FUJITSU is not set
> CONFIG_NET_VENDOR_HP=3Dy
> CONFIG_HP100=3Dy
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
> # CONFIG_I40E is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> CONFIG_MVMDIO=3Dy
> CONFIG_SKGE=3Dy
> CONFIG_SKGE_DEBUG=3Dy
> CONFIG_SKGE_GENESIS=3Dy
> CONFIG_SKY2=3Dy
> # CONFIG_SKY2_DEBUG is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX4_CORE is not set
> CONFIG_MLX5_CORE=3Dy
> # CONFIG_MLX5_CORE_EN is not set
> CONFIG_MLXSW_CORE=3Dy
> CONFIG_MLXSW_CORE_HWMON=3Dy
> CONFIG_MLXSW_CORE_THERMAL=3Dy
> CONFIG_MLXSW_PCI=3Dy
> # CONFIG_MLXSW_I2C is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> CONFIG_KS8842=3Dy
> CONFIG_KS8851=3Dy
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> # CONFIG_NET_VENDOR_MICROCHIP is not set
> CONFIG_FEALNX=3Dy
> # CONFIG_NET_VENDOR_NATSEMI is not set
> # CONFIG_NET_VENDOR_NETRONOME is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> CONFIG_FORCEDETH=3Dy
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_PACKET_ENGINE=3Dy
> CONFIG_HAMACHI=3Dy
> CONFIG_YELLOWFIN=3Dy
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> CONFIG_QLA3XXX=3Dy
> CONFIG_QLCNIC=3Dy
> # CONFIG_QLCNIC_SRIOV is not set
> # CONFIG_QLCNIC_DCB is not set
> # CONFIG_QLCNIC_HWMON is not set
> CONFIG_QLGE=3Dy
> CONFIG_NETXEN_NIC=3Dy
> CONFIG_QED=3Dy
> CONFIG_QED_SRIOV=3Dy
> CONFIG_QEDE=3Dy
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> CONFIG_QCA7000=3Dy
> # CONFIG_QCOM_EMAC is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> CONFIG_8139CP=3Dy
> CONFIG_8139TOO=3Dy
> CONFIG_8139TOO_PIO=3Dy
> CONFIG_8139TOO_TUNE_TWISTER=3Dy
> # CONFIG_8139TOO_8129 is not set
> # CONFIG_8139_OLD_RX_RESET is not set
> # CONFIG_R8169 is not set
> CONFIG_NET_VENDOR_RENESAS=3Dy
> # CONFIG_NET_VENDOR_RDC is not set
> CONFIG_NET_VENDOR_ROCKER=3Dy
> # CONFIG_NET_VENDOR_SAMSUNG is not set
> # CONFIG_NET_VENDOR_SEEQ is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> # CONFIG_NET_VENDOR_SIS is not set
> # CONFIG_NET_VENDOR_SOLARFLARE is not set
> # CONFIG_NET_VENDOR_SMSC is not set
> # CONFIG_NET_VENDOR_STMICRO is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> CONFIG_CASSINI=3Dy
> # CONFIG_NIU is not set
> # CONFIG_NET_VENDOR_TEHUTI is not set
> # CONFIG_NET_VENDOR_TI is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> CONFIG_VIA_RHINE=3Dy
> CONFIG_VIA_RHINE_MMIO=3Dy
> CONFIG_VIA_VELOCITY=3Dy
> CONFIG_NET_VENDOR_WIZNET=3Dy
> CONFIG_WIZNET_W5100=3Dy
> CONFIG_WIZNET_W5300=3Dy
> CONFIG_WIZNET_BUS_DIRECT=3Dy
> # CONFIG_WIZNET_BUS_INDIRECT is not set
> # CONFIG_WIZNET_BUS_ANY is not set
> # CONFIG_NET_VENDOR_XIRCOM is not set
> # CONFIG_NET_VENDOR_SYNOPSYS is not set
> CONFIG_FDDI=3Dy
> # CONFIG_DEFXX is not set
> # CONFIG_SKFP is not set
> CONFIG_NET_SB1000=3Dy
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BCM_UNIMAC=3Dy
> CONFIG_MDIO_BITBANG=3Dy
> CONFIG_MDIO_BUS_MUX=3Dy
> # CONFIG_MDIO_BUS_MUX_GPIO is not set
> CONFIG_MDIO_BUS_MUX_MMIOREG=3Dy
> CONFIG_MDIO_GPIO=3Dy
> CONFIG_MDIO_HISI_FEMAC=3Dy
> # CONFIG_MDIO_OCTEON is not set
> # CONFIG_MDIO_THUNDER is not set
> CONFIG_PHYLIB=3Dy
> CONFIG_SWPHY=3Dy
> CONFIG_LED_TRIGGER_PHY=3Dy
> =

> #
> # MII PHY device drivers
> #
> CONFIG_AMD_PHY=3Dy
> # CONFIG_AQUANTIA_PHY is not set
> # CONFIG_AT803X_PHY is not set
> CONFIG_BCM7XXX_PHY=3Dy
> # CONFIG_BCM87XX_PHY is not set
> CONFIG_BCM_NET_PHYLIB=3Dy
> CONFIG_BROADCOM_PHY=3Dy
> CONFIG_CICADA_PHY=3Dy
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> CONFIG_ICPLUS_PHY=3Dy
> CONFIG_INTEL_XWAY_PHY=3Dy
> CONFIG_LSI_ET1011C_PHY=3Dy
> CONFIG_LXT_PHY=3Dy
> CONFIG_MARVELL_PHY=3Dy
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> CONFIG_NATIONAL_PHY=3Dy
> CONFIG_QSEMI_PHY=3Dy
> CONFIG_REALTEK_PHY=3Dy
> CONFIG_SMSC_PHY=3Dy
> # CONFIG_STE10XP is not set
> CONFIG_TERANETICS_PHY=3Dy
> # CONFIG_VITESSE_PHY is not set
> CONFIG_XILINX_GMII2RGMII=3Dy
> CONFIG_MICREL_KS8995MA=3Dy
> # CONFIG_PLIP is not set
> CONFIG_PPP=3Dy
> # CONFIG_PPP_BSDCOMP is not set
> CONFIG_PPP_DEFLATE=3Dy
> CONFIG_PPP_FILTER=3Dy
> CONFIG_PPP_MPPE=3Dy
> CONFIG_PPP_MULTILINK=3Dy
> CONFIG_PPPOATM=3Dy
> CONFIG_PPPOE=3Dy
> # CONFIG_PPP_ASYNC is not set
> CONFIG_PPP_SYNC_TTY=3Dy
> CONFIG_SLIP=3Dy
> CONFIG_SLHC=3Dy
> CONFIG_SLIP_COMPRESSED=3Dy
> CONFIG_SLIP_SMART=3Dy
> CONFIG_SLIP_MODE_SLIP6=3Dy
> =

> #
> # Host-side USB support is needed for USB Network Adapter support
> #
> # CONFIG_WLAN is not set
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
> CONFIG_IEEE802154_FAKELB=3Dy
> CONFIG_IEEE802154_AT86RF230=3Dy
> CONFIG_IEEE802154_AT86RF230_DEBUGFS=3Dy
> CONFIG_IEEE802154_MRF24J40=3Dy
> CONFIG_IEEE802154_CC2520=3Dy
> CONFIG_IEEE802154_ADF7242=3Dy
> CONFIG_IEEE802154_CA8210=3Dy
> # CONFIG_IEEE802154_CA8210_DEBUGFS is not set
> # CONFIG_XEN_NETDEV_FRONTEND is not set
> CONFIG_FUJITSU_ES=3Dy
> CONFIG_HYPERV_NET=3Dy
> CONFIG_ISDN=3Dy
> CONFIG_ISDN_I4L=3Dy
> # CONFIG_ISDN_AUDIO is not set
> CONFIG_ISDN_X25=3Dy
> =

> #
> # ISDN feature submodules
> #
> CONFIG_ISDN_DIVERSION=3Dy
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
> CONFIG_HISAX_EURO=3Dy
> CONFIG_DE_AOC=3Dy
> # CONFIG_HISAX_NO_SENDCOMPLETE is not set
> # CONFIG_HISAX_NO_LLC is not set
> # CONFIG_HISAX_NO_KEYPAD is not set
> CONFIG_HISAX_1TR6=3Dy
> # CONFIG_HISAX_NI1 is not set
> CONFIG_HISAX_MAX_CARDS=3D8
> =

> #
> # HiSax supported cards
> #
> # CONFIG_HISAX_16_3 is not set
> # CONFIG_HISAX_TELESPCI is not set
> # CONFIG_HISAX_S0BOX is not set
> CONFIG_HISAX_FRITZPCI=3Dy
> CONFIG_HISAX_AVM_A1_PCMCIA=3Dy
> CONFIG_HISAX_ELSA=3Dy
> # CONFIG_HISAX_DIEHLDIVA is not set
> CONFIG_HISAX_SEDLBAUER=3Dy
> # CONFIG_HISAX_NETJET is not set
> CONFIG_HISAX_NETJET_U=3Dy
> CONFIG_HISAX_NICCY=3Dy
> CONFIG_HISAX_BKM_A4T=3Dy
> CONFIG_HISAX_SCT_QUADRO=3Dy
> # CONFIG_HISAX_GAZEL is not set
> # CONFIG_HISAX_HFC_PCI is not set
> CONFIG_HISAX_W6692=3Dy
> # CONFIG_HISAX_HFC_SX is not set
> CONFIG_HISAX_DEBUG=3Dy
> =

> #
> # HiSax PCMCIA card service modules
> #
> CONFIG_HISAX_SEDLBAUER_CS=3Dy
> # CONFIG_HISAX_ELSA_CS is not set
> CONFIG_HISAX_AVM_A1_CS=3Dy
> =

> #
> # HiSax sub driver modules
> #
> # CONFIG_HISAX_HFC4S8S is not set
> CONFIG_HISAX_FRITZ_PCIPNP=3Dy
> CONFIG_ISDN_CAPI=3Dy
> # CONFIG_CAPI_TRACE is not set
> CONFIG_ISDN_CAPI_CAPI20=3Dy
> # CONFIG_ISDN_CAPI_MIDDLEWARE is not set
> CONFIG_ISDN_CAPI_CAPIDRV=3Dy
> # CONFIG_ISDN_CAPI_CAPIDRV_VERBOSE is not set
> =

> #
> # CAPI hardware drivers
> #
> # CONFIG_CAPI_AVM is not set
> # CONFIG_CAPI_EICON is not set
> CONFIG_ISDN_DRV_GIGASET=3Dy
> # CONFIG_GIGASET_CAPI is not set
> CONFIG_GIGASET_I4L=3Dy
> # CONFIG_GIGASET_DUMMYLL is not set
> # CONFIG_GIGASET_M101 is not set
> CONFIG_GIGASET_DEBUG=3Dy
> CONFIG_MISDN=3Dy
> # CONFIG_MISDN_DSP is not set
> CONFIG_MISDN_L1OIP=3Dy
> =

> #
> # mISDN hardware drivers
> #
> # CONFIG_MISDN_HFCPCI is not set
> CONFIG_MISDN_HFCMULTI=3Dy
> # CONFIG_MISDN_AVMFRITZ is not set
> # CONFIG_MISDN_SPEEDFAX is not set
> CONFIG_MISDN_INFINEON=3Dy
> # CONFIG_MISDN_W6692 is not set
> # CONFIG_MISDN_NETJET is not set
> CONFIG_MISDN_IPAC=3Dy
> CONFIG_NVM=3Dy
> CONFIG_NVM_DEBUG=3Dy
> CONFIG_NVM_RRPC=3Dy
> # CONFIG_NVM_PBLK is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> # CONFIG_INPUT_MOUSEDEV is not set
> # CONFIG_INPUT_JOYDEV is not set
> # CONFIG_INPUT_EVDEV is not set
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADC is not set
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
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_STMPE is not set
> # CONFIG_KEYBOARD_OMAP4 is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> # CONFIG_KEYBOARD_CAP11XX is not set
> # CONFIG_KEYBOARD_BCM is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dy
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> # CONFIG_MOUSE_CYAPA is not set
> CONFIG_MOUSE_ELAN_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
> CONFIG_MOUSE_VSXXXAA=3Dy
> CONFIG_MOUSE_GPIO=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> CONFIG_INPUT_JOYSTICK=3Dy
> # CONFIG_JOYSTICK_ANALOG is not set
> CONFIG_JOYSTICK_A3D=3Dy
> CONFIG_JOYSTICK_ADI=3Dy
> CONFIG_JOYSTICK_COBRA=3Dy
> CONFIG_JOYSTICK_GF2K=3Dy
> CONFIG_JOYSTICK_GRIP=3Dy
> CONFIG_JOYSTICK_GRIP_MP=3Dy
> CONFIG_JOYSTICK_GUILLEMOT=3Dy
> CONFIG_JOYSTICK_INTERACT=3Dy
> # CONFIG_JOYSTICK_SIDEWINDER is not set
> CONFIG_JOYSTICK_TMDC=3Dy
> CONFIG_JOYSTICK_IFORCE=3Dy
> CONFIG_JOYSTICK_IFORCE_232=3Dy
> CONFIG_JOYSTICK_WARRIOR=3Dy
> # CONFIG_JOYSTICK_MAGELLAN is not set
> CONFIG_JOYSTICK_SPACEORB=3Dy
> CONFIG_JOYSTICK_SPACEBALL=3Dy
> CONFIG_JOYSTICK_STINGER=3Dy
> # CONFIG_JOYSTICK_TWIDJOY is not set
> CONFIG_JOYSTICK_ZHENHUA=3Dy
> # CONFIG_JOYSTICK_DB9 is not set
> # CONFIG_JOYSTICK_GAMECON is not set
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> CONFIG_JOYSTICK_AS5011=3Dy
> # CONFIG_JOYSTICK_JOYDUMP is not set
> # CONFIG_JOYSTICK_XPAD is not set
> CONFIG_JOYSTICK_WALKERA0701=3Dy
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> # CONFIG_TABLET_USB_PEGASUS is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dy
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_PROPERTIES=3Dy
> CONFIG_TOUCHSCREEN_88PM860X=3Dy
> CONFIG_TOUCHSCREEN_ADS7846=3Dy
> CONFIG_TOUCHSCREEN_AD7877=3Dy
> # CONFIG_TOUCHSCREEN_AD7879 is not set
> CONFIG_TOUCHSCREEN_AR1021_I2C=3Dy
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_BU21013=3Dy
> CONFIG_TOUCHSCREEN_CHIPONE_ICN8318=3Dy
> # CONFIG_TOUCHSCREEN_CY8CTMG110 is not set
> CONFIG_TOUCHSCREEN_CYTTSP_CORE=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_I2C is not set
> CONFIG_TOUCHSCREEN_CYTTSP_SPI=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
> # CONFIG_TOUCHSCREEN_DA9052 is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> # CONFIG_TOUCHSCREEN_HAMPSHIRE is not set
> # CONFIG_TOUCHSCREEN_EETI is not set
> CONFIG_TOUCHSCREEN_EGALAX=3Dy
> # CONFIG_TOUCHSCREEN_EGALAX_SERIAL is not set
> # CONFIG_TOUCHSCREEN_FUJITSU is not set
> CONFIG_TOUCHSCREEN_GOODIX=3Dy
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> CONFIG_TOUCHSCREEN_EKTF2127=3Dy
> CONFIG_TOUCHSCREEN_ELAN=3Dy
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> # CONFIG_TOUCHSCREEN_MAX11801 is not set
> CONFIG_TOUCHSCREEN_MCS5000=3Dy
> CONFIG_TOUCHSCREEN_MMS114=3Dy
> CONFIG_TOUCHSCREEN_MELFAS_MIP4=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> CONFIG_TOUCHSCREEN_IMX6UL_TSC=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> # CONFIG_TOUCHSCREEN_MK712 is not set
> # CONFIG_TOUCHSCREEN_PENMOUNT is not set
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WDT87XX_I2C=3Dy
> CONFIG_TOUCHSCREEN_WM831X=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_MC13783=3Dy
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> CONFIG_TOUCHSCREEN_TSC200X_CORE=3Dy
> CONFIG_TOUCHSCREEN_TSC2004=3Dy
> CONFIG_TOUCHSCREEN_TSC2005=3Dy
> CONFIG_TOUCHSCREEN_TSC2007=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007_IIO is not set
> CONFIG_TOUCHSCREEN_PCAP=3Dy
> CONFIG_TOUCHSCREEN_RM_TS=3Dy
> # CONFIG_TOUCHSCREEN_SILEAD is not set
> CONFIG_TOUCHSCREEN_SIS_I2C=3Dy
> # CONFIG_TOUCHSCREEN_ST1232 is not set
> CONFIG_TOUCHSCREEN_STMPE=3Dy
> # CONFIG_TOUCHSCREEN_SURFACE3_SPI is not set
> CONFIG_TOUCHSCREEN_SX8654=3Dy
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZET6223=3Dy
> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
> CONFIG_TOUCHSCREEN_COLIBRI_VF50=3Dy
> # CONFIG_TOUCHSCREEN_ROHM_BU21023 is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_88PM860X_ONKEY=3Dy
> # CONFIG_INPUT_88PM80X_ONKEY is not set
> # CONFIG_INPUT_AD714X is not set
> CONFIG_INPUT_ATMEL_CAPTOUCH=3Dy
> # CONFIG_INPUT_BMA150 is not set
> CONFIG_INPUT_E3X0_BUTTON=3Dy
> # CONFIG_INPUT_PCSPKR is not set
> # CONFIG_INPUT_MAX77693_HAPTIC is not set
> CONFIG_INPUT_MAX8925_ONKEY=3Dy
> CONFIG_INPUT_MAX8997_HAPTIC=3Dy
> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
> CONFIG_INPUT_MMA8450=3Dy
> CONFIG_INPUT_APANEL=3Dy
> CONFIG_INPUT_GP2A=3Dy
> # CONFIG_INPUT_GPIO_BEEPER is not set
> CONFIG_INPUT_GPIO_TILT_POLLED=3Dy
> CONFIG_INPUT_GPIO_DECODER=3Dy
> CONFIG_INPUT_CPCAP_PWRBUTTON=3Dy
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> # CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> # CONFIG_INPUT_REGULATOR_HAPTIC is not set
> CONFIG_INPUT_RETU_PWRBUTTON=3Dy
> # CONFIG_INPUT_AXP20X_PEK is not set
> CONFIG_INPUT_TWL6040_VIBRA=3Dy
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PALMAS_PWRBUTTON is not set
> # CONFIG_INPUT_PCF8574 is not set
> CONFIG_INPUT_PWM_BEEPER=3Dy
> # CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
> CONFIG_INPUT_DA9052_ONKEY=3Dy
> CONFIG_INPUT_DA9055_ONKEY=3Dy
> CONFIG_INPUT_DA9063_ONKEY=3Dy
> CONFIG_INPUT_WM831X_ON=3Dy
> CONFIG_INPUT_PCAP=3Dy
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dy
> CONFIG_INPUT_ADXL34X_SPI=3Dy
> CONFIG_INPUT_CMA3000=3Dy
> CONFIG_INPUT_CMA3000_I2C=3Dy
> # CONFIG_INPUT_XEN_KBDDEV_FRONTEND is not set
> # CONFIG_INPUT_IDEAPAD_SLIDEBAR is not set
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> CONFIG_INPUT_DRV2665_HAPTICS=3Dy
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
> CONFIG_RMI4_CORE=3Dy
> CONFIG_RMI4_I2C=3Dy
> CONFIG_RMI4_SPI=3Dy
> # CONFIG_RMI4_SMB is not set
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dy
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F55 is not set
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> # CONFIG_SERIO_SERPORT is not set
> CONFIG_SERIO_CT82C710=3Dy
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> CONFIG_SERIO_ARC_PS2=3Dy
> CONFIG_SERIO_APBPS2=3Dy
> CONFIG_HYPERV_KEYBOARD=3Dy
> CONFIG_USERIO=3Dy
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dy
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
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
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_ROCKETPORT is not set
> # CONFIG_CYCLADES is not set
> CONFIG_MOXA_INTELLIO=3Dy
> CONFIG_MOXA_SMARTIO=3Dy
> CONFIG_SYNCLINK=3Dy
> CONFIG_SYNCLINKMP=3Dy
> # CONFIG_SYNCLINK_GT is not set
> CONFIG_NOZOMI=3Dy
> # CONFIG_ISI is not set
> # CONFIG_N_HDLC is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=3Dy
> # CONFIG_GOLDFISH_TTY is not set
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
> CONFIG_SERIAL_8250_FINTEK=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_CS=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> # CONFIG_SERIAL_8250_DW is not set
> CONFIG_SERIAL_8250_RT288X=3Dy
> CONFIG_SERIAL_8250_LPSS=3Dy
> # CONFIG_SERIAL_8250_MID is not set
> CONFIG_SERIAL_8250_MOXA=3Dy
> # CONFIG_SERIAL_OF_PLATFORM is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_MAX3100=3Dy
> CONFIG_SERIAL_MAX310X=3Dy
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SCCNXP=3Dy
> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> CONFIG_SERIAL_SC16IS7XX_CORE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> CONFIG_SERIAL_SC16IS7XX_I2C=3Dy
> # CONFIG_SERIAL_SC16IS7XX_SPI is not set
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=3Dy
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> # CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
> CONFIG_SERIAL_IFX6X60=3Dy
> CONFIG_SERIAL_XILINX_PS_UART=3Dy
> # CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> # CONFIG_SERIAL_FSL_LPUART is not set
> CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
> # CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE is not set
> CONFIG_SERIAL_DEV_BUS=3Dy
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> # CONFIG_PRINTER is not set
> CONFIG_PPDEV=3Dy
> CONFIG_HVC_DRIVER=3Dy
> # CONFIG_HVC_XEN is not set
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SSIF=3Dy
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> # CONFIG_APPLICOM is not set
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> # CONFIG_SCR24X is not set
> CONFIG_IPWIRELESS=3Dy
> CONFIG_MWAVE=3Dy
> # CONFIG_RAW_DRIVER is not set
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> CONFIG_TCG_TIS_SPI=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dy
> # CONFIG_TCG_ATMEL is not set
> CONFIG_TCG_INFINEON=3Dy
> # CONFIG_TCG_XEN is not set
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dy
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dy
> CONFIG_TCG_TIS_ST33ZP24_SPI=3Dy
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
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_LTC4306=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_PINCTRL is not set
> CONFIG_I2C_MUX_REG=3Dy
> # CONFIG_I2C_DEMUX_PINCTRL is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dy
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=3Dy
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> # CONFIG_I2C_ALGOPCF is not set
> # CONFIG_I2C_ALGOPCA is not set
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_ALI1535=3Dy
> CONFIG_I2C_ALI1563=3Dy
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dy
> CONFIG_I2C_AMD756_S4882=3Dy
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> CONFIG_I2C_NFORCE2_S4985=3Dy
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dy
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
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> CONFIG_I2C_EMEV2=3Dy
> CONFIG_I2C_GPIO=3Dy
> # CONFIG_I2C_KEMPLD is not set
> CONFIG_I2C_OCORES=3Dy
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_RK3X is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_PARPORT=3Dy
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
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
> CONFIG_SPI_AXI_SPI_ENGINE=3Dy
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_BUTTERFLY=3Dy
> CONFIG_SPI_CADENCE=3Dy
> CONFIG_SPI_DESIGNWARE=3Dy
> CONFIG_SPI_DW_PCI=3Dy
> CONFIG_SPI_DW_MID_DMA=3Dy
> CONFIG_SPI_DW_MMIO=3Dy
> CONFIG_SPI_GPIO=3Dy
> CONFIG_SPI_LM70_LLP=3Dy
> CONFIG_SPI_FSL_LIB=3Dy
> CONFIG_SPI_FSL_SPI=3Dy
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> # CONFIG_SPI_ROCKCHIP is not set
> CONFIG_SPI_SC18IS602=3Dy
> # CONFIG_SPI_XCOMM is not set
> CONFIG_SPI_XILINX=3Dy
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dy
> CONFIG_SPI_TLE62X0=3Dy
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
> # CONFIG_HSI_CHAR is not set
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
> CONFIG_PPS_CLIENT_KTIMER=3Dy
> # CONFIG_PPS_CLIENT_LDISC is not set
> # CONFIG_PPS_CLIENT_PARPORT is not set
> CONFIG_PPS_CLIENT_GPIO=3Dy
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
> # CONFIG_PTP_1588_CLOCK_KVM is not set
> CONFIG_PINCTRL=3Dy
> =

> #
> # Pin controllers
> #
> CONFIG_GENERIC_PINCTRL_GROUPS=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_GENERIC_PINMUX_FUNCTIONS=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_SINGLE=3Dy
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_MAX77620=3Dy
> CONFIG_PINCTRL_PALMAS=3Dy
> # CONFIG_PINCTRL_BAYTRAIL is not set
> CONFIG_PINCTRL_CHERRYVIEW=3Dy
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_BROXTON=3Dy
> # CONFIG_PINCTRL_GEMINILAKE is not set
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_OF_GPIO=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_74XX_MMIO=3Dy
> CONFIG_GPIO_ALTERA=3Dy
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_AXP209=3Dy
> CONFIG_GPIO_DWAPB=3Dy
> CONFIG_GPIO_EXAR=3Dy
> CONFIG_GPIO_FTGPIO010=3Dy
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_GRGPIO=3Dy
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_LYNXPOINT=3Dy
> CONFIG_GPIO_MOCKUP=3Dy
> # CONFIG_GPIO_SYSCON is not set
> CONFIG_GPIO_VX855=3Dy
> CONFIG_GPIO_XILINX=3Dy
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> CONFIG_GPIO_F7188X=3Dy
> # CONFIG_GPIO_IT87 is not set
> CONFIG_GPIO_SCH=3Dy
> # CONFIG_GPIO_SCH311X is not set
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> CONFIG_GPIO_ADNP=3Dy
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_SX150X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ARIZONA=3Dy
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_DA9055=3Dy
> # CONFIG_GPIO_JANZ_TTL is not set
> # CONFIG_GPIO_KEMPLD is not set
> CONFIG_GPIO_LP3943=3Dy
> # CONFIG_GPIO_MAX77620 is not set
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_RC5T583 is not set
> # CONFIG_GPIO_STMPE is not set
> CONFIG_GPIO_TPS65086=3Dy
> # CONFIG_GPIO_TPS6586X is not set
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TPS65912=3Dy
> # CONFIG_GPIO_TWL6040 is not set
> CONFIG_GPIO_WM831X=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> # CONFIG_GPIO_ML_IOH is not set
> CONFIG_GPIO_PCI_IDIO_16=3Dy
> # CONFIG_GPIO_RDC321X is not set
> CONFIG_GPIO_SODAVILLE=3Dy
> =

> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_74X164=3Dy
> CONFIG_GPIO_MAX7301=3Dy
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_PISOSR is not set
> =

> #
> # SPI or I2C GPIO expanders
> #
> CONFIG_GPIO_MCP23S08=3Dy
> CONFIG_W1=3Dy
> CONFIG_W1_CON=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dy
> # CONFIG_W1_MASTER_DS1WM is not set
> # CONFIG_W1_MASTER_GPIO is not set
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> # CONFIG_W1_SLAVE_SMEM is not set
> CONFIG_W1_SLAVE_DS2405=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2438=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> # CONFIG_POWER_AVS is not set
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_GPIO=3Dy
> CONFIG_POWER_RESET_GPIO_RESTART=3Dy
> # CONFIG_POWER_RESET_LTC2952 is not set
> # CONFIG_POWER_RESET_RESTART is not set
> # CONFIG_POWER_RESET_SYSCON is not set
> CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> CONFIG_REBOOT_MODE=3Dy
> CONFIG_SYSCON_REBOOT_MODE=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> # CONFIG_MAX8925_POWER is not set
> # CONFIG_WM831X_BACKUP is not set
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> CONFIG_BATTERY_DS2782=3Dy
> CONFIG_BATTERY_LEGO_EV3=3Dy
> # CONFIG_BATTERY_SBS is not set
> CONFIG_CHARGER_SBS=3Dy
> CONFIG_BATTERY_BQ27XXX=3Dy
> # CONFIG_BATTERY_BQ27XXX_I2C is not set
> # CONFIG_BATTERY_DA9052 is not set
> CONFIG_AXP288_FUEL_GAUGE=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_CHARGER_88PM860X=3Dy
> # CONFIG_CHARGER_CPCAP is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> # CONFIG_CHARGER_MAX14577 is not set
> # CONFIG_CHARGER_DETECTOR_MAX14656 is not set
> # CONFIG_CHARGER_MAX77693 is not set
> # CONFIG_CHARGER_MAX8997 is not set
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> CONFIG_CHARGER_BQ25890=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> CONFIG_BATTERY_RT5033=3Dy
> # CONFIG_CHARGER_RT9455 is not set
> CONFIG_AXP20X_POWER=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> CONFIG_HWMON_DEBUG_CHIP=3Dy
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dy
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7314=3Dy
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> # CONFIG_SENSORS_ADT7411 is not set
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> CONFIG_SENSORS_K10TEMP=3Dy
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> CONFIG_SENSORS_DA9055=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> # CONFIG_SENSORS_F75375S is not set
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_FTSTEUTATES=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_POWR1220 is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC2990=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> CONFIG_SENSORS_MAX1111=3Dy
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX31722=3Dy
> # CONFIG_SENSORS_MAX6639 is not set
> CONFIG_SENSORS_MAX6642=3Dy
> # CONFIG_SENSORS_MAX6650 is not set
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_MAX31790=3Dy
> # CONFIG_SENSORS_MCP3021 is not set
> CONFIG_SENSORS_TC654=3Dy
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> CONFIG_SENSORS_ADCXX=3Dy
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> # CONFIG_SENSORS_LM87 is not set
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> # CONFIG_SENSORS_PC87427 is not set
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> CONFIG_SENSORS_ADM1275=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> # CONFIG_SENSORS_LTC2978 is not set
> CONFIG_SENSORS_LTC3815=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX20751=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> # CONFIG_SENSORS_MAX8688 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> CONFIG_SENSORS_UCD9000=3Dy
> CONFIG_SENSORS_UCD9200=3Dy
> # CONFIG_SENSORS_ZL6100 is not set
> # CONFIG_SENSORS_PWM_FAN is not set
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> # CONFIG_SENSORS_EMC2103 is not set
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> CONFIG_SENSORS_STTS751=3Dy
> CONFIG_SENSORS_SMM665=3Dy
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dy
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> CONFIG_SENSORS_INA209=3Dy
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_INA3221=3Dy
> CONFIG_SENSORS_TC74=3Dy
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dy
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dy
> CONFIG_SENSORS_W83793=3Dy
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_WM831X=3Dy
> CONFIG_SENSORS_XGENE=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> CONFIG_SENSORS_ATK0110=3Dy
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_OF=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_CPU_THERMAL is not set
> CONFIG_THERMAL_EMULATION=3Dy
> CONFIG_MAX77620_THERMAL=3Dy
> CONFIG_QORIQ_THERMAL=3Dy
> CONFIG_INTEL_POWERCLAMP=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dy
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
> # CONFIG_INT3406_THERMAL is not set
> CONFIG_INTEL_PCH_THERMAL=3Dy
> CONFIG_GENERIC_ADC_THERMAL=3Dy
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> CONFIG_WATCHDOG_NOWAYOUT=3Dy
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_SOFT_WATCHDOG_PRETIMEOUT=3Dy
> CONFIG_DA9052_WATCHDOG=3Dy
> CONFIG_DA9055_WATCHDOG=3Dy
> # CONFIG_DA9063_WATCHDOG is not set
> CONFIG_GPIO_WATCHDOG=3Dy
> CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=3Dy
> CONFIG_MENF21BMC_WATCHDOG=3Dy
> CONFIG_WDAT_WDT=3Dy
> CONFIG_WM831X_WATCHDOG=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dy
> # CONFIG_RN5T618_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> CONFIG_MAX77620_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> CONFIG_ACQUIRE_WDT=3Dy
> CONFIG_ADVANTECH_WDT=3Dy
> CONFIG_ALIM1535_WDT=3Dy
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> CONFIG_SP5100_TCO=3Dy
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> CONFIG_WAFER_WDT=3Dy
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dy
> CONFIG_ITCO_WDT=3Dy
> # CONFIG_ITCO_VENDOR_SUPPORT is not set
> CONFIG_IT8712F_WDT=3Dy
> CONFIG_IT87_WDT=3Dy
> # CONFIG_HP_WATCHDOG is not set
> # CONFIG_KEMPLD_WDT is not set
> CONFIG_SC1200_WDT=3Dy
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dy
> CONFIG_60XX_WDT=3Dy
> CONFIG_CPU5_WDT=3Dy
> CONFIG_SMSC_SCH311X_WDT=3Dy
> CONFIG_SMSC37B787_WDT=3Dy
> CONFIG_VIA_WDT=3Dy
> CONFIG_W83627HF_WDT=3Dy
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dy
> # CONFIG_MACHZ_WDT is not set
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_INTEL_MEI_WDT=3Dy
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> CONFIG_MEN_A21_WDT=3Dy
> # CONFIG_XEN_WDT is not set
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
> CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_NOOP=3Dy
> # CONFIG_WATCHDOG_PRETIMEOUT_DEFAULT_GOV_PANIC is not set
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_NOOP=3Dy
> CONFIG_WATCHDOG_PRETIMEOUT_GOV_PANIC=3Dy
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCMCIAHOST=3Dy
> CONFIG_SSB_SDIOHOST_POSSIBLE=3Dy
> CONFIG_SSB_SDIOHOST=3Dy
> # CONFIG_SSB_DEBUG is not set
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
> CONFIG_BCMA_DRIVER_PCI=3Dy
> # CONFIG_BCMA_SFLASH is not set
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_ACT8945A is not set
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_MFD_AS3722 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_ATMEL_FLEXCOM=3Dy
> CONFIG_MFD_ATMEL_HLCDC=3Dy
> # CONFIG_MFD_BCM590XX is not set
> CONFIG_MFD_AXP20X=3Dy
> CONFIG_MFD_AXP20X_I2C=3Dy
> CONFIG_MFD_CROS_EC=3Dy
> CONFIG_MFD_CROS_EC_I2C=3Dy
> # CONFIG_MFD_CROS_EC_SPI is not set
> # CONFIG_PMIC_DA903X is not set
> CONFIG_PMIC_DA9052=3Dy
> CONFIG_MFD_DA9052_SPI=3Dy
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9062 is not set
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_DA9150 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_MFD_HI6421_PMIC is not set
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> CONFIG_MFD_MAX14577=3Dy
> CONFIG_MFD_MAX77620=3Dy
> CONFIG_MFD_MAX77686=3Dy
> CONFIG_MFD_MAX77693=3Dy
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_EZX_PCAP=3Dy
> CONFIG_MFD_CPCAP=3Dy
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_RDC321X=3Dy
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RK808=3Dy
> CONFIG_MFD_RN5T618=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> CONFIG_MFD_SI476X_CORE=3Dy
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_STMPE=3Dy
> =

> #
> # STMicroelectronics STMPE Interface Drivers
> #
> # CONFIG_STMPE_I2C is not set
> CONFIG_STMPE_SPI=3Dy
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65086=3Dy
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TPS65217 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS65218 is not set
> CONFIG_MFD_TPS6586X=3Dy
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_ARIZONA_SPI=3Dy
> # CONFIG_MFD_CS47L24 is not set
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8998 is not set
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> CONFIG_MFD_WM831X_SPI=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_88PM800=3Dy
> CONFIG_REGULATOR_88PM8607=3Dy
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_ANATOP=3Dy
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_AXP20X=3Dy
> CONFIG_REGULATOR_CPCAP=3Dy
> CONFIG_REGULATOR_DA9052=3Dy
> CONFIG_REGULATOR_DA9055=3Dy
> # CONFIG_REGULATOR_DA9063 is not set
> CONFIG_REGULATOR_DA9210=3Dy
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_LTC3676 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX77620=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dy
> CONFIG_REGULATOR_MAX8925=3Dy
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX77686=3Dy
> CONFIG_REGULATOR_MAX77693=3Dy
> CONFIG_REGULATOR_MAX77802=3Dy
> # CONFIG_REGULATOR_MC13783 is not set
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_MT6311 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> CONFIG_REGULATOR_PCAP=3Dy
> # CONFIG_REGULATOR_PFUZE100 is not set
> CONFIG_REGULATOR_PV88060=3Dy
> CONFIG_REGULATOR_PV88080=3Dy
> # CONFIG_REGULATOR_PV88090 is not set
> # CONFIG_REGULATOR_PWM is not set
> CONFIG_REGULATOR_RC5T583=3Dy
> CONFIG_REGULATOR_RK808=3Dy
> CONFIG_REGULATOR_RN5T618=3Dy
> CONFIG_REGULATOR_RT5033=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=3Dy
> # CONFIG_REGULATOR_TPS6507X is not set
> CONFIG_REGULATOR_TPS65086=3Dy
> CONFIG_REGULATOR_TPS65132=3Dy
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS6586X=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> # CONFIG_REGULATOR_TPS65912 is not set
> # CONFIG_REGULATOR_VCTRL is not set
> CONFIG_REGULATOR_WM831X=3Dy
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_AMD64=3Dy
> CONFIG_AGP_INTEL=3Dy
> CONFIG_AGP_SIS=3Dy
> CONFIG_AGP_VIA=3Dy
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> # CONFIG_DRM_DEBUG_MM is not set
> # CONFIG_DRM_DEBUG_MM_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> # CONFIG_DRM_FBDEV_EMULATION is not set
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> CONFIG_DRM_TTM=3Dy
> CONFIG_DRM_GEM_CMA_HELPER=3Dy
> CONFIG_DRM_KMS_CMA_HELPER=3Dy
> CONFIG_DRM_VM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_CH7006 is not set
> CONFIG_DRM_I2C_SIL164=3Dy
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> CONFIG_DRM_RADEON=3Dy
> CONFIG_DRM_RADEON_USERPTR=3Dy
> CONFIG_DRM_AMDGPU=3Dy
> # CONFIG_DRM_AMDGPU_SI is not set
> # CONFIG_DRM_AMDGPU_CIK is not set
> CONFIG_DRM_AMDGPU_USERPTR=3Dy
> # CONFIG_DRM_AMDGPU_GART_DEBUGFS is not set
> =

> #
> # ACP (Audio CoProcessor) Configuration
> #
> CONFIG_DRM_AMD_ACP=3Dy
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dy
> CONFIG_DRM_I915_ALPHA_SUPPORT=3Dy
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
> CONFIG_DRM_VGEM=3Dy
> CONFIG_DRM_VMWGFX=3Dy
> # CONFIG_DRM_VMWGFX_FBCON is not set
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> # CONFIG_DRM_GMA3600 is not set
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dy
> # CONFIG_DRM_MGAG200 is not set
> CONFIG_DRM_CIRRUS_QEMU=3Dy
> # CONFIG_DRM_RCAR_DW_HDMI is not set
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_BOCHS=3Dy
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> CONFIG_DRM_PANEL_LVDS=3Dy
> CONFIG_DRM_PANEL_SIMPLE=3Dy
> # CONFIG_DRM_PANEL_JDI_LT070ME05000 is not set
> CONFIG_DRM_PANEL_SAMSUNG_LD9040=3Dy
> # CONFIG_DRM_PANEL_LG_LG4573 is not set
> CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00=3Dy
> CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=3Dy
> # CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0 is not set
> # CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
> CONFIG_DRM_PANEL_SHARP_LS043T1LE01=3Dy
> CONFIG_DRM_PANEL_SITRONIX_ST7789V=3Dy
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> CONFIG_DRM_ANALOGIX_ANX78XX=3Dy
> # CONFIG_DRM_DUMB_VGA_DAC is not set
> CONFIG_DRM_LVDS_ENCODER=3Dy
> # CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
> CONFIG_DRM_NXP_PTN3460=3Dy
> # CONFIG_DRM_PARADE_PS8622 is not set
> # CONFIG_DRM_SIL_SII8620 is not set
> CONFIG_DRM_SII902X=3Dy
> CONFIG_DRM_TOSHIBA_TC358767=3Dy
> # CONFIG_DRM_TI_TFP410 is not set
> CONFIG_DRM_I2C_ADV7511=3Dy
> # CONFIG_DRM_I2C_ADV7533 is not set
> CONFIG_DRM_ARCPGU=3Dy
> # CONFIG_DRM_HISI_HIBMC is not set
> # CONFIG_DRM_MXSFB is not set
> # CONFIG_DRM_TINYDRM is not set
> CONFIG_DRM_LEGACY=3Dy
> CONFIG_DRM_TDFX=3Dy
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_I810 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_SIS is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> # CONFIG_DRM_LIB_RANDOM is not set
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> # CONFIG_FB_PROVIDE_GET_FB_UNMAPPED_AREA is not set
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
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
> CONFIG_FB_UVESA=3Dy
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_EFI=3Dy
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
> CONFIG_FB_NVIDIA=3Dy
> # CONFIG_FB_NVIDIA_I2C is not set
> # CONFIG_FB_NVIDIA_DEBUG is not set
> CONFIG_FB_NVIDIA_BACKLIGHT=3Dy
> CONFIG_FB_RIVA=3Dy
> CONFIG_FB_RIVA_I2C=3Dy
> CONFIG_FB_RIVA_DEBUG=3Dy
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> CONFIG_FB_ATY128=3Dy
> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> CONFIG_FB_ATY=3Dy
> # CONFIG_FB_ATY_CT is not set
> # CONFIG_FB_ATY_GX is not set
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> CONFIG_FB_VIA=3Dy
> # CONFIG_FB_VIA_DIRECT_PROCFS is not set
> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> CONFIG_FB_NEOMAGIC=3Dy
> CONFIG_FB_KYRO=3Dy
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> CONFIG_FB_VT8623=3Dy
> CONFIG_FB_TRIDENT=3Dy
> CONFIG_FB_ARK=3Dy
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> CONFIG_FB_GOLDFISH=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> # CONFIG_XEN_FBDEV_FRONTEND is not set
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> # CONFIG_FB_MB862XX_I2C is not set
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> # CONFIG_FB_AUO_K1900 is not set
> CONFIG_FB_AUO_K1901=3Dy
> # CONFIG_FB_HYPERV is not set
> # CONFIG_FB_SIMPLE is not set
> CONFIG_FB_SSD1307=3Dy
> CONFIG_FB_SM712=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> # CONFIG_BACKLIGHT_LM3533 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> # CONFIG_BACKLIGHT_DA9052 is not set
> CONFIG_BACKLIGHT_MAX8925=3Dy
> CONFIG_BACKLIGHT_APPLE=3Dy
> # CONFIG_BACKLIGHT_PM8941_WLED is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_88PM860X is not set
> CONFIG_BACKLIGHT_LM3630A=3Dy
> # CONFIG_BACKLIGHT_LM3639 is not set
> # CONFIG_BACKLIGHT_LP855X is not set
> # CONFIG_BACKLIGHT_SKY81452 is not set
> # CONFIG_BACKLIGHT_AS3711 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> # CONFIG_BACKLIGHT_LV5207LP is not set
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_BACKLIGHT_ARCXCNN=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_VIDEOMODE_HELPERS=3Dy
> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_ROTATION is not set
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dy
> # CONFIG_SOUND_OSS_CORE is not set
> # CONFIG_SND is not set
> # CONFIG_SOUND_PRIME is not set
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
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dy
> CONFIG_HID_ASUS=3Dy
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dy
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_CMEDIA=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_GEMBIRD=3Dy
> # CONFIG_HID_GFRM is not set
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_WALTOP=3Dy
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> # CONFIG_HID_KENSINGTON is not set
> # CONFIG_HID_LCPOWER is not set
> CONFIG_HID_LED=3Dy
> CONFIG_HID_LENOVO=3Dy
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MAYFLASH is not set
> CONFIG_HID_MICROSOFT=3Dy
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_NTI=3Dy
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> CONFIG_PANTHERLORD_FF=3Dy
> CONFIG_HID_PETALYNX=3Dy
> # CONFIG_HID_PICOLCD is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_HYPERV_MOUSE=3Dy
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> CONFIG_HID_UDRAW_PS3=3Dy
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> CONFIG_HID_ZYDACRON=3Dy
> CONFIG_HID_SENSOR_HUB=3Dy
> # CONFIG_HID_SENSOR_CUSTOM_SENSOR is not set
> CONFIG_HID_ALPS=3Dy
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
> # CONFIG_USB_PHY is not set
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> =

> #
> # USB Power Delivery and Type-C drivers
> #
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_WHCI=3Dy
> CONFIG_MMC=3Dy
> # CONFIG_MMC_DEBUG is not set
> CONFIG_PWRSEQ_EMMC=3Dy
> CONFIG_PWRSEQ_SD8787=3Dy
> CONFIG_PWRSEQ_SIMPLE=3Dy
> CONFIG_MMC_BLOCK=3Dy
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_MMC_BLOCK_BOUNCE=3Dy
> CONFIG_SDIO_UART=3Dy
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> CONFIG_MMC_SDHCI=3Dy
> # CONFIG_MMC_SDHCI_PCI is not set
> # CONFIG_MMC_SDHCI_ACPI is not set
> CONFIG_MMC_SDHCI_PLTFM=3Dy
> # CONFIG_MMC_SDHCI_OF_ARASAN is not set
> CONFIG_MMC_SDHCI_OF_AT91=3Dy
> CONFIG_MMC_SDHCI_CADENCE=3Dy
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> CONFIG_MMC_WBSD=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_GOLDFISH=3Dy
> CONFIG_MMC_SPI=3Dy
> # CONFIG_MMC_SDRICOH_CS is not set
> # CONFIG_MMC_CB710 is not set
> CONFIG_MMC_VIA_SDMMC=3Dy
> # CONFIG_MMC_USDHI6ROL0 is not set
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> CONFIG_MMC_MTK=3Dy
> # CONFIG_MMC_SDHCI_XENON is not set
> CONFIG_MEMSTICK=3Dy
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
> CONFIG_MEMSTICK_TIFM_MS=3Dy
> CONFIG_MEMSTICK_JMICRON_38X=3Dy
> CONFIG_MEMSTICK_R592=3Dy
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=3Dy
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_88PM860X is not set
> CONFIG_LEDS_BCM6328=3Dy
> # CONFIG_LEDS_BCM6358 is not set
> CONFIG_LEDS_CPCAP=3Dy
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dy
> # CONFIG_LEDS_LP3952 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> CONFIG_LEDS_LP8501=3Dy
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dy
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_DAC124S085=3Dy
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_INTEL_SS4200=3Dy
> CONFIG_LEDS_LT3593=3Dy
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_MAX8997=3Dy
> CONFIG_LEDS_LM355x=3Dy
> # CONFIG_LEDS_MENF21BMC is not set
> # CONFIG_LEDS_IS31FL319X is not set
> CONFIG_LEDS_IS31FL32XX=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> # CONFIG_LEDS_BLINKM is not set
> CONFIG_LEDS_SYSCON=3Dy
> CONFIG_LEDS_MLXCPLD=3Dy
> # CONFIG_LEDS_USER is not set
> CONFIG_LEDS_NIC78BX=3Dy
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> # CONFIG_LEDS_TRIGGER_ONESHOT is not set
> CONFIG_LEDS_TRIGGER_DISK=3Dy
> # CONFIG_LEDS_TRIGGER_MTD is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> CONFIG_LEDS_TRIGGER_PANIC=3Dy
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_E752X=3Dy
> CONFIG_EDAC_I82975X=3Dy
> CONFIG_EDAC_I3000=3Dy
> CONFIG_EDAC_I3200=3Dy
> # CONFIG_EDAC_IE31200 is not set
> CONFIG_EDAC_X38=3Dy
> CONFIG_EDAC_I5400=3Dy
> # CONFIG_EDAC_I7CORE is not set
> # CONFIG_EDAC_I5000 is not set
> CONFIG_EDAC_I5100=3Dy
> CONFIG_EDAC_I7300=3Dy
> # CONFIG_EDAC_SBRIDGE is not set
> CONFIG_EDAC_SKX=3Dy
> # CONFIG_EDAC_PND2 is not set
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
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> CONFIG_DMA_OF=3Dy
> # CONFIG_FSL_EDMA is not set
> CONFIG_INTEL_IDMA64=3Dy
> CONFIG_INTEL_IOATDMA=3Dy
> # CONFIG_INTEL_MIC_X100_DMA is not set
> CONFIG_QCOM_HIDMA_MGMT=3Dy
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> CONFIG_DW_DMAC_PCI=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> # CONFIG_DMATEST is not set
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_DCA=3Dy
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> CONFIG_UIO_PCI_GENERIC=3Dy
> # CONFIG_UIO_NETX is not set
> CONFIG_UIO_PRUSS=3Dy
> CONFIG_UIO_MF624=3Dy
> # CONFIG_UIO_HV_GENERIC is not set
> CONFIG_IRQ_BYPASS_MANAGER=3Dy
> CONFIG_VIRT_DRIVERS=3Dy
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
> CONFIG_HYPERV=3Dy
> CONFIG_HYPERV_TSCPAGE=3Dy
> CONFIG_HYPERV_UTILS=3Dy
> CONFIG_HYPERV_BALLOON=3Dy
> =

> #
> # Xen driver support
> #
> # CONFIG_XEN_BALLOON is not set
> CONFIG_XEN_DEV_EVTCHN=3Dy
> # CONFIG_XEN_BACKEND is not set
> CONFIG_XENFS=3Dy
> # CONFIG_XEN_COMPAT_XENFS is not set
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_ACPI_PROCESSOR=3Dy
> CONFIG_XEN_MCE_LOG=3Dy
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> CONFIG_XEN_SYMS=3Dy
> CONFIG_XEN_HAVE_VPMU=3Dy
> # CONFIG_STAGING is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_PMC_ATOM=3Dy
> CONFIG_GOLDFISH_BUS=3Dy
> CONFIG_GOLDFISH_PIPE=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_LAPTOP=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> # CONFIG_CROS_KBD_LED_BACKLIGHT is not set
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> # CONFIG_COMMON_CLK_WM831X is not set
> CONFIG_COMMON_CLK_MAX77686=3Dy
> CONFIG_COMMON_CLK_RK808=3Dy
> # CONFIG_COMMON_CLK_SI5351 is not set
> CONFIG_COMMON_CLK_SI514=3Dy
> # CONFIG_COMMON_CLK_SI570 is not set
> CONFIG_COMMON_CLK_CDCE706=3Dy
> CONFIG_COMMON_CLK_CDCE925=3Dy
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_CLK_TWL6040=3Dy
> # CONFIG_COMMON_CLK_NXP is not set
> CONFIG_COMMON_CLK_PALMAS=3Dy
> CONFIG_COMMON_CLK_PWM=3Dy
> # CONFIG_COMMON_CLK_PXA is not set
> # CONFIG_COMMON_CLK_PIC32 is not set
> CONFIG_COMMON_CLK_VC5=3Dy
> =

> #
> # Hardware Spinlock drivers
> #
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
> CONFIG_MAILBOX=3Dy
> CONFIG_PLATFORM_MHU=3Dy
> CONFIG_PCC=3Dy
> CONFIG_ALTERA_MBOX=3Dy
> CONFIG_MAILBOX_TEST=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dy
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Broadcom SoC drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> # CONFIG_SOC_TI is not set
> # CONFIG_SOC_ZTE is not set
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=3Dy
> CONFIG_EXTCON_GPIO=3Dy
> CONFIG_EXTCON_INTEL_INT3496=3Dy
> CONFIG_EXTCON_MAX14577=3Dy
> # CONFIG_EXTCON_MAX3355 is not set
> # CONFIG_EXTCON_MAX77693 is not set
> CONFIG_EXTCON_MAX8997=3Dy
> CONFIG_EXTCON_PALMAS=3Dy
> # CONFIG_EXTCON_QCOM_SPMI_MISC is not set
> CONFIG_EXTCON_RT8973A=3Dy
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dy
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_CONFIGFS=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> CONFIG_IIO_SW_DEVICE=3Dy
> CONFIG_IIO_SW_TRIGGER=3Dy
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dy
> # CONFIG_BMA220 is not set
> CONFIG_BMC150_ACCEL=3Dy
> CONFIG_BMC150_ACCEL_I2C=3Dy
> CONFIG_BMC150_ACCEL_SPI=3Dy
> # CONFIG_DA280 is not set
> CONFIG_DA311=3Dy
> # CONFIG_DMARD06 is not set
> # CONFIG_DMARD09 is not set
> # CONFIG_DMARD10 is not set
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> # CONFIG_KXSD9 is not set
> # CONFIG_KXCJK1013 is not set
> CONFIG_MC3230=3Dy
> CONFIG_MMA7455=3Dy
> # CONFIG_MMA7455_I2C is not set
> CONFIG_MMA7455_SPI=3Dy
> CONFIG_MMA7660=3Dy
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> # CONFIG_MXC4005 is not set
> CONFIG_MXC6255=3Dy
> # CONFIG_SCA3000 is not set
> CONFIG_STK8312=3Dy
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> CONFIG_AD7266=3Dy
> # CONFIG_AD7291 is not set
> CONFIG_AD7298=3Dy
> # CONFIG_AD7476 is not set
> # CONFIG_AD7766 is not set
> CONFIG_AD7791=3Dy
> CONFIG_AD7793=3Dy
> # CONFIG_AD7887 is not set
> CONFIG_AD7923=3Dy
> CONFIG_AD799X=3Dy
> # CONFIG_AXP20X_ADC is not set
> # CONFIG_AXP288_ADC is not set
> # CONFIG_CC10001_ADC is not set
> # CONFIG_CPCAP_ADC is not set
> # CONFIG_ENVELOPE_DETECTOR is not set
> # CONFIG_HI8435 is not set
> # CONFIG_HX711 is not set
> # CONFIG_INA2XX_ADC is not set
> CONFIG_LTC2485=3Dy
> # CONFIG_LTC2497 is not set
> # CONFIG_MAX1027 is not set
> # CONFIG_MAX11100 is not set
> CONFIG_MAX1118=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MAX9611=3Dy
> CONFIG_MCP320X=3Dy
> CONFIG_MCP3422=3Dy
> CONFIG_NAU7802=3Dy
> # CONFIG_PALMAS_GPADC is not set
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADC0832=3Dy
> CONFIG_TI_ADC12138=3Dy
> # CONFIG_TI_ADC128S052 is not set
> # CONFIG_TI_ADC161S626 is not set
> CONFIG_TI_ADS7950=3Dy
> CONFIG_TI_ADS8688=3Dy
> CONFIG_TI_AM335X_ADC=3Dy
> CONFIG_TI_TLC4541=3Dy
> CONFIG_VF610_ADC=3Dy
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
> # CONFIG_IAQCORE is not set
> CONFIG_VZ89X=3Dy
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
> # CONFIG_IIO_SSP_SENSORS_COMMONS is not set
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
> # CONFIG_AD5064 is not set
> CONFIG_AD5360=3Dy
> # CONFIG_AD5380 is not set
> CONFIG_AD5421=3Dy
> CONFIG_AD5446=3Dy
> CONFIG_AD5449=3Dy
> CONFIG_AD5592R_BASE=3Dy
> CONFIG_AD5592R=3Dy
> CONFIG_AD5593R=3Dy
> CONFIG_AD5504=3Dy
> # CONFIG_AD5624R_SPI is not set
> CONFIG_LTC2632=3Dy
> CONFIG_AD5686=3Dy
> CONFIG_AD5755=3Dy
> CONFIG_AD5761=3Dy
> # CONFIG_AD5764 is not set
> CONFIG_AD5791=3Dy
> CONFIG_AD7303=3Dy
> CONFIG_AD8801=3Dy
> CONFIG_DPOT_DAC=3Dy
> CONFIG_M62332=3Dy
> CONFIG_MAX517=3Dy
> CONFIG_MAX5821=3Dy
> CONFIG_MCP4725=3Dy
> # CONFIG_MCP4922 is not set
> # CONFIG_VF610_DAC is not set
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
> # CONFIG_AD9523 is not set
> =

> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # CONFIG_ADF4350 is not set
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=3Dy
> CONFIG_ADIS16130=3Dy
> # CONFIG_ADIS16136 is not set
> CONFIG_ADIS16260=3Dy
> CONFIG_ADXRS450=3Dy
> # CONFIG_BMG160 is not set
> CONFIG_HID_SENSOR_GYRO_3D=3Dy
> # CONFIG_MPU3050_I2C is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> # CONFIG_ITG3200 is not set
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
> CONFIG_MAX30100=3Dy
> # CONFIG_MAX30102 is not set
> =

> #
> # Humidity sensors
> #
> # CONFIG_AM2315 is not set
> CONFIG_DHT11=3Dy
> CONFIG_HDC100X=3Dy
> CONFIG_HID_SENSOR_HUMIDITY=3Dy
> CONFIG_HTS221=3Dy
> CONFIG_HTS221_I2C=3Dy
> CONFIG_HTS221_SPI=3Dy
> CONFIG_HTU21=3Dy
> CONFIG_SI7005=3Dy
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dy
> CONFIG_ADIS16480=3Dy
> CONFIG_BMI160=3Dy
> # CONFIG_BMI160_I2C is not set
> CONFIG_BMI160_SPI=3Dy
> # CONFIG_KMX61 is not set
> CONFIG_INV_MPU6050_IIO=3Dy
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_INV_MPU6050_SPI=3Dy
> # CONFIG_IIO_ST_LSM6DSX is not set
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> CONFIG_ACPI_ALS=3Dy
> # CONFIG_ADJD_S311 is not set
> # CONFIG_AL3320A is not set
> CONFIG_APDS9300=3Dy
> CONFIG_APDS9960=3Dy
> CONFIG_BH1750=3Dy
> CONFIG_BH1780=3Dy
> CONFIG_CM32181=3Dy
> CONFIG_CM3232=3Dy
> CONFIG_CM3323=3Dy
> # CONFIG_CM3605 is not set
> # CONFIG_CM36651 is not set
> CONFIG_IIO_CROS_EC_LIGHT_PROX=3Dy
> CONFIG_GP2AP020A00F=3Dy
> # CONFIG_SENSORS_ISL29018 is not set
> CONFIG_ISL29125=3Dy
> CONFIG_HID_SENSOR_ALS=3Dy
> # CONFIG_HID_SENSOR_PROX is not set
> CONFIG_JSA1212=3Dy
> # CONFIG_RPR0521 is not set
> CONFIG_SENSORS_LM3533=3Dy
> # CONFIG_LTR501 is not set
> CONFIG_MAX44000=3Dy
> # CONFIG_OPT3001 is not set
> CONFIG_PA12203001=3Dy
> CONFIG_SI1145=3Dy
> CONFIG_STK3310=3Dy
> # CONFIG_TCS3414 is not set
> # CONFIG_TCS3472 is not set
> CONFIG_SENSORS_TSL2563=3Dy
> CONFIG_TSL2583=3Dy
> CONFIG_TSL4531=3Dy
> # CONFIG_US5182D is not set
> CONFIG_VCNL4000=3Dy
> # CONFIG_VEML6070 is not set
> CONFIG_VL6180=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8974=3Dy
> CONFIG_AK8975=3Dy
> # CONFIG_AK09911 is not set
> # CONFIG_BMC150_MAGN_I2C is not set
> # CONFIG_BMC150_MAGN_SPI is not set
> CONFIG_MAG3110=3Dy
> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> CONFIG_SENSORS_HMC5843=3Dy
> # CONFIG_SENSORS_HMC5843_I2C is not set
> CONFIG_SENSORS_HMC5843_SPI=3Dy
> =

> #
> # Inclinometer sensors
> #
> CONFIG_HID_SENSOR_INCLINOMETER_3D=3Dy
> CONFIG_HID_SENSOR_DEVICE_ROTATION=3Dy
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
> # CONFIG_DS1803 is not set
> CONFIG_MAX5481=3Dy
> CONFIG_MAX5487=3Dy
> CONFIG_MCP4131=3Dy
> # CONFIG_MCP4531 is not set
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
> # CONFIG_ABP060MG is not set
> CONFIG_BMP280=3Dy
> CONFIG_BMP280_I2C=3Dy
> CONFIG_BMP280_SPI=3Dy
> CONFIG_IIO_CROS_EC_BARO=3Dy
> # CONFIG_HID_SENSOR_PRESS is not set
> CONFIG_HP03=3Dy
> CONFIG_MPL115=3Dy
> CONFIG_MPL115_I2C=3Dy
> CONFIG_MPL115_SPI=3Dy
> CONFIG_MPL3115=3Dy
> # CONFIG_MS5611 is not set
> # CONFIG_MS5637 is not set
> # CONFIG_IIO_ST_PRESS is not set
> CONFIG_T5403=3Dy
> # CONFIG_HP206C is not set
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
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_SRF04=3Dy
> CONFIG_SX9500=3Dy
> CONFIG_SRF08=3Dy
> =

> #
> # Temperature sensors
> #
> # CONFIG_MAXIM_THERMOCOUPLE is not set
> CONFIG_HID_SENSOR_TEMP=3Dy
> CONFIG_MLX90614=3Dy
> CONFIG_TMP006=3Dy
> CONFIG_TMP007=3Dy
> CONFIG_TSYS01=3Dy
> # CONFIG_TSYS02D is not set
> # CONFIG_NTB is not set
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> # CONFIG_VME_CA91CX42 is not set
> CONFIG_VME_TSI148=3Dy
> CONFIG_VME_FAKE=3Dy
> =

> #
> # VME Board Drivers
> #
> CONFIG_VMIVME_7805=3Dy
> =

> #
> # VME Device Drivers
> #
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_ATMEL_HLCDC_PWM=3Dy
> CONFIG_PWM_CRC=3Dy
> CONFIG_PWM_CROS_EC=3Dy
> # CONFIG_PWM_FSL_FTM is not set
> CONFIG_PWM_LP3943=3Dy
> CONFIG_PWM_LPSS=3Dy
> CONFIG_PWM_LPSS_PCI=3Dy
> CONFIG_PWM_LPSS_PLATFORM=3Dy
> # CONFIG_PWM_PCA9685 is not set
> # CONFIG_PWM_STMPE is not set
> CONFIG_IRQCHIP=3Dy
> CONFIG_ARM_GIC_MAX_NR=3D1
> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> CONFIG_PHY_PXA_28NM_USB2=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL=3Dy
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> CONFIG_RAS=3Dy
> CONFIG_MCE_AMD_INJ=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> CONFIG_LIBNVDIMM=3Dy
> # CONFIG_BLK_DEV_PMEM is not set
> CONFIG_ND_BLK=3Dy
> # CONFIG_BTT is not set
> CONFIG_DAX=3Dy
> CONFIG_NR_DEV_DAX=3D32768
> CONFIG_NVMEM=3Dy
> # CONFIG_STM is not set
> CONFIG_INTEL_TH=3Dy
> CONFIG_INTEL_TH_PCI=3Dy
> CONFIG_INTEL_TH_GTH=3Dy
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> CONFIG_INTEL_TH_DEBUG=3Dy
> =

> #
> # FPGA Configuration Support
> #
> # CONFIG_FPGA is not set
> =

> #
> # FSI support
> #
> CONFIG_FSI=3Dy
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> CONFIG_DCDBAS=3Dy
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_FW_CFG_SYSFS is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> # CONFIG_EFI_VARS is not set
> CONFIG_EFI_ESRT=3Dy
> # CONFIG_EFI_RUNTIME_MAP is not set
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_CAPSULE_LOADER=3Dy
> # CONFIG_EFI_TEST is not set
> # CONFIG_APPLE_PROPERTIES is not set
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
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> # CONFIG_EXT2_FS_POSIX_ACL is not set
> # CONFIG_EXT2_FS_SECURITY is not set
> CONFIG_EXT3_FS=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> CONFIG_EXT3_FS_SECURITY=3Dy
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_ENCRYPTION is not set
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> CONFIG_REISERFS_FS=3Dy
> # CONFIG_REISERFS_CHECK is not set
> CONFIG_REISERFS_PROC_INFO=3Dy
> CONFIG_REISERFS_FS_XATTR=3Dy
> # CONFIG_REISERFS_FS_POSIX_ACL is not set
> # CONFIG_REISERFS_FS_SECURITY is not set
> # CONFIG_JFS_FS is not set
> # CONFIG_XFS_FS is not set
> CONFIG_GFS2_FS=3Dy
> CONFIG_OCFS2_FS=3Dy
> CONFIG_OCFS2_FS_O2CB=3Dy
> # CONFIG_OCFS2_FS_STATS is not set
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> CONFIG_OCFS2_DEBUG_FS=3Dy
> CONFIG_BTRFS_FS=3Dy
> # CONFIG_BTRFS_FS_POSIX_ACL is not set
> CONFIG_BTRFS_FS_CHECK_INTEGRITY=3Dy
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> CONFIG_BTRFS_DEBUG=3Dy
> CONFIG_BTRFS_ASSERT=3Dy
> CONFIG_NILFS2_FS=3Dy
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> # CONFIG_F2FS_FS_POSIX_ACL is not set
> # CONFIG_F2FS_FS_SECURITY is not set
> CONFIG_F2FS_CHECK_FS=3Dy
> CONFIG_F2FS_FS_ENCRYPTION=3Dy
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> # CONFIG_EXPORTFS_BLOCK_OPS is not set
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> # CONFIG_FANOTIFY is not set
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dy
> # CONFIG_QFMT_V2 is not set
> CONFIG_QUOTACTL=3Dy
> CONFIG_QUOTACTL_COMPAT=3Dy
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> CONFIG_OVERLAY_FS=3Dy
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> =

> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> # CONFIG_ZISOFS is not set
> CONFIG_UDF_FS=3Dy
> CONFIG_UDF_NLS=3Dy
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_NTFS_FS is not set
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
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ORANGEFS_FS=3Dy
> CONFIG_ADFS_FS=3Dy
> # CONFIG_ADFS_FS_RW is not set
> CONFIG_AFFS_FS=3Dy
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> CONFIG_HFS_FS=3Dy
> # CONFIG_HFSPLUS_FS is not set
> CONFIG_BEFS_FS=3Dy
> CONFIG_BEFS_DEBUG=3Dy
> CONFIG_BFS_FS=3Dy
> CONFIG_EFS_FS=3Dy
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> # CONFIG_JFFS2_SUMMARY is not set
> # CONFIG_JFFS2_FS_XATTR is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=3Dy
> # CONFIG_JFFS2_LZO is not set
> CONFIG_JFFS2_RTIME=3Dy
> # CONFIG_JFFS2_RUBIN is not set
> # CONFIG_UBIFS_FS is not set
> CONFIG_CRAMFS=3Dy
> CONFIG_SQUASHFS=3Dy
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> # CONFIG_SQUASHFS_XATTR is not set
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> # CONFIG_SQUASHFS_XZ is not set
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> CONFIG_MINIX_FS=3Dy
> CONFIG_OMFS_FS=3Dy
> # CONFIG_HPFS_FS is not set
> CONFIG_QNX4FS_FS=3Dy
> CONFIG_QNX6FS_FS=3Dy
> CONFIG_QNX6FS_DEBUG=3Dy
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> # CONFIG_PSTORE_ZLIB_COMPRESS is not set
> CONFIG_PSTORE_LZO_COMPRESS=3Dy
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> CONFIG_PSTORE_RAM=3Dy
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> # CONFIG_UFS_DEBUG is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> # CONFIG_NCP_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> CONFIG_NLS_CODEPAGE_874=3Dy
> # CONFIG_NLS_ISO8859_8 is not set
> # CONFIG_NLS_CODEPAGE_1250 is not set
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> CONFIG_NLS_MAC_CELTIC=3Dy
> CONFIG_NLS_MAC_CENTEURO=3Dy
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> # CONFIG_NLS_MAC_GREEK is not set
> CONFIG_NLS_MAC_ICELAND=3Dy
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dy
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
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D8192
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
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
> CONFIG_PAGE_POISONING_ZERO=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_DEBUG_SLAB is not set
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
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_KMEMCHECK is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_KASAN=3Dy
> # CONFIG_KASAN_OUTLINE is not set
> CONFIG_KASAN_INLINE=3Dy
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_KCOV=3Dy
> CONFIG_KCOV_INSTRUMENT_ALL=3Dy
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_TIMEKEEPING=3Dy
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
> CONFIG_SPARSE_RCU_POINTER=3Dy
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_PERF_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> # CONFIG_FTRACE is not set
> =

> #
> # Runtime Testing
> #
> CONFIG_LKDTM=3Dy
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_TEST_HEXDUMP is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_TEST_PRINTF=3Dy
> # CONFIG_TEST_BITMAP is not set
> CONFIG_TEST_UUID=3Dy
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_FIRMWARE is not set
> CONFIG_TEST_UDELAY=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_ARCH_WANTS_UBSAN_NO_NULL is not set
> CONFIG_UBSAN=3Dy
> # CONFIG_UBSAN_SANITIZE_ALL is not set
> # CONFIG_UBSAN_ALIGNMENT is not set
> CONFIG_UBSAN_NULL=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_EARLY_PRINTK_EFI is not set
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> CONFIG_X86_PTDUMP_CORE=3Dy
> # CONFIG_X86_PTDUMP is not set
> CONFIG_EFI_PGT_DUMP=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> # CONFIG_IOMMU_DEBUG is not set
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
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=3Dy
> # CONFIG_TRUSTED_KEYS is not set
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEY_DH_OPERATIONS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> # CONFIG_SECURITY_WRITABLE_HOOKS is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> # CONFIG_SECURITY_NETWORK_XFRM is not set
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=3D1
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_INTEGRITY_AUDIT is not set
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> # CONFIG_IMA_TEMPLATE is not set
> # CONFIG_IMA_NG_TEMPLATE is not set
> CONFIG_IMA_SIG_TEMPLATE=3Dy
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-sig"
> # CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
> CONFIG_IMA_DEFAULT_HASH_SHA256=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> # CONFIG_IMA_DEFAULT_HASH_WP512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha256"
> CONFIG_IMA_WRITE_POLICY=3Dy
> CONFIG_IMA_READ_POLICY=3Dy
> # CONFIG_IMA_APPRAISE is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> CONFIG_DEFAULT_SECURITY_APPARMOR=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_DEFAULT_SECURITY=3D"apparmor"
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
> CONFIG_CRYPTO_ECDH=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dy
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_SIMD=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> # CONFIG_CRYPTO_GCM is not set
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dy
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
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> # CONFIG_CRYPTO_CRCT10DIF is not set
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_POLY1305_X86_64=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dy
> CONFIG_CRYPTO_SHA1_MB=3Dy
> # CONFIG_CRYPTO_SHA256_MB is not set
> # CONFIG_CRYPTO_SHA512_MB is not set
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> CONFIG_CRYPTO_WP512=3Dy
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_TI=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> # CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_X86_64=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dy
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dy
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> # CONFIG_CRYPTO_TWOFISH_X86_64_3WAY is not set
> # CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> # CONFIG_CRYPTO_LZO is not set
> # CONFIG_CRYPTO_842 is not set
> CONFIG_CRYPTO_LZ4=3Dy
> CONFIG_CRYPTO_LZ4HC=3Dy
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
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> # CONFIG_CRYPTO_HW is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> =

> #
> # Certificates for signature checking
> #
> # CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dy
> CONFIG_KVM_INTEL=3Dy
> CONFIG_KVM_AMD=3Dy
> CONFIG_VHOST_NET=3Dy
> # CONFIG_VHOST_VSOCK is not set
> CONFIG_VHOST=3Dy
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
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
> # CONFIG_CRC_T10DIF is not set
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
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
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
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_INTERVAL_TREE=3Dy
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
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> # CONFIG_CORDIC is not set
> CONFIG_DDR=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy
> CONFIG_STACKDEPOT=3Dy
> CONFIG_SBITMAP=3Dy


--===============8119742797577930584==--

