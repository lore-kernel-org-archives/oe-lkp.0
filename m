Content-Type: multipart/mixed; boundary="===============0709534720558329017=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
To: lkp@lists.01.org
Subject: Re: [PCI] 62d528712c: BUG:KASAN:slab-out-of-bounds_in_acpi_power_up_if_adr_present
Date: Wed, 20 Apr 2022 18:14:53 +0200
Message-ID: <78b6d874-905a-0c84-bdaa-a9ffe6c2cbf4@intel.com>
In-Reply-To: <20220420064725.GB16310@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0709534720558329017==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/20/2022 8:47 AM, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: 62d528712c1db609fd5afc319378ca053ac9247e ("PCI: ACPI: PM: Power u=
p devices in D3cold before scanning them")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: kernel-selftests
> version: kernel-selftests-x86_64-a17aac1b-1_20220417
> with following parameters:
>
> 	group: resctrl
> 	ucode: 0xb000280
>
> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>
>
> on test machine: 96 threads 2 sockets Ice Lake with 256G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [ 35.970292][ T1] BUG: KASAN: slab-out-of-bounds in acpi_power_up_if_adr_=
present (drivers/acpi/device_pm.c:433)

I don't know how this is possible.

The only memory accessed by acpi_power_up_if_adr_present() is the ACPI =

device object passed to it by acpi_dev_for_each_child() and it cannot go =

away while acpi_power_up_if_adr_present() is running because of the =

reference counting in device_for_each_child().

There are also suspicious items in the call trace below.=C2=A0 For example, =

it is unclear why acpi_pci_remove_bus() is present there or why =

acpi_bus_set_power() is present there.

> [   35.970292][    T1] Read of size 1 at addr ff1100014215fe0c by task sw=
apper/0/1
> [   35.970292][    T1]
> [   35.970292][    T1] CPU: 49 PID: 1 Comm: swapper/0 Not tainted 5.18.0-=
rc2-00003-g62d528712c1d #1
> [   35.970292][    T1] Call Trace:
> [   35.970292][    T1]  <TASK>
> [ 35.970292][ T1] dump_stack_lvl (lib/dump_stack.c:107)
> [ 35.970292][ T1] print_address_description.constprop.0.cold (mm/kasan/re=
port.c:314)
> [ 35.970292][ T1] ? acpi_power_up_if_adr_present (drivers/acpi/device_pm.=
c:433)
> [ 35.970292][ T1] ? acpi_power_up_if_adr_present (drivers/acpi/device_pm.=
c:433)
> [ 35.970292][ T1] print_report.cold (mm/kasan/report.c:430)
> [ 35.970292][ T1] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h:202 i=
nclude/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinlock=
.h:82 kernel/locking/spinlock_debug.c:115)
> [ 35.970292][ T1] kasan_report (mm/kasan/report.c:162 mm/kasan/report.c:4=
93)
> [ 35.970292][ T1] ? acpi_power_up_if_adr_present (drivers/acpi/device_pm.=
c:433)
> [ 35.970292][ T1] ? acpi_bus_set_power (drivers/acpi/device_pm.c:429)
> [ 35.970292][ T1] acpi_power_up_if_adr_present (drivers/acpi/device_pm.c:=
433)
> [ 35.970292][ T1] ? acpi_bus_set_power (drivers/acpi/device_pm.c:429)
> [ 35.970292][ T1] device_for_each_child (drivers/base/core.c:3724)
> [ 35.970292][ T1] ? device_platform_notify_remove (drivers/base/core.c:37=
14)
> [ 35.970292][ T1] pci_acpi_setup (drivers/pci/pci-acpi.c:1379)
> [ 35.970292][ T1] ? acpi_pci_remove_bus (drivers/pci/pci-acpi.c:1354)
> [ 35.970292][ T1] ? lockdep_init_map_type (kernel/locking/lockdep.c:4812)
> [ 35.970292][ T1] acpi_device_notify (drivers/acpi/glue.c:317)
> [ 35.970292][ T1] device_add (drivers/base/core.c:2046 drivers/base/core.=
c:3347)
> [ 35.970292][ T1] ? __fw_devlink_link_to_suppliers (drivers/base/core.c:3=
287)
> [ 35.970292][ T1] ? up_write (arch/x86/include/asm/atomic64_64.h:172 incl=
ude/linux/atomic/atomic-long.h:95 include/linux/atomic/atomic-instrumented.=
h:1348 kernel/locking/rwsem.c:1318 kernel/locking/rwsem.c:1567)
> [ 35.970292][ T1] ? pci_init_reset_methods (drivers/pci/pci.c:5384)
> [ 35.970292][ T1] pci_device_add (drivers/pci/probe.c:2559)
> [ 35.970292][ T1] pci_scan_single_device (drivers/pci/probe.c:2578 driver=
s/pci/probe.c:2562)
> [ 35.970292][ T1] ? pci_device_add (drivers/pci/probe.c:2563)
> [ 35.970292][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irq=
flags.h:45 arch/x86/include/asm/irqflags.h:80 arch/x86/include/asm/irqflags=
.h:138 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> [ 35.970292][ T1] pci_scan_slot (drivers/pci/probe.c:2652)
> [ 35.970292][ T1] pci_scan_child_bus_extend (drivers/pci/probe.c:2868)
> [ 35.970292][ T1] ? pci_create_root_bus (drivers/pci/probe.c:3041)
> [ 35.970292][ T1] acpi_pci_root_create (drivers/acpi/pci_root.c:933)
> [ 35.970292][ T1] pci_acpi_scan_root (arch/x86/pci/acpi.c:368)
> [ 35.970292][ T1] ? pci_acpi_root_init_info (arch/x86/pci/acpi.c:327)
> [ 35.970292][ T1] ? decode_osc_bits+0x18a/0x18a
> [ 35.970292][ T1] ? acpi_pci_find_companion (drivers/pci/pci-acpi.c:108)
> [ 35.970292][ T1] acpi_pci_root_add.cold (drivers/acpi/pci_root.c:602)
> [ 35.970292][ T1] ? get_root_bridge_busnr_callback (drivers/acpi/pci_root=
.c:522)
> [ 35.970292][ T1] ? acpi_pnp_match (drivers/acpi/acpi_pnp.c:323 drivers/a=
cpi/acpi_pnp.c:341)
> [ 35.970292][ T1] ? acpi_bus_get_status_handle (drivers/acpi/bus.c:98)
> [ 35.970292][ T1] acpi_bus_attach (drivers/acpi/scan.c:2177 drivers/acpi/=
scan.c:2225)
> [ 35.970292][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2191)
> [ 35.970292][ T1] ? __device_attach (drivers/base/dd.c:941)
> [ 35.970292][ T1] ? device_bind_driver (drivers/base/dd.c:941)
> [ 35.970292][ T1] acpi_bus_attach (drivers/acpi/scan.c:2245 (discriminato=
r 3))
> [ 35.970292][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2191)
> [ 35.970292][ T1] ? __device_attach (drivers/base/dd.c:941)
> [ 35.970292][ T1] ? device_bind_driver (drivers/base/dd.c:941)
> [ 35.970292][ T1] acpi_bus_attach (drivers/acpi/scan.c:2245 (discriminato=
r 3))
> [ 35.970292][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2191)
> [ 35.970292][ T1] ? _raw_spin_unlock_irqrestore (arch/x86/include/asm/irq=
flags.h:45 arch/x86/include/asm/irqflags.h:80 arch/x86/include/asm/irqflags=
.h:138 include/linux/spinlock_api_smp.h:151 kernel/locking/spinlock.c:194)
> [ 35.970292][ T1] ? acpi_os_signal_semaphore (drivers/acpi/osl.c:1308)
> [ 35.970292][ T1] ? acpi_ut_release_read_lock (drivers/acpi/acpica/utlock=
.c:111)
> [ 35.970292][ T1] ? acpi_bus_check_add_2 (drivers/acpi/scan.c:2113)
> [ 35.970292][ T1] ? acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:6=
16 drivers/acpi/acpica/nsxfeval.c:554)
> [ 35.970292][ T1] acpi_bus_scan (drivers/acpi/scan.c:2438)
> [ 35.970292][ T1] ? acpi_bus_check_add_1 (drivers/acpi/scan.c:2420)
> [ 35.970292][ T1] acpi_scan_init (drivers/acpi/scan.c:2600)
> [ 35.970292][ T1] ? acpi_match_madt (drivers/acpi/scan.c:2550)
> [ 35.970292][ T1] acpi_init (drivers/acpi/bus.c:1368)
> [ 35.970292][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1342)
> [ 35.970292][ T1] ? rcu_read_lock_bh_held (kernel/rcu/update.c:120)
> [ 35.970292][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1342)
> [ 35.970292][ T1] do_one_initcall (init/main.c:1298)
> [ 35.970292][ T1] ? trace_event_raw_event_initcall_level (init/main.c:128=
9)
> [ 35.970292][ T1] ? rcu_read_lock_sched_held (include/linux/lockdep.h:283=
 kernel/rcu/update.c:125)
> [ 35.970292][ T1] ? rcu_read_lock_bh_held (kernel/rcu/update.c:120)
> [ 35.970292][ T1] ? __kmalloc (include/linux/kasan.h:234 mm/slub.c:4414)
> [ 35.970292][ T1] kernel_init_freeable (init/main.c:1370 init/main.c:1387=
 init/main.c:1406 init/main.c:1613)
> [ 35.970292][ T1] ? console_on_rootfs (init/main.c:1584)
> [ 35.970292][ T1] ? rwlock_bug+0xc0/0xc0
> [ 35.970292][ T1] ? rest_init (init/main.c:1494)
> [ 35.970292][ T1] kernel_init (init/main.c:1504)
> [ 35.970292][ T1] ret_from_fork (arch/x86/entry/entry_64.S:298)
> [   35.970292][    T1]  </TASK>
> [   35.970292][    T1]
> [   35.970292][    T1] Allocated by task 0:
> [   35.970292][    T1] (stack is not available)
> [   35.970292][    T1]
> [   35.970292][    T1] The buggy address belongs to the object at ff11000=
14215f800
> [   35.970292][    T1]  which belongs to the cache kmalloc-1k of size 1024
> [   35.970292][    T1] The buggy address is located 524 bytes to the righ=
t of
> [   35.970292][    T1]  1024-byte region [ff1100014215f800, ff1100014215f=
c00)
> [   35.970292][    T1]
> [   35.970292][    T1] The buggy address belongs to the physical page:
> [   35.970292][    T1] page:0000000091ef2032 refcount:1 mapcount:0 mappin=
g:0000000000000000 index:0x0 pfn:0x142158
> [   35.970292][    T1] head:0000000091ef2032 order:3 compound_mapcount:0 =
compound_pincount:0
> [   35.970292][    T1] flags: 0x17ffffc0010200(slab|head|node=3D0|zone=3D=
2|lastcpupid=3D0x1fffff)
> [   35.970292][    T1] raw: 0017ffffc0010200 0000000000000000 dead0000000=
00122 ff1100010003d080
> [   35.970292][    T1] raw: 0000000000000000 0000000080100010 00000001fff=
fffff 0000000000000000
> [   35.970292][    T1] page dumped because: kasan: bad access detected
> [   35.970292][    T1]
> [   35.970292][    T1] Memory state around the buggy address:
> [   35.970292][    T1]  ff1100014215fd00: fc fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc
> [   35.970292][    T1]  ff1100014215fd80: fc fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc
> [   35.970292][    T1] >ff1100014215fe00: fc fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc
> [   35.970292][    T1]                       ^
> [   35.970292][    T1]  ff1100014215fe80: fc fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc
> [   35.970292][    T1]  ff1100014215ff00: fc fc fc fc fc fc fc fc fc fc f=
c fc fc fc fc fc
> [   35.970292][    T1] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   36.528345][    T1] Disabling lock debugging due to kernel taint
> [   36.540420][    T1] pci 0000:00:1c.5: [8086:a215] type 01 class 0x0604=
00
> [   36.547403][    T1] pci 0000:00:1c.5: PME# supported from D0 D3hot D3c=
old
> [   36.562298][    T1] pci 0000:00:1f.0: [8086:a245] type 00 class 0x0601=
00
> [   36.571590][    T1] pci 0000:00:1f.2: [8086:a221] type 00 class 0x0580=
00
> [   36.578311][    T1] pci 0000:00:1f.2: reg 0x10: [mem 0x92480000-0x9248=
3fff]
> [   36.587589][    T1] pci 0000:00:1f.4: [8086:a223] type 00 class 0x0c05=
00
> [   36.594320][    T1] pci 0000:00:1f.4: reg 0x10: [mem 0x200ffff54000-0x=
200ffff540ff 64bit]
> [   36.602321][    T1] pci 0000:00:1f.4: reg 0x20: [io  0x4000-0x401f]
> [   36.608859][    T1] pci 0000:00:1f.5: [8086:a224] type 00 class 0x0c80=
00
> [   36.615313][    T1] pci 0000:00:1f.5: reg 0x10: [mem 0x90000000-0x9000=
0fff]
> [   36.623196][    T1] pci 0000:01:00.0: working around ROM BAR overlap d=
efect
> [   36.630295][    T1] pci 0000:01:00.0: [8086:1533] type 00 class 0x0200=
00
> [   36.637335][    T1] pci 0000:01:00.0: reg 0x10: [mem 0x92100000-0x9217=
ffff]
> [   36.644337][    T1] pci 0000:01:00.0: reg 0x18: [io  0x3000-0x301f]
> [   36.650324][    T1] pci 0000:01:00.0: reg 0x1c: [mem 0x92180000-0x9218=
3fff]
> [   36.657546][    T1] pci 0000:01:00.0: PME# supported from D0 D3hot D3c=
old
> [   36.665073][    T1] pci 0000:00:1c.0: PCI bridge to [bus 01]
> [   36.670302][    T1] pci 0000:00:1c.0:   bridge window [io  0x3000-0x3f=
ff]
> [   36.677300][    T1] pci 0000:00:1c.0:   bridge window [mem 0x92100000-=
0x921fffff]
> [   36.685514][    T1] pci 0000:02:00.0: [1a03:1150] type 01 class 0x0604=
00
> [   36.692466][    T1] pci 0000:02:00.0: supports D1 D2
> [   36.697295][    T1] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3h=
ot D3cold
> [   36.704955][    T1] pci 0000:00:1c.5: PCI bridge to [bus 02-03]
> [   36.711300][    T1] pci 0000:00:1c.5:   bridge window [io  0x2000-0x2f=
ff]
> [   36.717300][    T1] pci 0000:00:1c.5:   bridge window [mem 0x91000000-=
0x920fffff]
> [   36.725359][    T1] pci_bus 0000:03: extended config space not accessi=
ble
> [   36.732395][    T1] pci 0000:03:00.0: [1a03:2000] type 00 class 0x0300=
00
> [   36.738318][    T1] pci 0000:03:00.0: reg 0x10: [mem 0x91000000-0x91ff=
ffff]
> [   36.745309][    T1] pci 0000:03:00.0: reg 0x14: [mem 0x92000000-0x9201=
ffff]
> [   36.752309][    T1] pci 0000:03:00.0: reg 0x18: [io  0x2000-0x207f]
> [   36.759461][    T1] pci 0000:03:00.0: supports D1 D2
> [   36.764294][    T1] pci 0000:03:00.0: PME# supported from D0 D1 D2 D3h=
ot D3cold
> [   36.771558][    T1] pci 0000:02:00.0: PCI bridge to [bus 03]
> [   36.777305][    T1] pci 0000:02:00.0:   bridge window [io  0x2000-0x2f=
ff]
> [   36.784302][    T1] pci 0000:02:00.0:   bridge window [mem 0x91000000-=
0x920fffff]
> [   36.791322][    T1] pci_bus 0000:00: on NUMA node 0
> [   36.801723][    T1] ACPI: PCI Root Bridge [PC01] (domain 0000 [bus 16-=
2f])
> [   36.808305][    T1] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig=
 ASPM ClockPM Segments MSI HPX-Type3]
> [   37.091596][    T1] acpi PNP0A08:01: _OSC: platform does not support [=
SHPCHotplug AER]
> [   37.105600][    T1] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplu=
g PME PCIeCapability LTR]
> [   37.115792][    T1] PCI host bridge to bus 0000:16
> [   37.120298][    T1] pci_bus 0000:16: root bus resource [io  0x5000-0x6=
fff window]
> [   37.128297][    T1] pci_bus 0000:16: root bus resource [mem 0x9b800000=
-0xa63fffff window]
> [   37.136296][    T1] pci_bus 0000:16: root bus resource [mem 0x20100000=
0000-0x201fffffffff window]
> [   37.145295][    T1] pci_bus 0000:16: root bus resource [bus 16-2f]
> [   37.151345][    T1] pci 0000:16:00.0: [8086:09a2] type 00 class 0x0880=
00
> [   37.158525][    T1] pci 0000:16:00.1: [8086:09a4] type 00 class 0x0880=
00
>
>
> To reproduce:
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          sudo bin/lkp install job.yaml           # job file is attached i=
n this email
>          bin/lkp split-job --compatible job.yaml # generate the yaml file=
 for lkp run
>          sudo bin/lkp run generated-yaml-file
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>

--===============0709534720558329017==--

