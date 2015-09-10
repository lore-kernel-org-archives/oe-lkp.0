Content-Type: multipart/mixed; boundary="===============2313407123748184700=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [locktorture] 5f6a140f30: kernel BUG at drivers/base/driver.c:153!
Date: Thu, 10 Sep 2015 09:04:24 +0800
Message-ID: <20150910010424.GA24148@wfg-t540p.sh.intel.com>
In-Reply-To: <20150909185654.GK4029@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2313407123748184700==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paul,

The errors are true, but sorry the bisect report is obviously wrong.

- the tusb1210_driver_init BUG is an old one;
- the BUG in include/linux/pagemap.h has been bisected and emailed to
  you just now.

My bisect script has been fixed to stop sending failed bisects out..

Thanks,
Fengguang

On Wed, Sep 09, 2015 at 11:56:54AM -0700, Paul E. McKenney wrote:
> On Thu, Sep 10, 2015 at 02:03:02AM +0800, kernel test robot wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git d=
ev.2015.09.01a
> > =

> > commit 5f6a140f30b4296ac6ef2dd275ed513c27180fbe
> > Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > AuthorDate: Sat Aug 29 14:46:29 2015 -0700
> > Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> > CommitDate: Mon Aug 31 14:37:46 2015 -0700
> =

> This is obsolete, but its replacement is the same patch.
> =

> Oleg, Davidlohr, am I missing something on how percpu_rwsem or
> locktorture work?  The patch is at the end of this email, which
> also includes Fengguang's dmesg and Kconfig.
> =

> 							Thanx, Paul
> =

> >     locktorture: Add torture tests for percpu_rwsem
> >     =

> >     This commit adds percpu_rwsem tests based on the earlier rwsem test=
s.
> >     =

> >     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >     Cc: Oleg Nesterov <oleg@redhat.com>
> >     Cc: Davidlohr Bueso <dave@stgolabs.net>
> > =

> > +------------------------------------------+------------+------------+-=
-----------+
> > |                                          | 04be76a9b0 | 5f6a140f30 | =
325c0efb5f |
> > +------------------------------------------+------------+------------+-=
-----------+
> > | boot_successes                           | 0          | 0          | =
0          |
> > | boot_failures                            | 66         | 22         | =
19         |
> > | kernel_BUG_at_drivers/base/driver.c      | 66         | 22         | =
           |
> > | invalid_opcode                           | 66         | 22         | =
19         |
> > | EIP_is_at_driver_register                | 66         | 22         | =
           |
> > | Kernel_panic-not_syncing:Fatal_exception | 66         | 22         | =
19         |
> > | backtrace:tusb1210_driver_init           | 66         | 22         | =
           |
> > | backtrace:kernel_init_freeable           | 66         | 22         | =
19         |
> > | kernel_BUG_at_include/linux/pagemap.h    | 0          | 0          | =
19         |
> > | EIP_is_at_find_get_entry                 | 0          | 0          | =
19         |
> > | backtrace:vfs_write                      | 0          | 0          | =
19         |
> > | backtrace:SyS_write                      | 0          | 0          | =
19         |
> > | backtrace:populate_rootfs                | 0          | 0          | =
19         |
> > +------------------------------------------+------------+------------+-=
-----------+
> > =

> > [    1.548005] tsc: Refined TSC clocksource calibration: 2693.507 MHz
> > [    1.548484] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0=
x26d348cd811, max_idle_ns: 440795335366 ns
> > [    1.549281] ------------[ cut here ]------------
> > [    1.549643] kernel BUG at drivers/base/driver.c:153!
> > [    1.550005] invalid opcode: 0000 [#1] =

> > [    1.550005] CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.0-rc1-00064-=
g5f6a140 #2
> > [    1.550005] task: cf440000 ti: cf43c000 task.ti: cf43c000
> > [    1.550005] EIP: 0060:[<c1309078>] EFLAGS: 00010246 CPU: 0
> > [    1.550005] EIP is at driver_register+0x98/0xd0
> > [    1.550005] EAX: c1b19bac EBX: cf4d7a80 ECX: 00000000 EDX: c1b51b40
> > [    1.550005] ESI: c1bcd884 EDI: c1ba72e2 EBP: cf43df28 ESP: cf43df24
> > [    1.550005]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    1.550005] CR0: 80050033 CR2: 00000000 CR3: 01bf8000 CR4: 00040690
> > [    1.550005] Stack:
> > [    1.550005]  c1435019 cf43df30 c1ba72ef cf43df90 c1b8ab5c cf43df48 c=
1b8a4bd 00000000
> > [    1.550005]  cffdbf00 cf43df7c c10906fd 00000000 00060006 cffdbf48 c=
1aeedb0 c1a69053
> > [    1.550005]  cffdbf47 cffdbf48 00000200 00000006 c1be7c1c 0000025e c=
f43dfa4 c1b8aca1
> > [    1.550005] Call Trace:
> > [    1.550005]  [<c1435019>] ? ulpi_register_driver+0x19/0x30
> > [    1.550005]  [<c1ba72ef>] tusb1210_driver_init+0xd/0xf
> > [    1.550005]  [<c1b8ab5c>] do_one_initcall+0xcb/0x14d
> > [    1.550005]  [<c1b8a4bd>] ? repair_env_string+0x12/0x54
> > [    1.550005]  [<c10906fd>] ? parse_args+0x1bd/0x3c0
> > [    1.550005]  [<c1b8aca1>] ? kernel_init_freeable+0xc3/0x15b
> > [    1.550005]  [<c1b8acc1>] kernel_init_freeable+0xe3/0x15b
> > [    1.550005]  [<c178adb8>] kernel_init+0x8/0xc0
> > [    1.550005]  [<c1798a80>] ret_from_kernel_thread+0x20/0x30
> > [    1.550005]  [<c178adb0>] ? rest_init+0xb0/0xb0
> > [    1.550005] Code: 85 c0 75 17 8b 43 3c 31 d2 e8 25 fe ec ff 8d 65 f8=
 89 f0 5b 5e 5d c3 8d 74 26 00 89 d8 e8 01 eb ff ff 8d 65 f8 89 f0 5b 5e 5d=
 c3 <0f> 0b ff 33 68 58 f9 a8 c1 e8 f5 4d 48 00 59 8b 53 04 5e eb 92
> > [    1.550005] EIP: [<c1309078>] driver_register+0x98/0xd0 SS:ESP 0068:=
cf43df24
> > [    1.563040] ---[ end trace 23c59b24b9f0a1e9 ]---
> > [    1.563391] Kernel panic - not syncing: Fatal exception
> > =

> > git bisect start 325c0efb5f89af4e5e3d0575ea1b042375dedf6b 64291f7db5bd8=
150a74ad2036f1037e6a0428df2 --
> > git bisect  bad b570ee62511a07540aac9c8953dabee4f5e491f5  # 23:19      =
0-     26  Merge 'iommu/master' into devel-spot-201509091835
> > git bisect  bad 7d4e51e4b65c3ca7b64634a1629453329b02d448  # 23:19      =
0-     26  Merge 'renesas-drivers/topic/gen3-integration-v8' into devel-spo=
t-201509091835
> > git bisect good e5af4c798148137d0b22bf5ccc1e92523ec46f6d  # 23:35    55=
0+      0  Merge 'platform-drivers-x86/testing' into devel-spot-201509091835
> > git bisect good 75520c559502b803aaa6c2906e40fdb61e2497ef  # 23:43    55=
0+      0  Merge 'dynticks/sched/core' into devel-spot-201509091835
> > git bisect good 296e6185a1ec3cd3ccbba9477919a727b595e9e9  # 23:57    54=
6+      2  Merge 'renesas-drivers/topic/r8a7795-scif-v1' into devel-spot-20=
1509091835
> > git bisect  bad e53433a47052636a7625da8d08bb231d49b16be5  # 23:57      =
0-     26  Merge 'rcu/dev.2015.09.01a' into devel-spot-201509091835
> > git bisect good b25a776a7fbeb80c5cec9e17d6e8cc5ea2e9873a  # 00:12    55=
0+      1  Merge 'renesas-drivers/topic/rcar-dmac-residue-v1' into devel-sp=
ot-201509091835
> > git bisect  bad ba42cf33babc6f93e1a44c849fa5ea6e0ad4ce06  # 00:12      =
0-     22  rcu: Eliminate panic when silly boot-time fanout specified
> > git bisect  bad 6c0797038c459497744235dc5255c1f12bd39f74  # 00:12      =
0-     22  locking/percpu-rwsem: Make use of the rcu_sync infrastructure
> > git bisect  bad a88f9ff7d3984bb2c5f456777b0df17b7eeb766e  # 00:12      =
0-     22  rcu_sync: Simplify rcu_sync using new rcu_sync_ops structure
> > git bisect  bad 9a5d9131db0a16ae911236ed6aa793696c544eba  # 00:12      =
0-     22  torture: Consolidate cond_resched_rcu_qs() into stutter_wait()
> > git bisect  bad 5f6a140f30b4296ac6ef2dd275ed513c27180fbe  # 00:12      =
0-     22  locktorture: Add torture tests for percpu_rwsem
> > # first bad commit: [5f6a140f30b4296ac6ef2dd275ed513c27180fbe] locktort=
ure: Add torture tests for percpu_rwsem
> > git bisect  bad 04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41  # 00:12      =
0-     66  locktorture: Support rtmutex torturing
> > # extra tests with DEBUG_INFO
> > git bisect  bad 5f6a140f30b4296ac6ef2dd275ed513c27180fbe  # 00:18      =
0-     11  locktorture: Add torture tests for percpu_rwsem
> > # extra tests on HEAD of linux-devel/devel-spot-201509091835
> > git bisect  bad 325c0efb5f89af4e5e3d0575ea1b042375dedf6b  # 00:18      =
0-     19  0day head guard for 'devel-spot-201509091835'
> > # extra tests on tree/branch rcu/dev.2015.09.01a
> > git bisect  bad caa7dd68d68438b256ee830f4aa6b2ddd04b4575  # 00:25      =
0-      7  locktorture: Fix module unwind when bad torture_type specified
> > # extra tests with first bad commit reverted
> > git bisect  bad 219829903bebb1168928ed7aaf8cfd083ab98b26  # 00:54      =
0-     12  Revert "locktorture: Add torture tests for percpu_rwsem"
> > # extra tests on tree/branch linus/master
> > git bisect good 26d2177e977c912863ac04f6c1a967e793ca3a56  # 01:29   101=
0+      1  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kern=
el/git/dledford/rdma
> > # extra tests on tree/branch linux-next/master
> > git bisect good 72c9d8043fdc87832802de0b7a7129d6fc4c4c70  # 02:02   101=
0+      0  Add linux-next specific files for 20150909
> > =

> > =

> > This script may reproduce the error.
> > =

> > -----------------------------------------------------------------------=
-----
> > #!/bin/bash
> > =

> > kernel=3D$1
> > initrd=3Dyocto-minimal-i386.cgz
> > =

> > wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> > =

> > kvm=3D(
> > 	qemu-system-x86_64
> > 	-enable-kvm
> > 	-cpu Haswell,+smep,+smap
> > 	-kernel $kernel
> > 	-initrd $initrd
> > 	-m 256
> > 	-smp 1
> > 	-device e1000,netdev=3Dnet0
> > 	-netdev user,id=3Dnet0
> > 	-boot order=3Dnc
> > 	-no-reboot
> > 	-watchdog i6300esb
> > 	-rtc base=3Dlocaltime
> > 	-serial stdio
> > 	-display none
> > 	-monitor null =

> > )
> > =

> > append=3D(
> > 	hung_task_panic=3D1
> > 	earlyprintk=3DttyS0,115200
> > 	systemd.log_level=3Derr
> > 	debug
> > 	apic=3Ddebug
> > 	sysrq_always_enabled
> > 	rcupdate.rcu_cpu_stall_timeout=3D100
> > 	panic=3D-1
> > 	softlockup_panic=3D1
> > 	nmi_watchdog=3Dpanic
> > 	oops=3Dpanic
> > 	load_ramdisk=3D2
> > 	prompt_ramdisk=3D0
> > 	console=3DttyS0,115200
> > 	console=3Dtty0
> > 	vga=3Dnormal
> > 	root=3D/dev/ram0
> > 	rw
> > 	drbd.minor_count=3D8
> > )
> > =

> > "${kvm[@]}" --append "${append[*]}"
> > -----------------------------------------------------------------------=
-----
> > =

> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/lkp                          Intel Corpo=
ration
> =

> > early console in setup code
> > [    0.000000] Initializing cgroup subsys cpu
> > [    0.000000] Linux version 4.2.0-rc1-00064-g5f6a140 (kbuild(a)athens)=
 (gcc version 4.9.2 (Debian 4.9.2-10) ) #2 Wed Sep 9 22:12:51 CST 2015
> > [    0.000000] x86/fpu: xstate_offset[2]: 0240, xstate_sizes[2]: 0100
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x01: 'x87 floating po=
int registers'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x02: 'SSE registers'
> > [    0.000000] x86/fpu: Supporting XSAVE feature 0x04: 'AVX registers'
> > [    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 0x=
340 bytes, using 'standard' format.
> > [    0.000000] x86/fpu: Using 'eager' FPU context switches.
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
> > [    0.000000] Notice: NX (Execute Disable) protection cannot be enable=
d: non-PAE kernel!
> > [    0.000000] Hypervisor detected: KVM
> > [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> =
reserved
> > [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> > [    0.000000] e820: last_pfn =3D 0xffe0 max_arch_pfn =3D 0x100000
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
> > [    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC=
- UC  =

> > [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> > [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> > [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> > [    0.000000] found SMP MP-table at [mem 0x000f0e90-0x000f0e9f] mapped=
 at [c00f0e90]
> > [    0.000000]   mpc: f0ea0-f0fa8
> > [    0.000000] initial memory mapped: [mem 0x00000000-0x02bfffff]
> > [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> > [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> > [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> > [    0.000000] init_memory_mapping: [mem 0x0f800000-0x0fbfffff]
> > [    0.000000]  [mem 0x0f800000-0x0fbfffff] page 4M
> > [    0.000000] init_memory_mapping: [mem 0x00100000-0x0f7fffff]
> > [    0.000000]  [mem 0x00100000-0x003fffff] page 4k
> > [    0.000000]  [mem 0x00400000-0x0f7fffff] page 4M
> > [    0.000000] init_memory_mapping: [mem 0x0fc00000-0x0ffdffff]
> > [    0.000000]  [mem 0x0fc00000-0x0ffdffff] page 4k
> > [    0.000000] BRK [0x029a3000, 0x029a3fff] PGTABLE
> > [    0.000000] RAMDISK: [mem 0x0fca5000-0x0ffd7fff]
> > [    0.000000] ACPI: Early table checksum verification disabled
> > [    0.000000] ACPI: RSDP 0x00000000000F0CB0 000014 (v00 BOCHS )
> > [    0.000000] ACPI: RSDT 0x000000000FFE1854 000034 (v01 BOCHS  BXPCRSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACP 0x000000000FFE0B37 000074 (v01 BOCHS  BXPCFAC=
P 00000001 BXPC 00000001)
> > [    0.000000] ACPI: DSDT 0x000000000FFE0040 000AF7 (v01 BOCHS  BXPCDSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACS 0x000000000FFE0000 000040
> > [    0.000000] ACPI: SSDT 0x000000000FFE0BAB 000BF9 (v01 BOCHS  BXPCSSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: APIC 0x000000000FFE17A4 000078 (v01 BOCHS  BXPCAPI=
C 00000001 BXPC 00000001)
> > [    0.000000] ACPI: HPET 0x000000000FFE181C 000038 (v01 BOCHS  BXPCHPE=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> > [    0.000000] 255MB LOWMEM available.
> > [    0.000000]   mapped low ram: 0 - 0ffe0000
> > [    0.000000]   low ram: 0 - 0ffe0000
> > [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > [    0.000000] kvm-clock: cpu 0, msr 0:ffdf001, primary cpu clock
> > [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.000000]   Normal   [mem 0x0000000001000000-0x000000000ffdffff]
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > [    0.000000]   node   0: [mem 0x0000000000100000-0x000000000ffdffff]
> > [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000000=
ffdffff]
> > [    0.000000] On node 0 totalpages: 65406
> > [    0.000000]   DMA zone: 40 pages used for memmap
> > [    0.000000]   DMA zone: 0 pages reserved
> > [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> > [    0.000000]   Normal zone: 600 pages used for memmap
> > [    0.000000]   Normal zone: 61408 pages, LIFO batch:15
> > [    0.000000] Using APIC driver default
> > [    0.000000] ACPI: PM-Timer IO Port: 0x608
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] mapped APIC to         ffffc000 (        fee00000)
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
> > [    0.000000] mapped IOAPIC to ffffb000 (fec00000)
> > [    0.000000] KVM setup async PF for cpu 0
> > [    0.000000] kvm-stealtime: cpu 0, msr 1b08880
> > [    0.000000] e820: [mem 0x10000000-0xfeffbfff] available for PCI devi=
ces
> > [    0.000000] Booting paravirtualized kernel on KVM
> > [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycle=
s: 0xffffffff, max_idle_ns: 19112604462750000 ns
> > [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> > [    0.000000] pcpu-alloc: [0] 0 =

> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 64766
> > [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dt=
tyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled=
 rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3D=
ttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuil=
d-tests/run-queue/kvm/i386-randconfig-b0-09092043/linux-devel:devel-spot-20=
1509091835:5f6a140f30b4296ac6ef2dd275ed513c27180fbe:bisect-linux-4/.vmlinuz=
-5f6a140f30b4296ac6ef2dd275ed513c27180fbe-20150909221328-9-kbuild branch=3D=
linux-devel/devel-spot-201509091835 BOOT_IMAGE=3D/pkg/linux/i386-randconfig=
-b0-09092043/gcc-4.9/5f6a140f30b4296ac6ef2dd275ed513c27180fbe/vmlinuz-4.2.0=
-rc1-00064-g5f6a140 drbd.minor_count=3D8
> > [    0.000000] PID hash table entries: 1024 (order: 0, 4096 bytes)
> > [    0.000000] Dentry cache hash table entries: 32768 (order: 5, 131072=
 bytes)
> > [    0.000000] Inode-cache hash table entries: 16384 (order: 4, 65536 b=
ytes)
> > [    0.000000] Initializing CPU#0
> > [    0.000000] Memory: 229184K/261624K available (7784K kernel code, 60=
2K rwdata, 3416K rodata, 428K init, 13964K bss, 32440K reserved, 0K cma-res=
erved)
> > [    0.000000] virtual kernel memory layout:
> > [    0.000000]     fixmap  : 0xfffa2000 - 0xfffff000   ( 372 kB)
> > [    0.000000]     vmalloc : 0xd07e0000 - 0xfffa0000   ( 759 MB)
> > [    0.000000]     lowmem  : 0xc0000000 - 0xcffe0000   ( 255 MB)
> > [    0.000000]       .init : 0xc1b8a000 - 0xc1bf5000   ( 428 kB)
> > [    0.000000]       .data : 0xc179a657 - 0xc1b889e0   (4024 kB)
> > [    0.000000]       .text : 0xc1000000 - 0xc179a657   (7785 kB)
> > [    0.000000] Checking if this processor honours the WP bit even in su=
pervisor mode...Ok.
> > [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D=
1, Nodes=3D1
> > [    0.000000] NR_IRQS:2304 nr_irqs:256 16
> > [    0.000000] CPU 0 irqstacks, hard=3Dcf408000 soft=3Dcf40a000
> > [    0.000000] console [ttyS0] enabled
> > [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, I=
nc., Ingo Molnar
> > [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> > [    0.000000] ... MAX_LOCK_DEPTH:          48
> > [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> > [    0.000000] ... CLASSHASH_SIZE:          4096
> > [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> > [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> > [    0.000000] ... CHAINHASH_SIZE:          32768
> > [    0.000000]  memory used by lock dependency info: 4895 kB
> > [    0.000000]  per task-struct memory footprint: 1344 bytes
> > [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604467 ns
> > [    0.000000] hpet clockevent registered
> > [    0.000000] tsc: Detected 2693.508 MHz processor
> > [    0.020000] Calibrating delay loop (skipped) preset value.. 5387.01 =
BogoMIPS (lpj=3D26935080)
> > [    0.020000] pid_max: default: 4096 minimum: 301
> > [    0.020000] ACPI: Core revision 20150619
> > [    0.020000] ACPI: All ACPI Tables successfully acquired
> > [    0.020000] Mount-cache hash table entries: 1024 (order: 0, 4096 byt=
es)
> > [    0.020000] Mountpoint-cache hash table entries: 1024 (order: 0, 409=
6 bytes)
> > [    0.020000] Initializing cgroup subsys memory
> > [    0.020000] Initializing cgroup subsys net_cls
> > [    0.020000] Initializing cgroup subsys perf_event
> > [    0.020000] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> > [    0.020000] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> > [    0.020000] CPU: Intel Core Processor (Haswell) (fam: 06, model: 3c,=
 stepping: 01)
> > [    0.020326] Performance Events: unsupported p6 CPU model 60 no PMU d=
river, software events only.
> > [    0.021275] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> > [    0.021771] enabled ExtINT on CPU#0
> > [    0.022729] ENABLING IO-APIC IRQs
> > [    0.023009] init IO_APIC IRQs
> > [    0.023258]  apic 0 pin 0 not connected
> > [    0.023594] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:=
0 Active:0 Dest:1)
> > [    0.024251] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:=
0 Active:0 Dest:1)
> > [    0.024904] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:=
0 Active:0 Dest:1)
> > [    0.025608] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:=
0 Active:0 Dest:1)
> > [    0.026294] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:=
1 Active:0 Dest:1)
> > [    0.026943] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:=
0 Active:0 Dest:1)
> > [    0.027590] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:=
0 Active:0 Dest:1)
> > [    0.028226] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:=
0 Active:0 Dest:1)
> > [    0.028885] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:=
1 Active:0 Dest:1)
> > [    0.029539] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mod=
e:1 Active:0 Dest:1)
> > [    0.030000] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mod=
e:1 Active:0 Dest:1)
> > [    0.030000] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mod=
e:0 Active:0 Dest:1)
> > [    0.030000] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mod=
e:0 Active:0 Dest:1)
> > [    0.030000] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mod=
e:0 Active:0 Dest:1)
> > [    0.030000] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mod=
e:0 Active:0 Dest:1)
> > [    0.030000]  apic 0 pin 16 not connected
> > [    0.030000]  apic 0 pin 17 not connected
> > [    0.030000]  apic 0 pin 18 not connected
> > [    0.030000]  apic 0 pin 19 not connected
> > [    0.030000]  apic 0 pin 20 not connected
> > [    0.030000]  apic 0 pin 21 not connected
> > [    0.030000]  apic 0 pin 22 not connected
> > [    0.030000]  apic 0 pin 23 not connected
> > [    0.030000] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin=
2=3D-1
> > [    0.030000] TSC deadline timer enabled
> > [    0.030000] devtmpfs: initialized
> > [    0.030000] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 19112604462750000 ns
> > [    0.030000] prandom: seed boundary self test passed
> > [    0.030000] prandom: 100 self tests passed
> > [    0.030000] NET: Registered protocol family 16
> > [    0.030000] cpuidle: using governor ladder
> > [    0.030000] ACPI: bus type PCI registered
> > [    0.030000] PCI: PCI BIOS revision 2.10 entry at 0xfd456, last bus=
=3D0
> > [    0.030000] PCI: Using configuration type 1 for base access
> > [    0.030815] ACPI: Added _OSI(Module Device)
> > [    0.031156] ACPI: Added _OSI(Processor Device)
> > [    0.031512] ACPI: Added _OSI(3.0 _SCP Extensions)
> > [    0.031881] ACPI: Added _OSI(Processor Aggregator Device)
> > [    0.034441] ACPI: Interpreter enabled
> > [    0.034747] ACPI: (supports S0 S5)
> > [    0.035020] ACPI: Using IOAPIC for interrupt routing
> > [    0.035434] PCI: Using host bridge windows from ACPI; if necessary, =
use "pci=3Dnocrs" and report a bug
> > [    0.040241] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> > [    0.040735] acpi PNP0A03:00: _OSC: OS supports [Segments]
> > [    0.041174] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling A=
SPM
> > [    0.041751] acpi PNP0A03:00: fail to add MMCONFIG information, can't=
 access extended PCI configuration space under this bridge.
> > [    0.042709] PCI host bridge to bus 0000:00
> > [    0.043040] pci_bus 0000:00: root bus resource [bus 00-ff]
> > [    0.043477] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wi=
ndow]
> > [    0.044005] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff wi=
ndow]
> > [    0.044538] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff wi=
ndow]
> > [    0.045067] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf wi=
ndow]
> > [    0.045596] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff wi=
ndow]
> > [    0.046124] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000=
bffff window]
> > [    0.046708] pci_bus 0000:00: root bus resource [mem 0x10000000-0xfeb=
fffff window]
> > [    0.047325] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> > [    0.048155] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> > [    0.049045] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> > [    0.059822] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
> > [    0.064336] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f=
0-0x01f7]
> > [    0.064899] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f=
6]
> > [    0.065403] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x017=
0-0x0177]
> > [    0.065965] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x037=
6]
> > [    0.066641] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> > [    0.067396] pci 0000:00:01.3: can't claim BAR 7 [io  0x0600-0x063f]:=
 address conflict with ACPI PM1a_EVT_BLK [io  0x0600-0x0603]
> > [    0.068297] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by =
PIIX4 SMB
> > [    0.069059] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> > [    0.072198] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff p=
ref]
> > [    0.077088] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> > [    0.096511] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff p=
ref]
> > [    0.097223] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> > [    0.100006] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> > [    0.104826] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> > [    0.124326] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff p=
ref]
> > [    0.125084] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> > [    0.129922] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> > [    0.134259] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> > [    0.154515] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> > [    0.159367] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> > [    0.162150] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> > [    0.182390] pci 0000:00:06.0: [1af4:1001] type 00 class 0x010000
> > [    0.187211] pci 0000:00:06.0: reg 0x10: [io  0xc0c0-0xc0ff]
> > [    0.190006] pci 0000:00:06.0: reg 0x14: [mem 0xfebf3000-0xfebf3fff]
> > [    0.210289] pci 0000:00:07.0: [1af4:1001] type 00 class 0x010000
> > [    0.215894] pci 0000:00:07.0: reg 0x10: [io  0xc100-0xc13f]
> > [    0.220009] pci 0000:00:07.0: reg 0x14: [mem 0xfebf4000-0xfebf4fff]
> > [    0.240275] pci 0000:00:08.0: [1af4:1001] type 00 class 0x010000
> > [    0.245119] pci 0000:00:08.0: reg 0x10: [io  0xc140-0xc17f]
> > [    0.249822] pci 0000:00:08.0: reg 0x14: [mem 0xfebf5000-0xfebf5fff]
> > [    0.270268] pci 0000:00:09.0: [1af4:1001] type 00 class 0x010000
> > [    0.275091] pci 0000:00:09.0: reg 0x10: [io  0xc180-0xc1bf]
> > [    0.279807] pci 0000:00:09.0: reg 0x14: [mem 0xfebf6000-0xfebf6fff]
> > [    0.300278] pci 0000:00:0a.0: [1af4:1001] type 00 class 0x010000
> > [    0.305107] pci 0000:00:0a.0: reg 0x10: [io  0xc1c0-0xc1ff]
> > [    0.309950] pci 0000:00:0a.0: reg 0x14: [mem 0xfebf7000-0xfebf7fff]
> > [    0.330263] pci 0000:00:0b.0: [8086:25ab] type 00 class 0x088000
> > [    0.332923] pci 0000:00:0b.0: reg 0x10: [mem 0xfebf8000-0xfebf800f]
> > [    0.345607] pci_bus 0000:00: on NUMA node 0
> > [    0.346336] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> > [    0.346950] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> > [    0.347529] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> > [    0.348111] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> > [    0.348645] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> > [    0.349333] ACPI: Enabled 16 GPEs in block 00 to 0F
> > [    0.350107] vgaarb: setting as boot device: PCI:0000:00:02.0
> > [    0.350554] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,=
owns=3Dio+mem,locks=3Dnone
> > [    0.351190] vgaarb: loaded
> > [    0.351407] vgaarb: bridge control possible 0000:00:02.0
> > [    0.351987] ACPI: bus type USB registered
> > [    0.352334] usbcore: registered new interface driver usbfs
> > [    0.352780] usbcore: registered new interface driver hub
> > [    0.353212] usbcore: registered new device driver usb
> > [    0.353650] pps_core: LinuxPPS API ver. 1 registered
> > [    0.354050] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodo=
lfo Giometti <giometti@linux.it>
> > [    0.354761] PTP clock support registered
> > [    0.355090] EDAC MC: Ver: 3.0.0
> > [    0.355541] EDAC DEBUG: edac_mc_sysfs_init: device mc created
> > [    0.356108] Advanced Linux Sound Architecture Driver Initialized.
> > [    0.356601] PCI: Using ACPI for IRQ routing
> > [    0.356934] PCI: pci_cache_line_size set to 64 bytes
> > [    0.357469] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> > [    0.357939] e820: reserve RAM buffer [mem 0x0ffe0000-0x0fffffff]
> > [    0.358596] NET: Registered protocol family 23
> > [    0.358985] Bluetooth: Core ver 2.20
> > [    0.359279] NET: Registered protocol family 31
> > [    0.359632] Bluetooth: HCI device and connection manager initialized
> > [    0.360013] Bluetooth: HCI socket layer initialized
> > [    0.360398] Bluetooth: L2CAP socket layer initialized
> > [    0.360810] Bluetooth: SCO socket layer initialized
> > [    0.361205] NET: Registered protocol family 8
> > [    0.361558] NET: Registered protocol family 20
> > [    0.361982] nfc: nfc_init: NFC Core ver 0.1
> > [    0.362336] NET: Registered protocol family 39
> > [    0.363124] clocksource: Switched to clocksource kvm-clock
> > [    0.363646] pnp: PnP ACPI init
> > [    0.363973] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (activ=
e)
> > [    0.364537] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (activ=
e)
> > [    0.365100] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (activ=
e)
> > [    0.365648] pnp 00:03: [dma 2]
> > [    0.365921] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (activ=
e)
> > [    0.366484] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (activ=
e)
> > [    0.367053] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (activ=
e)
> > [    0.367812] pnp: PnP ACPI: found 6 devices
> > [    0.399968] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xfffff=
f, max_idle_ns: 2085701024 ns
> > [    0.400723] pci 0000:00:01.3: BAR 7: [io  size 0x0040] has bogus ali=
gnment
> > [    0.401269] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> > [    0.401757] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff window]
> > [    0.402233] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff window]
> > [    0.402720] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf window]
> > [    0.403201] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff window]
> > [    0.403687] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff w=
indow]
> > [    0.404216] pci_bus 0000:00: resource 10 [mem 0x10000000-0xfebfffff =
window]
> > [    0.404796] NET: Registered protocol family 2
> > [    0.405330] TCP established hash table entries: 2048 (order: 1, 8192=
 bytes)
> > [    0.405894] TCP bind hash table entries: 2048 (order: 4, 73728 bytes)
> > [    0.406459] TCP: Hash tables configured (established 2048 bind 2048)
> > [    0.406970] UDP hash table entries: 128 (order: 1, 10240 bytes)
> > [    0.407446] UDP-Lite hash table entries: 128 (order: 1, 10240 bytes)
> > [    0.408014] NET: Registered protocol family 1
> > [    0.408370] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> > [    0.408842] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> > [    0.409298] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> > [    0.409797] pci 0000:00:02.0: Video device with shadowed ROM
> > [    0.410308] PCI: CLS 0 bytes, default 64
> > [    0.410734] Unpacking initramfs...
> > [    0.469196] Freeing initrd memory: 3276K (cfca5000 - cffd8000)
> > [    0.470094] has_svm: not amd
> > [    0.470324] kvm: no hardware support
> > [    0.471136] The force parameter has not been set to 1. The Iris powe=
roff handler will not be installed.
> > [    0.471880] spin_lock-torture:--- Start of test [debug]: nwriters_st=
ress=3D2 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interva=
l=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> > [    0.473199] spin_lock-torture: Creating torture_shuffle task
> > [    0.473660] spin_lock-torture: Creating torture_stutter task
> > [    0.474132] spin_lock-torture: torture_shuffle task started
> > [    0.474574] spin_lock-torture: Creating lock_torture_writer task
> > [    0.475040] spin_lock-torture: torture_stutter task started
> > [    0.475474] spin_lock-torture: Creating lock_torture_writer task
> > [    0.475939] spin_lock-torture: lock_torture_writer task started
> > [    0.476401] spin_lock-torture: Creating lock_torture_stats task
> > [    0.476870] spin_lock-torture: lock_torture_writer task started
> > [    0.477534] futex hash table entries: 16 (order: -3, 704 bytes)
> > [    0.478023] Initialise system trusted keyring
> > [    0.478468] spin_lock-torture: lock_torture_stats task started
> > [    0.482277] zpool: loaded
> > [    0.482568] VFS: Disk quotas dquot_6.6.0
> > [    0.482942] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096=
 bytes)
> > [    0.484222] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> > [    0.486250] NET: Registered protocol family 38
> > [    0.486675] Key type asymmetric registered
> > [    0.486998] Asymmetric key parser 'x509' registered
> > [    0.487374] Key type pkcs7_test registered
> > [    0.487693] test_string_helpers: Running tests...
> > [    0.488150] test_hexdump: Running tests...
> > [    0.488650] test_firmware: interface ready
> > [    0.488998] Running rhashtable test nelem=3D8, max_size=3D65536, shr=
inking=3D0
> > [    0.489536] Test 00:
> > [    0.490792]   Adding 50000 keys
> > [    0.524036]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.539049]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.539692]   Deleting 50000 keys
> > [    0.556226]   Duration of test: 65176864 ns
> > [    0.556573] Test 01:
> > [    0.557731]   Adding 50000 keys
> > [    0.591064]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.605867]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.606542]   Deleting 50000 keys
> > [    0.623755]   Duration of test: 65748395 ns
> > [    0.624329] Test 02:
> > [    0.625664]   Adding 50000 keys
> > [    0.678838]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.694899]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.695579]   Deleting 50000 keys
> > [    0.711964]   Duration of test: 85887981 ns
> > [    0.712297] Test 03:
> > [    0.713402]   Adding 50000 keys
> > [    0.745894]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.760487]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    0.761134]   Deleting 50000 keys
> > [    0.777346]   Duration of test: 63648561 ns
> > [    0.777683] Average test time: 70115450
> > [    0.779227] crc32: CRC_LE_BITS =3D 8, CRC_BE BITS =3D 8
> > [    0.779604] crc32: self tests passed, processed 225944 bytes in 6163=
82 nsec
> > [    0.780723] crc32c: CRC_LE_BITS =3D 8
> > [    0.780994] crc32c: self tests passed, processed 225944 bytes in 295=
763 nsec
> > [    0.816818] crc32_combine: 8373 self tests passed
> > [    0.852454] crc32c_combine: 8373 self tests passed
> > [    0.852908] rbtree testing -> 6823 cycles
> > [    1.133414] augmented rbtree testing -> 10164 cycles
> > [    1.548005] tsc: Refined TSC clocksource calibration: 2693.507 MHz
> > [    1.548484] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0=
x26d348cd811, max_idle_ns: 440795335366 ns
> > [    1.549281] ------------[ cut here ]------------
> > [    1.549643] kernel BUG at drivers/base/driver.c:153!
> > [    1.550005] invalid opcode: 0000 [#1] =

> > [    1.550005] CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.0-rc1-00064-=
g5f6a140 #2
> > [    1.550005] task: cf440000 ti: cf43c000 task.ti: cf43c000
> > [    1.550005] EIP: 0060:[<c1309078>] EFLAGS: 00010246 CPU: 0
> > [    1.550005] EIP is at driver_register+0x98/0xd0
> > [    1.550005] EAX: c1b19bac EBX: cf4d7a80 ECX: 00000000 EDX: c1b51b40
> > [    1.550005] ESI: c1bcd884 EDI: c1ba72e2 EBP: cf43df28 ESP: cf43df24
> > [    1.550005]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    1.550005] CR0: 80050033 CR2: 00000000 CR3: 01bf8000 CR4: 00040690
> > [    1.550005] Stack:
> > [    1.550005]  c1435019 cf43df30 c1ba72ef cf43df90 c1b8ab5c cf43df48 c=
1b8a4bd 00000000
> > [    1.550005]  cffdbf00 cf43df7c c10906fd 00000000 00060006 cffdbf48 c=
1aeedb0 c1a69053
> > [    1.550005]  cffdbf47 cffdbf48 00000200 00000006 c1be7c1c 0000025e c=
f43dfa4 c1b8aca1
> > [    1.550005] Call Trace:
> > [    1.550005]  [<c1435019>] ? ulpi_register_driver+0x19/0x30
> > [    1.550005]  [<c1ba72ef>] tusb1210_driver_init+0xd/0xf
> > [    1.550005]  [<c1b8ab5c>] do_one_initcall+0xcb/0x14d
> > [    1.550005]  [<c1b8a4bd>] ? repair_env_string+0x12/0x54
> > [    1.550005]  [<c10906fd>] ? parse_args+0x1bd/0x3c0
> > [    1.550005]  [<c1b8aca1>] ? kernel_init_freeable+0xc3/0x15b
> > [    1.550005]  [<c1b8acc1>] kernel_init_freeable+0xe3/0x15b
> > [    1.550005]  [<c178adb8>] kernel_init+0x8/0xc0
> > [    1.550005]  [<c1798a80>] ret_from_kernel_thread+0x20/0x30
> > [    1.550005]  [<c178adb0>] ? rest_init+0xb0/0xb0
> > [    1.550005] Code: 85 c0 75 17 8b 43 3c 31 d2 e8 25 fe ec ff 8d 65 f8=
 89 f0 5b 5e 5d c3 8d 74 26 00 89 d8 e8 01 eb ff ff 8d 65 f8 89 f0 5b 5e 5d=
 c3 <0f> 0b ff 33 68 58 f9 a8 c1 e8 f5 4d 48 00 59 8b 53 04 5e eb 92
> > [    1.550005] EIP: [<c1309078>] driver_register+0x98/0xd0 SS:ESP 0068:=
cf43df24
> > [    1.563040] ---[ end trace 23c59b24b9f0a1e9 ]---
> > [    1.563391] Kernel panic - not syncing: Fatal exception
> > [    1.563792] Kernel Offset: disabled
> > =

> > Elapsed time: 10
> > qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel /pkg/li=
nux/i386-randconfig-b0-09092043/gcc-4.9/5f6a140f30b4296ac6ef2dd275ed513c271=
80fbe/vmlinuz-4.2.0-rc1-00064-g5f6a140 -append 'hung_task_panic=3D1 earlypr=
intk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always=
_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=
=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 =
console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw lin=
k=3D/kbuild-tests/run-queue/kvm/i386-randconfig-b0-09092043/linux-devel:dev=
el-spot-201509091835:5f6a140f30b4296ac6ef2dd275ed513c27180fbe:bisect-linux-=
4/.vmlinuz-5f6a140f30b4296ac6ef2dd275ed513c27180fbe-20150909221328-9-kbuild=
 branch=3Dlinux-devel/devel-spot-201509091835 BOOT_IMAGE=3D/pkg/linux/i386-=
randconfig-b0-09092043/gcc-4.9/5f6a140f30b4296ac6ef2dd275ed513c27180fbe/vml=
inuz-4.2.0-rc1-00064-g5f6a140 drbd.minor_count=3D8'  -initrd /osimage/yocto=
/yocto-minimal-i386.cgz -m 256 -smp 1 -device e1000,netdev=3Dnet0 -netdev u=
ser,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlo=
caltime -drive file=3D/fs/sdc1/disk0-yocto-kbuild-28,media=3Ddisk,if=3Dvirt=
io -drive file=3D/fs/sdc1/disk1-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -d=
rive file=3D/fs/sdc1/disk2-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -drive =
file=3D/fs/sdc1/disk3-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/sdc1/disk4-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -drive file=3D/f=
s/sdc1/disk5-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sdc=
1/disk6-yocto-kbuild-28,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pi=
d-yocto-kbuild-28 -serial file:/dev/shm/kboot/serial-yocto-kbuild-28 -daemo=
nize -display none -monitor null =

> =

> > early console in setup code
> > [    0.000000] Initializing cgroup subsys cpu
> > [    0.000000] Linux version 4.2.0-rc1-00063-g04be76a (kbuild(a)lkp-ib0=
4) (gcc version 4.9.2 (Debian 4.9.2-10) ) #1 Wed Sep 9 22:16:49 CST 2015
> > [    0.000000] x86/fpu: Legacy x87 FPU detected.
> > [    0.000000] x86/fpu: Using 'lazy' FPU context switches.
> > [    0.000000] e820: BIOS-provided physical RAM map:
> > [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000012bdffff] u=
sable
> > [    0.000000] BIOS-e820: [mem 0x0000000012be0000-0x0000000012bfffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] r=
eserved
> > [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] r=
eserved
> > [    0.000000] Notice: NX (Execute Disable) protection cannot be enable=
d: non-PAE kernel!
> > [    0.000000] Hypervisor detected: KVM
> > [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> =
reserved
> > [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> > [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x100000
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
> > [    0.000000] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT  UC=
- UC  =

> > [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> > [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> > [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> > [    0.000000] found SMP MP-table at [mem 0x000f0e80-0x000f0e8f] mapped=
 at [c00f0e80]
> > [    0.000000]   mpc: f0e90-f0fac
> > [    0.000000] initial memory mapped: [mem 0x00000000-0x02bfffff]
> > [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> > [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> > [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> > [    0.000000] init_memory_mapping: [mem 0x10c00000-0x10ffffff]
> > [    0.000000]  [mem 0x10c00000-0x10ffffff] page 4M
> > [    0.000000] init_memory_mapping: [mem 0x00100000-0x10bfffff]
> > [    0.000000]  [mem 0x00100000-0x003fffff] page 4k
> > [    0.000000]  [mem 0x00400000-0x10bfffff] page 4M
> > [    0.000000] init_memory_mapping: [mem 0x11000000-0x12bdffff]
> > [    0.000000]  [mem 0x11000000-0x127fffff] page 4M
> > [    0.000000]  [mem 0x12800000-0x12bdffff] page 4k
> > [    0.000000] BRK [0x029a3000, 0x029a3fff] PGTABLE
> > [    0.000000] RAMDISK: [mem 0x11393000-0x12bd7fff]
> > [    0.000000] ACPI: Early table checksum verification disabled
> > [    0.000000] ACPI: RSDP 0x00000000000F0C60 000014 (v00 BOCHS )
> > [    0.000000] ACPI: RSDT 0x0000000012BE18BD 000034 (v01 BOCHS  BXPCRSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACP 0x0000000012BE0B37 000074 (v01 BOCHS  BXPCFAC=
P 00000001 BXPC 00000001)
> > [    0.000000] ACPI: DSDT 0x0000000012BE0040 000AF7 (v01 BOCHS  BXPCDSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> > [    0.000000] ACPI: SSDT 0x0000000012BE0BAB 000C5A (v01 BOCHS  BXPCSSD=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: APIC 0x0000000012BE1805 000080 (v01 BOCHS  BXPCAPI=
C 00000001 BXPC 00000001)
> > [    0.000000] ACPI: HPET 0x0000000012BE1885 000038 (v01 BOCHS  BXPCHPE=
T 00000001 BXPC 00000001)
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> > [    0.000000] 299MB LOWMEM available.
> > [    0.000000]   mapped low ram: 0 - 12be0000
> > [    0.000000]   low ram: 0 - 12be0000
> > [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> > [    0.000000] kvm-clock: cpu 0, msr 0:12bdf001, primary cpu clock
> > [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cyc=
les: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> > [    0.000000]   Normal   [mem 0x0000000001000000-0x0000000012bdffff]
> > [    0.000000] Movable zone start for each node
> > [    0.000000] Early memory node ranges
> > [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> > [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> > [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000001=
2bdffff]
> > [    0.000000] On node 0 totalpages: 76670
> > [    0.000000]   DMA zone: 40 pages used for memmap
> > [    0.000000]   DMA zone: 0 pages reserved
> > [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> > [    0.000000]   Normal zone: 710 pages used for memmap
> > [    0.000000]   Normal zone: 72672 pages, LIFO batch:15
> > [    0.000000] Using APIC driver default
> > [    0.000000] ACPI: PM-Timer IO Port: 0x608
> > [    0.000000] ACPI: Local APIC address 0xfee00000
> > [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> > [    0.000000] ACPI: NR_CPUS/possible_cpus limit of 1 reached.  Process=
or 1/0x1 ignored.
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
> > [    0.000000] mapped IOAPIC to ffffb000 (fec00000)
> > [    0.000000] KVM setup async PF for cpu 0
> > [    0.000000] kvm-stealtime: cpu 0, msr 1b08880
> > [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devi=
ces
> > [    0.000000] Booting paravirtualized kernel on KVM
> > [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycle=
s: 0xffffffff, max_idle_ns: 19112604462750000 ns
> > [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> > [    0.000000] pcpu-alloc: [0] 0 =

> > [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  =
Total pages: 75920
> > [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dt=
tyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled=
 rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_w=
atchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3D=
ttyS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuil=
d-tests/run-queue/kvm/i386-randconfig-b0-09092043/linux-devel:devel-spot-20=
1509091835:04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41:bisect-linux-4/.vmlinuz=
-04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41-20150909221659-43-ivb41 branch=3D=
linux-devel/devel-spot-201509091835 BOOT_IMAGE=3D/pkg/linux/i386-randconfig=
-b0-09092043/gcc-4.9/04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41/vmlinuz-4.2.0=
-rc1-00063-g04be76a drbd.minor_count=3D8
> > [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> > [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144=
 bytes)
> > [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 =
bytes)
> > [    0.000000] Initializing CPU#0
> > [    0.000000] Memory: 251820K/306680K available (7784K kernel code, 60=
2K rwdata, 3416K rodata, 428K init, 13964K bss, 54860K reserved, 0K cma-res=
erved)
> > [    0.000000] virtual kernel memory layout:
> > [    0.000000]     fixmap  : 0xfffa2000 - 0xfffff000   ( 372 kB)
> > [    0.000000]     vmalloc : 0xd33e0000 - 0xfffa0000   ( 715 MB)
> > [    0.000000]     lowmem  : 0xc0000000 - 0xd2be0000   ( 299 MB)
> > [    0.000000]       .init : 0xc1b8a000 - 0xc1bf5000   ( 428 kB)
> > [    0.000000]       .data : 0xc179a5d7 - 0xc1b889a0   (4024 kB)
> > [    0.000000]       .text : 0xc1000000 - 0xc179a5d7   (7785 kB)
> > [    0.000000] Checking if this processor honours the WP bit even in su=
pervisor mode...Ok.
> > [    0.000000] SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=
=3D1, Nodes=3D1
> > [    0.000000] NR_IRQS:2304 nr_irqs:256 16
> > [    0.000000] CPU 0 irqstacks, hard=3Dd0c08000 soft=3Dd0c0a000
> > [    0.000000] console [ttyS0] enabled
> > [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, I=
nc., Ingo Molnar
> > [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> > [    0.000000] ... MAX_LOCK_DEPTH:          48
> > [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> > [    0.000000] ... CLASSHASH_SIZE:          4096
> > [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> > [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> > [    0.000000] ... CHAINHASH_SIZE:          32768
> > [    0.000000]  memory used by lock dependency info: 4895 kB
> > [    0.000000]  per task-struct memory footprint: 1344 bytes
> > [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 19112604467 ns
> > [    0.000000] hpet clockevent registered
> > [    0.000000] tsc: Detected 2693.508 MHz processor
> > [    0.081050] Calibrating delay loop (skipped) preset value.. 5387.01 =
BogoMIPS (lpj=3D26935080)
> > [    0.081753] pid_max: default: 4096 minimum: 301
> > [    0.082122] ACPI: Core revision 20150619
> > [    0.083821] ACPI: All ACPI Tables successfully acquired
> > [    0.084316] Mount-cache hash table entries: 1024 (order: 0, 4096 byt=
es)
> > [    0.084874] Mountpoint-cache hash table entries: 1024 (order: 0, 409=
6 bytes)
> > [    0.085649] Initializing cgroup subsys memory
> > [    0.086016] Initializing cgroup subsys net_cls
> > [    0.086426] Initializing cgroup subsys perf_event
> > [    0.086864] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> > [    0.087310] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> > [    0.087788] CPU: Intel Common KVM processor (fam: 0f, model: 06, ste=
pping: 01)
> > [    0.090678] Performance Events: unsupported Netburst CPU model 6 no =
PMU driver, software events only.
> > [    0.091669] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> > [    0.092129] enabled ExtINT on CPU#0
> > [    0.093070] ENABLING IO-APIC IRQs
> > [    0.093393] init IO_APIC IRQs
> > [    0.093633]  apic 0 pin 0 not connected
> > [    0.093956] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:=
0 Active:0 Dest:1)
> > [    0.094644] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:=
0 Active:0 Dest:1)
> > [    0.095276] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:=
0 Active:0 Dest:1)
> > [    0.095948] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:=
0 Active:0 Dest:1)
> > [    0.096607] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:=
1 Active:0 Dest:1)
> > [    0.097241] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:=
0 Active:0 Dest:1)
> > [    0.097903] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:=
0 Active:0 Dest:1)
> > [    0.098578] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:=
0 Active:0 Dest:1)
> > [    0.099194] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:=
1 Active:0 Dest:1)
> > [    0.099887] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mod=
e:1 Active:0 Dest:1)
> > [    0.100600] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mod=
e:1 Active:0 Dest:1)
> > [    0.101246] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mod=
e:0 Active:0 Dest:1)
> > [    0.101938] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mod=
e:0 Active:0 Dest:1)
> > [    0.102602] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mod=
e:0 Active:0 Dest:1)
> > [    0.103239] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mod=
e:0 Active:0 Dest:1)
> > [    0.103924]  apic 0 pin 16 not connected
> > [    0.104235]  apic 0 pin 17 not connected
> > [    0.104611]  apic 0 pin 18 not connected
> > [    0.104930]  apic 0 pin 19 not connected
> > [    0.105243]  apic 0 pin 20 not connected
> > [    0.105587]  apic 0 pin 21 not connected
> > [    0.105905]  apic 0 pin 22 not connected
> > [    0.106254]  apic 0 pin 23 not connected
> > [    0.106745] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin=
2=3D-1
> > [    0.107365] Using local APIC timer interrupts.
> > [    0.107365] calibrating APIC timer ...
> > [    0.220947] ... lapic delta =3D 6249940
> > [    0.221350] ... PM-Timer delta =3D 360058
> > [    0.221762] ... PM-Timer result ok
> > [    0.222118] ..... delta 6249940
> > [    0.222457] ..... mult: 268432879
> > [    0.222796] ..... calibration result: 9999904
> > [    0.223242] ..... CPU clock speed is 2709.3370 MHz.
> > [    0.223752] ..... host bus clock speed is 999.9904 MHz.
> > [    0.224513] devtmpfs: initialized
> > [    0.225894] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfff=
fffff, max_idle_ns: 19112604462750000 ns
> > [    0.226969] prandom: seed boundary self test passed
> > [    0.227945] prandom: 100 self tests passed
> > [    0.228687] NET: Registered protocol family 16
> > [    0.229687] cpuidle: using governor ladder
> > [    0.236735] ACPI: bus type PCI registered
> > [    0.237323] PCI: PCI BIOS revision 2.10 entry at 0xfd456, last bus=
=3D0
> > [    0.238002] PCI: Using configuration type 1 for base access
> > [    0.242735] ACPI: Added _OSI(Module Device)
> > [    0.243187] ACPI: Added _OSI(Processor Device)
> > [    0.243656] ACPI: Added _OSI(3.0 _SCP Extensions)
> > [    0.244138] ACPI: Added _OSI(Processor Aggregator Device)
> > [    0.246995] ACPI: Interpreter enabled
> > [    0.247399] ACPI: (supports S0 S5)
> > [    0.247768] ACPI: Using IOAPIC for interrupt routing
> > [    0.248312] PCI: Using host bridge windows from ACPI; if necessary, =
use "pci=3Dnocrs" and report a bug
> > [    0.253435] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> > [    0.254085] acpi PNP0A03:00: _OSC: OS supports [Segments]
> > [    0.254670] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling A=
SPM
> > [    0.255413] acpi PNP0A03:00: fail to add MMCONFIG information, can't=
 access extended PCI configuration space under this bridge.
> > [    0.256668] PCI host bridge to bus 0000:00
> > [    0.257105] pci_bus 0000:00: root bus resource [bus 00-ff]
> > [    0.257685] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wi=
ndow]
> > [    0.258376] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff wi=
ndow]
> > [    0.259080] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff wi=
ndow]
> > [    0.259775] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf wi=
ndow]
> > [    0.260479] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff wi=
ndow]
> > [    0.261167] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000=
bffff window]
> > [    0.261951] pci_bus 0000:00: root bus resource [mem 0x12c00000-0xfeb=
fffff window]
> > [    0.262750] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> > [    0.263720] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> > [    0.264783] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> > [    0.277019] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
> > [    0.281944] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f=
0-0x01f7]
> > [    0.282689] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f=
6]
> > [    0.283351] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x017=
0-0x0177]
> > [    0.284082] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x037=
6]
> > [    0.284935] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> > [    0.285832] pci 0000:00:01.3: can't claim BAR 7 [io  0x0600-0x063f]:=
 address conflict with ACPI PM1a_EVT_BLK [io  0x0600-0x0603]
> > [    0.287025] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by =
PIIX4 SMB
> > [    0.287980] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> > [    0.293093] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff p=
ref]
> > [    0.298203] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> > [    0.335324] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff p=
ref]
> > [    0.336221] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> > [    0.341031] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> > [    0.345877] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> > [    0.367354] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff p=
ref]
> > [    0.368266] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> > [    0.373196] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> > [    0.378067] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> > [    0.400009] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> > [    0.404928] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> > [    0.409709] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> > [    0.431811] pci 0000:00:06.0: [1af4:1001] type 00 class 0x010000
> > [    0.436820] pci 0000:00:06.0: reg 0x10: [io  0xc0c0-0xc0ff]
> > [    0.441605] pci 0000:00:06.0: reg 0x14: [mem 0xfebf3000-0xfebf3fff]
> > [    0.463880] pci 0000:00:07.0: [1af4:1001] type 00 class 0x010000
> > [    0.468821] pci 0000:00:07.0: reg 0x10: [io  0xc100-0xc13f]
> > [    0.473621] pci 0000:00:07.0: reg 0x14: [mem 0xfebf4000-0xfebf4fff]
> > [    0.496068] pci 0000:00:08.0: [1af4:1001] type 00 class 0x010000
> > [    0.501024] pci 0000:00:08.0: reg 0x10: [io  0xc140-0xc17f]
> > [    0.505857] pci 0000:00:08.0: reg 0x14: [mem 0xfebf5000-0xfebf5fff]
> > [    0.527833] pci 0000:00:09.0: [1af4:1001] type 00 class 0x010000
> > [    0.532740] pci 0000:00:09.0: reg 0x10: [io  0xc180-0xc1bf]
> > [    0.537549] pci 0000:00:09.0: reg 0x14: [mem 0xfebf6000-0xfebf6fff]
> > [    0.559502] pci 0000:00:0a.0: [1af4:1001] type 00 class 0x010000
> > [    0.564429] pci 0000:00:0a.0: reg 0x10: [io  0xc1c0-0xc1ff]
> > [    0.569231] pci 0000:00:0a.0: reg 0x14: [mem 0xfebf7000-0xfebf7fff]
> > [    0.591135] pci 0000:00:0b.0: [8086:25ab] type 00 class 0x088000
> > [    0.593863] pci 0000:00:0b.0: reg 0x10: [mem 0xfebf8000-0xfebf800f]
> > [    0.607346] pci_bus 0000:00: on NUMA node 0
> > [    0.608176] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> > [    0.608957] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> > [    0.609707] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> > [    0.610450] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> > [    0.611149] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> > [    0.612068] ACPI: Enabled 16 GPEs in block 00 to 0F
> > [    0.612982] vgaarb: setting as boot device: PCI:0000:00:02.0
> > [    0.613555] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,=
owns=3Dio+mem,locks=3Dnone
> > [    0.614369] vgaarb: loaded
> > [    0.614649] vgaarb: bridge control possible 0000:00:02.0
> > [    0.615349] ACPI: bus type USB registered
> > [    0.615780] usbcore: registered new interface driver usbfs
> > [    0.616342] usbcore: registered new interface driver hub
> > [    0.616898] usbcore: registered new device driver usb
> > [    0.617446] pps_core: LinuxPPS API ver. 1 registered
> > [    0.617951] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodo=
lfo Giometti <giometti@linux.it>
> > [    0.618860] PTP clock support registered
> > [    0.619278] EDAC MC: Ver: 3.0.0
> > [    0.619790] EDAC DEBUG: edac_mc_sysfs_init: device mc created
> > [    0.620477] Advanced Linux Sound Architecture Driver Initialized.
> > [    0.621116] PCI: Using ACPI for IRQ routing
> > [    0.621538] PCI: pci_cache_line_size set to 64 bytes
> > [    0.622192] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> > [    0.622790] e820: reserve RAM buffer [mem 0x12be0000-0x13ffffff]
> > [    0.623583] NET: Registered protocol family 23
> > [    0.624071] Bluetooth: Core ver 2.20
> > [    0.624460] NET: Registered protocol family 31
> > [    0.624924] Bluetooth: HCI device and connection manager initialized
> > [    0.625569] Bluetooth: HCI socket layer initialized
> > [    0.626078] Bluetooth: L2CAP socket layer initialized
> > [    0.626605] Bluetooth: SCO socket layer initialized
> > [    0.627123] NET: Registered protocol family 8
> > [    0.627570] NET: Registered protocol family 20
> > [    0.628103] nfc: nfc_init: NFC Core ver 0.1
> > [    0.628553] NET: Registered protocol family 39
> > [    0.629458] clocksource: Switched to clocksource kvm-clock
> > [    0.630119] pnp: PnP ACPI init
> > [    0.630525] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (activ=
e)
> > [    0.631243] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (activ=
e)
> > [    0.631950] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (activ=
e)
> > [    0.632648] pnp 00:03: [dma 2]
> > [    0.633008] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (activ=
e)
> > [    0.633736] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (activ=
e)
> > [    0.634485] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (activ=
e)
> > [    0.635401] pnp: PnP ACPI: found 6 devices
> > [    0.670798] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xfffff=
f, max_idle_ns: 2085701024 ns
> > [    0.671742] pci 0000:00:01.3: BAR 7: [io  size 0x0040] has bogus ali=
gnment
> > [    0.672454] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> > [    0.673086] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff window]
> > [    0.673701] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff window]
> > [    0.674325] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf window]
> > [    0.674956] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff window]
> > [    0.675578] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff w=
indow]
> > [    0.676278] pci_bus 0000:00: resource 10 [mem 0x12c00000-0xfebfffff =
window]
> > [    0.677025] NET: Registered protocol family 2
> > [    0.677660] TCP established hash table entries: 4096 (order: 2, 1638=
4 bytes)
> > [    0.678396] TCP bind hash table entries: 4096 (order: 5, 147456 byte=
s)
> > [    0.679194] TCP: Hash tables configured (established 4096 bind 4096)
> > [    0.679876] UDP hash table entries: 256 (order: 2, 20480 bytes)
> > [    0.680496] UDP-Lite hash table entries: 256 (order: 2, 20480 bytes)
> > [    0.681239] NET: Registered protocol family 1
> > [    0.681705] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> > [    0.682329] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> > [    0.682936] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> > [    0.683582] pci 0000:00:02.0: Video device with shadowed ROM
> > [    0.684223] PCI: CLS 0 bytes, default 64
> > [    0.684704] Unpacking initramfs...
> > [    1.165882] Freeing initrd memory: 24852K (d1393000 - d2bd8000)
> > [    1.166955] has_svm: not amd
> > [    1.167266] kvm: no hardware support
> > [    1.168179] PCLMULQDQ-NI instructions are not detected.
> > [    1.168726] The force parameter has not been set to 1. The Iris powe=
roff handler will not be installed.
> > [    1.169706] spin_lock-torture:--- Start of test [debug]: nwriters_st=
ress=3D2 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interva=
l=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> > [    1.171471] spin_lock-torture: Creating torture_shuffle task
> > [    1.172083] spin_lock-torture: Creating torture_stutter task
> > [    1.172679] spin_lock-torture: torture_shuffle task started
> > [    1.173260] spin_lock-torture: Creating lock_torture_writer task
> > [    1.173889] spin_lock-torture: torture_stutter task started
> > [    1.174464] spin_lock-torture: Creating lock_torture_writer task
> > [    1.175092] spin_lock-torture: lock_torture_writer task started
> > [    1.175707] spin_lock-torture: Creating lock_torture_stats task
> > [    1.176326] spin_lock-torture: lock_torture_writer task started
> > [    1.177161] futex hash table entries: 16 (order: -3, 704 bytes)
> > [    1.177786] Initialise system trusted keyring
> > [    1.178357] spin_lock-torture: lock_torture_stats task started
> > [    1.182189] zpool: loaded
> > [    1.182558] VFS: Disk quotas dquot_6.6.0
> > [    1.183047] VFS: Dquot-cache hash table entries: 1024 (order 0, 4096=
 bytes)
> > [    1.184658] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> > [    1.186797] NET: Registered protocol family 38
> > [    1.187285] Key type asymmetric registered
> > [    1.187717] Asymmetric key parser 'x509' registered
> > [    1.188224] Key type pkcs7_test registered
> > [    1.188650] test_string_helpers: Running tests...
> > [    1.189231] test_hexdump: Running tests...
> > [    1.189781] test_firmware: interface ready
> > [    1.190250] Running rhashtable test nelem=3D8, max_size=3D65536, shr=
inking=3D0
> > [    1.190935] Test 00:
> > [    1.192473]   Adding 50000 keys
> > [    1.226794]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.242962]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.243810]   Deleting 50000 keys
> > [    1.260789]   Duration of test: 67979293 ns
> > [    1.261268] Test 01:
> > [    1.262707]   Adding 50000 keys
> > [    1.297341]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.313094]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.313984]   Deleting 50000 keys
> > [    1.330937]   Duration of test: 67872140 ns
> > [    1.331385] Test 02:
> > [    1.332879]   Adding 50000 keys
> > [    1.367612]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.383344]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.384214]   Deleting 50000 keys
> > [    1.401125]   Duration of test: 67895571 ns
> > [    1.401576] Test 03:
> > [    1.403071]   Adding 50000 keys
> > [    1.437560]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.453280]   Traversal complete: counted=3D50000, nelems=3D50000, e=
ntries=3D50000, table-jumps=3D0
> > [    1.454163]   Deleting 50000 keys
> > [    1.471057]   Duration of test: 67648676 ns
> > [    1.471509] Average test time: 67848920
> > [    1.473168] crc32: CRC_LE_BITS =3D 8, CRC_BE BITS =3D 8
> > [    1.473684] crc32: self tests passed, processed 225944 bytes in 6179=
49 nsec
> > [    1.475016] crc32c: CRC_LE_BITS =3D 8
> > [    1.475384] crc32c: self tests passed, processed 225944 bytes in 306=
025 nsec
> > [    1.512429] crc32_combine: 8373 self tests passed
> > [    1.549236] crc32c_combine: 8373 self tests passed
> > [    1.549821] rbtree testing -> 6877 cycles
> > [    1.833340] augmented rbtree testing -> 10042 cycles
> > [    2.244923] tsc: Refined TSC clocksource calibration: 2693.506 MHz
> > [    2.245567] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0=
x26d347b2dd9, max_idle_ns: 440795223616 ns
> > [    2.246646] ------------[ cut here ]------------
> > [    2.247126] kernel BUG at drivers/base/driver.c:153!
> > [    2.247809] invalid opcode: 0000 [#1] =

> > [    2.248226] CPU: 0 PID: 1 Comm: swapper Not tainted 4.2.0-rc1-00063-=
g04be76a #1
> > [    2.248968] task: d0c40000 ti: d0c3c000 task.ti: d0c3c000
> > [    2.249500] EIP: 0060:[<c1308fe8>] EFLAGS: 00010246 CPU: 0
> > [    2.250055] EIP is at driver_register+0x98/0xd0
> > [    2.250510] EAX: c1b19b6c EBX: ccb51280 ECX: 00000000 EDX: c1b51b00
> > [    2.251138] ESI: c1bcd884 EDI: c1ba72e2 EBP: d0c3df28 ESP: d0c3df24
> > [    2.251762]  DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068
> > [    2.252307] CR0: 8005003b CR2: 00000000 CR3: 01bf8000 CR4: 00000690
> > [    2.252940] Stack:
> > [    2.253151]  c1434f89 d0c3df30 c1ba72ef d0c3df90 c1b8ab5c d0c3df48 c=
1b8a4bd 00000000
> > [    2.254043]  d2bd9700 d0c3df7c c10906fd 00000000 00060006 d2bd9728 c=
1aeece4 c1a68f93
> > [    2.254935]  d2bd9727 d2bd9728 00000200 00000006 c1be7c1c 0000025e d=
0c3dfa4 c1b8aca1
> > [    2.255819] Call Trace:
> > [    2.256074]  [<c1434f89>] ? ulpi_register_driver+0x19/0x30
> > [    2.256624]  [<c1ba72ef>] tusb1210_driver_init+0xd/0xf
> > [    2.257148]  [<c1b8ab5c>] do_one_initcall+0xcb/0x14d
> > [    2.257655]  [<c1b8a4bd>] ? repair_env_string+0x12/0x54
> > [    2.258182]  [<c10906fd>] ? parse_args+0x1bd/0x3c0
> > [    2.258663]  [<c1b8aca1>] ? kernel_init_freeable+0xc3/0x15b
> > [    2.259226]  [<c1b8acc1>] kernel_init_freeable+0xe3/0x15b
> > [    2.259764]  [<c178ad28>] kernel_init+0x8/0xc0
> > [    2.260217]  [<c1798a00>] ret_from_kernel_thread+0x20/0x30
> > [    2.260766]  [<c178ad20>] ? rest_init+0xb0/0xb0
> > [    2.261233] Code: 85 c0 75 17 8b 43 3c 31 d2 e8 25 fe ec ff 8d 65 f8=
 89 f0 5b 5e 5d c3 8d 74 26 00 89 d8 e8 01 eb ff ff 8d 65 f8 89 f0 5b 5e 5d=
 c3 <0f> 0b ff 33 68 98 f8 a8 c1 e8 f5 4d 48 00 59 8b 53 04 5e eb 92
> > [    2.264079] EIP: [<c1308fe8>] driver_register+0x98/0xd0 SS:ESP 0068:=
d0c3df24
> > [    2.264827] ---[ end trace 971b10b1c34e9c43 ]---
> > [    2.265301] Kernel panic - not syncing: Fatal exception
> > [    2.265827] Kernel Offset: disabled
> > =

> > Elapsed time: 10
> > qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /pkg/linux/i386-randc=
onfig-b0-09092043/gcc-4.9/04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41/vmlinuz-=
4.2.0-rc1-00063-g04be76a -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,1=
15200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupd=
ate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdo=
g=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,=
115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-test=
s/run-queue/kvm/i386-randconfig-b0-09092043/linux-devel:devel-spot-20150909=
1835:04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41:bisect-linux-4/.vmlinuz-04be7=
6a9b067f1f9ecc2605ad5ef26dc5ec01e41-20150909221659-43-ivb41 branch=3Dlinux-=
devel/devel-spot-201509091835 BOOT_IMAGE=3D/pkg/linux/i386-randconfig-b0-09=
092043/gcc-4.9/04be76a9b067f1f9ecc2605ad5ef26dc5ec01e41/vmlinuz-4.2.0-rc1-0=
0063-g04be76a drbd.minor_count=3D8'  -initrd /osimage/quantal/quantal-core-=
i386.cgz -m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -=
boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive =
file=3D/fs/sda5/disk0-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive fil=
e=3D/fs/sda5/disk1-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/sda5/disk2-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive file=3D=
/fs/sda5/disk3-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive file=3D/fs=
/sda5/disk4-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sd=
a5/disk5-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda5/=
disk6-quantal-ivb41-100,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pi=
d-quantal-ivb41-100 -serial file:/dev/shm/kboot/serial-quantal-ivb41-100 -d=
aemonize -display none -monitor null =

> =

> > #
> > # Automatically generated file; DO NOT EDIT.
> > # Linux/i386 4.2.0-rc1 Kernel Configuration
> > #
> > # CONFIG_64BIT is not set
> > CONFIG_X86_32=3Dy
> > CONFIG_X86=3Dy
> > CONFIG_INSTRUCTION_DECODER=3Dy
> > CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dy
> > CONFIG_OUTPUT_FORMAT=3D"elf32-i386"
> > CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/i386_defconfig"
> > CONFIG_LOCKDEP_SUPPORT=3Dy
> > CONFIG_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> > CONFIG_MMU=3Dy
> > CONFIG_NEED_SG_DMA_LENGTH=3Dy
> > CONFIG_GENERIC_ISA_DMA=3Dy
> > CONFIG_GENERIC_BUG=3Dy
> > CONFIG_GENERIC_HWEIGHT=3Dy
> > CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> > CONFIG_RWSEM_XCHGADD_ALGORITHM=3Dy
> > CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> > CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> > CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> > CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> > CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> > CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> > CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> > CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> > CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> > CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> > CONFIG_X86_32_LAZY_GS=3Dy
> > CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
> > CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> > CONFIG_FIX_EARLYCON_MEM=3Dy
> > CONFIG_PGTABLE_LEVELS=3D2
> > CONFIG_DEFCONFIG_LIST=3D"/lib/modules/$UNAME_RELEASE/.config"
> > CONFIG_IRQ_WORK=3Dy
> > CONFIG_BUILDTIME_EXTABLE_SORT=3Dy
> > =

> > #
> > # General setup
> > #
> > CONFIG_BROKEN_ON_SMP=3Dy
> > CONFIG_INIT_ENV_ARG_LIMIT=3D32
> > CONFIG_CROSS_COMPILE=3D""
> > # CONFIG_COMPILE_TEST is not set
> > CONFIG_LOCALVERSION=3D""
> > CONFIG_LOCALVERSION_AUTO=3Dy
> > CONFIG_HAVE_KERNEL_GZIP=3Dy
> > CONFIG_HAVE_KERNEL_BZIP2=3Dy
> > CONFIG_HAVE_KERNEL_LZMA=3Dy
> > CONFIG_HAVE_KERNEL_XZ=3Dy
> > CONFIG_HAVE_KERNEL_LZO=3Dy
> > CONFIG_HAVE_KERNEL_LZ4=3Dy
> > # CONFIG_KERNEL_GZIP is not set
> > # CONFIG_KERNEL_BZIP2 is not set
> > CONFIG_KERNEL_LZMA=3Dy
> > # CONFIG_KERNEL_XZ is not set
> > # CONFIG_KERNEL_LZO is not set
> > # CONFIG_KERNEL_LZ4 is not set
> > CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> > # CONFIG_SYSVIPC is not set
> > CONFIG_POSIX_MQUEUE=3Dy
> > CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> > # CONFIG_CROSS_MEMORY_ATTACH is not set
> > CONFIG_FHANDLE=3Dy
> > CONFIG_USELIB=3Dy
> > # CONFIG_AUDIT is not set
> > CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> > =

> > #
> > # IRQ subsystem
> > #
> > CONFIG_GENERIC_IRQ_PROBE=3Dy
> > CONFIG_GENERIC_IRQ_SHOW=3Dy
> > CONFIG_GENERIC_IRQ_CHIP=3Dy
> > CONFIG_IRQ_DOMAIN=3Dy
> > CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> > CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> > CONFIG_IRQ_FORCED_THREADING=3Dy
> > CONFIG_SPARSE_IRQ=3Dy
> > CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> > CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> > CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> > CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> > CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> > CONFIG_GENERIC_CMOS_UPDATE=3Dy
> > =

> > #
> > # Timers subsystem
> > #
> > CONFIG_TICK_ONESHOT=3Dy
> > CONFIG_HZ_PERIODIC=3Dy
> > # CONFIG_NO_HZ_IDLE is not set
> > # CONFIG_NO_HZ is not set
> > CONFIG_HIGH_RES_TIMERS=3Dy
> > =

> > #
> > # CPU/Task time and stats accounting
> > #
> > CONFIG_TICK_CPU_ACCOUNTING=3Dy
> > # CONFIG_IRQ_TIME_ACCOUNTING is not set
> > # CONFIG_BSD_PROCESS_ACCT is not set
> > CONFIG_TASKSTATS=3Dy
> > CONFIG_TASK_DELAY_ACCT=3Dy
> > # CONFIG_TASK_XACCT is not set
> > =

> > #
> > # RCU Subsystem
> > #
> > CONFIG_TINY_RCU=3Dy
> > # CONFIG_RCU_EXPERT is not set
> > CONFIG_SRCU=3Dy
> > # CONFIG_TASKS_RCU is not set
> > CONFIG_RCU_STALL_COMMON=3Dy
> > # CONFIG_TREE_RCU_TRACE is not set
> > # CONFIG_RCU_EXPEDITE_BOOT is not set
> > CONFIG_BUILD_BIN2C=3Dy
> > CONFIG_IKCONFIG=3Dy
> > # CONFIG_IKCONFIG_PROC is not set
> > CONFIG_LOG_BUF_SHIFT=3D17
> > CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> > CONFIG_CGROUPS=3Dy
> > # CONFIG_CGROUP_DEBUG is not set
> > # CONFIG_CGROUP_FREEZER is not set
> > # CONFIG_CGROUP_DEVICE is not set
> > # CONFIG_CPUSETS is not set
> > # CONFIG_CGROUP_CPUACCT is not set
> > CONFIG_PAGE_COUNTER=3Dy
> > CONFIG_MEMCG=3Dy
> > # CONFIG_MEMCG_KMEM is not set
> > CONFIG_CGROUP_PERF=3Dy
> > CONFIG_CGROUP_SCHED=3Dy
> > CONFIG_FAIR_GROUP_SCHED=3Dy
> > # CONFIG_CFS_BANDWIDTH is not set
> > CONFIG_RT_GROUP_SCHED=3Dy
> > CONFIG_CHECKPOINT_RESTORE=3Dy
> > # CONFIG_NAMESPACES is not set
> > CONFIG_SCHED_AUTOGROUP=3Dy
> > # CONFIG_SYSFS_DEPRECATED is not set
> > CONFIG_RELAY=3Dy
> > CONFIG_BLK_DEV_INITRD=3Dy
> > CONFIG_INITRAMFS_SOURCE=3D""
> > CONFIG_RD_GZIP=3Dy
> > # CONFIG_RD_BZIP2 is not set
> > CONFIG_RD_LZMA=3Dy
> > # CONFIG_RD_XZ is not set
> > CONFIG_RD_LZO=3Dy
> > # CONFIG_RD_LZ4 is not set
> > # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> > CONFIG_SYSCTL=3Dy
> > CONFIG_ANON_INODES=3Dy
> > CONFIG_HAVE_UID16=3Dy
> > CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> > CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> > CONFIG_BPF=3Dy
> > CONFIG_EXPERT=3Dy
> > CONFIG_UID16=3Dy
> > CONFIG_MULTIUSER=3Dy
> > CONFIG_SGETMASK_SYSCALL=3Dy
> > # CONFIG_SYSFS_SYSCALL is not set
> > # CONFIG_SYSCTL_SYSCALL is not set
> > CONFIG_KALLSYMS=3Dy
> > CONFIG_KALLSYMS_ALL=3Dy
> > CONFIG_PRINTK=3Dy
> > CONFIG_BUG=3Dy
> > # CONFIG_ELF_CORE is not set
> > CONFIG_PCSPKR_PLATFORM=3Dy
> > # CONFIG_BASE_FULL is not set
> > CONFIG_FUTEX=3Dy
> > CONFIG_EPOLL=3Dy
> > CONFIG_SIGNALFD=3Dy
> > CONFIG_TIMERFD=3Dy
> > CONFIG_EVENTFD=3Dy
> > CONFIG_BPF_SYSCALL=3Dy
> > CONFIG_SHMEM=3Dy
> > CONFIG_AIO=3Dy
> > # CONFIG_ADVISE_SYSCALLS is not set
> > CONFIG_PCI_QUIRKS=3Dy
> > # CONFIG_EMBEDDED is not set
> > CONFIG_HAVE_PERF_EVENTS=3Dy
> > CONFIG_PERF_USE_VMALLOC=3Dy
> > =

> > #
> > # Kernel Performance Events And Counters
> > #
> > CONFIG_PERF_EVENTS=3Dy
> > CONFIG_DEBUG_PERF_USE_VMALLOC=3Dy
> > # CONFIG_VM_EVENT_COUNTERS is not set
> > # CONFIG_SLUB_DEBUG is not set
> > CONFIG_COMPAT_BRK=3Dy
> > # CONFIG_SLAB is not set
> > CONFIG_SLUB=3Dy
> > # CONFIG_SLOB is not set
> > CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> > CONFIG_PROFILING=3Dy
> > # CONFIG_OPROFILE is not set
> > CONFIG_HAVE_OPROFILE=3Dy
> > CONFIG_OPROFILE_NMI_TIMER=3Dy
> > # CONFIG_JUMP_LABEL is not set
> > # CONFIG_UPROBES is not set
> > # CONFIG_HAVE_64BIT_ALIGNED_ACCESS is not set
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> > CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> > CONFIG_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_IOREMAP_PROT=3Dy
> > CONFIG_HAVE_KPROBES=3Dy
> > CONFIG_HAVE_KRETPROBES=3Dy
> > CONFIG_HAVE_OPTPROBES=3Dy
> > CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> > CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> > CONFIG_HAVE_DMA_ATTRS=3Dy
> > CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> > CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> > CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> > CONFIG_HAVE_DMA_API_DEBUG=3Dy
> > CONFIG_HAVE_HW_BREAKPOINT=3Dy
> > CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> > CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> > CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> > CONFIG_HAVE_PERF_REGS=3Dy
> > CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> > CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> > CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> > CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> > CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> > CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> > CONFIG_ARCH_WANT_IPC_PARSE_VERSION=3Dy
> > CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> > CONFIG_SECCOMP_FILTER=3Dy
> > CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> > # CONFIG_CC_STACKPROTECTOR is not set
> > CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> > # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> > # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> > CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> > CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> > CONFIG_MODULES_USE_ELF_REL=3Dy
> > CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> > CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> > CONFIG_CLONE_BACKWARDS=3Dy
> > CONFIG_OLD_SIGSUSPEND3=3Dy
> > CONFIG_OLD_SIGACTION=3Dy
> > =

> > #
> > # GCOV-based kernel profiling
> > #
> > # CONFIG_GCOV_KERNEL is not set
> > CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> > CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> > CONFIG_RT_MUTEXES=3Dy
> > CONFIG_BASE_SMALL=3D1
> > # CONFIG_MODULES is not set
> > CONFIG_MODULES_TREE_LOOKUP=3Dy
> > # CONFIG_BLOCK is not set
> > CONFIG_PREEMPT_NOTIFIERS=3Dy
> > CONFIG_ASN1=3Dy
> > CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> > CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> > CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> > CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> > # CONFIG_FREEZER is not set
> > =

> > #
> > # Processor type and features
> > #
> > CONFIG_ZONE_DMA=3Dy
> > # CONFIG_SMP is not set
> > CONFIG_X86_FEATURE_NAMES=3Dy
> > CONFIG_X86_MPPARSE=3Dy
> > # CONFIG_X86_EXTENDED_PLATFORM is not set
> > # CONFIG_X86_INTEL_LPSS is not set
> > # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> > CONFIG_IOSF_MBI=3Dy
> > CONFIG_IOSF_MBI_DEBUG=3Dy
> > CONFIG_X86_32_IRIS=3Dy
> > # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> > CONFIG_HYPERVISOR_GUEST=3Dy
> > CONFIG_PARAVIRT=3Dy
> > # CONFIG_PARAVIRT_DEBUG is not set
> > CONFIG_KVM_GUEST=3Dy
> > # CONFIG_KVM_DEBUG_FS is not set
> > # CONFIG_LGUEST_GUEST is not set
> > # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> > CONFIG_PARAVIRT_CLOCK=3Dy
> > CONFIG_NO_BOOTMEM=3Dy
> > # CONFIG_M486 is not set
> > # CONFIG_M586 is not set
> > # CONFIG_M586TSC is not set
> > CONFIG_M586MMX=3Dy
> > # CONFIG_M686 is not set
> > # CONFIG_MPENTIUMII is not set
> > # CONFIG_MPENTIUMIII is not set
> > # CONFIG_MPENTIUMM is not set
> > # CONFIG_MPENTIUM4 is not set
> > # CONFIG_MK6 is not set
> > # CONFIG_MK7 is not set
> > # CONFIG_MK8 is not set
> > # CONFIG_MCRUSOE is not set
> > # CONFIG_MEFFICEON is not set
> > # CONFIG_MWINCHIPC6 is not set
> > # CONFIG_MWINCHIP3D is not set
> > # CONFIG_MELAN is not set
> > # CONFIG_MGEODEGX1 is not set
> > # CONFIG_MGEODE_LX is not set
> > # CONFIG_MCYRIXIII is not set
> > # CONFIG_MVIAC3_2 is not set
> > # CONFIG_MVIAC7 is not set
> > # CONFIG_MCORE2 is not set
> > # CONFIG_MATOM is not set
> > # CONFIG_X86_GENERIC is not set
> > CONFIG_X86_INTERNODE_CACHE_SHIFT=3D5
> > CONFIG_X86_L1_CACHE_SHIFT=3D5
> > CONFIG_X86_PPRO_FENCE=3Dy
> > CONFIG_X86_F00F_BUG=3Dy
> > CONFIG_X86_ALIGNMENT_16=3Dy
> > CONFIG_X86_INTEL_USERCOPY=3Dy
> > CONFIG_X86_TSC=3Dy
> > CONFIG_X86_MINIMUM_CPU_FAMILY=3D4
> > # CONFIG_PROCESSOR_SELECT is not set
> > CONFIG_CPU_SUP_INTEL=3Dy
> > CONFIG_CPU_SUP_CYRIX_32=3Dy
> > CONFIG_CPU_SUP_AMD=3Dy
> > CONFIG_CPU_SUP_CENTAUR=3Dy
> > CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> > CONFIG_CPU_SUP_UMC_32=3Dy
> > CONFIG_HPET_TIMER=3Dy
> > # CONFIG_DMI is not set
> > CONFIG_NR_CPUS=3D1
> > # CONFIG_PREEMPT_NONE is not set
> > CONFIG_PREEMPT_VOLUNTARY=3Dy
> > # CONFIG_PREEMPT is not set
> > CONFIG_PREEMPT_COUNT=3Dy
> > CONFIG_UP_LATE_INIT=3Dy
> > CONFIG_X86_UP_APIC=3Dy
> > # CONFIG_X86_UP_IOAPIC is not set
> > CONFIG_X86_LOCAL_APIC=3Dy
> > CONFIG_X86_IO_APIC=3Dy
> > # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> > # CONFIG_X86_MCE is not set
> > CONFIG_VM86=3Dy
> > CONFIG_X86_16BIT=3Dy
> > CONFIG_X86_ESPFIX32=3Dy
> > CONFIG_TOSHIBA=3Dy
> > # CONFIG_I8K is not set
> > # CONFIG_X86_REBOOTFIXUPS is not set
> > CONFIG_MICROCODE=3Dy
> > # CONFIG_MICROCODE_INTEL is not set
> > CONFIG_MICROCODE_AMD=3Dy
> > CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> > # CONFIG_MICROCODE_EARLY is not set
> > CONFIG_X86_MSR=3Dy
> > # CONFIG_X86_CPUID is not set
> > CONFIG_NOHIGHMEM=3Dy
> > # CONFIG_HIGHMEM4G is not set
> > # CONFIG_HIGHMEM64G is not set
> > CONFIG_VMSPLIT_3G=3Dy
> > # CONFIG_VMSPLIT_3G_OPT is not set
> > # CONFIG_VMSPLIT_2G is not set
> > # CONFIG_VMSPLIT_2G_OPT is not set
> > # CONFIG_VMSPLIT_1G is not set
> > CONFIG_PAGE_OFFSET=3D0xC0000000
> > # CONFIG_X86_PAE is not set
> > CONFIG_NEED_NODE_MEMMAP_SIZE=3Dy
> > CONFIG_ARCH_FLATMEM_ENABLE=3Dy
> > CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> > CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> > CONFIG_ILLEGAL_POINTER_VALUE=3D0
> > CONFIG_SELECT_MEMORY_MODEL=3Dy
> > # CONFIG_FLATMEM_MANUAL is not set
> > CONFIG_SPARSEMEM_MANUAL=3Dy
> > CONFIG_SPARSEMEM=3Dy
> > CONFIG_HAVE_MEMORY_PRESENT=3Dy
> > CONFIG_SPARSEMEM_STATIC=3Dy
> > CONFIG_HAVE_MEMBLOCK=3Dy
> > CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> > CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> > # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> > CONFIG_SPLIT_PTLOCK_CPUS=3D4
> > CONFIG_MEMORY_BALLOON=3Dy
> > CONFIG_BALLOON_COMPACTION=3Dy
> > CONFIG_COMPACTION=3Dy
> > CONFIG_MIGRATION=3Dy
> > # CONFIG_PHYS_ADDR_T_64BIT is not set
> > CONFIG_ZONE_DMA_FLAG=3D1
> > CONFIG_VIRT_TO_BUS=3Dy
> > CONFIG_MMU_NOTIFIER=3Dy
> > CONFIG_KSM=3Dy
> > CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> > # CONFIG_TRANSPARENT_HUGEPAGE is not set
> > CONFIG_NEED_PER_CPU_KM=3Dy
> > CONFIG_CLEANCACHE=3Dy
> > # CONFIG_CMA is not set
> > CONFIG_ZPOOL=3Dy
> > # CONFIG_ZBUD is not set
> > CONFIG_ZSMALLOC=3Dy
> > # CONFIG_PGTABLE_MAPPING is not set
> > CONFIG_ZSMALLOC_STAT=3Dy
> > CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> > CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> > # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> > CONFIG_X86_RESERVE_LOW=3D64
> > CONFIG_MATH_EMULATION=3Dy
> > CONFIG_MTRR=3Dy
> > # CONFIG_MTRR_SANITIZER is not set
> > # CONFIG_X86_PAT is not set
> > # CONFIG_ARCH_RANDOM is not set
> > # CONFIG_X86_SMAP is not set
> > CONFIG_X86_INTEL_MPX=3Dy
> > # CONFIG_EFI is not set
> > CONFIG_SECCOMP=3Dy
> > CONFIG_HZ_100=3Dy
> > # CONFIG_HZ_250 is not set
> > # CONFIG_HZ_300 is not set
> > # CONFIG_HZ_1000 is not set
> > CONFIG_HZ=3D100
> > CONFIG_SCHED_HRTICK=3Dy
> > CONFIG_KEXEC=3Dy
> > CONFIG_PHYSICAL_START=3D0x1000000
> > # CONFIG_RELOCATABLE is not set
> > CONFIG_PHYSICAL_ALIGN=3D0x200000
> > # CONFIG_COMPAT_VDSO is not set
> > # CONFIG_CMDLINE_BOOL is not set
> > =

> > #
> > # Power management and ACPI options
> > #
> > # CONFIG_SUSPEND is not set
> > CONFIG_PM=3Dy
> > CONFIG_PM_DEBUG=3Dy
> > CONFIG_PM_ADVANCED_DEBUG=3Dy
> > CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> > CONFIG_ACPI=3Dy
> > CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> > CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> > # CONFIG_ACPI_PROCFS_POWER is not set
> > CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> > # CONFIG_ACPI_EC_DEBUGFS is not set
> > CONFIG_ACPI_AC=3Dy
> > CONFIG_ACPI_BATTERY=3Dy
> > CONFIG_ACPI_BUTTON=3Dy
> > # CONFIG_ACPI_VIDEO is not set
> > CONFIG_ACPI_FAN=3Dy
> > # CONFIG_ACPI_DOCK is not set
> > CONFIG_ACPI_PROCESSOR=3Dy
> > # CONFIG_ACPI_IPMI is not set
> > # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> > CONFIG_ACPI_THERMAL=3Dy
> > CONFIG_ACPI_CUSTOM_DSDT_FILE=3D""
> > # CONFIG_ACPI_CUSTOM_DSDT is not set
> > # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> > # CONFIG_ACPI_DEBUG is not set
> > # CONFIG_ACPI_PCI_SLOT is not set
> > CONFIG_X86_PM_TIMER=3Dy
> > # CONFIG_ACPI_CONTAINER is not set
> > CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> > # CONFIG_ACPI_SBS is not set
> > # CONFIG_ACPI_HED is not set
> > # CONFIG_ACPI_CUSTOM_METHOD is not set
> > # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> > CONFIG_HAVE_ACPI_APEI=3Dy
> > CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> > # CONFIG_ACPI_APEI is not set
> > # CONFIG_PMIC_OPREGION is not set
> > CONFIG_SFI=3Dy
> > =

> > #
> > # CPU Frequency scaling
> > #
> > CONFIG_CPU_FREQ=3Dy
> > CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> > CONFIG_CPU_FREQ_STAT=3Dy
> > CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> > CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=3Dy
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
> > # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> > CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> > # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> > CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> > CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> > CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> > =

> > #
> > # CPU frequency scaling drivers
> > #
> > # CONFIG_X86_INTEL_PSTATE is not set
> > # CONFIG_X86_PCC_CPUFREQ is not set
> > # CONFIG_X86_ACPI_CPUFREQ is not set
> > CONFIG_X86_POWERNOW_K6=3Dy
> > # CONFIG_X86_POWERNOW_K7 is not set
> > # CONFIG_X86_GX_SUSPMOD is not set
> > CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> > CONFIG_X86_SPEEDSTEP_CENTRINO_TABLE=3Dy
> > CONFIG_X86_SPEEDSTEP_ICH=3Dy
> > CONFIG_X86_SPEEDSTEP_SMI=3Dy
> > CONFIG_X86_P4_CLOCKMOD=3Dy
> > CONFIG_X86_CPUFREQ_NFORCE2=3Dy
> > CONFIG_X86_LONGRUN=3Dy
> > # CONFIG_X86_LONGHAUL is not set
> > # CONFIG_X86_E_POWERSAVER is not set
> > =

> > #
> > # shared options
> > #
> > CONFIG_X86_SPEEDSTEP_LIB=3Dy
> > # CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK is not set
> > =

> > #
> > # CPU Idle
> > #
> > CONFIG_CPU_IDLE=3Dy
> > CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> > # CONFIG_CPU_IDLE_GOV_MENU is not set
> > # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> > # CONFIG_INTEL_IDLE is not set
> > =

> > #
> > # Bus options (PCI etc.)
> > #
> > CONFIG_PCI=3Dy
> > # CONFIG_PCI_GOBIOS is not set
> > # CONFIG_PCI_GOMMCONFIG is not set
> > # CONFIG_PCI_GODIRECT is not set
> > # CONFIG_PCI_GOOLPC is not set
> > CONFIG_PCI_GOANY=3Dy
> > CONFIG_PCI_BIOS=3Dy
> > CONFIG_PCI_DIRECT=3Dy
> > CONFIG_PCI_MMCONFIG=3Dy
> > CONFIG_PCI_OLPC=3Dy
> > CONFIG_PCI_DOMAINS=3Dy
> > # CONFIG_PCI_CNB20LE_QUIRK is not set
> > # CONFIG_PCIEPORTBUS is not set
> > # CONFIG_PCI_MSI is not set
> > # CONFIG_PCI_DEBUG is not set
> > # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> > # CONFIG_PCI_STUB is not set
> > CONFIG_HT_IRQ=3Dy
> > # CONFIG_PCI_IOV is not set
> > # CONFIG_PCI_PRI is not set
> > # CONFIG_PCI_PASID is not set
> > CONFIG_PCI_LABEL=3Dy
> > =

> > #
> > # PCI host controller drivers
> > #
> > CONFIG_ISA_DMA_API=3Dy
> > # CONFIG_ISA is not set
> > # CONFIG_SCx200 is not set
> > CONFIG_OLPC=3Dy
> > # CONFIG_OLPC_XO15_SCI is not set
> > # CONFIG_ALIX is not set
> > # CONFIG_NET5501 is not set
> > CONFIG_AMD_NB=3Dy
> > # CONFIG_PCCARD is not set
> > # CONFIG_HOTPLUG_PCI is not set
> > # CONFIG_RAPIDIO is not set
> > CONFIG_X86_SYSFB=3Dy
> > =

> > #
> > # Executable file formats / Emulations
> > #
> > CONFIG_BINFMT_ELF=3Dy
> > CONFIG_BINFMT_SCRIPT=3Dy
> > CONFIG_HAVE_AOUT=3Dy
> > # CONFIG_BINFMT_AOUT is not set
> > # CONFIG_BINFMT_MISC is not set
> > CONFIG_COREDUMP=3Dy
> > CONFIG_HAVE_ATOMIC_IOMAP=3Dy
> > CONFIG_PMC_ATOM=3Dy
> > CONFIG_NET=3Dy
> > =

> > #
> > # Networking options
> > #
> > # CONFIG_PACKET is not set
> > CONFIG_UNIX=3Dy
> > CONFIG_UNIX_DIAG=3Dy
> > CONFIG_XFRM=3Dy
> > CONFIG_XFRM_ALGO=3Dy
> > CONFIG_XFRM_USER=3Dy
> > CONFIG_XFRM_SUB_POLICY=3Dy
> > CONFIG_XFRM_MIGRATE=3Dy
> > # CONFIG_XFRM_STATISTICS is not set
> > CONFIG_XFRM_IPCOMP=3Dy
> > # CONFIG_NET_KEY is not set
> > CONFIG_INET=3Dy
> > CONFIG_IP_MULTICAST=3Dy
> > # CONFIG_IP_ADVANCED_ROUTER is not set
> > CONFIG_IP_PNP=3Dy
> > CONFIG_IP_PNP_DHCP=3Dy
> > # CONFIG_IP_PNP_BOOTP is not set
> > # CONFIG_IP_PNP_RARP is not set
> > # CONFIG_NET_IPIP is not set
> > CONFIG_NET_IPGRE_DEMUX=3Dy
> > CONFIG_NET_IP_TUNNEL=3Dy
> > CONFIG_NET_IPGRE=3Dy
> > CONFIG_NET_IPGRE_BROADCAST=3Dy
> > CONFIG_IP_MROUTE=3Dy
> > # CONFIG_IP_PIMSM_V1 is not set
> > CONFIG_IP_PIMSM_V2=3Dy
> > CONFIG_SYN_COOKIES=3Dy
> > CONFIG_NET_IPVTI=3Dy
> > # CONFIG_NET_UDP_TUNNEL is not set
> > # CONFIG_NET_FOU is not set
> > # CONFIG_NET_FOU_IP_TUNNELS is not set
> > # CONFIG_GENEVE_CORE is not set
> > CONFIG_INET_AH=3Dy
> > # CONFIG_INET_ESP is not set
> > # CONFIG_INET_IPCOMP is not set
> > # CONFIG_INET_XFRM_TUNNEL is not set
> > CONFIG_INET_TUNNEL=3Dy
> > CONFIG_INET_XFRM_MODE_TRANSPORT=3Dy
> > CONFIG_INET_XFRM_MODE_TUNNEL=3Dy
> > # CONFIG_INET_XFRM_MODE_BEET is not set
> > # CONFIG_INET_LRO is not set
> > CONFIG_INET_DIAG=3Dy
> > CONFIG_INET_TCP_DIAG=3Dy
> > CONFIG_INET_UDP_DIAG=3Dy
> > # CONFIG_TCP_CONG_ADVANCED is not set
> > CONFIG_TCP_CONG_CUBIC=3Dy
> > CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> > CONFIG_TCP_MD5SIG=3Dy
> > CONFIG_IPV6=3Dy
> > # CONFIG_IPV6_ROUTER_PREF is not set
> > # CONFIG_IPV6_OPTIMISTIC_DAD is not set
> > CONFIG_INET6_AH=3Dy
> > CONFIG_INET6_ESP=3Dy
> > CONFIG_INET6_IPCOMP=3Dy
> > # CONFIG_IPV6_MIP6 is not set
> > CONFIG_INET6_XFRM_TUNNEL=3Dy
> > CONFIG_INET6_TUNNEL=3Dy
> > CONFIG_INET6_XFRM_MODE_TRANSPORT=3Dy
> > CONFIG_INET6_XFRM_MODE_TUNNEL=3Dy
> > CONFIG_INET6_XFRM_MODE_BEET=3Dy
> > CONFIG_INET6_XFRM_MODE_ROUTEOPTIMIZATION=3Dy
> > CONFIG_IPV6_VTI=3Dy
> > # CONFIG_IPV6_SIT is not set
> > CONFIG_IPV6_TUNNEL=3Dy
> > CONFIG_IPV6_GRE=3Dy
> > CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> > CONFIG_IPV6_SUBTREES=3Dy
> > CONFIG_IPV6_MROUTE=3Dy
> > CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> > # CONFIG_IPV6_PIMSM_V2 is not set
> > # CONFIG_NETWORK_SECMARK is not set
> > CONFIG_NET_PTP_CLASSIFY=3Dy
> > CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> > # CONFIG_NETFILTER is not set
> > CONFIG_IP_DCCP=3Dy
> > CONFIG_INET_DCCP_DIAG=3Dy
> > =

> > #
> > # DCCP CCIDs Configuration
> > #
> > CONFIG_IP_DCCP_CCID2_DEBUG=3Dy
> > CONFIG_IP_DCCP_CCID3=3Dy
> > # CONFIG_IP_DCCP_CCID3_DEBUG is not set
> > CONFIG_IP_DCCP_TFRC_LIB=3Dy
> > =

> > #
> > # DCCP Kernel Hacking
> > #
> > # CONFIG_IP_DCCP_DEBUG is not set
> > CONFIG_IP_SCTP=3Dy
> > # CONFIG_SCTP_DBG_OBJCNT is not set
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> > CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> > # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> > CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> > CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> > # CONFIG_RDS is not set
> > # CONFIG_TIPC is not set
> > CONFIG_ATM=3Dy
> > # CONFIG_ATM_CLIP is not set
> > CONFIG_ATM_LANE=3Dy
> > # CONFIG_ATM_MPOA is not set
> > CONFIG_ATM_BR2684=3Dy
> > CONFIG_ATM_BR2684_IPFILTER=3Dy
> > # CONFIG_L2TP is not set
> > CONFIG_STP=3Dy
> > CONFIG_MRP=3Dy
> > CONFIG_BRIDGE=3Dy
> > # CONFIG_BRIDGE_IGMP_SNOOPING is not set
> > CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> > CONFIG_VLAN_8021Q=3Dy
> > # CONFIG_VLAN_8021Q_GVRP is not set
> > CONFIG_VLAN_8021Q_MVRP=3Dy
> > CONFIG_DECNET=3Dy
> > # CONFIG_DECNET_ROUTER is not set
> > CONFIG_LLC=3Dy
> > CONFIG_LLC2=3Dy
> > # CONFIG_IPX is not set
> > CONFIG_ATALK=3Dy
> > CONFIG_DEV_APPLETALK=3Dy
> > CONFIG_IPDDP=3Dy
> > # CONFIG_IPDDP_ENCAP is not set
> > CONFIG_X25=3Dy
> > CONFIG_LAPB=3Dy
> > CONFIG_PHONET=3Dy
> > # CONFIG_6LOWPAN is not set
> > CONFIG_IEEE802154=3Dy
> > # CONFIG_IEEE802154_SOCKET is not set
> > # CONFIG_MAC802154 is not set
> > # CONFIG_NET_SCHED is not set
> > CONFIG_DCB=3Dy
> > CONFIG_DNS_RESOLVER=3Dy
> > # CONFIG_BATMAN_ADV is not set
> > CONFIG_OPENVSWITCH=3Dy
> > # CONFIG_OPENVSWITCH_GRE is not set
> > CONFIG_VSOCKETS=3Dy
> > # CONFIG_NETLINK_MMAP is not set
> > CONFIG_NETLINK_DIAG=3Dy
> > CONFIG_MPLS=3Dy
> > CONFIG_NET_MPLS_GSO=3Dy
> > CONFIG_MPLS_ROUTING=3Dy
> > # CONFIG_HSR is not set
> > # CONFIG_NET_SWITCHDEV is not set
> > # CONFIG_CGROUP_NET_PRIO is not set
> > CONFIG_CGROUP_NET_CLASSID=3Dy
> > CONFIG_NET_RX_BUSY_POLL=3Dy
> > CONFIG_BQL=3Dy
> > =

> > #
> > # Network testing
> > #
> > # CONFIG_NET_PKTGEN is not set
> > # CONFIG_HAMRADIO is not set
> > # CONFIG_CAN is not set
> > CONFIG_IRDA=3Dy
> > =

> > #
> > # IrDA protocols
> > #
> > CONFIG_IRLAN=3Dy
> > CONFIG_IRCOMM=3Dy
> > # CONFIG_IRDA_ULTRA is not set
> > =

> > #
> > # IrDA options
> > #
> > CONFIG_IRDA_CACHE_LAST_LSAP=3Dy
> > # CONFIG_IRDA_FAST_RR is not set
> > CONFIG_IRDA_DEBUG=3Dy
> > =

> > #
> > # Infrared-port device drivers
> > #
> > =

> > #
> > # SIR device drivers
> > #
> > # CONFIG_IRTTY_SIR is not set
> > =

> > #
> > # Dongle support
> > #
> > CONFIG_KINGSUN_DONGLE=3Dy
> > CONFIG_KSDAZZLE_DONGLE=3Dy
> > CONFIG_KS959_DONGLE=3Dy
> > =

> > #
> > # FIR device drivers
> > #
> > CONFIG_USB_IRDA=3Dy
> > CONFIG_SIGMATEL_FIR=3Dy
> > # CONFIG_NSC_FIR is not set
> > CONFIG_WINBOND_FIR=3Dy
> > # CONFIG_TOSHIBA_FIR is not set
> > # CONFIG_SMC_IRCC_FIR is not set
> > CONFIG_ALI_FIR=3Dy
> > # CONFIG_VLSI_FIR is not set
> > CONFIG_VIA_FIR=3Dy
> > CONFIG_MCS_FIR=3Dy
> > CONFIG_BT=3Dy
> > CONFIG_BT_BREDR=3Dy
> > CONFIG_BT_RFCOMM=3Dy
> > CONFIG_BT_RFCOMM_TTY=3Dy
> > CONFIG_BT_BNEP=3Dy
> > # CONFIG_BT_BNEP_MC_FILTER is not set
> > CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> > # CONFIG_BT_HIDP is not set
> > # CONFIG_BT_LE is not set
> > CONFIG_BT_SELFTEST=3Dy
> > CONFIG_BT_DEBUGFS=3Dy
> > =

> > #
> > # Bluetooth device drivers
> > #
> > CONFIG_BT_INTEL=3Dy
> > CONFIG_BT_BCM=3Dy
> > CONFIG_BT_HCIBTUSB=3Dy
> > CONFIG_BT_HCIBTUSB_BCM=3Dy
> > # CONFIG_BT_HCIBTUSB_RTL is not set
> > # CONFIG_BT_HCIUART is not set
> > # CONFIG_BT_HCIBCM203X is not set
> > CONFIG_BT_HCIBPA10X=3Dy
> > CONFIG_BT_HCIBFUSB=3Dy
> > CONFIG_BT_HCIVHCI=3Dy
> > CONFIG_BT_MRVL=3Dy
> > CONFIG_BT_ATH3K=3Dy
> > # CONFIG_BT_WILINK is not set
> > CONFIG_AF_RXRPC=3Dy
> > CONFIG_AF_RXRPC_DEBUG=3Dy
> > CONFIG_RXKAD=3Dy
> > CONFIG_FIB_RULES=3Dy
> > # CONFIG_WIRELESS is not set
> > CONFIG_WIMAX=3Dy
> > CONFIG_WIMAX_DEBUG_LEVEL=3D8
> > CONFIG_RFKILL=3Dy
> > # CONFIG_RFKILL_INPUT is not set
> > CONFIG_RFKILL_REGULATOR=3Dy
> > CONFIG_RFKILL_GPIO=3Dy
> > CONFIG_NET_9P=3Dy
> > CONFIG_NET_9P_VIRTIO=3Dy
> > # CONFIG_NET_9P_DEBUG is not set
> > CONFIG_CAIF=3Dy
> > CONFIG_CAIF_DEBUG=3Dy
> > # CONFIG_CAIF_NETDEV is not set
> > CONFIG_CAIF_USB=3Dy
> > # CONFIG_CEPH_LIB is not set
> > CONFIG_NFC=3Dy
> > CONFIG_NFC_DIGITAL=3Dy
> > CONFIG_NFC_NCI=3Dy
> > # CONFIG_NFC_NCI_SPI is not set
> > CONFIG_NFC_NCI_UART=3Dy
> > CONFIG_NFC_HCI=3Dy
> > CONFIG_NFC_SHDLC=3Dy
> > =

> > #
> > # Near Field Communication (NFC) devices
> > #
> > CONFIG_NFC_PN533=3Dy
> > # CONFIG_NFC_WILINK is not set
> > CONFIG_NFC_TRF7970A=3Dy
> > CONFIG_NFC_SIM=3Dy
> > CONFIG_NFC_PORT100=3Dy
> > CONFIG_NFC_PN544=3Dy
> > CONFIG_NFC_PN544_I2C=3Dy
> > # CONFIG_NFC_MICROREAD is not set
> > CONFIG_NFC_MRVL=3Dy
> > CONFIG_NFC_MRVL_USB=3Dy
> > CONFIG_NFC_MRVL_UART=3Dy
> > # CONFIG_NFC_ST21NFCA is not set
> > CONFIG_NFC_ST_NCI=3Dy
> > CONFIG_NFC_ST_NCI_I2C=3Dy
> > CONFIG_NFC_NXP_NCI=3Dy
> > # CONFIG_NFC_NXP_NCI_I2C is not set
> > =

> > #
> > # Device Drivers
> > #
> > =

> > #
> > # Generic Driver Options
> > #
> > CONFIG_UEVENT_HELPER=3Dy
> > CONFIG_UEVENT_HELPER_PATH=3D""
> > CONFIG_DEVTMPFS=3Dy
> > # CONFIG_DEVTMPFS_MOUNT is not set
> > # CONFIG_STANDALONE is not set
> > # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> > CONFIG_FW_LOADER=3Dy
> > CONFIG_FIRMWARE_IN_KERNEL=3Dy
> > CONFIG_EXTRA_FIRMWARE=3D""
> > CONFIG_FW_LOADER_USER_HELPER=3Dy
> > CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> > CONFIG_ALLOW_DEV_COREDUMP=3Dy
> > # CONFIG_DEBUG_DRIVER is not set
> > CONFIG_DEBUG_DEVRES=3Dy
> > # CONFIG_SYS_HYPERVISOR is not set
> > # CONFIG_GENERIC_CPU_DEVICES is not set
> > CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> > CONFIG_REGMAP=3Dy
> > CONFIG_REGMAP_I2C=3Dy
> > CONFIG_REGMAP_SPI=3Dy
> > CONFIG_REGMAP_SPMI=3Dy
> > CONFIG_REGMAP_MMIO=3Dy
> > CONFIG_REGMAP_IRQ=3Dy
> > CONFIG_DMA_SHARED_BUFFER=3Dy
> > # CONFIG_FENCE_TRACE is not set
> > =

> > #
> > # Bus devices
> > #
> > # CONFIG_CONNECTOR is not set
> > CONFIG_MTD=3Dy
> > CONFIG_MTD_REDBOOT_PARTS=3Dy
> > CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> > # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> > # CONFIG_MTD_REDBOOT_PARTS_READONLY is not set
> > # CONFIG_MTD_CMDLINE_PARTS is not set
> > CONFIG_MTD_OF_PARTS=3Dy
> > # CONFIG_MTD_AR7_PARTS is not set
> > =

> > #
> > # User Modules And Translation Layers
> > #
> > # CONFIG_MTD_OOPS is not set
> > CONFIG_MTD_PARTITIONED_MASTER=3Dy
> > =

> > #
> > # RAM/ROM/Flash chip drivers
> > #
> > CONFIG_MTD_CFI=3Dy
> > CONFIG_MTD_JEDECPROBE=3Dy
> > CONFIG_MTD_GEN_PROBE=3Dy
> > CONFIG_MTD_CFI_ADV_OPTIONS=3Dy
> > # CONFIG_MTD_CFI_NOSWAP is not set
> > # CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
> > CONFIG_MTD_CFI_LE_BYTE_SWAP=3Dy
> > CONFIG_MTD_CFI_GEOMETRY=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_1=3Dy
> > # CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
> > # CONFIG_MTD_MAP_BANK_WIDTH_4 is not set
> > CONFIG_MTD_MAP_BANK_WIDTH_8=3Dy
> > CONFIG_MTD_MAP_BANK_WIDTH_16=3Dy
> > # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> > CONFIG_MTD_CFI_I1=3Dy
> > CONFIG_MTD_CFI_I2=3Dy
> > CONFIG_MTD_CFI_I4=3Dy
> > # CONFIG_MTD_CFI_I8 is not set
> > CONFIG_MTD_OTP=3Dy
> > CONFIG_MTD_CFI_INTELEXT=3Dy
> > CONFIG_MTD_CFI_AMDSTD=3Dy
> > # CONFIG_MTD_CFI_STAA is not set
> > CONFIG_MTD_CFI_UTIL=3Dy
> > CONFIG_MTD_RAM=3Dy
> > CONFIG_MTD_ROM=3Dy
> > CONFIG_MTD_ABSENT=3Dy
> > =

> > #
> > # Mapping drivers for chip access
> > #
> > # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> > CONFIG_MTD_PHYSMAP=3Dy
> > # CONFIG_MTD_PHYSMAP_COMPAT is not set
> > # CONFIG_MTD_PHYSMAP_OF is not set
> > # CONFIG_MTD_AMD76XROM is not set
> > CONFIG_MTD_ICHXROM=3Dy
> > # CONFIG_MTD_ESB2ROM is not set
> > # CONFIG_MTD_CK804XROM is not set
> > # CONFIG_MTD_SCB2_FLASH is not set
> > # CONFIG_MTD_NETtel is not set
> > CONFIG_MTD_L440GX=3Dy
> > # CONFIG_MTD_INTEL_VR_NOR is not set
> > # CONFIG_MTD_PLATRAM is not set
> > =

> > #
> > # Self-contained MTD device drivers
> > #
> > # CONFIG_MTD_PMC551 is not set
> > CONFIG_MTD_DATAFLASH=3Dy
> > CONFIG_MTD_DATAFLASH_WRITE_VERIFY=3Dy
> > # CONFIG_MTD_DATAFLASH_OTP is not set
> > CONFIG_MTD_SST25L=3Dy
> > # CONFIG_MTD_SLRAM is not set
> > # CONFIG_MTD_PHRAM is not set
> > CONFIG_MTD_MTDRAM=3Dy
> > CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> > CONFIG_MTDRAM_ERASE_SIZE=3D128
> > CONFIG_MTDRAM_ABS_POS=3D0
> > =

> > #
> > # Disk-On-Chip Device Drivers
> > #
> > # CONFIG_MTD_DOCG3 is not set
> > CONFIG_MTD_NAND_ECC=3Dy
> > CONFIG_MTD_NAND_ECC_SMC=3Dy
> > CONFIG_MTD_NAND=3Dy
> > CONFIG_MTD_NAND_BCH=3Dy
> > CONFIG_MTD_NAND_ECC_BCH=3Dy
> > # CONFIG_MTD_SM_COMMON is not set
> > CONFIG_MTD_NAND_DENALI=3Dy
> > # CONFIG_MTD_NAND_DENALI_PCI is not set
> > CONFIG_MTD_NAND_GPIO=3Dy
> > # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> > CONFIG_MTD_NAND_IDS=3Dy
> > # CONFIG_MTD_NAND_RICOH is not set
> > # CONFIG_MTD_NAND_DISKONCHIP is not set
> > # CONFIG_MTD_NAND_DOCG4 is not set
> > # CONFIG_MTD_NAND_CAFE is not set
> > # CONFIG_MTD_NAND_CS553X is not set
> > CONFIG_MTD_NAND_NANDSIM=3Dy
> > CONFIG_MTD_NAND_PLATFORM=3Dy
> > CONFIG_MTD_NAND_HISI504=3Dy
> > CONFIG_MTD_ONENAND=3Dy
> > # CONFIG_MTD_ONENAND_VERIFY_WRITE is not set
> > CONFIG_MTD_ONENAND_GENERIC=3Dy
> > CONFIG_MTD_ONENAND_OTP=3Dy
> > CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> > =

> > #
> > # LPDDR & LPDDR2 PCM memory drivers
> > #
> > CONFIG_MTD_LPDDR=3Dy
> > CONFIG_MTD_QINFO_PROBE=3Dy
> > # CONFIG_MTD_SPI_NOR is not set
> > # CONFIG_MTD_UBI is not set
> > CONFIG_DTC=3Dy
> > CONFIG_OF=3Dy
> > CONFIG_OF_UNITTEST=3Dy
> > CONFIG_OF_FLATTREE=3Dy
> > CONFIG_OF_EARLY_FLATTREE=3Dy
> > CONFIG_OF_PROMTREE=3Dy
> > CONFIG_OF_DYNAMIC=3Dy
> > CONFIG_OF_ADDRESS=3Dy
> > CONFIG_OF_ADDRESS_PCI=3Dy
> > CONFIG_OF_IRQ=3Dy
> > CONFIG_OF_PCI=3Dy
> > CONFIG_OF_PCI_IRQ=3Dy
> > CONFIG_OF_MTD=3Dy
> > CONFIG_OF_RESOLVE=3Dy
> > CONFIG_OF_OVERLAY=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> > CONFIG_PARPORT=3Dy
> > CONFIG_PARPORT_PC=3Dy
> > # CONFIG_PARPORT_SERIAL is not set
> > # CONFIG_PARPORT_PC_FIFO is not set
> > CONFIG_PARPORT_PC_SUPERIO=3Dy
> > # CONFIG_PARPORT_GSC is not set
> > CONFIG_PARPORT_AX88796=3Dy
> > CONFIG_PARPORT_1284=3Dy
> > CONFIG_PARPORT_NOT_PC=3Dy
> > CONFIG_PNP=3Dy
> > CONFIG_PNP_DEBUG_MESSAGES=3Dy
> > =

> > #
> > # Protocols
> > #
> > CONFIG_PNPACPI=3Dy
> > =

> > #
> > # Misc devices
> > #
> > # CONFIG_SENSORS_LIS3LV02D is not set
> > # CONFIG_AD525X_DPOT is not set
> > # CONFIG_DUMMY_IRQ is not set
> > # CONFIG_IBM_ASM is not set
> > # CONFIG_PHANTOM is not set
> > # CONFIG_SGI_IOC4 is not set
> > # CONFIG_TIFM_CORE is not set
> > # CONFIG_ICS932S401 is not set
> > # CONFIG_ENCLOSURE_SERVICES is not set
> > # CONFIG_HP_ILO is not set
> > CONFIG_APDS9802ALS=3Dy
> > # CONFIG_ISL29003 is not set
> > CONFIG_ISL29020=3Dy
> > CONFIG_SENSORS_TSL2550=3Dy
> > # CONFIG_SENSORS_BH1780 is not set
> > # CONFIG_SENSORS_BH1770 is not set
> > # CONFIG_SENSORS_APDS990X is not set
> > # CONFIG_HMC6352 is not set
> > CONFIG_DS1682=3Dy
> > CONFIG_TI_DAC7512=3Dy
> > # CONFIG_VMWARE_BALLOON is not set
> > CONFIG_BMP085=3Dy
> > CONFIG_BMP085_I2C=3Dy
> > # CONFIG_BMP085_SPI is not set
> > # CONFIG_PCH_PHUB is not set
> > # CONFIG_USB_SWITCH_FSA9480 is not set
> > # CONFIG_LATTICE_ECP3_CONFIG is not set
> > # CONFIG_SRAM is not set
> > CONFIG_C2PORT=3Dy
> > CONFIG_C2PORT_DURAMAR_2150=3Dy
> > =

> > #
> > # EEPROM support
> > #
> > # CONFIG_EEPROM_AT24 is not set
> > # CONFIG_EEPROM_AT25 is not set
> > CONFIG_EEPROM_LEGACY=3Dy
> > # CONFIG_EEPROM_MAX6875 is not set
> > CONFIG_EEPROM_93CX6=3Dy
> > CONFIG_EEPROM_93XX46=3Dy
> > # CONFIG_CB710_CORE is not set
> > =

> > #
> > # Texas Instruments shared transport line discipline
> > #
> > CONFIG_TI_ST=3Dy
> > # CONFIG_SENSORS_LIS3_I2C is not set
> > =

> > #
> > # Altera FPGA firmware download module
> > #
> > CONFIG_ALTERA_STAPL=3Dy
> > # CONFIG_INTEL_MEI is not set
> > # CONFIG_INTEL_MEI_ME is not set
> > # CONFIG_INTEL_MEI_TXE is not set
> > # CONFIG_VMWARE_VMCI is not set
> > =

> > #
> > # Intel MIC Bus Driver
> > #
> > =

> > #
> > # SCIF Bus Driver
> > #
> > =

> > #
> > # Intel MIC Host Driver
> > #
> > =

> > #
> > # Intel MIC Card Driver
> > #
> > =

> > #
> > # SCIF Driver
> > #
> > CONFIG_ECHO=3Dy
> > # CONFIG_CXL_BASE is not set
> > # CONFIG_CXL_KERNEL_API is not set
> > CONFIG_HAVE_IDE=3Dy
> > =

> > #
> > # SCSI device support
> > #
> > CONFIG_SCSI_MOD=3Dy
> > # CONFIG_SCSI_DMA is not set
> > # CONFIG_SCSI_NETLINK is not set
> > # CONFIG_FUSION is not set
> > =

> > #
> > # IEEE 1394 (FireWire) support
> > #
> > # CONFIG_FIREWIRE is not set
> > # CONFIG_FIREWIRE_NOSY is not set
> > # CONFIG_MACINTOSH_DRIVERS is not set
> > # CONFIG_NETDEVICES is not set
> > CONFIG_VHOST_NET=3Dy
> > CONFIG_VHOST_RING=3Dy
> > CONFIG_VHOST=3Dy
> > CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> > =

> > #
> > # Input device support
> > #
> > CONFIG_INPUT=3Dy
> > CONFIG_INPUT_LEDS=3Dy
> > # CONFIG_INPUT_FF_MEMLESS is not set
> > # CONFIG_INPUT_POLLDEV is not set
> > # CONFIG_INPUT_SPARSEKMAP is not set
> > # CONFIG_INPUT_MATRIXKMAP is not set
> > =

> > #
> > # Userland interfaces
> > #
> > CONFIG_INPUT_MOUSEDEV=3Dy
> > CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
> > CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> > CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> > # CONFIG_INPUT_JOYDEV is not set
> > # CONFIG_INPUT_EVDEV is not set
> > # CONFIG_INPUT_EVBUG is not set
> > =

> > #
> > # Input Device Drivers
> > #
> > CONFIG_INPUT_KEYBOARD=3Dy
> > # CONFIG_KEYBOARD_ADP5588 is not set
> > # CONFIG_KEYBOARD_ADP5589 is not set
> > CONFIG_KEYBOARD_ATKBD=3Dy
> > # CONFIG_KEYBOARD_QT1070 is not set
> > # CONFIG_KEYBOARD_QT2160 is not set
> > # CONFIG_KEYBOARD_LKKBD is not set
> > # CONFIG_KEYBOARD_GPIO is not set
> > # CONFIG_KEYBOARD_GPIO_POLLED is not set
> > # CONFIG_KEYBOARD_TCA6416 is not set
> > # CONFIG_KEYBOARD_TCA8418 is not set
> > # CONFIG_KEYBOARD_MATRIX is not set
> > # CONFIG_KEYBOARD_LM8323 is not set
> > # CONFIG_KEYBOARD_LM8333 is not set
> > # CONFIG_KEYBOARD_MAX7359 is not set
> > # CONFIG_KEYBOARD_MCS is not set
> > # CONFIG_KEYBOARD_MPR121 is not set
> > # CONFIG_KEYBOARD_NEWTON is not set
> > # CONFIG_KEYBOARD_OPENCORES is not set
> > # CONFIG_KEYBOARD_STOWAWAY is not set
> > # CONFIG_KEYBOARD_SUNKBD is not set
> > # CONFIG_KEYBOARD_STMPE is not set
> > # CONFIG_KEYBOARD_OMAP4 is not set
> > # CONFIG_KEYBOARD_TWL4030 is not set
> > # CONFIG_KEYBOARD_XTKBD is not set
> > # CONFIG_KEYBOARD_CROS_EC is not set
> > # CONFIG_KEYBOARD_CAP11XX is not set
> > CONFIG_INPUT_MOUSE=3Dy
> > CONFIG_MOUSE_PS2=3Dy
> > CONFIG_MOUSE_PS2_ALPS=3Dy
> > CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> > CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> > CONFIG_MOUSE_PS2_CYPRESS=3Dy
> > CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> > # CONFIG_MOUSE_PS2_ELANTECH is not set
> > # CONFIG_MOUSE_PS2_SENTELIC is not set
> > # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> > # CONFIG_MOUSE_PS2_OLPC is not set
> > CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> > # CONFIG_MOUSE_PS2_VMMOUSE is not set
> > # CONFIG_MOUSE_SERIAL is not set
> > # CONFIG_MOUSE_APPLETOUCH is not set
> > # CONFIG_MOUSE_BCM5974 is not set
> > # CONFIG_MOUSE_CYAPA is not set
> > # CONFIG_MOUSE_ELAN_I2C is not set
> > # CONFIG_MOUSE_VSXXXAA is not set
> > # CONFIG_MOUSE_GPIO is not set
> > # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> > # CONFIG_MOUSE_SYNAPTICS_USB is not set
> > # CONFIG_INPUT_JOYSTICK is not set
> > # CONFIG_INPUT_TABLET is not set
> > # CONFIG_INPUT_TOUCHSCREEN is not set
> > # CONFIG_INPUT_MISC is not set
> > =

> > #
> > # Hardware I/O ports
> > #
> > CONFIG_SERIO=3Dy
> > CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> > CONFIG_SERIO_I8042=3Dy
> > CONFIG_SERIO_SERPORT=3Dy
> > CONFIG_SERIO_CT82C710=3Dy
> > # CONFIG_SERIO_PARKBD is not set
> > # CONFIG_SERIO_PCIPS2 is not set
> > CONFIG_SERIO_LIBPS2=3Dy
> > # CONFIG_SERIO_RAW is not set
> > CONFIG_SERIO_ALTERA_PS2=3Dy
> > CONFIG_SERIO_PS2MULT=3Dy
> > CONFIG_SERIO_ARC_PS2=3Dy
> > # CONFIG_SERIO_APBPS2 is not set
> > CONFIG_SERIO_OLPC_APSP=3Dy
> > # CONFIG_GAMEPORT is not set
> > =

> > #
> > # Character devices
> > #
> > CONFIG_TTY=3Dy
> > # CONFIG_VT is not set
> > # CONFIG_UNIX98_PTYS is not set
> > # CONFIG_LEGACY_PTYS is not set
> > # CONFIG_SERIAL_NONSTANDARD is not set
> > # CONFIG_NOZOMI is not set
> > CONFIG_N_GSM=3Dy
> > # CONFIG_TRACE_SINK is not set
> > CONFIG_DEVMEM=3Dy
> > CONFIG_DEVKMEM=3Dy
> > =

> > #
> > # Serial drivers
> > #
> > CONFIG_SERIAL_EARLYCON=3Dy
> > CONFIG_SERIAL_8250=3Dy
> > # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> > CONFIG_SERIAL_8250_PNP=3Dy
> > CONFIG_SERIAL_8250_CONSOLE=3Dy
> > CONFIG_SERIAL_8250_PCI=3Dy
> > CONFIG_SERIAL_8250_NR_UARTS=3D4
> > CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> > CONFIG_SERIAL_8250_EXTENDED=3Dy
> > # CONFIG_SERIAL_8250_MANY_PORTS is not set
> > # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> > CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> > # CONFIG_SERIAL_8250_RSA is not set
> > # CONFIG_SERIAL_8250_DW is not set
> > # CONFIG_SERIAL_8250_FINTEK is not set
> > # CONFIG_SERIAL_8250_INGENIC is not set
> > =

> > #
> > # Non-8250 serial port support
> > #
> > # CONFIG_SERIAL_MAX3100 is not set
> > CONFIG_SERIAL_MAX310X=3Dy
> > CONFIG_SERIAL_CORE=3Dy
> > CONFIG_SERIAL_CORE_CONSOLE=3Dy
> > # CONFIG_SERIAL_JSM is not set
> > CONFIG_SERIAL_OF_PLATFORM=3Dy
> > CONFIG_SERIAL_SCCNXP=3Dy
> > # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> > # CONFIG_SERIAL_SC16IS7XX is not set
> > CONFIG_SERIAL_TIMBERDALE=3Dy
> > CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> > # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> > CONFIG_SERIAL_ALTERA_UART=3Dy
> > CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> > CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> > CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> > CONFIG_SERIAL_IFX6X60=3Dy
> > # CONFIG_SERIAL_PCH_UART is not set
> > CONFIG_SERIAL_XILINX_PS_UART=3Dy
> > # CONFIG_SERIAL_XILINX_PS_UART_CONSOLE is not set
> > CONFIG_SERIAL_ARC=3Dy
> > CONFIG_SERIAL_ARC_CONSOLE=3Dy
> > CONFIG_SERIAL_ARC_NR_PORTS=3D1
> > # CONFIG_SERIAL_RP2 is not set
> > CONFIG_SERIAL_FSL_LPUART=3Dy
> > # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> > CONFIG_SERIAL_CONEXANT_DIGICOLOR=3Dy
> > CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=3Dy
> > CONFIG_SERIAL_MEN_Z135=3Dy
> > # CONFIG_TTY_PRINTK is not set
> > CONFIG_PRINTER=3Dy
> > # CONFIG_LP_CONSOLE is not set
> > # CONFIG_PPDEV is not set
> > # CONFIG_VIRTIO_CONSOLE is not set
> > CONFIG_IPMI_HANDLER=3Dy
> > CONFIG_IPMI_PANIC_EVENT=3Dy
> > CONFIG_IPMI_PANIC_STRING=3Dy
> > # CONFIG_IPMI_DEVICE_INTERFACE is not set
> > CONFIG_IPMI_SI=3Dy
> > # CONFIG_IPMI_SI_PROBE_DEFAULTS is not set
> > CONFIG_IPMI_SSIF=3Dy
> > CONFIG_IPMI_WATCHDOG=3Dy
> > # CONFIG_IPMI_POWEROFF is not set
> > CONFIG_HW_RANDOM=3Dy
> > # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> > CONFIG_HW_RANDOM_INTEL=3Dy
> > CONFIG_HW_RANDOM_AMD=3Dy
> > CONFIG_HW_RANDOM_GEODE=3Dy
> > # CONFIG_HW_RANDOM_VIA is not set
> > CONFIG_HW_RANDOM_VIRTIO=3Dy
> > CONFIG_HW_RANDOM_TPM=3Dy
> > # CONFIG_NVRAM is not set
> > # CONFIG_R3964 is not set
> > # CONFIG_APPLICOM is not set
> > # CONFIG_SONYPI is not set
> > CONFIG_MWAVE=3Dy
> > # CONFIG_PC8736x_GPIO is not set
> > CONFIG_NSC_GPIO=3Dy
> > # CONFIG_HPET is not set
> > CONFIG_HANGCHECK_TIMER=3Dy
> > CONFIG_TCG_TPM=3Dy
> > CONFIG_TCG_TIS=3Dy
> > CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> > CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> > CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> > CONFIG_TCG_NSC=3Dy
> > CONFIG_TCG_ATMEL=3Dy
> > # CONFIG_TCG_INFINEON is not set
> > # CONFIG_TCG_CRB is not set
> > # CONFIG_TCG_TIS_ST33ZP24 is not set
> > CONFIG_TELCLOCK=3Dy
> > CONFIG_DEVPORT=3Dy
> > # CONFIG_XILLYBUS is not set
> > =

> > #
> > # I2C support
> > #
> > CONFIG_I2C=3Dy
> > CONFIG_ACPI_I2C_OPREGION=3Dy
> > CONFIG_I2C_BOARDINFO=3Dy
> > # CONFIG_I2C_COMPAT is not set
> > CONFIG_I2C_CHARDEV=3Dy
> > CONFIG_I2C_MUX=3Dy
> > =

> > #
> > # Multiplexer I2C Chip support
> > #
> > CONFIG_I2C_ARB_GPIO_CHALLENGE=3Dy
> > CONFIG_I2C_MUX_GPIO=3Dy
> > # CONFIG_I2C_MUX_PCA9541 is not set
> > CONFIG_I2C_MUX_PCA954x=3Dy
> > # CONFIG_I2C_HELPER_AUTO is not set
> > CONFIG_I2C_SMBUS=3Dy
> > =

> > #
> > # I2C Algorithms
> > #
> > CONFIG_I2C_ALGOBIT=3Dy
> > CONFIG_I2C_ALGOPCF=3Dy
> > CONFIG_I2C_ALGOPCA=3Dy
> > =

> > #
> > # I2C Hardware Bus support
> > #
> > =

> > #
> > # PC SMBus host controller drivers
> > #
> > # CONFIG_I2C_ALI1535 is not set
> > # CONFIG_I2C_ALI1563 is not set
> > # CONFIG_I2C_ALI15X3 is not set
> > # CONFIG_I2C_AMD756 is not set
> > # CONFIG_I2C_AMD8111 is not set
> > # CONFIG_I2C_I801 is not set
> > # CONFIG_I2C_ISCH is not set
> > # CONFIG_I2C_ISMT is not set
> > # CONFIG_I2C_PIIX4 is not set
> > # CONFIG_I2C_NFORCE2 is not set
> > # CONFIG_I2C_SIS5595 is not set
> > # CONFIG_I2C_SIS630 is not set
> > # CONFIG_I2C_SIS96X is not set
> > # CONFIG_I2C_VIA is not set
> > # CONFIG_I2C_VIAPRO is not set
> > =

> > #
> > # ACPI drivers
> > #
> > # CONFIG_I2C_SCMI is not set
> > =

> > #
> > # I2C system bus drivers (mostly embedded / system-on-chip)
> > #
> > # CONFIG_I2C_CBUS_GPIO is not set
> > # CONFIG_I2C_DESIGNWARE_PCI is not set
> > # CONFIG_I2C_EG20T is not set
> > CONFIG_I2C_GPIO=3Dy
> > CONFIG_I2C_KEMPLD=3Dy
> > CONFIG_I2C_OCORES=3Dy
> > # CONFIG_I2C_PCA_PLATFORM is not set
> > # CONFIG_I2C_PXA is not set
> > # CONFIG_I2C_PXA_PCI is not set
> > CONFIG_I2C_SIMTEC=3Dy
> > CONFIG_I2C_XILINX=3Dy
> > =

> > #
> > # External I2C/SMBus adapter drivers
> > #
> > CONFIG_I2C_DIOLAN_U2C=3Dy
> > # CONFIG_I2C_DLN2 is not set
> > CONFIG_I2C_PARPORT=3Dy
> > CONFIG_I2C_PARPORT_LIGHT=3Dy
> > CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> > CONFIG_I2C_TAOS_EVM=3Dy
> > CONFIG_I2C_TINY_USB=3Dy
> > # CONFIG_I2C_VIPERBOARD is not set
> > =

> > #
> > # Other I2C/SMBus bus drivers
> > #
> > CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> > # CONFIG_SCx200_ACB is not set
> > # CONFIG_I2C_SLAVE is not set
> > # CONFIG_I2C_DEBUG_CORE is not set
> > # CONFIG_I2C_DEBUG_ALGO is not set
> > # CONFIG_I2C_DEBUG_BUS is not set
> > CONFIG_SPI=3Dy
> > # CONFIG_SPI_DEBUG is not set
> > CONFIG_SPI_MASTER=3Dy
> > =

> > #
> > # SPI Master Controller Drivers
> > #
> > CONFIG_SPI_ALTERA=3Dy
> > CONFIG_SPI_BITBANG=3Dy
> > # CONFIG_SPI_BUTTERFLY is not set
> > # CONFIG_SPI_CADENCE is not set
> > CONFIG_SPI_DLN2=3Dy
> > CONFIG_SPI_GPIO=3Dy
> > CONFIG_SPI_LM70_LLP=3Dy
> > # CONFIG_SPI_FSL_SPI is not set
> > CONFIG_SPI_OC_TINY=3Dy
> > # CONFIG_SPI_PXA2XX is not set
> > # CONFIG_SPI_PXA2XX_PCI is not set
> > CONFIG_SPI_SC18IS602=3Dy
> > # CONFIG_SPI_TOPCLIFF_PCH is not set
> > CONFIG_SPI_XCOMM=3Dy
> > # CONFIG_SPI_XILINX is not set
> > CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> > CONFIG_SPI_DESIGNWARE=3Dy
> > # CONFIG_SPI_DW_PCI is not set
> > # CONFIG_SPI_DW_MMIO is not set
> > =

> > #
> > # SPI Protocol Masters
> > #
> > CONFIG_SPI_SPIDEV=3Dy
> > CONFIG_SPI_TLE62X0=3Dy
> > CONFIG_SPMI=3Dy
> > # CONFIG_HSI is not set
> > =

> > #
> > # PPS support
> > #
> > CONFIG_PPS=3Dy
> > # CONFIG_PPS_DEBUG is not set
> > CONFIG_NTP_PPS=3Dy
> > =

> > #
> > # PPS clients support
> > #
> > CONFIG_PPS_CLIENT_KTIMER=3Dy
> > CONFIG_PPS_CLIENT_LDISC=3Dy
> > # CONFIG_PPS_CLIENT_PARPORT is not set
> > # CONFIG_PPS_CLIENT_GPIO is not set
> > =

> > #
> > # PPS generators support
> > #
> > =

> > #
> > # PTP clock support
> > #
> > CONFIG_PTP_1588_CLOCK=3Dy
> > =

> > #
> > # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional cloc=
ks.
> > #
> > CONFIG_PTP_1588_CLOCK_PCH=3Dy
> > CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> > CONFIG_GPIOLIB=3Dy
> > CONFIG_GPIO_DEVRES=3Dy
> > CONFIG_OF_GPIO=3Dy
> > CONFIG_GPIO_ACPI=3Dy
> > CONFIG_GPIOLIB_IRQCHIP=3Dy
> > CONFIG_DEBUG_GPIO=3Dy
> > CONFIG_GPIO_SYSFS=3Dy
> > CONFIG_GPIO_GENERIC=3Dy
> > CONFIG_GPIO_MAX730X=3Dy
> > =

> > #
> > # Memory mapped GPIO drivers
> > #
> > # CONFIG_GPIO_74XX_MMIO is not set
> > CONFIG_GPIO_ALTERA=3Dy
> > CONFIG_GPIO_DWAPB=3Dy
> > # CONFIG_GPIO_F7188X is not set
> > # CONFIG_GPIO_GENERIC_PLATFORM is not set
> > CONFIG_GPIO_GRGPIO=3Dy
> > # CONFIG_GPIO_ICH is not set
> > CONFIG_GPIO_IT8761E=3Dy
> > # CONFIG_GPIO_LYNXPOINT is not set
> > # CONFIG_GPIO_SCH is not set
> > CONFIG_GPIO_SCH311X=3Dy
> > CONFIG_GPIO_SYSCON=3Dy
> > # CONFIG_GPIO_VX855 is not set
> > CONFIG_GPIO_XILINX=3Dy
> > =

> > #
> > # I2C GPIO expanders
> > #
> > # CONFIG_GPIO_ADP5588 is not set
> > CONFIG_GPIO_ADNP=3Dy
> > CONFIG_GPIO_MAX7300=3Dy
> > CONFIG_GPIO_MAX732X=3Dy
> > # CONFIG_GPIO_MAX732X_IRQ is not set
> > # CONFIG_GPIO_PCA953X is not set
> > CONFIG_GPIO_PCF857X=3Dy
> > # CONFIG_GPIO_SX150X is not set
> > =

> > #
> > # MFD GPIO expanders
> > #
> > CONFIG_GPIO_ARIZONA=3Dy
> > # CONFIG_GPIO_DA9052 is not set
> > # CONFIG_GPIO_DA9055 is not set
> > # CONFIG_GPIO_DLN2 is not set
> > CONFIG_GPIO_KEMPLD=3Dy
> > CONFIG_GPIO_LP3943=3Dy
> > CONFIG_GPIO_PALMAS=3Dy
> > # CONFIG_GPIO_STMPE is not set
> > CONFIG_GPIO_TPS6586X=3Dy
> > # CONFIG_GPIO_TPS65912 is not set
> > CONFIG_GPIO_TWL4030=3Dy
> > # CONFIG_GPIO_WM8994 is not set
> > =

> > #
> > # PCI GPIO expanders
> > #
> > # CONFIG_GPIO_AMD8111 is not set
> > # CONFIG_GPIO_BT8XX is not set
> > # CONFIG_GPIO_INTEL_MID is not set
> > # CONFIG_GPIO_ML_IOH is not set
> > # CONFIG_GPIO_PCH is not set
> > # CONFIG_GPIO_RDC321X is not set
> > # CONFIG_GPIO_SODAVILLE is not set
> > =

> > #
> > # SPI GPIO expanders
> > #
> > CONFIG_GPIO_74X164=3Dy
> > # CONFIG_GPIO_MAX7301 is not set
> > CONFIG_GPIO_MCP23S08=3Dy
> > CONFIG_GPIO_MC33880=3Dy
> > =

> > #
> > # USB GPIO expanders
> > #
> > CONFIG_GPIO_VIPERBOARD=3Dy
> > CONFIG_W1=3Dy
> > =

> > #
> > # 1-wire Bus Masters
> > #
> > # CONFIG_W1_MASTER_MATROX is not set
> > CONFIG_W1_MASTER_DS2490=3Dy
> > CONFIG_W1_MASTER_DS2482=3Dy
> > CONFIG_W1_MASTER_DS1WM=3Dy
> > CONFIG_W1_MASTER_GPIO=3Dy
> > =

> > #
> > # 1-wire Slaves
> > #
> > CONFIG_W1_SLAVE_THERM=3Dy
> > CONFIG_W1_SLAVE_SMEM=3Dy
> > CONFIG_W1_SLAVE_DS2408=3Dy
> > # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> > CONFIG_W1_SLAVE_DS2413=3Dy
> > CONFIG_W1_SLAVE_DS2406=3Dy
> > # CONFIG_W1_SLAVE_DS2423 is not set
> > CONFIG_W1_SLAVE_DS2431=3Dy
> > CONFIG_W1_SLAVE_DS2433=3Dy
> > # CONFIG_W1_SLAVE_DS2433_CRC is not set
> > CONFIG_W1_SLAVE_DS2760=3Dy
> > CONFIG_W1_SLAVE_DS2780=3Dy
> > CONFIG_W1_SLAVE_DS2781=3Dy
> > CONFIG_W1_SLAVE_DS28E04=3Dy
> > # CONFIG_W1_SLAVE_BQ27000 is not set
> > CONFIG_POWER_SUPPLY=3Dy
> > CONFIG_POWER_SUPPLY_DEBUG=3Dy
> > # CONFIG_PDA_POWER is not set
> > CONFIG_GENERIC_ADC_BATTERY=3Dy
> > CONFIG_MAX8925_POWER=3Dy
> > # CONFIG_TEST_POWER is not set
> > CONFIG_BATTERY_DS2760=3Dy
> > # CONFIG_BATTERY_DS2780 is not set
> > CONFIG_BATTERY_DS2781=3Dy
> > CONFIG_BATTERY_DS2782=3Dy
> > CONFIG_BATTERY_OLPC=3Dy
> > CONFIG_BATTERY_SBS=3Dy
> > CONFIG_BATTERY_BQ27x00=3Dy
> > # CONFIG_BATTERY_BQ27X00_I2C is not set
> > # CONFIG_BATTERY_BQ27X00_PLATFORM is not set
> > CONFIG_BATTERY_DA9052=3Dy
> > CONFIG_BATTERY_MAX17040=3Dy
> > # CONFIG_BATTERY_MAX17042 is not set
> > CONFIG_BATTERY_TWL4030_MADC=3Dy
> > CONFIG_CHARGER_PCF50633=3Dy
> > # CONFIG_BATTERY_RX51 is not set
> > CONFIG_CHARGER_ISP1704=3Dy
> > CONFIG_CHARGER_MAX8903=3Dy
> > CONFIG_CHARGER_TWL4030=3Dy
> > CONFIG_CHARGER_LP8727=3Dy
> > CONFIG_CHARGER_GPIO=3Dy
> > CONFIG_CHARGER_MANAGER=3Dy
> > # CONFIG_CHARGER_MAX14577 is not set
> > # CONFIG_CHARGER_MAX77693 is not set
> > CONFIG_CHARGER_MAX8997=3Dy
> > CONFIG_CHARGER_BQ2415X=3Dy
> > CONFIG_CHARGER_BQ24190=3Dy
> > # CONFIG_CHARGER_BQ24257 is not set
> > CONFIG_CHARGER_BQ24735=3Dy
> > # CONFIG_CHARGER_BQ25890 is not set
> > CONFIG_CHARGER_SMB347=3Dy
> > CONFIG_BATTERY_GAUGE_LTC2941=3Dy
> > # CONFIG_CHARGER_RT9455 is not set
> > CONFIG_POWER_RESET=3Dy
> > CONFIG_POWER_RESET_GPIO=3Dy
> > CONFIG_POWER_RESET_GPIO_RESTART=3Dy
> > CONFIG_POWER_RESET_LTC2952=3Dy
> > CONFIG_POWER_RESET_RESTART=3Dy
> > CONFIG_POWER_RESET_SYSCON=3Dy
> > CONFIG_POWER_RESET_SYSCON_POWEROFF=3Dy
> > CONFIG_POWER_AVS=3Dy
> > # CONFIG_HWMON is not set
> > CONFIG_THERMAL=3Dy
> > CONFIG_THERMAL_OF=3Dy
> > CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> > CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> > # CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR is not set
> > # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> > CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> > # CONFIG_THERMAL_GOV_BANG_BANG is not set
> > # CONFIG_THERMAL_GOV_USER_SPACE is not set
> > CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> > # CONFIG_CPU_THERMAL is not set
> > # CONFIG_THERMAL_EMULATION is not set
> > # CONFIG_INTEL_POWERCLAMP is not set
> > CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> > CONFIG_INTEL_SOC_DTS_THERMAL=3Dy
> > # CONFIG_INT340X_THERMAL is not set
> > =

> > #
> > # Texas Instruments thermal drivers
> > #
> > # CONFIG_QCOM_SPMI_TEMP_ALARM is not set
> > CONFIG_WATCHDOG=3Dy
> > CONFIG_WATCHDOG_CORE=3Dy
> > CONFIG_WATCHDOG_NOWAYOUT=3Dy
> > =

> > #
> > # Watchdog Device Drivers
> > #
> > CONFIG_SOFT_WATCHDOG=3Dy
> > CONFIG_DA9052_WATCHDOG=3Dy
> > CONFIG_DA9055_WATCHDOG=3Dy
> > CONFIG_GPIO_WATCHDOG=3Dy
> > CONFIG_GPIO_WATCHDOG_ARCH_INITCALL=3Dy
> > CONFIG_MENF21BMC_WATCHDOG=3Dy
> > # CONFIG_XILINX_WATCHDOG is not set
> > CONFIG_CADENCE_WATCHDOG=3Dy
> > CONFIG_DW_WATCHDOG=3Dy
> > CONFIG_TWL4030_WATCHDOG=3Dy
> > # CONFIG_MAX63XX_WATCHDOG is not set
> > CONFIG_RETU_WATCHDOG=3Dy
> > CONFIG_ACQUIRE_WDT=3Dy
> > # CONFIG_ADVANTECH_WDT is not set
> > # CONFIG_ALIM1535_WDT is not set
> > # CONFIG_ALIM7101_WDT is not set
> > CONFIG_F71808E_WDT=3Dy
> > # CONFIG_SP5100_TCO is not set
> > CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> > # CONFIG_EUROTECH_WDT is not set
> > # CONFIG_IB700_WDT is not set
> > # CONFIG_IBMASR is not set
> > # CONFIG_WAFER_WDT is not set
> > # CONFIG_I6300ESB_WDT is not set
> > # CONFIG_IE6XX_WDT is not set
> > # CONFIG_ITCO_WDT is not set
> > # CONFIG_IT8712F_WDT is not set
> > CONFIG_IT87_WDT=3Dy
> > # CONFIG_HP_WATCHDOG is not set
> > CONFIG_KEMPLD_WDT=3Dy
> > CONFIG_SC1200_WDT=3Dy
> > CONFIG_PC87413_WDT=3Dy
> > # CONFIG_NV_TCO is not set
> > CONFIG_60XX_WDT=3Dy
> > # CONFIG_SBC8360_WDT is not set
> > CONFIG_SBC7240_WDT=3Dy
> > CONFIG_CPU5_WDT=3Dy
> > CONFIG_SMSC_SCH311X_WDT=3Dy
> > CONFIG_SMSC37B787_WDT=3Dy
> > # CONFIG_VIA_WDT is not set
> > CONFIG_W83627HF_WDT=3Dy
> > CONFIG_W83877F_WDT=3Dy
> > CONFIG_W83977F_WDT=3Dy
> > CONFIG_MACHZ_WDT=3Dy
> > # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> > # CONFIG_MEN_A21_WDT is not set
> > =

> > #
> > # PCI-based Watchdog Cards
> > #
> > # CONFIG_PCIPCWATCHDOG is not set
> > # CONFIG_WDTPCI is not set
> > =

> > #
> > # USB-based Watchdog Cards
> > #
> > CONFIG_USBPCWATCHDOG=3Dy
> > CONFIG_SSB_POSSIBLE=3Dy
> > =

> > #
> > # Sonics Silicon Backplane
> > #
> > CONFIG_SSB=3Dy
> > CONFIG_SSB_SPROM=3Dy
> > CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> > CONFIG_SSB_PCIHOST=3Dy
> > # CONFIG_SSB_B43_PCI_BRIDGE is not set
> > CONFIG_SSB_SILENT=3Dy
> > CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=3Dy
> > # CONFIG_SSB_DRIVER_PCICORE is not set
> > CONFIG_SSB_DRIVER_GPIO=3Dy
> > CONFIG_BCMA_POSSIBLE=3Dy
> > =

> > #
> > # Broadcom specific AMBA
> > #
> > # CONFIG_BCMA is not set
> > =

> > #
> > # Multifunction device drivers
> > #
> > CONFIG_MFD_CORE=3Dy
> > # CONFIG_MFD_CS5535 is not set
> > CONFIG_MFD_AS3711=3Dy
> > # CONFIG_MFD_AS3722 is not set
> > # CONFIG_PMIC_ADP5520 is not set
> > # CONFIG_MFD_AAT2870_CORE is not set
> > CONFIG_MFD_ATMEL_HLCDC=3Dy
> > CONFIG_MFD_BCM590XX=3Dy
> > # CONFIG_MFD_AXP20X is not set
> > CONFIG_MFD_CROS_EC=3Dy
> > CONFIG_MFD_CROS_EC_I2C=3Dy
> > CONFIG_MFD_CROS_EC_SPI=3Dy
> > # CONFIG_PMIC_DA903X is not set
> > CONFIG_PMIC_DA9052=3Dy
> > # CONFIG_MFD_DA9052_SPI is not set
> > CONFIG_MFD_DA9052_I2C=3Dy
> > CONFIG_MFD_DA9055=3Dy
> > # CONFIG_MFD_DA9063 is not set
> > CONFIG_MFD_DA9150=3Dy
> > CONFIG_MFD_DLN2=3Dy
> > CONFIG_MFD_MC13XXX=3Dy
> > CONFIG_MFD_MC13XXX_SPI=3Dy
> > CONFIG_MFD_MC13XXX_I2C=3Dy
> > # CONFIG_MFD_HI6421_PMIC is not set
> > # CONFIG_HTC_PASIC3 is not set
> > # CONFIG_HTC_I2CPLD is not set
> > # CONFIG_LPC_ICH is not set
> > # CONFIG_LPC_SCH is not set
> > # CONFIG_INTEL_SOC_PMIC is not set
> > # CONFIG_MFD_JANZ_CMODIO is not set
> > CONFIG_MFD_KEMPLD=3Dy
> > # CONFIG_MFD_88PM800 is not set
> > CONFIG_MFD_88PM805=3Dy
> > # CONFIG_MFD_88PM860X is not set
> > CONFIG_MFD_MAX14577=3Dy
> > # CONFIG_MFD_MAX77686 is not set
> > CONFIG_MFD_MAX77693=3Dy
> > # CONFIG_MFD_MAX77843 is not set
> > # CONFIG_MFD_MAX8907 is not set
> > CONFIG_MFD_MAX8925=3Dy
> > CONFIG_MFD_MAX8997=3Dy
> > # CONFIG_MFD_MAX8998 is not set
> > CONFIG_MFD_MT6397=3Dy
> > CONFIG_MFD_MENF21BMC=3Dy
> > # CONFIG_EZX_PCAP is not set
> > CONFIG_MFD_VIPERBOARD=3Dy
> > CONFIG_MFD_RETU=3Dy
> > CONFIG_MFD_PCF50633=3Dy
> > CONFIG_PCF50633_ADC=3Dy
> > # CONFIG_PCF50633_GPIO is not set
> > # CONFIG_MFD_RDC321X is not set
> > # CONFIG_MFD_RTSX_PCI is not set
> > # CONFIG_MFD_RT5033 is not set
> > CONFIG_MFD_RTSX_USB=3Dy
> > # CONFIG_MFD_RC5T583 is not set
> > # CONFIG_MFD_RK808 is not set
> > # CONFIG_MFD_RN5T618 is not set
> > # CONFIG_MFD_SEC_CORE is not set
> > CONFIG_MFD_SI476X_CORE=3Dy
> > # CONFIG_MFD_SM501 is not set
> > CONFIG_MFD_SKY81452=3Dy
> > CONFIG_MFD_SMSC=3Dy
> > # CONFIG_ABX500_CORE is not set
> > CONFIG_MFD_STMPE=3Dy
> > =

> > #
> > # STMicroelectronics STMPE Interface Drivers
> > #
> > # CONFIG_STMPE_I2C is not set
> > # CONFIG_STMPE_SPI is not set
> > CONFIG_MFD_SYSCON=3Dy
> > # CONFIG_MFD_TI_AM335X_TSCADC is not set
> > CONFIG_MFD_LP3943=3Dy
> > CONFIG_MFD_LP8788=3Dy
> > CONFIG_MFD_PALMAS=3Dy
> > CONFIG_TPS6105X=3Dy
> > # CONFIG_TPS65010 is not set
> > CONFIG_TPS6507X=3Dy
> > # CONFIG_MFD_TPS65090 is not set
> > CONFIG_MFD_TPS65217=3Dy
> > CONFIG_MFD_TPS65218=3Dy
> > CONFIG_MFD_TPS6586X=3Dy
> > # CONFIG_MFD_TPS65910 is not set
> > CONFIG_MFD_TPS65912=3Dy
> > # CONFIG_MFD_TPS65912_I2C is not set
> > CONFIG_MFD_TPS65912_SPI=3Dy
> > # CONFIG_MFD_TPS80031 is not set
> > CONFIG_TWL4030_CORE=3Dy
> > CONFIG_MFD_TWL4030_AUDIO=3Dy
> > # CONFIG_TWL6040_CORE is not set
> > CONFIG_MFD_WL1273_CORE=3Dy
> > # CONFIG_MFD_LM3533 is not set
> > # CONFIG_MFD_TIMBERDALE is not set
> > # CONFIG_MFD_TC3589X is not set
> > # CONFIG_MFD_TMIO is not set
> > # CONFIG_MFD_VX855 is not set
> > CONFIG_MFD_ARIZONA=3Dy
> > # CONFIG_MFD_ARIZONA_I2C is not set
> > CONFIG_MFD_ARIZONA_SPI=3Dy
> > CONFIG_MFD_WM5102=3Dy
> > # CONFIG_MFD_WM5110 is not set
> > # CONFIG_MFD_WM8997 is not set
> > # CONFIG_MFD_WM8400 is not set
> > # CONFIG_MFD_WM831X_I2C is not set
> > # CONFIG_MFD_WM831X_SPI is not set
> > # CONFIG_MFD_WM8350_I2C is not set
> > CONFIG_MFD_WM8994=3Dy
> > CONFIG_REGULATOR=3Dy
> > # CONFIG_REGULATOR_DEBUG is not set
> > CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> > # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> > CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> > # CONFIG_REGULATOR_ACT8865 is not set
> > CONFIG_REGULATOR_AD5398=3Dy
> > # CONFIG_REGULATOR_ANATOP is not set
> > CONFIG_REGULATOR_AS3711=3Dy
> > CONFIG_REGULATOR_BCM590XX=3Dy
> > CONFIG_REGULATOR_DA9052=3Dy
> > # CONFIG_REGULATOR_DA9055 is not set
> > CONFIG_REGULATOR_DA9210=3Dy
> > CONFIG_REGULATOR_DA9211=3Dy
> > # CONFIG_REGULATOR_FAN53555 is not set
> > # CONFIG_REGULATOR_GPIO is not set
> > CONFIG_REGULATOR_ISL9305=3Dy
> > CONFIG_REGULATOR_ISL6271A=3Dy
> > # CONFIG_REGULATOR_LP3971 is not set
> > CONFIG_REGULATOR_LP3972=3Dy
> > CONFIG_REGULATOR_LP872X=3Dy
> > CONFIG_REGULATOR_LP8755=3Dy
> > CONFIG_REGULATOR_LP8788=3Dy
> > CONFIG_REGULATOR_LTC3589=3Dy
> > CONFIG_REGULATOR_MAX14577=3Dy
> > CONFIG_REGULATOR_MAX1586=3Dy
> > CONFIG_REGULATOR_MAX8649=3Dy
> > CONFIG_REGULATOR_MAX8660=3Dy
> > CONFIG_REGULATOR_MAX8925=3Dy
> > # CONFIG_REGULATOR_MAX8952 is not set
> > CONFIG_REGULATOR_MAX8973=3Dy
> > CONFIG_REGULATOR_MAX8997=3Dy
> > CONFIG_REGULATOR_MAX77693=3Dy
> > CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> > CONFIG_REGULATOR_MC13783=3Dy
> > # CONFIG_REGULATOR_MC13892 is not set
> > # CONFIG_REGULATOR_MT6397 is not set
> > # CONFIG_REGULATOR_PALMAS is not set
> > # CONFIG_REGULATOR_PCF50633 is not set
> > CONFIG_REGULATOR_PFUZE100=3Dy
> > CONFIG_REGULATOR_PWM=3Dy
> > CONFIG_REGULATOR_QCOM_SPMI=3Dy
> > # CONFIG_REGULATOR_SKY81452 is not set
> > CONFIG_REGULATOR_TPS51632=3Dy
> > CONFIG_REGULATOR_TPS6105X=3Dy
> > CONFIG_REGULATOR_TPS62360=3Dy
> > # CONFIG_REGULATOR_TPS65023 is not set
> > # CONFIG_REGULATOR_TPS6507X is not set
> > CONFIG_REGULATOR_TPS65217=3Dy
> > CONFIG_REGULATOR_TPS65218=3Dy
> > CONFIG_REGULATOR_TPS6524X=3Dy
> > # CONFIG_REGULATOR_TPS6586X is not set
> > CONFIG_REGULATOR_TPS65912=3Dy
> > CONFIG_REGULATOR_TWL4030=3Dy
> > CONFIG_REGULATOR_WM8994=3Dy
> > # CONFIG_MEDIA_SUPPORT is not set
> > =

> > #
> > # Graphics support
> > #
> > # CONFIG_AGP is not set
> > CONFIG_VGA_ARB=3Dy
> > CONFIG_VGA_ARB_MAX_GPUS=3D16
> > # CONFIG_VGA_SWITCHEROO is not set
> > =

> > #
> > # Direct Rendering Manager
> > #
> > CONFIG_DRM=3Dy
> > CONFIG_DRM_KMS_HELPER=3Dy
> > CONFIG_DRM_KMS_FB_HELPER=3Dy
> > # CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
> > CONFIG_DRM_TTM=3Dy
> > =

> > #
> > # I2C encoder or helper chips
> > #
> > CONFIG_DRM_I2C_ADV7511=3Dy
> > CONFIG_DRM_I2C_CH7006=3Dy
> > CONFIG_DRM_I2C_SIL164=3Dy
> > CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> > # CONFIG_DRM_PTN3460 is not set
> > CONFIG_DRM_PS8622=3Dy
> > # CONFIG_DRM_TDFX is not set
> > # CONFIG_DRM_R128 is not set
> > # CONFIG_DRM_RADEON is not set
> > # CONFIG_DRM_AMDGPU is not set
> > # CONFIG_DRM_NOUVEAU is not set
> > # CONFIG_DRM_I915 is not set
> > # CONFIG_DRM_MGA is not set
> > # CONFIG_DRM_VIA is not set
> > # CONFIG_DRM_SAVAGE is not set
> > CONFIG_DRM_VGEM=3Dy
> > # CONFIG_DRM_VMWGFX is not set
> > # CONFIG_DRM_GMA500 is not set
> > # CONFIG_DRM_UDL is not set
> > # CONFIG_DRM_AST is not set
> > # CONFIG_DRM_MGAG200 is not set
> > # CONFIG_DRM_CIRRUS_QEMU is not set
> > # CONFIG_DRM_QXL is not set
> > # CONFIG_DRM_BOCHS is not set
> > CONFIG_DRM_VIRTIO_GPU=3Dy
> > CONFIG_DRM_PANEL=3Dy
> > =

> > #
> > # Display Panels
> > #
> > # CONFIG_DRM_PANEL_SIMPLE is not set
> > CONFIG_DRM_PANEL_LD9040=3Dy
> > # CONFIG_DRM_PANEL_S6E8AA0 is not set
> > =

> > #
> > # Frame buffer Devices
> > #
> > CONFIG_FB=3Dy
> > # CONFIG_FIRMWARE_EDID is not set
> > CONFIG_FB_CMDLINE=3Dy
> > # CONFIG_FB_DDC is not set
> > # CONFIG_FB_BOOT_VESA_SUPPORT is not set
> > CONFIG_FB_CFB_FILLRECT=3Dy
> > CONFIG_FB_CFB_COPYAREA=3Dy
> > CONFIG_FB_CFB_IMAGEBLIT=3Dy
> > # CONFIG_FB_CFB_REV_PIXELS_IN_BYTE is not set
> > CONFIG_FB_SYS_FILLRECT=3Dy
> > CONFIG_FB_SYS_COPYAREA=3Dy
> > CONFIG_FB_SYS_IMAGEBLIT=3Dy
> > # CONFIG_FB_FOREIGN_ENDIAN is not set
> > CONFIG_FB_SYS_FOPS=3Dy
> > CONFIG_FB_DEFERRED_IO=3Dy
> > CONFIG_FB_HECUBA=3Dy
> > # CONFIG_FB_SVGALIB is not set
> > # CONFIG_FB_MACMODES is not set
> > CONFIG_FB_BACKLIGHT=3Dy
> > # CONFIG_FB_MODE_HELPERS is not set
> > CONFIG_FB_TILEBLITTING=3Dy
> > =

> > #
> > # Frame buffer hardware drivers
> > #
> > # CONFIG_FB_CIRRUS is not set
> > # CONFIG_FB_PM2 is not set
> > # CONFIG_FB_CYBER2000 is not set
> > CONFIG_FB_ARC=3Dy
> > # CONFIG_FB_ASILIANT is not set
> > # CONFIG_FB_IMSTT is not set
> > # CONFIG_FB_VGA16 is not set
> > # CONFIG_FB_VESA is not set
> > CONFIG_FB_N411=3Dy
> > # CONFIG_FB_HGA is not set
> > CONFIG_FB_OPENCORES=3Dy
> > # CONFIG_FB_S1D13XXX is not set
> > # CONFIG_FB_NVIDIA is not set
> > # CONFIG_FB_RIVA is not set
> > # CONFIG_FB_I740 is not set
> > # CONFIG_FB_LE80578 is not set
> > # CONFIG_FB_MATROX is not set
> > # CONFIG_FB_RADEON is not set
> > # CONFIG_FB_ATY128 is not set
> > # CONFIG_FB_ATY is not set
> > # CONFIG_FB_S3 is not set
> > # CONFIG_FB_SAVAGE is not set
> > # CONFIG_FB_SIS is not set
> > # CONFIG_FB_VIA is not set
> > # CONFIG_FB_NEOMAGIC is not set
> > # CONFIG_FB_KYRO is not set
> > # CONFIG_FB_3DFX is not set
> > # CONFIG_FB_VOODOO1 is not set
> > # CONFIG_FB_VT8623 is not set
> > # CONFIG_FB_TRIDENT is not set
> > # CONFIG_FB_ARK is not set
> > # CONFIG_FB_PM3 is not set
> > # CONFIG_FB_CARMINE is not set
> > # CONFIG_FB_GEODE is not set
> > # CONFIG_FB_SMSCUFX is not set
> > # CONFIG_FB_UDL is not set
> > CONFIG_FB_VIRTUAL=3Dy
> > # CONFIG_FB_METRONOME is not set
> > # CONFIG_FB_MB862XX is not set
> > CONFIG_FB_BROADSHEET=3Dy
> > CONFIG_FB_AUO_K190X=3Dy
> > CONFIG_FB_AUO_K1900=3Dy
> > # CONFIG_FB_AUO_K1901 is not set
> > # CONFIG_FB_SIMPLE is not set
> > # CONFIG_FB_SSD1307 is not set
> > CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> > CONFIG_LCD_CLASS_DEVICE=3Dy
> > CONFIG_LCD_L4F00242T03=3Dy
> > # CONFIG_LCD_LMS283GF05 is not set
> > CONFIG_LCD_LTV350QV=3Dy
> > CONFIG_LCD_ILI922X=3Dy
> > CONFIG_LCD_ILI9320=3Dy
> > # CONFIG_LCD_TDO24M is not set
> > # CONFIG_LCD_VGG2432A4 is not set
> > CONFIG_LCD_PLATFORM=3Dy
> > # CONFIG_LCD_S6E63M0 is not set
> > # CONFIG_LCD_LD9040 is not set
> > # CONFIG_LCD_AMS369FG06 is not set
> > # CONFIG_LCD_LMS501KF03 is not set
> > CONFIG_LCD_HX8357=3Dy
> > CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> > CONFIG_BACKLIGHT_GENERIC=3Dy
> > CONFIG_BACKLIGHT_PWM=3Dy
> > # CONFIG_BACKLIGHT_DA9052 is not set
> > CONFIG_BACKLIGHT_MAX8925=3Dy
> > # CONFIG_BACKLIGHT_APPLE is not set
> > CONFIG_BACKLIGHT_SAHARA=3Dy
> > CONFIG_BACKLIGHT_ADP8860=3Dy
> > CONFIG_BACKLIGHT_ADP8870=3Dy
> > CONFIG_BACKLIGHT_PCF50633=3Dy
> > CONFIG_BACKLIGHT_LM3630A=3Dy
> > CONFIG_BACKLIGHT_LM3639=3Dy
> > # CONFIG_BACKLIGHT_LP855X is not set
> > # CONFIG_BACKLIGHT_LP8788 is not set
> > CONFIG_BACKLIGHT_PANDORA=3Dy
> > # CONFIG_BACKLIGHT_SKY81452 is not set
> > # CONFIG_BACKLIGHT_TPS65217 is not set
> > # CONFIG_BACKLIGHT_AS3711 is not set
> > # CONFIG_BACKLIGHT_GPIO is not set
> > # CONFIG_BACKLIGHT_LV5207LP is not set
> > CONFIG_BACKLIGHT_BD6107=3Dy
> > # CONFIG_VGASTATE is not set
> > CONFIG_VIDEOMODE_HELPERS=3Dy
> > CONFIG_HDMI=3Dy
> > CONFIG_LOGO=3Dy
> > # CONFIG_LOGO_LINUX_MONO is not set
> > CONFIG_LOGO_LINUX_VGA16=3Dy
> > # CONFIG_LOGO_LINUX_CLUT224 is not set
> > CONFIG_SOUND=3Dy
> > CONFIG_SOUND_OSS_CORE=3Dy
> > # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> > CONFIG_SND=3Dy
> > CONFIG_SND_TIMER=3Dy
> > CONFIG_SND_PCM=3Dy
> > CONFIG_SND_RAWMIDI=3Dy
> > CONFIG_SND_SEQUENCER=3Dy
> > CONFIG_SND_SEQ_DUMMY=3Dy
> > CONFIG_SND_OSSEMUL=3Dy
> > CONFIG_SND_MIXER_OSS=3Dy
> > CONFIG_SND_PCM_OSS=3Dy
> > # CONFIG_SND_PCM_OSS_PLUGINS is not set
> > CONFIG_SND_SEQUENCER_OSS=3Dy
> > # CONFIG_SND_HRTIMER is not set
> > CONFIG_SND_DYNAMIC_MINORS=3Dy
> > CONFIG_SND_MAX_CARDS=3D32
> > # CONFIG_SND_SUPPORT_OLD_API is not set
> > CONFIG_SND_PROC_FS=3Dy
> > CONFIG_SND_VERBOSE_PROCFS=3Dy
> > # CONFIG_SND_VERBOSE_PRINTK is not set
> > CONFIG_SND_DEBUG=3Dy
> > # CONFIG_SND_DEBUG_VERBOSE is not set
> > # CONFIG_SND_PCM_XRUN_DEBUG is not set
> > CONFIG_SND_DMA_SGBUF=3Dy
> > CONFIG_SND_RAWMIDI_SEQ=3Dy
> > # CONFIG_SND_OPL3_LIB_SEQ is not set
> > # CONFIG_SND_OPL4_LIB_SEQ is not set
> > # CONFIG_SND_SBAWE_SEQ is not set
> > # CONFIG_SND_EMU10K1_SEQ is not set
> > CONFIG_SND_MPU401_UART=3Dy
> > CONFIG_SND_DRIVERS=3Dy
> > # CONFIG_SND_PCSP is not set
> > # CONFIG_SND_DUMMY is not set
> > CONFIG_SND_ALOOP=3Dy
> > CONFIG_SND_VIRMIDI=3Dy
> > CONFIG_SND_MTPAV=3Dy
> > CONFIG_SND_MTS64=3Dy
> > CONFIG_SND_SERIAL_U16550=3Dy
> > CONFIG_SND_MPU401=3Dy
> > CONFIG_SND_PORTMAN2X4=3Dy
> > CONFIG_SND_PCI=3Dy
> > # CONFIG_SND_AD1889 is not set
> > # CONFIG_SND_ALS300 is not set
> > # CONFIG_SND_ALS4000 is not set
> > # CONFIG_SND_ALI5451 is not set
> > # CONFIG_SND_ASIHPI is not set
> > # CONFIG_SND_ATIIXP is not set
> > # CONFIG_SND_ATIIXP_MODEM is not set
> > # CONFIG_SND_AU8810 is not set
> > # CONFIG_SND_AU8820 is not set
> > # CONFIG_SND_AU8830 is not set
> > # CONFIG_SND_AW2 is not set
> > # CONFIG_SND_AZT3328 is not set
> > # CONFIG_SND_BT87X is not set
> > # CONFIG_SND_CA0106 is not set
> > # CONFIG_SND_CMIPCI is not set
> > # CONFIG_SND_OXYGEN is not set
> > # CONFIG_SND_CS4281 is not set
> > # CONFIG_SND_CS46XX is not set
> > # CONFIG_SND_CS5530 is not set
> > # CONFIG_SND_CS5535AUDIO is not set
> > # CONFIG_SND_CTXFI is not set
> > # CONFIG_SND_DARLA20 is not set
> > # CONFIG_SND_GINA20 is not set
> > # CONFIG_SND_LAYLA20 is not set
> > # CONFIG_SND_DARLA24 is not set
> > # CONFIG_SND_GINA24 is not set
> > # CONFIG_SND_LAYLA24 is not set
> > # CONFIG_SND_MONA is not set
> > # CONFIG_SND_MIA is not set
> > # CONFIG_SND_ECHO3G is not set
> > # CONFIG_SND_INDIGO is not set
> > # CONFIG_SND_INDIGOIO is not set
> > # CONFIG_SND_INDIGODJ is not set
> > # CONFIG_SND_INDIGOIOX is not set
> > # CONFIG_SND_INDIGODJX is not set
> > # CONFIG_SND_EMU10K1 is not set
> > # CONFIG_SND_EMU10K1X is not set
> > # CONFIG_SND_ENS1370 is not set
> > # CONFIG_SND_ENS1371 is not set
> > # CONFIG_SND_ES1938 is not set
> > # CONFIG_SND_ES1968 is not set
> > # CONFIG_SND_FM801 is not set
> > # CONFIG_SND_HDSP is not set
> > # CONFIG_SND_HDSPM is not set
> > # CONFIG_SND_ICE1712 is not set
> > # CONFIG_SND_ICE1724 is not set
> > # CONFIG_SND_INTEL8X0 is not set
> > # CONFIG_SND_INTEL8X0M is not set
> > # CONFIG_SND_KORG1212 is not set
> > # CONFIG_SND_LOLA is not set
> > # CONFIG_SND_LX6464ES is not set
> > # CONFIG_SND_MAESTRO3 is not set
> > # CONFIG_SND_MIXART is not set
> > # CONFIG_SND_NM256 is not set
> > # CONFIG_SND_PCXHR is not set
> > # CONFIG_SND_RIPTIDE is not set
> > # CONFIG_SND_RME32 is not set
> > # CONFIG_SND_RME96 is not set
> > # CONFIG_SND_RME9652 is not set
> > # CONFIG_SND_SE6X is not set
> > # CONFIG_SND_SIS7019 is not set
> > # CONFIG_SND_SONICVIBES is not set
> > # CONFIG_SND_TRIDENT is not set
> > # CONFIG_SND_VIA82XX is not set
> > # CONFIG_SND_VIA82XX_MODEM is not set
> > # CONFIG_SND_VIRTUOSO is not set
> > # CONFIG_SND_VX222 is not set
> > # CONFIG_SND_YMFPCI is not set
> > =

> > #
> > # HD-Audio
> > #
> > # CONFIG_SND_HDA_INTEL is not set
> > CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> > CONFIG_SND_SPI=3Dy
> > # CONFIG_SND_USB is not set
> > # CONFIG_SND_SOC is not set
> > # CONFIG_SOUND_PRIME is not set
> > =

> > #
> > # HID support
> > #
> > CONFIG_HID=3Dy
> > # CONFIG_HID_BATTERY_STRENGTH is not set
> > # CONFIG_HIDRAW is not set
> > # CONFIG_UHID is not set
> > CONFIG_HID_GENERIC=3Dy
> > =

> > #
> > # Special HID drivers
> > #
> > # CONFIG_HID_A4TECH is not set
> > # CONFIG_HID_ACRUX is not set
> > # CONFIG_HID_APPLE is not set
> > # CONFIG_HID_APPLEIR is not set
> > # CONFIG_HID_AUREAL is not set
> > # CONFIG_HID_BELKIN is not set
> > # CONFIG_HID_BETOP_FF is not set
> > # CONFIG_HID_CHERRY is not set
> > # CONFIG_HID_CHICONY is not set
> > # CONFIG_HID_PRODIKEYS is not set
> > # CONFIG_HID_CP2112 is not set
> > # CONFIG_HID_CYPRESS is not set
> > # CONFIG_HID_DRAGONRISE is not set
> > # CONFIG_HID_EMS_FF is not set
> > # CONFIG_HID_ELECOM is not set
> > # CONFIG_HID_ELO is not set
> > # CONFIG_HID_EZKEY is not set
> > # CONFIG_HID_HOLTEK is not set
> > # CONFIG_HID_GT683R is not set
> > # CONFIG_HID_KEYTOUCH is not set
> > # CONFIG_HID_KYE is not set
> > # CONFIG_HID_UCLOGIC is not set
> > # CONFIG_HID_WALTOP is not set
> > # CONFIG_HID_GYRATION is not set
> > # CONFIG_HID_ICADE is not set
> > # CONFIG_HID_TWINHAN is not set
> > # CONFIG_HID_KENSINGTON is not set
> > # CONFIG_HID_LCPOWER is not set
> > # CONFIG_HID_LENOVO is not set
> > # CONFIG_HID_LOGITECH is not set
> > # CONFIG_HID_MAGICMOUSE is not set
> > # CONFIG_HID_MICROSOFT is not set
> > # CONFIG_HID_MONTEREY is not set
> > # CONFIG_HID_MULTITOUCH is not set
> > # CONFIG_HID_NTRIG is not set
> > # CONFIG_HID_ORTEK is not set
> > # CONFIG_HID_PANTHERLORD is not set
> > # CONFIG_HID_PENMOUNT is not set
> > # CONFIG_HID_PETALYNX is not set
> > # CONFIG_HID_PICOLCD is not set
> > # CONFIG_HID_PLANTRONICS is not set
> > # CONFIG_HID_PRIMAX is not set
> > # CONFIG_HID_ROCCAT is not set
> > # CONFIG_HID_SAITEK is not set
> > # CONFIG_HID_SAMSUNG is not set
> > # CONFIG_HID_SONY is not set
> > # CONFIG_HID_SPEEDLINK is not set
> > # CONFIG_HID_STEELSERIES is not set
> > # CONFIG_HID_SUNPLUS is not set
> > # CONFIG_HID_RMI is not set
> > # CONFIG_HID_GREENASIA is not set
> > # CONFIG_HID_SMARTJOYPLUS is not set
> > # CONFIG_HID_TIVO is not set
> > # CONFIG_HID_TOPSEED is not set
> > # CONFIG_HID_THINGM is not set
> > # CONFIG_HID_THRUSTMASTER is not set
> > # CONFIG_HID_WACOM is not set
> > # CONFIG_HID_WIIMOTE is not set
> > # CONFIG_HID_XINMO is not set
> > # CONFIG_HID_ZEROPLUS is not set
> > # CONFIG_HID_ZYDACRON is not set
> > # CONFIG_HID_SENSOR_HUB is not set
> > =

> > #
> > # USB HID support
> > #
> > CONFIG_USB_HID=3Dy
> > # CONFIG_HID_PID is not set
> > # CONFIG_USB_HIDDEV is not set
> > =

> > #
> > # I2C HID support
> > #
> > # CONFIG_I2C_HID is not set
> > CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> > CONFIG_USB_SUPPORT=3Dy
> > CONFIG_USB_COMMON=3Dy
> > CONFIG_USB_ARCH_HAS_HCD=3Dy
> > CONFIG_USB=3Dy
> > CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> > =

> > #
> > # Miscellaneous USB options
> > #
> > CONFIG_USB_DEFAULT_PERSIST=3Dy
> > CONFIG_USB_DYNAMIC_MINORS=3Dy
> > CONFIG_USB_OTG=3Dy
> > # CONFIG_USB_OTG_WHITELIST is not set
> > # CONFIG_USB_OTG_BLACKLIST_HUB is not set
> > # CONFIG_USB_OTG_FSM is not set
> > CONFIG_USB_ULPI_BUS=3Dy
> > # CONFIG_USB_MON is not set
> > CONFIG_USB_WUSB=3Dy
> > # CONFIG_USB_WUSB_CBAF is not set
> > =

> > #
> > # USB Host Controller Drivers
> > #
> > CONFIG_USB_C67X00_HCD=3Dy
> > # CONFIG_USB_XHCI_HCD is not set
> > CONFIG_USB_EHCI_HCD=3Dy
> > CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> > CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> > CONFIG_USB_EHCI_PCI=3Dy
> > CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> > CONFIG_USB_OXU210HP_HCD=3Dy
> > CONFIG_USB_ISP116X_HCD=3Dy
> > # CONFIG_USB_ISP1362_HCD is not set
> > # CONFIG_USB_FUSBH200_HCD is not set
> > # CONFIG_USB_FOTG210_HCD is not set
> > CONFIG_USB_MAX3421_HCD=3Dy
> > # CONFIG_USB_OHCI_HCD is not set
> > # CONFIG_USB_UHCI_HCD is not set
> > # CONFIG_USB_U132_HCD is not set
> > CONFIG_USB_SL811_HCD=3Dy
> > # CONFIG_USB_SL811_HCD_ISO is not set
> > CONFIG_USB_R8A66597_HCD=3Dy
> > # CONFIG_USB_WHCI_HCD is not set
> > CONFIG_USB_HWA_HCD=3Dy
> > CONFIG_USB_HCD_SSB=3Dy
> > # CONFIG_USB_HCD_TEST_MODE is not set
> > =

> > #
> > # USB Device Class drivers
> > #
> > CONFIG_USB_ACM=3Dy
> > CONFIG_USB_PRINTER=3Dy
> > CONFIG_USB_WDM=3Dy
> > CONFIG_USB_TMC=3Dy
> > =

> > #
> > # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> > #
> > =

> > #
> > # also be needed; see USB_STORAGE Help for more info
> > #
> > =

> > #
> > # USB Imaging devices
> > #
> > CONFIG_USB_MDC800=3Dy
> > CONFIG_USBIP_CORE=3Dy
> > CONFIG_USBIP_VHCI_HCD=3Dy
> > CONFIG_USBIP_HOST=3Dy
> > CONFIG_USBIP_DEBUG=3Dy
> > CONFIG_USB_MUSB_HDRC=3Dy
> > # CONFIG_USB_MUSB_HOST is not set
> > # CONFIG_USB_MUSB_GADGET is not set
> > CONFIG_USB_MUSB_DUAL_ROLE=3Dy
> > =

> > #
> > # Platform Glue Layer
> > #
> > CONFIG_MUSB_PIO_ONLY=3Dy
> > # CONFIG_USB_DWC3 is not set
> > CONFIG_USB_DWC2=3Dy
> > # CONFIG_USB_DWC2_HOST is not set
> > =

> > #
> > # Gadget/Dual-role mode requires USB Gadget support to be enabled
> > #
> > # CONFIG_USB_DWC2_PERIPHERAL is not set
> > CONFIG_USB_DWC2_DUAL_ROLE=3Dy
> > # CONFIG_USB_DWC2_PCI is not set
> > # CONFIG_USB_DWC2_DEBUG is not set
> > # CONFIG_USB_DWC2_TRACK_MISSED_SOFS is not set
> > CONFIG_USB_CHIPIDEA=3Dy
> > CONFIG_USB_CHIPIDEA_OF=3Dy
> > CONFIG_USB_CHIPIDEA_UDC=3Dy
> > CONFIG_USB_CHIPIDEA_HOST=3Dy
> > # CONFIG_USB_CHIPIDEA_DEBUG is not set
> > CONFIG_USB_ISP1760=3Dy
> > CONFIG_USB_ISP1761_UDC=3Dy
> > # CONFIG_USB_ISP1760_HOST_ROLE is not set
> > CONFIG_USB_ISP1760_GADGET_ROLE=3Dy
> > # CONFIG_USB_ISP1760_DUAL_ROLE is not set
> > =

> > #
> > # USB port drivers
> > #
> > CONFIG_USB_USS720=3Dy
> > # CONFIG_USB_SERIAL is not set
> > =

> > #
> > # USB Miscellaneous drivers
> > #
> > # CONFIG_USB_EMI62 is not set
> > CONFIG_USB_EMI26=3Dy
> > CONFIG_USB_ADUTUX=3Dy
> > # CONFIG_USB_SEVSEG is not set
> > CONFIG_USB_RIO500=3Dy
> > CONFIG_USB_LEGOTOWER=3Dy
> > CONFIG_USB_LCD=3Dy
> > # CONFIG_USB_LED is not set
> > CONFIG_USB_CYPRESS_CY7C63=3Dy
> > CONFIG_USB_CYTHERM=3Dy
> > CONFIG_USB_IDMOUSE=3Dy
> > CONFIG_USB_FTDI_ELAN=3Dy
> > CONFIG_USB_APPLEDISPLAY=3Dy
> > # CONFIG_USB_SISUSBVGA is not set
> > # CONFIG_USB_LD is not set
> > CONFIG_USB_TRANCEVIBRATOR=3Dy
> > # CONFIG_USB_IOWARRIOR is not set
> > CONFIG_USB_TEST=3Dy
> > # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> > CONFIG_USB_ISIGHTFW=3Dy
> > CONFIG_USB_YUREX=3Dy
> > # CONFIG_USB_EZUSB_FX2 is not set
> > # CONFIG_USB_HSIC_USB3503 is not set
> > CONFIG_USB_LINK_LAYER_TEST=3Dy
> > CONFIG_USB_CHAOSKEY=3Dy
> > CONFIG_USB_ATM=3Dy
> > CONFIG_USB_SPEEDTOUCH=3Dy
> > # CONFIG_USB_CXACRU is not set
> > CONFIG_USB_UEAGLEATM=3Dy
> > CONFIG_USB_XUSBATM=3Dy
> > =

> > #
> > # USB Physical Layer drivers
> > #
> > CONFIG_USB_PHY=3Dy
> > # CONFIG_NOP_USB_XCEIV is not set
> > CONFIG_USB_GPIO_VBUS=3Dy
> > CONFIG_TAHVO_USB=3Dy
> > CONFIG_TAHVO_USB_HOST_BY_DEFAULT=3Dy
> > CONFIG_USB_ISP1301=3Dy
> > CONFIG_USB_GADGET=3Dy
> > # CONFIG_USB_GADGET_DEBUG is not set
> > # CONFIG_USB_GADGET_DEBUG_FILES is not set
> > CONFIG_USB_GADGET_DEBUG_FS=3Dy
> > CONFIG_USB_GADGET_VBUS_DRAW=3D2
> > CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=3D2
> > =

> > #
> > # USB Peripheral Controller
> > #
> > # CONFIG_USB_FUSB300 is not set
> > CONFIG_USB_FOTG210_UDC=3Dy
> > CONFIG_USB_GR_UDC=3Dy
> > CONFIG_USB_R8A66597=3Dy
> > CONFIG_USB_PXA27X=3Dy
> > CONFIG_USB_MV_UDC=3Dy
> > CONFIG_USB_MV_U3D=3Dy
> > CONFIG_USB_M66592=3Dy
> > CONFIG_USB_BDC_UDC=3Dy
> > =

> > #
> > # Platform Support
> > #
> > CONFIG_USB_BDC_PCI=3Dy
> > # CONFIG_USB_AMD5536UDC is not set
> > # CONFIG_USB_NET2272 is not set
> > # CONFIG_USB_NET2280 is not set
> > # CONFIG_USB_GOKU is not set
> > # CONFIG_USB_EG20T is not set
> > # CONFIG_USB_GADGET_XILINX is not set
> > # CONFIG_USB_DUMMY_HCD is not set
> > CONFIG_USB_LIBCOMPOSITE=3Dy
> > CONFIG_USB_F_ACM=3Dy
> > CONFIG_USB_U_SERIAL=3Dy
> > CONFIG_USB_U_ETHER=3Dy
> > CONFIG_USB_F_ECM=3Dy
> > # CONFIG_USB_CONFIGFS is not set
> > # CONFIG_USB_ZERO is not set
> > # CONFIG_USB_AUDIO is not set
> > # CONFIG_USB_ETH is not set
> > # CONFIG_USB_G_NCM is not set
> > # CONFIG_USB_GADGETFS is not set
> > # CONFIG_USB_FUNCTIONFS is not set
> > # CONFIG_USB_G_SERIAL is not set
> > # CONFIG_USB_MIDI_GADGET is not set
> > # CONFIG_USB_G_PRINTER is not set
> > CONFIG_USB_CDC_COMPOSITE=3Dy
> > # CONFIG_USB_G_NOKIA is not set
> > # CONFIG_USB_G_HID is not set
> > # CONFIG_USB_G_DBGP is not set
> > CONFIG_UWB=3Dy
> > CONFIG_UWB_HWA=3Dy
> > # CONFIG_UWB_WHCI is not set
> > CONFIG_UWB_I1480U=3Dy
> > # CONFIG_MMC is not set
> > CONFIG_MEMSTICK=3Dy
> > # CONFIG_MEMSTICK_DEBUG is not set
> > =

> > #
> > # MemoryStick drivers
> > #
> > CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> > =

> > #
> > # MemoryStick Host Controller Drivers
> > #
> > # CONFIG_MEMSTICK_TIFM_MS is not set
> > # CONFIG_MEMSTICK_JMICRON_38X is not set
> > # CONFIG_MEMSTICK_R592 is not set
> > CONFIG_MEMSTICK_REALTEK_USB=3Dy
> > CONFIG_NEW_LEDS=3Dy
> > CONFIG_LEDS_CLASS=3Dy
> > # CONFIG_LEDS_CLASS_FLASH is not set
> > =

> > #
> > # LED drivers
> > #
> > CONFIG_LEDS_BCM6328=3Dy
> > CONFIG_LEDS_BCM6358=3Dy
> > CONFIG_LEDS_LM3530=3Dy
> > CONFIG_LEDS_LM3642=3Dy
> > # CONFIG_LEDS_PCA9532 is not set
> > CONFIG_LEDS_GPIO=3Dy
> > # CONFIG_LEDS_LP3944 is not set
> > CONFIG_LEDS_LP55XX_COMMON=3Dy
> > # CONFIG_LEDS_LP5521 is not set
> > # CONFIG_LEDS_LP5523 is not set
> > CONFIG_LEDS_LP5562=3Dy
> > CONFIG_LEDS_LP8501=3Dy
> > # CONFIG_LEDS_LP8788 is not set
> > # CONFIG_LEDS_LP8860 is not set
> > # CONFIG_LEDS_PCA955X is not set
> > # CONFIG_LEDS_PCA963X is not set
> > CONFIG_LEDS_DA9052=3Dy
> > CONFIG_LEDS_DAC124S085=3Dy
> > CONFIG_LEDS_PWM=3Dy
> > CONFIG_LEDS_REGULATOR=3Dy
> > CONFIG_LEDS_BD2802=3Dy
> > CONFIG_LEDS_LT3593=3Dy
> > CONFIG_LEDS_MC13783=3Dy
> > CONFIG_LEDS_TCA6507=3Dy
> > CONFIG_LEDS_TLC591XX=3Dy
> > CONFIG_LEDS_MAX8997=3Dy
> > # CONFIG_LEDS_LM355x is not set
> > # CONFIG_LEDS_OT200 is not set
> > CONFIG_LEDS_MENF21BMC=3Dy
> > =

> > #
> > # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID=
_THINGM)
> > #
> > CONFIG_LEDS_BLINKM=3Dy
> > CONFIG_LEDS_SYSCON=3Dy
> > # CONFIG_LEDS_PM8941_WLED is not set
> > =

> > #
> > # LED Triggers
> > #
> > # CONFIG_LEDS_TRIGGERS is not set
> > # CONFIG_ACCESSIBILITY is not set
> > # CONFIG_INFINIBAND is not set
> > CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> > CONFIG_EDAC_SUPPORT=3Dy
> > CONFIG_EDAC=3Dy
> > # CONFIG_EDAC_LEGACY_SYSFS is not set
> > CONFIG_EDAC_DEBUG=3Dy
> > CONFIG_EDAC_MM_EDAC=3Dy
> > # CONFIG_EDAC_AMD76X is not set
> > # CONFIG_EDAC_E7XXX is not set
> > # CONFIG_EDAC_E752X is not set
> > # CONFIG_EDAC_I82875P is not set
> > # CONFIG_EDAC_I82975X is not set
> > # CONFIG_EDAC_I3000 is not set
> > # CONFIG_EDAC_I3200 is not set
> > # CONFIG_EDAC_IE31200 is not set
> > # CONFIG_EDAC_X38 is not set
> > # CONFIG_EDAC_I5400 is not set
> > # CONFIG_EDAC_I82860 is not set
> > # CONFIG_EDAC_R82600 is not set
> > # CONFIG_EDAC_I5000 is not set
> > # CONFIG_EDAC_I5100 is not set
> > # CONFIG_EDAC_I7300 is not set
> > CONFIG_RTC_LIB=3Dy
> > # CONFIG_RTC_CLASS is not set
> > # CONFIG_DMADEVICES is not set
> > CONFIG_AUXDISPLAY=3Dy
> > CONFIG_KS0108=3Dy
> > CONFIG_KS0108_PORT=3D0x378
> > CONFIG_KS0108_DELAY=3D2
> > # CONFIG_CFAG12864B is not set
> > CONFIG_UIO=3Dy
> > # CONFIG_UIO_CIF is not set
> > CONFIG_UIO_PDRV_GENIRQ=3Dy
> > # CONFIG_UIO_DMEM_GENIRQ is not set
> > # CONFIG_UIO_AEC is not set
> > # CONFIG_UIO_SERCOS3 is not set
> > # CONFIG_UIO_PCI_GENERIC is not set
> > # CONFIG_UIO_NETX is not set
> > CONFIG_UIO_PRUSS=3Dy
> > # CONFIG_UIO_MF624 is not set
> > # CONFIG_VIRT_DRIVERS is not set
> > CONFIG_VIRTIO=3Dy
> > =

> > #
> > # Virtio drivers
> > #
> > # CONFIG_VIRTIO_PCI is not set
> > CONFIG_VIRTIO_BALLOON=3Dy
> > # CONFIG_VIRTIO_INPUT is not set
> > CONFIG_VIRTIO_MMIO=3Dy
> > CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> > =

> > #
> > # Microsoft Hyper-V guest support
> > #
> > # CONFIG_HYPERV is not set
> > CONFIG_STAGING=3Dy
> > # CONFIG_SLICOSS is not set
> > # CONFIG_FB_OLPC_DCON is not set
> > CONFIG_PANEL=3Dy
> > CONFIG_PANEL_PARPORT=3D0
> > CONFIG_PANEL_PROFILE=3D5
> > CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> > CONFIG_PANEL_BOOT_MESSAGE=3D""
> > =

> > #
> > # IIO staging drivers
> > #
> > =

> > #
> > # Accelerometers
> > #
> > CONFIG_ADIS16201=3Dy
> > CONFIG_ADIS16203=3Dy
> > # CONFIG_ADIS16204 is not set
> > CONFIG_ADIS16209=3Dy
> > CONFIG_ADIS16220=3Dy
> > CONFIG_ADIS16240=3Dy
> > CONFIG_LIS3L02DQ=3Dy
> > CONFIG_SCA3000=3Dy
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD7606=3Dy
> > # CONFIG_AD7606_IFACE_PARALLEL is not set
> > # CONFIG_AD7606_IFACE_SPI is not set
> > CONFIG_AD7780=3Dy
> > CONFIG_AD7816=3Dy
> > CONFIG_AD7192=3Dy
> > # CONFIG_AD7280 is not set
> > =

> > #
> > # Analog digital bi-direction converters
> > #
> > # CONFIG_ADT7316 is not set
> > =

> > #
> > # Capacitance to digital converters
> > #
> > # CONFIG_AD7150 is not set
> > CONFIG_AD7152=3Dy
> > CONFIG_AD7746=3Dy
> > =

> > #
> > # Direct Digital Synthesis
> > #
> > # CONFIG_AD9832 is not set
> > CONFIG_AD9834=3Dy
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > # CONFIG_ADIS16060 is not set
> > =

> > #
> > # Network Analyzer, Impedance Converters
> > #
> > # CONFIG_AD5933 is not set
> > =

> > #
> > # Light sensors
> > #
> > # CONFIG_SENSORS_ISL29018 is not set
> > CONFIG_SENSORS_ISL29028=3Dy
> > CONFIG_TSL2583=3Dy
> > # CONFIG_TSL2x7x is not set
> > =

> > #
> > # Magnetometer sensors
> > #
> > CONFIG_SENSORS_HMC5843=3Dy
> > CONFIG_SENSORS_HMC5843_I2C=3Dy
> > CONFIG_SENSORS_HMC5843_SPI=3Dy
> > =

> > #
> > # Active energy metering IC
> > #
> > # CONFIG_ADE7753 is not set
> > CONFIG_ADE7754=3Dy
> > # CONFIG_ADE7758 is not set
> > # CONFIG_ADE7759 is not set
> > # CONFIG_ADE7854 is not set
> > =

> > #
> > # Resolver to digital converters
> > #
> > # CONFIG_AD2S90 is not set
> > CONFIG_AD2S1200=3Dy
> > CONFIG_AD2S1210=3Dy
> > =

> > #
> > # Triggers - standalone
> > #
> > # CONFIG_IIO_SIMPLE_DUMMY is not set
> > # CONFIG_FB_SM7XX is not set
> > # CONFIG_FB_SM750 is not set
> > # CONFIG_FB_XGI is not set
> > # CONFIG_FT1000 is not set
> > =

> > #
> > # Speakup console speech
> > #
> > # CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
> > CONFIG_STAGING_MEDIA=3Dy
> > =

> > #
> > # Android
> > #
> > # CONFIG_ASHMEM is not set
> > # CONFIG_ANDROID_TIMED_OUTPUT is not set
> > CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> > CONFIG_SYNC=3Dy
> > CONFIG_SW_SYNC=3Dy
> > CONFIG_SW_SYNC_USER=3Dy
> > CONFIG_ION=3Dy
> > CONFIG_ION_TEST=3Dy
> > # CONFIG_ION_DUMMY is not set
> > # CONFIG_STAGING_BOARD is not set
> > CONFIG_USB_WPAN_HCD=3Dy
> > CONFIG_WIMAX_GDM72XX=3Dy
> > # CONFIG_WIMAX_GDM72XX_QOS is not set
> > CONFIG_WIMAX_GDM72XX_K_MODE=3Dy
> > # CONFIG_WIMAX_GDM72XX_WIMAX2 is not set
> > CONFIG_WIMAX_GDM72XX_USB=3Dy
> > # CONFIG_WIMAX_GDM72XX_USB_PM is not set
> > # CONFIG_MTD_SPINAND_MT29F is not set
> > # CONFIG_DGNC is not set
> > CONFIG_DGAP=3Dy
> > # CONFIG_GS_FPGABOOT is not set
> > CONFIG_FB_TFT=3Dy
> > CONFIG_FB_TFT_AGM1264K_FL=3Dy
> > # CONFIG_FB_TFT_BD663474 is not set
> > CONFIG_FB_TFT_HX8340BN=3Dy
> > CONFIG_FB_TFT_HX8347D=3Dy
> > CONFIG_FB_TFT_HX8353D=3Dy
> > CONFIG_FB_TFT_HX8357D=3Dy
> > CONFIG_FB_TFT_ILI9163=3Dy
> > CONFIG_FB_TFT_ILI9320=3Dy
> > CONFIG_FB_TFT_ILI9325=3Dy
> > # CONFIG_FB_TFT_ILI9340 is not set
> > # CONFIG_FB_TFT_ILI9341 is not set
> > # CONFIG_FB_TFT_ILI9481 is not set
> > CONFIG_FB_TFT_ILI9486=3Dy
> > # CONFIG_FB_TFT_PCD8544 is not set
> > CONFIG_FB_TFT_RA8875=3Dy
> > # CONFIG_FB_TFT_S6D02A1 is not set
> > # CONFIG_FB_TFT_S6D1121 is not set
> > CONFIG_FB_TFT_SSD1289=3Dy
> > # CONFIG_FB_TFT_SSD1306 is not set
> > CONFIG_FB_TFT_SSD1331=3Dy
> > CONFIG_FB_TFT_SSD1351=3Dy
> > CONFIG_FB_TFT_ST7735R=3Dy
> > CONFIG_FB_TFT_TINYLCD=3Dy
> > CONFIG_FB_TFT_TLS8204=3Dy
> > CONFIG_FB_TFT_UC1701=3Dy
> > # CONFIG_FB_TFT_UPD161704 is not set
> > # CONFIG_FB_TFT_WATTEROTT is not set
> > CONFIG_FB_FLEX=3Dy
> > CONFIG_FB_TFT_FBTFT_DEVICE=3Dy
> > # CONFIG_X86_PLATFORM_DEVICES is not set
> > CONFIG_CHROME_PLATFORMS=3Dy
> > CONFIG_CHROMEOS_PSTORE=3Dy
> > CONFIG_CROS_EC_CHARDEV=3Dy
> > CONFIG_CROS_EC_LPC=3Dy
> > CONFIG_CROS_EC_PROTO=3Dy
> > =

> > #
> > # Hardware Spinlock drivers
> > #
> > =

> > #
> > # Clock Source drivers
> > #
> > CONFIG_CLKSRC_I8253=3Dy
> > CONFIG_CLKEVT_I8253=3Dy
> > CONFIG_I8253_LOCK=3Dy
> > CONFIG_CLKBLD_I8253=3Dy
> > # CONFIG_ATMEL_PIT is not set
> > # CONFIG_SH_TIMER_CMT is not set
> > # CONFIG_SH_TIMER_MTU2 is not set
> > # CONFIG_SH_TIMER_TMU is not set
> > # CONFIG_EM_TIMER_STI is not set
> > CONFIG_MAILBOX=3Dy
> > # CONFIG_PCC is not set
> > CONFIG_ALTERA_MBOX=3Dy
> > CONFIG_IOMMU_SUPPORT=3Dy
> > =

> > #
> > # Generic IOMMU Pagetable Support
> > #
> > =

> > #
> > # Remoteproc drivers
> > #
> > CONFIG_REMOTEPROC=3Dy
> > CONFIG_STE_MODEM_RPROC=3Dy
> > =

> > #
> > # Rpmsg drivers
> > #
> > =

> > #
> > # SOC (System On Chip) specific Drivers
> > #
> > # CONFIG_SUNXI_SRAM is not set
> > CONFIG_SOC_TI=3Dy
> > # CONFIG_PM_DEVFREQ is not set
> > CONFIG_EXTCON=3Dy
> > =

> > #
> > # Extcon Device Drivers
> > #
> > CONFIG_EXTCON_ADC_JACK=3Dy
> > # CONFIG_EXTCON_GPIO is not set
> > CONFIG_EXTCON_MAX14577=3Dy
> > # CONFIG_EXTCON_MAX77693 is not set
> > CONFIG_EXTCON_MAX8997=3Dy
> > CONFIG_EXTCON_PALMAS=3Dy
> > CONFIG_EXTCON_RT8973A=3Dy
> > CONFIG_EXTCON_SM5502=3Dy
> > CONFIG_EXTCON_USB_GPIO=3Dy
> > # CONFIG_MEMORY is not set
> > CONFIG_IIO=3Dy
> > CONFIG_IIO_BUFFER=3Dy
> > CONFIG_IIO_BUFFER_CB=3Dy
> > CONFIG_IIO_KFIFO_BUF=3Dy
> > CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> > CONFIG_IIO_TRIGGER=3Dy
> > CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> > =

> > #
> > # Accelerometers
> > #
> > CONFIG_BMA180=3Dy
> > CONFIG_BMC150_ACCEL=3Dy
> > CONFIG_IIO_ST_ACCEL_3AXIS=3Dy
> > CONFIG_IIO_ST_ACCEL_I2C_3AXIS=3Dy
> > CONFIG_IIO_ST_ACCEL_SPI_3AXIS=3Dy
> > CONFIG_KXSD9=3Dy
> > CONFIG_MMA8452=3Dy
> > CONFIG_KXCJK1013=3Dy
> > CONFIG_MMA9551_CORE=3Dy
> > CONFIG_MMA9551=3Dy
> > CONFIG_MMA9553=3Dy
> > CONFIG_STK8312=3Dy
> > CONFIG_STK8BA50=3Dy
> > =

> > #
> > # Analog to digital converters
> > #
> > CONFIG_AD_SIGMA_DELTA=3Dy
> > # CONFIG_AD7266 is not set
> > CONFIG_AD7291=3Dy
> > # CONFIG_AD7298 is not set
> > # CONFIG_AD7476 is not set
> > CONFIG_AD7791=3Dy
> > # CONFIG_AD7793 is not set
> > CONFIG_AD7887=3Dy
> > # CONFIG_AD7923 is not set
> > # CONFIG_AD799X is not set
> > # CONFIG_DA9150_GPADC is not set
> > # CONFIG_CC10001_ADC is not set
> > # CONFIG_LP8788_ADC is not set
> > CONFIG_MAX1027=3Dy
> > CONFIG_MAX1363=3Dy
> > # CONFIG_MCP320X is not set
> > CONFIG_MCP3422=3Dy
> > CONFIG_MEN_Z188_ADC=3Dy
> > CONFIG_NAU7802=3Dy
> > CONFIG_QCOM_SPMI_IADC=3Dy
> > CONFIG_QCOM_SPMI_VADC=3Dy
> > CONFIG_TI_ADC081C=3Dy
> > CONFIG_TI_ADC128S052=3Dy
> > CONFIG_TWL4030_MADC=3Dy
> > CONFIG_TWL6030_GPADC=3Dy
> > CONFIG_VF610_ADC=3Dy
> > # CONFIG_VIPERBOARD_ADC is not set
> > =

> > #
> > # Amplifiers
> > #
> > CONFIG_AD8366=3Dy
> > =

> > #
> > # Hid Sensor IIO Common
> > #
> > =

> > #
> > # SSP Sensor Common
> > #
> > CONFIG_IIO_SSP_SENSORS_COMMONS=3Dy
> > CONFIG_IIO_SSP_SENSORHUB=3Dy
> > CONFIG_IIO_ST_SENSORS_I2C=3Dy
> > CONFIG_IIO_ST_SENSORS_SPI=3Dy
> > CONFIG_IIO_ST_SENSORS_CORE=3Dy
> > =

> > #
> > # Digital to analog converters
> > #
> > # CONFIG_AD5064 is not set
> > # CONFIG_AD5360 is not set
> > CONFIG_AD5380=3Dy
> > CONFIG_AD5421=3Dy
> > CONFIG_AD5446=3Dy
> > # CONFIG_AD5449 is not set
> > CONFIG_AD5504=3Dy
> > # CONFIG_AD5624R_SPI is not set
> > CONFIG_AD5686=3Dy
> > CONFIG_AD5755=3Dy
> > # CONFIG_AD5764 is not set
> > CONFIG_AD5791=3Dy
> > # CONFIG_AD7303 is not set
> > # CONFIG_M62332 is not set
> > CONFIG_MAX517=3Dy
> > CONFIG_MAX5821=3Dy
> > CONFIG_MCP4725=3Dy
> > # CONFIG_MCP4922 is not set
> > =

> > #
> > # Frequency Synthesizers DDS/PLL
> > #
> > =

> > #
> > # Clock Generator/Distribution
> > #
> > CONFIG_AD9523=3Dy
> > =

> > #
> > # Phase-Locked Loop (PLL) frequency synthesizers
> > #
> > CONFIG_ADF4350=3Dy
> > =

> > #
> > # Digital gyroscope sensors
> > #
> > CONFIG_ADIS16080=3Dy
> > # CONFIG_ADIS16130 is not set
> > CONFIG_ADIS16136=3Dy
> > CONFIG_ADIS16260=3Dy
> > # CONFIG_ADXRS450 is not set
> > CONFIG_BMG160=3Dy
> > CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> > CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> > CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> > CONFIG_ITG3200=3Dy
> > =

> > #
> > # Humidity sensors
> > #
> > CONFIG_DHT11=3Dy
> > # CONFIG_SI7005 is not set
> > CONFIG_SI7020=3Dy
> > =

> > #
> > # Inertial measurement units
> > #
> > # CONFIG_ADIS16400 is not set
> > # CONFIG_ADIS16480 is not set
> > CONFIG_KMX61=3Dy
> > CONFIG_INV_MPU6050_IIO=3Dy
> > CONFIG_IIO_ADIS_LIB=3Dy
> > CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> > =

> > #
> > # Light sensors
> > #
> > # CONFIG_ACPI_ALS is not set
> > CONFIG_ADJD_S311=3Dy
> > CONFIG_AL3320A=3Dy
> > CONFIG_APDS9300=3Dy
> > CONFIG_BH1750=3Dy
> > CONFIG_CM32181=3Dy
> > # CONFIG_CM3232 is not set
> > CONFIG_CM3323=3Dy
> > # CONFIG_CM36651 is not set
> > CONFIG_GP2AP020A00F=3Dy
> > CONFIG_ISL29125=3Dy
> > # CONFIG_JSA1212 is not set
> > CONFIG_LTR501=3Dy
> > CONFIG_STK3310=3Dy
> > CONFIG_TCS3414=3Dy
> > # CONFIG_TCS3472 is not set
> > CONFIG_SENSORS_TSL2563=3Dy
> > CONFIG_TSL4531=3Dy
> > CONFIG_VCNL4000=3Dy
> > =

> > #
> > # Magnetometer sensors
> > #
> > CONFIG_AK8975=3Dy
> > # CONFIG_AK09911 is not set
> > CONFIG_MAG3110=3Dy
> > CONFIG_MMC35240=3Dy
> > # CONFIG_IIO_ST_MAGN_3AXIS is not set
> > CONFIG_BMC150_MAGN=3Dy
> > =

> > #
> > # Inclinometer sensors
> > #
> > =

> > #
> > # Triggers - standalone
> > #
> > CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> > CONFIG_IIO_SYSFS_TRIGGER=3Dy
> > =

> > #
> > # Pressure sensors
> > #
> > # CONFIG_BMP280 is not set
> > CONFIG_MPL115=3Dy
> > CONFIG_MPL3115=3Dy
> > CONFIG_MS5611=3Dy
> > # CONFIG_MS5611_I2C is not set
> > CONFIG_MS5611_SPI=3Dy
> > CONFIG_IIO_ST_PRESS=3Dy
> > CONFIG_IIO_ST_PRESS_I2C=3Dy
> > CONFIG_IIO_ST_PRESS_SPI=3Dy
> > CONFIG_T5403=3Dy
> > =

> > #
> > # Lightning sensors
> > #
> > CONFIG_AS3935=3Dy
> > =

> > #
> > # Proximity sensors
> > #
> > CONFIG_SX9500=3Dy
> > =

> > #
> > # Temperature sensors
> > #
> > CONFIG_MLX90614=3Dy
> > CONFIG_TMP006=3Dy
> > # CONFIG_NTB is not set
> > # CONFIG_VME_BUS is not set
> > CONFIG_PWM=3Dy
> > CONFIG_PWM_SYSFS=3Dy
> > CONFIG_PWM_FSL_FTM=3Dy
> > # CONFIG_PWM_LP3943 is not set
> > CONFIG_PWM_LPSS=3Dy
> > # CONFIG_PWM_LPSS_PCI is not set
> > # CONFIG_PWM_LPSS_PLATFORM is not set
> > # CONFIG_PWM_PCA9685 is not set
> > # CONFIG_PWM_TWL is not set
> > CONFIG_PWM_TWL_LED=3Dy
> > CONFIG_IRQCHIP=3Dy
> > CONFIG_IPACK_BUS=3Dy
> > # CONFIG_BOARD_TPCI200 is not set
> > CONFIG_SERIAL_IPOCTAL=3Dy
> > # CONFIG_RESET_CONTROLLER is not set
> > # CONFIG_FMC is not set
> > =

> > #
> > # PHY Subsystem
> > #
> > CONFIG_GENERIC_PHY=3Dy
> > CONFIG_PHY_PXA_28NM_HSIC=3Dy
> > CONFIG_PHY_PXA_28NM_USB2=3Dy
> > # CONFIG_BCM_KONA_USB2_PHY is not set
> > # CONFIG_PHY_SAMSUNG_USB2 is not set
> > CONFIG_PHY_TUSB1210=3Dy
> > CONFIG_POWERCAP=3Dy
> > CONFIG_INTEL_RAPL=3Dy
> > CONFIG_MCB=3Dy
> > # CONFIG_MCB_PCI is not set
> > CONFIG_RAS=3Dy
> > # CONFIG_THUNDERBOLT is not set
> > =

> > #
> > # Android
> > #
> > CONFIG_ANDROID=3Dy
> > # CONFIG_ANDROID_BINDER_IPC is not set
> > =

> > #
> > # Firmware Drivers
> > #
> > CONFIG_EDD=3Dy
> > CONFIG_EDD_OFF=3Dy
> > CONFIG_FIRMWARE_MEMMAP=3Dy
> > CONFIG_DELL_RBU=3Dy
> > CONFIG_DCDBAS=3Dy
> > # CONFIG_ISCSI_IBFT_FIND is not set
> > # CONFIG_GOOGLE_FIRMWARE is not set
> > =

> > #
> > # File systems
> > #
> > CONFIG_DCACHE_WORD_ACCESS=3Dy
> > CONFIG_FS_POSIX_ACL=3Dy
> > CONFIG_EXPORTFS=3Dy
> > CONFIG_FILE_LOCKING=3Dy
> > CONFIG_FSNOTIFY=3Dy
> > CONFIG_DNOTIFY=3Dy
> > CONFIG_INOTIFY_USER=3Dy
> > # CONFIG_FANOTIFY is not set
> > CONFIG_QUOTA=3Dy
> > CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> > # CONFIG_PRINT_QUOTA_WARNING is not set
> > CONFIG_QUOTA_DEBUG=3Dy
> > CONFIG_QUOTA_TREE=3Dy
> > CONFIG_QFMT_V1=3Dy
> > CONFIG_QFMT_V2=3Dy
> > CONFIG_QUOTACTL=3Dy
> > # CONFIG_AUTOFS4_FS is not set
> > # CONFIG_FUSE_FS is not set
> > # CONFIG_OVERLAY_FS is not set
> > =

> > #
> > # Caches
> > #
> > # CONFIG_FSCACHE is not set
> > =

> > #
> > # Pseudo filesystems
> > #
> > CONFIG_PROC_FS=3Dy
> > # CONFIG_PROC_KCORE is not set
> > CONFIG_PROC_SYSCTL=3Dy
> > CONFIG_PROC_PAGE_MONITOR=3Dy
> > CONFIG_PROC_CHILDREN=3Dy
> > CONFIG_KERNFS=3Dy
> > CONFIG_SYSFS=3Dy
> > CONFIG_TMPFS=3Dy
> > CONFIG_TMPFS_POSIX_ACL=3Dy
> > CONFIG_TMPFS_XATTR=3Dy
> > # CONFIG_HUGETLBFS is not set
> > # CONFIG_HUGETLB_PAGE is not set
> > CONFIG_CONFIGFS_FS=3Dy
> > CONFIG_MISC_FILESYSTEMS=3Dy
> > # CONFIG_ECRYPT_FS is not set
> > CONFIG_JFFS2_FS=3Dy
> > CONFIG_JFFS2_FS_DEBUG=3D0
> > # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> > CONFIG_JFFS2_SUMMARY=3Dy
> > # CONFIG_JFFS2_FS_XATTR is not set
> > # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> > CONFIG_JFFS2_ZLIB=3Dy
> > # CONFIG_JFFS2_LZO is not set
> > CONFIG_JFFS2_RTIME=3Dy
> > # CONFIG_JFFS2_RUBIN is not set
> > # CONFIG_LOGFS is not set
> > CONFIG_ROMFS_FS=3Dy
> > CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> > CONFIG_ROMFS_ON_MTD=3Dy
> > # CONFIG_PSTORE is not set
> > # CONFIG_NETWORK_FILESYSTEMS is not set
> > CONFIG_NLS=3Dy
> > CONFIG_NLS_DEFAULT=3D"iso8859-1"
> > CONFIG_NLS_CODEPAGE_437=3Dy
> > CONFIG_NLS_CODEPAGE_737=3Dy
> > CONFIG_NLS_CODEPAGE_775=3Dy
> > CONFIG_NLS_CODEPAGE_850=3Dy
> > # CONFIG_NLS_CODEPAGE_852 is not set
> > CONFIG_NLS_CODEPAGE_855=3Dy
> > # CONFIG_NLS_CODEPAGE_857 is not set
> > CONFIG_NLS_CODEPAGE_860=3Dy
> > CONFIG_NLS_CODEPAGE_861=3Dy
> > CONFIG_NLS_CODEPAGE_862=3Dy
> > CONFIG_NLS_CODEPAGE_863=3Dy
> > CONFIG_NLS_CODEPAGE_864=3Dy
> > # CONFIG_NLS_CODEPAGE_865 is not set
> > # CONFIG_NLS_CODEPAGE_866 is not set
> > CONFIG_NLS_CODEPAGE_869=3Dy
> > CONFIG_NLS_CODEPAGE_936=3Dy
> > CONFIG_NLS_CODEPAGE_950=3Dy
> > CONFIG_NLS_CODEPAGE_932=3Dy
> > CONFIG_NLS_CODEPAGE_949=3Dy
> > CONFIG_NLS_CODEPAGE_874=3Dy
> > # CONFIG_NLS_ISO8859_8 is not set
> > CONFIG_NLS_CODEPAGE_1250=3Dy
> > CONFIG_NLS_CODEPAGE_1251=3Dy
> > CONFIG_NLS_ASCII=3Dy
> > CONFIG_NLS_ISO8859_1=3Dy
> > CONFIG_NLS_ISO8859_2=3Dy
> > # CONFIG_NLS_ISO8859_3 is not set
> > CONFIG_NLS_ISO8859_4=3Dy
> > CONFIG_NLS_ISO8859_5=3Dy
> > CONFIG_NLS_ISO8859_6=3Dy
> > # CONFIG_NLS_ISO8859_7 is not set
> > CONFIG_NLS_ISO8859_9=3Dy
> > CONFIG_NLS_ISO8859_13=3Dy
> > CONFIG_NLS_ISO8859_14=3Dy
> > # CONFIG_NLS_ISO8859_15 is not set
> > CONFIG_NLS_KOI8_R=3Dy
> > CONFIG_NLS_KOI8_U=3Dy
> > CONFIG_NLS_MAC_ROMAN=3Dy
> > CONFIG_NLS_MAC_CELTIC=3Dy
> > CONFIG_NLS_MAC_CENTEURO=3Dy
> > # CONFIG_NLS_MAC_CROATIAN is not set
> > CONFIG_NLS_MAC_CYRILLIC=3Dy
> > CONFIG_NLS_MAC_GAELIC=3Dy
> > CONFIG_NLS_MAC_GREEK=3Dy
> > # CONFIG_NLS_MAC_ICELAND is not set
> > CONFIG_NLS_MAC_INUIT=3Dy
> > CONFIG_NLS_MAC_ROMANIAN=3Dy
> > CONFIG_NLS_MAC_TURKISH=3Dy
> > CONFIG_NLS_UTF8=3Dy
> > # CONFIG_DLM is not set
> > =

> > #
> > # Kernel hacking
> > #
> > CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> > =

> > #
> > # printk and dmesg options
> > #
> > CONFIG_PRINTK_TIME=3Dy
> > CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> > # CONFIG_BOOT_PRINTK_DELAY is not set
> > # CONFIG_DYNAMIC_DEBUG is not set
> > =

> > #
> > # Compile-time checks and compiler options
> > #
> > # CONFIG_DEBUG_INFO is not set
> > CONFIG_ENABLE_WARN_DEPRECATED=3Dy
> > # CONFIG_ENABLE_MUST_CHECK is not set
> > CONFIG_FRAME_WARN=3D1024
> > CONFIG_STRIP_ASM_SYMS=3Dy
> > # CONFIG_READABLE_ASM is not set
> > CONFIG_UNUSED_SYMBOLS=3Dy
> > CONFIG_PAGE_OWNER=3Dy
> > CONFIG_DEBUG_FS=3Dy
> > CONFIG_HEADERS_CHECK=3Dy
> > # CONFIG_DEBUG_SECTION_MISMATCH is not set
> > CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> > CONFIG_FRAME_POINTER=3Dy
> > CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> > # CONFIG_MAGIC_SYSRQ is not set
> > CONFIG_DEBUG_KERNEL=3Dy
> > =

> > #
> > # Memory Debugging
> > #
> > CONFIG_PAGE_EXTENSION=3Dy
> > # CONFIG_DEBUG_PAGEALLOC is not set
> > # CONFIG_DEBUG_OBJECTS is not set
> > CONFIG_SLUB_STATS=3Dy
> > CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> > # CONFIG_DEBUG_KMEMLEAK is not set
> > # CONFIG_DEBUG_STACK_USAGE is not set
> > CONFIG_DEBUG_VM=3Dy
> > CONFIG_DEBUG_VM_VMACACHE=3Dy
> > CONFIG_DEBUG_VM_RB=3Dy
> > # CONFIG_DEBUG_VIRTUAL is not set
> > # CONFIG_DEBUG_MEMORY_INIT is not set
> > CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_DEBUG_STACKOVERFLOW=3Dy
> > CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> > # CONFIG_KMEMCHECK is not set
> > # CONFIG_DEBUG_SHIRQ is not set
> > =

> > #
> > # Debug Lockups and Hangs
> > #
> > CONFIG_LOCKUP_DETECTOR=3Dy
> > CONFIG_HARDLOCKUP_DETECTOR=3Dy
> > # CONFIG_BOOTPARAM_HARDLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D0
> > # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> > CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> > # CONFIG_DETECT_HUNG_TASK is not set
> > CONFIG_PANIC_ON_OOPS=3Dy
> > CONFIG_PANIC_ON_OOPS_VALUE=3D1
> > CONFIG_PANIC_TIMEOUT=3D0
> > CONFIG_SCHED_DEBUG=3Dy
> > CONFIG_SCHED_INFO=3Dy
> > # CONFIG_SCHEDSTATS is not set
> > # CONFIG_SCHED_STACK_END_CHECK is not set
> > # CONFIG_DEBUG_TIMEKEEPING is not set
> > # CONFIG_TIMER_STATS is not set
> > =

> > #
> > # Lock Debugging (spinlocks, mutexes, etc...)
> > #
> > # CONFIG_DEBUG_RT_MUTEXES is not set
> > CONFIG_DEBUG_SPINLOCK=3Dy
> > CONFIG_DEBUG_MUTEXES=3Dy
> > CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> > CONFIG_DEBUG_LOCK_ALLOC=3Dy
> > # CONFIG_PROVE_LOCKING is not set
> > CONFIG_LOCKDEP=3Dy
> > # CONFIG_LOCK_STAT is not set
> > CONFIG_DEBUG_LOCKDEP=3Dy
> > CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> > # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> > CONFIG_LOCK_TORTURE_TEST=3Dy
> > CONFIG_STACKTRACE=3Dy
> > # CONFIG_DEBUG_KOBJECT is not set
> > CONFIG_DEBUG_BUGVERBOSE=3Dy
> > # CONFIG_DEBUG_LIST is not set
> > # CONFIG_DEBUG_PI_LIST is not set
> > # CONFIG_DEBUG_SG is not set
> > CONFIG_DEBUG_NOTIFIERS=3Dy
> > # CONFIG_DEBUG_CREDENTIALS is not set
> > =

> > #
> > # RCU Debugging
> > #
> > # CONFIG_PROVE_RCU is not set
> > CONFIG_SPARSE_RCU_POINTER=3Dy
> > CONFIG_TORTURE_TEST=3Dy
> > # CONFIG_RCU_TORTURE_TEST is not set
> > CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> > CONFIG_RCU_TRACE=3Dy
> > CONFIG_RCU_EQS_DEBUG=3Dy
> > CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> > CONFIG_PM_NOTIFIER_ERROR_INJECT=3Dy
> > # CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
> > # CONFIG_FAULT_INJECTION is not set
> > # CONFIG_LATENCYTOP is not set
> > CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> > # CONFIG_DEBUG_STRICT_USER_COPY_CHECKS is not set
> > CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> > CONFIG_HAVE_FUNCTION_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> > CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> > CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> > CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> > CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> > CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> > CONFIG_TRACE_CLOCK=3Dy
> > CONFIG_TRACING_SUPPORT=3Dy
> > # CONFIG_FTRACE is not set
> > =

> > #
> > # Runtime Testing
> > #
> > CONFIG_TEST_LIST_SORT=3Dy
> > # CONFIG_BACKTRACE_SELF_TEST is not set
> > CONFIG_RBTREE_TEST=3Dy
> > # CONFIG_ATOMIC64_SELFTEST is not set
> > CONFIG_TEST_HEXDUMP=3Dy
> > CONFIG_TEST_STRING_HELPERS=3Dy
> > CONFIG_TEST_KSTRTOX=3Dy
> > CONFIG_TEST_RHASHTABLE=3Dy
> > # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> > CONFIG_BUILD_DOCSRC=3Dy
> > # CONFIG_DMA_API_DEBUG is not set
> > CONFIG_TEST_FIRMWARE=3Dy
> > CONFIG_TEST_UDELAY=3Dy
> > # CONFIG_MEMTEST is not set
> > # CONFIG_SAMPLES is not set
> > CONFIG_HAVE_ARCH_KGDB=3Dy
> > # CONFIG_KGDB is not set
> > CONFIG_STRICT_DEVMEM=3Dy
> > CONFIG_X86_VERBOSE_BOOTUP=3Dy
> > # CONFIG_EARLY_PRINTK is not set
> > # CONFIG_X86_PTDUMP is not set
> > # CONFIG_DEBUG_RODATA is not set
> > # CONFIG_DOUBLEFAULT is not set
> > # CONFIG_DEBUG_TLBFLUSH is not set
> > CONFIG_IOMMU_STRESS=3Dy
> > CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> > CONFIG_IO_DELAY_TYPE_0X80=3D0
> > CONFIG_IO_DELAY_TYPE_0XED=3D1
> > CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> > CONFIG_IO_DELAY_TYPE_NONE=3D3
> > # CONFIG_IO_DELAY_0X80 is not set
> > CONFIG_IO_DELAY_0XED=3Dy
> > # CONFIG_IO_DELAY_UDELAY is not set
> > # CONFIG_IO_DELAY_NONE is not set
> > CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
> > CONFIG_DEBUG_BOOT_PARAMS=3Dy
> > # CONFIG_CPA_DEBUG is not set
> > CONFIG_OPTIMIZE_INLINING=3Dy
> > CONFIG_DEBUG_NMI_SELFTEST=3Dy
> > # CONFIG_X86_DEBUG_STATIC_CPU_HAS is not set
> > CONFIG_X86_DEBUG_FPU=3Dy
> > CONFIG_PUNIT_ATOM_DEBUG=3Dy
> > =

> > #
> > # Security options
> > #
> > CONFIG_KEYS=3Dy
> > # CONFIG_PERSISTENT_KEYRINGS is not set
> > # CONFIG_BIG_KEYS is not set
> > CONFIG_TRUSTED_KEYS=3Dy
> > # CONFIG_ENCRYPTED_KEYS is not set
> > CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> > # CONFIG_SECURITY is not set
> > CONFIG_SECURITYFS=3Dy
> > CONFIG_DEFAULT_SECURITY_DAC=3Dy
> > CONFIG_DEFAULT_SECURITY=3D""
> > CONFIG_CRYPTO=3Dy
> > =

> > #
> > # Crypto core or helper
> > #
> > CONFIG_CRYPTO_ALGAPI=3Dy
> > CONFIG_CRYPTO_ALGAPI2=3Dy
> > CONFIG_CRYPTO_AEAD=3Dy
> > CONFIG_CRYPTO_AEAD2=3Dy
> > CONFIG_CRYPTO_BLKCIPHER=3Dy
> > CONFIG_CRYPTO_BLKCIPHER2=3Dy
> > CONFIG_CRYPTO_HASH=3Dy
> > CONFIG_CRYPTO_HASH2=3Dy
> > CONFIG_CRYPTO_RNG=3Dy
> > CONFIG_CRYPTO_RNG2=3Dy
> > CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> > CONFIG_CRYPTO_PCOMP=3Dy
> > CONFIG_CRYPTO_PCOMP2=3Dy
> > CONFIG_CRYPTO_AKCIPHER2=3Dy
> > CONFIG_CRYPTO_AKCIPHER=3Dy
> > CONFIG_CRYPTO_RSA=3Dy
> > CONFIG_CRYPTO_MANAGER=3Dy
> > CONFIG_CRYPTO_MANAGER2=3Dy
> > CONFIG_CRYPTO_USER=3Dy
> > CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> > CONFIG_CRYPTO_GF128MUL=3Dy
> > CONFIG_CRYPTO_NULL=3Dy
> > CONFIG_CRYPTO_WORKQUEUE=3Dy
> > CONFIG_CRYPTO_CRYPTD=3Dy
> > CONFIG_CRYPTO_MCRYPTD=3Dy
> > CONFIG_CRYPTO_AUTHENC=3Dy
> > CONFIG_CRYPTO_ABLK_HELPER=3Dy
> > CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> > =

> > #
> > # Authenticated Encryption with Associated Data
> > #
> > CONFIG_CRYPTO_CCM=3Dy
> > CONFIG_CRYPTO_GCM=3Dy
> > CONFIG_CRYPTO_CHACHA20POLY1305=3Dy
> > CONFIG_CRYPTO_SEQIV=3Dy
> > CONFIG_CRYPTO_ECHAINIV=3Dy
> > =

> > #
> > # Block modes
> > #
> > CONFIG_CRYPTO_CBC=3Dy
> > CONFIG_CRYPTO_CTR=3Dy
> > CONFIG_CRYPTO_CTS=3Dy
> > CONFIG_CRYPTO_ECB=3Dy
> > CONFIG_CRYPTO_LRW=3Dy
> > CONFIG_CRYPTO_PCBC=3Dy
> > CONFIG_CRYPTO_XTS=3Dy
> > =

> > #
> > # Hash modes
> > #
> > CONFIG_CRYPTO_CMAC=3Dy
> > CONFIG_CRYPTO_HMAC=3Dy
> > CONFIG_CRYPTO_XCBC=3Dy
> > # CONFIG_CRYPTO_VMAC is not set
> > =

> > #
> > # Digest
> > #
> > CONFIG_CRYPTO_CRC32C=3Dy
> > CONFIG_CRYPTO_CRC32C_INTEL=3Dy
> > CONFIG_CRYPTO_CRC32=3Dy
> > CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> > CONFIG_CRYPTO_CRCT10DIF=3Dy
> > CONFIG_CRYPTO_GHASH=3Dy
> > CONFIG_CRYPTO_POLY1305=3Dy
> > # CONFIG_CRYPTO_MD4 is not set
> > CONFIG_CRYPTO_MD5=3Dy
> > # CONFIG_CRYPTO_MICHAEL_MIC is not set
> > CONFIG_CRYPTO_RMD128=3Dy
> > CONFIG_CRYPTO_RMD160=3Dy
> > # CONFIG_CRYPTO_RMD256 is not set
> > CONFIG_CRYPTO_RMD320=3Dy
> > CONFIG_CRYPTO_SHA1=3Dy
> > CONFIG_CRYPTO_SHA256=3Dy
> > CONFIG_CRYPTO_SHA512=3Dy
> > CONFIG_CRYPTO_TGR192=3Dy
> > CONFIG_CRYPTO_WP512=3Dy
> > =

> > #
> > # Ciphers
> > #
> > CONFIG_CRYPTO_AES=3Dy
> > CONFIG_CRYPTO_AES_586=3Dy
> > # CONFIG_CRYPTO_AES_NI_INTEL is not set
> > # CONFIG_CRYPTO_ANUBIS is not set
> > # CONFIG_CRYPTO_ARC4 is not set
> > # CONFIG_CRYPTO_BLOWFISH is not set
> > CONFIG_CRYPTO_CAMELLIA=3Dy
> > CONFIG_CRYPTO_CAST_COMMON=3Dy
> > CONFIG_CRYPTO_CAST5=3Dy
> > CONFIG_CRYPTO_CAST6=3Dy
> > CONFIG_CRYPTO_DES=3Dy
> > CONFIG_CRYPTO_FCRYPT=3Dy
> > CONFIG_CRYPTO_KHAZAD=3Dy
> > CONFIG_CRYPTO_SALSA20=3Dy
> > # CONFIG_CRYPTO_SALSA20_586 is not set
> > CONFIG_CRYPTO_CHACHA20=3Dy
> > # CONFIG_CRYPTO_SEED is not set
> > CONFIG_CRYPTO_SERPENT=3Dy
> > CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> > CONFIG_CRYPTO_TEA=3Dy
> > # CONFIG_CRYPTO_TWOFISH is not set
> > # CONFIG_CRYPTO_TWOFISH_586 is not set
> > =

> > #
> > # Compression
> > #
> > CONFIG_CRYPTO_DEFLATE=3Dy
> > CONFIG_CRYPTO_ZLIB=3Dy
> > CONFIG_CRYPTO_LZO=3Dy
> > CONFIG_CRYPTO_842=3Dy
> > CONFIG_CRYPTO_LZ4=3Dy
> > CONFIG_CRYPTO_LZ4HC=3Dy
> > =

> > #
> > # Random Number Generation
> > #
> > CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> > CONFIG_CRYPTO_DRBG_MENU=3Dy
> > CONFIG_CRYPTO_DRBG_HMAC=3Dy
> > # CONFIG_CRYPTO_DRBG_HASH is not set
> > # CONFIG_CRYPTO_DRBG_CTR is not set
> > CONFIG_CRYPTO_DRBG=3Dy
> > CONFIG_CRYPTO_JITTERENTROPY=3Dy
> > CONFIG_CRYPTO_USER_API=3Dy
> > CONFIG_CRYPTO_USER_API_HASH=3Dy
> > CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> > # CONFIG_CRYPTO_USER_API_RNG is not set
> > # CONFIG_CRYPTO_USER_API_AEAD is not set
> > CONFIG_CRYPTO_HASH_INFO=3Dy
> > CONFIG_CRYPTO_HW=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> > CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dy
> > # CONFIG_CRYPTO_DEV_GEODE is not set
> > # CONFIG_CRYPTO_DEV_HIFN_795X is not set
> > # CONFIG_CRYPTO_DEV_CCP is not set
> > # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> > CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> > CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> > CONFIG_X509_CERTIFICATE_PARSER=3Dy
> > CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> > CONFIG_PKCS7_TEST_KEY=3Dy
> > # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> > CONFIG_HAVE_KVM=3Dy
> > CONFIG_HAVE_KVM_IRQCHIP=3Dy
> > CONFIG_HAVE_KVM_IRQFD=3Dy
> > CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> > CONFIG_HAVE_KVM_EVENTFD=3Dy
> > CONFIG_KVM_APIC_ARCHITECTURE=3Dy
> > CONFIG_KVM_MMIO=3Dy
> > CONFIG_KVM_ASYNC_PF=3Dy
> > CONFIG_HAVE_KVM_MSI=3Dy
> > CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> > CONFIG_KVM_VFIO=3Dy
> > CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> > CONFIG_VIRTUALIZATION=3Dy
> > CONFIG_KVM=3Dy
> > # CONFIG_KVM_INTEL is not set
> > CONFIG_KVM_AMD=3Dy
> > # CONFIG_LGUEST is not set
> > # CONFIG_BINARY_PRINTF is not set
> > =

> > #
> > # Library routines
> > #
> > CONFIG_BITREVERSE=3Dy
> > # CONFIG_HAVE_ARCH_BITREVERSE is not set
> > CONFIG_RATIONAL=3Dy
> > CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> > CONFIG_GENERIC_STRNLEN_USER=3Dy
> > CONFIG_GENERIC_NET_UTILS=3Dy
> > CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> > CONFIG_GENERIC_PCI_IOMAP=3Dy
> > CONFIG_GENERIC_IOMAP=3Dy
> > CONFIG_GENERIC_IO=3Dy
> > CONFIG_PERCPU_RWSEM=3Dy
> > CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> > CONFIG_CRC_CCITT=3Dy
> > CONFIG_CRC16=3Dy
> > CONFIG_CRC_T10DIF=3Dy
> > CONFIG_CRC_ITU_T=3Dy
> > CONFIG_CRC32=3Dy
> > CONFIG_CRC32_SELFTEST=3Dy
> > # CONFIG_CRC32_SLICEBY8 is not set
> > # CONFIG_CRC32_SLICEBY4 is not set
> > CONFIG_CRC32_SARWATE=3Dy
> > # CONFIG_CRC32_BIT is not set
> > CONFIG_CRC7=3Dy
> > CONFIG_LIBCRC32C=3Dy
> > # CONFIG_CRC8 is not set
> > # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> > CONFIG_RANDOM32_SELFTEST=3Dy
> > CONFIG_842_COMPRESS=3Dy
> > CONFIG_842_DECOMPRESS=3Dy
> > CONFIG_ZLIB_INFLATE=3Dy
> > CONFIG_ZLIB_DEFLATE=3Dy
> > CONFIG_LZO_COMPRESS=3Dy
> > CONFIG_LZO_DECOMPRESS=3Dy
> > CONFIG_LZ4_COMPRESS=3Dy
> > CONFIG_LZ4HC_COMPRESS=3Dy
> > CONFIG_LZ4_DECOMPRESS=3Dy
> > # CONFIG_XZ_DEC is not set
> > # CONFIG_XZ_DEC_BCJ is not set
> > CONFIG_DECOMPRESS_GZIP=3Dy
> > CONFIG_DECOMPRESS_LZMA=3Dy
> > CONFIG_DECOMPRESS_LZO=3Dy
> > CONFIG_GENERIC_ALLOCATOR=3Dy
> > CONFIG_BCH=3Dy
> > CONFIG_ASSOCIATIVE_ARRAY=3Dy
> > CONFIG_HAS_IOMEM=3Dy
> > CONFIG_HAS_IOPORT_MAP=3Dy
> > CONFIG_HAS_DMA=3Dy
> > CONFIG_DQL=3Dy
> > CONFIG_NLATTR=3Dy
> > CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> > # CONFIG_AVERAGE is not set
> > CONFIG_CLZ_TAB=3Dy
> > CONFIG_CORDIC=3Dy
> > # CONFIG_DDR is not set
> > CONFIG_MPILIB=3Dy
> > CONFIG_LIBFDT=3Dy
> > CONFIG_OID_REGISTRY=3Dy
> > CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> > CONFIG_ARCH_HAS_PMEM_API=3Dy
> =

> ------------------------------------------------------------------------
> =

> commit 5f6a140f30b4296ac6ef2dd275ed513c27180fbe
> Author: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> Date:   Sat Aug 29 14:46:29 2015 -0700
> =

>     locktorture: Add torture tests for percpu_rwsem
>     =

>     This commit adds percpu_rwsem tests based on the earlier rwsem tests.
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>     Cc: Oleg Nesterov <oleg@redhat.com>
>     Cc: Davidlohr Bueso <dave@stgolabs.net>
> =

> diff --git a/kernel/locking/locktorture.c b/kernel/locking/locktorture.c
> index e1ca7a2fae91..8545e12598ce 100644
> --- a/kernel/locking/locktorture.c
> +++ b/kernel/locking/locktorture.c
> @@ -36,6 +36,7 @@
>  #include <linux/moduleparam.h>
>  #include <linux/delay.h>
>  #include <linux/slab.h>
> +#include <linux/percpu-rwsem.h>
>  #include <linux/torture.h>
>  =

>  MODULE_LICENSE("GPL");
> @@ -526,6 +527,48 @@ static struct lock_torture_ops rwsem_lock_ops =3D {
>  	.name		=3D "rwsem_lock"
>  };
>  =

> +#include <linux/percpu-rwsem.h>
> +static struct percpu_rw_semaphore pcpu_rwsem;
> +
> +void torture_percpu_rwsem_init(void)
> +{
> +	BUG_ON(percpu_init_rwsem(&pcpu_rwsem));
> +}
> +
> +static int torture_percpu_rwsem_down_write(void) __acquires(pcpu_rwsem)
> +{
> +	percpu_down_write(&pcpu_rwsem);
> +	return 0;
> +}
> +
> +static void torture_percpu_rwsem_up_write(void) __releases(pcpu_rwsem)
> +{
> +	percpu_up_write(&pcpu_rwsem);
> +}
> +
> +static int torture_percpu_rwsem_down_read(void) __acquires(pcpu_rwsem)
> +{
> +	percpu_down_read(&pcpu_rwsem);
> +	return 0;
> +}
> +
> +static void torture_percpu_rwsem_up_read(void) __releases(pcpu_rwsem)
> +{
> +	percpu_up_read(&pcpu_rwsem);
> +}
> +
> +static struct lock_torture_ops percpu_rwsem_lock_ops =3D {
> +	.init		=3D torture_percpu_rwsem_init,
> +	.writelock	=3D torture_percpu_rwsem_down_write,
> +	.write_delay	=3D torture_rwsem_write_delay,
> +	.task_boost     =3D torture_boost_dummy,
> +	.writeunlock	=3D torture_percpu_rwsem_up_write,
> +	.readlock       =3D torture_percpu_rwsem_down_read,
> +	.read_delay     =3D torture_rwsem_read_delay,
> +	.readunlock     =3D torture_percpu_rwsem_up_read,
> +	.name		=3D "percpu_rwsem_lock"
> +};
> +
>  /*
>   * Lock torture writer kthread.  Repeatedly acquires and releases
>   * the lock, checking for duplicate acquisitions.
> @@ -749,6 +792,7 @@ static int __init lock_torture_init(void)
>  		&rtmutex_lock_ops,
>  #endif
>  		&rwsem_lock_ops,
> +		&percpu_rwsem_lock_ops,
>  	};
>  =

>  	if (!torture_init_begin(torture_type, verbose, &torture_runnable))
> diff --git a/tools/testing/selftests/rcutorture/configs/lock/CFLIST b/too=
ls/testing/selftests/rcutorture/configs/lock/CFLIST
> index 6ed32794eaa1..b9611c523723 100644
> --- a/tools/testing/selftests/rcutorture/configs/lock/CFLIST
> +++ b/tools/testing/selftests/rcutorture/configs/lock/CFLIST
> @@ -3,3 +3,4 @@ LOCK02
>  LOCK03
>  LOCK04
>  LOCK05
> +LOCK06
> diff --git a/tools/testing/selftests/rcutorture/configs/lock/LOCK06 b/too=
ls/testing/selftests/rcutorture/configs/lock/LOCK06
> new file mode 100644
> index 000000000000..1d1da1477fc3
> --- /dev/null
> +++ b/tools/testing/selftests/rcutorture/configs/lock/LOCK06
> @@ -0,0 +1,6 @@
> +CONFIG_SMP=3Dy
> +CONFIG_NR_CPUS=3D4
> +CONFIG_HOTPLUG_CPU=3Dy
> +CONFIG_PREEMPT_NONE=3Dn
> +CONFIG_PREEMPT_VOLUNTARY=3Dn
> +CONFIG_PREEMPT=3Dy
> diff --git a/tools/testing/selftests/rcutorture/configs/lock/LOCK06.boot =
b/tools/testing/selftests/rcutorture/configs/lock/LOCK06.boot
> new file mode 100644
> index 000000000000..f92219cd4ad9
> --- /dev/null
> +++ b/tools/testing/selftests/rcutorture/configs/lock/LOCK06.boot
> @@ -0,0 +1 @@
> +locktorture.torture_type=3Dpercpu_rwsem_lock

--===============2313407123748184700==--

