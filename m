Content-Type: multipart/mixed; boundary="===============6850285735648831565=="
MIME-Version: 1.0
From: Jiang Liu <jiang.liu@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [PCI, x86] 991de2e590: EIP is at _raw_spin_unlock_irqrestore
Date: Fri, 28 Aug 2015 14:39:05 +0800
Message-ID: <55E00209.8070309@linux.intel.com>
In-Reply-To: <55dc7248.iKNpNImVAd4pyJum%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6850285735648831565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 2015/8/25 21:48, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 991de2e59090e55c65a7f59a049142e3c480f7bd
> Author:     Jiang Liu <jiang.liu@linux.intel.com>
> AuthorDate: Wed Jun 10 16:54:59 2015 +0800
> Commit:     Bjorn Helgaas <bhelgaas@google.com>
> CommitDate: Thu Jul 30 14:05:57 2015 -0500
> =

>     PCI, x86: Implement pcibios_alloc_irq() and pcibios_free_irq()
>     =

>     To support IOAPIC hotplug, we need to allocate PCI IRQ resources on d=
emand
>     and free them when not used anymore.
>     =

>     Implement pcibios_alloc_irq() and pcibios_free_irq() to dynamically
>     allocate and free PCI IRQs.
>     =

>     Remove mp_should_keep_irq(), which is no longer used.
>     =

>     [bhelgaas: changelog]
>     Signed-off-by: Jiang Liu <jiang.liu@linux.intel.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>     Acked-by: Thomas Gleixner <tglx@linutronix.de>
Hi Fengguang,
I have done some investigation about the issue, seems to
be some ACPI implementation flaws.

Acccording to following log messages, IRQ5, 9, 10, 11 have been
overridden as level high.
[ 0.000000] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
[ 0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[ 0.000000] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 0, APIC
INT 02
[ 0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
[ 0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 05, APIC ID 0, APIC
INT 05
[ 0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[ 0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 0, APIC
INT 09
[ 0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
[ 0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0a, APIC ID 0, APIC
INT 0a
[ 0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
[ 0.000000] Int: type 0, pol 1, trig 3, bus 00, IRQ 0b, APIC ID 0, APIC
INT 0b

And PCI interrupt link device LNKA/B/C/D/S uses IRQ5/9/10/11,
and PCI IRQ should work in level low mode.
[ 15.295637] ACPI: PCI Interrupt Link [LNKA] (IRQs
[ 15.295637] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 5 *10 *10 11 11))

[ 15.344929] ACPI: PCI Interrupt Link [LNKB] (IRQs
[ 15.344929] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 5 *10 *10 11 11))

[ 15.398745] ACPI: PCI Interrupt Link [LNKC] (IRQs
[ 15.398745] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 5 10 10 *11 *11))

[ 15.424975] ACPI: PCI Interrupt Link [LNKD] (IRQs
[ 15.424975] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 5 10 10 *11 *11))

[ 15.428413] ACPI: PCI Interrupt Link [LNKS] (IRQs
[ 15.428413] ACPI: PCI Interrupt Link [LNKS] (IRQs *9 *9))

And then when kernel enables IRQ9, it causes interrupt storm when
enabling irq9.
[ 17.360637] pciback 0000:00:01.1: irqdomain: alloc irq
[ 17.360637] pciback 0000:00:01.1: irqdomain: alloc irq
[ 17.363210] pciback 0000:00:01.1: irqdomain: free irq0
[ 17.363210] pciback 0000:00:01.1: irqdomain: free irq0
[ 17.381132] pciback 0000:00:01.3: irqdomain: alloc irq
[ 17.381132] pciback 0000:00:01.3: irqdomain: alloc irq
[ 18.088161] hrtimer: interrupt took 5374396 ns
[ 18.088161] hrtimer: interrupt took 5374396 ns
[ 39.475201] ACPI: PCI Interrupt Link [LNKS] enabled at IRQ 9
[ 39.475201] ACPI: PCI Interrupt Link [LNKS] enabled at IRQ 9
[ 39.499858] pciback 0000:00:01.3: irqdomain: free irq9
[ 39.499858] pciback 0000:00:01.3: irqdomain: free irq9
[ 53.945477] pciback 0000:00:02.0: irqdomain: alloc irq
[ 53.945477] pciback 0000:00:02.0: irqdomain: alloc irq
[ 53.962593] pciback 0000:00:02.0: irqdomain: free irq0
[ 53.962593] pciback 0000:00:02.0: irqdomain: free irq0
[ 53.972670] pciback 0000:00:03.0: irqdomain: alloc irq
[ 53.972670] pciback 0000:00:03.0: irqdomain: alloc irq
[ 78.736648] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
[swapper/0:1]
[ 78.736648] NMI watchdog: BUG: soft lockup - CPU#1 stuck for 23s!
[swapper/0:1]
[ 78.760661] irq event stamp: 5457880
[ 78.760661] irq event stamp: 5457880
[ 78.762007] hardirqs last enabled at (5457879):
[ 78.762007] hardirqs last enabled at (5457879): [<c11c3318>]
__slab_alloc+0x2d8/0x9f0

Will keep you update when have more findings.
Thanks!
Gerry


> =

> +------------------------------------------------+------------+----------=
--+------------+
> |                                                | 890e484758 | 991de2e59=
0 | ccce1c6482 |
> +------------------------------------------------+------------+----------=
--+------------+
> | boot_successes                                 | 1009       | 682      =
  | 26         |
> | boot_failures                                  | 0          | 228      =
  | 15         |
> | EIP_is_at_lock_is_held                         | 0          | 4        =
  |            |
> | Kernel_panic-not_syncing:softlockup:hung_tasks | 0          | 228      =
  | 12         |
> | backtrace:__pci_register_driver                | 0          | 228      =
  | 12         |
> | backtrace:pcistub_init                         | 0          | 228      =
  | 12         |
> | backtrace:kernel_init_freeable                 | 0          | 228      =
  | 12         |
> | EIP_is_at_rcu_lockdep_current_cpu_online       | 0          | 1        =
  |            |
> | EIP_is_at__slab_alloc                          | 0          | 96       =
  | 7          |
> | EIP_is_at_raw_spin_unlock_irqrestore           | 0          | 107      =
  | 5          |
> | EIP_is_at__phys_addr                           | 0          | 1        =
  |            |
> | EIP_is_at_kmem_cache_free                      | 0          | 6        =
  |            |
> | EIP_is_at_lockdep_trace_alloc                  | 0          | 3        =
  |            |
> | EIP_is_at_acpi_ps_parse_loop                   | 0          | 2        =
  |            |
> | EIP_is_at_check_bytes_and_report               | 0          | 1        =
  |            |
> | EIP_is_at__free_pages                          | 0          | 1        =
  |            |
> | EIP_is_at_ftrace_likely_update                 | 0          | 1        =
  |            |
> | EIP_is_at_acpi_ut_update_object_reference      | 0          | 1        =
  |            |
> | EIP_is_at_acpi_ps_complete_this_op             | 0          | 1        =
  |            |
> | EIP_is_at_acpi_ut_push_generic_state           | 0          | 1        =
  |            |
> | EIP_is_at__slab_free                           | 0          | 1        =
  |            |
> | EIP_is_at_acpi_os_acquire_lock                 | 0          | 1        =
  |            |
> | BUG:kernel_boot_crashed                        | 0          | 0        =
  | 1          |
> | IP-Config:Auto-configuration_of_network_failed | 0          | 0        =
  | 2          |
> +------------------------------------------------+------------+----------=
--+------------+
> =

> [   93.225024] irq event stamp: 24182770
> [   93.225024] irq event stamp: 24182770
> [   93.225935] hardirqs last  enabled at (24182769): =

> [   93.225935] hardirqs last  enabled at (24182769): [<c1921a0d>] _raw_sp=
in_unlock_irqrestore+0x2d/0x90
> [<c1921a0d>] _raw_spin_unlock_irqrestore+0x2d/0x90
> [   93.228345] hardirqs last disabled at (24182770): =

> [   93.228345] hardirqs last disabled at (24182770): [<c192336c>] apic_ti=
mer_interrupt+0x28/0x34
> [<c192336c>] apic_timer_interrupt+0x28/0x34
> [   93.250462] softirqs last  enabled at (24181726): =

> [   93.250462] softirqs last  enabled at (24181726): [<c108106a>] __do_so=
ftirq+0x3ca/0x720
> [<c108106a>] __do_softirq+0x3ca/0x720
> [   93.252371] softirqs last disabled at (24181721): =

> [   93.252371] softirqs last disabled at (24181721): [<c1020f44>] do_soft=
irq_own_stack+0x24/0x30
> [<c1020f44>] do_softirq_own_stack+0x24/0x30
> [   93.254601] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.2.0-rc2-00002-=
g991de2e #1
> [   93.254601] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.2.0-rc2-00002-=
g991de2e #1
> [   93.256430] task: d0508000 ti: d0502000 task.ti: d0502000
> [   93.256430] task: d0508000 ti: d0502000 task.ti: d0502000
> [   93.257864] EIP: 0060:[<c1921a2e>] EFLAGS: 00000246 CPU: 0
> [   93.257864] EIP: 0060:[<c1921a2e>] EFLAGS: 00000246 CPU: 0
> [   93.259135] EIP is at _raw_spin_unlock_irqrestore+0x4e/0x90
> [   93.259135] EIP is at _raw_spin_unlock_irqrestore+0x4e/0x90
> [   93.260542] EAX: 00000246 EBX: d0484600 ECX: 00000000 EDX: 00000000
> [   93.260542] EAX: 00000246 EBX: d0484600 ECX: 00000000 EDX: 00000000
> [   93.272202] ESI: 00000246 EDI: 00000001 EBP: d0503c2c ESP: d0503c24
> [   93.272202] ESI: 00000246 EDI: 00000001 EBP: d0503c2c ESP: d0503c24
> [   93.273797]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [   93.273797]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [   93.275076] CR0: 8005003b CR2: ffffffff CR3: 01fa7000 CR4: 000006b0
> [   93.275076] CR0: 8005003b CR2: ffffffff CR3: 01fa7000 CR4: 000006b0
> [   93.276554] Stack:
> [   93.276554] Stack:
> [   93.277102]  cfc00ca8
> [   93.277102]  cfc00ca8 00000002 00000002 d0503c34 d0503c34 c160b5e4 c16=
0b5e4 d0503c4c d0503c4c c162d2fe c162d2fe d04aa5e8 d04aa5e8 cfc00288 cfc002=
88
> =

> [   93.279291]  00000003
> [   93.279291]  00000003 00000000 00000000 d0503c68 d0503c68 c162d5b8 c16=
2d5b8 c162d524 c162d524 d07e6000 d07e6000 d07d1288 d07d1288 d0503c9c d0503c=
9c
> =

> [   93.301331]  00000000
> [   93.301331]  00000000 d0503c74 d0503c74 c162d688 c162d688 d07e8000 d07=
e8000 d0503c8c d0503c8c c161717b c161717b d0731d20 d0731d20 d07e8000 d07e80=
00
> =

> [   93.303287] Call Trace:
> [   93.303287] Call Trace:
> [   93.303931]  [<c160b5e4>] acpi_os_release_lock+0x8/0xa
> [   93.303931]  [<c160b5e4>] acpi_os_release_lock+0x8/0xa
> [   93.305276]  [<c162d2fe>] acpi_ut_update_ref_count+0x42/0x270
> [   93.305276]  [<c162d2fe>] acpi_ut_update_ref_count+0x42/0x270
> [   93.306774]  [<c162d5b8>] acpi_ut_update_object_reference+0x8c/0x144
> [   93.306774]  [<c162d5b8>] acpi_ut_update_object_reference+0x8c/0x144
> [   93.308359]  [<c162d524>] ? acpi_ut_update_ref_count+0x268/0x270
> [   93.308359]  [<c162d524>] ? acpi_ut_update_ref_count+0x268/0x270
> [   93.330943]  [<c162d688>] acpi_ut_add_reference+0x18/0x1b
> [   93.330943]  [<c162d688>] acpi_ut_add_reference+0x18/0x1b
> [   93.332316]  [<c161717b>] acpi_ds_method_data_get_value+0xcc/0xd8
> [   93.332316]  [<c161717b>] acpi_ds_method_data_get_value+0xcc/0xd8
> [   93.333917]  [<c162156d>] acpi_ex_resolve_to_value+0x6c/0x1bb
> [   93.333917]  [<c162156d>] acpi_ex_resolve_to_value+0x6c/0x1bb
> [   93.335313]  [<c1621a6e>] acpi_ex_resolve_operands+0x19d/0x41f
> [   93.335313]  [<c1621a6e>] acpi_ex_resolve_operands+0x19d/0x41f
> [   93.336670]  [<c161873b>] acpi_ds_exec_end_op+0xd3/0x37b
> [   93.336670]  [<c161873b>] acpi_ds_exec_end_op+0xd3/0x37b
> [   93.337934]  [<c16284eb>] acpi_ps_parse_loop+0x478/0x4c3
> [   93.337934]  [<c16284eb>] acpi_ps_parse_loop+0x478/0x4c3
> [   93.339192]  [<c1628e16>] acpi_ps_parse_aml+0x85/0x230
> [   93.339192]  [<c1628e16>] acpi_ps_parse_aml+0x85/0x230
> [   93.350455]  [<c162952f>] acpi_ps_execute_method+0x18a/0x220
> [   93.350455]  [<c162952f>] acpi_ps_execute_method+0x18a/0x220
> [   93.360873]  [<c1624a2d>] acpi_ns_evaluate+0x185/0x1ff
> [   93.360873]  [<c1624a2d>] acpi_ns_evaluate+0x185/0x1ff
> [   93.362098]  [<c162d8e0>] acpi_ut_evaluate_object+0x79/0x175
> [   93.362098]  [<c162d8e0>] acpi_ut_evaluate_object+0x79/0x175
> [   93.363405]  [<c162a71f>] acpi_rs_get_prt_method_data+0x1a/0x3a
> [   93.363405]  [<c162a71f>] acpi_rs_get_prt_method_data+0x1a/0x3a
> [   93.364840]  [<c162a9b9>] acpi_get_irq_routing_table+0x1d/0x21
> [   93.364840]  [<c162a9b9>] acpi_get_irq_routing_table+0x1d/0x21
> [   93.366222]  [<c16136ae>] acpi_pci_irq_find_prt_entry+0x73/0x173
> [   93.366222]  [<c16136ae>] acpi_pci_irq_find_prt_entry+0x73/0x173
> [   93.367693]  [<c16137cb>] acpi_pci_irq_lookup+0x1d/0x11c
> [   93.367693]  [<c16137cb>] acpi_pci_irq_lookup+0x1d/0x11c
> [   93.368950]  [<c1613a67>] acpi_pci_irq_disable+0x27/0x68
> [   93.368950]  [<c1613a67>] acpi_pci_irq_disable+0x27/0x68
> [   93.391267]  [<c18bbebf>] pcibios_free_irq+0xf/0x20
> [   93.391267]  [<c18bbebf>] pcibios_free_irq+0xf/0x20
> [   93.392433]  [<c15e1b5a>] pci_device_probe+0xca/0x100
> [   93.392433]  [<c15e1b5a>] pci_device_probe+0xca/0x100
> [   93.393619]  [<c124b470>] ? sysfs_create_link+0x20/0x40
> [   93.393619]  [<c124b470>] ? sysfs_create_link+0x20/0x40
> [   93.394856]  [<c16a06c5>] driver_probe_device+0x135/0x2d0
> [   93.394856]  [<c16a06c5>] driver_probe_device+0x135/0x2d0
> [   93.396114]  [<c15e1701>] ? pci_match_device+0x21/0x100
> [   93.396114]  [<c15e1701>] ? pci_match_device+0x21/0x100
> [   93.397361]  [<c16a08f1>] __driver_attach+0x91/0xa0
> [   93.397361]  [<c16a08f1>] __driver_attach+0x91/0xa0
> [   93.398490]  [<c16a0860>] ? driver_probe_device+0x2d0/0x2d0
> [   93.398490]  [<c16a0860>] ? driver_probe_device+0x2d0/0x2d0
> [   93.399826]  [<c169ecef>] bus_for_each_dev+0x4f/0x80
> [   93.399826]  [<c169ecef>] bus_for_each_dev+0x4f/0x80
> [   93.420048]  [<c16a09e9>] driver_attach+0x19/0x20
> [   93.420048]  [<c16a09e9>] driver_attach+0x19/0x20
> [   93.421164]  [<c16a0860>] ? driver_probe_device+0x2d0/0x2d0
> [   93.421164]  [<c16a0860>] ? driver_probe_device+0x2d0/0x2d0
> [   93.422470]  [<c169f687>] bus_add_driver+0x197/0x210
> [   93.422470]  [<c169f687>] bus_add_driver+0x197/0x210
> [   93.423619]  [<c16a1a9b>] driver_register+0x6b/0xf0
> [   93.423619]  [<c16a1a9b>] driver_register+0x6b/0xf0
> [   93.424786]  [<c1df8f61>] ? platform_pci_module_init+0x16/0x16
> [   93.424786]  [<c1df8f61>] ? platform_pci_module_init+0x16/0x16
> [   93.426157]  [<c15e1bd5>] __pci_register_driver+0x45/0x50
> [   93.426157]  [<c15e1bd5>] __pci_register_driver+0x45/0x50
> [   93.427402]  [<c1df8f84>] pcistub_init+0x23/0x243
> [   93.427402]  [<c1df8f84>] pcistub_init+0x23/0x243
> [   93.428557]  [<c11c5242>] ? kfree+0x3e2/0x460
> [   93.428557]  [<c11c5242>] ? kfree+0x3e2/0x460
> [   93.429560]  [<c1dbcc2c>] ? do_one_initcall+0x77/0x177
> [   93.429560]  [<c1dbcc2c>] ? do_one_initcall+0x77/0x177
> [   93.441915]  [<c1dbcc2c>] ? do_one_initcall+0x77/0x177
> [   93.441915]  [<c1dbcc2c>] ? do_one_initcall+0x77/0x177
> [   93.443223]  [<c1df8f61>] ? platform_pci_module_init+0x16/0x16
> [   93.443223]  [<c1df8f61>] ? platform_pci_module_init+0x16/0x16
> [   93.451777]  [<c1dbcc85>] do_one_initcall+0xd0/0x177
> [   93.451777]  [<c1dbcc85>] do_one_initcall+0xd0/0x177
> [   93.456115]  [<c1dbcec4>] ? kernel_init_freeable+0x198/0x235
> [   93.456115]  [<c1dbcec4>] ? kernel_init_freeable+0x198/0x235
> [   93.457441]  [<c1dbcee4>] kernel_init_freeable+0x1b8/0x235
> [   93.457441]  [<c1dbcee4>] kernel_init_freeable+0x1b8/0x235
> [   93.461852]  [<c190d53b>] kernel_init+0xb/0xe0
> [   93.461852]  [<c190d53b>] kernel_init+0xb/0xe0
> [   93.468044]  [<c1922761>] ret_from_kernel_thread+0x21/0x30
> [   93.468044]  [<c1922761>] ret_from_kernel_thread+0x21/0x30
> [   93.469464]  [<c190d530>] ? rest_init+0x120/0x120
> [   93.469464]  [<c190d530>] ? rest_init+0x120/0x120
> [   93.470690] Code:
> [   93.470690] Code: 02 02 00 00 00 00 74 74 38 38 e8 e8 73 73 ac ac 7b 7=
b ff ff a1 a1 78 78 6d 6d ca ca c1 c1 85 85 c0 c0 b8 b8 1c 1c 91 91 d7 d7 c=
1 c1 0f 0f 94 94 c3 c3 31 31 c9 c9 0f 0f b6 b6 d3 d3 e8 e8 1a 1a 31 31 83 8=
3 ff ff 84 84 db db 75 75 43 43 89 89 f0 f0 50 50 9d 9d <8d> <8d> 74 74 26 =
26 00 00 5b 5b 64 64 ff ff 0d 0d c4 c4 41 41 e5 e5 c1 c1 5e 5e 5d 5d c3 c3 =
8d 8d 76 76 00 00 8b 8b 15 15 78 78
> =

> [   93.494087] Kernel panic - not syncing: softlockup: hung tasks
> [   93.494087] Kernel panic - not syncing: softlockup: hung tasks
> [   93.495567] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G             L  4.=
2.0-rc2-00002-g991de2e #1
> [   93.495567] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G             L  4.=
2.0-rc2-00002-g991de2e #1
> [   93.497762]  00000016
> [   93.497762]  00000016 00000000 00000000 d0503af0 d0503af0 c1917c51 c19=
17c51 d0c30200 d0c30200 d0503b08 d0503b08 c19119c8 c19119c8 00000016 000000=
16
> =

> [   93.519979]  d0c30201
> [   93.519979]  d0c30201 00000016 00000016 00000040 00000040 d0503b3c d05=
03b3c c113fd11 c113fd11 c1bb2ef4 c1bb2ef4 00000000 00000000 00000016 000000=
16
> =

> [   93.522114]  d05083e4
> [   93.522114]  d05083e4 00000001 00000001 d0503be8 d0503be8 00000000 000=
00000 00000040 00000040 d0c2fd01 d0c2fd01 00000000 00000000 d0c30200 d0c302=
00
> =

> [   93.524249] Call Trace:
> [   93.524249] Call Trace:
> [   93.524885]  [<c1917c51>] dump_stack+0x48/0x60
> [   93.524885]  [<c1917c51>] dump_stack+0x48/0x60
> [   93.526027]  [<c19119c8>] panic+0xa0/0x1c5
> [   93.526027]  [<c19119c8>] panic+0xa0/0x1c5
> [   93.527083]  [<c113fd11>] watchdog_timer_fn+0x231/0x240
> [   93.527083]  [<c113fd11>] watchdog_timer_fn+0x231/0x240
> [   93.528413]  [<c110f54d>] __hrtimer_run_queues+0x17d/0x860
> [   93.528413]  [<c110f54d>] __hrtimer_run_queues+0x17d/0x860
> [   93.549840]  [<c113fae0>] ? watchdog+0x40/0x40
> [   93.549840]  [<c113fae0>] ? watchdog+0x40/0x40
> [   93.551023]  [<c1110e51>] hrtimer_interrupt+0xa1/0x1b0
> [   93.551023]  [<c1110e51>] hrtimer_interrupt+0xa1/0x1b0
> [   93.552333]  [<c10ff2b7>] ? rcu_irq_enter+0x147/0x320
> [   93.552333]  [<c10ff2b7>] ? rcu_irq_enter+0x147/0x320
> [   93.553621]  [<c1055b8e>] local_apic_timer_interrupt+0x2e/0x60
> [   93.553621]  [<c1055b8e>] local_apic_timer_interrupt+0x2e/0x60
> [   93.555096]  [<c10562ce>] smp_apic_timer_interrupt+0x2e/0x50
> [   93.555096]  [<c10562ce>] smp_apic_timer_interrupt+0x2e/0x50
> [   93.556512]  [<c1923373>] apic_timer_interrupt+0x2f/0x34
> [   93.556512]  [<c1923373>] apic_timer_interrupt+0x2f/0x34
> [   93.557902]  [<c1921a2e>] ? _raw_spin_unlock_irqrestore+0x4e/0x90
> [   93.557902]  [<c1921a2e>] ? _raw_spin_unlock_irqrestore+0x4e/0x90
> [   93.559427]  [<c160b5e4>] acpi_os_release_lock+0x8/0xa
> [   93.559427]  [<c160b5e4>] acpi_os_release_lock+0x8/0xa
> [   93.580750]  [<c162d2fe>] acpi_ut_update_ref_count+0x42/0x270
> [   93.580750]  [<c162d2fe>] acpi_ut_update_ref_count+0x42/0x270
> [   93.582206]  [<c162d5b8>] acpi_ut_update_object_reference+0x8c/0x144
> [   93.582206]  [<c162d5b8>] acpi_ut_update_object_reference+0x8c/0x144
> [   93.583787]  [<c162d524>] ? acpi_ut_update_ref_count+0x268/0x270
> [   93.583787]  [<c162d524>] ? acpi_ut_update_ref_count+0x268/0x270
> [   93.585303]  [<c162d688>] acpi_ut_add_reference+0x18/0x1b
> [   93.585303]  [<c162d688>] acpi_ut_add_reference+0x18/0x1b
> [   93.586644]  [<c161717b>] acpi_ds_method_data_get_value+0xcc/0xd8
> [   93.586644]  [<c161717b>] acpi_ds_method_data_get_value+0xcc/0xd8
> [   93.588195]  [<c162156d>] acpi_ex_resolve_to_value+0x6c/0x1bb
> [   93.588195]  [<c162156d>] acpi_ex_resolve_to_value+0x6c/0x1bb
> [   93.589635]  [<c1621a6e>] acpi_ex_resolve_operands+0x19d/0x41f
> [   93.589635]  [<c1621a6e>] acpi_ex_resolve_operands+0x19d/0x41f
> [   93.602078]  [<c161873b>] acpi_ds_exec_end_op+0xd3/0x37b
> [   93.602078]  [<c161873b>] acpi_ds_exec_end_op+0xd3/0x37b
> [   93.603348]  [<c16284eb>] acpi_ps_parse_loop+0x478/0x4c3
> [   93.603348]  [<c16284eb>] acpi_ps_parse_loop+0x478/0x4c3
> [   93.604603]  [<c1628e16>] acpi_ps_parse_aml+0x85/0x230
> [   93.604603]  [<c1628e16>] acpi_ps_parse_aml+0x85/0x230
> [   93.605814]  [<c162952f>] acpi_ps_execute_method+0x18a/0x220
> [   93.605814]  [<c162952f>] acpi_ps_execute_method+0x18a/0x220
> [   93.607137]  [<c1624a2d>] acpi_ns_evaluate+0x185/0x1ff
> [   93.607137]  [<c1624a2d>] acpi_ns_evaluate+0x185/0x1ff
> [   93.608338]  [<c162d8e0>] acpi_ut_evaluate_object+0x79/0x175
> [   93.608338]  [<c162d8e0>] acpi_ut_evaluate_object+0x79/0x175
> [   93.609660]  [<c162a71f>] acpi_rs_get_prt_method_data+0x1a/0x3a
> [   93.609660]  [<c162a71f>] acpi_rs_get_prt_method_data+0x1a/0x3a
> =

> git bisect start ccce1c6482a6b7d65dbcc3b5a19f75b21593084d c13dcf9f2d6f5f0=
6ef1bf79ec456df614c5e058b --
> git bisect  bad 2d8122fc32cc4a851d314cf12ee26a305b16a423  # 08:28      0-=
     67  Merge 'omap-dss2/for-next' into devel-spot-201508242215
> git bisect  bad a992f0007c196a9b34abb2c36e7ff74705e6cd97  # 08:28      0-=
    492  Merge 'hid/for-4.3/upstream' into devel-spot-201508242215
> git bisect good 27fcb4e74ef3616949d7bc368beccfae56059a8c  # 09:49    903+=
     25  Merge 'block/for-next' into devel-spot-201508242215
> git bisect good 5a9338b97096963d071ac2ffcaa8329e027bd6a3  # 11:08    910+=
      8  Merge 'pci/pci/misc' into devel-spot-201508242215
> git bisect  bad 7585be060dc998dbb71d4a100e62aea5d6995b56  # 11:20      7-=
     12  Merge 'pci/next' into devel-spot-201508242215
> git bisect good faf512cd1c5d1b8d6ee13f48915e099469313d3f  # 12:50    907+=
     97  Merge 'hch-pmem/nvdimm-no-pfn' into devel-spot-201508242215
> git bisect good 3bd2e6fa9c4857054f6dbaedccd9d10ed79ac713  # 14:12    910+=
     40  Merge 'hch-pmem/dma-mapping-cleanups-post' into devel-spot-2015082=
42215
> git bisect good 8faae0b69e773695066c21829f261199eb35613b  # 15:28    910+=
    125  Merge 'krzk/track/kgene-for-next' into devel-spot-201508242215
> git bisect good 24b390aad2930b889b6e15fc7cf7bfa7c99fad21  # 16:48    910+=
      0  PCI: Remove unused "pci_probe" flags
> git bisect good cd66d5c3df7c96cbf75010b964b94032ceca8889  # 18:11    910+=
      1  Merge branches 'pci/host-designware', 'pci/host-xgene' and 'pci/ho=
st-xilinx' into next
> git bisect  bad 5f2269916b0e509f2926346b58209abfa8316143  # 18:27    111-=
      8  PCI/MSI: Free legacy IRQ when enabling MSI/MSI-X
> git bisect  bad 991de2e59090e55c65a7f59a049142e3c480f7bd  # 18:34     11-=
     17  PCI, x86: Implement pcibios_alloc_irq() and pcibios_free_irq()
> git bisect good 890e4847587fcff5eb0438e90992ad7d2a261f33  # 19:54    910+=
      0  PCI: Add pcibios_alloc_irq() and pcibios_free_irq()
> # first bad commit: [991de2e59090e55c65a7f59a049142e3c480f7bd] PCI, x86: =
Implement pcibios_alloc_irq() and pcibios_free_irq()
> git bisect good 890e4847587fcff5eb0438e90992ad7d2a261f33  # 20:00   1005+=
      0  PCI: Add pcibios_alloc_irq() and pcibios_free_irq()
> # extra tests with DEBUG_INFO
> git bisect  bad 991de2e59090e55c65a7f59a049142e3c480f7bd  # 20:21    124-=
      6  PCI, x86: Implement pcibios_alloc_irq() and pcibios_free_irq()
> # extra tests on HEAD of linux-devel/devel-spot-201508242215
> git bisect  bad ccce1c6482a6b7d65dbcc3b5a19f75b21593084d  # 20:21      0-=
     15  0day head guard for 'devel-spot-201508242215'
> # extra tests on tree/branch linux-next/master
> # extra tests on tree/branch linus/master
> git bisect good c13dcf9f2d6f5f06ef1bf79ec456df614c5e058b  # 21:45   1010+=
     11  Linux 4.2-rc8
> # extra tests on tree/branch linux-next/master
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
>=20

--===============6850285735648831565==--

