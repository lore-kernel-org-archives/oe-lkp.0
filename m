Content-Type: multipart/mixed; boundary="===============0995663461082693654=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm/rmqueue_bulk] 078e1a08c3: BUG:using_smp_processor_id()in_preemptible
Date: Tue, 20 Mar 2018 14:45:56 +0800
Message-ID: <20180320064556.GA24737@intel.com>
In-Reply-To: <20180319091012.onrtrep3giu4zfeq@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============0995663461082693654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Nice report, thanks!

On Mon, Mar 19, 2018 at 05:10:12PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 078e1a08c3fb03c01d950052595251e06c1cb449 ("mm/rmqueue_bulk: alloc=
 without touching individual page structure")
> git://bee.sh.intel.com/git/aaron/linux.git parallel_free_v4.16rc5-zone_lo=
ck_internal_v4
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------+------------+------------+
> |                                            | 13c46a71de | 078e1a08c3 |
> +--------------------------------------------+------------+------------+
> | boot_successes                             | 6          | 2          |
> | boot_failures                              | 0          | 4          |
> | BUG:using_smp_processor_id()in_preemptible | 0          | 4          |
> +--------------------------------------------+------------+------------+
> =

> =

> =

> [    0.110864] BUG: using smp_processor_id() in preemptible [00000000] co=
de: swapper/0/1
> [    0.111975] caller is debug_smp_processor_id+0x12/0x20
> [    0.112109] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.16.0-rc5-00011=
-g078e1a0 #62
> [    0.113167] Call Trace:
> [    0.113520]  ? dump_stack+0x6d/0x8c
> [    0.114007]  ? check_preemption_disabled+0xe3/0xf0
> [    0.114680]  ? debug_smp_processor_id+0x12/0x20
> [    0.115321]  ? zone_order0_cluster_init+0x2a/0x1cd
> [    0.115983]  ? kthread_create_on_node+0x18/0x20
> [    0.116000]  ? pagecache_init+0x2d/0x2d
> [    0.116000]  ? build_all_zonelists_init+0x73/0x73
> [    0.116000]  ? do_one_initcall+0x8b/0x126
> [    0.116000]  ? set_debug_rodata+0xf/0xf
> [    0.116000]  ? parse_args+0x11e/0x2a0
> [    0.116000]  ? kernel_init_freeable+0xf0/0x164
> [    0.116000]  ? rest_init+0xe0/0xe0
> [    0.116000]  ? kernel_init+0x8/0xf0
> [    0.116000]  ? ret_from_fork+0x2e/0x40
> [    0.116559] cryptd: max_cpu_qlen set to 1000
> [    0.117246] gpio-f7188x: Not a Fintek device at 0x0000002e
> [    0.120255] gpio-f7188x: Not a Fintek device at 0x0000004e
> [    0.121266] ACPI: Added _OSI(Module Device)
> [    0.121867] ACPI: Added _OSI(Processor Device)
> [    0.122490] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.123164] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.128817] ACPI: Interpreter enabled
> [    0.129187] ACPI: (supports S0 S5)
> [    0.129518] ACPI: Using IOAPIC for interrupt routing
> [    0.130002] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.131216] ACPI: Enabled 2 GPEs in block 00 to 0F
> [    0.142768] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.143349] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments =
MSI]
> [    0.143990] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.144123] PCI host bridge to bus 0000:00
> [    0.144513] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    0.145136] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    0.145753] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    0.146436] pci_bus 0000:00: root bus resource [mem 0x14000000-0xfebff=
fff window]
> [    0.147139] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.148049] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.149246] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.150518] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.154914] pci 0000:00:01.1: reg 0x20: [io  0xc080-0xc08f]
> [    0.156893] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    0.157546] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.158134] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    0.158780] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.160109] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.161017] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    0.162090] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    0.163178] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
> [    0.164963] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pre=
f]
> [    0.168899] pci 0000:00:02.0: reg 0x18: [mem 0xfebf0000-0xfebf0fff]
> [    0.176786] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    0.177902] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.179612] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    0.181207] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    0.188530] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    0.189628] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> [    0.191886] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    0.194465] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    0.200925] pci 0000:00:04.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64b=
it pref]
> [    0.204360] pci 0000:00:05.0: [8086:25ab] type 00 class 0x088000
> [    0.205506] pci 0000:00:05.0: reg 0x10: [mem 0xfebf2000-0xfebf200f]
> [    0.210510] pci_bus 0000:00: on NUMA node 0
> [    0.212062] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> [    0.212865] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> [    0.213614] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> [    0.214365] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> [    0.215003] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> [    0.216661] media: Linux media interface: v0.10
> [    0.217299] Linux video capture interface: v2.00
> [    0.217769] rc_core: IR Remote Control driver registered, major 248
> [    0.218390] pps_core: LinuxPPS API ver. 1 registered
> [    0.218858] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.219792] FPGA manager framework
> [    0.220058] PCI: Using ACPI for IRQ routing
> [    0.220459] PCI: pci_cache_line_size set to 32 bytes
> [    0.221034] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    0.221583] e820: reserve RAM buffer [mem 0x13fde000-0x13ffffff]
> [    0.222402] Bluetooth: Core ver 2.22
> [    0.222766] NET: Registered protocol family 31
> [    0.223178] Bluetooth: HCI device and connection manager initialized
> [    0.223767] Bluetooth: HCI socket layer initialized
> [    0.224010] Bluetooth: L2CAP socket layer initialized
> [    0.224669] nfc: nfc_init: NFC Core ver 0.1
> [    0.225094] NET: Registered protocol family 39
> [    0.226659] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    0.227585] clocksource: Switched to clocksource kvm-clock
> [    0.228000] pnp: PnP ACPI init
> [    0.228000] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.228000] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.228000] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    0.228000] pnp 00:03: [dma 2]
> [    0.228000] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    0.228185] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    0.228908] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.229622] pnp 00:06: Plug and Play ACPI device, IDs PNP0501 (active)
> [    0.230789] pnp: PnP ACPI: found 7 devices
> [    0.266467] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    0.267381] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> lkp

--===============0995663461082693654==--

