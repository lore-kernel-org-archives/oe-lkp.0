Content-Type: multipart/mixed; boundary="===============4718657999075685443=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] [ 0.081483] [ INFO: suspicious RCU usage. ]
Date: Tue, 17 Feb 2015 22:32:15 -0800
Message-ID: <20150218063215.GA5745@linux.vnet.ibm.com>
In-Reply-To: <20150218033623.GA12562@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4718657999075685443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2015 at 11:36:23AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/d=
ev
> =

> commit 4da4e28818f5017c96f0fde72d643e965ac78253
> Author:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> AuthorDate: Mon Feb 16 17:20:57 2015 -0800
> Commit:     Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> CommitDate: Mon Feb 16 17:20:57 2015 -0800
> =

>     Squash with 287f7a10372c (rcu: Process offlining and onlining only at=
 grace-period start)
>     =

>     ->oflmask and ->onlmask replaced by ->qsmaskinitnext
>     =

>     Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

Bad commit, fixed by current rcu/dev.

							Thanx, Paul

> +----------------------------------------------------------------+-------=
-----+------------+------------+
> |                                                                | 414341=
d2c2 | 4da4e28818 | 4da4e28818 |
> +----------------------------------------------------------------+-------=
-----+------------+------------+
> | boot_successes                                                 | 60    =
     | 0          | 0          |
> | boot_failures                                                  | 0     =
     | 12         | 12         |
> | INFO:suspicious_RCU_usage                                      | 0     =
     | 12         | 12         |
> | RCU_used_illegally_from_offline_CPU                            | 0     =
     | 12         | 12         |
> | WARNING:at_kernel/rcu/tree_plugin.h:#rcu_note_context_switch() | 0     =
     | 12         | 12         |
> | backtrace:kthread_create_on_node                               | 0     =
     | 2          | 2          |
> | backtrace:kernel_init_freeable                                 | 0     =
     | 3          | 3          |
> | backtrace:build_sched_domains                                  | 0     =
     | 2          | 2          |
> | backtrace:sched_init_smp                                       | 0     =
     | 2          | 2          |
> | backtrace:do_fork                                              | 0     =
     | 10         | 10         |
> | backtrace:kthreadd                                             | 0     =
     | 10         | 10         |
> | backtrace:kill_pid_info                                        | 0     =
     | 7          | 7          |
> | backtrace:SyS_kill                                             | 0     =
     | 7          | 7          |
> | backtrace:populate_rootfs                                      | 0     =
     | 1          | 1          |
> +----------------------------------------------------------------+-------=
-----+------------+------------+
> =

> [    0.080336] =

> [    0.080669] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.080669] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.081483] [ INFO: suspicious RCU usage. ]
> [    0.081483] [ INFO: suspicious RCU usage. ]
> [    0.082283] 3.19.0-rc1-00098-g4da4e28 #79 Not tainted
> [    0.082283] 3.19.0-rc1-00098-g4da4e28 #79 Not tainted
> [    0.083267] -------------------------------
> [    0.083267] -------------------------------
> [    0.084068] kernel/sched/fair.c:4737 suspicious rcu_dereference_check(=
) usage!
> [    0.084068] kernel/sched/fair.c:4737 suspicious rcu_dereference_check(=
) usage!
> [    0.085733]
> [    0.085733] other info that might help us debug this:
> [    0.085733]
> [    0.085733]
> [    0.085733] other info that might help us debug this:
> [    0.085733]
> [    0.087275]
> [    0.087275] RCU used illegally from offline CPU!
> [    0.087275] rcu_scheduler_active =3D 1, debug_locks =3D 0      =

> [    0.087275]
> [    0.087275] RCU used illegally from offline CPU!
> [    0.087275] rcu_scheduler_active =3D 1, debug_locks =3D 0
> [    0.089395] 2 locks held by swapper/0/1:
> [    0.089395] 2 locks held by swapper/0/1:
> [    0.090000]  #0:
> [    0.090000]  #0:  ( (&p->pi_lock&p->pi_lock){-.....}){-.....}, at: , a=
t: [<c105160e>] try_to_wake_up+0x20/0x278
> [<c105160e>] try_to_wake_up+0x20/0x278
> [    0.090000]  #1:
> [    0.090000]  #1:  ( (rcu_read_lockrcu_read_lock){......}){......}, at:=
 , at: [<c105676c>] select_task_rq_fair+0x63/0x859
> [<c105676c>] select_task_rq_fair+0x63/0x859
> =

> =

> git bisect start 4da4e28818f5017c96f0fde72d643e965ac78253 97bf6af1f928216=
fd6c5a66e8a57bfa95a659672 --
> git bisect good 6109b00d083775e7f884e0e6562c7cc502fb701b  # 11:26     20+=
      0  rcu: Improve diagnostics for blocked critical sections in irq
> git bisect good 287f7a10372c77a6ae9bb5efaa51a48291bfaa35  # 11:28     20+=
      0  rcu: Process offlining and onlining only at grace-period start
> git bisect good c99d87408752d8d76d5af4ceb1a8d68cb36ab902  # 11:57     20+=
      0  rcu: Reverse rcu_dereference_check() conditions
> git bisect good 61d642e9d1b66a46626ba3a77ef39fdb3aa6fbf4  # 11:58     20+=
      0  rcu: Remove unnecessary condition check in rcu_qsctr_help()
> git bisect good 807079420046dd96282c0f755b13869d8dff35f8  # 12:00     20+=
      0  rcu: Remove fastpath from __rcu_process_callbacks()
> git bisect good 414341d2c2f7efa9564b45ccdd86ffd498b53c05  # 12:02     20+=
      0  rcu: Add grace-period initialization check for proper ->qsmask val=
ues
> # first bad commit: [4da4e28818f5017c96f0fde72d643e965ac78253] Squash wit=
h 287f7a10372c (rcu: Process offlining and onlining only at grace-period st=
art)
> git bisect good 414341d2c2f7efa9564b45ccdd86ffd498b53c05  # 12:05     60+=
      0  rcu: Add grace-period initialization check for proper ->qsmask val=
ues
> # extra tests with DEBUG_INFO
> git bisect  bad 4da4e28818f5017c96f0fde72d643e965ac78253  # 12:29      0-=
      5  Squash with 287f7a10372c (rcu: Process offlining and onlining only=
 at grace-period start)
> # extra tests on HEAD of rcu/rcu/dev
> git bisect  bad 4da4e28818f5017c96f0fde72d643e965ac78253  # 12:29      0-=
     12  Squash with 287f7a10372c (rcu: Process offlining and onlining only=
 at grace-period start)
> # extra tests on tree/branch rcu/rcu/dev
> git bisect  bad 4da4e28818f5017c96f0fde72d643e965ac78253  # 12:29      0-=
     12  Squash with 287f7a10372c (rcu: Process offlining and onlining only=
 at grace-period start)
> # extra tests with first bad commit reverted
> # extra tests on tree/branch linus/master
> git bisect good 796e1c55717e9a6ff5c81b12289ffa1ffd919b6f  # 12:47     60+=
      0  Merge branch 'drm-next' of git://people.freedesktop.org/~airlied/l=
inux
> # extra tests on tree/branch next/master
> git bisect good 272788cded4e29bc1f1cc97784b90364e6038639  # 13:20     60+=
      0  Add linux-next specific files for 20150216
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-i386.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-cpu kvm64
> 	-enable-kvm
> 	-kernel $kernel
> 	-initrd $initrd
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
> 	rd.udev.log-priority=3Derr
> 	systemd.log_target=3Djournal
> 	systemd.log_level=3Dwarning
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

> Thanks,
> Fengguang

> early console in setup code
> early console in decompress_kernel
> =

> Decompressing Linux... Parsing ELF... No relocation needed... done.
> Booting the kernel.
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.19.0-rc1-00098-g4da4e28 (kbuild(a)roam) (g=
cc version 4.9.1 (Debian 4.9.1-19) ) #79 SMP PREEMPT Tue Feb 17 11:07:46 CS=
T 2015
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Transmeta GenuineTMx86
> [    0.000000]   Transmeta TransmetaCPU
> [    0.000000]   UMC UMC UMC UMC
> [    0.000000] CPU: vendor_id 'GenuineIntel' unknown, using generic init.
> [    0.000000] CPU: Your system may be unstable.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000013fdffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000013fe0000-0x0000000013ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-20=
140531_083030-gandalf 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13fe0 max_arch_pfn =3D 0x1000000
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
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0eb0-0x000f0ebf] mapped a=
t [c00f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x02dfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12400000-0x125fffff]
> [    0.000000]  [mem 0x12400000-0x125fffff] page 4k
> [    0.000000] BRK [0x0283d000, 0x0283dfff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x123fffff]
> [    0.000000]  [mem 0x10000000-0x123fffff] page 4k
> [    0.000000] BRK [0x0283e000, 0x0283efff] PGTABLE
> [    0.000000] BRK [0x0283f000, 0x0283ffff] PGTABLE
> [    0.000000] BRK [0x02840000, 0x02840fff] PGTABLE
> [    0.000000] BRK [0x02841000, 0x02841fff] PGTABLE
> [    0.000000] BRK [0x02842000, 0x02842fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x0fffffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12600000-0x13fdffff]
> [    0.000000]  [mem 0x12600000-0x13fdffff] page 4k
> [    0.000000] RAMDISK: [mem 0x12793000-0x13fd7fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000F0C90 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x13FE18BD 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x13FE0B37 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x13FE0040 000AF7 (v01 BOCHS  BXPCDSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x13FE0000 000040
> [    0.000000] ACPI: SSDT 0x13FE0BAB 000C5A (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x13FE1805 000080 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x13FE1885 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] 319MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 13fe0000
> [    0.000000]   low ram: 0 - 13fe0000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13fdd001, primary cpu clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x13fdffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13fdffff]
> [    0.000000] Initmem setup node 0 [mem 0x00001000-0x13fdffff]
> [    0.000000] On node 0 totalpages: 81790
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 608 pages used for memmap
> [    0.000000]   Normal zone: 77792 pages, LIFO batch:15
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
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:32 nr_cpumask_bits:2 nr_cpu_ids:2 nr=
_node_ids:1
> [    0.000000] PERCPU: Embedded 334 pages/cpu @d1ee1000 s1346048 r0 d2201=
6 u1368064
> [    0.000000] pcpu-alloc: s1346048 r0 d22016 u1368064 alloc=3D334*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 11ee5140
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 81150
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 rd.udev.log-priority=3Derr systemd.log_target=3Djournal systemd.l=
og_level=3Dwarning debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu=
_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic o=
ops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 cons=
ole=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue=
/kvm/i386-randconfig-r2-0217/rcu:rcu:dev/.vmlinuz-4da4e28818f5017c96f0fde72=
d643e965ac78253-20150217110759-2-ivb41 branch=3Drcu/rcu/dev BOOT_IMAGE=3D/k=
ernel/i386-randconfig-r2-0217/4da4e28818f5017c96f0fde72d643e965ac78253/vmli=
nuz-3.19.0-rc1-00098-g4da4e28 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Memory: 269660K/327160K available (8746K kernel code, 879K=
 rwdata, 4044K rodata, 1932K init, 9088K bss, 57500K reserved, 0K cma-reser=
ved)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffd36000 - 0xfffff000   (2852 kB)
> [    0.000000]     vmalloc : 0xd47e0000 - 0xffd34000   ( 693 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd3fe0000   ( 319 MB)
> [    0.000000]       .init : 0xc1d5c000 - 0xc1f3f000   (1932 kB)
> [    0.000000]       .data : 0xc188acf6 - 0xc1d5ad40   (4928 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc188acf6   (8747 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:2304 nr_irqs:440 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd180a000 soft=3Dd180c000
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 3.19.0-rc1-00098-g4da4e28 (kbuild(a)roam) (g=
cc version 4.9.1 (Debian 4.9.1-19) ) #79 SMP PREEMPT Tue Feb 17 11:07:46 CS=
T 2015
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Transmeta GenuineTMx86
> [    0.000000]   Transmeta TransmetaCPU
> [    0.000000]   UMC UMC UMC UMC
> [    0.000000] CPU: vendor_id 'GenuineIntel' unknown, using generic init.
> [    0.000000] CPU: Your system may be unstable.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000013fdffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000013fe0000-0x0000000013ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] bootconsole [earlyser0] enabled
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.8 present.
> [    0.000000] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.7.5-20=
140531_083030-gandalf 04/01/2014
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x13fe0 max_arch_pfn =3D 0x1000000
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
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0eb0-0x000f0ebf] mapped a=
t [c00f0eb0]
> [    0.000000]   mpc: f0ec0-f0fa4
> [    0.000000] initial memory mapped: [mem 0x00000000-0x02dfffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12400000-0x125fffff]
> [    0.000000]  [mem 0x12400000-0x125fffff] page 4k
> [    0.000000] BRK [0x0283d000, 0x0283dfff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x10000000-0x123fffff]
> [    0.000000]  [mem 0x10000000-0x123fffff] page 4k
> [    0.000000] BRK [0x0283e000, 0x0283efff] PGTABLE
> [    0.000000] BRK [0x0283f000, 0x0283ffff] PGTABLE
> [    0.000000] BRK [0x02840000, 0x02840fff] PGTABLE
> [    0.000000] BRK [0x02841000, 0x02841fff] PGTABLE
> [    0.000000] BRK [0x02842000, 0x02842fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x0fffffff]
> [    0.000000]  [mem 0x00100000-0x0fffffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x12600000-0x13fdffff]
> [    0.000000]  [mem 0x12600000-0x13fdffff] page 4k
> [    0.000000] RAMDISK: [mem 0x12793000-0x13fd7fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000F0C90 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x13FE18BD 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x13FE0B37 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x13FE0040 000AF7 (v01 BOCHS  BXPCDSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x13FE0000 000040
> [    0.000000] ACPI: SSDT 0x13FE0BAB 000C5A (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x13FE1805 000080 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x13FE1885 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] 319MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 13fe0000
> [    0.000000]   low ram: 0 - 13fe0000
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:13fdd001, primary cpu clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x13fdffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x13fdffff]
> [    0.000000] Initmem setup node 0 [mem 0x00001000-0x13fdffff]
> [    0.000000] On node 0 totalpages: 81790
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 608 pages used for memmap
> [    0.000000]   Normal zone: 77792 pages, LIFO batch:15
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
> [    0.000000] e820: [mem 0x14000000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:32 nr_cpumask_bits:2 nr_cpu_ids:2 nr=
_node_ids:1
> [    0.000000] PERCPU: Embedded 334 pages/cpu @d1ee1000 s1346048 r0 d2201=
6 u1368064
> [    0.000000] pcpu-alloc: s1346048 r0 d22016 u1368064 alloc=3D334*4096
> [    0.000000] pcpu-alloc: [0] 0 [0] 1 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 11ee5140
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 81150
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 rd.udev.log-priority=3Derr systemd.log_target=3Djournal systemd.l=
og_level=3Dwarning debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu=
_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic o=
ops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 cons=
ole=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue=
/kvm/i386-randconfig-r2-0217/rcu:rcu:dev/.vmlinuz-4da4e28818f5017c96f0fde72=
d643e965ac78253-20150217110759-2-ivb41 branch=3Drcu/rcu/dev BOOT_IMAGE=3D/k=
ernel/i386-randconfig-r2-0217/4da4e28818f5017c96f0fde72d643e965ac78253/vmli=
nuz-3.19.0-rc1-00098-g4da4e28 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] Memory: 269660K/327160K available (8746K kernel code, 879K=
 rwdata, 4044K rodata, 1932K init, 9088K bss, 57500K reserved, 0K cma-reser=
ved)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffd36000 - 0xfffff000   (2852 kB)
> [    0.000000]     vmalloc : 0xd47e0000 - 0xffd34000   ( 693 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd3fe0000   ( 319 MB)
> [    0.000000]       .init : 0xc1d5c000 - 0xc1f3f000   (1932 kB)
> [    0.000000]       .data : 0xc188acf6 - 0xc1d5ad40   (4928 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc188acf6   (8747 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2,=
 Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Preemptible hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D2
> [    0.000000] NR_IRQS:2304 nr_irqs:440 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd180a000 soft=3Dd180c000
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
> [    0.000000]  memory used by lock dependency info: 5167 kB
> [    0.000000]  memory used by lock dependency info: 5167 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000]  per task-struct memory footprint: 1920 bytes
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

> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   | Wound/wait tests |
> [    0.000000]   | Wound/wait tests |
> [    0.000000]   ---------------------
> [    0.000000]   ---------------------
> [    0.000000]                   ww api failures:
> [    0.000000]                   ww api failures:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]                ww contexts mixing:
> [    0.000000]                ww contexts mixing:  ok  |  ok  |  ok  |  o=
k  |
> =

> [    0.000000]              finishing ww context:
> [    0.000000]              finishing ww context:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]                locking mismatches:
> [    0.000000]                locking mismatches:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]                  EDEADLK handling:
> [    0.000000]                  EDEADLK handling:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  | =
 ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> =

> [    0.000000]            spinlock nest unlocked:
> [    0.000000]            spinlock nest unlocked:  ok  |  ok  |
> =

> [    0.000000]   -----------------------------------------------------
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                                  |block | try  |context|
> [    0.000000]                                  |block | try  |context|
> [    0.000000]   -----------------------------------------------------
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                           context:
> [    0.000000]                           context:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]                               try:
> [    0.000000]                               try:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]                             block:
> [    0.000000]                             block:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000]                          spinlock:
> [    0.000000]                          spinlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> =

> [    0.000000] -------------------------------------------------------
> [    0.000000] -------------------------------------------------------
> [    0.000000] Good, all 253 testcases passed! |
> [    0.000000] Good, all 253 testcases passed! |
> [    0.000000] ---------------------------------
> [    0.000000] ---------------------------------
> [    0.000000] hpet clockevent registered
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.000000] tsc: Marking TSC unstable due to TSCs unsynchronized
> [    0.000000] tsc: Marking TSC unstable due to TSCs unsynchronized
> [    0.020000] Calibrating delay loop (skipped) preset value.. =

> [    0.020000] Calibrating delay loop (skipped) preset value.. 5387.01 Bo=
goMIPS (lpj=3D26935080)
> 5387.01 BogoMIPS (lpj=3D26935080)
> [    0.020000] pid_max: default: 4096 minimum: 301
> [    0.020000] pid_max: default: 4096 minimum: 301
> [    0.020000] ACPI: Core revision 20141107
> [    0.020000] ACPI: Core revision 20141107
> [    0.020000] ACPI: =

> [    0.020000] ACPI: All ACPI Tables successfully acquiredAll ACPI Tables=
 successfully acquired
> =

> [    0.020000] Security Framework initialized
> [    0.020000] Security Framework initialized
> [    0.020000] Yama: becoming mindful.
> [    0.020000] Yama: becoming mindful.
> [    0.020041] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.020041] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.021055] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.021055] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.022402] Initializing cgroup subsys blkio
> [    0.022402] Initializing cgroup subsys blkio
> [    0.023076] Initializing cgroup subsys debug
> [    0.023076] Initializing cgroup subsys debug
> [    0.023777] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.023777] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.023777] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.023777] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.026191] debug: unmapping init [mem 0xc1f3f000-0xc1f44fff]
> [    0.026191] debug: unmapping init [mem 0xc1f3f000-0xc1f44fff]
> [    0.030725] Getting VERSION: 1050014
> [    0.030725] Getting VERSION: 1050014
> [    0.031297] Getting VERSION: 1050014
> [    0.031297] Getting VERSION: 1050014
> [    0.031887] Getting ID: 0
> [    0.031887] Getting ID: 0
> [    0.032308] Getting ID: f000000
> [    0.032308] Getting ID: f000000
> [    0.032794] Getting LVT0: 8700
> [    0.032794] Getting LVT0: 8700
> [    0.033244] Getting LVT1: 8400
> [    0.033244] Getting LVT1: 8400
> [    0.033739] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.033739] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.034609] enabled ExtINT on CPU#0
> [    0.034609] enabled ExtINT on CPU#0
> [    0.035867] ENABLING IO-APIC IRQs
> [    0.035867] ENABLING IO-APIC IRQs
> [    0.036386] init IO_APIC IRQs
> [    0.036386] init IO_APIC IRQs
> [    0.036887]  apic 0 pin 0 not connected
> [    0.036887]  apic 0 pin 0 not connected
> [    0.037536] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.037536] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.038788] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.038788] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.040025] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.040025] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.041333] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.041333] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.042595] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.042595] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.043884] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.043884] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.045203] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.045203] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.046507] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.046507] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.047825] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.047825] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.049102] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.049102] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.050022] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.050022] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.051318] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.051318] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.052678] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.052678] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.054005] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.054005] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.055359] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.055359] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.056716] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.056716] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.057985]  apic 0 pin 16 not connected
> [    0.057985]  apic 0 pin 16 not connected
> [    0.058638]  apic 0 pin 17 not connected
> [    0.058638]  apic 0 pin 17 not connected
> [    0.059271]  apic 0 pin 18 not connected
> [    0.059271]  apic 0 pin 18 not connected
> [    0.060003]  apic 0 pin 19 not connected
> [    0.060003]  apic 0 pin 19 not connected
> [    0.060635]  apic 0 pin 20 not connected
> [    0.060635]  apic 0 pin 20 not connected
> [    0.061300]  apic 0 pin 21 not connected
> [    0.061300]  apic 0 pin 21 not connected
> [    0.061915]  apic 0 pin 22 not connected
> [    0.061915]  apic 0 pin 22 not connected
> [    0.062543]  apic 0 pin 23 not connected
> [    0.062543]  apic 0 pin 23 not connected
> [    0.063312] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.063312] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.064527] smpboot: CPU0: =

> [    0.064527] smpboot: CPU0: GenuineIntel GenuineIntel Common KVM proces=
sorCommon KVM processor (fam: 0f, model: 06 (fam: 0f, model: 06, stepping: =
01)
> , stepping: 01)
> [    0.066261] Using local APIC timer interrupts.
> [    0.066261] calibrating APIC timer ...
> [    0.066261] Using local APIC timer interrupts.
> [    0.066261] calibrating APIC timer ...
> [    0.070000] ... lapic delta =3D 6251270
> [    0.070000] ... lapic delta =3D 6251270
> [    0.070000] ... PM-Timer delta =3D 357992
> [    0.070000] ... PM-Timer delta =3D 357992
> [    0.070000] ... PM-Timer result ok
> [    0.070000] ... PM-Timer result ok
> [    0.070000] ..... delta 6251270
> [    0.070000] ..... delta 6251270
> [    0.070000] ..... mult: 268490002
> [    0.070000] ..... mult: 268490002
> [    0.070000] ..... calibration result: 10002032
> [    0.070000] ..... calibration result: 10002032
> [    0.070000] ..... CPU clock speed is 2693.7963 MHz.
> [    0.070000] ..... CPU clock speed is 2693.7963 MHz.
> [    0.070000] ..... host bus clock speed is 1000.2032 MHz.
> [    0.070000] ..... host bus clock speed is 1000.2032 MHz.
> [    0.070000] Performance Events: =

> [    0.070000] Performance Events: no PMU driver, software events only.
> no PMU driver, software events only.
> [    0.080336] =

> [    0.080336] =

> [    0.080669] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.080669] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.081483] [ INFO: suspicious RCU usage. ]
> [    0.081483] [ INFO: suspicious RCU usage. ]
> [    0.082283] 3.19.0-rc1-00098-g4da4e28 #79 Not tainted
> [    0.082283] 3.19.0-rc1-00098-g4da4e28 #79 Not tainted
> [    0.083267] -------------------------------
> [    0.083267] -------------------------------
> [    0.084068] kernel/sched/fair.c:4737 suspicious rcu_dereference_check(=
) usage!
> [    0.084068] kernel/sched/fair.c:4737 suspicious rcu_dereference_check(=
) usage!
> [    0.085733] =

> [    0.085733] other info that might help us debug this:
> [    0.085733] =

> [    0.085733] =

> [    0.085733] other info that might help us debug this:
> [    0.085733] =

> [    0.087275] =

> [    0.087275] RCU used illegally from offline CPU!
> [    0.087275] rcu_scheduler_active =3D 1, debug_locks =3D 0
> [    0.087275] =

> [    0.087275] RCU used illegally from offline CPU!
> [    0.087275] rcu_scheduler_active =3D 1, debug_locks =3D 0
> [    0.089395] 2 locks held by swapper/0/1:
> [    0.089395] 2 locks held by swapper/0/1:
> [    0.090000]  #0: =

> [    0.090000]  #0:  ( (&p->pi_lock&p->pi_lock){-.....}){-.....}, at: , a=
t: [<c105160e>] try_to_wake_up+0x20/0x278
> [<c105160e>] try_to_wake_up+0x20/0x278
> [    0.090000]  #1: =

> [    0.090000]  #1:  ( (rcu_read_lockrcu_read_lock){......}){......}, at:=
 , at: [<c105676c>] select_task_rq_fair+0x63/0x859
> [<c105676c>] select_task_rq_fair+0x63/0x859
> [    0.090000] =

> [    0.090000] stack backtrace:
> [    0.090000] =

> [    0.090000] stack backtrace:
> [    0.090000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-rc1-00098=
-g4da4e28 #79
> [    0.090000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-rc1-00098=
-g4da4e28 #79
> [    0.090000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.090000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.090000]  00000000
> [    0.090000]  00000000 00000000 00000000 d1823dc8 d1823dc8 c1876f55 c18=
76f55 00000001 00000001 d1823de4 d1823de4 c106948d c106948d c1b5bb72 c1b5bb=
72
> =

> [    0.090000]  d1848000
> [    0.090000]  d1848000 00000000 00000000 ffffffff ffffffff 00000000 000=
00000 d1823e44 d1823e44 c105681c c105681c 00000086 00000086 d1849134 d18491=
34
> =

> [    0.090000]  00000010
> [    0.090000]  00000010 d1848490 d1848490 d1848468 d1848468 d1823e34 d18=
23e34 00000086 00000086 00000010 00000010 00000232 00000232 c105160e c10516=
0e
> =

> [    0.090000] Call Trace:
> [    0.090000] Call Trace:
> [    0.090000]  [<c1876f55>] dump_stack+0x48/0x69
> [    0.090000]  [<c1876f55>] dump_stack+0x48/0x69
> [    0.090000]  [<c106948d>] lockdep_rcu_suspicious+0xd4/0xdd
> [    0.090000]  [<c106948d>] lockdep_rcu_suspicious+0xd4/0xdd
> [    0.090000]  [<c105681c>] select_task_rq_fair+0x113/0x859
> [    0.090000]  [<c105681c>] select_task_rq_fair+0x113/0x859
> [    0.090000]  [<c105160e>] ? try_to_wake_up+0x20/0x278
> [    0.090000]  [<c105160e>] ? try_to_wake_up+0x20/0x278
> [    0.090000]  [<c105171e>] try_to_wake_up+0x130/0x278
> [    0.090000]  [<c105171e>] try_to_wake_up+0x130/0x278
> [    0.090000]  [<c105188f>] wake_up_process+0x29/0x2c
> [    0.090000]  [<c105188f>] wake_up_process+0x29/0x2c
> [    0.090000]  [<c1048d24>] kthread_create_on_node+0xcd/0x150
> [    0.090000]  [<c1048d24>] kthread_create_on_node+0xcd/0x150
> [    0.090000]  [<c10788c3>] ? force_qs_rnp+0x13e/0x13e
> [    0.090000]  [<c10788c3>] ? force_qs_rnp+0x13e/0x13e
> [    0.090000]  [<c1888af7>] ? _raw_spin_unlock_irqrestore+0x44/0x6b
> [    0.090000]  [<c1888af7>] ? _raw_spin_unlock_irqrestore+0x44/0x6b
> [    0.090000]  [<c1888af7>] ? _raw_spin_unlock_irqrestore+0x44/0x6b
> [    0.090000]  [<c1888af7>] ? _raw_spin_unlock_irqrestore+0x44/0x6b
> [    0.090000]  [<c1d73e96>] rcu_spawn_gp_kthread+0x79/0x137
> [    0.090000]  [<c1d73e96>] rcu_spawn_gp_kthread+0x79/0x137
> [    0.090000]  [<c10788c3>] ? force_qs_rnp+0x13e/0x13e
> [    0.090000]  [<c10788c3>] ? force_qs_rnp+0x13e/0x13e
> [    0.090000]  [<c1d73e1d>] ? rcu_init_one+0x3d5/0x3d5
> [    0.090000]  [<c1d73e1d>] ? rcu_init_one+0x3d5/0x3d5
> [    0.090000]  [<c1d5ccb1>] do_one_initcall+0x126/0x196
> [    0.090000]  [<c1d5ccb1>] do_one_initcall+0x126/0x196
> [    0.090000]  [<c101f400>] ? setup_APIC_timer+0x2a/0x9e
> [    0.090000]  [<c101f400>] ? setup_APIC_timer+0x2a/0x9e
> [    0.090000]  [<c1d6c101>] ? setup_boot_APIC_clock+0x572/0x57a
> [    0.090000]  [<c1d6c101>] ? setup_boot_APIC_clock+0x572/0x57a
> [    0.090000]  [<c1875758>] ? printk+0x12/0x14
> [    0.090000]  [<c1875758>] ? printk+0x12/0x14
> [    0.090000]  [<c1d6a60d>] ? native_smp_prepare_cpus+0x37e/0x388
> [    0.090000]  [<c1d6a60d>] ? native_smp_prepare_cpus+0x37e/0x388
> [    0.090000]  [<c1d5ce56>] kernel_init_freeable+0x135/0x256
> [    0.090000]  [<c1d5ce56>] kernel_init_freeable+0x135/0x256
> [    0.090000]  [<c18727b1>] kernel_init+0x8/0xb8
> [    0.090000]  [<c18727b1>] kernel_init+0x8/0xb8
> [    0.090000]  [<c1889441>] ret_from_kernel_thread+0x21/0x30
> [    0.090000]  [<c1889441>] ret_from_kernel_thread+0x21/0x30
> [    0.090000]  [<c18727a9>] ? rest_init+0x10d/0x10d
> [    0.090000]  [<c18727a9>] ? rest_init+0x10d/0x10d
> [    0.130006] NMI watchdog: disabled (cpu0): hardware events not enabled
> [    0.130006] NMI watchdog: disabled (cpu0): hardware events not enabled
> [    0.150103] CPU 1 irqstacks, hard=3Dd189a000 soft=3Dd18a0000
> [    0.150103] CPU 1 irqstacks, hard=3Dd189a000 soft=3Dd18a0000
> [    0.151125] x86: Booting SMP configuration:
> [    0.151125] x86: Booting SMP configuration:
> [    0.151907] .... node  #0, CPUs:  =

> [    0.151907] .... node  #0, CPUs:         #1 #1
> [    0.010000] Initializing CPU#1
> [    0.020000] kvm-clock: cpu 1, msr 0:13fdd041, secondary cpu clock
> [    0.020000] masked ExtINT on CPU#1
> [    0.165015] x86: Booted up 1 node, 2 CPUs
> [    0.165015] x86: Booted up 1 node, 2 CPUs
> [    0.165005] KVM setup async PF for cpu 1
> [    0.165005] KVM setup async PF for cpu 1
> [    0.165005] kvm-stealtime: cpu 1, msr 12033140
> [    0.165005] kvm-stealtime: cpu 1, msr 12033140
> [    0.166923] ----------------
> [    0.166923] ----------------
> [    0.167358] | NMI testsuite:
> [    0.167358] | NMI testsuite:
> [    0.167796] --------------------
> [    0.167796] --------------------
> [    0.168279]   remote IPI:
> [    0.168279]   remote IPI:  ok  |  ok  |
> =

> [    0.168828]    local IPI:
> [    0.168828]    local IPI:  ok  |  ok  |
> =

> [    0.169367] --------------------
> [    0.169367] --------------------
> [    0.169864] Good, all   2 testcases passed! |
> [    0.169864] Good, all   2 testcases passed! |
> [    0.170002] ---------------------------------
> [    0.170002] ---------------------------------
> [    0.170660] smpboot: Total of 2 processors activated (10774.03 BogoMIP=
S)
> [    0.170660] smpboot: Total of 2 processors activated (10774.03 BogoMIP=
S)
> [    0.171990] ------------[ cut here ]------------
> [    0.171990] ------------[ cut here ]------------
> [    0.172744] WARNING: CPU: 0 PID: 1 at kernel/rcu/tree_plugin.h:178 rcu=
_note_context_switch+0x7c/0x122()
> [    0.172744] WARNING: CPU: 0 PID: 1 at kernel/rcu/tree_plugin.h:178 rcu=
_note_context_switch+0x7c/0x122()
> [    0.174472] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-rc1-00098=
-g4da4e28 #79
> [    0.174472] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.19.0-rc1-00098=
-g4da4e28 #79
> [    0.175640] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.175640] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.177259]  00000000
> [    0.177259]  00000000 00000000 00000000 d1823dfc d1823dfc c1876f55 c18=
76f55 00000000 00000000 d1823e18 d1823e18 c1033d5e c1033d5e 000000b2 000000=
b2
> =

> [    0.178609]  c107a395
> [    0.178609]  c107a395 c1c8f500 c1c8f500 d2029340 d2029340 ffffffff fff=
fffff d1823e28 d1823e28 c1033dfb c1033dfb 00000009 00000009 00000000 000000=
00
> =

> [    0.179940]  d1823e44
> [    0.179940]  d1823e44 c107a395 c107a395 d1848000 d1848000 00000286 000=
00286 00000000 00000000 d2028cc0 d2028cc0 ffffffff ffffffff d1823eb4 d1823e=
b4
> =

> [    0.180000] Call Trace:
> [    0.180000] Call Trace:
> [    0.180000]  [<c1876f55>] dump_stack+0x48/0x69
> [    0.180000]  [<c1876f55>] dump_stack+0x48/0x69
> [    0.180000]  [<c1033d5e>] warn_slowpath_common+0x7a/0x91
> [    0.180000]  [<c1033d5e>] warn_slowpath_common+0x7a/0x91
> [    0.180000]  [<c107a395>] ? rcu_note_context_switch+0x7c/0x122
> [    0.180000]  [<c107a395>] ? rcu_note_context_switch+0x7c/0x122
> [    0.180000]  [<c1033dfb>] warn_slowpath_null+0xf/0x13
> [    0.180000]  [<c1033dfb>] warn_slowpath_null+0xf/0x13
> [    0.180000]  [<c107a395>] rcu_note_context_switch+0x7c/0x122
> [    0.180000]  [<c107a395>] rcu_note_context_switch+0x7c/0x122
> [    0.180000]  [<c188450e>] __schedule+0x36/0x687
> [    0.180000]  [<c188450e>] __schedule+0x36/0x687
> [    0.180000]  [<c105645a>] ? rq_online_fair+0x48/0x81
> [    0.180000]  [<c105645a>] ? rq_online_fair+0x48/0x81
> [    0.180000]  [<c105645a>] ? rq_online_fair+0x48/0x81
> [    0.180000]  [<c105645a>] ? rq_online_fair+0x48/0x81
> [    0.180000]  [<c1884c0c>] preempt_schedule+0x3e/0x56
> [    0.180000]  [<c1884c0c>] preempt_schedule+0x3e/0x56
> [    0.180000]  [<c1217a4a>] ___preempt_schedule+0x8/0xc
> [    0.180000]  [<c1217a4a>] ___preempt_schedule+0x8/0xc
> [    0.180000]  [<c104cbef>] ? rq_attach_root+0x14f/0x168
> [    0.180000]  [<c104cbef>] ? rq_attach_root+0x14f/0x168
> [    0.180000]  [<c1888b1a>] ? _raw_spin_unlock_irqrestore+0x67/0x6b
> [    0.180000]  [<c1888b1a>] ? _raw_spin_unlock_irqrestore+0x67/0x6b
> [    0.180000]  [<c104cbef>] rq_attach_root+0x14f/0x168
> [    0.180000]  [<c104cbef>] rq_attach_root+0x14f/0x168
> [    0.180000]  [<c104ccd1>] cpu_attach_domain+0xc9/0x2ee
> [    0.180000]  [<c104ccd1>] cpu_attach_domain+0xc9/0x2ee
> [    0.180000]  [<c1053297>] build_sched_domains+0xa77/0xc5b
> [    0.180000]  [<c1053297>] build_sched_domains+0xa77/0xc5b
> [    0.180000]  [<c10e1aa9>] ? kmem_cache_alloc+0xb9/0xe9
> [    0.180000]  [<c10e1aa9>] ? kmem_cache_alloc+0xb9/0xe9
> [    0.180000]  [<c1d71efd>] sched_init_smp+0x7d/0x13a
> [    0.180000]  [<c1d71efd>] sched_init_smp+0x7d/0x13a
> [    0.180000]  [<c1d5ce6c>] kernel_init_freeable+0x14b/0x256
> [    0.180000]  [<c1d5ce6c>] kernel_init_freeable+0x14b/0x256
> [    0.180000]  [<c18727b1>] kernel_init+0x8/0xb8
> [    0.180000]  [<c18727b1>] kernel_init+0x8/0xb8
> [    0.180000]  [<c1889441>] ret_from_kernel_thread+0x21/0x30
> [    0.180000]  [<c1889441>] ret_from_kernel_thread+0x21/0x30
> [    0.180000]  [<c18727a9>] ? rest_init+0x10d/0x10d
> [    0.180000]  [<c18727a9>] ? rest_init+0x10d/0x10d
> [    0.180000] ---[ end trace 208c85d55ea3f2f1 ]---
> [    0.180000] ---[ end trace 208c85d55ea3f2f1 ]---
> [    0.190019] devtmpfs: initialized
> [    0.190019] devtmpfs: initialized
> [    0.192058] prandom: seed boundary self test passed
> [    0.192058] prandom: seed boundary self test passed
> [    0.192058] prandom: 100 self tests passed
> [    0.192058] prandom: 100 self tests passed
> [    0.192058] regulator-dummy: no parameters
> [    0.192058] regulator-dummy: no parameters
> [    0.192694] NET: Registered protocol family 16
> [    0.192694] NET: Registered protocol family 16
> [    0.194181] cpuidle: using governor ladder
> [    0.194181] cpuidle: using governor ladder
> [    0.194826] cpuidle: using governor menu
> [    0.194826] cpuidle: using governor menu
> [    0.196200] ACPI: bus type PCI registered
> [    0.196200] ACPI: bus type PCI registered
> [    0.196932] PCI : PCI BIOS area is rw and x. Use pci=3Dnobios if you w=
ant it NX.
> [    0.196932] PCI : PCI BIOS area is rw and x. Use pci=3Dnobios if you w=
ant it NX.
> [    0.200006] PCI: PCI BIOS revision 2.10 entry at 0xfd456, last bus=3D0
> [    0.200006] PCI: PCI BIOS revision 2.10 entry at 0xfd456, last bus=3D0
> [    0.201022] PCI: Using configuration type 1 for base access
> [    0.201022] PCI: Using configuration type 1 for base access
> [    0.210600] Running resizable hashtable tests...
> [    0.210600] Running resizable hashtable tests...
> [    0.210774]   Adding 2048 keys
> [    0.210774]   Adding 2048 keys
> [    0.212100]   Traversal complete: counted=3D2048, nelems=3D2048, entri=
es=3D2048
> [    0.212100]   Traversal complete: counted=3D2048, nelems=3D2048, entri=
es=3D2048
> [    0.213305]   Table expansion iteration 0...
> [    0.213305]   Table expansion iteration 0...
> [    0.214323]   Verifying lookups...
> [    0.214323]   Verifying lookups...
> [    0.215009]   Table expansion iteration 1...
> [    0.215009]   Table expansion iteration 1...
> [    0.216067]   Verifying lookups...
> [    0.216067]   Verifying lookups...
> [    0.216707]   Table expansion iteration 2...
> [    0.216707]   Table expansion iteration 2...
> [    0.218106]   Verifying lookups...
> [    0.218106]   Verifying lookups...
> [    0.218748]   Table expansion iteration 3...
> [    0.218748]   Table expansion iteration 3...
> [    0.221366]   Verifying lookups...
> [    0.221366]   Verifying lookups...
> [    0.222007]   Table shrinkage iteration 0...
> [    0.222007]   Table shrinkage iteration 0...
> [    0.222875]   Verifying lookups...
> [    0.222875]   Verifying lookups...
> [    0.223536]   Table shrinkage iteration 1...
> [    0.223536]   Table shrinkage iteration 1...
> [    0.224339]   Verifying lookups...
> [    0.224339]   Verifying lookups...
> [    0.224985]   Table shrinkage iteration 2...
> [    0.224985]   Table shrinkage iteration 2...
> [    0.225687]   Verifying lookups...
> [    0.225687]   Verifying lookups...
> [    0.226314]   Table shrinkage iteration 3...
> [    0.226314]   Table shrinkage iteration 3...
> [    0.227024]   Verifying lookups...
> [    0.227024]   Verifying lookups...
> [    0.227739]   Traversal complete: counted=3D2048, nelems=3D2048, entri=
es=3D2048
> [    0.227739]   Traversal complete: counted=3D2048, nelems=3D2048, entri=
es=3D2048
> [    0.228746]   Deleting 2048 keys
> [    0.228746]   Deleting 2048 keys
> [    0.230413] gpio-f7188x: Not a Fintek device at 0x0000002e
> [    0.230413] gpio-f7188x: Not a Fintek device at 0x0000002e
> [    0.231277] gpio-f7188x: Not a Fintek device at 0x0000004e
> [    0.231277] gpio-f7188x: Not a Fintek device at 0x0000004e
> [    0.232235] ACPI: Added _OSI(Module Device)
> [    0.232235] ACPI: Added _OSI(Module Device)
> [    0.232879] ACPI: Added _OSI(Processor Device)
> [    0.232879] ACPI: Added _OSI(Processor Device)
> [    0.233560] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.233560] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.234281] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.234281] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.235939] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:3)
> [    0.235939] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:3)
> [    0.238774] ACPI: Interpreter enabled
> [    0.238774] ACPI: Interpreter enabled
> [    0.239351] ACPI: (supports S0 S5)
> [    0.239351] ACPI: (supports S0 S5)
> [    0.239902] ACPI: Using IOAPIC for interrupt routing
> [    0.239902] ACPI: Using IOAPIC for interrupt routing
> [    0.240023] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.240023] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.246140] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.246140] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.247076] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments =
MSI]
> [    0.247076] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments =
MSI]
> [    0.248090] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.248090] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.249192] acpi PNP0A03:00: fail to add MMCONFIG information, can't a=
ccess extended PCI configuration space under this bridge.
> [    0.249192] acpi PNP0A03:00: fail to add MMCONFIG information, can't a=
ccess extended PCI configuration space under this bridge.
> [    0.250066] PCI host bridge to bus 0000:00
> [    0.250066] PCI host bridge to bus 0000:00
> [    0.250747] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.250747] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.251608] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.251608] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.252589] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff]
> [    0.252589] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff]
> [    0.253536] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff]
> [    0.253536] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff]
> [    0.254491] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf]
> [    0.254491] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf]
> [    0.255467] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff]
> [    0.255467] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff]
> [    0.256447] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff]
> [    0.256447] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff]
> [    0.257533] pci_bus 0000:00: root bus resource [mem 0x14000000-0xfebff=
fff]
> [    0.257533] pci_bus 0000:00: root bus resource [mem 0x14000000-0xfebff=
fff]
> [    0.260032] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.260032] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.261333] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.261333] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.262643] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.262643] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.265678] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
> [    0.265678] pci 0000:00:01.1: reg 0x20: [io  0xc040-0xc04f]
> [    0.267310] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    0.267310] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    0.268328] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.268328] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.269260] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    0.269260] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    0.270004] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.270004] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.271171] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.271171] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.272290] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    0.272290] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    0.273348] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    0.273348] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    0.274608] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.274608] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.276563] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    0.276563] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    0.278450] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    0.278450] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    0.283851] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    0.283851] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    0.285083] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.285083] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.286655] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    0.286655] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    0.288253] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    0.288253] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    0.292404] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    0.292404] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    0.293629] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> [    0.293629] pci 0000:00:04.0: [8086:25ab] type 00 class 0x088000
> [    0.295040] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
> [    0.295040] pci 0000:00:04.0: reg 0x10: [mem 0xfebf1000-0xfebf100f]
> [    0.298433] pci_bus 0000:00: on NUMA node 0
> [    0.298433] pci_bus 0000:00: on NUMA node 0
> [    0.299479] ACPI: PCI Interrupt Link [LNKA] (IRQs
> [    0.299479] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 5 *10 *10 11 11))
> =

> [    0.300324] ACPI: PCI Interrupt Link [LNKB] (IRQs
> [    0.300324] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 5 *10 *10 11 11))
> =

> [    0.301286] ACPI: PCI Interrupt Link [LNKC] (IRQs
> [    0.301286] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 5 10 10 *11 *11))
> =

> [    0.302297] ACPI: PCI Interrupt Link [LNKD] (IRQs
> [    0.302297] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 5 10 10 *11 *11))
> =

> [    0.303202] ACPI: PCI Interrupt Link [LNKS] (IRQs
> [    0.303202] ACPI: PCI Interrupt Link [LNKS] (IRQs *9 *9))
> =

> [    0.304348] ACPI: =

> [    0.304348] ACPI: Enabled 16 GPEs in block 00 to 0FEnabled 16 GPEs in =
block 00 to 0F
> =

> [    0.305490] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    0.305490] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    0.305490] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    0.305490] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    0.305490] vgaarb: loaded
> [    0.305490] vgaarb: loaded
> [    0.305490] vgaarb: bridge control possible 0000:00:02.0
> [    0.305490] vgaarb: bridge control possible 0000:00:02.0
> [    0.305490] SCSI subsystem initialized
> [    0.305490] SCSI subsystem initialized
> [    0.310020] ACPI: bus type USB registered
> [    0.310020] ACPI: bus type USB registered
> [    0.310656] usbcore: registered new interface driver usbfs
> [    0.310656] usbcore: registered new interface driver usbfs
> [    0.311486] usbcore: registered new interface driver hub
> [    0.311486] usbcore: registered new interface driver hub
> [    0.312306] usbcore: registered new device driver usb
> [    0.312306] usbcore: registered new device driver usb
> [    0.313116] pps_core: LinuxPPS API ver. 1 registered
> [    0.313116] pps_core: LinuxPPS API ver. 1 registered
> [    0.313801] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.313801] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.315200] wmi: Mapper loaded
> [    0.315200] wmi: Mapper loaded
> [    0.315685] PCI: Using ACPI for IRQ routing
> [    0.315685] PCI: Using ACPI for IRQ routing
> [    0.315685] PCI: pci_cache_line_size set to 64 bytes
> [    0.315685] PCI: pci_cache_line_size set to 64 bytes
> [    0.315685] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.315685] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.315685] e820: reserve RAM buffer [mem 0x13fe0000-0x13ffffff]
> [    0.315685] e820: reserve RAM buffer [mem 0x13fe0000-0x13ffffff]
> [    0.320053] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    0.320053] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    0.321098] Switched to clocksource kvm-clock
> [    0.321098] Switched to clocksource kvm-clock
> [    0.321098] FS-Cache: Loaded
> [    0.321098] FS-Cache: Loaded
> [    0.321256] CacheFiles: Loaded
> [    0.321256] CacheFiles: Loaded
> [    0.321773] pnp: PnP ACPI init
> [    0.321773] pnp: PnP ACPI init
> [    0.322250] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:3)
> [    0.322250] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:3)
> [    0.323399] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.323399] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.324389] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:3)
> [    0.324389] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:3)
> [    0.325546] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.325546] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.326470] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:3)
> [    0.326470] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:3)
> [    0.327665] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.327665] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.328582] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:3)
> [    0.328582] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:3)
> [    0.329762] pnp 00:03: [dma 2]
> [    0.329762] pnp 00:03: [dma 2]
> [    0.330228] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.330228] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.331176] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:3)
> [    0.331176] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:3)
> [    0.332363] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.332363] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.333341] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:3)
> [    0.333341] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:3)
> [    0.334479] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.334479] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.335697] pnp: PnP ACPI: found 6 devices
> [    0.335697] pnp: PnP ACPI: found 6 devices
> [    0.371688] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.371688] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.372478] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff]
> [    0.372478] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff]
> [    0.373287] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff]
> [    0.373287] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff]
> [    0.374169] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf]
> [    0.374169] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf]
> [    0.375026] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff]
> [    0.375026] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff]
> [    0.375847] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff]
> [    0.375847] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff]
> [    0.376826] pci_bus 0000:00: resource 10 [mem 0x14000000-0xfebfffff]
> [    0.376826] pci_bus 0000:00: resource 10 [mem 0x14000000-0xfebfffff]
> [    0.377729] NET: Registered protocol family 1
> [    0.377729] NET: Registered protocol family 1
> [    0.378373] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.378373] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    0.379285] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.379285] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    0.380175] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.380175] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    0.381102] pci 0000:00:02.0: Video device with shadowed ROM
> [    0.381102] pci 0000:00:02.0: Video device with shadowed ROM
> [    0.382046] PCI: CLS 0 bytes, default 64
> [    0.382046] PCI: CLS 0 bytes, default 64
> [    0.382799] Unpacking initramfs...
> [    0.382799] Unpacking initramfs...
> [    0.958290] debug: unmapping init [mem 0xd2793000-0xd3fd7fff]
> [    0.958290] debug: unmapping init [mem 0xd2793000-0xd3fd7fff]
> [    0.960336] apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
> [    0.960336] apm: BIOS version 1.2 Flags 0x03 (Driver version 1.16ac)
> [    0.961314] apm: disabled - APM is not SMP safe.
> [    0.961314] apm: disabled - APM is not SMP safe.
> [    0.962269] PCLMULQDQ-NI instructions are not detected.
> [    0.962269] PCLMULQDQ-NI instructions are not detected.
> [    0.963076] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    0.963076] spin_lock-torture:--- Start of test [debug]: nwriters_stre=
ss=3D4 nreaders_stress=3D0 stat_interval=3D60 verbose=3D1 shuffle_interval=
=3D3 stutter=3D5 shutdown_secs=3D0 onoff_interval=3D0 onoff_holdoff=3D0
> [    0.965741] spin_lock-torture: Creating torture_shuffle task
> [    0.965741] spin_lock-torture: Creating torture_shuffle task
> [    0.966646] spin_lock-torture: Creating torture_stutter task
> [    0.966646] spin_lock-torture: Creating torture_stutter task
> [    0.966654] spin_lock-torture: torture_shuffle task started
> [    0.966654] spin_lock-torture: torture_shuffle task started
> [    0.968390] spin_lock-torture: Creating lock_torture_writer task
> [    0.968390] spin_lock-torture: Creating lock_torture_writer task
> [    0.968397] spin_lock-torture: torture_stutter task started
> [    0.968397] spin_lock-torture: torture_stutter task started
> [    0.970232] spin_lock-torture: Creating lock_torture_writer task
> [    0.970232] spin_lock-torture: Creating lock_torture_writer task
> [    0.970242] spin_lock-torture: lock_torture_writer task started
> [    0.970242] spin_lock-torture: lock_torture_writer task started
> [    0.972083] spin_lock-torture: Creating lock_torture_writer task
> [    0.972083] spin_lock-torture: Creating lock_torture_writer task
> [    0.972092] spin_lock-torture: lock_torture_writer task started
> [    0.972092] spin_lock-torture: lock_torture_writer task started
> [    0.973906] spin_lock-torture: Creating lock_torture_writer task
> [    0.973906] spin_lock-torture: Creating lock_torture_writer task
> [    0.973916] spin_lock-torture: lock_torture_writer task started
> [    0.973916] spin_lock-torture: lock_torture_writer task started
> [    0.975756] spin_lock-torture: Creating lock_torture_stats task
> [    0.975756] spin_lock-torture: Creating lock_torture_stats task
> [    0.975766] spin_lock-torture: lock_torture_writer task started
> [    0.975766] spin_lock-torture: lock_torture_writer task started
> [    0.977586] spin_lock-torture: lock_torture_stats task started
> [    0.977586] spin_lock-torture: lock_torture_stats task started
> [    0.977850] torture_init_begin: refusing rcu init: spin_lock running
> [    0.977850] torture_init_begin: refusing rcu init: spin_lock running
> [    0.977850] futex hash table entries: 16 (order: -2, 1024 bytes)
> [    0.977850] futex hash table entries: 16 (order: -2, 1024 bytes)
> [    0.979854] zpool: loaded
> [    0.979854] zpool: loaded
> [    0.979855] zbud: loaded
> [    0.979855] zbud: loaded
> [    0.980432] ntfs: driver 2.1.31 [Flags: R/W].
> [    0.980432] ntfs: driver 2.1.31 [Flags: R/W].
> [    0.980556] Key type big_key registered
> [    0.980556] Key type big_key registered
> [    0.984602] Key type asymmetric registered
> [    0.984602] Key type asymmetric registered
> [    0.985234] Asymmetric key parser 'x509' registered
> [    0.985234] Asymmetric key parser 'x509' registered
> [    0.985991] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 252)
> [    0.985991] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 252)
> [    0.987160] io scheduler noop registered
> [    0.987160] io scheduler noop registered
> [    0.987780] io scheduler deadline registered (default)
> [    0.987780] io scheduler deadline registered (default)
> [    0.988563] io scheduler cfq registered
> [    0.988563] io scheduler cfq registered
> [    0.989140] start plist test
> [    0.989140] start plist test
> [    0.991589] end plist test
> [    0.991589] end plist test
> [    0.992022] test_string_helpers: Running tests...
> [    0.992022] test_string_helpers: Running tests...
> [    0.992952] test_firmware: interface ready
> [    0.992952] test_firmware: interface ready
> [    0.998182] crc32: CRC_LE_BITS =3D 1, CRC_BE BITS =3D 1
> [    0.998182] crc32: CRC_LE_BITS =3D 1, CRC_BE BITS =3D 1
> [    0.998943] crc32: self tests passed, processed 225944 bytes in 229151=
7 nsec
> [    0.998943] crc32: self tests passed, processed 225944 bytes in 229151=
7 nsec
> [    1.002494] crc32c: CRC_LE_BITS =3D 1
> [    1.002494] crc32c: CRC_LE_BITS =3D 1
> [    1.003026] crc32c: self tests passed, processed 225944 bytes in 12174=
56 nsec
> [    1.003026] crc32c: self tests passed, processed 225944 bytes in 12174=
56 nsec
> [    1.117262] crc32_combine: 8373 self tests passed
> [    1.117262] crc32_combine: 8373 self tests passed
> [    1.231619] crc32c_combine: 8373 self tests passed
> [    1.231619] crc32c_combine: 8373 self tests passed
> [    1.233040] xz_dec_test: module loaded
> [    1.233040] xz_dec_test: module loaded
> [    1.233623] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 251 0' and write .xz files to it.
> [    1.233623] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 251 0' and write .xz files to it.
> [    1.235065] rbtree testing
> [    1.235065] rbtree testing -> 8733 cycles
>  -> 8733 cycles
> [    1.587988] augmented rbtree testing
> [    1.587988] augmented rbtree testing -> 12125 cycles
>  -> 12125 cycles
> [    2.078397] vmlfb: initializing
> [    2.078397] vmlfb: initializing
> [    2.078900] Could not find Carillo Ranch MCH device.
> [    2.078900] Could not find Carillo Ranch MCH device.
> [    2.079797] usbcore: registered new interface driver udlfb
> [    2.079797] usbcore: registered new interface driver udlfb
> [    2.080744] usbcore: registered new interface driver smscufx
> [    2.080744] usbcore: registered new interface driver smscufx
> [    2.081728] ipmi message handler version 39.2
> [    2.081728] ipmi message handler version 39.2
> [    2.082423] ipmi device interface
> [    2.082423] ipmi device interface
> [    2.082959] IPMI System Interface driver.
> [    2.082959] IPMI System Interface driver.
> [    2.083685] ipmi_si: Adding default-specified kcs state machine
> [    2.083685] ipmi_si: Adding default-specified kcs state machine
> =

> [    2.084627] ipmi_si: Trying default-specified kcs state machine at i/o=
 address 0xca2, slave address 0x0, irq 0
> [    2.084627] ipmi_si: Trying default-specified kcs state machine at i/o=
 address 0xca2, slave address 0x0, irq 0
> [    2.086133] ipmi_si: Interface detection failed
> [    2.086133] ipmi_si: Interface detection failed
> [    2.150060] ipmi_si: Adding default-specified smic state machine
> [    2.150060] ipmi_si: Adding default-specified smic state machine
> =

> [    2.150979] ipmi_si: Trying default-specified smic state machine at i/=
o address 0xca9, slave address 0x0, irq 0
> [    2.150979] ipmi_si: Trying default-specified smic state machine at i/=
o address 0xca9, slave address 0x0, irq 0
> [    2.152636] ipmi_si: Interface detection failed
> [    2.152636] ipmi_si: Interface detection failed
> [    2.200073] ipmi_si: Adding default-specified bt state machine
> [    2.200073] ipmi_si: Adding default-specified bt state machine
> =

> [    2.201068] ipmi_si: Trying default-specified bt state machine at i/o =
address 0xe4, slave address 0x0, irq 0
> [    2.201068] ipmi_si: Trying default-specified bt state machine at i/o =
address 0xe4, slave address 0x0, irq 0
> [    2.202619] ipmi_si: Interface detection failed
> [    2.202619] ipmi_si: Interface detection failed
> [    2.280131] ipmi_si: Unable to find any System Interface(s)
> [    2.280131] ipmi_si: Unable to find any System Interface(s)
> [    2.281064] Copyright (C) 2004 MontaVista Software - IPMI Powerdown vi=
a sys_reboot.
> [    2.281064] Copyright (C) 2004 MontaVista Software - IPMI Powerdown vi=
a sys_reboot.
> [    2.282358] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    2.282358] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    2.283442] ACPI: Power Button [PWRF]
> [    2.283442] ACPI: Power Button [PWRF]
> [    2.284393] xenfs: not registering filesystem on non-xen platform
> [    2.284393] xenfs: not registering filesystem on non-xen platform
> [    2.285626] HDLC line discipline maxframe=3D4096
> [    2.285626] HDLC line discipline maxframe=3D4096
> [    2.286422] N_HDLC line discipline registered.
> [    2.286422] N_HDLC line discipline registered.
> [    2.287109] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    2.287109] r3964: Philips r3964 Driver $Revision: 1.10 $
> [    2.287969] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    2.287969] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    2.313789] serial 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D=
 115200) is a 16550A
> [    2.313789] serial 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D=
 115200) is a 16550A
> [    2.315837] Cyclades driver 2.6
> [    2.315837] Cyclades driver 2.6
> [    2.336547] MOXA Smartio/Industio family driver version 2.0.5
> [    2.336547] MOXA Smartio/Industio family driver version 2.0.5
> [    2.337467] Initializing Nozomi driver 2.1d
> [    2.337467] Initializing Nozomi driver 2.1d
> [    2.338136] RocketPort device driver module, version 2.09, 12-June-2003
> [    2.338136] RocketPort device driver module, version 2.09, 12-June-2003
> [    2.339157] No rocketport ports found; unloading driver
> [    2.339157] No rocketport ports found; unloading driver
> [    2.339974] SyncLink GT
> [    2.339974] SyncLink GT
> [    2.340429] SyncLink GT, tty major#243
> [    2.340429] SyncLink GT, tty major#243
> [    2.341022] SyncLink GT no devices found
> [    2.341022] SyncLink GT no devices found
> [    2.341583] SyncLink serial driver $Revision: 4.38 $
> [    2.341583] SyncLink serial driver $Revision: 4.38 $
> [    2.346612] SyncLink serial driver $Revision: 4.38 $, tty major#242
> [    2.346612] SyncLink serial driver $Revision: 4.38 $, tty major#242
> [    2.347716] DoubleTalk PC - not found
> [    2.347716] DoubleTalk PC - not found
> [    2.348324] sonypi: Sony Programmable I/O Controller Driver v1.26.
> [    2.348324] sonypi: Sony Programmable I/O Controller Driver v1.26.
> [    2.349309] Non-volatile memory driver v1.3
> [    2.349309] Non-volatile memory driver v1.3
> [    2.349967] toshiba: not a supported Toshiba laptop
> [    2.349967] toshiba: not a supported Toshiba laptop
> [    2.350827] platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver Initi=
alizing
> [    2.350827] platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver Initi=
alizing
> [    2.351948] platform pc8736x_gpio.0: no device found
> [    2.351948] platform pc8736x_gpio.0: no device found
> [    2.352754] nsc_gpio initializing
> [    2.352754] nsc_gpio initializing
> [    2.353276] smapi::smapi_init, ERROR invalid usSmapiID
> [    2.353276] smapi::smapi_init, ERROR invalid usSmapiID
> [    2.354053] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    2.354053] mwave: tp3780i::tp3780I_InitializeBoardData: Error: SMAPI =
is not available on this machine
> [    2.355485] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    2.355485] mwave: mwavedd::mwave_init: Error: Failed to initialize bo=
ard data
> [    2.356585] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    2.356585] mwave: mwavedd::mwave_init: Error: Failed to initialize
> [    2.357543] Linux agpgart interface v0.103
> [    2.357543] Linux agpgart interface v0.103
> [    2.358335] SyncLink PC Card driver $Revision: 4.34 $, tty major#241
> [    2.358335] SyncLink PC Card driver $Revision: 4.34 $, tty major#241
> [    2.359353] [drm] Initialized drm 1.1.0 20060810
> [    2.359353] [drm] Initialized drm 1.1.0 20060810
> [    2.360079] [drm] radeon kernel modesetting enabled.
> [    2.360079] [drm] radeon kernel modesetting enabled.
> [    2.361235] [TTM] Zone  kernel: Available graphics memory: 134830 kiB
> [    2.361235] [TTM] Zone  kernel: Available graphics memory: 134830 kiB
> [    2.362225] [TTM] Initializing pool allocator
> [    2.362225] [TTM] Initializing pool allocator
> [    2.362888] [TTM] Initializing DMA pool allocator
> [    2.362888] [TTM] Initializing DMA pool allocator
> [    2.364522] [drm] fb mappable at 0xFC000000
> [    2.364522] [drm] fb mappable at 0xFC000000
> [    2.365155] [drm] vram aper at 0xFC000000
> [    2.365155] [drm] vram aper at 0xFC000000
> [    2.365743] [drm] size 33554432
> [    2.365743] [drm] size 33554432
> [    2.366226] [drm] fb depth is 24
> [    2.366226] [drm] fb depth is 24
> [    2.366727] [drm]    pitch is 3072
> [    2.366727] [drm]    pitch is 3072
> [    2.367297] cirrus 0000:00:02.0: fb0: cirrusdrmfb frame buffer device
> [    2.367297] cirrus 0000:00:02.0: fb0: cirrusdrmfb frame buffer device
> [    2.368266] cirrus 0000:00:02.0: registered panic notifier
> [    2.368266] cirrus 0000:00:02.0: registered panic notifier
> [    2.380024] [drm] Initialized cirrus 1.0.0 20110418 for 0000:00:02.0 o=
n minor 0
> [    2.380024] [drm] Initialized cirrus 1.0.0 20110418 for 0000:00:02.0 o=
n minor 0
> [    2.381380] lkdtm: No crash points registered, enable through debugfs
> [    2.381380] lkdtm: No crash points registered, enable through debugfs
> [    2.382487] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [    2.382487] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [    2.383667] c2port c2port0: C2 port uc added
> [    2.383667] c2port c2port0: C2 port uc added
> [    2.384312] c2port c2port0: uc flash has 30 blocks x 512 bytes (15360 =
bytes total)
> [    2.384312] c2port c2port0: uc flash has 30 blocks x 512 bytes (15360 =
bytes total)
> [    2.385586] usbcore: registered new interface driver rtsx_usb
> [    2.385586] usbcore: registered new interface driver rtsx_usb
> [    2.386732] usbcore: registered new interface driver viperboard
> [    2.386732] usbcore: registered new interface driver viperboard
> [    2.387725] hp_sw: device handler registered
> [    2.387725] hp_sw: device handler registered
> [    2.388379] emc: device handler registered
> [    2.388379] emc: device handler registered
> [    2.389014] alua: device handler registered
> [    2.389014] alua: device handler registered
> [    2.389622] osst :I: Tape driver with OnStream support version 0.99.4
> [    2.389622] osst :I: $Id: osst.c,v 1.73 2005/01/01 21:13:34 wriede Exp=
 $
> [    2.389622] osst :I: Tape driver with OnStream support version 0.99.4
> [    2.389622] osst :I: $Id: osst.c,v 1.73 2005/01/01 21:13:34 wriede Exp=
 $
> [    2.391552] SCSI Media Changer driver v0.25 =

> [    2.391552] SCSI Media Changer driver v0.25 =

> [    2.392242] osd: LOADED open-osd 0.2.1
> [    2.392242] osd: LOADED open-osd 0.2.1
> [    2.393020] Rounding down aligned max_sectors from 4294967295 to 42949=
67288
> [    2.393020] Rounding down aligned max_sectors from 4294967295 to 42949=
67288
> [    2.394470] SSFDC read-only Flash Translation layer
> [    2.394470] SSFDC read-only Flash Translation layer
> [    2.395351] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    2.395351] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    2.396351] L440GX flash mapping: failed to find PIIX4 ISA bridge, can=
not continue
> [    2.396351] L440GX flash mapping: failed to find PIIX4 ISA bridge, can=
not continue
> [    2.397501] platform physmap-flash.0: failed to claim resource 0
> [    2.397501] platform physmap-flash.0: failed to claim resource 0
> [    2.398444] slram: not enough parameters.
> [    2.398444] slram: not enough parameters.
> [    2.399064] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Norte=
l Networks.
> [    2.399064] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Norte=
l Networks.
> [    2.400183] pmc551: not detected
> [    2.400183] pmc551: not detected
> [    2.401480] ftl_cs: FTL header not found.
> [    2.401480] ftl_cs: FTL header not found.
> [    2.437091] No valid DiskOnChip devices found
> [    2.437091] No valid DiskOnChip devices found
> [    2.438126] Intel ISA PCIC probe: =

> [    2.438126] Intel ISA PCIC probe: not found.
> not found.
> [    2.438881] Databook TCIC-2 PCMCIA probe: =

> [    2.438881] Databook TCIC-2 PCMCIA probe: not found.
> not found.
> [    2.439755] usbcore: registered new interface driver hwa-rc
> [    2.439755] usbcore: registered new interface driver hwa-rc
> [    2.440702] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.440702] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    2.441662] ehci-pci: EHCI PCI platform driver
> [    2.441662] ehci-pci: EHCI PCI platform driver
> [    2.442346] ehci-platform: EHCI generic platform driver
> [    2.442346] ehci-platform: EHCI generic platform driver
> [    2.443177] uhci_hcd: USB Universal Host Controller Interface driver
> [    2.443177] uhci_hcd: USB Universal Host Controller Interface driver
> [    2.444128] driver u132_hcd
> [    2.444128] driver u132_hcd
> [    2.444740] fotg210_hcd: FOTG210 Host Controller (EHCI) Driver
> [    2.444740] fotg210_hcd: FOTG210 Host Controller (EHCI) Driver
> [    2.447100] usbcore: registered new interface driver cdc_acm
> [    2.447100] usbcore: registered new interface driver cdc_acm
> [    2.447964] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
> [    2.447964] cdc_acm: USB Abstract Control Model driver for USB modems =
and ISDN adapters
> [    2.449179] usbcore: registered new interface driver cdc_wdm
> [    2.449179] usbcore: registered new interface driver cdc_wdm
> [    2.450055] usbcore: registered new interface driver usbtmc
> [    2.450055] usbcore: registered new interface driver usbtmc
> [    2.450913] usbcore: registered new interface driver mdc800
> [    2.450913] usbcore: registered new interface driver mdc800
> [    2.451726] mdc800: v0.7.5 (30/10/2000):USB Driver for Mustek MDC800 D=
igital Camera
> [    2.451726] mdc800: v0.7.5 (30/10/2000):USB Driver for Mustek MDC800 D=
igital Camera
> [    2.452884] usbcore: registered new interface driver microtekX6
> [    2.452884] usbcore: registered new interface driver microtekX6
> [    2.453761] usbcore: registered new interface driver cypress_cy7c63
> [    2.453761] usbcore: registered new interface driver cypress_cy7c63
> [    2.454685] usbcore: registered new interface driver cytherm
> [    2.454685] usbcore: registered new interface driver cytherm
> [    2.455513] usbcore: registered new interface driver emi26 - firmware =
loader
> [    2.455513] usbcore: registered new interface driver emi26 - firmware =
loader
> [    2.456576] ftdi_elan: driver ftdi-elan
> [    2.456576] ftdi_elan: driver ftdi-elan
> [    2.457343] usbcore: registered new interface driver ftdi-elan
> [    2.457343] usbcore: registered new interface driver ftdi-elan
> [    2.458242] usbcore: registered new interface driver isight_firmware
> [    2.458242] usbcore: registered new interface driver isight_firmware
> [    2.459180] usbcore: registered new interface driver usblcd
> [    2.459180] usbcore: registered new interface driver usblcd
> [    2.460028] usbcore: registered new interface driver ldusb
> [    2.460028] usbcore: registered new interface driver ldusb
> [    2.460876] usbcore: registered new interface driver usbled
> [    2.460876] usbcore: registered new interface driver usbled
> [    2.461704] usbcore: registered new interface driver rio500
> [    2.461704] usbcore: registered new interface driver rio500
> [    2.462521] usbcore: registered new interface driver trancevibrator
> [    2.462521] usbcore: registered new interface driver trancevibrator
> [    2.463455] usbcore: registered new interface driver yurex
> [    2.463455] usbcore: registered new interface driver yurex
> [    2.464317] usbcore: registered new interface driver sisusb
> [    2.464317] usbcore: registered new interface driver sisusb
> [    2.465179] usbcore: registered new interface driver lvs
> [    2.465179] usbcore: registered new interface driver lvs
> [    2.466100] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    2.466100] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    2.467870] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    2.467870] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    2.468778] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    2.468778] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    2.469715] mousedev: PS/2 mouse device common for all mice
> [    2.469715] mousedev: PS/2 mouse device common for all mice
> [    2.470667] evbug: Connected device: input0 (Power Button at LNXPWRBN/=
button/input0)
> [    2.470667] evbug: Connected device: input0 (Power Button at LNXPWRBN/=
button/input0)
> [    2.472088] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    2.472088] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    2.473412] evbug: Connected device: input1 (AT Translated Set 2 keybo=
ard at isa0060/serio0/input0)
> [    2.473412] evbug: Connected device: input1 (AT Translated Set 2 keybo=
ard at isa0060/serio0/input0)
> [    2.475076] usbcore: registered new interface driver appletouch
> [    2.475076] usbcore: registered new interface driver appletouch
> [    2.475999] inport.c: Didn't find InPort mouse at 0x23c
> [    2.475999] inport.c: Didn't find InPort mouse at 0x23c
> [    2.476899] logibm.c: Didn't find Logitech busmouse at 0x23c
> [    2.476899] logibm.c: Didn't find Logitech busmouse at 0x23c
> [    2.478028] usbcore: registered new interface driver usb_acecad
> [    2.478028] usbcore: registered new interface driver usb_acecad
> [    2.478979] usbcore: registered new interface driver aiptek
> [    2.478979] usbcore: registered new interface driver aiptek
> [    2.479831] usbcore: registered new interface driver gtco
> [    2.479831] usbcore: registered new interface driver gtco
> [    2.480761] usbcore: registered new interface driver kbtab
> [    2.480761] usbcore: registered new interface driver kbtab
> [    2.483334] mk712: device not present
> [    2.483334] mk712: device not present
> [    2.483950] usbcore: registered new interface driver sur40
> [    2.483950] usbcore: registered new interface driver sur40
> [    2.484914] I2O subsystem v1.325
> [    2.484914] I2O subsystem v1.325
> [    2.485423] i2o: max drivers =3D 8
> [    2.485423] i2o: max drivers =3D 8
> [    2.486030] I2O Bus Adapter OSM v1.317
> [    2.486030] I2O Bus Adapter OSM v1.317
> [    2.486633] I2O Block Device OSM v1.325
> [    2.486633] I2O Block Device OSM v1.325
> [    2.487362] I2O SCSI Peripheral OSM v1.316
> [    2.487362] I2O SCSI Peripheral OSM v1.316
> [    2.488052] I2O ProcFS OSM v1.316
> [    2.488052] I2O ProcFS OSM v1.316
> [    2.488715] rtc_cmos 00:00: RTC can wake from S4
> [    2.488715] rtc_cmos 00:00: RTC can wake from S4
> [    2.489680] rtc (null): alarm rollover: day
> [    2.489680] rtc (null): alarm rollover: day
> [    2.490427] rtc_cmos 00:00: rtc core: registered rtc_cmos as rtc0
> [    2.490427] rtc_cmos 00:00: rtc core: registered rtc_cmos as rtc0
> [    2.491526] rtc_cmos 00:00: alarms up to one day, 114 bytes nvram, hpe=
t irqs
> [    2.491526] rtc_cmos 00:00: alarms up to one day, 114 bytes nvram, hpe=
t irqs
> [    2.493113] rtc (null): invalid alarm value: 1900-1-17 0:0:0
> [    2.493113] rtc (null): invalid alarm value: 1900-1-17 0:0:0
> [    2.494040] rtc-test rtc-test.0: rtc core: registered test as rtc1
> [    2.494040] rtc-test rtc-test.0: rtc core: registered test as rtc1
> [    2.495082] rtc (null): invalid alarm value: 1900-1-17 0:0:0
> [    2.495082] rtc (null): invalid alarm value: 1900-1-17 0:0:0
> [    2.495976] rtc-test rtc-test.1: rtc core: registered test as rtc2
> [    2.495976] rtc-test rtc-test.1: rtc core: registered test as rtc2
> [    2.497583] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, =
revision 0
> [    2.497583] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, =
revision 0
> [    2.750331] usbcore: registered new interface driver i2c-diolan-u2c
> [    2.750331] usbcore: registered new interface driver i2c-diolan-u2c
> [    2.751337] usbcore: registered new interface driver RobotFuzz Open So=
urce InterFace, OSIF
> [    2.751337] usbcore: registered new interface driver RobotFuzz Open So=
urce InterFace, OSIF
> [    2.752625] usbcore: registered new interface driver i2c-tiny-usb
> [    2.752625] usbcore: registered new interface driver i2c-tiny-usb
> [    2.753649] isa i2c-pca-isa.0: Please specify I/O base
> [    2.753649] isa i2c-pca-isa.0: Please specify I/O base
> [    2.754644] pps pps0: new PPS source ktimer
> [    2.754644] pps pps0: new PPS source ktimer
> [    2.755336] pps pps0: ktimer PPS source registered
> [    2.755336] pps pps0: ktimer PPS source registered
> [    2.756104] Driver for 1-wire Dallas network protocol.
> [    2.756104] Driver for 1-wire Dallas network protocol.
> [    2.756963] usbcore: registered new interface driver DS9490R
> [    2.756963] usbcore: registered new interface driver DS9490R
> [    2.757899] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> [    2.757899] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
> [    3.111441] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input3
> [    3.111441] input: ImExPS/2 Generic Explorer Mouse as /devices/platfor=
m/i8042/serio1/input/input3
> [    3.113020] evbug: Connected device: input3 (ImExPS/2 Generic Explorer=
 Mouse at isa0060/serio1/input0)
> [    3.113020] evbug: Connected device: input3 (ImExPS/2 Generic Explorer=
 Mouse at isa0060/serio1/input0)
> [    3.710087] applesmc: supported laptop not found!
> [    3.710087] applesmc: supported laptop not found!
> [    3.710851] applesmc: driver init failed (ret=3D-19)!
> [    3.710851] applesmc: driver init failed (ret=3D-19)!
> [    6.030337] pc87360: PC8736x not detected, module not inserted
> [    6.030337] pc87360: PC8736x not detected, module not inserted
> [    6.230427] usbcore: registered new interface driver pcwd_usb
> [    6.230427] usbcore: registered new interface driver pcwd_usb
> [    6.231429] acquirewdt: WDT driver for Acquire single board computer i=
nitialising
> [    6.231429] acquirewdt: WDT driver for Acquire single board computer i=
nitialising
> [    6.232762] acquirewdt: I/O address 0x0043 already in use
> [    6.232762] acquirewdt: I/O address 0x0043 already in use
> [    6.233642] acquirewdt: probe of acquirewdt failed with error -5
> [    6.233642] acquirewdt: probe of acquirewdt failed with error -5
> [    6.234629] advantechwdt: WDT driver for Advantech single board comput=
er initialising
> [    6.234629] advantechwdt: WDT driver for Advantech single board comput=
er initialising
> [    6.236014] advantechwdt: initialized. timeout=3D60 sec (nowayout=3D0)
> [    6.236014] advantechwdt: initialized. timeout=3D60 sec (nowayout=3D0)
> [    6.237020] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [    6.237020] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [    6.238178] ib700wdt: START method I/O 443 is not available
> [    6.238178] ib700wdt: START method I/O 443 is not available
> [    6.239099] ib700wdt: probe of ib700wdt failed with error -5
> [    6.239099] ib700wdt: probe of ib700wdt failed with error -5
> [    6.240063] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
> [    6.240063] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
> [    6.241101] i6300esb: cannot register miscdev on minor=3D130 (err=3D-1=
6)
> [    6.241101] i6300esb: cannot register miscdev on minor=3D130 (err=3D-1=
6)
> [    6.242197] i6300ESB timer: probe of 0000:00:04.0 failed with error -16
> [    6.242197] i6300ESB timer: probe of 0000:00:04.0 failed with error -16
> [    6.243259] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    6.243259] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    6.244127] iTCO_vendor_support: vendor-support=3D0
> [    6.244127] iTCO_vendor_support: vendor-support=3D0
> [    6.244886] it87_wdt: no device
> [    6.244886] it87_wdt: no device
> [    6.245400] pc87413_wdt: Version 1.1 at io 0x2E
> [    6.245400] pc87413_wdt: Version 1.1 at io 0x2E
> [    6.246117] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.246117] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.247300] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [    6.247300] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [    6.248173] sbc8360: failed to register misc device
> [    6.248173] sbc8360: failed to register misc device
> [    6.248950] sbc7240_wdt: I/O address 0x0443 already in use
> [    6.248950] sbc7240_wdt: I/O address 0x0443 already in use
> [    6.249878] w83877f_wdt: I/O address 0x0443 already in use
> [    6.249878] w83877f_wdt: I/O address 0x0443 already in use
> [    6.250743] w83977f_wdt: driver v1.00
> [    6.250743] w83977f_wdt: driver v1.00
> [    6.251343] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.251343] w83977f_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    6.252429] machzwd: MachZ ZF-Logic Watchdog driver initializing
> [    6.252429] machzwd: MachZ ZF-Logic Watchdog driver initializing
> [    6.253423] machzwd: no ZF-Logic found
> [    6.253423] machzwd: no ZF-Logic found
> [    6.254052] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D=
-16)
> [    6.254052] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D=
-16)
> [    6.255234] watchdog: Software Watchdog: cannot register miscdev on mi=
nor=3D130 (err=3D-16).
> [    6.255234] watchdog: Software Watchdog: cannot register miscdev on mi=
nor=3D130 (err=3D-16).
> [    6.256514] watchdog: Software Watchdog: a legacy watchdog module is p=
robably present.
> [    6.256514] watchdog: Software Watchdog: a legacy watchdog module is p=
robably present.
> [    6.257880] softdog: Software Watchdog Timer: 0.08 initialized. soft_n=
oboot=3D0 soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D0)
> [    6.257880] softdog: Software Watchdog Timer: 0.08 initialized. soft_n=
oboot=3D0 soft_margin=3D60 sec soft_panic=3D0 (nowayout=3D0)
> [    6.259781] leds_ss4200: no LED devices found
> [    6.259781] leds_ss4200: no LED devices found
> [    6.280348] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    6.280348] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    6.281651] Driver for HIFN 795x crypto accelerator chip has been succ=
essfully registered.
> [    6.281651] Driver for HIFN 795x crypto accelerator chip has been succ=
essfully registered.
> [    6.283558] usbcore: registered new interface driver usbkbd
> [    6.283558] usbcore: registered new interface driver usbkbd
> [    6.284484] Initializing Realtek PCIE storage driver...
> [    6.284484] Initializing Realtek PCIE storage driver...
> [    6.285332] vme_user: VME User Space Access Driver
> [    6.285332] vme_user: VME User Space Access Driver
> [    6.286077] vme_user: No cards, skipping registration
> [    6.286077] vme_user: No cards, skipping registration
> [    6.287075] ashmem: initialized
> [    6.287075] ashmem: initialized
> [    6.287694] logger: created 256K log 'log_main'
> [    6.287694] logger: created 256K log 'log_main'
> [    6.288460] logger: created 256K log 'log_events'
> [    6.288460] logger: created 256K log 'log_events'
> [    6.289310] logger: created 256K log 'log_radio'
> [    6.289310] logger: created 256K log 'log_radio'
> [    6.290160] logger: created 256K log 'log_system'
> [    6.290160] logger: created 256K log 'log_system'
> [    6.291194] dgap: dgap-1.3-16, Digi International Part Number 40002347=
_C
> [    6.291194] dgap: dgap-1.3-16, Digi International Part Number 40002347=
_C
> [    6.292309] dgap: For the tools package please visit http://www.digi.c=
om
> [    6.292309] dgap: For the tools package please visit http://www.digi.c=
om
> [    6.293486] FPGA DOWNLOAD --->
> [    6.293486] FPGA DOWNLOAD --->
> [    6.293982] FPGA image file name: xlinx_fpga_firmware.bit
> [    6.293982] FPGA image file name: xlinx_fpga_firmware.bit
> [    6.294860] GPIO INIT FAIL!!
> [    6.294860] GPIO INIT FAIL!!
> [    6.296368] ... APIC ID:      00000000 (0)
> [    6.296368] ... APIC ID:      00000000 (0)
> [    6.297444] ... APIC VERSION: 01050014
> [    6.297444] ... APIC VERSION: 01050014
> [    6.298056] 00000000
> [    6.298056] 0000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000000000000000000
> =

> [    6.299226] 00000000
> [    6.299226] 000000000e2000000e2000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000000000000000000000
> =

> [    6.300417] 00000000
> [    6.300417] 0000000000000000000000000000000000000000000000000000000000=
00000000000000000000000000000000000000000000002000800020008000
> =

> [    6.301628] =

> [    6.301628] =

> [    6.301867] number of MP IRQ sources: 15.
> [    6.301867] number of MP IRQ sources: 15.
> [    6.302527] number of IO-APIC #0 registers: 24.
> [    6.302527] number of IO-APIC #0 registers: 24.
> [    6.303284] testing the IO APIC.......................
> [    6.303284] testing the IO APIC.......................
> [    6.304115] IO APIC #0......
> [    6.304115] IO APIC #0......
> [    6.304592] .... register #00: 00000000
> [    6.304592] .... register #00: 00000000
> [    6.305195] .......    : physical APIC id: 00
> [    6.305195] .......    : physical APIC id: 00
> [    6.305883] .......    : Delivery Type: 0
> [    6.305883] .......    : Delivery Type: 0
> [    6.306485] .......    : LTS          : 0
> [    6.306485] .......    : LTS          : 0
> [    6.307082] .... register #01: 00170011
> [    6.307082] .... register #01: 00170011
> [    6.307659] .......     : max redirection entries: 17
> [    6.307659] .......     : max redirection entries: 17
> [    6.308453] .......     : PRQ implemented: 0
> [    6.308453] .......     : PRQ implemented: 0
> [    6.309214] .......     : IO APIC version: 11
> [    6.309214] .......     : IO APIC version: 11
> [    6.309907] .... register #02: 00000000
> [    6.309907] .... register #02: 00000000
> [    6.310574] .......     : arbitration: 00
> [    6.310574] .......     : arbitration: 00
> [    6.311265] .... IRQ redirection table:
> [    6.311265] .... IRQ redirection table:
> [    6.311890] 1    0    0   0   0    0    0    00
> [    6.311890] 1    0    0   0   0    0    0    00
> [    6.312674] 0    0    0   0   0    1    1    31
> [    6.312674] 0    0    0   0   0    1    1    31
> [    6.313421] 0    0    0   0   0    1    1    30
> [    6.313421] 0    0    0   0   0    1    1    30
> [    6.314162] 0    0    0   0   0    1    1    33
> [    6.314162] 0    0    0   0   0    1    1    33
> [    6.314917] 1    0    0   0   0    1    1    34
> [    6.314917] 1    0    0   0   0    1    1    34
> [    6.315676] 1    1    0   0   0    1    1    35
> [    6.315676] 1    1    0   0   0    1    1    35
> [    6.316407] 0    0    0   0   0    1    1    36
> [    6.316407] 0    0    0   0   0    1    1    36
> [    6.317151] 0    0    0   0   0    1    1    37
> [    6.317151] 0    0    0   0   0    1    1    37
> [    6.317902] 0    0    0   0   0    1    1    38
> [    6.317902] 0    0    0   0   0    1    1    38
> [    6.318673] 0    1    0   0   0    1    1    39
> [    6.318673] 0    1    0   0   0    1    1    39
> [    6.319374] 1    1    0   0   0    1    1    3A
> [    6.319374] 1    1    0   0   0    1    1    3A
> [    6.320143] 1    1    0   0   0    1    1    3B
> [    6.320143] 1    1    0   0   0    1    1    3B
> [    6.320874] 0    0    0   0   0    1    1    3C
> [    6.320874] 0    0    0   0   0    1    1    3C
> [    6.321610] 0    0    0   0   0    1    1    3D
> [    6.321610] 0    0    0   0   0    1    1    3D
> [    6.322331] 0    0    0   0   0    1    1    3E
> [    6.322331] 0    0    0   0   0    1    1    3E
> [    6.323029] 0    0    0   0   0    1    1    3F
> [    6.323029] 0    0    0   0   0    1    1    3F
> [    6.323731] 1    0    0   0   0    0    0    00
> [    6.323731] 1    0    0   0   0    0    0    00
> [    6.324426] 1    0    0   0   0    0    0    00
> [    6.324426] 1    0    0   0   0    0    0    00
> [    6.325122] 1    0    0   0   0    0    0    00
> [    6.325122] 1    0    0   0   0    0    0    00
> [    6.325883] 1    0    0   0   0    0    0    00
> [    6.325883] 1    0    0   0   0    0    0    00
> [    6.326610] 1    0    0   0   0    0    0    00
> [    6.326610] 1    0    0   0   0    0    0    00
> [    6.327324] 1    0    0   0   0    0    0    00
> [    6.327324] 1    0    0   0   0    0    0    00
> [    6.328059] 1    0    0   0   0    0    0    00
> [    6.328059] 1    0    0   0   0    0    0    00
> [    6.328831] 1    0    0   0   0    0    0    00
> [    6.328831] 1    0    0   0   0    0    0    00
> [    6.329525] IRQ to pin mappings:
> [    6.329525] IRQ to pin mappings:
> [    6.330035] IRQ0 =

> [    6.330035] IRQ0 -> 0:2-> 0:2
> =

> [    6.330437] IRQ1 =

> [    6.330437] IRQ1 -> 0:1-> 0:1
> =

> [    6.330845] IRQ3 =

> [    6.330845] IRQ3 -> 0:3-> 0:3
> =

> [    6.331252] IRQ4 =

> [    6.331252] IRQ4 -> 0:4-> 0:4
> =

> [    6.331696] IRQ5 =

> [    6.331696] IRQ5 -> 0:5-> 0:5
> =

> [    6.332088] IRQ6 =

> [    6.332088] IRQ6 -> 0:6-> 0:6
> =

> [    6.332482] IRQ7 =

> [    6.332482] IRQ7 -> 0:7-> 0:7
> =

> [    6.332917] IRQ8 =

> [    6.332917] IRQ8 -> 0:8-> 0:8
> =

> [    6.333344] IRQ9 =

> [    6.333344] IRQ9 -> 0:9-> 0:9
> =

> [    6.333755] IRQ10 =

> [    6.333755] IRQ10 -> 0:10-> 0:10
> =

> [    6.334167] IRQ11 =

> [    6.334167] IRQ11 -> 0:11-> 0:11
> =

> [    6.334611] IRQ12 =

> [    6.334611] IRQ12 -> 0:12-> 0:12
> =

> [    6.335042] IRQ13 =

> [    6.335042] IRQ13 -> 0:13-> 0:13
> =

> [    6.335462] IRQ14 =

> [    6.335462] IRQ14 -> 0:14-> 0:14
> =

> [    6.335894] IRQ15 =

> [    6.335894] IRQ15 -> 0:15-> 0:15
> =

> [    6.336350] .................................... done.
> [    6.336350] .................................... done.
> [    6.337182] Using IPI No-Shortcut mode
> [    6.337182] Using IPI No-Shortcut mode
> [    6.337973] bootconsole [earlyser0] disabled
> [    6.337973] bootconsole [earlyser0] disabled
> [    6.339042] Key type encrypted registered
> [    6.339871] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> [    6.340370] EDD information not available.
> [    6.340920] debug: unmapping init [mem 0xc1d5c000-0xc1f3efff]
> [    6.341575] Write protecting the kernel text: 8748k
> [    6.342037] Write protecting the kernel read-only data: 4048k
> [    6.342469] NX-protecting the kernel data: 7636k
> [    6.346492] random: init urandom read with 4 bits of entropy available
> /bin/sh: /proc/self/fd/9: No such file or directory
> /bin/sh: /proc/self/fd/9: No such file or directory
> /bin/sh: /proc/s
> [   16.467883] sock: process `trinity-main' is using obsolete setsockopt =
SO_BSDCOMPAT
> [   60.990065] Writes:  Total: 4  Max/Min: 0/0   Fail: 0 =

> plymouth-upstart-bridge: ply-event-loop.c:497: ply_event_loop_new: Assert=
ion `loop->epoll_fd >=3D 0' failed.
> /etc/lsb-base-logging.sh: line 5:   148 Aborted                 plymouth =
--ping > /dev/null 2>&1
> /etc/lsb-base-logging.sh: line 5:   153 Aborted                 plymouth =
--ping > /dev/null 2>&1
> mount: proc has wrong device number or fs type proc not supported
> /etc/lsb-base-logging.sh: line 5:   169 Aborted                 plymouth =
--ping > /dev/null 2>&1
> /etc/rc6.d/S40umountfs: line 20: /proc/mounts: No such file or directory
> cat: /proc/1/maps: No such file or directory
> cat: /proc/1/maps: No such file or directory
> cat: /proc/1/maps: No such file or directory
> cat: /proc/1/maps: No such file or directory
> cat: /proc/1/maps: No such file or directory
> cat: /proc/1/maps: No such file or directory
> umount: /var/run: not mounted
> umount: /var/lock: not mounted
> umount: /dev/shm: not mounted
> mount: / is busy
>  * Will now restart
> [   71.562671] Unregister pv shared memory for cpu 1
> [   71.563035] Unregister pv shared memory for cpu 0
> [   71.563417] spin_lock-torture: Unscheduled system shutdown detected
> [   71.563852] no ifx modem active;
> [   71.564662] reboot: Restarting system
> [   71.564942] reboot: machine restart
> Elapsed time: 75
> qemu-system-x86_64 -cpu kvm64 -enable-kvm -kernel /kernel/i386-randconfig=
-r2-0217/4da4e28818f5017c96f0fde72d643e965ac78253/vmlinuz-3.19.0-rc1-00098-=
g4da4e28 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,115200 rd.udev.lo=
g-priority=3Derr systemd.log_target=3Djournal systemd.log_level=3Dwarning d=
ebug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100=
 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ram=
disk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnor=
mal  root=3D/dev/ram0 rw link=3D/kbuild-tests/run-queue/kvm/i386-randconfig=
-r2-0217/rcu:rcu:dev/.vmlinuz-4da4e28818f5017c96f0fde72d643e965ac78253-2015=
0217110759-2-ivb41 branch=3Drcu/rcu/dev BOOT_IMAGE=3D/kernel/i386-randconfi=
g-r2-0217/4da4e28818f5017c96f0fde72d643e965ac78253/vmlinuz-3.19.0-rc1-00098=
-g4da4e28 drbd.minor_count=3D8'  -initrd /kernel-tests/initrd/quantal-core-=
i386.cgz -m 320 -smp 2 -net nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -=
boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -pidfil=
e /dev/shm/kboot/pid-quantal-ivb41-33 -serial file:/dev/shm/kboot/serial-qu=
antal-ivb41-33 -daemonize -display none -monitor null =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/i386 3.19.0-rc1 Kernel Configuration
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
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-ecx -fcall-saved-edx"
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
> CONFIG_KERNEL_LZMA=3Dy
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> # CONFIG_SYSVIPC is not set
> # CONFIG_POSIX_MQUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_FHANDLE is not set
> CONFIG_USELIB=3Dy
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
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_IRQ_DOMAIN_DEBUG=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
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
> CONFIG_NO_HZ_IDLE=3Dy
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> # CONFIG_TICK_CPU_ACCOUNTING is not set
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> # CONFIG_BSD_PROCESS_ACCT is not set
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_PREEMPT_RCU=3Dy
> CONFIG_SRCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FANOUT_EXACT is not set
> CONFIG_RCU_FAST_NO_HZ=3Dy
> CONFIG_TREE_RCU_TRACE=3Dy
> # CONFIG_RCU_BOOST is not set
> CONFIG_RCU_KTHREAD_PRIO=3D0
> CONFIG_RCU_NOCB_CPU=3Dy
> # CONFIG_RCU_NOCB_CPU_NONE is not set
> CONFIG_RCU_NOCB_CPU_ZERO=3Dy
> # CONFIG_RCU_NOCB_CPU_ALL is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> # CONFIG_CGROUP_FREEZER is not set
> # CONFIG_CGROUP_DEVICE is not set
> CONFIG_CPUSETS=3Dy
> # CONFIG_PROC_PID_CPUSET is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_DEBUG_BLK_CGROUP=3Dy
> CONFIG_CHECKPOINT_RESTORE=3Dy
> # CONFIG_NAMESPACES is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> # CONFIG_RD_BZIP2 is not set
> # CONFIG_RD_LZMA is not set
> # CONFIG_RD_XZ is not set
> # CONFIG_RD_LZO is not set
> # CONFIG_RD_LZ4 is not set
> CONFIG_INIT_FALLBACK=3Dy
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> # CONFIG_UID16 is not set
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> # CONFIG_EPOLL is not set
> # CONFIG_SIGNALFD is not set
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> # CONFIG_ADVISE_SYSCALLS is not set
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # CONFIG_VM_EVENT_COUNTERS is not set
> # CONFIG_SLUB_DEBUG is not set
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_PROFILING is not set
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
> CONFIG_MODULES_USE_ELF_REL=3Dy
> CONFIG_CLONE_BACKWARDS=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_OLD_SIGACTION=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> CONFIG_GCOV_KERNEL=3Dy
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_GCOV_PROFILE_ALL is not set
> CONFIG_GCOV_FORMAT_AUTODETECT=3Dy
> # CONFIG_GCOV_FORMAT_3_4 is not set
> # CONFIG_GCOV_FORMAT_4_7 is not set
> CONFIG_HAVE_GENERIC_DMA_COHERENT=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
> CONFIG_STOP_MACHINE=3Dy
> CONFIG_BLOCK=3Dy
> # CONFIG_LBDAF is not set
> CONFIG_BLK_DEV_BSG=3Dy
> # CONFIG_BLK_DEV_BSGLIB is not set
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_CMDLINE_PARSER is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> CONFIG_ACORN_PARTITION=3Dy
> CONFIG_ACORN_PARTITION_CUMANA=3Dy
> CONFIG_ACORN_PARTITION_EESOX=3Dy
> CONFIG_ACORN_PARTITION_ICS=3Dy
> # CONFIG_ACORN_PARTITION_ADFS is not set
> CONFIG_ACORN_PARTITION_POWERTEC=3Dy
> CONFIG_ACORN_PARTITION_RISCIX=3Dy
> CONFIG_AIX_PARTITION=3Dy
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
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
> CONFIG_EFI_PARTITION=3Dy
> CONFIG_SYSV68_PARTITION=3Dy
> # CONFIG_CMDLINE_PARTITION is not set
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_CFQ_GROUP_IOSCHED is not set
> CONFIG_DEFAULT_DEADLINE=3Dy
> # CONFIG_DEFAULT_CFQ is not set
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"deadline"
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUE_RWLOCK=3Dy
> CONFIG_QUEUE_RWLOCK=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_MPPARSE=3Dy
> CONFIG_X86_BIGSMP=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> # CONFIG_X86_32_IRIS is not set
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_PARAVIRT_DEBUG=3Dy
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> CONFIG_XEN=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_MAX_DOMAIN_MEMORY=3D64
> CONFIG_XEN_SAVE_RESTORE=3Dy
> CONFIG_XEN_DEBUG_FS=3Dy
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
> # CONFIG_M586MMX is not set
> # CONFIG_M686 is not set
> # CONFIG_MPENTIUMII is not set
> CONFIG_MPENTIUMIII=3Dy
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
> CONFIG_X86_INTEL_USERCOPY=3Dy
> CONFIG_X86_USE_PPRO_CHECKSUM=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> # CONFIG_CPU_SUP_INTEL is not set
> # CONFIG_CPU_SUP_CYRIX_32 is not set
> # CONFIG_CPU_SUP_AMD is not set
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> CONFIG_CPU_SUP_UMC_32=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D32
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> # CONFIG_PREEMPT_NONE is not set
> # CONFIG_PREEMPT_VOLUNTARY is not set
> CONFIG_PREEMPT=3Dy
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> # CONFIG_VM86 is not set
> # CONFIG_X86_16BIT is not set
> CONFIG_TOSHIBA=3Dy
> # CONFIG_I8K is not set
> CONFIG_X86_REBOOTFIXUPS=3Dy
> # CONFIG_MICROCODE_INTEL_EARLY is not set
> # CONFIG_MICROCODE_AMD_EARLY is not set
> # CONFIG_X86_MSR is not set
> CONFIG_X86_CPUID=3Dy
> CONFIG_NOHIGHMEM=3Dy
> # CONFIG_HIGHMEM4G is not set
> # CONFIG_HIGHMEM64G is not set
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
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
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
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
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> # CONFIG_MATH_EMULATION is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D0
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> # CONFIG_X86_PAT is not set
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_EFI is not set
> CONFIG_SECCOMP=3Dy
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_SCHED_HRTICK is not set
> CONFIG_KEXEC=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> # CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> # CONFIG_HIBERNATION is not set
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
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
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
> # CONFIG_SFI is not set
> CONFIG_X86_APM_BOOT=3Dy
> CONFIG_APM=3Dy
> CONFIG_APM_IGNORE_USER_SUSPEND=3Dy
> CONFIG_APM_DO_ENABLE=3Dy
> # CONFIG_APM_CPU_IDLE is not set
> # CONFIG_APM_DISPLAY_BLANK is not set
> # CONFIG_APM_ALLOW_INTS is not set
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
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
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
> CONFIG_PCI_XEN=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEAER_INJECT=3Dy
> CONFIG_PCIEASPM=3Dy
> # CONFIG_PCIEASPM_DEBUG is not set
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCI_MSI=3Dy
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy
> CONFIG_PCI_STUB=3Dy
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> # CONFIG_HT_IRQ is not set
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_IOV=3Dy
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_ISA=3Dy
> # CONFIG_EISA is not set
> # CONFIG_SCx200 is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> # CONFIG_GEOS is not set
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> # CONFIG_YENTA_O2 is not set
> # CONFIG_YENTA_RICOH is not set
> CONFIG_YENTA_TI=3Dy
> # CONFIG_YENTA_TOSHIBA is not set
> # CONFIG_PD6729 is not set
> CONFIG_I82092=3Dy
> CONFIG_I82365=3Dy
> CONFIG_TCIC=3Dy
> CONFIG_PCMCIA_PROBE=3Dy
> CONFIG_PCCARD_NONSTATIC=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> # CONFIG_RAPIDIO is not set
> CONFIG_X86_SYSFB=3Dy
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_ARCH_BINFMT_ELF_RANDOMIZE_PIE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_HAVE_AOUT=3Dy
> # CONFIG_BINFMT_AOUT is not set
> # CONFIG_BINFMT_MISC is not set
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
> # CONFIG_NET_MPLS_GSO is not set
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
> # CONFIG_STANDALONE is not set
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> CONFIG_FENCE_TRACE=3Dy
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> # CONFIG_MTD_REDBOOT_PARTS is not set
> # CONFIG_MTD_CMDLINE_PARTS is not set
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> # CONFIG_MTD_BLOCK is not set
> CONFIG_MTD_BLOCK_RO=3Dy
> CONFIG_FTL=3Dy
> CONFIG_NFTL=3Dy
> CONFIG_NFTL_RW=3Dy
> CONFIG_INFTL=3Dy
> # CONFIG_RFD_FTL is not set
> CONFIG_SSFDC=3Dy
> CONFIG_SM_FTL=3Dy
> CONFIG_MTD_OOPS=3Dy
> CONFIG_MTD_SWAP=3Dy
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
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
> CONFIG_MTD_CFI_AMDSTD=3Dy
> # CONFIG_MTD_CFI_STAA is not set
> CONFIG_MTD_CFI_UTIL=3Dy
> # CONFIG_MTD_RAM is not set
> CONFIG_MTD_ROM=3Dy
> # CONFIG_MTD_ABSENT is not set
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dy
> CONFIG_MTD_PHYSMAP_COMPAT=3Dy
> CONFIG_MTD_PHYSMAP_START=3D0x8000000
> CONFIG_MTD_PHYSMAP_LEN=3D0
> CONFIG_MTD_PHYSMAP_BANKWIDTH=3D2
> CONFIG_MTD_AMD76XROM=3Dy
> # CONFIG_MTD_ICHXROM is not set
> # CONFIG_MTD_ESB2ROM is not set
> CONFIG_MTD_CK804XROM=3Dy
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> CONFIG_MTD_PMC551_DEBUG=3Dy
> # CONFIG_MTD_DATAFLASH is not set
> CONFIG_MTD_M25P80=3Dy
> # CONFIG_MTD_SST25L is not set
> CONFIG_MTD_SLRAM=3Dy
> # CONFIG_MTD_PHRAM is not set
> CONFIG_MTD_MTDRAM=3Dy
> CONFIG_MTDRAM_TOTAL_SIZE=3D4096
> CONFIG_MTDRAM_ERASE_SIZE=3D128
> CONFIG_MTDRAM_ABS_POS=3D0
> CONFIG_MTD_BLOCK2MTD=3Dy
> =

> #
> # Disk-On-Chip Device Drivers
> #
> CONFIG_MTD_DOCG3=3Dy
> CONFIG_BCH_CONST_M=3D14
> CONFIG_BCH_CONST_T=3D4
> CONFIG_MTD_NAND_ECC=3Dy
> # CONFIG_MTD_NAND_ECC_SMC is not set
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_BCH=3Dy
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> CONFIG_MTD_SM_COMMON=3Dy
> # CONFIG_MTD_NAND_DENALI is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED is not set
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_NAND_DOCG4=3Dy
> CONFIG_MTD_NAND_CAFE=3Dy
> CONFIG_MTD_NAND_CS553X=3Dy
> # CONFIG_MTD_NAND_NANDSIM is not set
> CONFIG_MTD_NAND_PLATFORM=3Dy
> CONFIG_MTD_ONENAND=3Dy
> CONFIG_MTD_ONENAND_VERIFY_WRITE=3Dy
> # CONFIG_MTD_ONENAND_GENERIC is not set
> CONFIG_MTD_ONENAND_OTP=3Dy
> CONFIG_MTD_ONENAND_2X_PROGRAM=3Dy
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> CONFIG_MTD_SPI_NOR=3Dy
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> CONFIG_MTD_UBI_GLUEBI=3Dy
> # CONFIG_MTD_UBI_BLOCK is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> # CONFIG_PARPORT is not set
> CONFIG_PNP=3Dy
> CONFIG_PNP_DEBUG_MESSAGES=3Dy
> =

> #
> # Protocols
> #
> # CONFIG_ISAPNP is not set
> # CONFIG_PNPBIOS is not set
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
> # CONFIG_BLK_DEV_LOOP is not set
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_BLK_DEV_OSD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> # CONFIG_CDROM_PKTCDVD is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> # CONFIG_XEN_BLKDEV_BACKEND is not set
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_HD is not set
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> # CONFIG_CS5535_MFGPT is not set
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> # CONFIG_ISL29020 is not set
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dy
> # CONFIG_SENSORS_BH1770 is not set
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> # CONFIG_TI_DAC7512 is not set
> CONFIG_VMWARE_BALLOON=3Dy
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> CONFIG_BMP085_SPI=3Dy
> CONFIG_PCH_PHUB=3Dy
> # CONFIG_USB_SWITCH_FSA9480 is not set
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> CONFIG_SRAM=3Dy
> CONFIG_C2PORT=3Dy
> CONFIG_C2PORT_DURAMAR_2150=3Dy
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> CONFIG_EEPROM_93XX46=3Dy
> # CONFIG_CB710_CORE is not set
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
> # CONFIG_ALTERA_STAPL is not set
> CONFIG_INTEL_MEI=3Dy
> # CONFIG_INTEL_MEI_ME is not set
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> =

> #
> # Intel MIC Host Driver
> #
> =

> #
> # Intel MIC Card Driver
> #
> # CONFIG_ECHO is not set
> # CONFIG_CXL_BASE is not set
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
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_SCSI_MQ_DEFAULT is not set
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> # CONFIG_BLK_DEV_SD is not set
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_CHR_DEV_OSST=3Dy
> CONFIG_BLK_DEV_SR=3Dy
> CONFIG_BLK_DEV_SR_VENDOR=3Dy
> CONFIG_CHR_DEV_SG=3Dy
> CONFIG_CHR_DEV_SCH=3Dy
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
> CONFIG_SCSI_SAS_ATTRS=3Dy
> CONFIG_SCSI_SAS_LIBSAS=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dy
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
> CONFIG_SCSI_DH=3Dy
> # CONFIG_SCSI_DH_RDAC is not set
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> CONFIG_SCSI_OSD_ULD=3Dy
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> # CONFIG_SCSI_OSD_DEBUG is not set
> # CONFIG_ATA is not set
> # CONFIG_MD is not set
> CONFIG_TARGET_CORE=3Dy
> CONFIG_TCM_IBLOCK=3Dy
> CONFIG_TCM_FILEIO=3Dy
> CONFIG_TCM_PSCSI=3Dy
> CONFIG_LOOPBACK_TARGET=3Dy
> # CONFIG_ISCSI_TARGET is not set
> CONFIG_SBP_TARGET=3Dy
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> CONFIG_FIREWIRE_OHCI=3Dy
> CONFIG_FIREWIRE_SBP2=3Dy
> # CONFIG_FIREWIRE_NOSY is not set
> CONFIG_I2O=3Dy
> CONFIG_I2O_LCT_NOTIFY_ON_CHANGES=3Dy
> CONFIG_I2O_EXT_ADAPTEC=3Dy
> # CONFIG_I2O_CONFIG is not set
> CONFIG_I2O_BUS=3Dy
> CONFIG_I2O_BLOCK=3Dy
> CONFIG_I2O_SCSI=3Dy
> CONFIG_I2O_PROC=3Dy
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
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
> CONFIG_INPUT_EVBUG=3Dy
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> CONFIG_KEYBOARD_ADP5588=3Dy
> CONFIG_KEYBOARD_ADP5589=3Dy
> CONFIG_KEYBOARD_ATKBD=3Dy
> CONFIG_KEYBOARD_QT1070=3Dy
> CONFIG_KEYBOARD_QT2160=3Dy
> CONFIG_KEYBOARD_LKKBD=3Dy
> # CONFIG_KEYBOARD_GPIO is not set
> CONFIG_KEYBOARD_GPIO_POLLED=3Dy
> CONFIG_KEYBOARD_TCA6416=3Dy
> # CONFIG_KEYBOARD_TCA8418 is not set
> CONFIG_KEYBOARD_MATRIX=3Dy
> CONFIG_KEYBOARD_LM8323=3Dy
> CONFIG_KEYBOARD_LM8333=3Dy
> CONFIG_KEYBOARD_MAX7359=3Dy
> CONFIG_KEYBOARD_MCS=3Dy
> # CONFIG_KEYBOARD_MPR121 is not set
> CONFIG_KEYBOARD_NEWTON=3Dy
> CONFIG_KEYBOARD_OPENCORES=3Dy
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TWL4030 is not set
> CONFIG_KEYBOARD_XTKBD=3Dy
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> # CONFIG_MOUSE_PS2_CYPRESS is not set
> # CONFIG_MOUSE_PS2_LIFEBOOK is not set
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> # CONFIG_MOUSE_SERIAL is not set
> CONFIG_MOUSE_APPLETOUCH=3Dy
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dy
> # CONFIG_MOUSE_ELAN_I2C is not set
> CONFIG_MOUSE_INPORT=3Dy
> # CONFIG_MOUSE_ATIXL is not set
> CONFIG_MOUSE_LOGIBM=3Dy
> # CONFIG_MOUSE_PC110PAD is not set
> # CONFIG_MOUSE_VSXXXAA is not set
> CONFIG_MOUSE_GPIO=3Dy
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dy
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> CONFIG_TABLET_USB_ACECAD=3Dy
> CONFIG_TABLET_USB_AIPTEK=3Dy
> CONFIG_TABLET_USB_GTCO=3Dy
> # CONFIG_TABLET_USB_HANWANG is not set
> CONFIG_TABLET_USB_KBTAB=3Dy
> # CONFIG_TABLET_SERIAL_WACOM4 is not set
> CONFIG_INPUT_TOUCHSCREEN=3Dy
> CONFIG_TOUCHSCREEN_88PM860X=3Dy
> # CONFIG_TOUCHSCREEN_ADS7846 is not set
> CONFIG_TOUCHSCREEN_AD7877=3Dy
> CONFIG_TOUCHSCREEN_AD7879=3Dy
> CONFIG_TOUCHSCREEN_AD7879_I2C=3Dy
> # CONFIG_TOUCHSCREEN_AD7879_SPI is not set
> CONFIG_TOUCHSCREEN_ATMEL_MXT=3Dy
> CONFIG_TOUCHSCREEN_AUO_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_BU21013=3Dy
> CONFIG_TOUCHSCREEN_CY8CTMG110=3Dy
> # CONFIG_TOUCHSCREEN_CYTTSP_CORE is not set
> CONFIG_TOUCHSCREEN_CYTTSP4_CORE=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_I2C=3Dy
> CONFIG_TOUCHSCREEN_CYTTSP4_SPI=3Dy
> # CONFIG_TOUCHSCREEN_DA9034 is not set
> CONFIG_TOUCHSCREEN_DYNAPRO=3Dy
> CONFIG_TOUCHSCREEN_HAMPSHIRE=3Dy
> CONFIG_TOUCHSCREEN_EETI=3Dy
> CONFIG_TOUCHSCREEN_FUJITSU=3Dy
> # CONFIG_TOUCHSCREEN_GOODIX is not set
> CONFIG_TOUCHSCREEN_ILI210X=3Dy
> CONFIG_TOUCHSCREEN_GUNZE=3Dy
> # CONFIG_TOUCHSCREEN_ELAN is not set
> CONFIG_TOUCHSCREEN_ELO=3Dy
> CONFIG_TOUCHSCREEN_WACOM_W8001=3Dy
> CONFIG_TOUCHSCREEN_WACOM_I2C=3Dy
> CONFIG_TOUCHSCREEN_MAX11801=3Dy
> # CONFIG_TOUCHSCREEN_MCS5000 is not set
> CONFIG_TOUCHSCREEN_MMS114=3Dy
> CONFIG_TOUCHSCREEN_MTOUCH=3Dy
> CONFIG_TOUCHSCREEN_INEXIO=3Dy
> CONFIG_TOUCHSCREEN_MK712=3Dy
> # CONFIG_TOUCHSCREEN_HTCPEN is not set
> CONFIG_TOUCHSCREEN_PENMOUNT=3Dy
> CONFIG_TOUCHSCREEN_EDT_FT5X06=3Dy
> # CONFIG_TOUCHSCREEN_TOUCHRIGHT is not set
> CONFIG_TOUCHSCREEN_TOUCHWIN=3Dy
> CONFIG_TOUCHSCREEN_TI_AM335X_TSC=3Dy
> CONFIG_TOUCHSCREEN_PIXCIR=3Dy
> CONFIG_TOUCHSCREEN_WM831X=3Dy
> # CONFIG_TOUCHSCREEN_USB_COMPOSITE is not set
> CONFIG_TOUCHSCREEN_MC13783=3Dy
> CONFIG_TOUCHSCREEN_TOUCHIT213=3Dy
> CONFIG_TOUCHSCREEN_TSC_SERIO=3Dy
> CONFIG_TOUCHSCREEN_TSC2005=3Dy
> # CONFIG_TOUCHSCREEN_TSC2007 is not set
> CONFIG_TOUCHSCREEN_PCAP=3Dy
> # CONFIG_TOUCHSCREEN_ST1232 is not set
> CONFIG_TOUCHSCREEN_SUR40=3Dy
> CONFIG_TOUCHSCREEN_TPS6507X=3Dy
> CONFIG_TOUCHSCREEN_ZFORCE=3Dy
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
> CONFIG_SERIO_ALTERA_PS2=3Dy
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> # CONFIG_GAMEPORT is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_SERIAL_NONSTANDARD=3Dy
> CONFIG_ROCKETPORT=3Dy
> CONFIG_CYCLADES=3Dy
> CONFIG_CYZ_INTR=3Dy
> # CONFIG_MOXA_INTELLIO is not set
> CONFIG_MOXA_SMARTIO=3Dy
> CONFIG_SYNCLINK=3Dy
> # CONFIG_SYNCLINKMP is not set
> CONFIG_SYNCLINK_GT=3Dy
> CONFIG_NOZOMI=3Dy
> CONFIG_ISI=3Dy
> CONFIG_N_HDLC=3Dy
> # CONFIG_N_GSM is not set
> # CONFIG_TRACE_ROUTER is not set
> CONFIG_TRACE_SINK=3Dy
> # CONFIG_DEVKMEM is not set
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> # CONFIG_SERIAL_8250_PCI is not set
> CONFIG_SERIAL_8250_CS=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> # CONFIG_SERIAL_8250_RSA is not set
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_FINTEK is not set
> =

> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_MAX3100=3Dy
> CONFIG_SERIAL_MAX310X=3Dy
> CONFIG_SERIAL_MFD_HSU=3Dy
> CONFIG_SERIAL_MFD_HSU_CONSOLE=3Dy
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dy
> CONFIG_SERIAL_SCCNXP=3Dy
> # CONFIG_SERIAL_SCCNXP_CONSOLE is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> CONFIG_SERIAL_TIMBERDALE=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> CONFIG_SERIAL_IFX6X60=3Dy
> CONFIG_SERIAL_PCH_UART=3Dy
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> # CONFIG_SERIAL_ARC is not set
> CONFIG_SERIAL_RP2=3Dy
> CONFIG_SERIAL_RP2_NR_UARTS=3D32
> CONFIG_SERIAL_FSL_LPUART=3Dy
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> CONFIG_IPMI_HANDLER=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> # CONFIG_IPMI_PANIC_STRING is not set
> CONFIG_IPMI_DEVICE_INTERFACE=3Dy
> CONFIG_IPMI_SI=3Dy
> CONFIG_IPMI_SI_PROBE_DEFAULTS=3Dy
> # CONFIG_IPMI_SSIF is not set
> # CONFIG_IPMI_WATCHDOG is not set
> CONFIG_IPMI_POWEROFF=3Dy
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> # CONFIG_HW_RANDOM_INTEL is not set
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_GEODE=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> CONFIG_NVRAM=3Dy
> CONFIG_DTLK=3Dy
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> CONFIG_SONYPI=3Dy
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> CONFIG_CARDMAN_4000=3Dy
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_MWAVE=3Dy
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> # CONFIG_HANGCHECK_TIMER is not set
> # CONFIG_TCG_TPM is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> # CONFIG_XILLYBUS_PCIE is not set
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
> CONFIG_I2C_MUX_GPIO=3Dy
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dy
> # CONFIG_I2C_HELPER_AUTO is not set
> # CONFIG_I2C_SMBUS is not set
> =

> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=3Dy
> # CONFIG_I2C_ALGOPCF is not set
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
> CONFIG_I2C_ALI1563=3Dy
> CONFIG_I2C_ALI15X3=3Dy
> CONFIG_I2C_AMD756=3Dy
> # CONFIG_I2C_AMD756_S4882 is not set
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> CONFIG_I2C_ISMT=3Dy
> CONFIG_I2C_PIIX4=3Dy
> CONFIG_I2C_NFORCE2=3Dy
> CONFIG_I2C_NFORCE2_S4985=3Dy
> CONFIG_I2C_SIS5595=3Dy
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
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_EG20T=3Dy
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dy
> CONFIG_I2C_OCORES=3Dy
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> CONFIG_I2C_DIOLAN_U2C=3Dy
> # CONFIG_I2C_PARPORT_LIGHT is not set
> CONFIG_I2C_ROBOTFUZZ_OSIF=3Dy
> CONFIG_I2C_TAOS_EVM=3Dy
> CONFIG_I2C_TINY_USB=3Dy
> # CONFIG_I2C_VIPERBOARD is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_PCA_ISA=3Dy
> CONFIG_SCx200_ACB=3Dy
> # CONFIG_I2C_SLAVE is not set
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
> CONFIG_SPI_GPIO=3Dy
> CONFIG_SPI_OC_TINY=3Dy
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> CONFIG_SPI_SC18IS602=3Dy
> CONFIG_SPI_TOPCLIFF_PCH=3Dy
> CONFIG_SPI_XCOMM=3Dy
> # CONFIG_SPI_XILINX is not set
> CONFIG_SPI_DESIGNWARE=3Dy
> # CONFIG_SPI_DW_PCI is not set
> CONFIG_SPI_DW_MMIO=3Dy
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
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
> # CONFIG_PTP_1588_CLOCK_PCH is not set
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_DEBUG_GPIO=3Dy
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_DA9055=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers:
> #
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_IT8761E=3Dy
> CONFIG_GPIO_F7188X=3Dy
> CONFIG_GPIO_SCH311X=3Dy
> CONFIG_GPIO_SCH=3Dy
> CONFIG_GPIO_ICH=3Dy
> CONFIG_GPIO_VX855=3Dy
> # CONFIG_GPIO_LYNXPOINT is not set
> =

> #
> # I2C GPIO expanders:
> #
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_MAX7300=3Dy
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCF857X is not set
> CONFIG_GPIO_SX150X=3Dy
> # CONFIG_GPIO_TPS65912 is not set
> CONFIG_GPIO_TWL4030=3Dy
> CONFIG_GPIO_TWL6040=3Dy
> # CONFIG_GPIO_WM831X is not set
> CONFIG_GPIO_WM8350=3Dy
> # CONFIG_GPIO_WM8994 is not set
> # CONFIG_GPIO_ADP5588 is not set
> =

> #
> # PCI GPIO expanders:
> #
> CONFIG_GPIO_CS5535=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_INTEL_MID is not set
> # CONFIG_GPIO_PCH is not set
> CONFIG_GPIO_ML_IOH=3Dy
> CONFIG_GPIO_TIMBERDALE=3Dy
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders:
> #
> CONFIG_GPIO_MAX7301=3Dy
> CONFIG_GPIO_MCP23S08=3Dy
> CONFIG_GPIO_MC33880=3Dy
> =

> #
> # AC97 GPIO expanders:
> #
> =

> #
> # LPC GPIO expanders:
> #
> # CONFIG_GPIO_KEMPLD is not set
> =

> #
> # MODULbus GPIO expanders:
> #
> CONFIG_GPIO_PALMAS=3Dy
> # CONFIG_GPIO_TPS65910 is not set
> =

> #
> # USB GPIO expanders:
> #
> # CONFIG_GPIO_VIPERBOARD is not set
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=3Dy
> CONFIG_W1_MASTER_DS2490=3Dy
> CONFIG_W1_MASTER_DS2482=3Dy
> CONFIG_W1_MASTER_DS1WM=3Dy
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> # CONFIG_W1_SLAVE_THERM is not set
> CONFIG_W1_SLAVE_SMEM=3Dy
> CONFIG_W1_SLAVE_DS2408=3Dy
> CONFIG_W1_SLAVE_DS2408_READBACK=3Dy
> # CONFIG_W1_SLAVE_DS2413 is not set
> # CONFIG_W1_SLAVE_DS2406 is not set
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> # CONFIG_W1_SLAVE_DS2760 is not set
> # CONFIG_W1_SLAVE_DS2780 is not set
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_MAX8925_POWER=3Dy
> # CONFIG_WM831X_BACKUP is not set
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_WM8350_POWER is not set
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_88PM860X=3Dy
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_SBS=3Dy
> CONFIG_BATTERY_BQ27x00=3Dy
> # CONFIG_BATTERY_BQ27X00_I2C is not set
> CONFIG_BATTERY_BQ27X00_PLATFORM=3Dy
> CONFIG_BATTERY_DA9030=3Dy
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_88PM860X is not set
> # CONFIG_CHARGER_ISP1704 is not set
> CONFIG_CHARGER_MAX8903=3Dy
> CONFIG_CHARGER_TWL4030=3Dy
> CONFIG_CHARGER_LP8727=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MANAGER=3Dy
> # CONFIG_CHARGER_MAX8997 is not set
> # CONFIG_CHARGER_BQ2415X is not set
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> # CONFIG_POWER_RESET is not set
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> # CONFIG_SENSORS_ABITUGURU is not set
> CONFIG_SENSORS_ABITUGURU3=3Dy
> CONFIG_SENSORS_AD7314=3Dy
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> CONFIG_SENSORS_ADM1031=3Dy
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> # CONFIG_SENSORS_ADT7411 is not set
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> CONFIG_SENSORS_K10TEMP=3Dy
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DA9055=3Dy
> CONFIG_SENSORS_I5K_AMB=3Dy
> # CONFIG_SENSORS_F71805F is not set
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> CONFIG_SENSORS_GL518SM=3Dy
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> # CONFIG_SENSORS_G762 is not set
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> CONFIG_SENSORS_IBMAEM=3Dy
> CONFIG_SENSORS_IBMPEX=3Dy
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> CONFIG_SENSORS_JC42=3Dy
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> # CONFIG_SENSORS_LTC4151 is not set
> # CONFIG_SENSORS_LTC4215 is not set
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> # CONFIG_SENSORS_LTC4261 is not set
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> # CONFIG_SENSORS_MAX1619 is not set
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_HTU21 is not set
> CONFIG_SENSORS_MCP3021=3Dy
> # CONFIG_SENSORS_ADCXX is not set
> # CONFIG_SENSORS_LM63 is not set
> CONFIG_SENSORS_LM70=3Dy
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=3Dy
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> CONFIG_SENSORS_LM83=3Dy
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> # CONFIG_SENSORS_LM95241 is not set
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_PCF8591 is not set
> CONFIG_PMBUS=3Dy
> # CONFIG_SENSORS_PMBUS is not set
> CONFIG_SENSORS_ADM1275=3Dy
> CONFIG_SENSORS_LM25066=3Dy
> # CONFIG_SENSORS_LTC2978 is not set
> # CONFIG_SENSORS_MAX16064 is not set
> # CONFIG_SENSORS_MAX34440 is not set
> # CONFIG_SENSORS_MAX8688 is not set
> CONFIG_SENSORS_TPS40422=3Dy
> # CONFIG_SENSORS_UCD9000 is not set
> # CONFIG_SENSORS_UCD9200 is not set
> CONFIG_SENSORS_ZL6100=3Dy
> # CONFIG_SENSORS_SHT15 is not set
> CONFIG_SENSORS_SHT21=3Dy
> # CONFIG_SENSORS_SHTC1 is not set
> # CONFIG_SENSORS_SIS5595 is not set
> # CONFIG_SENSORS_DME1737 is not set
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> CONFIG_SENSORS_SMSC47M192=3Dy
> CONFIG_SENSORS_SMSC47B397=3Dy
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> # CONFIG_SENSORS_SMM665 is not set
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> # CONFIG_SENSORS_ADS7828 is not set
> CONFIG_SENSORS_ADS7871=3Dy
> # CONFIG_SENSORS_AMC6821 is not set
> CONFIG_SENSORS_INA209=3Dy
> # CONFIG_SENSORS_INA2XX is not set
> # CONFIG_SENSORS_THMC50 is not set
> CONFIG_SENSORS_TMP102=3Dy
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> CONFIG_SENSORS_VT8231=3Dy
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=3Dy
> CONFIG_SENSORS_W83795=3Dy
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> # CONFIG_SENSORS_W83627HF is not set
> CONFIG_SENSORS_W83627EHF=3Dy
> # CONFIG_SENSORS_WM831X is not set
> CONFIG_SENSORS_WM8350=3Dy
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
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
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
> CONFIG_SOFT_WATCHDOG=3Dy
> CONFIG_DA9055_WATCHDOG=3Dy
> CONFIG_DA9063_WATCHDOG=3Dy
> CONFIG_WM831X_WATCHDOG=3Dy
> CONFIG_WM8350_WATCHDOG=3Dy
> # CONFIG_XILINX_WATCHDOG is not set
> CONFIG_DW_WATCHDOG=3Dy
> # CONFIG_RN5T618_WATCHDOG is not set
> CONFIG_TWL4030_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> CONFIG_ACQUIRE_WDT=3Dy
> CONFIG_ADVANTECH_WDT=3Dy
> CONFIG_ALIM1535_WDT=3Dy
> # CONFIG_ALIM7101_WDT is not set
> CONFIG_F71808E_WDT=3Dy
> # CONFIG_SP5100_TCO is not set
> CONFIG_SBC_FITPC2_WATCHDOG=3Dy
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> # CONFIG_IE6XX_WDT is not set
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> # CONFIG_IT8712F_WDT is not set
> CONFIG_IT87_WDT=3Dy
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_KEMPLD_WDT=3Dy
> # CONFIG_SC1200_WDT is not set
> CONFIG_PC87413_WDT=3Dy
> CONFIG_NV_TCO=3Dy
> # CONFIG_60XX_WDT is not set
> CONFIG_SBC8360_WDT=3Dy
> CONFIG_SBC7240_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dy
> CONFIG_W83877F_WDT=3Dy
> CONFIG_W83977F_WDT=3Dy
> CONFIG_MACHZ_WDT=3Dy
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_MEN_A21_WDT=3Dy
> CONFIG_XEN_WDT=3Dy
> =

> #
> # ISA-based Watchdog Cards
> #
> CONFIG_PCWATCHDOG=3Dy
> # CONFIG_MIXCOMWD is not set
> # CONFIG_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dy
> CONFIG_WDTPCI=3Dy
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
> # CONFIG_SSB_PCIHOST is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCMCIAHOST=3Dy
> # CONFIG_SSB_SILENT is not set
> # CONFIG_SSB_DEBUG is not set
> # CONFIG_SSB_DRIVER_GPIO is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_CS5535=3Dy
> CONFIG_MFD_AS3711=3Dy
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_AXP20X is not set
> # CONFIG_MFD_CROS_EC is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> CONFIG_MFD_DA9063=3Dy
> # CONFIG_MFD_DLN2 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> CONFIG_MFD_MAX77686=3Dy
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=3Dy
> CONFIG_MFD_MAX8997=3Dy
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_EZX_PCAP=3Dy
> CONFIG_MFD_VIPERBOARD=3Dy
> CONFIG_MFD_RETU=3Dy
> # CONFIG_MFD_PCF50633 is not set
> CONFIG_MFD_RDC321X=3Dy
> CONFIG_MFD_RTSX_PCI=3Dy
> CONFIG_MFD_RTSX_USB=3Dy
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RN5T618=3Dy
> CONFIG_MFD_SEC_CORE=3Dy
> CONFIG_MFD_SI476X_CORE=3Dy
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SMSC is not set
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> CONFIG_MFD_PALMAS=3Dy
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> # CONFIG_MFD_TPS65090 is not set
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> CONFIG_MFD_TPS65912_I2C=3Dy
> CONFIG_MFD_TPS65912_SPI=3Dy
> CONFIG_MFD_TPS80031=3Dy
> CONFIG_TWL4030_CORE=3Dy
> CONFIG_MFD_TWL4030_AUDIO=3Dy
> CONFIG_TWL6040_CORE=3Dy
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> CONFIG_MFD_TIMBERDALE=3Dy
> # CONFIG_MFD_TC3589X is not set
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> CONFIG_MFD_ARIZONA_SPI=3Dy
> # CONFIG_MFD_WM5102 is not set
> # CONFIG_MFD_WM5110 is not set
> # CONFIG_MFD_WM8997 is not set
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> # CONFIG_MFD_WM831X_I2C is not set
> CONFIG_MFD_WM831X_SPI=3Dy
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> CONFIG_REGULATOR_DEBUG=3Dy
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> # CONFIG_REGULATOR_88PM8607 is not set
> # CONFIG_REGULATOR_ACT8865 is not set
> # CONFIG_REGULATOR_AD5398 is not set
> CONFIG_REGULATOR_ANATOP=3Dy
> # CONFIG_REGULATOR_AS3711 is not set
> CONFIG_REGULATOR_BCM590XX=3Dy
> # CONFIG_REGULATOR_DA903X is not set
> # CONFIG_REGULATOR_DA9055 is not set
> CONFIG_REGULATOR_DA9063=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> CONFIG_REGULATOR_DA9211=3Dy
> CONFIG_REGULATOR_FAN53555=3Dy
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> CONFIG_REGULATOR_ISL6271A=3Dy
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dy
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_MAX1586 is not set
> # CONFIG_REGULATOR_MAX8649 is not set
> CONFIG_REGULATOR_MAX8660=3Dy
> # CONFIG_REGULATOR_MAX8925 is not set
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MAX8997=3Dy
> CONFIG_REGULATOR_MAX77686=3Dy
> CONFIG_REGULATOR_MAX77802=3Dy
> # CONFIG_REGULATOR_MC13783 is not set
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_PALMAS is not set
> # CONFIG_REGULATOR_PCAP is not set
> CONFIG_REGULATOR_PFUZE100=3Dy
> # CONFIG_REGULATOR_RN5T618 is not set
> CONFIG_REGULATOR_S2MPA01=3Dy
> CONFIG_REGULATOR_S2MPS11=3Dy
> # CONFIG_REGULATOR_S5M8767 is not set
> CONFIG_REGULATOR_TPS51632=3Dy
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> # CONFIG_REGULATOR_TPS65023 is not set
> CONFIG_REGULATOR_TPS6507X=3Dy
> # CONFIG_REGULATOR_TPS65217 is not set
> CONFIG_REGULATOR_TPS6524X=3Dy
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> CONFIG_REGULATOR_TPS80031=3Dy
> CONFIG_REGULATOR_TWL4030=3Dy
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8350=3Dy
> # CONFIG_REGULATOR_WM8994 is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_ALI=3Dy
> # CONFIG_AGP_ATI is not set
> CONFIG_AGP_AMD=3Dy
> CONFIG_AGP_INTEL=3Dy
> CONFIG_AGP_NVIDIA=3Dy
> CONFIG_AGP_SIS=3Dy
> # CONFIG_AGP_SWORKS is not set
> # CONFIG_AGP_VIA is not set
> CONFIG_AGP_EFFICEON=3Dy
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
> # CONFIG_DRM_I2C_ADV7511 is not set
> CONFIG_DRM_I2C_CH7006=3Dy
> CONFIG_DRM_I2C_SIL164=3Dy
> CONFIG_DRM_I2C_NXP_TDA998X=3Dy
> # CONFIG_DRM_PTN3460 is not set
> CONFIG_DRM_TDFX=3Dy
> # CONFIG_DRM_R128 is not set
> CONFIG_DRM_RADEON=3Dy
> # CONFIG_DRM_RADEON_UMS is not set
> CONFIG_DRM_NOUVEAU=3Dy
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> CONFIG_DRM_NOUVEAU_BACKLIGHT=3Dy
> CONFIG_DRM_I915=3Dy
> # CONFIG_DRM_I915_KMS is not set
> CONFIG_DRM_I915_FBDEV=3Dy
> # CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT is not set
> # CONFIG_DRM_MGA is not set
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> # CONFIG_DRM_SAVAGE is not set
> CONFIG_DRM_VMWGFX=3Dy
> CONFIG_DRM_VMWGFX_FBCON=3Dy
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> CONFIG_DRM_GMA3600=3Dy
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dy
> CONFIG_DRM_MGAG200=3Dy
> CONFIG_DRM_CIRRUS_QEMU=3Dy
> # CONFIG_DRM_QXL is not set
> CONFIG_DRM_BOCHS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_DDC=3Dy
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
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
> # CONFIG_FB_ASILIANT is not set
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> CONFIG_FB_OPENCORES=3Dy
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> CONFIG_FB_I740=3Dy
> CONFIG_FB_I810=3Dy
> CONFIG_FB_I810_GTF=3Dy
> # CONFIG_FB_I810_I2C is not set
> CONFIG_FB_LE80578=3Dy
> CONFIG_FB_CARILLO_RANCH=3Dy
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dy
> CONFIG_FB_RADEON_I2C=3Dy
> # CONFIG_FB_RADEON_BACKLIGHT is not set
> CONFIG_FB_RADEON_DEBUG=3Dy
> CONFIG_FB_ATY128=3Dy
> CONFIG_FB_ATY128_BACKLIGHT=3Dy
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> # CONFIG_FB_ATY_GENERIC_LCD is not set
> # CONFIG_FB_ATY_GX is not set
> # CONFIG_FB_ATY_BACKLIGHT is not set
> CONFIG_FB_S3=3Dy
> CONFIG_FB_S3_DDC=3Dy
> # CONFIG_FB_SAVAGE is not set
> CONFIG_FB_SIS=3Dy
> CONFIG_FB_SIS_300=3Dy
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> CONFIG_FB_KYRO=3Dy
> # CONFIG_FB_3DFX is not set
> CONFIG_FB_VOODOO1=3Dy
> # CONFIG_FB_VT8623 is not set
> CONFIG_FB_TRIDENT=3Dy
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> CONFIG_FB_CARMINE=3Dy
> CONFIG_FB_CARMINE_DRAM_EVAL=3Dy
> # CONFIG_CARMINE_DRAM_CUSTOM is not set
> CONFIG_FB_GEODE=3Dy
> CONFIG_FB_GEODE_LX=3Dy
> CONFIG_FB_GEODE_GX=3Dy
> CONFIG_FB_GEODE_GX1=3Dy
> CONFIG_FB_SM501=3Dy
> CONFIG_FB_SMSCUFX=3Dy
> CONFIG_FB_UDL=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_XEN_FBDEV_FRONTEND=3Dy
> CONFIG_FB_METRONOME=3Dy
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=3Dy
> CONFIG_FB_AUO_K190X=3Dy
> # CONFIG_FB_AUO_K1900 is not set
> # CONFIG_FB_AUO_K1901 is not set
> CONFIG_FB_SIMPLE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> # CONFIG_LCD_CLASS_DEVICE is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> # CONFIG_BACKLIGHT_LM3533 is not set
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_MAX8925=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP8860 is not set
> CONFIG_BACKLIGHT_ADP8870=3Dy
> CONFIG_BACKLIGHT_88PM860X=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> # CONFIG_BACKLIGHT_PANDORA is not set
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_AS3711=3Dy
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> CONFIG_LOGO_LINUX_VGA16=3Dy
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
> # CONFIG_HID_A4TECH is not set
> CONFIG_HID_ACRUX=3Dy
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_CHERRY=3Dy
> # CONFIG_HID_CHICONY is not set
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> # CONFIG_HID_EZKEY is not set
> # CONFIG_HID_KEYTOUCH is not set
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dy
> # CONFIG_HID_LCPOWER is not set
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> CONFIG_HID_MICROSOFT=3Dy
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> CONFIG_HID_ORTEK=3Dy
> CONFIG_HID_PANTHERLORD=3Dy
> # CONFIG_PANTHERLORD_FF is not set
> CONFIG_HID_PETALYNX=3Dy
> CONFIG_HID_PICOLCD=3Dy
> # CONFIG_HID_PICOLCD_FB is not set
> # CONFIG_HID_PICOLCD_BACKLIGHT is not set
> CONFIG_HID_PICOLCD_LEDS=3Dy
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> CONFIG_HID_SAITEK=3Dy
> CONFIG_HID_SAMSUNG=3Dy
> CONFIG_HID_SPEEDLINK=3Dy
> # CONFIG_HID_STEELSERIES is not set
> # CONFIG_HID_SUNPLUS is not set
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> # CONFIG_HID_TIVO is not set
> CONFIG_HID_TOPSEED=3Dy
> CONFIG_HID_THINGM=3Dy
> # CONFIG_HID_THRUSTMASTER is not set
> CONFIG_HID_WACOM=3Dy
> CONFIG_HID_WIIMOTE=3Dy
> # CONFIG_HID_XINMO is not set
> # CONFIG_HID_ZEROPLUS is not set
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> =

> #
> # USB HID support
> #
> # CONFIG_USB_HID is not set
> CONFIG_HID_PID=3Dy
> =

> #
> # USB HID Boot Protocol drivers
> #
> CONFIG_USB_KBD=3Dy
> # CONFIG_USB_MOUSE is not set
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
> # CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set
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
> # CONFIG_USB_WUSB_CBAF is not set
> =

> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=3Dy
> CONFIG_USB_XHCI_HCD=3Dy
> CONFIG_USB_XHCI_PCI=3Dy
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dy
> CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
> CONFIG_USB_OXU210HP_HCD=3Dy
> # CONFIG_USB_ISP116X_HCD is not set
> CONFIG_USB_ISP1760_HCD=3Dy
> CONFIG_USB_ISP1362_HCD=3Dy
> # CONFIG_USB_FUSBH200_HCD is not set
> CONFIG_USB_FOTG210_HCD=3Dy
> # CONFIG_USB_MAX3421_HCD is not set
> # CONFIG_USB_OHCI_HCD is not set
> CONFIG_USB_UHCI_HCD=3Dy
> CONFIG_USB_U132_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> CONFIG_USB_R8A66597_HCD=3Dy
> CONFIG_USB_WHCI_HCD=3Dy
> # CONFIG_USB_HWA_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> CONFIG_USB_HCD_SSB=3Dy
> CONFIG_USB_HCD_TEST_MODE=3Dy
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
> # CONFIG_USB_STORAGE is not set
> =

> #
> # USB Imaging devices
> #
> CONFIG_USB_MDC800=3Dy
> CONFIG_USB_MICROTEK=3Dy
> # CONFIG_USBIP_CORE is not set
> CONFIG_USB_MUSB_HDRC=3Dy
> CONFIG_USB_MUSB_HOST=3Dy
> =

> #
> # Platform Glue Layer
> #
> CONFIG_USB_MUSB_TUSB6010=3Dy
> # CONFIG_USB_MUSB_UX500 is not set
> CONFIG_MUSB_PIO_ONLY=3Dy
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> CONFIG_USB_CHIPIDEA=3Dy
> CONFIG_USB_CHIPIDEA_HOST=3Dy
> # CONFIG_USB_CHIPIDEA_DEBUG is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_SERIAL is not set
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> CONFIG_USB_EMI26=3Dy
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> CONFIG_USB_RIO500=3Dy
> # CONFIG_USB_LEGOTOWER is not set
> CONFIG_USB_LCD=3Dy
> CONFIG_USB_LED=3Dy
> CONFIG_USB_CYPRESS_CY7C63=3Dy
> CONFIG_USB_CYTHERM=3Dy
> # CONFIG_USB_IDMOUSE is not set
> CONFIG_USB_FTDI_ELAN=3Dy
> # CONFIG_USB_APPLEDISPLAY is not set
> CONFIG_USB_SISUSBVGA=3Dy
> CONFIG_USB_LD=3Dy
> CONFIG_USB_TRANCEVIBRATOR=3Dy
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> CONFIG_USB_ISIGHTFW=3Dy
> CONFIG_USB_YUREX=3Dy
> # CONFIG_USB_EZUSB_FX2 is not set
> CONFIG_USB_HSIC_USB3503=3Dy
> CONFIG_USB_LINK_LAYER_TEST=3Dy
> =

> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=3Dy
> CONFIG_NOP_USB_XCEIV=3Dy
> # CONFIG_USB_GPIO_VBUS is not set
> CONFIG_TAHVO_USB=3Dy
> # CONFIG_TAHVO_USB_HOST_BY_DEFAULT is not set
> CONFIG_USB_ISP1301=3Dy
> # CONFIG_USB_GADGET is not set
> CONFIG_UWB=3Dy
> CONFIG_UWB_HWA=3Dy
> CONFIG_UWB_WHCI=3Dy
> # CONFIG_UWB_I1480U is not set
> # CONFIG_MMC is not set
> # CONFIG_MEMSTICK is not set
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
> # CONFIG_LEDS_PCA9532 is not set
> CONFIG_LEDS_GPIO=3Dy
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> CONFIG_LEDS_LP5523=3Dy
> CONFIG_LEDS_LP5562=3Dy
> # CONFIG_LEDS_LP8501 is not set
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dy
> # CONFIG_LEDS_PCA955X is not set
> CONFIG_LEDS_PCA963X=3Dy
> # CONFIG_LEDS_WM831X_STATUS is not set
> # CONFIG_LEDS_WM8350 is not set
> # CONFIG_LEDS_DA903X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_INTEL_SS4200=3Dy
> CONFIG_LEDS_LT3593=3Dy
> # CONFIG_LEDS_DELL_NETBOOKS is not set
> # CONFIG_LEDS_MC13783 is not set
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_MAX8997=3Dy
> CONFIG_LEDS_LM355x=3Dy
> CONFIG_LEDS_OT200=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> =

> #
> # LED Triggers
> #
> # CONFIG_LEDS_TRIGGERS is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_EDAC is not set
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
> # CONFIG_RTC_INTF_SYSFS is not set
> # CONFIG_RTC_INTF_DEV is not set
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_88PM860X is not set
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1374=3Dy
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> # CONFIG_RTC_DRV_DS1672 is not set
> CONFIG_RTC_DRV_DS3232=3Dy
> # CONFIG_RTC_DRV_MAX6900 is not set
> CONFIG_RTC_DRV_MAX8925=3Dy
> CONFIG_RTC_DRV_MAX8997=3Dy
> # CONFIG_RTC_DRV_MAX77686 is not set
> CONFIG_RTC_DRV_MAX77802=3Dy
> # CONFIG_RTC_DRV_RS5C372 is not set
> CONFIG_RTC_DRV_ISL1208=3Dy
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12057 is not set
> # CONFIG_RTC_DRV_X1205 is not set
> CONFIG_RTC_DRV_PALMAS=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dy
> # CONFIG_RTC_DRV_PCF8523 is not set
> CONFIG_RTC_DRV_PCF8563=3Dy
> CONFIG_RTC_DRV_PCF85063=3Dy
> CONFIG_RTC_DRV_PCF8583=3Dy
> # CONFIG_RTC_DRV_M41T80 is not set
> CONFIG_RTC_DRV_BQ32K=3Dy
> CONFIG_RTC_DRV_TWL4030=3Dy
> CONFIG_RTC_DRV_TPS65910=3Dy
> CONFIG_RTC_DRV_TPS80031=3Dy
> CONFIG_RTC_DRV_S35390A=3Dy
> CONFIG_RTC_DRV_FM3130=3Dy
> CONFIG_RTC_DRV_RX8581=3Dy
> # CONFIG_RTC_DRV_RX8025 is not set
> CONFIG_RTC_DRV_EM3027=3Dy
> # CONFIG_RTC_DRV_RV3029C2 is not set
> CONFIG_RTC_DRV_S5M=3Dy
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_DRV_M41T93=3Dy
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> CONFIG_RTC_DRV_DS1343=3Dy
> CONFIG_RTC_DRV_DS1347=3Dy
> CONFIG_RTC_DRV_DS1390=3Dy
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RS5C348=3Dy
> # CONFIG_RTC_DRV_DS3234 is not set
> CONFIG_RTC_DRV_PCF2123=3Dy
> # CONFIG_RTC_DRV_RX4581 is not set
> CONFIG_RTC_DRV_MCP795=3Dy
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dy
> # CONFIG_RTC_DRV_DS1511 is not set
> CONFIG_RTC_DRV_DS1553=3Dy
> # CONFIG_RTC_DRV_DS1742 is not set
> CONFIG_RTC_DRV_DS2404=3Dy
> CONFIG_RTC_DRV_DA9055=3Dy
> CONFIG_RTC_DRV_DA9063=3Dy
> CONFIG_RTC_DRV_STK17TA8=3Dy
> # CONFIG_RTC_DRV_M48T86 is not set
> # CONFIG_RTC_DRV_M48T35 is not set
> # CONFIG_RTC_DRV_M48T59 is not set
> CONFIG_RTC_DRV_MSM6242=3Dy
> CONFIG_RTC_DRV_BQ4802=3Dy
> CONFIG_RTC_DRV_RP5C01=3Dy
> # CONFIG_RTC_DRV_V3020 is not set
> CONFIG_RTC_DRV_WM831X=3Dy
> CONFIG_RTC_DRV_WM8350=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_PCAP=3Dy
> CONFIG_RTC_DRV_MC13XXX=3Dy
> # CONFIG_RTC_DRV_XGENE is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_DMADEVICES is not set
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_UIO is not set
> CONFIG_VIRT_DRIVERS=3Dy
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> CONFIG_VIRTIO_PCI=3Dy
> # CONFIG_VIRTIO_BALLOON is not set
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> =

> #
> # Xen driver support
> #
> # CONFIG_XEN_BALLOON is not set
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XEN_BACKEND=3Dy
> CONFIG_XENFS=3Dy
> # CONFIG_XEN_COMPAT_XENFS is not set
> # CONFIG_XEN_SYS_HYPERVISOR is not set
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_TMEM=3Dy
> CONFIG_XEN_PCIDEV_BACKEND=3Dy
> # CONFIG_XEN_SCSI_BACKEND is not set
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_RTS5208=3Dy
> CONFIG_FB_XGI=3Dy
> # CONFIG_FT1000 is not set
> =

> #
> # Speakup console speech
> #
> # CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
> # CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
> # CONFIG_STAGING_MEDIA is not set
> =

> #
> # Android
> #
> CONFIG_ASHMEM=3Dy
> CONFIG_ANDROID_LOGGER=3Dy
> CONFIG_ANDROID_TIMED_OUTPUT=3Dy
> # CONFIG_ANDROID_TIMED_GPIO is not set
> # CONFIG_ANDROID_LOW_MEMORY_KILLER is not set
> CONFIG_ANDROID_INTF_ALARM_DEV=3Dy
> CONFIG_SYNC=3Dy
> CONFIG_SW_SYNC=3Dy
> CONFIG_SW_SYNC_USER=3Dy
> CONFIG_ION=3Dy
> CONFIG_ION_TEST=3Dy
> # CONFIG_ION_DUMMY is not set
> # CONFIG_USB_WPAN_HCD is not set
> # CONFIG_WIMAX_GDM72XX is not set
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> CONFIG_MTD_SPINAND_MT29F=3Dy
> # CONFIG_MTD_SPINAND_ONDIEECC is not set
> CONFIG_DGNC=3Dy
> CONFIG_DGAP=3Dy
> CONFIG_GS_FPGABOOT=3Dy
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WMI is not set
> # CONFIG_ACERHDF is not set
> # CONFIG_ALIENWARE_WMI is not set
> # CONFIG_ASUS_LAPTOP is not set
> # CONFIG_DELL_LAPTOP is not set
> # CONFIG_DELL_WMI is not set
> # CONFIG_DELL_WMI_AIO is not set
> # CONFIG_DELL_SMO8800 is not set
> # CONFIG_FUJITSU_LAPTOP is not set
> # CONFIG_FUJITSU_TABLET is not set
> # CONFIG_TC1100_WMI is not set
> # CONFIG_HP_ACCEL is not set
> # CONFIG_HP_WIRELESS is not set
> # CONFIG_HP_WMI is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> # CONFIG_THINKPAD_ACPI is not set
> # CONFIG_SENSORS_HDAPS is not set
> # CONFIG_INTEL_MENLOW is not set
> CONFIG_ACPI_WMI=3Dy
> # CONFIG_MSI_WMI is not set
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_ACPI_TOSHIBA is not set
> # CONFIG_TOSHIBA_BT_RFKILL is not set
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_ACPI_CMPC is not set
> # CONFIG_INTEL_IPS is not set
> # CONFIG_IBM_RTL is not set
> # CONFIG_SAMSUNG_LAPTOP is not set
> CONFIG_MXM_WMI=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> # CONFIG_APPLE_GMUX is not set
> # CONFIG_INTEL_RST is not set
> # CONFIG_INTEL_SMARTCONNECT is not set
> # CONFIG_PVPANIC is not set
> # CONFIG_CHROME_PLATFORMS is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> CONFIG_SOC_TI=3Dy
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
> CONFIG_IOMMU_SUPPORT=3Dy
> # CONFIG_INTEL_IOMMU is not set
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
> CONFIG_PM_DEVFREQ=3Dy
> =

> #
> # DEVFREQ Governors
> #
> # CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND is not set
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
> CONFIG_EXTCON_GPIO=3Dy
> # CONFIG_EXTCON_MAX8997 is not set
> CONFIG_EXTCON_PALMAS=3Dy
> CONFIG_EXTCON_RT8973A=3Dy
> # CONFIG_EXTCON_SM5502 is not set
> CONFIG_MEMORY=3Dy
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dy
> CONFIG_VME_BUS=3Dy
> =

> #
> # VME Bridge Drivers
> #
> CONFIG_VME_CA91CX42=3Dy
> # CONFIG_VME_TSI148 is not set
> =

> #
> # VME Board Drivers
> #
> # CONFIG_VMIVME_7805 is not set
> =

> #
> # VME Device Drivers
> #
> CONFIG_VME_USER=3Dy
> # CONFIG_VME_PIO2 is not set
> # CONFIG_PWM is not set
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_SERIAL_IPOCTAL=3Dy
> # CONFIG_RESET_CONTROLLER is not set
> # CONFIG_FMC is not set
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> CONFIG_RAS=3Dy
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> CONFIG_ANDROID_BINDER_IPC_32BIT=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_DMIID is not set
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
> #
> CONFIG_GOOGLE_MEMCONSOLE=3Dy
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> CONFIG_EXT2_FS=3Dy
> CONFIG_EXT2_FS_XATTR=3Dy
> # CONFIG_EXT2_FS_POSIX_ACL is not set
> CONFIG_EXT2_FS_SECURITY=3Dy
> # CONFIG_EXT2_FS_XIP is not set
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_DEFAULTS_TO_ORDERED=3Dy
> CONFIG_EXT3_FS_XATTR=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> CONFIG_EXT4_DEBUG=3Dy
> CONFIG_JBD=3Dy
> CONFIG_JBD_DEBUG=3Dy
> CONFIG_JBD2=3Dy
> CONFIG_JBD2_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> # CONFIG_OCFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_FILE_LOCKING=3Dy
> # CONFIG_FSNOTIFY is not set
> # CONFIG_DNOTIFY is not set
> # CONFIG_INOTIFY_USER is not set
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> # CONFIG_QUOTACTL is not set
> CONFIG_AUTOFS4_FS=3Dy
> # CONFIG_FUSE_FS is not set
> CONFIG_OVERLAY_FS=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> CONFIG_FSCACHE_DEBUG=3Dy
> CONFIG_CACHEFILES=3Dy
> CONFIG_CACHEFILES_DEBUG=3Dy
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> # CONFIG_ZISOFS is not set
> # CONFIG_UDF_FS is not set
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> # CONFIG_MSDOS_FS is not set
> CONFIG_VFAT_FS=3Dy
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"iso8859-1"
> CONFIG_NTFS_FS=3Dy
> # CONFIG_NTFS_DEBUG is not set
> CONFIG_NTFS_RW=3Dy
> =

> #
> # Pseudo filesystems
> #
> # CONFIG_PROC_FS is not set
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
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> # CONFIG_NLS_CODEPAGE_861 is not set
> # CONFIG_NLS_CODEPAGE_862 is not set
> CONFIG_NLS_CODEPAGE_863=3Dy
> CONFIG_NLS_CODEPAGE_864=3Dy
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> CONFIG_NLS_CODEPAGE_936=3Dy
> CONFIG_NLS_CODEPAGE_950=3Dy
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> CONFIG_NLS_CODEPAGE_1250=3Dy
> # CONFIG_NLS_CODEPAGE_1251 is not set
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dy
> CONFIG_NLS_ISO8859_2=3Dy
> # CONFIG_NLS_ISO8859_3 is not set
> CONFIG_NLS_ISO8859_4=3Dy
> # CONFIG_NLS_ISO8859_5 is not set
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> CONFIG_NLS_ISO8859_9=3Dy
> CONFIG_NLS_ISO8859_13=3Dy
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> # CONFIG_NLS_MAC_CROATIAN is not set
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> CONFIG_NLS_MAC_ROMANIAN=3Dy
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
> CONFIG_FRAME_WARN=3D1024
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> CONFIG_UNUSED_SYMBOLS=3Dy
> # CONFIG_PAGE_OWNER is not set
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> CONFIG_DEBUG_PAGEALLOC=3Dy
> CONFIG_WANT_PAGE_DEBUG_FLAGS=3Dy
> CONFIG_PAGE_GUARD=3Dy
> CONFIG_DEBUG_OBJECTS=3Dy
> # CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> CONFIG_DEBUG_OBJECTS_FREE=3Dy
> CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> # CONFIG_DEBUG_OBJECTS_WORK is not set
> CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> # CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER is not set
> CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_DEBUG_PER_CPU_MAPS=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_DEBUG_STACKOVERFLOW=3Dy
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Lockups and Hangs
> #
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_STACK_END_CHECK=3Dy
> # CONFIG_DEBUG_PREEMPT is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_DEBUG_RT_MUTEXES=3Dy
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> CONFIG_LOCK_STAT=3Dy
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> # CONFIG_DEBUG_KOBJECT_RELEASE is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> # CONFIG_SPARSE_RCU_POINTER is not set
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_TORTURE_TEST=3Dy
> # CONFIG_RCU_TORTURE_TEST_RUNNABLE is not set
> # CONFIG_RCU_TORTURE_TEST_SLOW_INIT is not set
> CONFIG_RCU_TORTURE_TEST_SLOW_INIT_DELAY=3D3
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=3Dy
> CONFIG_FAILSLAB=3Dy
> # CONFIG_FAIL_PAGE_ALLOC is not set
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> CONFIG_FAIL_IO_TIMEOUT=3Dy
> # CONFIG_FAULT_INJECTION_DEBUG_FS is not set
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
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dy
> # CONFIG_ATOMIC64_SELFTEST is not set
> CONFIG_TEST_STRING_HELPERS=3Dy
> CONFIG_TEST_KSTRTOX=3Dy
> CONFIG_TEST_RHASHTABLE=3Dy
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_FIRMWARE=3Dy
> CONFIG_TEST_UDELAY=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DOUBLEFAULT is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_STRESS=3Dy
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
> CONFIG_DEBUG_NMI_SELFTEST=3Dy
> # CONFIG_X86_DEBUG_STATIC_CPU_HAS is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_BIG_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> CONFIG_KEYS_DEBUG_PROC_KEYS=3Dy
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=3Dy
> CONFIG_SECURITY_YAMA_STACKED=3Dy
> # CONFIG_INTEGRITY is not set
> # CONFIG_DEFAULT_SECURITY_YAMA is not set
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
> CONFIG_CRYPTO_PCOMP=3Dy
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
> # CONFIG_CRYPTO_PCBC is not set
> CONFIG_CRYPTO_XTS=3Dy
> =

> #
> # Hash modes
> #
> # CONFIG_CRYPTO_CMAC is not set
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dy
> CONFIG_CRYPTO_VMAC=3Dy
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> # CONFIG_CRYPTO_CRC32C_INTEL is not set
> # CONFIG_CRYPTO_CRC32 is not set
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dy
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dy
> # CONFIG_CRYPTO_RMD128 is not set
> CONFIG_CRYPTO_RMD160=3Dy
> CONFIG_CRYPTO_RMD256=3Dy
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> # CONFIG_CRYPTO_WP512 is not set
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> # CONFIG_CRYPTO_CAMELLIA is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> # CONFIG_CRYPTO_CAST5 is not set
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_DES=3Dy
> # CONFIG_CRYPTO_FCRYPT is not set
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_586=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> # CONFIG_CRYPTO_SERPENT is not set
> # CONFIG_CRYPTO_SERPENT_SSE2_586 is not set
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> # CONFIG_CRYPTO_TWOFISH_586 is not set
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
> # CONFIG_CRYPTO_ANSI_CPRNG is not set
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> # CONFIG_CRYPTO_DRBG_HMAC is not set
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> CONFIG_CRYPTO_HW=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK is not set
> CONFIG_CRYPTO_DEV_GEODE=3Dy
> CONFIG_CRYPTO_DEV_HIFN_795X=3Dy
> CONFIG_CRYPTO_DEV_HIFN_795X_RNG=3Dy
> # CONFIG_CRYPTO_DEV_CCP is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> CONFIG_PUBLIC_KEY_ALGO_RSA=3Dy
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> # CONFIG_SIGNED_PE_FILE_VERIFICATION is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_LGUEST is not set
> # CONFIG_BINARY_PRINTF is not set
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
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> # CONFIG_CRC_CCITT is not set
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
> # CONFIG_XZ_DEC_X86 is not set
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
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
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy


--===============4718657999075685443==--

