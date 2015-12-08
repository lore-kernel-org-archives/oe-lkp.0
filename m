Content-Type: multipart/mixed; boundary="===============6061917027208283513=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 52b265325b: WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_create_group()
Date: Mon, 07 Dec 2015 16:40:38 -0800
Message-ID: <20151208004038.GK28602@linux.vnet.ibm.com>
In-Reply-To: <5666227b.frfFcgZiBdWBz1PX%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6061917027208283513==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 08, 2015 at 08:21:15AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu=
/dev

I guess it would help if I left the terminating NULL pointer in the
ksysfs array...  :-/

Fixed and pushed.

							Thanx, Paul

> commit 52b265325b7a7438cbcdd735fecdd9d7e255eb83
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Mon Dec 7 13:09:52 2015 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Mon Dec 7 13:09:52 2015 -0800
> =

>     rcu: Remove TINY_RCU bloat from pointless boot parameters
>     =

>     The rcu_expedited, rcu_normal, and rcu_normal_after_boot kernel boot
>     parameters are pointless in the case of TINY_RCU, due to the fact
>     that in that case both expedited and normal grace periods are no-ops.
>     However, these three symbols contribute several hundred bytes of
>     bloat.  This commit therefore uses CPP directives to avoid compiling
>     this code in TINY_RCU kernels.
>     =

>     Reported-by: kbuild test robot <fengguang.wu@intel.com>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>     Cc: Josh Triplett <josh@joshtriplett.org>
> =

> +------------------------------------------------------+------------+----=
--------+------------+
> |                                                      | dc15c60e39 | 52b=
265325b | 26f778d54b |
> +------------------------------------------------------+------------+----=
--------+------------+
> | boot_successes                                       | 64         | 0  =
        | 0          |
> | boot_failures                                        | 0          | 22 =
        | 19         |
> | WARNING:at_fs/sysfs/group.c:#internal_create_group() | 0          | 22 =
        | 19         |
> | BUG:unable_to_handle_kernel                          | 0          | 22 =
        | 19         |
> | Oops                                                 | 0          | 22 =
        | 19         |
> | EIP_is_at_strnlen                                    | 0          | 22 =
        | 19         |
> | Kernel_panic-not_syncing:Fatal_exception             | 0          | 22 =
        | 19         |
> | backtrace:sysfs_create_group                         | 0          | 22 =
        | 19         |
> | backtrace:ksysfs_init                                | 0          | 22 =
        | 19         |
> | backtrace:kernel_init_freeable                       | 0          | 22 =
        | 19         |
> +------------------------------------------------------+------------+----=
--------+------------+
> =

> [    0.234377] devtmpfs: initialized
> [    0.235931] evm: security.capability
> [    0.237252] ------------[ cut here ]------------
> [    0.238412] WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_cre=
ate_group+0x260/0x310()
> [    0.240802] BUG: unable to handle kernel paging request at 65746f6e
> [    0.243605] IP: [<ccc7c81e>] strnlen+0xe/0x20
> [    0.244880] *pdpt =3D 0000000000000000 *pde =3D 0000000000000000 =

> [    0.246438] Oops: 0000 [#1] =

> [    0.247385] Modules linked in:
> [    0.248350] CPU: 0 PID: 1 Comm: swapper Not tainted 4.4.0-rc2-00051-g5=
2b2653 #556
> [    0.250352] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    0.252457] task: d09113c0 ti: d0912000 task.ti: d0912000
> [    0.253937] EIP: 0060:[<ccc7c81e>] EFLAGS: 00010097 CPU: 0
> [    0.255315] EIP is at strnlen+0xe/0x20
> [    0.256294] EAX: 65746f6e EBX: cd14008a ECX: 65746f6e EDX: fffffffe
> [    0.257747] ESI: 65746f6e EDI: cd140460 EBP: d0913da4 ESP: d0913da4
> [    0.259263]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.260587] CR0: 8005003b CR2: 65746f6e CR3: 0d131000 CR4: 000006b0
> [    0.262039] Stack:
> [    0.262785]  d0913dbc ccc78e6f 0000ffff d0913ecc ccf7b650 cd14008a d09=
13e00 ccc7a9ce
> [    0.265589]  00000200 0000ffff 0000ffff cca7098d cd1429f0 00000000 cd1=
40080 000003e0
> [    0.268371]  00000002 cd140460 ff0a0004 ffffffff 000003e0 ffffffff 000=
00000 d0913e10
> [    0.271191] Call Trace:
> [    0.271965]  [<ccc78e6f>] string+0x2f/0xc0
> [    0.273172]  [<ccc7a9ce>] vsnprintf+0xfe/0x3c0
> [    0.274383]  [<cca7098d>] ? log_store+0x1cd/0x210
> [    0.275602]  [<ccc7aca6>] vscnprintf+0x16/0x40
> [    0.276713]  [<cca725c6>] vprintk_emit+0x86/0x4a0
> [    0.278052]  [<cca72a1d>] vprintk+0x3d/0x40
> [    0.279143]  [<cca3ff20>] warn_slowpath_common+0x70/0xb0
> [    0.280420]  [<ccb89f40>] ? internal_create_group+0x260/0x310
> [    0.281754]  [<ccb89f40>] ? internal_create_group+0x260/0x310
> [    0.283174]  [<cca3ff93>] warn_slowpath_fmt+0x33/0x40
> [    0.284444]  [<ccb89f40>] internal_create_group+0x260/0x310
> [    0.285876]  [<cd0a279d>] ? nsproxy_cache_init+0x27/0x27
> [    0.287216]  [<ccb8a001>] sysfs_create_group+0x11/0x20
> [    0.288380]  [<cd0a27c5>] ksysfs_init+0x28/0x78
> [    0.289740]  [<cca0046a>] do_one_initcall+0xaa/0x200
> [    0.291006]  [<cd0a279d>] ? nsproxy_cache_init+0x27/0x27
> [    0.292194]  [<cca58845>] ? parse_args+0x2d5/0x560
> [    0.293502]  [<cca5db71>] ? __might_sleep+0x31/0xa0
> [    0.294737]  [<cd093c01>] kernel_init_freeable+0xd4/0x156
> [    0.296059]  [<cce7edd0>] kernel_init+0x10/0xe0
> [    0.297194]  [<cca617b1>] ? schedule_tail+0x11/0x50
> [    0.298375]  [<cce83548>] ret_from_kernel_thread+0x20/0x34
> [    0.299676]  [<cce7edc0>] ? rest_init+0x70/0x70
> [    0.300815] Code: 57 3e 8d 74 26 00 85 c9 74 0b 89 c7 89 d0 f2 ae 75 0=
1 4f 89 f8 5f 5d c3 90 8d 74 26 00 55 89 e5 3e 8d 74 26 00 89 c1 89 c8 eb 0=
6 <80> 38 00 74 07 40 4a 83 fa ff 75 f4 29 c8 5d c3 90 90 55 89 e5
> [    0.311698] EIP: [<ccc7c81e>] strnlen+0xe/0x20 SS:ESP 0068:d0913da4
> [    0.313370] CR2: 0000000065746f6e
> [    0.314420] ---[ end trace 0f0a901c01afca19 ]---
> [    0.315635] Kernel panic - not syncing: Fatal exception
> =

> git bisect start 26f778d54b77dcc8d920bd99d3dc1a1882574d26 527e9316f8ec44b=
d53d90fb9f611fa7ffff52bb9 --
> git bisect  bad fb5507e6485822d3515182abb76eac44dceebda0  # 06:11      0-=
      2  Merge 'omap-dss2/for-next' into devel-catchup-201512080525
> git bisect  bad d6bd8a34099bfaac99d1f46fce2e613eae605072  # 06:14      0-=
      5  Merge 'block/for-linus' into devel-catchup-201512080525
> git bisect  bad a837181ceb64616bc06e5c1bf05ef85297616a07  # 06:18      0-=
      3  Merge 'wireless-testing/master' into devel-catchup-201512080525
> git bisect good e973bdc0e93cd5a593a465bab7f2c77a80c58cad  # 06:26     20+=
      0  0day base guard for 'devel-catchup-201512080525'
> git bisect  bad ad5872e578131c2779e49ae82794913c5a30de37  # 06:29      0-=
     14  Merge 'rcu/rcu/next' into devel-catchup-201512080525
> git bisect good 428ac14295ea49853afa136c9120cc6fb554a030  # 06:40     20+=
      0  list: Add lockless list traversal primitives
> git bisect good 3e42ec1aa716f10c68294b8492ae3ea684528699  # 06:45     22+=
      0  rcu: Allow expedited grace periods to be disabled at init
> git bisect good c979ff991764a2e620db0b1bfb0a105b9cf78b6a  # 06:51     21+=
      0  torture: Place console.log files correctly from the get-go
> git bisect good f84cfbb0ff269b427a0db591e22ac6948c554ab4  # 06:56     22+=
      0  Documentation/memory-barriers.txt: Fix ACCESS_ONCE thinko
> git bisect good 2f073848c3cc8aff2655ab7c46d8c0de90cf4e50  # 07:06     20+=
      0  list: Use WRITE_ONCE() when initializing list_head structures
> git bisect good 0485e1b35866693ff3ec975ca4c3c8ea8db63678  # 07:13     22+=
      0  rcutorture: Add checks for rcutorture writer starvation
> git bisect  bad 52b265325b7a7438cbcdd735fecdd9d7e255eb83  # 07:17      0-=
     22  rcu: Remove TINY_RCU bloat from pointless boot parameters
> git bisect good dc15c60e39a3092df845f9bfc29b9c40cc63934d  # 07:27     21+=
      0  rcutorture: Don't keep empty console.log.diags files
> # first bad commit: [52b265325b7a7438cbcdd735fecdd9d7e255eb83] rcu: Remov=
e TINY_RCU bloat from pointless boot parameters
> git bisect good dc15c60e39a3092df845f9bfc29b9c40cc63934d  # 07:38     62+=
      0  rcutorture: Don't keep empty console.log.diags files
> # extra tests with DEBUG_INFO
> git bisect  bad 52b265325b7a7438cbcdd735fecdd9d7e255eb83  # 07:42      0-=
      7  rcu: Remove TINY_RCU bloat from pointless boot parameters
> # extra tests on HEAD of linux-devel/devel-catchup-201512080525
> git bisect  bad 26f778d54b77dcc8d920bd99d3dc1a1882574d26  # 07:42      0-=
     19  0day head guard for 'devel-catchup-201512080525'
> # extra tests on tree/branch rcu/rcu/dev
> git bisect  bad 52b265325b7a7438cbcdd735fecdd9d7e255eb83  # 07:43      0-=
     22  rcu: Remove TINY_RCU bloat from pointless boot parameters
> # extra tests with first bad commit reverted
> git bisect good 519e251185e7783f97590d434141ec7da0efbfff  # 07:57     63+=
      0  Revert "rcu: Remove TINY_RCU bloat from pointless boot parameters"
> # extra tests on tree/branch linus/master
> git bisect good 62ea1ec5e17fe36e2c728bc534f9f78b216dfe83  # 08:12     65+=
      2  Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel=
/git/mst/vhost
> # extra tests on tree/branch linux-next/master
> git bisect good 47ca23615a59f1879e6a2d2fe63d130abdb5c810  # 08:21     63+=
      0  Add linux-next specific files for 20151207
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
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
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
> early console in decompress_kernel
> input_data: 0x01460079
> input_len: 0x003a180a
> output: 0x01000000
> output_len: 0x007f0dbc
> run_size: 0x0114494f
> KASLR using RDTSC...
> =

> Decompressing Linux... Parsing ELF... Performing relocations... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 4.4.0-rc2-00051-g52b2653 (kbuild(a)lkp-nex05=
) (gcc version 5.2.1 20150911 (Debian 5.2.1-17) ) #556 Tue Dec 8 07:15:49 C=
ST 2015
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
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Debian-1=
.8.2-1 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x1000000
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
> [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- =
UC  =

> [    0.000000] Scanning 1 areas for low memory corruption
> [    0.000000] initial memory mapped: [mem 0x00000000-0x0ddfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] BRK [0x0d98a000, 0x0d98afff] PGTABLE
> [    0.000000] BRK [0x0d98b000, 0x0d98bfff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x1139b000-0x12bdffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F63E0 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000012BE1737 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000012BE0C14 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000012BE0040 000BD4 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> [    0.000000] ACPI: SSDT 0x0000000012BE0C88 0009F7 (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000012BE167F 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000012BE16FF 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] 299MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 12be0000
> [    0.000000]   low ram: 0 - 12be0000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:1139a001, primary cpu clock
> [    0.000000] kvm-clock: using sched offset of 8277014023 cycles
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   Normal   [mem 0x0000000001000000-0x0000000012bdffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000012b=
dffff]
> [    0.000000] On node 0 totalpages: 76670
> [    0.000000]   DMA zone: 36 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 639 pages used for memmap
> [    0.000000]   Normal zone: 72672 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr d01cf40
> [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 75995
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled r=
cupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3Dtt=
yS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-=
tests/run-queue/kvm/i386-randconfig-n0-201549/linux-devel:devel-catchup-201=
512080525:52b265325b7a7438cbcdd735fecdd9d7e255eb83:bisect-linux-9/.vmlinuz-=
52b265325b7a7438cbcdd735fecdd9d7e255eb83-20151208071610-15-vp branch=3Dlinu=
x-devel/devel-catchup-201512080525 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-=
n0-201549/gcc-5/52b265325b7a7438cbcdd735fecdd9d7e255eb83/vmlinuz-4.4.0-rc2-=
00051-g52b2653 drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Memory: 260768K/306680K available (4626K kernel code, 557K=
 rwdata, 1536K rodata, 620K init, 8112K bss, 45912K reserved, 0K cma-reserv=
ed)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xfffe3000 - 0xfffff000   ( 112 kB)
> [    0.000000]     vmalloc : 0xd33e0000 - 0xfffe1000   ( 716 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd2be0000   ( 299 MB)
> [    0.000000]       .init : 0xcd093000 - 0xcd12e000   ( 620 kB)
> [    0.000000]       .data : 0xcce84ddf - 0xcd091740   (2098 kB)
> [    0.000000]       .text : 0xcca00000 - 0xcce84ddf   (4627 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd0816000 soft=3Dd0818000
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 4.4.0-rc2-00051-g52b2653 (kbuild(a)lkp-nex05=
) (gcc version 5.2.1 20150911 (Debian 5.2.1-17) ) #556 Tue Dec 8 07:15:49 C=
ST 2015
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
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS Debian-1=
.8.2-1 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x1000000
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
> [    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- =
UC  =

> [    0.000000] Scanning 1 areas for low memory corruption
> [    0.000000] initial memory mapped: [mem 0x00000000-0x0ddfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] BRK [0x0d98a000, 0x0d98afff] PGTABLE
> [    0.000000] BRK [0x0d98b000, 0x0d98bfff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x1139b000-0x12bdffff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F63E0 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000012BE1737 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000012BE0C14 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000012BE0040 000BD4 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> [    0.000000] ACPI: SSDT 0x0000000012BE0C88 0009F7 (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000012BE167F 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000012BE16FF 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] 299MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 12be0000
> [    0.000000]   low ram: 0 - 12be0000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:1139a001, primary cpu clock
> [    0.000000] kvm-clock: using sched offset of 8277014023 cycles
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   Normal   [mem 0x0000000001000000-0x0000000012bdffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000012b=
dffff]
> [    0.000000] On node 0 totalpages: 76670
> [    0.000000]   DMA zone: 36 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 639 pages used for memmap
> [    0.000000]   Normal zone: 72672 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr d01cf40
> [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 1910969940391419 ns
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 75995
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled r=
cupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3Dtt=
yS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-=
tests/run-queue/kvm/i386-randconfig-n0-201549/linux-devel:devel-catchup-201=
512080525:52b265325b7a7438cbcdd735fecdd9d7e255eb83:bisect-linux-9/.vmlinuz-=
52b265325b7a7438cbcdd735fecdd9d7e255eb83-20151208071610-15-vp branch=3Dlinu=
x-devel/devel-catchup-201512080525 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-=
n0-201549/gcc-5/52b265325b7a7438cbcdd735fecdd9d7e255eb83/vmlinuz-4.4.0-rc2-=
00051-g52b2653 drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Memory: 260768K/306680K available (4626K kernel code, 557K=
 rwdata, 1536K rodata, 620K init, 8112K bss, 45912K reserved, 0K cma-reserv=
ed)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xfffe3000 - 0xfffff000   ( 112 kB)
> [    0.000000]     vmalloc : 0xd33e0000 - 0xfffe1000   ( 716 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd2be0000   ( 299 MB)
> [    0.000000]       .init : 0xcd093000 - 0xcd12e000   ( 620 kB)
> [    0.000000]       .data : 0xcce84ddf - 0xcd091740   (2098 kB)
> [    0.000000]       .text : 0xcca00000 - 0xcce84ddf   (4627 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] NR_IRQS:16 nr_irqs:16 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd0816000 soft=3Dd0818000
> [    0.000000] Console: colour VGA+ 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] bootconsole [earlyser0] disabled
> [    0.000000] console [ttyS0] enabled
> [    0.000000] allocated 524288 bytes of page_ext
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.170218] Calibrating delay loop (skipped) preset value.. 5387.01 Bo=
goMIPS (lpj=3D2693508)
> [    0.172293] pid_max: default: 32768 minimum: 301
> [    0.173573] ACPI: Core revision 20150930
> [    0.176699] ACPI: 2 ACPI AML tables successfully acquired and loaded
> [    0.178496] ACPI: setting ELCR to 0200 (from 0c00)
> [    0.179711] Security Framework initialized
> [    0.180840] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.182450] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.184242] Initializing cgroup subsys memory
> [    0.185306] Initializing cgroup subsys freezer
> [    0.186366] Initializing cgroup subsys perf_event
> [    0.187439] Initializing cgroup subsys debug
> [    0.188556] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.189743] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.191078] CPU: Intel Common KVM processor (family: 0xf, model: 0x6, =
stepping: 0x1)
> [    0.200283] ftrace: allocating 19782 entries in 39 pages
> [    0.231249] Performance Events: unsupported Netburst CPU model 6 no PM=
U driver, software events only.
> [    0.234377] devtmpfs: initialized
> [    0.235931] evm: security.capability
> [    0.237252] ------------[ cut here ]------------
> [    0.238412] WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_cre=
ate_group+0x260/0x310()
> [    0.240802] BUG: unable to handle kernel paging request at 65746f6e
> [    0.243605] IP: [<ccc7c81e>] strnlen+0xe/0x20
> [    0.244880] *pdpt =3D 0000000000000000 *pde =3D 0000000000000000 =

> [    0.246438] Oops: 0000 [#1] =

> [    0.247385] Modules linked in:
> [    0.248350] CPU: 0 PID: 1 Comm: swapper Not tainted 4.4.0-rc2-00051-g5=
2b2653 #556
> [    0.250352] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    0.252457] task: d09113c0 ti: d0912000 task.ti: d0912000
> [    0.253937] EIP: 0060:[<ccc7c81e>] EFLAGS: 00010097 CPU: 0
> [    0.255315] EIP is at strnlen+0xe/0x20
> [    0.256294] EAX: 65746f6e EBX: cd14008a ECX: 65746f6e EDX: fffffffe
> [    0.257747] ESI: 65746f6e EDI: cd140460 EBP: d0913da4 ESP: d0913da4
> [    0.259263]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [    0.260587] CR0: 8005003b CR2: 65746f6e CR3: 0d131000 CR4: 000006b0
> [    0.262039] Stack:
> [    0.262785]  d0913dbc ccc78e6f 0000ffff d0913ecc ccf7b650 cd14008a d09=
13e00 ccc7a9ce
> [    0.265589]  00000200 0000ffff 0000ffff cca7098d cd1429f0 00000000 cd1=
40080 000003e0
> [    0.268371]  00000002 cd140460 ff0a0004 ffffffff 000003e0 ffffffff 000=
00000 d0913e10
> [    0.271191] Call Trace:
> [    0.271965]  [<ccc78e6f>] string+0x2f/0xc0
> [    0.273172]  [<ccc7a9ce>] vsnprintf+0xfe/0x3c0
> [    0.274383]  [<cca7098d>] ? log_store+0x1cd/0x210
> [    0.275602]  [<ccc7aca6>] vscnprintf+0x16/0x40
> [    0.276713]  [<cca725c6>] vprintk_emit+0x86/0x4a0
> [    0.278052]  [<cca72a1d>] vprintk+0x3d/0x40
> [    0.279143]  [<cca3ff20>] warn_slowpath_common+0x70/0xb0
> [    0.280420]  [<ccb89f40>] ? internal_create_group+0x260/0x310
> [    0.281754]  [<ccb89f40>] ? internal_create_group+0x260/0x310
> [    0.283174]  [<cca3ff93>] warn_slowpath_fmt+0x33/0x40
> [    0.284444]  [<ccb89f40>] internal_create_group+0x260/0x310
> [    0.285876]  [<cd0a279d>] ? nsproxy_cache_init+0x27/0x27
> [    0.287216]  [<ccb8a001>] sysfs_create_group+0x11/0x20
> [    0.288380]  [<cd0a27c5>] ksysfs_init+0x28/0x78
> [    0.289740]  [<cca0046a>] do_one_initcall+0xaa/0x200
> [    0.291006]  [<cd0a279d>] ? nsproxy_cache_init+0x27/0x27
> [    0.292194]  [<cca58845>] ? parse_args+0x2d5/0x560
> [    0.293502]  [<cca5db71>] ? __might_sleep+0x31/0xa0
> [    0.294737]  [<cd093c01>] kernel_init_freeable+0xd4/0x156
> [    0.296059]  [<cce7edd0>] kernel_init+0x10/0xe0
> [    0.297194]  [<cca617b1>] ? schedule_tail+0x11/0x50
> [    0.298375]  [<cce83548>] ret_from_kernel_thread+0x20/0x34
> [    0.299676]  [<cce7edc0>] ? rest_init+0x70/0x70
> [    0.300815] Code: 57 3e 8d 74 26 00 85 c9 74 0b 89 c7 89 d0 f2 ae 75 0=
1 4f 89 f8 5f 5d c3 90 8d 74 26 00 55 89 e5 3e 8d 74 26 00 89 c1 89 c8 eb 0=
6 <80> 38 00 74 07 40 4a 83 fa ff 75 f4 29 c8 5d c3 90 90 55 89 e5
> [    0.311698] EIP: [<ccc7c81e>] strnlen+0xe/0x20 SS:ESP 0068:d0913da4
> [    0.313370] CR2: 0000000065746f6e
> [    0.314420] ---[ end trace 0f0a901c01afca19 ]---
> [    0.315635] Kernel panic - not syncing: Fatal exception
> =

> Elapsed time: 10
> qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /pkg/linux/i386-randcon=
fig-n0-201549/gcc-5/52b265325b7a7438cbcdd735fecdd9d7e255eb83/vmlinuz-4.4.0-=
rc2-00051-g52b2653 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 =
systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rc=
u_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpa=
nic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200=
 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-=
queue/kvm/i386-randconfig-n0-201549/linux-devel:devel-catchup-201512080525:=
52b265325b7a7438cbcdd735fecdd9d7e255eb83:bisect-linux-9/.vmlinuz-52b265325b=
7a7438cbcdd735fecdd9d7e255eb83-20151208071610-15-vp branch=3Dlinux-devel/de=
vel-catchup-201512080525 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-n0-201549/=
gcc-5/52b265325b7a7438cbcdd735fecdd9d7e255eb83/vmlinuz-4.4.0-rc2-00051-g52b=
2653 drbd.minor_count=3D8'  -initrd /osimage/quantal/quantal-core-i386.cgz =
-m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot orde=
r=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive file=3D/f=
s/sdh1/disk0-quantal-vp-15,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/=
disk1-quantal-vp-15,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk2-q=
uantal-vp-15,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk3-quantal-=
vp-15,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk4-quantal-vp-15,m=
edia=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdh1/disk5-quantal-vp-15,media=3D=
disk,if=3Dvirtio -drive file=3D/fs/sdh1/disk6-quantal-vp-15,media=3Ddisk,if=
=3Dvirtio -pidfile /dev/shm/kboot/pid-quantal-vp-15 -serial file:/dev/shm/k=
boot/serial-quantal-vp-15 -daemonize -display none -monitor null =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 4.4.0-rc2 Kernel Configuration
> #
> # CONFIG_64BIT is not set
> CONFIG_X86_32=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
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
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D3
> CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> =

> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=3Dy
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
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
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
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> # CONFIG_TASKS_RCU is not set
> # CONFIG_RCU_STALL_COMMON is not set
> # CONFIG_TREE_RCU_TRACE is not set
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CPUSETS is not set
> # CONFIG_CGROUP_CPUACCT is not set
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> # CONFIG_MEMCG_KMEM is not set
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_BLK_CGROUP is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> CONFIG_USER_NS=3Dy
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
> CONFIG_BPF=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
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
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> CONFIG_MEMBARRIER=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
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
> # CONFIG_SYSTEM_DATA_VERIFICATION is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_KPROBES is not set
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
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
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
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
> CONFIG_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> CONFIG_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR_NONE is not set
> CONFIG_CC_STACKPROTECTOR_REGULAR=3Dy
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULES=3Dy
> # CONFIG_MODULE_FORCE_LOAD is not set
> # CONFIG_MODULE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> # CONFIG_MODULE_SIG is not set
> CONFIG_MODULE_COMPRESS=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> CONFIG_MODULE_COMPRESS_XZ=3Dy
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_LBDAF=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> # CONFIG_BLK_DEV_INTEGRITY is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
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
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dm
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_NOOP=3Dy
> CONFIG_DEFAULT_IOSCHED=3D"noop"
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> # CONFIG_SMP is not set
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> # CONFIG_X86_RDC321X is not set
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> CONFIG_M686=3Dy
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
> CONFIG_X86_GENERIC=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> # CONFIG_X86_PPRO_FENCE is not set
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_DMI=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D1
> CONFIG_PREEMPT_NONE=3Dy
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_X86_UP_APIC is not set
> # CONFIG_X86_MCE is not set
> CONFIG_X86_LEGACY_VM86=3Dy
> CONFIG_VM86=3Dy
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> # CONFIG_TOSHIBA is not set
> CONFIG_I8K=3Dm
> CONFIG_X86_REBOOTFIXUPS=3Dy
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dm
> CONFIG_NOHIGHMEM=3Dy
> # CONFIG_HIGHMEM4G is not set
> # CONFIG_HIGHMEM64G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_X86_PAE=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
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
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_PGTABLE_MAPPING=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dm
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=3Dy
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MATH_EMULATION is not set
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_X86_INTEL_MPX is not set
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_RANDOMIZE_BASE_MAX_OFFSET=3D0x20000000
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_IPMI is not set
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> # CONFIG_ACPI_DEBUG is not set
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_ACPI_CONTAINER is not set
> # CONFIG_ACPI_SBS is not set
> # CONFIG_ACPI_HED is not set
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> # CONFIG_ACPI_NFIT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
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
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
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
> CONFIG_PCI_GOANY=3Dy
> CONFIG_PCI_BIOS=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> # CONFIG_PCI_PASID is not set
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> CONFIG_EISA=3Dy
> CONFIG_EISA_VLB_PRIMING=3Dy
> CONFIG_EISA_PCI_EISA=3Dy
> CONFIG_EISA_VIRTUAL_ROOT=3Dy
> CONFIG_EISA_NAMES=3Dy
> CONFIG_SCx200=3Dm
> CONFIG_SCx200HR_TIMER=3Dm
> # CONFIG_ALIX is not set
> CONFIG_NET5501=3Dy
> CONFIG_GEOS=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dm
> CONFIG_PCMCIA=3Dm
> # CONFIG_PCMCIA_LOAD_CIS is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> # CONFIG_I82092 is not set
> # CONFIG_I82365 is not set
> # CONFIG_TCIC is not set
> CONFIG_PCMCIA_PROBE=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> CONFIG_BINFMT_AOUT=3Dy
> CONFIG_BINFMT_MISC=3Dy
> CONFIG_COREDUMP=3Dy
> CONFIG_HAVE_ATOMIC_IOMAP=3Dy
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
> # CONFIG_DNS_RESOLVER is not set
> # CONFIG_BATMAN_ADV is not set
> # CONFIG_VSOCKETS is not set
> # CONFIG_NETLINK_MMAP is not set
> # CONFIG_NETLINK_DIAG is not set
> # CONFIG_MPLS is not set
> # CONFIG_HSR is not set
> # CONFIG_CGROUP_NET_PRIO is not set
> # CONFIG_CGROUP_NET_CLASSID is not set
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
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
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> # CONFIG_WIMAX is not set
> # CONFIG_RFKILL is not set
> # CONFIG_RFKILL_REGULATOR is not set
> # CONFIG_NET_9P is not set
> # CONFIG_CAIF is not set
> # CONFIG_NFC is not set
> # CONFIG_LWTUNNEL is not set
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
> # CONFIG_STANDALONE is not set
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
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
> # CONFIG_FENCE_TRACE is not set
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_ISAPNP=3Dy
> CONFIG_PNPBIOS=3Dy
> CONFIG_PNPBIOS_PROC_FS=3Dy
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> # CONFIG_BLK_DEV_NULL_BLK is not set
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> CONFIG_BLK_DEV_CRYPTOLOOP=3Dm
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dy
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D4096
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> # CONFIG_BLK_DEV_NVME is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dm
> # CONFIG_ISL29003 is not set
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dm
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> # CONFIG_PCH_PHUB is not set
> CONFIG_USB_SWITCH_FSA9480=3Dy
> # CONFIG_SRAM is not set
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dm
> # CONFIG_EEPROM_LEGACY is not set
> # CONFIG_EEPROM_MAX6875 is not set
> # CONFIG_EEPROM_93CX6 is not set
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
> CONFIG_ALTERA_STAPL=3Dy
> # CONFIG_INTEL_MEI is not set
> # CONFIG_INTEL_MEI_ME is not set
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> =

> #
> # SCIF Bus Driver
> #
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
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_KERNEL_API is not set
> # CONFIG_CXL_EEH is not set
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
> # CONFIG_SCSI_MQ_DEFAULT is not set
> # CONFIG_SCSI_PROC_FS is not set
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dy
> CONFIG_CHR_DEV_ST=3Dm
> # CONFIG_CHR_DEV_OSST is not set
> # CONFIG_BLK_DEV_SR is not set
> # CONFIG_CHR_DEV_SG is not set
> CONFIG_CHR_DEV_SCH=3Dm
> # CONFIG_SCSI_CONSTANTS is not set
> CONFIG_SCSI_LOGGING=3Dy
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
> # CONFIG_SCSI_SAS_ATA is not set
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=3Dy
> # CONFIG_SCSI_LOWLEVEL is not set
> CONFIG_SCSI_LOWLEVEL_PCMCIA=3Dy
> # CONFIG_PCMCIA_AHA152X is not set
> CONFIG_PCMCIA_FDOMAIN=3Dm
> CONFIG_PCMCIA_NINJA_SCSI=3Dm
> CONFIG_PCMCIA_QLOGIC=3Dm
> CONFIG_PCMCIA_SYM53C500=3Dm
> # CONFIG_SCSI_DH is not set
> # CONFIG_SCSI_OSD_INITIATOR is not set
> CONFIG_ATA=3Dm
> # CONFIG_ATA_NONSTANDARD is not set
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> # CONFIG_SATA_AHCI_PLATFORM is not set
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> # CONFIG_ATA_SFF is not set
> # CONFIG_MD is not set
> # CONFIG_TARGET_CORE is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> # CONFIG_FIREWIRE_NOSY is not set
> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> # CONFIG_NETDEVICES is not set
> # CONFIG_VHOST_NET is not set
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> CONFIG_NVM=3Dy
> # CONFIG_NVM_DEBUG is not set
> CONFIG_NVM_GENNVM=3Dm
> # CONFIG_NVM_RRPC is not set
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
> CONFIG_INPUT_MOUSEDEV=3Dm
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=3Dm
> CONFIG_INPUT_EVBUG=3Dm
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADP5520=3Dm
> CONFIG_KEYBOARD_ADP5588=3Dm
> CONFIG_KEYBOARD_ADP5589=3Dm
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dm
> CONFIG_KEYBOARD_QT2160=3Dm
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> CONFIG_KEYBOARD_TCA8418=3Dy
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=3Dm
> CONFIG_KEYBOARD_LM8333=3Dm
> # CONFIG_KEYBOARD_MAX7359 is not set
> CONFIG_KEYBOARD_MCS=3Dy
> CONFIG_KEYBOARD_MPR121=3Dm
> CONFIG_KEYBOARD_NEWTON=3Dm
> # CONFIG_KEYBOARD_OPENCORES is not set
> CONFIG_KEYBOARD_STOWAWAY=3Dm
> CONFIG_KEYBOARD_SUNKBD=3Dm
> CONFIG_KEYBOARD_XTKBD=3Dm
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dm
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> CONFIG_MOUSE_PS2_TOUCHKIT=3Dy
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> # CONFIG_MOUSE_PS2_VMMOUSE is not set
> CONFIG_MOUSE_SERIAL=3Dy
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> # CONFIG_MOUSE_ELAN_I2C is not set
> CONFIG_MOUSE_INPORT=3Dy
> # CONFIG_MOUSE_ATIXL is not set
> # CONFIG_MOUSE_LOGIBM is not set
> CONFIG_MOUSE_PC110PAD=3Dm
> # CONFIG_MOUSE_VSXXXAA is not set
> CONFIG_MOUSE_GPIO=3Dm
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dm
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
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dy
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=3Dy
> # CONFIG_GAMEPORT_NS558 is not set
> CONFIG_GAMEPORT_L4=3Dm
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
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> CONFIG_LEGACY_PTYS=3Dy
> CONFIG_LEGACY_PTY_COUNT=3D256
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_SINK is not set
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
> CONFIG_SERIAL_8250_CS=3Dm
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_FSL is not set
> CONFIG_SERIAL_8250_DW=3Dm
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_FINTEK=3Dm
> # CONFIG_SERIAL_8250_MID is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_UARTLITE=3Dm
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> CONFIG_SERIAL_TIMBERDALE=3Dm
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> CONFIG_SERIAL_ALTERA_UART=3Dm
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> # CONFIG_SERIAL_PCH_UART is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_VIRTIO_CONSOLE is not set
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dm
> # CONFIG_IPMI_SI_PROBE_DEFAULTS is not set
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> # CONFIG_HW_RANDOM is not set
> # CONFIG_NVRAM is not set
> CONFIG_DTLK=3Dm
> CONFIG_R3964=3Dm
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dm
> CONFIG_CARDMAN_4040=3Dm
> CONFIG_MWAVE=3Dm
> # CONFIG_SCx200_GPIO is not set
> # CONFIG_PC8736x_GPIO is not set
> # CONFIG_NSC_GPIO is not set
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dm
> # CONFIG_TCG_TIS is not set
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> CONFIG_TCG_INFINEON=3Dm
> # CONFIG_TCG_CRB is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> CONFIG_TELCLOCK=3Dm
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
> # CONFIG_I2C_CHARDEV is not set
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=3Dm
> CONFIG_I2C_MUX_PCA9541=3Dm
> CONFIG_I2C_MUX_PCA954x=3Dm
> CONFIG_I2C_MUX_REG=3Dm
> CONFIG_I2C_HELPER_AUTO=3Dy
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
> CONFIG_I2C_CBUS_GPIO=3Dm
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dm
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dm
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT_LIGHT is not set
> CONFIG_I2C_TAOS_EVM=3Dy
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_ELEKTOR=3Dy
> # CONFIG_I2C_PCA_ISA is not set
> # CONFIG_SCx200_ACB is not set
> CONFIG_I2C_STUB=3Dm
> CONFIG_I2C_SLAVE=3Dy
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
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
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_AMDPT is not set
> CONFIG_GPIO_DWAPB=3Dm
> CONFIG_GPIO_GENERIC_PLATFORM=3Dm
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> # CONFIG_GPIO_VX855 is not set
> CONFIG_GPIO_ZX=3Dy
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_104_IDIO_16 is not set
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_IT87=3Dy
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dm
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dm
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dy
> CONFIG_GPIO_SX150X=3Dy
> =

> #
> # MFD GPIO expanders
> #
> CONFIG_GPIO_ADP5520=3Dm
> CONFIG_GPIO_ARIZONA=3Dm
> # CONFIG_GPIO_DA9055 is not set
> # CONFIG_GPIO_KEMPLD is not set
> CONFIG_GPIO_LP3943=3Dm
> CONFIG_GPIO_PALMAS=3Dy
> CONFIG_GPIO_RC5T583=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TWL6040=3Dy
> # CONFIG_GPIO_WM831X is not set
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_INTEL_MID is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCH is not set
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI or I2C GPIO expanders
> #
> # CONFIG_GPIO_MCP23S08 is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> # CONFIG_W1_MASTER_DS2482 is not set
> CONFIG_W1_MASTER_DS1WM=3Dm
> CONFIG_W1_MASTER_GPIO=3Dm
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dm
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> # CONFIG_W1_SLAVE_DS28E04 is not set
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_PDA_POWER is not set
> CONFIG_GENERIC_ADC_BATTERY=3Dm
> CONFIG_WM831X_BACKUP=3Dm
> # CONFIG_WM831X_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_BATTERY_88PM860X is not set
> CONFIG_BATTERY_DS2760=3Dm
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dm
> CONFIG_BATTERY_DS2782=3Dy
> # CONFIG_BATTERY_SBS is not set
> CONFIG_BATTERY_BQ27XXX=3Dy
> CONFIG_BATTERY_BQ27XXX_I2C=3Dy
> # CONFIG_BATTERY_BQ27XXX_PLATFORM is not set
> CONFIG_CHARGER_DA9150=3Dm
> # CONFIG_BATTERY_DA9150 is not set
> CONFIG_BATTERY_MAX17040=3Dy
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dm
> CONFIG_CHARGER_MANAGER=3Dy
> # CONFIG_CHARGER_MAX77693 is not set
> CONFIG_CHARGER_MAX8997=3Dm
> CONFIG_CHARGER_BQ2415X=3Dm
> CONFIG_CHARGER_BQ24190=3Dm
> CONFIG_CHARGER_BQ24257=3Dy
> # CONFIG_CHARGER_BQ24735 is not set
> CONFIG_CHARGER_BQ25890=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65090=3Dy
> # CONFIG_CHARGER_TPS65217 is not set
> CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> # CONFIG_BATTERY_RT5033 is not set
> CONFIG_CHARGER_RT9455=3Dy
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
> CONFIG_SENSORS_ABITUGURU3=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dm
> # CONFIG_SENSORS_ADM1021 is not set
> CONFIG_SENSORS_ADM1025=3Dy
> # CONFIG_SENSORS_ADM1026 is not set
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dm
> # CONFIG_SENSORS_ADT7410 is not set
> # CONFIG_SENSORS_ADT7411 is not set
> CONFIG_SENSORS_ADT7462=3Dy
> CONFIG_SENSORS_ADT7470=3Dm
> # CONFIG_SENSORS_ADT7475 is not set
> # CONFIG_SENSORS_ASC7621 is not set
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> # CONFIG_SENSORS_ASB100 is not set
> # CONFIG_SENSORS_ATXP1 is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> # CONFIG_SENSORS_DA9055 is not set
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> # CONFIG_SENSORS_F71882FG is not set
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=3Dm
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_IBMAEM is not set
> CONFIG_SENSORS_IBMPEX=3Dm
> # CONFIG_SENSORS_IIO_HWMON is not set
> # CONFIG_SENSORS_I5500 is not set
> # CONFIG_SENSORS_CORETEMP is not set
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> CONFIG_SENSORS_POWR1220=3Dm
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dm
> CONFIG_SENSORS_LTC4151=3Dy
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dm
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX16065=3Dy
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dm
> # CONFIG_SENSORS_MAX197 is not set
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> CONFIG_SENSORS_MAX31790=3Dm
> CONFIG_SENSORS_HTU21=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dy
> # CONFIG_SENSORS_LM77 is not set
> CONFIG_SENSORS_LM78=3Dm
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dy
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dm
> # CONFIG_SENSORS_NTC_THERMISTOR is not set
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NCT7904=3Dm
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dy
> # CONFIG_SENSORS_PMBUS is not set
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dy
> CONFIG_SENSORS_LTC2978_REGULATOR=3Dy
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX20751=3Dy
> CONFIG_SENSORS_MAX34440=3Dm
> CONFIG_SENSORS_MAX8688=3Dm
> CONFIG_SENSORS_TPS40422=3Dm
> CONFIG_SENSORS_UCD9000=3Dy
> # CONFIG_SENSORS_UCD9200 is not set
> # CONFIG_SENSORS_ZL6100 is not set
> # CONFIG_SENSORS_SHT15 is not set
> # CONFIG_SENSORS_SHT21 is not set
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dy
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dy
> CONFIG_SENSORS_TMP102=3Dm
> CONFIG_SENSORS_TMP103=3Dy
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dy
> # CONFIG_SENSORS_VIA_CPUTEMP is not set
> # CONFIG_SENSORS_VIA686A is not set
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> CONFIG_SENSORS_W83791D=3Dy
> # CONFIG_SENSORS_W83792D is not set
> # CONFIG_SENSORS_W83793 is not set
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=3Dy
> # CONFIG_SENSORS_WM831X is not set
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> CONFIG_THERMAL_HWMON=3Dy
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_GOV_BANG_BANG is not set
> # CONFIG_THERMAL_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INTEL_POWERCLAMP is not set
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> # CONFIG_INT340X_THERMAL is not set
> # CONFIG_INTEL_PCH_THERMAL is not set
> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_DA9055_WATCHDOG=3Dm
> # CONFIG_WM831X_WATCHDOG is not set
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> CONFIG_DW_WATCHDOG=3Dm
> CONFIG_RN5T618_WATCHDOG=3Dm
> CONFIG_MAX63XX_WATCHDOG=3Dm
> CONFIG_RETU_WATCHDOG=3Dm
> # CONFIG_ACQUIRE_WDT is not set
> CONFIG_ADVANTECH_WDT=3Dm
> # CONFIG_ALIM1535_WDT is not set
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> # CONFIG_IB700_WDT is not set
> # CONFIG_IBMASR is not set
> CONFIG_WAFER_WDT=3Dm
> # CONFIG_I6300ESB_WDT is not set
> # CONFIG_IE6XX_WDT is not set
> # CONFIG_ITCO_WDT is not set
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dm
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_KEMPLD_WDT=3Dm
> CONFIG_SC1200_WDT=3Dy
> # CONFIG_SCx200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> # CONFIG_NV_TCO is not set
> CONFIG_60XX_WDT=3Dy
> CONFIG_SBC8360_WDT=3Dy
> CONFIG_SBC7240_WDT=3Dm
> CONFIG_CPU5_WDT=3Dy
> # CONFIG_SMSC_SCH311X_WDT is not set
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_VIA_WDT is not set
> # CONFIG_W83627HF_WDT is not set
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dy
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_BCM7038_WDT=3Dm
> CONFIG_MEN_A21_WDT=3Dy
> =

> #
> # ISA-based Watchdog Cards
> #
> CONFIG_PCWATCHDOG=3Dm
> CONFIG_MIXCOMWD=3Dm
> # CONFIG_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
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
> CONFIG_SSB_HOST_SOC=3Dy
> # CONFIG_SSB_DEBUG is not set
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> # CONFIG_SSB_DRIVER_PCICORE is not set
> # CONFIG_SSB_DRIVER_GPIO is not set
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
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_CS5535 is not set
> CONFIG_MFD_AS3711=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> CONFIG_MFD_AAT2870_CORE=3Dy
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_AXP20X is not set
> # CONFIG_MFD_CROS_EC is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dm
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_MFD_INTEL_LPSS_ACPI is not set
> # CONFIG_MFD_INTEL_LPSS_PCI is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dm
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dm
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77693=3Dy
> CONFIG_MFD_MAX77843=3Dy
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_RETU=3Dm
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> CONFIG_MFD_RT5033=3Dy
> CONFIG_MFD_RC5T583=3Dy
> CONFIG_MFD_RN5T618=3Dm
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=3Dy
> CONFIG_AB3100_CORE=3Dy
> CONFIG_AB3100_OTP=3Dm
> # CONFIG_MFD_SYSCON is not set
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dm
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dm
> CONFIG_MFD_LM3533=3Dm
> # CONFIG_MFD_TIMBERDALE is not set
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dm
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8998 is not set
> CONFIG_MFD_WM8400=3Dy
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> # CONFIG_MFD_WM8350_I2C is not set
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> # CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
> CONFIG_REGULATOR_88PM8607=3Dm
> # CONFIG_REGULATOR_ACT8865 is not set
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_AAT2870=3Dy
> CONFIG_REGULATOR_AB3100=3Dy
> # CONFIG_REGULATOR_AS3711 is not set
> # CONFIG_REGULATOR_BCM590XX is not set
> # CONFIG_REGULATOR_DA9055 is not set
> # CONFIG_REGULATOR_DA9210 is not set
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LP3971=3Dy
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dm
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LTC3589=3Dm
> CONFIG_REGULATOR_MAX1586=3Dm
> # CONFIG_REGULATOR_MAX8649 is not set
> CONFIG_REGULATOR_MAX8660=3Dy
> CONFIG_REGULATOR_MAX8907=3Dm
> CONFIG_REGULATOR_MAX8952=3Dm
> # CONFIG_REGULATOR_MAX8973 is not set
> CONFIG_REGULATOR_MAX8997=3Dy
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MAX77693 is not set
> # CONFIG_REGULATOR_MC13783 is not set
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_MT6311 is not set
> CONFIG_REGULATOR_PALMAS=3Dm
> CONFIG_REGULATOR_PFUZE100=3Dm
> CONFIG_REGULATOR_RC5T583=3Dy
> # CONFIG_REGULATOR_RN5T618 is not set
> # CONFIG_REGULATOR_RT5033 is not set
> CONFIG_REGULATOR_TPS51632=3Dm
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dm
> CONFIG_REGULATOR_TPS65090=3Dy
> CONFIG_REGULATOR_TPS65217=3Dm
> # CONFIG_REGULATOR_TPS65910 is not set
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8400=3Dy
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_MEDIA_SUPPORT=3Dy
> =

> #
> # Multimedia core support
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> # CONFIG_MEDIA_SDR_SUPPORT is not set
> CONFIG_MEDIA_RC_SUPPORT=3Dy
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_VIDEO_DEV=3Dy
> # CONFIG_VIDEO_V4L2_SUBDEV_API is not set
> CONFIG_VIDEO_V4L2=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> CONFIG_DVB_CORE=3Dy
> # CONFIG_TTPCI_EEPROM is not set
> CONFIG_DVB_MAX_ADAPTERS=3D8
> # CONFIG_DVB_DYNAMIC_MINORS is not set
> =

> #
> # Media drivers
> #
> CONFIG_RC_CORE=3Dy
> CONFIG_RC_MAP=3Dy
> # CONFIG_RC_DECODERS is not set
> # CONFIG_RC_DEVICES is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> CONFIG_DVB_PLATFORM_DRIVERS=3Dy
> =

> #
> # Supported MMC/SDIO adapters
> #
> CONFIG_RADIO_ADAPTERS=3Dy
> CONFIG_RADIO_TEA575X=3Dy
> # CONFIG_RADIO_SI470X is not set
> CONFIG_RADIO_SI4713=3Dy
> CONFIG_PLATFORM_SI4713=3Dy
> CONFIG_I2C_SI4713=3Dy
> # CONFIG_RADIO_MAXIRADIO is not set
> CONFIG_RADIO_TEA5764=3Dy
> # CONFIG_RADIO_TEA5764_XTAL is not set
> CONFIG_RADIO_SAA7706H=3Dy
> CONFIG_RADIO_TEF6862=3Dy
> # CONFIG_RADIO_WL1273 is not set
> =

> #
> # Texas Instruments WL128x FM driver (ST based)
> #
> CONFIG_V4L_RADIO_ISA_DRIVERS=3Dy
> CONFIG_RADIO_ISA=3Dy
> CONFIG_RADIO_CADET=3Dy
> CONFIG_RADIO_RTRACK=3Dm
> CONFIG_RADIO_RTRACK2=3Dy
> CONFIG_RADIO_RTRACK2_PORT=3D30c
> CONFIG_RADIO_AZTECH=3Dy
> CONFIG_RADIO_AZTECH_PORT=3D350
> # CONFIG_RADIO_GEMTEK is not set
> CONFIG_RADIO_MIROPCM20=3Dm
> # CONFIG_RADIO_SF16FMI is not set
> CONFIG_RADIO_SF16FMR2=3Dy
> CONFIG_RADIO_TERRATEC=3Dy
> CONFIG_RADIO_TRUST=3Dy
> CONFIG_RADIO_TRUST_PORT=3D350
> # CONFIG_RADIO_TYPHOON is not set
> CONFIG_RADIO_ZOLTRIX=3Dy
> CONFIG_RADIO_ZOLTRIX_PORT=3D20c
> =

> #
> # Media ancillary drivers (tuners, sensors, i2c, frontends)
> #
> CONFIG_MEDIA_SUBDRV_AUTOSELECT=3Dy
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dy
> =

> #
> # Audio decoders, processors and mixers
> #
> =

> #
> # RDS decoders
> #
> =

> #
> # Video decoders
> #
> =

> #
> # Video and audio decoders
> #
> =

> #
> # Video encoders
> #
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
> CONFIG_MEDIA_TUNER_MT20XX=3Dy
> CONFIG_MEDIA_TUNER_XC2028=3Dy
> CONFIG_MEDIA_TUNER_XC5000=3Dy
> CONFIG_MEDIA_TUNER_XC4000=3Dy
> CONFIG_MEDIA_TUNER_MC44S803=3Dy
> =

> #
> # Multistandard (satellite) frontends
> #
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> =

> #
> # DVB-S (satellite) frontends
> #
> =

> #
> # DVB-T (terrestrial) frontends
> #
> # CONFIG_DVB_AS102_FE is not set
> =

> #
> # DVB-C (cable) frontends
> #
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> =

> #
> # SEC control devices for DVB-S
> #
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
> CONFIG_DRM=3Dm
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_ADV7511=3Dm
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_VGEM=3Dm
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dm
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> # CONFIG_FB_DDC is not set
> # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> CONFIG_FB_CFB_FILLRECT=3Dm
> CONFIG_FB_CFB_COPYAREA=3Dm
> CONFIG_FB_CFB_IMAGEBLIT=3Dm
> # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
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
> CONFIG_FB_ARC=3Dm
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_N411 is not set
> CONFIG_FB_HGA=3Dm
> CONFIG_FB_OPENCORES=3Dm
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
> # CONFIG_FB_GEODE is not set
> CONFIG_FB_SM501=3Dm
> CONFIG_FB_IBM_GXT4500=3Dm
> CONFIG_FB_VIRTUAL=3Dm
> CONFIG_FB_METRONOME=3Dm
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=3Dm
> CONFIG_FB_AUO_K190X=3Dm
> CONFIG_FB_AUO_K1900=3Dm
> # CONFIG_FB_AUO_K1901 is not set
> # CONFIG_FB_SM712 is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> CONFIG_BACKLIGHT_LM3533=3Dm
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_PM8941_WLED=3Dy
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dm
> CONFIG_BACKLIGHT_ADP5520=3Dm
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dm
> CONFIG_BACKLIGHT_88PM860X=3Dm
> # CONFIG_BACKLIGHT_AAT2870 is not set
> CONFIG_BACKLIGHT_LM3639=3Dm
> CONFIG_BACKLIGHT_TPS65217=3Dy
> # CONFIG_BACKLIGHT_AS3711 is not set
> CONFIG_BACKLIGHT_GPIO=3Dm
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> # CONFIG_VGACON_SOFT_SCROLLBACK is not set
> # CONFIG_MDA_CONSOLE is not set
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dm
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> CONFIG_LOGO=3Dy
> CONFIG_LOGO_LINUX_MONO=3Dy
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> CONFIG_SOUND=3Dm
> CONFIG_SOUND_OSS_CORE=3Dy
> # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> CONFIG_SND=3Dm
> CONFIG_SND_TIMER=3Dm
> CONFIG_SND_PCM=3Dm
> CONFIG_SND_HWDEP=3Dm
> CONFIG_SND_RAWMIDI=3Dm
> # CONFIG_SND_SEQUENCER is not set
> # CONFIG_SND_MIXER_OSS is not set
> # CONFIG_SND_PCM_OSS is not set
> CONFIG_SND_PCM_TIMER=3Dy
> CONFIG_SND_HRTIMER=3Dm
> # CONFIG_SND_DYNAMIC_MINORS is not set
> CONFIG_SND_SUPPORT_OLD_API=3Dy
> CONFIG_SND_PROC_FS=3Dy
> # CONFIG_SND_VERBOSE_PROCFS is not set
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_DMA_SGBUF=3Dy
> # CONFIG_SND_RAWMIDI_SEQ is not set
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> # CONFIG_SND_SBAWE_SEQ is not set
> # CONFIG_SND_EMU10K1_SEQ is not set
> CONFIG_SND_MPU401_UART=3Dm
> CONFIG_SND_OPL3_LIB=3Dm
> CONFIG_SND_OPL4_LIB=3Dm
> # CONFIG_SND_DRIVERS is not set
> CONFIG_SND_WSS_LIB=3Dm
> CONFIG_SND_SB_COMMON=3Dm
> CONFIG_SND_SB8_DSP=3Dm
> CONFIG_SND_SB16_DSP=3Dm
> CONFIG_SND_ISA=3Dy
> CONFIG_SND_ADLIB=3Dm
> # CONFIG_SND_AD1816A is not set
> CONFIG_SND_AD1848=3Dm
> CONFIG_SND_ALS100=3Dm
> CONFIG_SND_AZT1605=3Dm
> CONFIG_SND_AZT2316=3Dm
> CONFIG_SND_AZT2320=3Dm
> # CONFIG_SND_CMI8328 is not set
> CONFIG_SND_CMI8330=3Dm
> CONFIG_SND_CS4231=3Dm
> CONFIG_SND_CS4236=3Dm
> CONFIG_SND_ES1688=3Dm
> CONFIG_SND_ES18XX=3Dm
> CONFIG_SND_SC6000=3Dm
> CONFIG_SND_GUSCLASSIC=3Dm
> # CONFIG_SND_GUSEXTREME is not set
> # CONFIG_SND_GUSMAX is not set
> # CONFIG_SND_INTERWAVE is not set
> CONFIG_SND_INTERWAVE_STB=3Dm
> CONFIG_SND_JAZZ16=3Dm
> CONFIG_SND_OPL3SA2=3Dm
> # CONFIG_SND_OPTI92X_AD1848 is not set
> # CONFIG_SND_OPTI92X_CS4231 is not set
> # CONFIG_SND_OPTI93X is not set
> CONFIG_SND_MIRO=3Dm
> # CONFIG_SND_SB8 is not set
> # CONFIG_SND_SB16 is not set
> CONFIG_SND_SBAWE=3Dm
> CONFIG_SND_SB16_CSP=3Dy
> CONFIG_SND_SSCAPE=3Dm
> CONFIG_SND_WAVEFRONT=3Dm
> CONFIG_SND_MSND_PINNACLE=3Dm
> # CONFIG_SND_MSND_CLASSIC is not set
> CONFIG_SND_PCI=3Dy
> # CONFIG_SND_AD1889 is not set
> # CONFIG_SND_ALS300 is not set
> # CONFIG_SND_ALS4000 is not set
> # CONFIG_SND_ALI5451 is not set
> # CONFIG_SND_ASIHPI is not set
> # CONFIG_SND_ATIIXP is not set
> # CONFIG_SND_ATIIXP_MODEM is not set
> # CONFIG_SND_AU8810 is not set
> # CONFIG_SND_AU8820 is not set
> # CONFIG_SND_AU8830 is not set
> # CONFIG_SND_AW2 is not set
> # CONFIG_SND_AZT3328 is not set
> # CONFIG_SND_BT87X is not set
> # CONFIG_SND_CA0106 is not set
> # CONFIG_SND_CMIPCI is not set
> # CONFIG_SND_OXYGEN is not set
> # CONFIG_SND_CS4281 is not set
> # CONFIG_SND_CS46XX is not set
> # CONFIG_SND_CS5530 is not set
> # CONFIG_SND_CS5535AUDIO is not set
> # CONFIG_SND_CTXFI is not set
> # CONFIG_SND_DARLA20 is not set
> # CONFIG_SND_GINA20 is not set
> # CONFIG_SND_LAYLA20 is not set
> # CONFIG_SND_DARLA24 is not set
> # CONFIG_SND_GINA24 is not set
> # CONFIG_SND_LAYLA24 is not set
> # CONFIG_SND_MONA is not set
> # CONFIG_SND_MIA is not set
> # CONFIG_SND_ECHO3G is not set
> # CONFIG_SND_INDIGO is not set
> # CONFIG_SND_INDIGOIO is not set
> # CONFIG_SND_INDIGODJ is not set
> # CONFIG_SND_INDIGOIOX is not set
> # CONFIG_SND_INDIGODJX is not set
> # CONFIG_SND_EMU10K1 is not set
> # CONFIG_SND_EMU10K1X is not set
> # CONFIG_SND_ENS1370 is not set
> # CONFIG_SND_ENS1371 is not set
> # CONFIG_SND_ES1938 is not set
> # CONFIG_SND_ES1968 is not set
> # CONFIG_SND_FM801 is not set
> # CONFIG_SND_HDSP is not set
> # CONFIG_SND_HDSPM is not set
> # CONFIG_SND_ICE1712 is not set
> # CONFIG_SND_ICE1724 is not set
> # CONFIG_SND_INTEL8X0 is not set
> # CONFIG_SND_INTEL8X0M is not set
> # CONFIG_SND_KORG1212 is not set
> # CONFIG_SND_LOLA is not set
> # CONFIG_SND_LX6464ES is not set
> # CONFIG_SND_MAESTRO3 is not set
> # CONFIG_SND_MIXART is not set
> # CONFIG_SND_NM256 is not set
> # CONFIG_SND_PCXHR is not set
> # CONFIG_SND_RIPTIDE is not set
> # CONFIG_SND_RME32 is not set
> # CONFIG_SND_RME96 is not set
> # CONFIG_SND_RME9652 is not set
> # CONFIG_SND_SE6X is not set
> # CONFIG_SND_SIS7019 is not set
> # CONFIG_SND_SONICVIBES is not set
> # CONFIG_SND_TRIDENT is not set
> # CONFIG_SND_VIA82XX is not set
> # CONFIG_SND_VIA82XX_MODEM is not set
> # CONFIG_SND_VIRTUOSO is not set
> # CONFIG_SND_VX222 is not set
> # CONFIG_SND_YMFPCI is not set
> =

> #
> # HD-Audio
> #
> # CONFIG_SND_HDA_INTEL is not set
> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> # CONFIG_SND_PCMCIA is not set
> # CONFIG_SND_SOC is not set
> CONFIG_SOUND_PRIME=3Dm
> # CONFIG_SOUND_MSNDCLAS is not set
> # CONFIG_SOUND_MSNDPIN is not set
> CONFIG_SOUND_OSS=3Dm
> CONFIG_SOUND_TRACEINIT=3Dy
> # CONFIG_SOUND_DMAP is not set
> CONFIG_SOUND_VMIDI=3Dm
> # CONFIG_SOUND_TRIX is not set
> CONFIG_SOUND_MSS=3Dm
> CONFIG_SOUND_MPU401=3Dm
> CONFIG_SOUND_PAS=3Dm
> CONFIG_SOUND_PSS=3Dm
> # CONFIG_PSS_MIXER is not set
> # CONFIG_PSS_HAVE_BOOT is not set
> CONFIG_SOUND_SB=3Dm
> # CONFIG_SOUND_YM3812 is not set
> CONFIG_SOUND_UART6850=3Dm
> CONFIG_SOUND_AEDSP16=3Dm
> # CONFIG_SC6600 is not set
> # CONFIG_SOUND_KAHLUA is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dm
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=3Dm
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACRUX is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> CONFIG_HID_BELKIN=3Dm
> # CONFIG_HID_CHERRY is not set
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_PRODIKEYS is not set
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> CONFIG_DRAGONRISE_FF=3Dy
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELECOM is not set
> CONFIG_HID_EZKEY=3Dm
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_WALTOP is not set
> CONFIG_HID_GYRATION=3Dm
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> # CONFIG_HID_PRIMAX is not set
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> CONFIG_HID_SPEEDLINK=3Dm
> CONFIG_HID_STEELSERIES=3Dm
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dm
> # CONFIG_HID_GREENASIA is not set
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_WACOM=3Dm
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dm
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID is not set
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
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_TAHVO_USB is not set
> # CONFIG_USB_GADGET is not set
> CONFIG_UWB=3Dm
> # CONFIG_UWB_WHCI is not set
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=3Dy
> # CONFIG_MEMSTICK_DEBUG is not set
> =

> #
> # MemoryStick drivers
> #
> # CONFIG_MEMSTICK_UNSAFE_RESUME is not set
> CONFIG_MSPRO_BLOCK=3Dm
> CONFIG_MS_BLOCK=3Dm
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_88PM860X=3Dm
> # CONFIG_LEDS_LM3530 is not set
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dm
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dm
> CONFIG_LEDS_LP5521=3Dm
> CONFIG_LEDS_LP5523=3Dm
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dm
> CONFIG_LEDS_LP8860=3Dy
> # CONFIG_LEDS_CLEVO_MAIL is not set
> CONFIG_LEDS_PCA955X=3Dm
> CONFIG_LEDS_PCA963X=3Dm
> # CONFIG_LEDS_WM831X_STATUS is not set
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dm
> # CONFIG_LEDS_INTEL_SS4200 is not set
> CONFIG_LEDS_LT3593=3Dm
> # CONFIG_LEDS_ADP5520 is not set
> # CONFIG_LEDS_MC13783 is not set
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> CONFIG_LEDS_MAX8997=3Dy
> CONFIG_LEDS_LM355x=3Dm
> # CONFIG_LEDS_OT200 is not set
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
> CONFIG_LEDS_TRIGGER_TIMER=3Dy
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_GPIO is not set
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> CONFIG_ACCESSIBILITY=3Dy
> # CONFIG_A11Y_BRAILLE_CONSOLE is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> CONFIG_AUXDISPLAY=3Dy
> CONFIG_UIO=3Dm
> # CONFIG_UIO_CIF is not set
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dm
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dm
> CONFIG_VIRTIO_INPUT=3Dm
> CONFIG_VIRTIO_MMIO=3Dm
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_COMEDI=3Dm
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=3D2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=3D20480
> CONFIG_COMEDI_MISC_DRIVERS=3Dy
> # CONFIG_COMEDI_BOND is not set
> CONFIG_COMEDI_TEST=3Dm
> CONFIG_COMEDI_PARPORT=3Dm
> # CONFIG_COMEDI_SERIAL2002 is not set
> # CONFIG_COMEDI_SSV_DNP is not set
> # CONFIG_COMEDI_ISA_DRIVERS is not set
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_PCMCIA_DRIVERS=3Dm
> CONFIG_COMEDI_CB_DAS16_CS=3Dm
> CONFIG_COMEDI_DAS08_CS=3Dm
> CONFIG_COMEDI_NI_DAQ_700_CS=3Dm
> CONFIG_COMEDI_NI_DAQ_DIO24_CS=3Dm
> CONFIG_COMEDI_NI_LABPC_CS=3Dm
> # CONFIG_COMEDI_NI_MIO_CS is not set
> # CONFIG_COMEDI_QUATECH_DAQP_CS is not set
> CONFIG_COMEDI_8254=3Dm
> CONFIG_COMEDI_8255=3Dm
> # CONFIG_COMEDI_8255_SA is not set
> CONFIG_COMEDI_KCOMEDILIB=3Dm
> CONFIG_COMEDI_DAS08=3Dm
> CONFIG_COMEDI_NI_LABPC=3Dm
> # CONFIG_RTS5208 is not set
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
> # CONFIG_ADT7316 is not set
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dm
> CONFIG_AD7152=3Dm
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
> CONFIG_SENSORS_ISL29018=3Dm
> CONFIG_SENSORS_ISL29028=3Dm
> # CONFIG_TSL2583 is not set
> CONFIG_TSL2x7x=3Dm
> =

> #
> # Magnetometer sensors
> #
> CONFIG_SENSORS_HMC5843=3Dm
> CONFIG_SENSORS_HMC5843_I2C=3Dm
> =

> #
> # Active energy metering IC
> #
> # CONFIG_ADE7854 is not set
> =

> #
> # Resolver to digital converters
> #
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_SIMPLE_DUMMY=3Dm
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> # CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
> # CONFIG_FB_SM750 is not set
> # CONFIG_FB_XGI is not set
> =

> #
> # Speakup console speech
> #
> # CONFIG_SPEAKUP is not set
> CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4=3Dm
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> # CONFIG_DGNC is not set
> CONFIG_DGAP=3Dm
> CONFIG_GS_FPGABOOT=3Dm
> CONFIG_MOST=3Dm
> CONFIG_MOSTCORE=3Dm
> CONFIG_AIM_CDEV=3Dm
> # CONFIG_AIM_NETWORK is not set
> # CONFIG_AIM_SOUND is not set
> CONFIG_AIM_V4L2=3Dm
> CONFIG_HDM_I2C=3Dm
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACERHDF is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_INTEL_MENLOW is not set
> # CONFIG_ACPI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_INTEL_PMC_IPC is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> # CONFIG_CHROME_PLATFORMS is not set
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKSRC_I8253=3Dy
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # CONFIG_ATMEL_PIT is not set
> # CONFIG_SH_TIMER_CMT is not set
> # CONFIG_SH_TIMER_MTU2 is not set
> # CONFIG_SH_TIMER_TMU is not set
> # CONFIG_EM_TIMER_STI is not set
> CONFIG_MAILBOX=3Dy
> # CONFIG_PCC is not set
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> =

> #
> # Remoteproc drivers
> #
> CONFIG_REMOTEPROC=3Dm
> CONFIG_STE_MODEM_RPROC=3Dm
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_SUNXI_SRAM is not set
> CONFIG_SOC_TI=3Dy
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=3Dm
> # CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
> CONFIG_DEVFREQ_GOV_POWERSAVE=3Dm
> CONFIG_DEVFREQ_GOV_USERSPACE=3Dy
> =

> #
> # DEVFREQ Drivers
> #
> # CONFIG_PM_DEVFREQ_EVENT is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> # CONFIG_EXTCON_GPIO is not set
> CONFIG_EXTCON_MAX77693=3Dy
> CONFIG_EXTCON_MAX77843=3Dm
> # CONFIG_EXTCON_MAX8997 is not set
> # CONFIG_EXTCON_PALMAS is not set
> CONFIG_EXTCON_RT8973A=3Dm
> CONFIG_EXTCON_SM5502=3Dy
> # CONFIG_EXTCON_USB_GPIO is not set
> CONFIG_MEMORY=3Dy
> CONFIG_IIO=3Dm
> CONFIG_IIO_BUFFER=3Dy
> CONFIG_IIO_BUFFER_CB=3Dm
> CONFIG_IIO_KFIFO_BUF=3Dm
> CONFIG_IIO_TRIGGERED_BUFFER=3Dm
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dm
> CONFIG_BMC150_ACCEL=3Dm
> CONFIG_BMC150_ACCEL_I2C=3Dm
> CONFIG_HID_SENSOR_ACCEL_3D=3Dm
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> # CONFIG_KXCJK1013 is not set
> CONFIG_MMA8452=3Dm
> CONFIG_MMA9551_CORE=3Dm
> CONFIG_MMA9551=3Dm
> # CONFIG_MMA9553 is not set
> CONFIG_MXC4005=3Dm
> CONFIG_STK8312=3Dm
> CONFIG_STK8BA50=3Dm
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7291 is not set
> CONFIG_AD799X=3Dm
> CONFIG_DA9150_GPADC=3Dm
> CONFIG_MAX1363=3Dm
> CONFIG_MCP3422=3Dm
> CONFIG_NAU7802=3Dm
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_AM335X_ADC=3Dm
> =

> #
> # Amplifiers
> #
> =

> #
> # Chemical Sensors
> #
> # CONFIG_VZ89X is not set
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
> CONFIG_IIO_ST_SENSORS_I2C=3Dm
> CONFIG_IIO_ST_SENSORS_CORE=3Dm
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> CONFIG_AD5380=3Dm
> CONFIG_AD5446=3Dm
> CONFIG_M62332=3Dm
> # CONFIG_MAX517 is not set
> CONFIG_MCP4725=3Dm
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
> # CONFIG_BMG160 is not set
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> CONFIG_ITG3200=3Dm
> =

> #
> # Humidity sensors
> #
> CONFIG_DHT11=3Dm
> CONFIG_HDC100X=3Dm
> CONFIG_HTU21=3Dm
> CONFIG_SI7005=3Dm
> # CONFIG_SI7020 is not set
> =

> #
> # Inertial measurement units
> #
> # CONFIG_KMX61 is not set
> CONFIG_INV_MPU6050_IIO=3Dm
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> CONFIG_ADJD_S311=3Dm
> CONFIG_AL3320A=3Dm
> CONFIG_APDS9300=3Dm
> # CONFIG_APDS9960 is not set
> CONFIG_BH1750=3Dm
> CONFIG_CM32181=3Dm
> CONFIG_CM3232=3Dm
> CONFIG_CM3323=3Dm
> # CONFIG_CM36651 is not set
> # CONFIG_GP2AP020A00F is not set
> # CONFIG_ISL29125 is not set
> # CONFIG_HID_SENSOR_ALS is not set
> # CONFIG_HID_SENSOR_PROX is not set
> CONFIG_JSA1212=3Dm
> CONFIG_RPR0521=3Dm
> # CONFIG_SENSORS_LM3533 is not set
> # CONFIG_LTR501 is not set
> CONFIG_OPT3001=3Dm
> CONFIG_PA12203001=3Dm
> CONFIG_STK3310=3Dm
> CONFIG_TCS3414=3Dm
> CONFIG_TCS3472=3Dm
> CONFIG_SENSORS_TSL2563=3Dm
> CONFIG_TSL4531=3Dm
> # CONFIG_US5182D is not set
> CONFIG_VCNL4000=3Dm
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dm
> CONFIG_AK09911=3Dm
> CONFIG_BMC150_MAGN=3Dm
> # CONFIG_MAG3110 is not set
> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=3Dm
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dm
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
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dm
> CONFIG_IIO_SYSFS_TRIGGER=3Dm
> =

> #
> # Digital potentiometers
> #
> CONFIG_MCP4531=3Dm
> =

> #
> # Pressure sensors
> #
> CONFIG_BMP280=3Dm
> CONFIG_HID_SENSOR_PRESS=3Dm
> CONFIG_MPL115=3Dm
> # CONFIG_MPL3115 is not set
> CONFIG_MS5611=3Dm
> CONFIG_MS5611_I2C=3Dm
> CONFIG_MS5637=3Dm
> CONFIG_IIO_ST_PRESS=3Dm
> CONFIG_IIO_ST_PRESS_I2C=3Dm
> CONFIG_T5403=3Dm
> =

> #
> # Lightning sensors
> #
> =

> #
> # Proximity sensors
> #
> CONFIG_LIDAR_LITE_V2=3Dm
> CONFIG_SX9500=3Dm
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dm
> # CONFIG_TMP006 is not set
> CONFIG_TSYS01=3Dm
> # CONFIG_TSYS02D is not set
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> CONFIG_IPACK_BUS=3Dm
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_SERIAL_IPOCTAL=3Dm
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_PHY_PXA_28NM_HSIC=3Dm
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # CONFIG_RAS is not set
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> CONFIG_LIBNVDIMM=3Dm
> CONFIG_BLK_DEV_PMEM=3Dm
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> CONFIG_NVMEM=3Dm
> # CONFIG_STM is not set
> # CONFIG_STM_DUMMY is not set
> # CONFIG_STM_SOURCE_CONSOLE is not set
> CONFIG_INTEL_TH=3Dy
> # CONFIG_INTEL_TH_PCI is not set
> # CONFIG_INTEL_TH_GTH is not set
> CONFIG_INTEL_TH_MSU=3Dy
> CONFIG_INTEL_TH_PTI=3Dy
> # CONFIG_INTEL_TH_DEBUG is not set
> =

> #
> # FPGA Configuration Support
> #
> # CONFIG_FPGA is not set
> =

> #
> # Firmware Drivers
> #
> # CONFIG_EDD is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> # CONFIG_DELL_RBU is not set
> # CONFIG_DCDBAS is not set
> CONFIG_DMIID=3Dy
> # CONFIG_DMI_SYSFS is not set
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_EXT2_FS is not set
> # CONFIG_EXT3_FS is not set
> # CONFIG_EXT4_FS is not set
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=3Dy
> # CONFIG_JFS_POSIX_ACL is not set
> CONFIG_JFS_SECURITY=3Dy
> CONFIG_JFS_DEBUG=3Dy
> # CONFIG_JFS_STATISTICS is not set
> # CONFIG_XFS_FS is not set
> CONFIG_GFS2_FS=3Dy
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=3Dy
> # CONFIG_F2FS_FS is not set
> # CONFIG_FS_DAX is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dm
> CONFIG_FSCACHE_STATS=3Dy
> CONFIG_FSCACHE_HISTOGRAM=3Dy
> CONFIG_FSCACHE_DEBUG=3Dy
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dm
> CONFIG_CACHEFILES_DEBUG=3Dy
> CONFIG_CACHEFILES_HISTOGRAM=3Dy
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
> CONFIG_MSDOS_FS=3Dm
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_NTFS_FS=3Dy
> CONFIG_NTFS_DEBUG=3Dy
> # CONFIG_NTFS_RW is not set
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
> CONFIG_CONFIGFS_FS=3Dy
> # CONFIG_MISC_FILESYSTEMS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> # CONFIG_NLS_CODEPAGE_855 is not set
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dm
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> # CONFIG_NLS_CODEPAGE_866 is not set
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
> CONFIG_NLS_CODEPAGE_950=3Dm
> # CONFIG_NLS_CODEPAGE_932 is not set
> CONFIG_NLS_CODEPAGE_949=3Dm
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> # CONFIG_NLS_CODEPAGE_1250 is not set
> CONFIG_NLS_CODEPAGE_1251=3Dm
> # CONFIG_NLS_ASCII is not set
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> # CONFIG_NLS_ISO8859_4 is not set
> CONFIG_NLS_ISO8859_5=3Dm
> # CONFIG_NLS_ISO8859_6 is not set
> CONFIG_NLS_ISO8859_7=3Dy
> CONFIG_NLS_ISO8859_9=3Dy
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dy
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dm
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
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> # CONFIG_ENABLE_MUST_CHECK is not set
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_DEBUG_SLAB is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> # CONFIG_DEBUG_TIMEKEEPING is not set
> # CONFIG_TIMER_STATS is not set
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
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> # CONFIG_FAULT_INJECTION is not set
> # CONFIG_LATENCYTOP is not set
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
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
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> # CONFIG_FTRACE_SYSCALLS is not set
> CONFIG_TRACER_SNAPSHOT=3Dy
> CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP=3Dy
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_BLK_DEV_IO_TRACE is not set
> # CONFIG_UPROBE_EVENT is not set
> # CONFIG_PROBE_EVENTS is not set
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> # CONFIG_FUNCTION_PROFILER is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_MMIOTRACE is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_TRACE_ENUM_MAP_FILE is not set
> CONFIG_TRACING_EVENTS_GPIO=3Dy
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> CONFIG_TEST_HEXDUMP=3Dm
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_KSTRTOX is not set
> CONFIG_TEST_PRINTF=3Dm
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_TEST_LKM is not set
> CONFIG_TEST_USER_COPY=3Dm
> # CONFIG_TEST_BPF is not set
> CONFIG_TEST_FIRMWARE=3Dm
> CONFIG_TEST_UDELAY=3Dm
> # CONFIG_MEMTEST is not set
> CONFIG_TEST_STATIC_KEYS=3Dm
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> # CONFIG_STRICT_DEVMEM is not set
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> # CONFIG_EARLY_PRINTK_DBGP is not set
> # CONFIG_X86_PTDUMP_CORE is not set
> # CONFIG_X86_PTDUMP is not set
> CONFIG_DEBUG_RODATA=3Dy
> CONFIG_DEBUG_RODATA_TEST=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_DEBUG_SET_MODULE_RONX=3Dy
> # CONFIG_DEBUG_NX_TEST is not set
> CONFIG_DOUBLEFAULT=3Dy
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_STRESS=3Dy
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
> # CONFIG_DEBUG_BOOT_PARAMS is not set
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_X86_DEBUG_STATIC_CPU_HAS is not set
> CONFIG_X86_DEBUG_FPU=3Dy
> CONFIG_PUNIT_ATOM_DEBUG=3Dy
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> # CONFIG_BIG_KEYS is not set
> CONFIG_TRUSTED_KEYS=3Dm
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> # CONFIG_SECURITY_YAMA is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> # CONFIG_IMA is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
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
> CONFIG_CRYPTO_PCOMP2=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dm
> CONFIG_CRYPTO_RSA=3Dm
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dm
> # CONFIG_CRYPTO_TEST is not set
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dm
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dm
> # CONFIG_CRYPTO_CTS is not set
> CONFIG_CRYPTO_ECB=3Dm
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
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dy
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_CRCT10DIF=3Dm
> CONFIG_CRYPTO_GHASH=3Dm
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dm
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> CONFIG_CRYPTO_RMD320=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dm
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dm
> # CONFIG_CRYPTO_ARC4 is not set
> # CONFIG_CRYPTO_BLOWFISH is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dm
> # CONFIG_CRYPTO_KHAZAD is not set
> # CONFIG_CRYPTO_SALSA20 is not set
> CONFIG_CRYPTO_SALSA20_586=3Dy
> CONFIG_CRYPTO_CHACHA20=3Dm
> # CONFIG_CRYPTO_SEED is not set
> CONFIG_CRYPTO_SERPENT=3Dm
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> CONFIG_CRYPTO_TEA=3Dy
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> # CONFIG_CRYPTO_DEFLATE is not set
> # CONFIG_CRYPTO_ZLIB is not set
> # CONFIG_CRYPTO_LZO is not set
> CONFIG_CRYPTO_842=3Dm
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> # CONFIG_CRYPTO_DRBG_CTR is not set
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_GEODE is not set
> # CONFIG_CRYPTO_DEV_HIFN_795X is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCCVF is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> CONFIG_PKCS7_TEST_KEY=3Dy
> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> =

> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
> # CONFIG_LGUEST is not set
> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
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
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> # CONFIG_CRC_T10DIF is not set
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> # CONFIG_LIBCRC32C is not set
> CONFIG_CRC8=3Dm
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_842_COMPRESS=3Dm
> CONFIG_842_DECOMPRESS=3Dm
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
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
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_DDR is not set
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_FONT_SUPPORT=3Dm
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> # CONFIG_SG_SPLIT is not set
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_MMIO_FLUSH=3Dy


--===============6061917027208283513==--

