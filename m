Content-Type: multipart/mixed; boundary="===============3614122397844852404=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/PCI] 62fabd56fa: BUG:KASAN:use-after-free_in_pci_acpi_root_prepare_resources
Date: Mon, 28 Feb 2022 11:42:09 +0100
Message-ID: <6c7be14f-fba9-f230-6b02-b2ae9fb1f893@redhat.com>
In-Reply-To: <20220228040021.GB29932@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3614122397844852404==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/28/22 05:00, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 62fabd56faafe033eb0be3ba24000b8db13d4c17 ("x86/PCI: Disable exclu=
sion of E820 reserved addresses in some cases")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

Ugh, yeah this is my bad, the code now looks like this:

                       if (resource_is_pcicfg_ioport(entry->res))
                               resource_list_destroy_entry(entry);
                       if (resource_is_efi_mmio_region(entry->res)) {
                               dev_info(&device->dev,
                                       "host bridge window %pR is marked by=
 EFI as =

                                       entry->res);
                               pci_use_e820 =3D false;
                       }

So yeah the second check is defering a just destroyed entry in case of
resource_is_pcicfg_ioport() returning true.

This also makes me realize that resource_is_efi_mmio_region should
check the type of the resource.

I'll send a new version fixing both, sorry about this.

Regards,

Hans



> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> [ 2.507461][ T1] BUG: KASAN: use-after-free in pci_acpi_root_prepare_reso=
urces (include/linux/list.h:150 include/linux/resource_ext.h:48 include/lin=
ux/resource_ext.h:59 arch/x86/pci/acpi.c:361) =

> [    2.507461][    T1] Read of size 8 at addr ffff8881433c6190 by task sw=
apper/0/1
> [    2.507461][    T1]
> [    2.507461][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.17.0-r=
c5-00001-g62fabd56faaf #1
> [    2.507461][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [    2.507461][    T1] Call Trace:
> [    2.507461][    T1]  <TASK>
> [ 2.507461][ T1] dump_stack_lvl (lib/dump_stack.c:107) =

> [ 2.507461][ T1] print_address_description+0x21/0x180 =

> [ 2.507461][ T1] ? pci_acpi_root_prepare_resources (include/linux/list.h:=
150 include/linux/resource_ext.h:48 include/linux/resource_ext.h:59 arch/x8=
6/pci/acpi.c:361) =

> [ 2.507461][ T1] kasan_report.cold (mm/kasan/report.c:443 mm/kasan/report=
.c:459) =

> [ 2.507461][ T1] ? vscnprintf (lib/vsprintf.c:2974) =

> [ 2.507461][ T1] ? pci_acpi_root_prepare_resources (include/linux/list.h:=
150 include/linux/resource_ext.h:48 include/linux/resource_ext.h:59 arch/x8=
6/pci/acpi.c:361) =

> [ 2.507461][ T1] pci_acpi_root_prepare_resources (include/linux/list.h:15=
0 include/linux/resource_ext.h:48 include/linux/resource_ext.h:59 arch/x86/=
pci/acpi.c:361) =

> [ 2.507461][ T1] ? pci_acpi_root_init_info.cold (arch/x86/pci/acpi.c:188 =
arch/x86/pci/acpi.c:219 arch/x86/pci/acpi.c:267) =

> [ 2.507461][ T1] ? acpi_get_parent (drivers/acpi/acpica/nsxfobj.c:127) =

> [ 2.507461][ T1] acpi_pci_root_create (drivers/acpi/pci_root.c:897) =

> [ 2.507461][ T1] pci_acpi_scan_root (arch/x86/pci/acpi.c:431) =

> [ 2.507461][ T1] ? pci_acpi_root_init_info (arch/x86/pci/acpi.c:390) =

> [ 2.507461][ T1] ? decode_osc_bits+0x18a/0x18a =

> [ 2.507461][ T1] ? acpi_pci_find_companion (drivers/pci/pci-acpi.c:108) =

> [ 2.507461][ T1] acpi_pci_root_add.cold (drivers/acpi/pci_root.c:604) =

> [ 2.507461][ T1] ? get_root_bridge_busnr_callback (drivers/acpi/pci_root.=
c:524) =

> [ 2.507461][ T1] ? klist_next (lib/klist.c:403) =

> [ 2.507461][ T1] ? acpi_bus_get_status_handle (drivers/acpi/bus.c:97) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2181 drivers/acpi/s=
can.c:2228) =

> [ 2.507461][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2194) =

> [ 2.507461][ T1] ? __device_attach (drivers/base/dd.c:942) =

> [ 2.507461][ T1] ? device_bind_driver (drivers/base/dd.c:942) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2248 (discriminator=
 3)) =

> [ 2.507461][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2194) =

> [ 2.507461][ T1] ? __device_attach (drivers/base/dd.c:942) =

> [ 2.507461][ T1] ? device_bind_driver (drivers/base/dd.c:942) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2248 (discriminator=
 3)) =

> [ 2.507461][ T1] ? acpi_generic_device_attach (drivers/acpi/scan.c:2194) =

> [ 2.507461][ T1] ? up (include/linux/list.h:292 kernel/locking/semaphore.=
c:187) =

> [ 2.507461][ T1] ? acpi_os_signal_semaphore (drivers/acpi/osl.c:1305) =

> [ 2.507461][ T1] ? acpi_ut_release_read_lock (drivers/acpi/acpica/utlock.=
c:111) =

> [ 2.507461][ T1] ? acpi_bus_check_add_2 (drivers/acpi/scan.c:2116) =

> [ 2.507461][ T1] ? acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:61=
6 drivers/acpi/acpica/nsxfeval.c:554) =

> [ 2.507461][ T1] acpi_bus_scan (drivers/acpi/scan.c:2441) =

> [ 2.507461][ T1] ? acpi_bus_check_add_1 (drivers/acpi/scan.c:2423) =

> [ 2.507461][ T1] acpi_scan_init (drivers/acpi/scan.c:2603) =

> [ 2.507461][ T1] ? acpi_match_madt (drivers/acpi/scan.c:2553) =

> [ 2.507461][ T1] ? acpi_ut_release_mutex (drivers/acpi/acpica/utmutex.c:3=
29) =

> [ 2.507461][ T1] ? acpi_install_address_space_handler (drivers/acpi/acpic=
a/evxfregn.c:88) =

> [ 2.507461][ T1] acpi_init (drivers/acpi/bus.c:1335) =

> [ 2.507461][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1311) =

> [ 2.507461][ T1] do_one_initcall (init/main.c:1300) =

> [ 2.507461][ T1] ? perf_trace_initcall_level (init/main.c:1291) =

> [ 2.507461][ T1] ? parameq (kernel/params.c:170) =

> [ 2.507461][ T1] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/kasan/shadow.=
c:142) =

> [ 2.507461][ T1] ? __kasan_slab_alloc (mm/kasan/common.c:431 mm/kasan/com=
mon.c:469) =

> [ 2.507461][ T1] kernel_init_freeable (init/main.c:1372 init/main.c:1389 =
init/main.c:1408 init/main.c:1613) =

> [ 2.507461][ T1] ? console_on_rootfs (init/main.c:1584) =

> [ 2.507461][ T1] ? _raw_spin_lock_irq (arch/x86/include/asm/atomic.h:202 =
include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspinloc=
k.h:82 include/linux/spinlock.h:185 include/linux/spinlock_api_smp.h:120 ke=
rnel/locking/spinlock.c:170) =

> [ 2.507461][ T1] ? _raw_spin_lock (kernel/locking/spinlock.c:169) =

> [ 2.507461][ T1] ? rest_init (init/main.c:1494) =

> [ 2.507461][ T1] kernel_init (init/main.c:1504) =

> [ 2.507461][ T1] ret_from_fork (arch/x86/entry/entry_64.S:301) =

> [    2.507461][    T1]  </TASK>
> [    2.507461][    T1]
> [    2.507461][    T1] Allocated by task 1:
> [ 2.507461][ T1] kasan_save_stack (mm/kasan/common.c:39) =

> [ 2.507461][ T1] __kasan_kmalloc (mm/kasan/common.c:45 mm/kasan/common.c:=
436 mm/kasan/common.c:515 mm/kasan/common.c:524) =

> [ 2.507461][ T1] resource_list_create_entry (kernel/resource.c:1783) =

> [ 2.507461][ T1] acpi_dev_new_resource_entry (drivers/acpi/resource.c:564=
) =

> [ 2.507461][ T1] acpi_dev_process_resource (drivers/acpi/resource.c:601 d=
rivers/acpi/resource.c:575) =

> [ 2.507461][ T1] acpi_walk_resource_buffer (drivers/acpi/acpica/rsxface.c=
:548) =

> [ 2.507461][ T1] acpi_walk_resources (include/acpi/platform/aclinuxex.h:6=
2 drivers/acpi/acpica/rsxface.c:624 drivers/acpi/acpica/rsxface.c:594) =

> [ 2.507461][ T1] __acpi_dev_get_resources (drivers/acpi/resource.c:635 dr=
ivers/acpi/resource.c:614) =

> [ 2.507461][ T1] acpi_pci_probe_root_resources (drivers/acpi/pci_root.c:7=
77) =

> [ 2.507461][ T1] pci_acpi_root_prepare_resources (arch/x86/pci/acpi.c:358=
) =

> [ 2.507461][ T1] acpi_pci_root_create (drivers/acpi/pci_root.c:897) =

> [ 2.507461][ T1] pci_acpi_scan_root (arch/x86/pci/acpi.c:431) =

> [ 2.507461][ T1] acpi_pci_root_add.cold (drivers/acpi/pci_root.c:604) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2181 drivers/acpi/s=
can.c:2228) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2248 (discriminator=
 3)) =

> [ 2.507461][ T1] acpi_bus_scan (drivers/acpi/scan.c:2441) =

> [ 2.507461][ T1] acpi_scan_init (drivers/acpi/scan.c:2603) =

> [ 2.507461][ T1] acpi_init (drivers/acpi/bus.c:1335) =

> [ 2.507461][ T1] do_one_initcall (init/main.c:1300) =

> [ 2.507461][ T1] kernel_init_freeable (init/main.c:1372 init/main.c:1389 =
init/main.c:1408 init/main.c:1613) =

> [ 2.507461][ T1] kernel_init (init/main.c:1504) =

> [ 2.507461][ T1] ret_from_fork (arch/x86/entry/entry_64.S:301) =

> [    2.507461][    T1]
> [    2.507461][    T1] Freed by task 1:
> [ 2.507461][ T1] kasan_save_stack (mm/kasan/common.c:39) =

> [ 2.507461][ T1] kasan_set_track (mm/kasan/common.c:45) =

> [ 2.507461][ T1] kasan_set_free_info (mm/kasan/generic.c:372) =

> [ 2.507461][ T1] __kasan_slab_free (mm/kasan/common.c:368 mm/kasan/common=
.c:328 mm/kasan/common.c:374) =

> [ 2.507461][ T1] kfree (mm/slub.c:1754 mm/slub.c:3509 mm/slub.c:4562) =

> [ 2.507461][ T1] pci_acpi_root_prepare_resources (include/linux/resource_=
ext.h:53 include/linux/resource_ext.h:60 arch/x86/pci/acpi.c:361) =

> [ 2.507461][ T1] acpi_pci_root_create (drivers/acpi/pci_root.c:897) =

> [ 2.507461][ T1] pci_acpi_scan_root (arch/x86/pci/acpi.c:431) =

> [ 2.507461][ T1] acpi_pci_root_add.cold (drivers/acpi/pci_root.c:604) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2181 drivers/acpi/s=
can.c:2228) =

> [ 2.507461][ T1] acpi_bus_attach (drivers/acpi/scan.c:2248 (discriminator=
 3)) =

> [ 2.507461][ T1] acpi_bus_scan (drivers/acpi/scan.c:2441) =

> [ 2.507461][ T1] acpi_scan_init (drivers/acpi/scan.c:2603) =

> [ 2.507461][ T1] acpi_init (drivers/acpi/bus.c:1335) =

> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.17.0-rc5-00001-g62fabd56faaf .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage modules
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-ins=
tall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
> =

> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
>=20

--===============3614122397844852404==--

