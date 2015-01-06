Content-Type: multipart/mixed; boundary="===============6275179176230594418=="
MIME-Version: 1.0
From: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [rcu] eae957c0fe7: Fix the boot hang in parent commit (451bc36a7118aab5)
Date: Tue, 06 Jan 2015 07:33:09 -0800
Message-ID: <20150106153309.GU5280@linux.vnet.ibm.com>
In-Reply-To: <1420509300.6201.61.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6275179176230594418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 06, 2015 at 09:55:00AM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> commit eae957c0fe7fd6c37b3609d58593b74b846c876e ("rcu: Run grace-period k=
threads at real-time priority")
> =

> This commit fix the boot hang in parent commit.  The dmesg and the kconfi=
g for the parent commit are attached.

You lost me on this one...  451bc36a7118aab5 is a change to rcutorture
scripting that should not affect boot for any sort of normal run.

Now, eae957c0fe7fd6c37b3609d585 can prevent hangs due to excessive load,
so I could easily believe that it might help things.  Though I would
expect the hangs it would prevent would be at run time rather than boot
time...

							Thanx, Paul

> testbox/testcase/testparams: vm-vp-quantal-i386/boot/1
> =

> 451bc36a7118aab5  eae957c0fe7fd6c37b3609d585  =

> ----------------  --------------------------  =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :10         100%          10:10    kmsg.acpi_PNP0A03:#:fail_to=
_add_MMCONFIG_information,can't_access_extended_PCI_configuration_space_und=
er_this_bridge
>            :10         100%          10:10    kmsg.microcode:no_support_f=
or_this_CPU_vendor
>            :10         100%          10:10    kmsg.The_force_parameter_ha=
s_not_been_set_to#The_Iris_poweroff_handler_will_not_be_installed
>            :10         100%          10:10    kmsg.spin_lock-torture:---S=
tart_of_test[debug]:nwriters_stress=3D#nreaders_stress=3D#stat_interval=3D#=
verbose=3D#shuffle_interval=3D#stutter=3D#shutdown_secs=3D#onoff_interval=
=3D#onoff_holdoff=3D
>            :10         100%          10:10    kmsg.torture_init_begin:ref=
using_rcu_init:spin_lock_running
>            :10         100%          10:10    kmsg.telclk_interrupt=3D#no=
n-mcpbl0010_hw
>            :10         100%          10:10    kmsg.dummy-irq:no_IRQ_given=
.Use_irq=3DN
>            :10         100%          10:10    kmsg.mtdoops:mtd_device(mtd=
dev=3Dname/number)must_be_supplied
>            :10         100%          10:10    kmsg.nandsim]warning:read_b=
yte:unexpected_data_output_cycle,state_is_STATE_READY_return
>            :10         100%          10:10    kmsg.wistron_btns:System_un=
known
>            :10         100%          10:10    kmsg.ideapad_slidebar:DMI_d=
oes_not_match
>            :10         100%          10:10    kmsg.applesmc:supported_lap=
top_not_found
>            :10         100%          10:10    kmsg.applesmc:driver_init_f=
ailed(ret=3D-#)
>            :10         100%          10:10    kmsg.fmc_fake-design-for-te=
sting-f001:Driver_has_no_ID:matches_all
>            :10         100%          10:10    kmsg.fmc_write_eeprom_fake-=
design-for-testing-f001:fmc_write_eeprom:no_busid_passed,refusing_all_cards
>            :10         100%          10:10    kmsg.sock:process`trinity-m=
ain'is_using_obsolete_setsockopt_SO_BSDCOMPAT
>          10:10        -100%            :10    kmsg.BUG:kernel_boot_hang
>          10:10        -100%            :10    dmesg.BUG:kernel_boot_hang
> =

> vm-vp-quantal-i386: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap
> Memory: 360M
> =

> =

> To reproduce:
> =

> 	apt-get install ruby ruby-oj
> 	git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tests.git
> 	cd lkp-tests
> 	bin/setup-local job.yaml # the job file attached in this email
> 	bin/run-local   job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Huang, Ying
> =


> ---
> testcase: boot
> default-monitors: =

> default_watchdogs:
>   watch-oom: =

>   watchdog: =

> cpufreq_governor: =

> model: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap
> nr_vm: 64
> nr_cpu: 1
> memory: 360M
> rootfs: quantal-core-i386.cgz
> boot-slabinfo: =

> boot-meminfo: =

> memmap: =

> boot-memory: =

> boot-time: =

> kernel-size: =

> sleep: 1
> branch: next/master
> commit: 0062c94620a87cab4e7236a07e0f9432a2c59db3
> repeat_to: 2
> testbox: vm-vp-quantal-i386-46
> tbox_group: vm-vp-quantal-i386
> kconfig: i386-randconfig-ib1-01050511
> enqueue_time: 2015-01-05 06:14:16.900677006 +08:00
> kernel: "/kernel/i386-randconfig-ib1-01050511/0062c94620a87cab4e7236a07e0=
f9432a2c59db3/vmlinuz-3.19.0-rc2-next-20150103"
> user: lkp
> queue: rand
> result_root: "/result/vm-vp-quantal-i386/boot/1/quantal-core-i386.cgz/i38=
6-randconfig-ib1-01050511/0062c94620a87cab4e7236a07e0f9432a2c59db3/0"
> job_file: "/lkp/scheduled/vm-vp-quantal-i386-46/rand_boot-1-quantal-core-=
i386.cgz-i386-randconfig-ib1-01050511-0062c94620a87cab4e7236a07e0f9432a2c59=
db3-1.yaml"
> dequeue_time: 2015-01-05 06:14:19.583868260 +08:00
> job_state: finished

> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
> =


> early console in setup code
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Linux version 3.19.0-rc1-00039-g451bc36 (kbuild(a)lkp-ib03=
) (gcc version 4.9.1 (Debian 4.9.1-19) ) #6 SMP Mon Jan 5 23:33:14 CST 2015
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   NSC Geode by NSC
> [    0.000000]   Cyrix CyrixInstead
> [    0.000000]   Centaur CentaurHauls
> [    0.000000]   Transmeta GenuineTMx86
> [    0.000000]   Transmeta TransmetaCPU
> [    0.000000] CPU: vendor_id 'GenuineIntel' unknown, using generic init.
> [    0.000000] CPU: Your system may be unstable.
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000167fdfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000167fe000-0x00000000167fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] res=
erved
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] e820: last_pfn =3D 0x167fe max_arch_pfn =3D 0x1000000
> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000fdb00-0x000fdb0f] mapped a=
t [c00fdb00]
> [    0.000000]   mpc: fdb10-fdbf0
> [    0.000000] initial memory mapped: [mem 0x00000000-0x027fffff]
> [    0.000000] Base memory trampoline at [c009b000] 9b000 size 16384
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x14c00000-0x14dfffff]
> [    0.000000]  [mem 0x14c00000-0x14dfffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x14000000-0x14bfffff]
> [    0.000000]  [mem 0x14000000-0x14bfffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x13ffffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x13ffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x14e00000-0x167fdfff]
> [    0.000000]  [mem 0x14e00000-0x165fffff] page 2M
> [    0.000000]  [mem 0x16600000-0x167fdfff] page 4k
> [    0.000000] BRK [0x023f6000, 0x023f6fff] PGTABLE
> [    0.000000] BRK [0x023f7000, 0x023f7fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x14ee6000-0x167effff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x000FD9A0 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x167FE4B0 000034 (v01 BOCHS  BXPCRSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x167FFF80 000074 (v01 BOCHS  BXPCFACP 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x167FE4F0 0011A9 (v01 BXPC   BXDSDT   00000001=
 INTL 20100528)
> [    0.000000] ACPI: FACS 0x167FFF40 000040
> [    0.000000] ACPI: SSDT 0x167FF800 000735 (v01 BOCHS  BXPCSSDT 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x167FF6E0 000078 (v01 BOCHS  BXPCAPIC 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x167FF6A0 000038 (v01 BOCHS  BXPCHPET 00000001=
 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] 0MB HIGHMEM available.
> [    0.000000] 359MB LOWMEM available.
> [    0.000000]   mapped low ram: 0 - 167fe000
> [    0.000000]   low ram: 0 - 167fe000
> [    0.000000] cma: dma_contiguous_reserve(limit 167fe000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:167fd001, primary cpu clock
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x00001000-0x00ffffff]
> [    0.000000]   Normal   [mem 0x01000000-0x167fdfff]
> [    0.000000]   HighMem  empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x00001000-0x0009efff]
> [    0.000000]   node   0: [mem 0x00100000-0x167fdfff]
> [    0.000000] Initmem setup node 0 [mem 0x00001000-0x167fdfff]
> [    0.000000] On node 0 totalpages: 92060
> [    0.000000]   DMA zone: 32 pages used for memmap
> [    0.000000]   DMA zone: 0 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   Normal zone: 688 pages used for memmap
> [    0.000000]   Normal zone: 88062 pages, LIFO batch:15
> [    0.000000] Using APIC driver default
> [    0.000000] ACPI: PM-Timer IO Port: 0xb008
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to         ffffc000 (        fee00000)
> [    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
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
> [    0.000000] smpboot: Allowing 1 CPUs, 0 hotplug CPUs
> [    0.000000] mapped IOAPIC to ffffb000 (fec00000)
> [    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.000000] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
> [    0.000000] e820: [mem 0x16800000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] setup_percpu: NR_CPUS:8 nr_cpumask_bits:8 nr_cpu_ids:1 nr_=
node_ids:1
> [    0.000000] PERCPU: Embedded 334 pages/cpu @d4938000 s1344752 r0 d2331=
2 u1368064
> [    0.000000] pcpu-alloc: s1344752 r0 d23312 u1368064 alloc=3D334*4096
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 1493b700
> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 91340
> [    0.000000] Kernel command line: user=3Dlkp job=3D/lkp/scheduled/vm-vp=
-quantal-i386-29/bisect_boot-1-quantal-core-i386.cgz-i386-randconfig-ib1-01=
050511-451bc36a7118aab5a01b8e9bc090aed899b79000-1.yaml ARCH=3Di386 BOOT_IMA=
GE=3D/kernel/i386-randconfig-ib1-01050511/451bc36a7118aab5a01b8e9bc090aed89=
9b79000/vmlinuz-3.19.0-rc1-00039-g451bc36 kconfig=3Di386-randconfig-ib1-010=
50511 commit=3D451bc36a7118aab5a01b8e9bc090aed899b79000 branch=3Dnext/maste=
r root=3D/dev/ram0 max_uptime=3D3600 RESULT_ROOT=3D/result/vm-vp-quantal-i3=
86/boot/1/quantal-core-i386.cgz/i386-randconfig-ib1-01050511/451bc36a7118aa=
b5a01b8e9bc090aed899b79000/1 ip=3D::::vm-vp-quantal-i386-29::dhcp earlyprin=
tk=3DttyS0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_=
stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oo=
ps=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 conso=
le=3Dtty0 vga=3Dnormal rw drbd.minor_count=3D8
> [    0.000000] PID hash table entries: 2048 (order: 1, 8192 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 6, 262144 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 5, 131072 by=
tes)
> [    0.000000] Initializing CPU#0
> [    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340 using stand=
ard form
> [    0.000000] Initializing HighMem for node 0 (00000000:00000000)
> [    0.000000] Memory: 315840K/368240K available (6225K kernel code, 820K=
 rwdata, 3188K rodata, 1860K init, 8236K bss, 52400K reserved, 0K cma-reser=
ved, 0K highmem)
> [    0.000000] virtual kernel memory layout:
> [    0.000000]     fixmap  : 0xffe6e000 - 0xfffff000   (1604 kB)
> [    0.000000]     pkmap   : 0xffc00000 - 0xffe00000   (2048 kB)
> [    0.000000]     vmalloc : 0xd6ffe000 - 0xffbfe000   ( 652 MB)
> [    0.000000]     lowmem  : 0xc0000000 - 0xd67fe000   ( 359 MB)
> [    0.000000]       .init : 0xc1a02000 - 0xc1bd3000   (1860 kB)
> [    0.000000]       .data : 0xc16147c8 - 0xc1a000b0   (4014 kB)
> [    0.000000]       .text : 0xc1000000 - 0xc16147c8   (6225 kB)
> [    0.000000] Checking if this processor honours the WP bit even in supe=
rvisor mode...Ok.
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1,=
 Nodes=3D1
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] Testing tracer nop: PASSED
> [    0.000000] NR_IRQS:2304 nr_irqs:256 16
> [    0.000000] CPU 0 irqstacks, hard=3Dd4438000 soft=3Dd443a000
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
> [    0.000000]  memory used by lock dependency info: 5167 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] ------------------------
> [    0.000000] | Locking API testsuite:
> [    0.000000] ----------------------------------------------------------=
------------------
> [    0.000000]                                  | spin |wlock |rlock |mut=
ex | wsem | rsem |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]                      A-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                  A-B-B-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]              A-B-B-C-C-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]              A-B-C-A-B-C deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-B-C-C-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-C-D-B-D-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]          A-B-C-D-B-C-D-A deadlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                     double unlock:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                   initialize held:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]                  bad unlock order:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]               recursive read-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]            recursive read-lock #2:             |  ok  |   =
          |  ok  |
> [    0.000000]             mixed read-write-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]             mixed write-read-lock:             |  ok  |   =
          |  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]      hard-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.000000]      soft-irqs-on + irq-safe-A/12:  ok  |  ok  |  ok  |
> [    0.000000]      hard-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.000000]      soft-irqs-on + irq-safe-A/21:  ok  |  ok  |  ok  |
> [    0.000000]        sirq-safe-A =3D> hirqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]        sirq-safe-A =3D> hirqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]          hard-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]          soft-safe-A + irqs-on/12:  ok  |  ok  |  ok  |
> [    0.000000]          hard-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]          soft-safe-A + irqs-on/21:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/123:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/132:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/213:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/231:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/312:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #1/321:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/123:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/132:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/213:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/231:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/312:  ok  |  ok  |  ok  |
> [    0.000000]     hard-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.000000]     soft-safe-A + unsafe-B #2/321:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/123:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/132:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/213:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/231:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/312:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.000000]       soft-irq lock-inversion/321:  ok  |  ok  |  ok  |
> [    0.000000]       hard-irq read-recursion/123:  ok  |
> [    0.000000]       soft-irq read-recursion/123:  ok  |
> [    0.000000]       hard-irq read-recursion/132:  ok  |
> [    0.000000]       soft-irq read-recursion/132:  ok  |
> [    0.000000]       hard-irq read-recursion/213:  ok  |
> [    0.000000]       soft-irq read-recursion/213:  ok  |
> [    0.000000]       hard-irq read-recursion/231:  ok  |
> [    0.000000]       soft-irq read-recursion/231:  ok  |
> [    0.000000]       hard-irq read-recursion/312:  ok  |
> [    0.000000]       soft-irq read-recursion/312:  ok  |
> [    0.000000]       hard-irq read-recursion/321:  ok  |
> [    0.000000]       soft-irq read-recursion/321:  ok  |
> [    0.000000]   --------------------------------------------------------=
------------------
> [    0.000000]   | Wound/wait tests |
> [    0.000000]   ---------------------
> [    0.000000]                   ww api failures:  ok  |  ok  |  ok  |
> [    0.000000]                ww contexts mixing:  ok  |  ok  |
> [    0.000000]              finishing ww context:  ok  |  ok  |  ok  |  o=
k  |
> [    0.000000]                locking mismatches:  ok  |  ok  |  ok  |
> [    0.000000]                  EDEADLK handling:  ok  |  ok  |  ok  |  o=
k  |  ok  |  ok  |  ok  |  ok  |  ok  |  ok  |
> [    0.000000]            spinlock nest unlocked:  ok  |
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                                  |block | try  |context|
> [    0.000000]   -----------------------------------------------------
> [    0.000000]                           context:  ok  |  ok  |  ok  |
> [    0.000000]                               try:  ok  |  ok  |  ok  |
> [    0.000000]                             block:  ok  |  ok  |  ok  |
> [    0.000000]                          spinlock:  ok  |  ok  |  ok  |
> [    0.000000] -------------------------------------------------------
> [    0.000000] Good, all 253 testcases passed! |
> [    0.000000] ---------------------------------
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.342 MHz processor
> [    0.020000] Calibrating delay loop (skipped) preset value.. 5386.68 Bo=
goMIPS (lpj=3D26933420)
> [    0.020000] pid_max: default: 4096 minimum: 301
> [    0.020000] ACPI: Core revision 20141107
> [    0.020000] ACPI: All ACPI Tables successfully acquired
> [    0.020000] Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
> [    0.020000] Mountpoint-cache hash table entries: 1024 (order: 0, 4096 =
bytes)
> [    0.020000] Initializing cgroup subsys devices
> [    0.020000] Initializing cgroup subsys blkio
> [    0.020000] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.020000] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.026839] Freeing SMP alternatives memory: 16K (c1bd3000 - c1bd7000)
> [    0.028528] ftrace: allocating 30239 entries in 60 pages
> [    0.040162] Getting VERSION: 1050014
> [    0.050009] Getting VERSION: 1050014
> [    0.050297] Getting ID: 0
> [    0.050513] Getting ID: f000000
> [    0.050789] Getting LVT0: 8700
> [    0.051053] Getting LVT1: 8400
> [    0.051299] Enabling APIC mode:  Flat.  Using 1 I/O APICs
> [    0.051782] enabled ExtINT on CPU#0
> [    0.052885] ENABLING IO-APIC IRQs
> [    0.053167] init IO_APIC IRQs
> [    0.053405]  apic 0 pin 0 not connected
> [    0.053735] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.054385] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.055024] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.055688] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.056364] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.057011] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.057645] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.058276] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.058935] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.059590] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.060020] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.060664] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.061295] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.061959] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.062647] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.063280] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.063914]  apic 0 pin 16 not connected
> [    0.064222]  apic 0 pin 17 not connected
> [    0.064525]  apic 0 pin 18 not connected
> [    0.064826]  apic 0 pin 19 not connected
> [    0.065155]  apic 0 pin 20 not connected
> [    0.065470]  apic 0 pin 21 not connected
> [    0.065813]  apic 0 pin 22 not connected
> [    0.066116]  apic 0 pin 23 not connected
> [    0.066556] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.067019] smpboot: CPU0: GenuineIntel Intel Core Processor (Haswell)=
 (fam: 06, model: 3c, stepping: 01)
> [    0.067855] TSC deadline timer enabled
> [    0.068179] Performance Events: no PMU driver, software events only.
> [    0.070000] x86: Booted up 1 node, 1 CPUs
> [    0.070000] smpboot: Total of 1 processors activated (5386.68 BogoMIPS)
> [    0.070000] devtmpfs: initialized
> [    0.070000] Testing tracer function: PASSED
> [    0.251289] Testing dynamic ftrace: PASSED
> [    0.480100] Testing dynamic ftrace ops #1: (1 0 1 0 0) (1 1 2 0 0) (2 =
1 3 0 17768) (2 2 4 0 17879) PASSED
> [    0.612570] Testing dynamic ftrace ops #2: (1 0 1 17768 0) (1 1 2 1787=
9 0) (2 1 3 1 12) (2 2 4 176 187) PASSED
> [    0.744798] Testing ftrace recursion: PASSED
> [    0.762696] Testing ftrace recursion safe: PASSED
> [    0.780638] Testing ftrace regs: PASSED
> [    0.798549] Testing tracer wakeup: =

> [    0.859127] ftrace-test (16) used greatest stack depth: 7216 bytes left
> [    0.859712] PASSED
> [    0.859876] Testing tracer wakeup_rt: =

> BUG: kernel boot hang
> Elapsed time: 305
> qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -kernel /kernel/i38=
6-randconfig-ib1-01050511/451bc36a7118aab5a01b8e9bc090aed899b79000/vmlinuz-=
3.19.0-rc1-00039-g451bc36 -append 'user=3Dlkp job=3D/lkp/scheduled/vm-vp-qu=
antal-i386-29/bisect_boot-1-quantal-core-i386.cgz-i386-randconfig-ib1-01050=
511-451bc36a7118aab5a01b8e9bc090aed899b79000-1.yaml ARCH=3Di386 BOOT_IMAGE=
=3D/kernel/i386-randconfig-ib1-01050511/451bc36a7118aab5a01b8e9bc090aed899b=
79000/vmlinuz-3.19.0-rc1-00039-g451bc36 kconfig=3Di386-randconfig-ib1-01050=
511 commit=3D451bc36a7118aab5a01b8e9bc090aed899b79000 branch=3Dnext/master =
root=3D/dev/ram0 max_uptime=3D3600 RESULT_ROOT=3D/result/vm-vp-quantal-i386=
/boot/1/quantal-core-i386.cgz/i386-randconfig-ib1-01050511/451bc36a7118aab5=
a01b8e9bc090aed899b79000/1 ip=3D::::vm-vp-quantal-i386-29::dhcp earlyprintk=
=3DttyS0,115200 debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_st=
all_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=
=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=
=3Dtty0 vga=3Dnormal rw drbd.minor_count=3D8'  -initrd /fs/sdg1/initrd-vm-v=
p-quantal-i386-29 -m 360 -smp 1 -net nic,vlan=3D1,model=3De1000 -net user,v=
lan=3D1 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltim=
e -pidfile /dev/shm/kboot/pid-vm-vp-quantal-i386-29 -serial file:/dev/shm/k=
boot/serial-vm-vp-quantal-i386-29 -daemonize -display none -monitor null =


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
> CONFIG_FHANDLE=3Dy
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
> CONFIG_IRQ_DOMAIN=3Dy
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
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ=3Dy
> # CONFIG_HIGH_RES_TIMERS is not set
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
> CONFIG_TREE_RCU=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_FANOUT=3D32
> CONFIG_RCU_FANOUT_LEAF=3D16
> # CONFIG_RCU_FANOUT_EXACT is not set
> # CONFIG_TREE_RCU_TRACE is not set
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
> # CONFIG_CGROUP_DEBUG is not set
> # CONFIG_CGROUP_FREEZER is not set
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_PERF is not set
> # CONFIG_CGROUP_SCHED is not set
> CONFIG_BLK_CGROUP=3Dy
> # CONFIG_DEBUG_BLK_CGROUP is not set
> CONFIG_CHECKPOINT_RESTORE=3Dy
> CONFIG_NAMESPACES=3Dy
> # CONFIG_UTS_NS is not set
> CONFIG_USER_NS=3Dy
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
> # CONFIG_INIT_FALLBACK is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_UID16=3Dy
> # CONFIG_SGETMASK_SYSCALL is not set
> # CONFIG_SYSFS_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> # CONFIG_PCSPKR_PLATFORM is not set
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> # CONFIG_EPOLL is not set
> # CONFIG_SIGNALFD is not set
> # CONFIG_TIMERFD is not set
> CONFIG_EVENTFD=3Dy
> CONFIG_BPF_SYSCALL=3Dy
> # CONFIG_SHMEM is not set
> # CONFIG_AIO is not set
> CONFIG_ADVISE_SYSCALLS=3Dy
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
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> # CONFIG_SLUB_CPU_PARTIAL is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # CONFIG_OPROFILE is not set
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
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
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
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
> # CONFIG_BLK_DEV_THROTTLING is not set
> CONFIG_BLK_CMDLINE_PARSER=3Dy
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> CONFIG_AIX_PARTITION=3Dy
> # CONFIG_OSF_PARTITION is not set
> CONFIG_AMIGA_PARTITION=3Dy
> CONFIG_ATARI_PARTITION=3Dy
> CONFIG_MAC_PARTITION=3Dy
> # CONFIG_MSDOS_PARTITION is not set
> # CONFIG_LDM_PARTITION is not set
> CONFIG_SGI_PARTITION=3Dy
> CONFIG_ULTRIX_PARTITION=3Dy
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> # CONFIG_EFI_PARTITION is not set
> # CONFIG_SYSV68_PARTITION is not set
> CONFIG_CMDLINE_PARTITION=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_IOSCHED_NOOP=3Dy
> CONFIG_IOSCHED_DEADLINE=3Dy
> CONFIG_IOSCHED_CFQ=3Dy
> # CONFIG_CFQ_GROUP_IOSCHED is not set
> # CONFIG_DEFAULT_DEADLINE is not set
> CONFIG_DEFAULT_CFQ=3Dy
> # CONFIG_DEFAULT_NOOP is not set
> CONFIG_DEFAULT_IOSCHED=3D"cfq"
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
> # CONFIG_X86_BIGSMP is not set
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> # CONFIG_X86_INTEL_LPSS is not set
> # CONFIG_IOSF_MBI is not set
> CONFIG_X86_32_IRIS=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> # CONFIG_PARAVIRT_SPINLOCKS is not set
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> # CONFIG_LGUEST_GUEST is not set
> # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_M486 is not set
> # CONFIG_M586 is not set
> # CONFIG_M586TSC is not set
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
> CONFIG_MGEODEGX1=3Dy
> # CONFIG_MGEODE_LX is not set
> # CONFIG_MCYRIXIII is not set
> # CONFIG_MVIAC3_2 is not set
> # CONFIG_MVIAC7 is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> # CONFIG_X86_GENERIC is not set
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D4
> CONFIG_X86_L1_CACHE_SHIFT=3D4
> # CONFIG_X86_PPRO_FENCE is not set
> CONFIG_X86_ALIGNMENT_16=3Dy
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D5
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> # CONFIG_CPU_SUP_INTEL is not set
> CONFIG_CPU_SUP_CYRIX_32=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_TRANSMETA_32=3Dy
> # CONFIG_CPU_SUP_UMC_32 is not set
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_NR_CPUS=3D8
> CONFIG_SCHED_SMT=3Dy
> # CONFIG_SCHED_MC is not set
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> # CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
> # CONFIG_X86_MCE is not set
> # CONFIG_VM86 is not set
> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX32=3Dy
> CONFIG_TOSHIBA=3Dy
> CONFIG_I8K=3Dy
> # CONFIG_X86_REBOOTFIXUPS is not set
> CONFIG_MICROCODE=3Dy
> # CONFIG_MICROCODE_INTEL is not set
> # CONFIG_MICROCODE_AMD is not set
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> # CONFIG_MICROCODE_INTEL_EARLY is not set
> # CONFIG_MICROCODE_AMD_EARLY is not set
> CONFIG_MICROCODE_EARLY=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> # CONFIG_NOHIGHMEM is not set
> # CONFIG_HIGHMEM4G is not set
> CONFIG_HIGHMEM64G=3Dy
> CONFIG_VMSPLIT_3G=3Dy
> # CONFIG_VMSPLIT_2G is not set
> # CONFIG_VMSPLIT_1G is not set
> CONFIG_PAGE_OFFSET=3D0xC0000000
> CONFIG_HIGHMEM=3Dy
> CONFIG_X86_PAE=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
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
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> # CONFIG_BOUNCE is not set
> CONFIG_NEED_BOUNCE_POOL=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS is not set
> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_FRONTSWAP is not set
> CONFIG_CMA=3Dy
> CONFIG_CMA_DEBUG=3Dy
> CONFIG_CMA_AREAS=3D7
> CONFIG_ZPOOL=3Dy
> # CONFIG_ZBUD is not set
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> # CONFIG_HIGHPTE is not set
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MATH_EMULATION=3Dy
> # CONFIG_MTRR is not set
> CONFIG_ARCH_RANDOM=3Dy
> # CONFIG_X86_SMAP is not set
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> # CONFIG_SCHED_HRTICK is not set
> CONFIG_KEXEC=3Dy
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> CONFIG_DEBUG_HOTPLUG_CPU0=3Dy
> # CONFIG_COMPAT_VDSO is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> # CONFIG_ACPI_VIDEO is not set
> CONFIG_ACPI_FAN=3Dy
> # CONFIG_ACPI_DOCK is not set
> CONFIG_ACPI_PROCESSOR=3Dy
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
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_SFI=3Dy
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
> CONFIG_PCI_DOMAINS=3Dy
> # CONFIG_PCI_CNB20LE_QUIRK is not set
> # CONFIG_PCIEPORTBUS is not set
> # CONFIG_PCI_MSI is not set
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_HT_IRQ=3Dy
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
> # CONFIG_EISA is not set
> # CONFIG_SCx200 is not set
> CONFIG_ALIX=3Dy
> CONFIG_NET5501=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> CONFIG_CARDBUS=3Dy
> =

> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> # CONFIG_PD6729 is not set
> # CONFIG_I82092 is not set
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
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> # CONFIG_FIRMWARE_IN_KERNEL is not set
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> # CONFIG_ALLOW_DEV_COREDUMP is not set
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_SYS_HYPERVISOR is not set
> # CONFIG_GENERIC_CPU_DEVICES is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dy
> CONFIG_REGMAP_SPI=3Dy
> CONFIG_REGMAP_SPMI=3Dy
> CONFIG_REGMAP_MMIO=3Dy
> CONFIG_REGMAP_IRQ=3Dy
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_FENCE_TRACE is not set
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
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> CONFIG_MTD_AR7_PARTS=3Dy
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=3Dy
> CONFIG_MTD_BLOCK=3Dy
> CONFIG_FTL=3Dy
> CONFIG_NFTL=3Dy
> # CONFIG_NFTL_RW is not set
> CONFIG_INFTL=3Dy
> CONFIG_RFD_FTL=3Dy
> # CONFIG_SSFDC is not set
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
> CONFIG_MTD_CFI_INTELEXT=3Dy
> CONFIG_MTD_CFI_AMDSTD=3Dy
> CONFIG_MTD_CFI_STAA=3Dy
> CONFIG_MTD_CFI_UTIL=3Dy
> # CONFIG_MTD_RAM is not set
> # CONFIG_MTD_ROM is not set
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> # CONFIG_MTD_COMPLEX_MAPPINGS is not set
> CONFIG_MTD_PHYSMAP=3Dy
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_AMD76XROM=3Dy
> CONFIG_MTD_ICHXROM=3Dy
> # CONFIG_MTD_ESB2ROM is not set
> # CONFIG_MTD_CK804XROM is not set
> # CONFIG_MTD_SCB2_FLASH is not set
> # CONFIG_MTD_NETtel is not set
> CONFIG_MTD_L440GX=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> =

> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> CONFIG_MTD_DATAFLASH=3Dy
> # CONFIG_MTD_DATAFLASH_WRITE_VERIFY is not set
> CONFIG_MTD_DATAFLASH_OTP=3Dy
> CONFIG_MTD_M25P80=3Dy
> CONFIG_MTD_SST25L=3Dy
> CONFIG_MTD_SLRAM=3Dy
> CONFIG_MTD_PHRAM=3Dy
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
> # CONFIG_MTD_NAND_ECC_BCH is not set
> # CONFIG_MTD_SM_COMMON is not set
> CONFIG_MTD_NAND_DENALI=3Dy
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> # CONFIG_MTD_NAND_RICOH is not set
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> # CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH is not set
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=3Dy
> CONFIG_MTD_NAND_DOCG4=3Dy
> # CONFIG_MTD_NAND_CAFE is not set
> # CONFIG_MTD_NAND_CS553X is not set
> CONFIG_MTD_NAND_NANDSIM=3Dy
> CONFIG_MTD_NAND_PLATFORM=3Dy
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> CONFIG_MTD_SPI_NOR=3Dy
> # CONFIG_MTD_SPI_NOR_USE_4K_SECTORS is not set
> # CONFIG_MTD_UBI is not set
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
> CONFIG_BLK_DEV_NULL_BLK=3Dy
> # CONFIG_BLK_DEV_FD is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_CPQ_CISS_DA is not set
> # CONFIG_BLK_DEV_DAC960 is not set
> # CONFIG_BLK_DEV_UMEM is not set
> # CONFIG_BLK_DEV_COW_COMMON is not set
> CONFIG_BLK_DEV_LOOP=3Dy
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D8
> CONFIG_BLK_DEV_CRYPTOLOOP=3Dy
> =

> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> # CONFIG_BLK_DEV_NBD is not set
> # CONFIG_BLK_DEV_NVME is not set
> # CONFIG_BLK_DEV_OSD is not set
> # CONFIG_BLK_DEV_SX8 is not set
> # CONFIG_BLK_DEV_RAM is not set
> CONFIG_CDROM_PKTCDVD=3Dy
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> # CONFIG_VIRTIO_BLK is not set
> CONFIG_BLK_DEV_HD=3Dy
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # Misc devices
> #
> # CONFIG_SENSORS_LIS3LV02D is not set
> CONFIG_AD525X_DPOT=3Dy
> # CONFIG_AD525X_DPOT_I2C is not set
> CONFIG_AD525X_DPOT_SPI=3Dy
> CONFIG_DUMMY_IRQ=3Dy
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> # CONFIG_SGI_IOC4 is not set
> # CONFIG_TIFM_CORE is not set
> CONFIG_ICS932S401=3Dy
> CONFIG_ENCLOSURE_SERVICES=3Dy
> # CONFIG_HP_ILO is not set
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> # CONFIG_ISL29020 is not set
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1780=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> # CONFIG_HMC6352 is not set
> CONFIG_DS1682=3Dy
> # CONFIG_TI_DAC7512 is not set
> # CONFIG_VMWARE_BALLOON is not set
> CONFIG_BMP085=3Dy
> # CONFIG_BMP085_I2C is not set
> CONFIG_BMP085_SPI=3Dy
> # CONFIG_PCH_PHUB is not set
> CONFIG_USB_SWITCH_FSA9480=3Dy
> CONFIG_LATTICE_ECP3_CONFIG=3Dy
> # CONFIG_SRAM is not set
> # CONFIG_C2PORT is not set
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
> # CONFIG_CB710_CORE is not set
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # CONFIG_SENSORS_LIS3_I2C is not set
> =

> #
> # Altera FPGA firmware download module
> #
> CONFIG_ALTERA_STAPL=3Dy
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
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
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
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dy
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_CHR_DEV_OSST=3Dy
> CONFIG_BLK_DEV_SR=3Dy
> # CONFIG_BLK_DEV_SR_VENDOR is not set
> CONFIG_CHR_DEV_SG=3Dy
> CONFIG_CHR_DEV_SCH=3Dy
> CONFIG_SCSI_ENCLOSURE=3Dy
> # CONFIG_SCSI_CONSTANTS is not set
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
> # CONFIG_SCSI_SAS_ATA is not set
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dy
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_LOWLEVEL_PCMCIA is not set
> CONFIG_SCSI_DH=3Dy
> # CONFIG_SCSI_DH_RDAC is not set
> # CONFIG_SCSI_DH_HP_SW is not set
> # CONFIG_SCSI_DH_EMC is not set
> CONFIG_SCSI_DH_ALUA=3Dy
> CONFIG_SCSI_OSD_INITIATOR=3Dy
> CONFIG_SCSI_OSD_ULD=3Dy
> CONFIG_SCSI_OSD_DPRINT_SENSE=3D1
> # CONFIG_SCSI_OSD_DEBUG is not set
> CONFIG_ATA=3Dy
> # CONFIG_ATA_NONSTANDARD is not set
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> # CONFIG_SATA_PMP is not set
> =

> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> CONFIG_SATA_AHCI_PLATFORM=3Dy
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> # CONFIG_ATA_PIIX is not set
> CONFIG_SATA_MV=3Dy
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CS5520 is not set
> # CONFIG_PATA_CS5530 is not set
> # CONFIG_PATA_CS5535 is not set
> # CONFIG_PATA_CS5536 is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SC1200 is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> CONFIG_PATA_PCMCIA=3Dy
> CONFIG_PATA_PLATFORM=3Dy
> # CONFIG_PATA_QDI is not set
> # CONFIG_PATA_RZ1000 is not set
> CONFIG_PATA_WINBOND_VLB=3Dy
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> # CONFIG_ATA_GENERIC is not set
> CONFIG_PATA_LEGACY=3Dy
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> # CONFIG_MD_AUTODETECT is not set
> # CONFIG_MD_LINEAR is not set
> # CONFIG_MD_RAID0 is not set
> CONFIG_MD_RAID1=3Dy
> CONFIG_MD_RAID10=3Dy
> CONFIG_MD_RAID456=3Dy
> CONFIG_MD_MULTIPATH=3Dy
> # CONFIG_MD_FAULTY is not set
> # CONFIG_BCACHE is not set
> # CONFIG_BLK_DEV_DM is not set
> CONFIG_TARGET_CORE=3Dy
> # CONFIG_TCM_IBLOCK is not set
> CONFIG_TCM_FILEIO=3Dy
> CONFIG_TCM_PSCSI=3Dy
> # CONFIG_TCM_USER is not set
> CONFIG_LOOPBACK_TARGET=3Dy
> # CONFIG_ISCSI_TARGET is not set
> # CONFIG_SBP_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dy
> # CONFIG_FIREWIRE_OHCI is not set
> # CONFIG_FIREWIRE_SBP2 is not set
> # CONFIG_FIREWIRE_NOSY is not set
> # CONFIG_I2O is not set
> CONFIG_MACINTOSH_DRIVERS=3Dy
> # CONFIG_NETDEVICES is not set
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
> # CONFIG_INPUT_MOUSEDEV is not set
> CONFIG_INPUT_JOYDEV=3Dy
> CONFIG_INPUT_EVDEV=3Dy
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
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TC3589X is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CROS_EC is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> # CONFIG_MOUSE_PS2_ALPS is not set
> # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
> # CONFIG_MOUSE_PS2_SYNAPTICS is not set
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> # CONFIG_MOUSE_PS2_ELANTECH is not set
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_SERIAL=3Dy
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dy
> CONFIG_MOUSE_ELAN_I2C=3Dy
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> # CONFIG_MOUSE_INPORT is not set
> # CONFIG_MOUSE_LOGIBM is not set
> CONFIG_MOUSE_PC110PAD=3Dy
> # CONFIG_MOUSE_VSXXXAA is not set
> CONFIG_MOUSE_GPIO=3Dy
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> CONFIG_INPUT_TABLET=3Dy
> # CONFIG_TABLET_USB_ACECAD is not set
> # CONFIG_TABLET_USB_AIPTEK is not set
> # CONFIG_TABLET_USB_HANWANG is not set
> # CONFIG_TABLET_USB_KBTAB is not set
> CONFIG_TABLET_SERIAL_WACOM4=3Dy
> # CONFIG_INPUT_TOUCHSCREEN is not set
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_AD714X=3Dy
> # CONFIG_INPUT_AD714X_I2C is not set
> # CONFIG_INPUT_AD714X_SPI is not set
> CONFIG_INPUT_BMA150=3Dy
> # CONFIG_INPUT_MAX8925_ONKEY is not set
> # CONFIG_INPUT_MC13783_PWRBUTTON is not set
> CONFIG_INPUT_MMA8450=3Dy
> CONFIG_INPUT_MPU3050=3Dy
> # CONFIG_INPUT_APANEL is not set
> # CONFIG_INPUT_GP2A is not set
> CONFIG_INPUT_GPIO_BEEPER=3Dy
> # CONFIG_INPUT_GPIO_TILT_POLLED is not set
> CONFIG_INPUT_WISTRON_BTNS=3Dy
> # CONFIG_INPUT_ATLAS_BTNS is not set
> # CONFIG_INPUT_ATI_REMOTE2 is not set
> # CONFIG_INPUT_KEYSPAN_REMOTE is not set
> CONFIG_INPUT_KXTJ9=3Dy
> # CONFIG_INPUT_KXTJ9_POLLED_MODE is not set
> # CONFIG_INPUT_POWERMATE is not set
> # CONFIG_INPUT_YEALINK is not set
> # CONFIG_INPUT_CM109 is not set
> CONFIG_INPUT_UINPUT=3Dy
> # CONFIG_INPUT_PALMAS_PWRBUTTON is not set
> CONFIG_INPUT_PCF50633_PMU=3Dy
> CONFIG_INPUT_PCF8574=3Dy
> CONFIG_INPUT_PWM_BEEPER=3Dy
> CONFIG_INPUT_GPIO_ROTARY_ENCODER=3Dy
> # CONFIG_INPUT_DA9055_ONKEY is not set
> CONFIG_INPUT_WM831X_ON=3Dy
> CONFIG_INPUT_ADXL34X=3Dy
> CONFIG_INPUT_ADXL34X_I2C=3Dy
> # CONFIG_INPUT_ADXL34X_SPI is not set
> CONFIG_INPUT_CMA3000=3Dy
> # CONFIG_INPUT_CMA3000_I2C is not set
> CONFIG_INPUT_IDEAPAD_SLIDEBAR=3Dy
> CONFIG_INPUT_DRV260X_HAPTICS=3Dy
> # CONFIG_INPUT_DRV2667_HAPTICS is not set
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
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=3Dy
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> # CONFIG_GAMEPORT_L4 is not set
> # CONFIG_GAMEPORT_EMU10K1 is not set
> # CONFIG_GAMEPORT_FM801 is not set
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
> # CONFIG_UNIX98_PTYS is not set
> # CONFIG_LEGACY_PTYS is not set
> # CONFIG_SERIAL_NONSTANDARD is not set
> # CONFIG_NOZOMI is not set
> # CONFIG_N_GSM is not set
> CONFIG_TRACE_ROUTER=3Dy
> CONFIG_TRACE_SINK=3Dy
> CONFIG_DEVKMEM=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> # CONFIG_SERIAL_8250_PNP is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_CS=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> # CONFIG_SERIAL_8250_MANY_PORTS is not set
> # CONFIG_SERIAL_8250_SHARE_IRQ is not set
> CONFIG_SERIAL_8250_DETECT_IRQ=3Dy
> # CONFIG_SERIAL_8250_RSA is not set
> CONFIG_SERIAL_8250_DW=3Dy
> CONFIG_SERIAL_8250_FINTEK=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> CONFIG_SERIAL_MAX310X=3Dy
> # CONFIG_SERIAL_MFD_HSU is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> CONFIG_SERIAL_SCCNXP=3Dy
> CONFIG_SERIAL_SCCNXP_CONSOLE=3Dy
> CONFIG_SERIAL_SC16IS7XX=3Dy
> CONFIG_SERIAL_TIMBERDALE=3Dy
> CONFIG_SERIAL_ALTERA_JTAGUART=3Dy
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
> CONFIG_SERIAL_ALTERA_UART=3Dy
> CONFIG_SERIAL_ALTERA_UART_MAXPORTS=3D4
> CONFIG_SERIAL_ALTERA_UART_BAUDRATE=3D115200
> CONFIG_SERIAL_ALTERA_UART_CONSOLE=3Dy
> # CONFIG_SERIAL_IFX6X60 is not set
> # CONFIG_SERIAL_PCH_UART is not set
> CONFIG_SERIAL_ARC=3Dy
> CONFIG_SERIAL_ARC_CONSOLE=3Dy
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> CONFIG_SERIAL_FSL_LPUART=3Dy
> CONFIG_SERIAL_FSL_LPUART_CONSOLE=3Dy
> CONFIG_SERIAL_MEN_Z135=3Dy
> CONFIG_TTY_PRINTK=3Dy
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_VIRTIO_CONSOLE=3Dy
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_HW_RANDOM=3Dy
> # CONFIG_HW_RANDOM_TIMERIOMEM is not set
> CONFIG_HW_RANDOM_INTEL=3Dy
> CONFIG_HW_RANDOM_AMD=3Dy
> CONFIG_HW_RANDOM_GEODE=3Dy
> CONFIG_HW_RANDOM_VIA=3Dy
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> # CONFIG_NVRAM is not set
> CONFIG_DTLK=3Dy
> CONFIG_R3964=3Dy
> # CONFIG_APPLICOM is not set
> # CONFIG_SONYPI is not set
> =

> #
> # PCMCIA character devices
> #
> CONFIG_SYNCLINK_CS=3Dy
> # CONFIG_CARDMAN_4000 is not set
> CONFIG_CARDMAN_4040=3Dy
> # CONFIG_MWAVE is not set
> CONFIG_PC8736x_GPIO=3Dy
> CONFIG_NSC_GPIO=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D256
> # CONFIG_HPET is not set
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> # CONFIG_TCG_TIS is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dy
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TCG_ST33_I2C=3Dy
> CONFIG_TELCLOCK=3Dy
> CONFIG_DEVPORT=3Dy
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
> # CONFIG_I2C_MUX is not set
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
> CONFIG_I2C_CBUS_GPIO=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EG20T is not set
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dy
> CONFIG_I2C_OCORES=3Dy
> # CONFIG_I2C_PCA_PLATFORM is not set
> # CONFIG_I2C_PXA_PCI is not set
> CONFIG_I2C_SIMTEC=3Dy
> CONFIG_I2C_XILINX=3Dy
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_PCA_ISA is not set
> CONFIG_I2C_CROS_EC_TUNNEL=3Dy
> # CONFIG_SCx200_ACB is not set
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
> CONFIG_SPI_BITBANG=3Dy
> # CONFIG_SPI_GPIO is not set
> CONFIG_SPI_OC_TINY=3Dy
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_PXA2XX_PCI is not set
> CONFIG_SPI_SC18IS602=3Dy
> # CONFIG_SPI_TOPCLIFF_PCH is not set
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_DESIGNWARE is not set
> =

> #
> # SPI Protocol Masters
> #
> CONFIG_SPI_SPIDEV=3Dy
> CONFIG_SPI_TLE62X0=3Dy
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
> # CONFIG_PPS_CLIENT_KTIMER is not set
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
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> # CONFIG_GPIO_SYSFS is not set
> CONFIG_GPIO_GENERIC=3Dy
> # CONFIG_GPIO_DA9055 is not set
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers:
> #
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_IT8761E=3Dy
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_ICH is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_LYNXPOINT is not set
> =

> #
> # I2C GPIO expanders:
> #
> CONFIG_GPIO_ARIZONA=3Dy
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=3Dy
> CONFIG_GPIO_MAX732X_IRQ=3Dy
> CONFIG_GPIO_PCA953X=3Dy
> CONFIG_GPIO_PCA953X_IRQ=3Dy
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_SX150X is not set
> CONFIG_GPIO_TC3589X=3Dy
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_WM831X=3Dy
> CONFIG_GPIO_WM8350=3Dy
> CONFIG_GPIO_WM8994=3Dy
> # CONFIG_GPIO_ADP5520 is not set
> CONFIG_GPIO_ADP5588=3Dy
> CONFIG_GPIO_ADP5588_IRQ=3Dy
> =

> #
> # PCI GPIO expanders:
> #
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_INTEL_MID is not set
> # CONFIG_GPIO_PCH is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders:
> #
> CONFIG_GPIO_MAX7301=3Dy
> # CONFIG_GPIO_MCP23S08 is not set
> # CONFIG_GPIO_MC33880 is not set
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
> CONFIG_W1=3Dy
> =

> #
> # 1-wire Bus Masters
> #
> # CONFIG_W1_MASTER_MATROX is not set
> CONFIG_W1_MASTER_DS2482=3Dy
> # CONFIG_W1_MASTER_DS1WM is not set
> CONFIG_W1_MASTER_GPIO=3Dy
> =

> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=3Dy
> CONFIG_W1_SLAVE_SMEM=3Dy
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> CONFIG_W1_SLAVE_DS2406=3Dy
> CONFIG_W1_SLAVE_DS2423=3Dy
> # CONFIG_W1_SLAVE_DS2431 is not set
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> # CONFIG_W1_SLAVE_BQ27000 is not set
> CONFIG_POWER_SUPPLY=3Dy
> CONFIG_POWER_SUPPLY_DEBUG=3Dy
> # CONFIG_PDA_POWER is not set
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> CONFIG_MAX8925_POWER=3Dy
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_WM8350_POWER is not set
> CONFIG_TEST_POWER=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> CONFIG_BATTERY_DS2780=3Dy
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_BATTERY_BQ27x00 is not set
> # CONFIG_BATTERY_DA9030 is not set
> CONFIG_BATTERY_MAX17040=3Dy
> CONFIG_BATTERY_MAX17042=3Dy
> CONFIG_CHARGER_PCF50633=3Dy
> CONFIG_CHARGER_MAX8903=3Dy
> # CONFIG_CHARGER_LP8727 is not set
> CONFIG_CHARGER_LP8788=3Dy
> CONFIG_CHARGER_GPIO=3Dy
> CONFIG_CHARGER_MAX14577=3Dy
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24735=3Dy
> # CONFIG_CHARGER_SMB347 is not set
> CONFIG_CHARGER_TPS65090=3Dy
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_AVS is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> # CONFIG_SENSORS_AD7414 is not set
> CONFIG_SENSORS_AD7418=3Dy
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> CONFIG_SENSORS_ADM1029=3Dy
> # CONFIG_SENSORS_ADM1031 is not set
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> # CONFIG_SENSORS_ADT7410 is not set
> CONFIG_SENSORS_ADT7411=3Dy
> # CONFIG_SENSORS_ADT7462 is not set
> CONFIG_SENSORS_ADT7470=3Dy
> # CONFIG_SENSORS_ADT7475 is not set
> CONFIG_SENSORS_ASC7621=3Dy
> # CONFIG_SENSORS_K8TEMP is not set
> # CONFIG_SENSORS_K10TEMP is not set
> # CONFIG_SENSORS_FAM15H_POWER is not set
> CONFIG_SENSORS_APPLESMC=3Dy
> CONFIG_SENSORS_ASB100=3Dy
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> # CONFIG_SENSORS_DS1621 is not set
> CONFIG_SENSORS_DA9055=3Dy
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> # CONFIG_SENSORS_MC13783_ADC is not set
> CONFIG_SENSORS_FSCHMD=3Dy
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> CONFIG_SENSORS_HIH6130=3Dy
> # CONFIG_SENSORS_IIO_HWMON is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> CONFIG_SENSORS_IT87=3Dy
> # CONFIG_SENSORS_JC42 is not set
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dy
> # CONFIG_SENSORS_LTC2945 is not set
> CONFIG_SENSORS_LTC4151=3Dy
> CONFIG_SENSORS_LTC4215=3Dy
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dy
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX16065 is not set
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> # CONFIG_SENSORS_MAX6642 is not set
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> # CONFIG_SENSORS_HTU21 is not set
> CONFIG_SENSORS_MCP3021=3Dy
> # CONFIG_SENSORS_MENF21BMC_HWMON is not set
> CONFIG_SENSORS_ADCXX=3Dy
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> CONFIG_SENSORS_LM75=3Dy
> # CONFIG_SENSORS_LM77 is not set
> CONFIG_SENSORS_LM78=3Dy
> CONFIG_SENSORS_LM80=3Dy
> # CONFIG_SENSORS_LM83 is not set
> CONFIG_SENSORS_LM85=3Dy
> CONFIG_SENSORS_LM87=3Dy
> # CONFIG_SENSORS_LM90 is not set
> # CONFIG_SENSORS_LM92 is not set
> CONFIG_SENSORS_LM93=3Dy
> CONFIG_SENSORS_LM95234=3Dy
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> # CONFIG_SENSORS_PC87360 is not set
> CONFIG_SENSORS_PC87427=3Dy
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> CONFIG_SENSORS_NCT6683=3Dy
> CONFIG_SENSORS_NCT6775=3Dy
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> CONFIG_PMBUS=3Dy
> CONFIG_SENSORS_PMBUS=3Dy
> # CONFIG_SENSORS_ADM1275 is not set
> CONFIG_SENSORS_LM25066=3Dy
> CONFIG_SENSORS_LTC2978=3Dy
> # CONFIG_SENSORS_LTC2978_REGULATOR is not set
> CONFIG_SENSORS_MAX16064=3Dy
> CONFIG_SENSORS_MAX34440=3Dy
> CONFIG_SENSORS_MAX8688=3Dy
> # CONFIG_SENSORS_TPS40422 is not set
> CONFIG_SENSORS_UCD9000=3Dy
> # CONFIG_SENSORS_UCD9200 is not set
> CONFIG_SENSORS_ZL6100=3Dy
> CONFIG_SENSORS_SHT15=3Dy
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHTC1=3Dy
> # CONFIG_SENSORS_SIS5595 is not set
> CONFIG_SENSORS_DME1737=3Dy
> CONFIG_SENSORS_EMC1403=3Dy
> CONFIG_SENSORS_EMC2103=3Dy
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> # CONFIG_SENSORS_SCH56XX_COMMON is not set
> CONFIG_SENSORS_SMM665=3Dy
> CONFIG_SENSORS_ADC128D818=3Dy
> # CONFIG_SENSORS_ADS1015 is not set
> CONFIG_SENSORS_ADS7828=3Dy
> # CONFIG_SENSORS_ADS7871 is not set
> # CONFIG_SENSORS_AMC6821 is not set
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> # CONFIG_SENSORS_THMC50 is not set
> # CONFIG_SENSORS_TMP102 is not set
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP401 is not set
> CONFIG_SENSORS_TMP421=3Dy
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> # CONFIG_SENSORS_VIA686A is not set
> # CONFIG_SENSORS_VT1211 is not set
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> # CONFIG_SENSORS_W83792D is not set
> # CONFIG_SENSORS_W83793 is not set
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> # CONFIG_SENSORS_W83L786NG is not set
> CONFIG_SENSORS_W83627HF=3Dy
> CONFIG_SENSORS_W83627EHF=3Dy
> CONFIG_SENSORS_WM831X=3Dy
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> # CONFIG_SENSORS_ATK0110 is not set
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_INT340X_THERMAL is not set
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
> CONFIG_SSB=3Dy
> CONFIG_SSB_SPROM=3Dy
> CONFIG_SSB_PCIHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCIHOST=3Dy
> # CONFIG_SSB_B43_PCI_BRIDGE is not set
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=3Dy
> CONFIG_SSB_PCMCIAHOST=3Dy
> CONFIG_SSB_SILENT=3Dy
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
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_CS5535 is not set
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_AXP20X is not set
> CONFIG_MFD_CROS_EC=3Dy
> # CONFIG_MFD_CROS_EC_I2C is not set
> CONFIG_PMIC_DA903X=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> CONFIG_HTC_PASIC3=3Dy
> CONFIG_HTC_I2CPLD=3Dy
> # CONFIG_LPC_ICH is not set
> # CONFIG_LPC_SCH is not set
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> CONFIG_MFD_KEMPLD=3Dy
> # CONFIG_MFD_88PM800 is not set
> CONFIG_MFD_88PM805=3Dy
> # CONFIG_MFD_88PM860X is not set
> CONFIG_MFD_MAX14577=3Dy
> # CONFIG_MFD_MAX77686 is not set
> # CONFIG_MFD_MAX77693 is not set
> CONFIG_MFD_MAX8907=3Dy
> CONFIG_MFD_MAX8925=3Dy
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=3Dy
> CONFIG_PCF50633_ADC=3Dy
> CONFIG_PCF50633_GPIO=3Dy
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RN5T618=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SMSC=3Dy
> CONFIG_ABX500_CORE=3Dy
> # CONFIG_AB3100_CORE is not set
> # CONFIG_MFD_SYSCON is not set
> CONFIG_MFD_TI_AM335X_TSCADC=3Dy
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=3Dy
> CONFIG_MFD_PALMAS=3Dy
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> CONFIG_MFD_TPS65218=3Dy
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=3Dy
> CONFIG_MFD_TPS65912=3Dy
> # CONFIG_MFD_TPS65912_I2C is not set
> CONFIG_MFD_TPS65912_SPI=3Dy
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> CONFIG_MFD_WL1273_CORE=3Dy
> CONFIG_MFD_LM3533=3Dy
> # CONFIG_MFD_TIMBERDALE is not set
> CONFIG_MFD_TC3589X=3Dy
> # CONFIG_MFD_TMIO is not set
> # CONFIG_MFD_VX855 is not set
> CONFIG_MFD_ARIZONA=3Dy
> # CONFIG_MFD_ARIZONA_I2C is not set
> CONFIG_MFD_ARIZONA_SPI=3Dy
> CONFIG_MFD_WM5102=3Dy
> # CONFIG_MFD_WM5110 is not set
> CONFIG_MFD_WM8997=3Dy
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=3Dy
> CONFIG_MFD_WM831X_I2C=3Dy
> # CONFIG_MFD_WM831X_SPI is not set
> CONFIG_MFD_WM8350=3Dy
> CONFIG_MFD_WM8350_I2C=3Dy
> CONFIG_MFD_WM8994=3Dy
> CONFIG_REGULATOR=3Dy
> # CONFIG_REGULATOR_DEBUG is not set
> CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
> CONFIG_REGULATOR_VIRTUAL_CONSUMER=3Dy
> CONFIG_REGULATOR_USERSPACE_CONSUMER=3Dy
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> CONFIG_REGULATOR_DA903X=3Dy
> CONFIG_REGULATOR_DA9055=3Dy
> CONFIG_REGULATOR_DA9210=3Dy
> # CONFIG_REGULATOR_DA9211 is not set
> # CONFIG_REGULATOR_FAN53555 is not set
> # CONFIG_REGULATOR_GPIO is not set
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LP3971 is not set
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LP8788=3Dy
> # CONFIG_REGULATOR_LTC3589 is not set
> CONFIG_REGULATOR_MAX14577=3Dy
> CONFIG_REGULATOR_MAX1586=3Dy
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dy
> CONFIG_REGULATOR_MAX8925=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> CONFIG_REGULATOR_MAX8973=3Dy
> CONFIG_REGULATOR_MC13XXX_CORE=3Dy
> CONFIG_REGULATOR_MC13783=3Dy
> # CONFIG_REGULATOR_MC13892 is not set
> CONFIG_REGULATOR_PALMAS=3Dy
> CONFIG_REGULATOR_PCF50633=3Dy
> CONFIG_REGULATOR_PFUZE100=3Dy
> CONFIG_REGULATOR_PWM=3Dy
> # CONFIG_REGULATOR_RN5T618 is not set
> # CONFIG_REGULATOR_TPS51632 is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> CONFIG_REGULATOR_TPS6507X=3Dy
> # CONFIG_REGULATOR_TPS65090 is not set
> CONFIG_REGULATOR_TPS65217=3Dy
> CONFIG_REGULATOR_TPS6524X=3Dy
> # CONFIG_REGULATOR_TPS65910 is not set
> CONFIG_REGULATOR_TPS65912=3Dy
> # CONFIG_REGULATOR_WM831X is not set
> # CONFIG_REGULATOR_WM8350 is not set
> CONFIG_REGULATOR_WM8994=3Dy
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> # CONFIG_VGA_SWITCHEROO is not set
> =

> #
> # Direct Rendering Manager
> #
> CONFIG_DRM=3Dy
> # CONFIG_DRM_PTN3460 is not set
> # CONFIG_DRM_TDFX is not set
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_NOUVEAU is not set
> # CONFIG_DRM_I915 is not set
> # CONFIG_DRM_MGA is not set
> # CONFIG_DRM_VIA is not set
> # CONFIG_DRM_SAVAGE is not set
> # CONFIG_DRM_VMWGFX is not set
> # CONFIG_DRM_GMA500 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> # CONFIG_DRM_MGAG200 is not set
> # CONFIG_DRM_CIRRUS_QEMU is not set
> # CONFIG_DRM_QXL is not set
> # CONFIG_DRM_BOCHS is not set
> =

> #
> # Frame buffer Devices
> #
> # CONFIG_FB is not set
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> CONFIG_LCD_L4F00242T03=3Dy
> # CONFIG_LCD_LMS283GF05 is not set
> CONFIG_LCD_LTV350QV=3Dy
> CONFIG_LCD_ILI922X=3Dy
> CONFIG_LCD_ILI9320=3Dy
> CONFIG_LCD_TDO24M=3Dy
> CONFIG_LCD_VGG2432A4=3Dy
> # CONFIG_LCD_PLATFORM is not set
> # CONFIG_LCD_S6E63M0 is not set
> # CONFIG_LCD_LD9040 is not set
> CONFIG_LCD_AMS369FG06=3Dy
> # CONFIG_LCD_LMS501KF03 is not set
> CONFIG_LCD_HX8357=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_GENERIC is not set
> CONFIG_BACKLIGHT_LM3533=3Dy
> CONFIG_BACKLIGHT_PWM=3Dy
> CONFIG_BACKLIGHT_DA903X=3Dy
> CONFIG_BACKLIGHT_MAX8925=3Dy
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dy
> # CONFIG_BACKLIGHT_ADP5520 is not set
> CONFIG_BACKLIGHT_ADP8860=3Dy
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_PCF50633 is not set
> CONFIG_BACKLIGHT_LM3630A=3Dy
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dy
> CONFIG_BACKLIGHT_LP8788=3Dy
> # CONFIG_BACKLIGHT_TPS65217 is not set
> CONFIG_BACKLIGHT_GPIO=3Dy
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> # CONFIG_VGASTATE is not set
> CONFIG_HDMI=3Dy
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> CONFIG_SOUND_OSS_CORE_PRECLAIM=3Dy
> # CONFIG_SND is not set
> CONFIG_SOUND_PRIME=3Dy
> CONFIG_SOUND_OSS=3Dy
> # CONFIG_SOUND_TRACEINIT is not set
> # CONFIG_SOUND_DMAP is not set
> CONFIG_SOUND_VMIDI=3Dy
> CONFIG_SOUND_TRIX=3Dy
> CONFIG_SOUND_MSS=3Dy
> # CONFIG_SOUND_MPU401 is not set
> # CONFIG_SOUND_PAS is not set
> CONFIG_SOUND_PSS=3Dy
> CONFIG_PSS_MIXER=3Dy
> CONFIG_SOUND_SB=3Dy
> CONFIG_SOUND_YM3812=3Dy
> CONFIG_SOUND_UART6850=3Dy
> CONFIG_SOUND_AEDSP16=3Dy
> CONFIG_SC6600=3Dy
> # CONFIG_SC6600_JOY is not set
> CONFIG_SC6600_CDROM=3D4
> CONFIG_SC6600_CDROMBASE=3D0
> CONFIG_SOUND_KAHLUA=3Dy
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> # CONFIG_HID_BATTERY_STRENGTH is not set
> CONFIG_HIDRAW=3Dy
> # CONFIG_UHID is not set
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dy
> CONFIG_HID_ACRUX=3Dy
> # CONFIG_HID_ACRUX_FF is not set
> # CONFIG_HID_APPLE is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=3Dy
> # CONFIG_HID_CYPRESS is not set
> CONFIG_HID_DRAGONRISE=3Dy
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_EZKEY=3Dy
> # CONFIG_HID_KEYTOUCH is not set
> CONFIG_HID_KYE=3Dy
> # CONFIG_HID_UCLOGIC is not set
> # CONFIG_HID_WALTOP is not set
> # CONFIG_HID_GYRATION is not set
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> CONFIG_HID_MICROSOFT=3Dy
> # CONFIG_HID_MONTEREY is not set
> CONFIG_HID_MULTITOUCH=3Dy
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> # CONFIG_HID_PICOLCD_LCD is not set
> CONFIG_HID_PICOLCD_LEDS=3Dy
> # CONFIG_HID_PLANTRONICS is not set
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dy
> # CONFIG_HID_SPEEDLINK is not set
> CONFIG_HID_STEELSERIES=3Dy
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=3Dy
> # CONFIG_HID_TOPSEED is not set
> # CONFIG_HID_THINGM is not set
> CONFIG_HID_THRUSTMASTER=3Dy
> CONFIG_THRUSTMASTER_FF=3Dy
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dy
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> CONFIG_ZEROPLUS_FF=3Dy
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=3Dy
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
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_GADGET is not set
> CONFIG_UWB=3Dy
> # CONFIG_UWB_WHCI is not set
> # CONFIG_MMC is not set
> CONFIG_MEMSTICK=3Dy
> CONFIG_MEMSTICK_DEBUG=3Dy
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> # CONFIG_MSPRO_BLOCK is not set
> CONFIG_MS_BLOCK=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> =

> #
> # LED drivers
> #
> CONFIG_LEDS_LM3530=3Dy
> # CONFIG_LEDS_LM3533 is not set
> CONFIG_LEDS_LM3642=3Dy
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dy
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> # CONFIG_LEDS_LP5562 is not set
> CONFIG_LEDS_LP8501=3Dy
> CONFIG_LEDS_LP8788=3Dy
> CONFIG_LEDS_LP8860=3Dy
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> CONFIG_LEDS_WM831X_STATUS=3Dy
> CONFIG_LEDS_WM8350=3Dy
> CONFIG_LEDS_DA903X=3Dy
> CONFIG_LEDS_DAC124S085=3Dy
> CONFIG_LEDS_PWM=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> # CONFIG_LEDS_BD2802 is not set
> # CONFIG_LEDS_LT3593 is not set
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_OT200=3Dy
> CONFIG_LEDS_MENF21BMC=3Dy
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
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> CONFIG_LEDS_TRIGGER_CPU=3Dy
> CONFIG_LEDS_TRIGGER_GPIO=3Dy
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dy
> # CONFIG_LEDS_TRIGGER_CAMERA is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> CONFIG_EDAC_DEBUG=3Dy
> CONFIG_EDAC_MM_EDAC=3Dy
> # CONFIG_EDAC_AMD76X is not set
> # CONFIG_EDAC_E7XXX is not set
> # CONFIG_EDAC_E752X is not set
> # CONFIG_EDAC_I82875P is not set
> # CONFIG_EDAC_I82975X is not set
> # CONFIG_EDAC_I3000 is not set
> # CONFIG_EDAC_I3200 is not set
> # CONFIG_EDAC_IE31200 is not set
> # CONFIG_EDAC_X38 is not set
> # CONFIG_EDAC_I5400 is not set
> # CONFIG_EDAC_I82860 is not set
> # CONFIG_EDAC_R82600 is not set
> # CONFIG_EDAC_I5000 is not set
> # CONFIG_EDAC_I5100 is not set
> # CONFIG_EDAC_I7300 is not set
> CONFIG_RTC_LIB=3Dy
> # CONFIG_RTC_CLASS is not set
> # CONFIG_DMADEVICES is not set
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dy
> # CONFIG_UIO_CIF is not set
> # CONFIG_UIO_PDRV_GENIRQ is not set
> # CONFIG_UIO_DMEM_GENIRQ is not set
> # CONFIG_UIO_AEC is not set
> # CONFIG_UIO_SERCOS3 is not set
> # CONFIG_UIO_PCI_GENERIC is not set
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_MF624 is not set
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> # CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> # CONFIG_HYPERV is not set
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> # CONFIG_RTS5208 is not set
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> # CONFIG_ADIS16201 is not set
> CONFIG_ADIS16203=3Dy
> CONFIG_ADIS16204=3Dy
> # CONFIG_ADIS16209 is not set
> CONFIG_ADIS16220=3Dy
> CONFIG_ADIS16240=3Dy
> CONFIG_LIS3L02DQ=3Dy
> # CONFIG_SCA3000 is not set
> =

> #
> # Analog to digital converters
> #
> # CONFIG_AD7606 is not set
> # CONFIG_AD7780 is not set
> CONFIG_AD7816=3Dy
> # CONFIG_AD7192 is not set
> CONFIG_AD7280=3Dy
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> =

> #
> # Capacitance to digital converters
> #
> CONFIG_AD7150=3Dy
> # CONFIG_AD7152 is not set
> # CONFIG_AD7746 is not set
> =

> #
> # Direct Digital Synthesis
> #
> # CONFIG_AD9832 is not set
> CONFIG_AD9834=3Dy
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16060=3Dy
> =

> #
> # Network Analyzer, Impedance Converters
> #
> CONFIG_AD5933=3Dy
> =

> #
> # Light sensors
> #
> CONFIG_SENSORS_ISL29018=3Dy
> CONFIG_SENSORS_ISL29028=3Dy
> CONFIG_TSL2583=3Dy
> # CONFIG_TSL2x7x is not set
> =

> #
> # Magnetometer sensors
> #
> # CONFIG_SENSORS_HMC5843_I2C is not set
> # CONFIG_SENSORS_HMC5843_SPI is not set
> =

> #
> # Active energy metering IC
> #
> # CONFIG_ADE7753 is not set
> CONFIG_ADE7754=3Dy
> CONFIG_ADE7758=3Dy
> CONFIG_ADE7759=3Dy
> # CONFIG_ADE7854 is not set
> =

> #
> # Resolver to digital converters
> #
> # CONFIG_AD2S90 is not set
> # CONFIG_AD2S1200 is not set
> # CONFIG_AD2S1210 is not set
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_SIMPLE_DUMMY=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY_EVENTS is not set
> CONFIG_IIO_SIMPLE_DUMMY_BUFFER=3Dy
> # CONFIG_FT1000 is not set
> =

> #
> # Speakup console speech
> #
> CONFIG_TOUCHSCREEN_CLEARPAD_TM1217=3Dy
> CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4=3Dy
> CONFIG_STAGING_MEDIA=3Dy
> =

> #
> # Android
> #
> CONFIG_FIREWIRE_SERIAL=3Dy
> CONFIG_FWTTY_MAX_TOTAL_PORTS=3D64
> CONFIG_FWTTY_MAX_CARD_PORTS=3D32
> CONFIG_MTD_SPINAND_MT29F=3Dy
> CONFIG_MTD_SPINAND_ONDIEECC=3Dy
> # CONFIG_DGNC is not set
> CONFIG_DGAP=3Dy
> # CONFIG_GS_FPGABOOT is not set
> # CONFIG_X86_PLATFORM_DEVICES is not set
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_SOC_TI is not set
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
> # CONFIG_STE_MODEM_RPROC is not set
> =

> #
> # Rpmsg drivers
> #
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_PM_DEVFREQ is not set
> CONFIG_EXTCON=3Dy
> =

> #
> # Extcon Device Drivers
> #
> CONFIG_EXTCON_ADC_JACK=3Dy
> CONFIG_EXTCON_GPIO=3Dy
> CONFIG_EXTCON_MAX14577=3Dy
> CONFIG_EXTCON_PALMAS=3Dy
> CONFIG_EXTCON_RT8973A=3Dy
> # CONFIG_EXTCON_SM5502 is not set
> # CONFIG_MEMORY is not set
> CONFIG_IIO=3Dy
> CONFIG_IIO_BUFFER=3Dy
> # CONFIG_IIO_BUFFER_CB is not set
> CONFIG_IIO_KFIFO_BUF=3Dy
> CONFIG_IIO_TRIGGERED_BUFFER=3Dy
> CONFIG_IIO_TRIGGER=3Dy
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=3D2
> =

> #
> # Accelerometers
> #
> CONFIG_BMA180=3Dy
> CONFIG_BMC150_ACCEL=3Dy
> # CONFIG_HID_SENSOR_ACCEL_3D is not set
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> # CONFIG_KXSD9 is not set
> CONFIG_MMA8452=3Dy
> CONFIG_KXCJK1013=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> # CONFIG_AD7266 is not set
> # CONFIG_AD7291 is not set
> CONFIG_AD7298=3Dy
> # CONFIG_AD7476 is not set
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> CONFIG_AD7887=3Dy
> CONFIG_AD7923=3Dy
> # CONFIG_AD799X is not set
> CONFIG_LP8788_ADC=3Dy
> CONFIG_MAX1027=3Dy
> CONFIG_MAX1363=3Dy
> CONFIG_MCP320X=3Dy
> CONFIG_MCP3422=3Dy
> # CONFIG_MEN_Z188_ADC is not set
> CONFIG_NAU7802=3Dy
> CONFIG_QCOM_SPMI_IADC=3Dy
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADC128S052=3Dy
> CONFIG_TI_AM335X_ADC=3Dy
> =

> #
> # Amplifiers
> #
> # CONFIG_AD8366 is not set
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
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
> # CONFIG_AD5504 is not set
> CONFIG_AD5624R_SPI=3Dy
> # CONFIG_AD5686 is not set
> CONFIG_AD5755=3Dy
> CONFIG_AD5764=3Dy
> # CONFIG_AD5791 is not set
> CONFIG_AD7303=3Dy
> CONFIG_MAX517=3Dy
> CONFIG_MCP4725=3Dy
> CONFIG_MCP4922=3Dy
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
> CONFIG_ADF4350=3Dy
> =

> #
> # Digital gyroscope sensors
> #
> CONFIG_ADIS16080=3Dy
> # CONFIG_ADIS16130 is not set
> CONFIG_ADIS16136=3Dy
> CONFIG_ADIS16260=3Dy
> CONFIG_ADXRS450=3Dy
> # CONFIG_BMG160 is not set
> CONFIG_HID_SENSOR_GYRO_3D=3Dy
> # CONFIG_IIO_ST_GYRO_3AXIS is not set
> CONFIG_ITG3200=3Dy
> =

> #
> # Humidity sensors
> #
> CONFIG_DHT11=3Dy
> # CONFIG_SI7005 is not set
> CONFIG_SI7020=3Dy
> =

> #
> # Inertial measurement units
> #
> CONFIG_ADIS16400=3Dy
> CONFIG_ADIS16480=3Dy
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> CONFIG_ADJD_S311=3Dy
> CONFIG_AL3320A=3Dy
> CONFIG_APDS9300=3Dy
> CONFIG_CM32181=3Dy
> # CONFIG_CM36651 is not set
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_ISL29125=3Dy
> # CONFIG_HID_SENSOR_ALS is not set
> CONFIG_HID_SENSOR_PROX=3Dy
> # CONFIG_SENSORS_LM3533 is not set
> CONFIG_LTR501=3Dy
> # CONFIG_TCS3414 is not set
> CONFIG_TCS3472=3Dy
> # CONFIG_SENSORS_TSL2563 is not set
> CONFIG_TSL4531=3Dy
> CONFIG_VCNL4000=3Dy
> =

> #
> # Magnetometer sensors
> #
> CONFIG_AK8975=3Dy
> CONFIG_AK09911=3Dy
> # CONFIG_MAG3110 is not set
> CONFIG_HID_SENSOR_MAGNETOMETER_3D=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
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
> CONFIG_IIO_INTERRUPT_TRIGGER=3Dy
> # CONFIG_IIO_SYSFS_TRIGGER is not set
> =

> #
> # Pressure sensors
> #
> # CONFIG_BMP280 is not set
> # CONFIG_HID_SENSOR_PRESS is not set
> # CONFIG_MPL115 is not set
> # CONFIG_MPL3115 is not set
> # CONFIG_IIO_ST_PRESS is not set
> # CONFIG_T5403 is not set
> =

> #
> # Lightning sensors
> #
> CONFIG_AS3935=3Dy
> =

> #
> # Temperature sensors
> #
> # CONFIG_MLX90614 is not set
> CONFIG_TMP006=3Dy
> # CONFIG_NTB is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> CONFIG_PWM_LPSS=3Dy
> # CONFIG_PWM_LPSS_PCI is not set
> # CONFIG_PWM_LPSS_PLATFORM is not set
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> CONFIG_SERIAL_IPOCTAL=3Dy
> # CONFIG_RESET_CONTROLLER is not set
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> CONFIG_FMC_TRIVIAL=3Dy
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=3Dy
> # CONFIG_MCB_PCI is not set
> CONFIG_RAS=3Dy
> # CONFIG_THUNDERBOLT is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> # CONFIG_FIRMWARE_MEMMAP is not set
> # CONFIG_DELL_RBU is not set
> CONFIG_DCDBAS=3Dy
> # CONFIG_ISCSI_IBFT_FIND is not set
> CONFIG_GOOGLE_FIRMWARE=3Dy
> =

> #
> # Google Firmware Drivers
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
> # CONFIG_EXT2_FS_XIP is not set
> CONFIG_EXT3_FS=3Dy
> CONFIG_EXT3_DEFAULTS_TO_ORDERED=3Dy
> CONFIG_EXT3_FS_XATTR=3Dy
> # CONFIG_EXT3_FS_POSIX_ACL is not set
> CONFIG_EXT3_FS_SECURITY=3Dy
> # CONFIG_EXT4_FS is not set
> CONFIG_JBD=3Dy
> CONFIG_JBD_DEBUG=3Dy
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> CONFIG_JFS_FS=3Dy
> # CONFIG_JFS_POSIX_ACL is not set
> CONFIG_JFS_SECURITY=3Dy
> # CONFIG_JFS_DEBUG is not set
> CONFIG_JFS_STATISTICS=3Dy
> # CONFIG_OCFS2_FS is not set
> CONFIG_BTRFS_FS=3Dy
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> CONFIG_QUOTA_DEBUG=3Dy
> CONFIG_QUOTA_TREE=3Dy
> CONFIG_QFMT_V1=3Dy
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> # CONFIG_OVERLAY_FS is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=3Dy
> # CONFIG_CACHEFILES_DEBUG is not set
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dy
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> # CONFIG_UDF_FS is not set
> =

> #
> # DOS/FAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dy
> CONFIG_MSDOS_FS=3Dy
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
> # CONFIG_PROC_FS is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> # CONFIG_HUGETLBFS is not set
> # CONFIG_HUGETLB_PAGE is not set
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> CONFIG_ADFS_FS=3Dy
> CONFIG_ADFS_FS_RW=3Dy
> CONFIG_AFFS_FS=3Dy
> CONFIG_ECRYPT_FS=3Dy
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> # CONFIG_HFS_FS is not set
> CONFIG_HFSPLUS_FS=3Dy
> # CONFIG_HFSPLUS_FS_POSIX_ACL is not set
> CONFIG_BEFS_FS=3Dy
> # CONFIG_BEFS_DEBUG is not set
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
> # CONFIG_LOGFS is not set
> # CONFIG_CRAMFS is not set
> CONFIG_SQUASHFS=3Dy
> CONFIG_SQUASHFS_FILE_CACHE=3Dy
> # CONFIG_SQUASHFS_FILE_DIRECT is not set
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> # CONFIG_SQUASHFS_ZLIB is not set
> # CONFIG_SQUASHFS_LZ4 is not set
> # CONFIG_SQUASHFS_LZO is not set
> # CONFIG_SQUASHFS_XZ is not set
> CONFIG_SQUASHFS_4K_DEVBLK_SIZE=3Dy
> CONFIG_SQUASHFS_EMBEDDED=3Dy
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> CONFIG_VXFS_FS=3Dy
> CONFIG_MINIX_FS=3Dy
> CONFIG_OMFS_FS=3Dy
> CONFIG_HPFS_FS=3Dy
> # CONFIG_QNX4FS_FS is not set
> CONFIG_QNX6FS_FS=3Dy
> # CONFIG_QNX6FS_DEBUG is not set
> CONFIG_ROMFS_FS=3Dy
> # CONFIG_ROMFS_BACKED_BY_BLOCK is not set
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> # CONFIG_ROMFS_BACKED_BY_BOTH is not set
> CONFIG_ROMFS_ON_MTD=3Dy
> # CONFIG_PSTORE is not set
> CONFIG_SYSV_FS=3Dy
> CONFIG_UFS_FS=3Dy
> # CONFIG_UFS_FS_WRITE is not set
> CONFIG_UFS_DEBUG=3Dy
> # CONFIG_EXOFS_FS is not set
> CONFIG_F2FS_FS=3Dy
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> CONFIG_F2FS_FS_SECURITY=3Dy
> CONFIG_F2FS_CHECK_FS=3Dy
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> CONFIG_NLS_CODEPAGE_437=3Dy
> # CONFIG_NLS_CODEPAGE_737 is not set
> # CONFIG_NLS_CODEPAGE_775 is not set
> CONFIG_NLS_CODEPAGE_850=3Dy
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=3Dy
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> # CONFIG_NLS_CODEPAGE_865 is not set
> CONFIG_NLS_CODEPAGE_866=3Dy
> CONFIG_NLS_CODEPAGE_869=3Dy
> # CONFIG_NLS_CODEPAGE_936 is not set
> # CONFIG_NLS_CODEPAGE_950 is not set
> CONFIG_NLS_CODEPAGE_932=3Dy
> CONFIG_NLS_CODEPAGE_949=3Dy
> # CONFIG_NLS_CODEPAGE_874 is not set
> CONFIG_NLS_ISO8859_8=3Dy
> CONFIG_NLS_CODEPAGE_1250=3Dy
> CONFIG_NLS_CODEPAGE_1251=3Dy
> CONFIG_NLS_ASCII=3Dy
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=3Dy
> CONFIG_NLS_ISO8859_3=3Dy
> CONFIG_NLS_ISO8859_4=3Dy
> CONFIG_NLS_ISO8859_5=3Dy
> # CONFIG_NLS_ISO8859_6 is not set
> # CONFIG_NLS_ISO8859_7 is not set
> # CONFIG_NLS_ISO8859_9 is not set
> CONFIG_NLS_ISO8859_13=3Dy
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> CONFIG_NLS_KOI8_R=3Dy
> CONFIG_NLS_KOI8_U=3Dy
> CONFIG_NLS_MAC_ROMAN=3Dy
> CONFIG_NLS_MAC_CELTIC=3Dy
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=3Dy
> # CONFIG_NLS_MAC_CYRILLIC is not set
> CONFIG_NLS_MAC_GAELIC=3Dy
> CONFIG_NLS_MAC_GREEK=3Dy
> CONFIG_NLS_MAC_ICELAND=3Dy
> # CONFIG_NLS_MAC_INUIT is not set
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
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> CONFIG_DYNAMIC_DEBUG=3Dy
> =

> #
> # Compile-time checks and compiler options
> #
> # CONFIG_DEBUG_INFO is not set
> # CONFIG_ENABLE_WARN_DEPRECATED is not set
> CONFIG_ENABLE_MUST_CHECK=3Dy
> CONFIG_FRAME_WARN=3D1024
> # CONFIG_STRIP_ASM_SYMS is not set
> # CONFIG_READABLE_ASM is not set
> # CONFIG_UNUSED_SYMBOLS is not set
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> # CONFIG_HEADERS_CHECK is not set
> # CONFIG_DEBUG_SECTION_MISMATCH is not set
> CONFIG_ARCH_WANT_FRAME_POINTERS=3Dy
> CONFIG_FRAME_POINTER=3Dy
> CONFIG_DEBUG_FORCE_WEAK_PER_CPU=3Dy
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_KERNEL=3Dy
> =

> #
> # Memory Debugging
> #
> CONFIG_PAGE_EXTENSION=3Dy
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> CONFIG_DEBUG_STACK_USAGE=3Dy
> CONFIG_DEBUG_VM=3Dy
> # CONFIG_DEBUG_VM_VMACACHE is not set
> CONFIG_DEBUG_VM_RB=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> # CONFIG_DEBUG_MEMORY_INIT is not set
> CONFIG_MEMORY_NOTIFIER_ERROR_INJECT=3Dy
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
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> # CONFIG_SCHED_STACK_END_CHECK is not set
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
> CONFIG_DEBUG_LOCKDEP=3Dy
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=3Dy
> CONFIG_LOCK_TORTURE_TEST=3Dy
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> CONFIG_DEBUG_PI_LIST=3Dy
> CONFIG_DEBUG_SG=3Dy
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> # CONFIG_PROVE_RCU_REPEATEDLY is not set
> CONFIG_SPARSE_RCU_POINTER=3Dy
> CONFIG_TORTURE_TEST=3Dy
> CONFIG_RCU_TORTURE_TEST=3Dy
> CONFIG_RCU_TORTURE_TEST_RUNNABLE=3Dy
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_CPU_STALL_INFO=3Dy
> # CONFIG_RCU_TRACE is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> CONFIG_NOTIFIER_ERROR_INJECTION=3Dy
> CONFIG_CPU_NOTIFIER_ERROR_INJECT=3Dy
> # CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
> # CONFIG_FAULT_INJECTION is not set
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
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> CONFIG_FUNCTION_TRACER=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> # CONFIG_PROFILE_ALL_BRANCHES is not set
> CONFIG_STACK_TRACER=3Dy
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_UPROBE_EVENT=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> # CONFIG_FUNCTION_PROFILER is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE_SELFTEST=3Dy
> CONFIG_FTRACE_STARTUP_TEST=3Dy
> CONFIG_EVENT_TRACE_TEST_SYSCALLS=3Dy
> # CONFIG_MMIOTRACE is not set
> CONFIG_TRACEPOINT_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> CONFIG_RING_BUFFER_STARTUP_TEST=3Dy
> =

> #
> # Runtime Testing
> #
> # CONFIG_LKDTM is not set
> CONFIG_TEST_LIST_SORT=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_ATOMIC64_SELFTEST is not set
> CONFIG_ASYNC_RAID6_TEST=3Dy
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_FIRMWARE=3Dy
> CONFIG_TEST_UDELAY=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> # CONFIG_X86_PTDUMP is not set
> # CONFIG_DEBUG_RODATA is not set
> # CONFIG_DOUBLEFAULT is not set
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
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_STATIC_CPU_HAS is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEYS_DEBUG_PROC_KEYS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> # CONFIG_SECURITY is not set
> CONFIG_SECURITYFS=3Dy
> CONFIG_DEFAULT_SECURITY_DAC=3Dy
> CONFIG_DEFAULT_SECURITY=3D""
> CONFIG_XOR_BLOCKS=3Dy
> CONFIG_ASYNC_CORE=3Dy
> CONFIG_ASYNC_MEMCPY=3Dy
> CONFIG_ASYNC_XOR=3Dy
> CONFIG_ASYNC_PQ=3Dy
> CONFIG_ASYNC_RAID6_RECOV=3Dy
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
> # CONFIG_CRYPTO_PCRYPT is not set
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> # CONFIG_CRYPTO_AUTHENC is not set
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
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
> # CONFIG_CRYPTO_CMAC is not set
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
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> CONFIG_CRYPTO_MD5=3Dy
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> # CONFIG_CRYPTO_RMD160 is not set
> # CONFIG_CRYPTO_RMD256 is not set
> CONFIG_CRYPTO_RMD320=3Dy
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> # CONFIG_CRYPTO_SHA512 is not set
> # CONFIG_CRYPTO_TGR192 is not set
> CONFIG_CRYPTO_WP512=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_586=3Dy
> # CONFIG_CRYPTO_AES_NI_INTEL is not set
> # CONFIG_CRYPTO_ANUBIS is not set
> CONFIG_CRYPTO_ARC4=3Dy
> # CONFIG_CRYPTO_BLOWFISH is not set
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> # CONFIG_CRYPTO_CAST6 is not set
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> CONFIG_CRYPTO_KHAZAD=3Dy
> CONFIG_CRYPTO_SALSA20=3Dy
> CONFIG_CRYPTO_SALSA20_586=3Dy
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> CONFIG_CRYPTO_SERPENT_SSE2_586=3Dy
> # CONFIG_CRYPTO_TEA is not set
> CONFIG_CRYPTO_TWOFISH=3Dy
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_586=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_ZLIB=3Dy
> # CONFIG_CRYPTO_LZO is not set
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
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_AES is not set
> # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> # CONFIG_CRYPTO_DEV_GEODE is not set
> # CONFIG_CRYPTO_DEV_CCP is not set
> # CONFIG_CRYPTO_DEV_QAT_DH895xCC is not set
> # CONFIG_ASYMMETRIC_KEY_TYPE is not set
> CONFIG_HAVE_KVM=3Dy
> # CONFIG_VIRTUALIZATION is not set
> CONFIG_BINARY_PRINTF=3Dy
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
> CONFIG_PERCPU_RWSEM=3Dy
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
> # CONFIG_CRC7 is not set
> CONFIG_LIBCRC32C=3Dy
> # CONFIG_CRC8 is not set
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
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
> # CONFIG_XZ_DEC_IA64 is not set
> CONFIG_XZ_DEC_ARM=3Dy
> # CONFIG_XZ_DEC_ARMTHUMB is not set
> # CONFIG_XZ_DEC_SPARC is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> CONFIG_XZ_DEC_TEST=3Dy
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_BCH_CONST_PARAMS=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> # CONFIG_CPUMASK_OFFSTACK is not set
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> CONFIG_GLOB_SELFTEST=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> # CONFIG_AVERAGE is not set
> CONFIG_CORDIC=3Dy
> CONFIG_DDR=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy


--===============6275179176230594418==--

