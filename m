Content-Type: multipart/mixed; boundary="===============8915147997500548918=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [ACPI] c793ed7ccf: BUG:KASAN:stack-out-of-bounds
Date: Wed, 07 Jun 2017 12:34:59 +0300
Message-ID: <1496828099.22624.36.camel@linux.intel.com>
In-Reply-To: <20170607020804.GG2969@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8915147997500548918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-06-07 at 10:08 +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: c793ed7ccf42ff8dba7863eb4568b9e59f232251 ("ACPI: Switch to use
> generic guid_t in acpi_evaluate_dsm()")
> git://git.infradead.org/users/hch/uuid.git acpi

I think the below might fix the issue (it looks like related to gcc bug)

--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -638,7 +638,7 @@ acpi_evaluate_dsm(acpi_handle handle, const guid_t
*guid, u64 rev, u64 func,
=C2=A0
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[0].type =3D ACPI_TYP=
E_BUFFER;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[0].buffer.length =3D=
 16;
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[0].buffer.pointer =3D (u8=
 *)&guid;
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[0].buffer.pointer =3D (u8=
 *)guid;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[1].type =3D ACPI_TYP=
E_INTEGER;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[1].integer.value =3D=
 rev;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0params[2].type =3D ACPI_TYP=
E_INTEGER;


> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> +-------------------------------+------------+------------+
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| b7fe92999a | c793ed7ccf |
> =

> +-------------------------------+------------+------------+
> > boot_successes=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
> > boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|
> > BUG:KASAN:stack-out-of-bounds | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
> =

> +-------------------------------+------------+------------+
> =

> =

> =

> [=C2=A0=C2=A0=C2=A0=C2=A00.615801] BUG: KASAN: stack-out-of-bounds in
> acpi_ut_copy_eobject_to_iobject+0x249/0x2c5
> [=C2=A0=C2=A0=C2=A0=C2=A00.618496] Read of size 16 at addr ffff8800191d73=
30 by task
> swapper/0/1
> [=C2=A0=C2=A0=C2=A0=C2=A00.620332]=C2=A0
> [=C2=A0=C2=A0=C2=A0=C2=A00.621292] CPU: 0 PID: 1 Comm: swapper/0 Not tain=
ted 4.12.0-rc4-
> 00028-gc793ed7 #1
> [=C2=A0=C2=A0=C2=A0=C2=A00.623852] Hardware name: QEMU Standard PC (i440F=
X + PIIX, 1996),
> BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
> [=C2=A0=C2=A0=C2=A0=C2=A00.626859] Call Trace:
> [=C2=A0=C2=A0=C2=A0=C2=A00.627990]=C2=A0=C2=A0dump_stack+0x61/0x7d
> [=C2=A0=C2=A0=C2=A0=C2=A00.629265]=C2=A0=C2=A0print_address_description+0=
x70/0x22a
> [=C2=A0=C2=A0=C2=A0=C2=A00.630765]=C2=A0=C2=A0kasan_report+0x1d1/0x1f1
> [=C2=A0=C2=A0=C2=A0=C2=A00.632083]=C2=A0=C2=A0? __kmalloc+0x30/0x131
> [=C2=A0=C2=A0=C2=A0=C2=A00.633383]=C2=A0=C2=A0? acpi_ut_copy_eobject_to_i=
object+0x249/0x2c5
> [=C2=A0=C2=A0=C2=A0=C2=A00.635005]=C2=A0=C2=A0check_memory_region+0x12b/0=
x130
> [=C2=A0=C2=A0=C2=A0=C2=A00.636432]=C2=A0=C2=A0memcpy+0x23/0x4c
> [=C2=A0=C2=A0=C2=A0=C2=A00.637650]=C2=A0=C2=A0acpi_ut_copy_eobject_to_iob=
ject+0x249/0x2c5
> [=C2=A0=C2=A0=C2=A0=C2=A00.639251]=C2=A0=C2=A0acpi_evaluate_object+0x1f4/=
0x3eb
> [=C2=A0=C2=A0=C2=A0=C2=A00.640693]=C2=A0=C2=A0? acpi_ns_get_device_callba=
ck+0x2b7/0x2b7
> [=C2=A0=C2=A0=C2=A0=C2=A00.642257]=C2=A0=C2=A0? lock_release+0x268/0x2d2
> [=C2=A0=C2=A0=C2=A0=C2=A00.643606]=C2=A0=C2=A0acpi_evaluate_dsm+0x149/0x1=
a7
> [=C2=A0=C2=A0=C2=A0=C2=A00.645001]=C2=A0=C2=A0? acpi_evaluate_lck+0x5a/0x=
5a
> [=C2=A0=C2=A0=C2=A0=C2=A00.646401]=C2=A0=C2=A0? do_raw_spin_unlock+0xbf/0=
xc9
> [=C2=A0=C2=A0=C2=A0=C2=A00.647823]=C2=A0=C2=A0? refcount_sub_and_test+0x1=
5/0x5d
> [=C2=A0=C2=A0=C2=A0=C2=A00.649287]=C2=A0=C2=A0? kobject_put+0x44/0x53
> [=C2=A0=C2=A0=C2=A0=C2=A00.650590]=C2=A0=C2=A0? put_device+0x12/0x14
> [=C2=A0=C2=A0=C2=A0=C2=A00.651876]=C2=A0=C2=A0? __raw_spin_lock_init+0x66=
/0x70
> [=C2=A0=C2=A0=C2=A0=C2=A00.653326]=C2=A0=C2=A0acpi_pci_add_bus+0x9f/0xf1
> [=C2=A0=C2=A0=C2=A0=C2=A00.654682]=C2=A0=C2=A0pcibios_add_bus+0x9/0xb
> [=C2=A0=C2=A0=C2=A0=C2=A00.655982]=C2=A0=C2=A0pci_register_host_bridge+0x=
487/0x6fc
> [=C2=A0=C2=A0=C2=A0=C2=A00.657487]=C2=A0=C2=A0? kasan_unpoison_shadow+0x1=
4/0x35
> [=C2=A0=C2=A0=C2=A0=C2=A00.658932]=C2=A0=C2=A0? pci_bus_insert_busn_res+0=
x1d0/0x1d0
> [=C2=A0=C2=A0=C2=A0=C2=A00.660440]=C2=A0=C2=A0? kasan_kmalloc+0x94/0xa3
> [=C2=A0=C2=A0=C2=A0=C2=A00.661786]=C2=A0=C2=A0? __kmalloc+0x11e/0x131
> [=C2=A0=C2=A0=C2=A0=C2=A00.663089]=C2=A0=C2=A0pci_create_root_bus_msi+0x1=
46/0x178
> [=C2=A0=C2=A0=C2=A0=C2=A00.664578]=C2=A0=C2=A0pci_create_root_bus+0xc/0xe
> [=C2=A0=C2=A0=C2=A0=C2=A00.665948]=C2=A0=C2=A0acpi_pci_root_create+0x25b/=
0x2d2
> [=C2=A0=C2=A0=C2=A0=C2=A00.667401]=C2=A0=C2=A0? kasan_kmalloc+0x94/0xa3
> [=C2=A0=C2=A0=C2=A0=C2=A00.668741]=C2=A0=C2=A0pci_acpi_scan_root+0x229/0x=
26b
> [=C2=A0=C2=A0=C2=A0=C2=A00.670149]=C2=A0=C2=A0acpi_pci_root_add+0x413/0x5=
7e
> [=C2=A0=C2=A0=C2=A0=C2=A00.671561]=C2=A0=C2=A0? acpi_pci_root_release_inf=
o+0xaf/0xaf
> [=C2=A0=C2=A0=C2=A0=C2=A00.673081]=C2=A0=C2=A0? lock_release+0x268/0x2d2
> [=C2=A0=C2=A0=C2=A0=C2=A00.674446]=C2=A0=C2=A0? __device_attach+0x135/0x1=
5e
> [=C2=A0=C2=A0=C2=A0=C2=A00.675837]=C2=A0=C2=A0? acpi_match_device_ids+0xb=
/0x16
> [=C2=A0=C2=A0=C2=A0=C2=A00.677290]=C2=A0=C2=A0? acpi_bus_get_status_handl=
e+0x2a/0x36
> [=C2=A0=C2=A0=C2=A0=C2=A00.678801]=C2=A0=C2=A0? acpi_bus_get_status+0x9e/=
0xcb
> [=C2=A0=C2=A0=C2=A0=C2=A00.680224]=C2=A0=C2=A0? acpi_scan_match_handler+0=
x79/0xb5
> [=C2=A0=C2=A0=C2=A0=C2=A00.681716]=C2=A0=C2=A0acpi_bus_attach+0x1f7/0x339
> [=C2=A0=C2=A0=C2=A0=C2=A00.683078]=C2=A0=C2=A0? acpi_device_is_present+0x=
2d/0x2d
> [=C2=A0=C2=A0=C2=A0=C2=A00.684555]=C2=A0=C2=A0? mutex_unlock+0xd/0xf
> [=C2=A0=C2=A0=C2=A0=C2=A00.685838]=C2=A0=C2=A0? __device_attach+0x135/0x1=
5e
> [=C2=A0=C2=A0=C2=A0=C2=A00.687228]=C2=A0=C2=A0? device_bind_driver+0x6d/0=
x6d
> [=C2=A0=C2=A0=C2=A0=C2=A00.688633]=C2=A0=C2=A0? strcmp+0x27/0x4a
> [=C2=A0=C2=A0=C2=A0=C2=A00.689857]=C2=A0=C2=A0acpi_bus_attach+0x287/0x339
> [=C2=A0=C2=A0=C2=A0=C2=A00.691213]=C2=A0=C2=A0? acpi_device_is_present+0x=
2d/0x2d
> [=C2=A0=C2=A0=C2=A0=C2=A00.692678]=C2=A0=C2=A0? mutex_unlock+0xd/0xf
> [=C2=A0=C2=A0=C2=A0=C2=A00.693970]=C2=A0=C2=A0? __device_attach+0x135/0x1=
5e
> [=C2=A0=C2=A0=C2=A0=C2=A00.695372]=C2=A0=C2=A0? device_bind_driver+0x6d/0=
x6d
> [=C2=A0=C2=A0=C2=A0=C2=A00.696776]=C2=A0=C2=A0? strcmp+0x27/0x4a
> [=C2=A0=C2=A0=C2=A0=C2=A00.698017]=C2=A0=C2=A0acpi_bus_attach+0x287/0x339
> [=C2=A0=C2=A0=C2=A0=C2=A00.699381]=C2=A0=C2=A0? do_raw_spin_unlock+0xbf/0=
xc9
> [=C2=A0=C2=A0=C2=A0=C2=A00.700786]=C2=A0=C2=A0? acpi_device_is_present+0x=
2d/0x2d
> [=C2=A0=C2=A0=C2=A0=C2=A00.702266]=C2=A0=C2=A0? up+0x53/0x5a
> [=C2=A0=C2=A0=C2=A0=C2=A00.703435]=C2=A0=C2=A0? acpi_os_signal_semaphore+=
0x27/0x33
> [=C2=A0=C2=A0=C2=A0=C2=A00.704926]=C2=A0=C2=A0? acpi_ut_release_read_lock=
+0x6b/0x75
> [=C2=A0=C2=A0=C2=A0=C2=A00.706447]=C2=A0=C2=A0? acpi_add_single_object+0x=
a03/0xa03
> [=C2=A0=C2=A0=C2=A0=C2=A00.707929]=C2=A0=C2=A0? acpi_walk_namespace+0xb6/=
0xd0
> [=C2=A0=C2=A0=C2=A0=C2=A00.709356]=C2=A0=C2=A0acpi_bus_scan+0x9d/0xc5
> [=C2=A0=C2=A0=C2=A0=C2=A00.710673]=C2=A0=C2=A0? acpi_walk_dep_device_list=
+0x177/0x177
> [=C2=A0=C2=A0=C2=A0=C2=A00.712221]=C2=A0=C2=A0acpi_scan_init+0x1f8/0x4fc
> [=C2=A0=C2=A0=C2=A0=C2=A00.713571]=C2=A0=C2=A0? acpi_match_madt+0xea/0xea
> [=C2=A0=C2=A0=C2=A0=C2=A00.714934]=C2=A0=C2=A0? refcount_dec_and_test+0x1=
1/0x13
> [=C2=A0=C2=A0=C2=A0=C2=A00.716397]=C2=A0=C2=A0? kobject_put+0x44/0x53
> [=C2=A0=C2=A0=C2=A0=C2=A00.717710]=C2=A0=C2=A0? bus_put+0x29/0x2c
> [=C2=A0=C2=A0=C2=A0=C2=A00.718956]=C2=A0=C2=A0? bus_create_file+0x4b/0x57
> [=C2=A0=C2=A0=C2=A0=C2=A00.720328]=C2=A0=C2=A0? bus_register+0x36b/0x389
> [=C2=A0=C2=A0=C2=A0=C2=A00.721681]=C2=A0=C2=A0acpi_init+0x5e0/0x67c
> [=C2=A0=C2=A0=C2=A0=C2=A00.722952]=C2=A0=C2=A0? acpi_sleep_init+0x2b7/0x2=
b7
> [=C2=A0=C2=A0=C2=A0=C2=A00.724358]=C2=A0=C2=A0? do_raw_spin_unlock+0xbf/0=
xc9
> [=C2=A0=C2=A0=C2=A0=C2=A00.725765]=C2=A0=C2=A0? _raw_spin_unlock_irqresto=
re+0x2f/0x3b
> [=C2=A0=C2=A0=C2=A0=C2=A00.727319]=C2=A0=C2=A0? add_device_randomness+0xc=
c/0xe7
> [=C2=A0=C2=A0=C2=A0=C2=A00.728764]=C2=A0=C2=A0? __class_create+0x87/0xb0
> [=C2=A0=C2=A0=C2=A0=C2=A00.730113]=C2=A0=C2=A0? video_setup+0x189/0x189
> [=C2=A0=C2=A0=C2=A0=C2=A00.731454]=C2=A0=C2=A0? acpi_sleep_init+0x2b7/0x2=
b7
> [=C2=A0=C2=A0=C2=A0=C2=A00.732848]=C2=A0=C2=A0do_one_initcall+0x12d/0x2c7
> [=C2=A0=C2=A0=C2=A0=C2=A00.734221]=C2=A0=C2=A0? start_kernel+0x5bd/0x5bd
> [=C2=A0=C2=A0=C2=A0=C2=A00.735571]=C2=A0=C2=A0? do_raw_spin_unlock+0x9f/0=
xc9
> [=C2=A0=C2=A0=C2=A0=C2=A00.736978]=C2=A0=C2=A0? _raw_spin_unlock_irqresto=
re+0x2f/0x3b
> [=C2=A0=C2=A0=C2=A0=C2=A00.738535]=C2=A0=C2=A0kernel_init_freeable+0x217/=
0x35c
> [=C2=A0=C2=A0=C2=A0=C2=A00.739968]=C2=A0=C2=A0? rest_init+0xd1/0xd1
> [=C2=A0=C2=A0=C2=A0=C2=A00.741263]=C2=A0=C2=A0kernel_init+0xc/0x100
> [=C2=A0=C2=A0=C2=A0=C2=A00.742540]=C2=A0=C2=A0? rest_init+0xd1/0xd1
> [=C2=A0=C2=A0=C2=A0=C2=A00.743808]=C2=A0=C2=A0ret_from_fork+0x25/0x30
> [=C2=A0=C2=A0=C2=A0=C2=A00.745114]=C2=A0
> [=C2=A0=C2=A0=C2=A0=C2=A00.746065] The buggy address belongs to the page:
> [=C2=A0=C2=A0=C2=A0=C2=A00.747592] page:ffffea00006475c0 count:0 mapcount=
:0
> mapping:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(null=
) index:0x0
> [=C2=A0=C2=A0=C2=A0=C2=A00.750243] flags: 0x100000000000000()
> [=C2=A0=C2=A0=C2=A0=C2=A00.751581] raw: 0100000000000000 0000000000000000=
 0000000000000000
> 00000000ffffffff
> [=C2=A0=C2=A0=C2=A0=C2=A00.754180] raw: ffffea00006475e0 ffffea00006475e0=
 0000000000000000
> 0000000000000000
> [=C2=A0=C2=A0=C2=A0=C2=A00.756781] page dumped because: kasan: bad access=
 detected
> [=C2=A0=C2=A0=C2=A0=C2=A00.758427]=C2=A0
> [=C2=A0=C2=A0=C2=A0=C2=A00.759380] Memory state around the buggy address:
> [=C2=A0=C2=A0=C2=A0=C2=A00.760884]=C2=A0=C2=A0ffff8800191d7200: 00 00 00 =
00 00 00 00 00 00 00 00 00
> 00 00 00 00
> [=C2=A0=C2=A0=C2=A0=C2=A00.778503]=C2=A0=C2=A0ffff8800191d7280: 00 00 f1 =
f1 f1 f1 00 f4 f4 f4 f3 f3
> f3 f3 00 00
> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0git clone https://github.=
com/01org/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bin/lkp qemu -k <bzImage>=
 job-script=C2=A0=C2=A0# job-script is attached
> in this email
> =

> =

> =

> Thanks,
> Xiaolong

-- =

Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy

--===============8915147997500548918==--

