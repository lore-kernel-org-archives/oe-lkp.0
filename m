Content-Type: multipart/mixed; boundary="===============8772877371845268052=="
MIME-Version: 1.0
From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
To: lkp@lists.01.org
Subject: Re: [ACPI] 1d52f10917: BUG:KASAN:use-after-free_in_strlen
Date: Mon, 08 Aug 2022 18:54:49 +0200
Message-ID: <57f48ba3-d01c-f3d8-8e33-65d3cd9a349e@intel.com>
In-Reply-To: <Yu+z9IMoxRrDTjpd@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8772877371845268052==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On 8/7/2022 2:45 PM, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: 1d52f10917a751f90e269a0ed9b6cca60dbe0300 ("ACPI: property: Tie da=
ta nodes to acpi handles")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> in testcase: xsave-test
> version: xsave-test-x86_64-c2e44fa-1_20220609
> with following parameters:
>
> 	ucode: 0xec
>
>
>
> on test machine: 12 threads 1 sockets Intel(R) Core(TM) i7-8700 CPU @ 3.2=
0GHz with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

The crash below occurs right after a "Can't tag data node" message from =

acpi_tie_nondev_subnodes() and I'm really unsure why acpi_attach_data() =

has failed here, because none of the arguments is NULL.

Can you have a look at this, please?


>
> [ 1.735553][ T1] BUG: KASAN: use-after-free in strlen (lib/string.c:487)
> [    1.735787][    T1] Read of size 1 at addr ffff8881036e8820 by task sw=
apper/0/1
> [    1.735787][    T1]
> [    1.735787][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-r=
c8-00002-g1d52f10917a7 #1
> [    1.735787][    T1] Hardware name: Dell Inc. Vostro 3670/0HVPDY, BIOS =
1.5.11 12/24/2018
> [    1.735787][    T1] Call Trace:
> [    1.735787][    T1]  <TASK>
> [ 1.735787][ T1] ? strlen (lib/string.c:487)
> [ 1.735787][ T1] dump_stack_lvl (lib/dump_stack.c:107 (discriminator 1))
> [ 1.735787][ T1] print_address_description+0x1f/0x200
> [ 1.735787][ T1] ? strlen (lib/string.c:487)
> [ 1.735787][ T1] print_report.cold (mm/kasan/report.c:430)
> [ 1.735787][ T1] ? acpi_ns_opens_scope (drivers/acpi/acpica/nsutils.c:638)
> [ 1.735787][ T1] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:=
202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspi=
nlock.h:111 include/linux/spinlock.h:185 include/linux/spinlock_api_smp.h:1=
11 kernel/locking/spinlock.c:162)
> [ 1.735787][ T1] kasan_report (mm/kasan/report.c:162 mm/kasan/report.c:49=
3)
> [ 1.735787][ T1] ? strlen (lib/string.c:487)
> [ 1.735787][ T1] strlen (lib/string.c:487)
> [ 1.735787][ T1] kstrdup (mm/util.c:61)
> [ 1.735787][ T1] kobject_set_name_vargs (lib/kobject.c:257)
> [ 1.735787][ T1] ? kobject_init (arch/x86/include/asm/atomic.h:41 include=
/linux/atomic/atomic-instrumented.h:42 include/linux/refcount.h:136 include=
/linux/kref.h:31 lib/kobject.c:184 lib/kobject.c:180 lib/kobject.c:336)
> [ 1.735787][ T1] kobject_init_and_add (lib/kobject.c:353 lib/kobject.c:44=
1)
> [ 1.735787][ T1] ? kobject_create_and_add (lib/kobject.c:434)
> [ 1.735787][ T1] ? acpi_get_data (drivers/acpi/acpica/nsxfname.c:48)
> [ 1.735787][ T1] ? sysfs_create_file_ns (fs/sysfs/file.c:347)
> [ 1.735787][ T1] acpi_expose_nondev_subnodes (drivers/acpi/device_sysfs.c=
:100)
> [ 1.735787][ T1] acpi_device_setup_files (drivers/acpi/device_sysfs.c:598)
> [ 1.735787][ T1] ? acpi_device_uevent_modalias (drivers/acpi/device_sysfs=
.c:517)
> [ 1.735787][ T1] __acpi_device_add (drivers/acpi/scan.c:745)
> [ 1.735787][ T1] ? acpi_add_id (drivers/acpi/scan.c:460)
> [ 1.735787][ T1] ? acpi_scan_check_dep (drivers/acpi/scan.c:674)
> [ 1.735787][ T1] ? up (include/linux/list.h:292 kernel/locking/semaphore.=
c:188)
> [ 1.735787][ T1] ? acpi_ns_attach_data (drivers/acpi/acpica/nsobject.c:33=
6)
> [ 1.735787][ T1] ? acpi_os_signal_semaphore (drivers/acpi/osl.c:1307)
> [ 1.735787][ T1] ? acpi_ut_release_mutex (drivers/acpi/acpica/utmutex.c:3=
29)
> [ 1.735787][ T1] acpi_add_single_object (drivers/acpi/scan.c:1868)
> [ 1.735787][ T1] ? up (include/linux/list.h:292 kernel/locking/semaphore.=
c:188)
> [ 1.735787][ T1] acpi_bus_check_add (drivers/acpi/scan.c:2099)
> [ 1.735787][ T1] ? acpi_add_single_object (drivers/acpi/scan.c:2052)
> [ 1.735787][ T1] ? _raw_spin_lock_irqsave (arch/x86/include/asm/atomic.h:=
202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qspi=
nlock.h:111 include/linux/spinlock.h:185 include/linux/spinlock_api_smp.h:1=
11 kernel/locking/spinlock.c:162)
> [ 1.735787][ T1] ? _raw_read_unlock_irqrestore (kernel/locking/spinlock.c=
:161)
> [ 1.735787][ T1] ? acpi_scan_match_handler (drivers/acpi/scan.c:1936 driv=
ers/acpi/scan.c:1952)
> [ 1.735787][ T1] ? up (include/linux/list.h:292 kernel/locking/semaphore.=
c:188)
> [ 1.735787][ T1] acpi_ns_walk_namespace (drivers/acpi/acpica/nswalk.c:233)
> [ 1.735787][ T1] ? acpi_bus_check_add_2 (drivers/acpi/scan.c:2113)
> [ 1.735787][ T1] ? acpi_bus_check_add_2 (drivers/acpi/scan.c:2113)
> [ 1.735787][ T1] acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:606 =
drivers/acpi/acpica/nsxfeval.c:554)
> [ 1.735787][ T1] acpi_bus_scan (drivers/acpi/scan.c:2428)
> [ 1.735787][ T1] ? acpi_bus_check_add_1 (drivers/acpi/scan.c:2420)
> [ 1.735787][ T1] acpi_scan_init (drivers/acpi/scan.c:2600)
> [ 1.735787][ T1] ? acpi_match_madt (drivers/acpi/scan.c:2550)
> [ 1.735787][ T1] ? hest_ghes_dev_register (drivers/acpi/apei/hest.c:233)
> [ 1.735787][ T1] ? acpi_install_address_space_handler (drivers/acpi/acpic=
a/evxfregn.c:88)
> [ 1.735787][ T1] acpi_init (drivers/acpi/bus.c:1405)
> [ 1.735787][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1379)
> [ 1.735787][ T1] ? acpi_bus_init (drivers/acpi/bus.c:1379)
> [ 1.735787][ T1] do_one_initcall (init/main.c:1295)
> [ 1.735787][ T1] ? trace_event_raw_event_initcall_level (init/main.c:1286)
> [ 1.735787][ T1] ? parse_one (kernel/params.c:170)
> [ 1.735787][ T1] ? sysvec_call_function_single (arch/x86/kernel/apic/apic=
.c:1106)
> [ 1.735787][ T1] ? kasan_unpoison (mm/kasan/shadow.c:108 mm/kasan/shadow.=
c:142)
> [ 1.735787][ T1] do_initcalls (init/main.c:1367 init/main.c:1384)
> [ 1.735787][ T1] kernel_init_freeable (init/main.c:1614)
> [ 1.735787][ T1] ? console_on_rootfs (init/main.c:1581)
> [ 1.735787][ T1] ? usleep_range_state (kernel/time/timer.c:1897)
> [ 1.735787][ T1] ? _raw_spin_lock_bh (kernel/locking/spinlock.c:169)
> [ 1.735787][ T1] ? rest_init (init/main.c:1491)
> [ 1.735787][ T1] ? rest_init (init/main.c:1491)
> [ 1.735787][ T1] kernel_init (init/main.c:1501)
> [ 1.735787][ T1] ret_from_fork (arch/x86/entry/entry_64.S:306)
> [    1.735787][    T1]  </TASK>
> [    1.735787][    T1]
> [    1.735787][    T1] Allocated by task 1:
> [ 1.735787][ T1] kasan_save_stack (mm/kasan/common.c:39)
> [ 1.735787][ T1] __kasan_kmalloc (mm/kasan/common.c:45 mm/kasan/common.c:=
436 mm/kasan/common.c:515 mm/kasan/common.c:524)
> [ 1.735787][ T1] acpi_ut_initialize_buffer (drivers/acpi/acpica/utalloc.c=
:327)
> [ 1.735787][ T1] acpi_evaluate_object (drivers/acpi/acpica/nsxfeval.c:400)
> [ 1.735787][ T1] acpi_evaluate_object_typed (drivers/acpi/acpica/nsxfeval=
.c:84)
> [ 1.735787][ T1] acpi_init_properties (drivers/acpi/property.c:447)
> [ 1.735787][ T1] acpi_init_device_object (drivers/acpi/scan.c:1105 driver=
s/acpi/scan.c:1790)
> [ 1.735787][ T1] acpi_add_single_object (drivers/acpi/scan.c:1844)
> [ 1.735787][ T1] acpi_bus_check_add (drivers/acpi/scan.c:2099)
> [ 1.735787][ T1] acpi_ns_walk_namespace (drivers/acpi/acpica/nswalk.c:233)
> [ 1.735787][ T1] acpi_walk_namespace (drivers/acpi/acpica/nsxfeval.c:606 =
drivers/acpi/acpica/nsxfeval.c:554)
> [ 1.735787][ T1] acpi_bus_scan (drivers/acpi/scan.c:2428)
> [ 1.735787][ T1] acpi_scan_init (drivers/acpi/scan.c:2600)
> [ 1.735787][ T1] acpi_init (drivers/acpi/bus.c:1405)
> [ 1.735787][ T1] do_one_initcall (init/main.c:1295)
> [ 1.735787][ T1] do_initcalls (init/main.c:1367 init/main.c:1384)
> [ 1.735787][ T1] kernel_init_freeable (init/main.c:1614)
> [ 1.735787][ T1] kernel_init (init/main.c:1501)
> [ 1.735787][ T1] ret_from_fork (arch/x86/entry/entry_64.S:306)
> [    1.735787][    T1]
> [    1.735787][    T1] Freed by task 1:
> [ 1.735787][ T1] kasan_save_stack (mm/kasan/common.c:39)
> [ 1.735787][ T1] kasan_set_track (mm/kasan/common.c:45)
> [ 1.735787][ T1] kasan_set_free_info (mm/kasan/generic.c:372)
> [ 1.735787][ T1] __kasan_slab_free (mm/kasan/common.c:368 mm/kasan/common=
.c:328 mm/kasan/common.c:374)
> [ 1.735787][ T1] kfree (mm/slub.c:1780 mm/slub.c:3536 mm/slub.c:4584)
> [ 1.735787][ T1] acpi_init_properties (drivers/acpi/property.c:467)
> [ 1.735787][ T1] acpi_init_device_object (drivers/acpi/scan.c:1105 driver=
s/acpi/scan.c:1790)
> [ 1.735787][ T1] acpi_add_single_object (drivers/acpi/scan.c:1844)
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

--===============8772877371845268052==--

