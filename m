Content-Type: multipart/mixed; boundary="===============7021584629535096915=="
MIME-Version: 1.0
From: Fengguang Wu <wfg@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [parport] BUG kmalloc-16 (Not tainted): Object already free
Date: Mon, 27 Jul 2015 07:46:59 +0800
Message-ID: <20150726234659.GA12703@wfg-t540p.sh.intel.com>
In-Reply-To: <55b50ff5.ix9cERaWn4rwWV5c%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7021584629535096915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sorry for the duplicate report! It'll be auto avoided in future.

On Mon, Jul 27, 2015 at 12:51:01AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 23c405912b881e3ca516554efde852c2ad550b31
> Author:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> AuthorDate: Mon Jun 15 20:05:50 2015 +0530
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Wed Jul 22 21:15:49 2015 -0700
> =

>     parport: fix memory leak
>     =

>     After the reference count becomes 0 when put_device() is called, it w=
ill
>     execute the release callback where we are freeing all the allocated
>     memory associated with the device. We missed freeing par_dev->state.
>     =

>     Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> +-------------------------------------------------------------+----------=
--+------------+------------+
> |                                                             | cabea6958=
7 | 23c405912b | 3505500da0 |
> +-------------------------------------------------------------+----------=
--+------------+------------+
> | boot_successes                                              | 63       =
  | 0          | 0          |
> | boot_failures                                               | 0        =
  | 24         | 17         |
> | BUG_kmalloc-#(Not_tainted):Object_already_free              | 0        =
  | 24         | 17         |
> | INFO:Allocated_in_parport_register_dev_model_age=3D#cpu=3D#pid=3D | 0  =
        | 24         | 17         |
> | INFO:Freed_in_parport_unregister_device_age=3D#cpu=3D#pid=3D      | 0  =
        | 24         | 17         |
> | INFO:Slab#objects=3D#used=3D#fp=3D#flags=3D                         | 0=
          | 24         | 17         |
> | INFO:Object#@offset=3D#fp=3D                                    | 0    =
      | 24         | 17         |
> | backtrace:__parport_register_driver                         | 0        =
  | 24         | 17         |
> | backtrace:panel_init_module                                 | 0        =
  | 24         | 17         |
> | backtrace:kernel_init_freeable                              | 0        =
  | 24         | 17         |
> | IP-Config:Auto-configuration_of_network_failed              | 0        =
  | 2          | 2          |
> +-------------------------------------------------------------+----------=
--+------------+------------+
> =

> [    8.033163] hv_vmbus: registering driver hid_hyperv
> [    8.041742] panel: could not claim access to parport0. Aborting.
> [    8.043371] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [    8.045047] BUG kmalloc-16 (Not tainted): Object already free
> [    8.046216] ----------------------------------------------------------=
-------------------
> [    8.046216] =

> [    8.048066] Disabling lock debugging due to kernel taint
> [    8.049127] INFO: Allocated in parport_register_dev_model+0x117/0x490 =
age=3D1 cpu=3D0 pid=3D1
> [    8.060317] INFO: Freed in parport_unregister_device+0x1a5/0x2d0 age=
=3D0 cpu=3D0 pid=3D1
> [    8.070909] INFO: Slab 0xffffea0000004500 objects=3D23 used=3D19 fp=3D=
0xffff880000115178 flags=3D0x4081
> [    8.072591] INFO: Object 0xffff880000115178 @offset=3D4472 fp=3D0xffff=
880000114d70
> [    8.072591] =

> [    8.074266] Bytes b4 ffff880000115168: 00 00 00 00 00 00 00 00 5a 5a 5=
a 5a 5a 5a 5a 5a  ........ZZZZZZZZ
> [    8.076100] Object ffff880000115178: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b =
6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
> [    8.077883] Redzone ffff880000115188: bb bb bb bb bb bb bb bb         =
                 ........
> [    8.079558] Padding ffff8800001152c8: 5a 5a 5a 5a 5a 5a 5a 5a         =
                 ZZZZZZZZ
> [    8.081225] CPU: 0 PID: 1 Comm: swapper Tainted: G    B           4.2.=
0-rc3-00002-g23c4059 #1
> [    8.082846]  ffff880000115178 ffff880010e03ac8 ffffffff81fa8b17 ffff88=
0010e03b08
> [    8.084398]  ffffffff8123e8ce 0000000000000008 0000000000000001 ffff88=
0010c03b00
> [    8.085949]  ffff880000115178 ffff880010c00380 ffffea0000004500 ffff88=
0010e03b58
> [    8.087488] Call Trace:
> [    8.087984]  [<ffffffff81fa8b17>] dump_stack+0x19/0x1b
> [    8.088975]  [<ffffffff8123e8ce>] print_trailer+0x1ae/0x250
> [    8.090087]  [<ffffffff81241a09>] free_debug_processing+0x329/0x3d0
> [    8.091356]  [<ffffffff819bfad6>] ? free_pardevice+0x26/0x40
> [    8.092492]  [<ffffffff81241d4c>] __slab_free+0x29c/0x4c0
> [    8.093578]  [<ffffffff8112fd01>] ? mark_held_locks+0x11/0x90
> [    8.094704]  [<ffffffff8112fd59>] ? mark_held_locks+0x69/0x90
> [    8.095846]  [<ffffffff8124628f>] ? kfree+0x3df/0x580
> [    8.096817]  [<ffffffff812463a6>] kfree+0x4f6/0x580
> [    8.097778]  [<ffffffff819bfad6>] ? free_pardevice+0x26/0x40
> [    8.098915]  [<ffffffff819bfad6>] free_pardevice+0x26/0x40
> [    8.100090]  [<ffffffff819c714f>] device_release+0x7f/0x100
> [    8.101213]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.102283]  [<ffffffff813f5c1d>] kobject_release+0x9d/0x110
> [    8.103411]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.104464]  [<ffffffff813f5aa2>] kobject_put+0xc2/0xd0
> [    8.105465]  [<ffffffff819c81d0>] put_device+0x30/0x40
> [    8.106454]  [<ffffffff819c9295>] device_unregister+0x35/0x40
> [    8.107549]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.108561]  [<ffffffff819c18f4>] parport_unregister_device+0x234/0x2d0
> [    8.109862]  [<ffffffff819bf990>] ? driver_detach+0x40/0x40
> [    8.110942]  [<ffffffff81c79a5d>] panel_attach+0x27d/0xf00
> [    8.111929]  [<ffffffff819bf990>] ? driver_detach+0x40/0x40
> [    8.112942]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.113906]  [<ffffffff819bf9c5>] port_check+0x35/0x40
> [    8.114834]  [<ffffffff819cb60f>] bus_for_each_dev+0x7f/0xc0
> [    8.116060]  [<ffffffff819bfd6d>] __parport_register_driver+0x13d/0x140
> [    8.117309]  [<ffffffff832d0ed3>] panel_init_module+0x2b7/0x33c
> [    8.118434]  [<ffffffff83269451>] do_one_initcall+0x14b/0x254
> [    8.119523]  [<ffffffff8110dd66>] ? parse_args+0x3a6/0x520
> [    8.120559]  [<ffffffff83269763>] kernel_init_freeable+0x209/0x2ce
> [    8.121722]  [<ffffffff81f9ec20>] ? rest_init+0x160/0x160
> [    8.122743]  [<ffffffff81f9ec2e>] kernel_init+0xe/0x160
> [    8.123735]  [<ffffffff81fc060f>] ret_from_fork+0x3f/0x70
> [    8.124753]  [<ffffffff81f9ec20>] ? rest_init+0x160/0x160
> [    8.125805] FIX kmalloc-16: Object at 0xffff880000115178 not freed
> [    8.127013] panel: driver version 0.9.5 not yet registered
> [    8.134972] ashmem: initialized
> =

> git bisect start 3505500da066c2d61724b028f64bc96fa2f709fa 52721d9d3334c1c=
b1f76219a161084094ec634dc --
> git bisect  bad 1d4d38f2cc8de2fafdb947940acdc4534fd1ee38  # 23:52      0-=
     22  Merge 'kees/gcc-bug' into devel-spot-201507260856
> git bisect good 65be6aecfa246aedd6ce2ec15eacc0d5c011c185  # 23:57     22+=
      0  Merge 'tip/x86/platform' into devel-spot-201507260856
> git bisect  bad c326255c9385dd42e8b6a97bf4f2d3ec5009de33  # 00:03      0-=
     16  Merge 'phy/next' into devel-spot-201507260856
> git bisect good d2ef6ed177d19d000cccc7a4eaf4c1ab5b883e15  # 00:09     20+=
      0  Merge 'kvm/master' into devel-spot-201507260856
> git bisect  bad ba1c097b2e9302730d5bef75bd029e32cefe48ef  # 00:13      0-=
      2  Merge 'mvebu/mvebu/soc' into devel-spot-201507260856
> git bisect good 4b8c61b6674b3afabd119e0ac6a4ddb6a627eb14  # 00:18     22+=
      0  Merge 'ext3/for_next' into devel-spot-201507260856
> git bisect  bad deae28e6e03aeed1293cd56f376ba54cbd3695aa  # 00:23      0-=
     10  Merge 'char-misc/char-misc-linus' into devel-spot-201507260856
> git bisect  bad 23c405912b881e3ca516554efde852c2ad550b31  # 00:27      0-=
     15  parport: fix memory leak
> git bisect good cabea695875e3a07313c205a9753c7416126dfa2  # 00:34     22+=
      0  parport: fix error handling
> # first bad commit: [23c405912b881e3ca516554efde852c2ad550b31] parport: f=
ix memory leak
> git bisect good cabea695875e3a07313c205a9753c7416126dfa2  # 00:36     63+=
      0  parport: fix error handling
> # extra tests with DEBUG_INFO
> git bisect  bad 23c405912b881e3ca516554efde852c2ad550b31  # 00:40      0-=
      6  parport: fix memory leak
> # extra tests on HEAD of linux-devel/devel-spot-201507260856
> git bisect  bad 3505500da066c2d61724b028f64bc96fa2f709fa  # 00:40      0-=
     17  0day head guard for 'devel-spot-201507260856'
> # extra tests on tree/branch linus/master
> git bisect good 26ae19a3883c9d595e9100fd10b856a7cf1a949a  # 00:46     65+=
      0  Merge tag 'usb-4.2-rc4' of git://git.kernel.org/pub/scm/linux/kern=
el/git/gregkh/usb
> # extra tests on tree/branch linus/master
> git bisect good 26ae19a3883c9d595e9100fd10b856a7cf1a949a  # 00:46     66+=
      0  Merge tag 'usb-4.2-rc4' of git://git.kernel.org/pub/scm/linux/kern=
el/git/gregkh/usb
> # extra tests on tree/branch linux-next/master
> git bisect  bad e8e9cc31b0769f2152a6825560e4005b84b2c768  # 00:50      0-=
      3  Add linux-next specific files for 20150724
> =

> =

> This script may reproduce the error.
> =

> -------------------------------------------------------------------------=
---
> #!/bin/bash
> =

> kernel=3D$1
> initrd=3Dquantal-core-x86_64.cgz
> =

> wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/m=
aster/initrd/$initrd
> =

> kvm=3D(
> 	qemu-system-x86_64
> 	-enable-kvm
> 	-cpu kvm64
> 	-kernel $kernel
> 	-initrd $initrd
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
> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Linux version 4.2.0-rc3-00002-g23c4059 (kbuild(a)lkp-ib03)=
 (gcc version 4.9.2 (Debian 4.9.2-10) ) #1 Mon Jul 27 00:25:44 CST 2015
> [    0.000000] Command line: hung_task_panic=3D1 earlyprintk=3DttyS0,1152=
00 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate=
.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1=
15200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-tests=
/run-queue/kvm/x86_64-randconfig-b0-07262114/linux-devel:devel-spot-2015072=
60856:23c405912b881e3ca516554efde852c2ad550b31:bisect-linux-8/.vmlinuz-23c4=
05912b881e3ca516554efde852c2ad550b31-20150727002602-12-ivb41 branch=3Dlinux=
-devel/devel-spot-201507260856 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-b0=
-07262114/gcc-4.9/23c405912b881e3ca516554efde852c2ad550b31/vmlinuz-4.2.0-rc=
3-00002-g23c4059 drbd.minor_count=3D8
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   AMD AuthenticAMD
> [    0.000000] CPU: vendor_id 'GenuineIntel' unknown, using generic init.
> [    0.000000] CPU: Your system may be unstable.
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
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] Hypervisor detected: KVM
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] e820: last_pfn =3D 0x12be0 max_arch_pfn =3D 0x400000000
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
WT  =

> [    0.000000] Scan for SMP in [mem 0x00000000-0x000003ff]
> [    0.000000] Scan for SMP in [mem 0x0009fc00-0x0009ffff]
> [    0.000000] Scan for SMP in [mem 0x000f0000-0x000fffff]
> [    0.000000] found SMP MP-table at [mem 0x000f0e80-0x000f0e8f] mapped a=
t [ffff8800000f0e80]
> [    0.000000]   mpc: f0e90-f0fac
> [    0.000000] Base memory trampoline at [ffff880000099000] 99000 size 24=
576
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x04110000, 0x04110fff] PGTABLE
> [    0.000000] BRK [0x04111000, 0x04111fff] PGTABLE
> [    0.000000] BRK [0x04112000, 0x04112fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x11200000-0x113fffff]
> [    0.000000]  [mem 0x11200000-0x113fffff] page 4k
> [    0.000000] BRK [0x04113000, 0x04113fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x111fffff]
> [    0.000000]  [mem 0x00100000-0x111fffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x11400000-0x12bdffff]
> [    0.000000]  [mem 0x11400000-0x12bdffff] page 4k
> [    0.000000] BRK [0x04114000, 0x04114fff] PGTABLE
> [    0.000000] BRK [0x04115000, 0x04115fff] PGTABLE
> [    0.000000] RAMDISK: [mem 0x11525000-0x12bd7fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0C60 000014 (v00 BOCHS )
> [    0.000000] ACPI: RSDT 0x0000000012BE18BD 000034 (v01 BOCHS  BXPCRSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACP 0x0000000012BE0B37 000074 (v01 BOCHS  BXPCFACP =
00000001 BXPC 00000001)
> [    0.000000] ACPI: DSDT 0x0000000012BE0040 000AF7 (v01 BOCHS  BXPCDSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: FACS 0x0000000012BE0000 000040
> [    0.000000] ACPI: SSDT 0x0000000012BE0BAB 000C5A (v01 BOCHS  BXPCSSDT =
00000001 BXPC 00000001)
> [    0.000000] ACPI: APIC 0x0000000012BE1805 000080 (v01 BOCHS  BXPCAPIC =
00000001 BXPC 00000001)
> [    0.000000] ACPI: HPET 0x0000000012BE1885 000038 (v01 BOCHS  BXPCHPET =
00000001 BXPC 00000001)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
> [    0.000000] kvm-clock: cpu 0, msr 0:12bdf001, primary cpu clock
> [    0.000000] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycle=
s: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
> [    0.000000]  [ffffea0000000000-ffffea00005fffff] PMD -> [ffff880010400=
000-ffff8800109fffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x0000000012bdffff]
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009efff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x0000000012bdffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x0000000012b=
dffff]
> [    0.000000] On node 0 totalpages: 76670
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 21 pages reserved
> [    0.000000]   DMA zone: 3998 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 1136 pages used for memmap
> [    0.000000]   DMA32 zone: 72672 pages, LIFO batch:15
> [    0.000000] ACPI: PM-Timer IO Port: 0x608
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] mapped APIC to ffffffffff5fc000 (        fee00000)
> [    0.000000] ACPI: NR_CPUS/possible_cpus limit of 1 reached.  Processor=
 1/0x1 ignored.
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
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
> [    0.000000] mapped IOAPIC to ffffffffff5fb000 (fec00000)
> [    0.000000] KVM setup async PF for cpu 0
> [    0.000000] kvm-stealtime: cpu 0, msr 2a2f940
> [    0.000000] e820: [mem 0x12c00000-0xfeffbfff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on KVM
> [    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 19112604462750000 ns
> [    0.000000] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
> [    0.000000] pcpu-alloc: [0] 0 =

> [    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  To=
tal pages: 75449
> [    0.000000] Kernel command line: hung_task_panic=3D1 earlyprintk=3Dtty=
S0,115200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled r=
cupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_wat=
chdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3Dtt=
yS0,115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-=
tests/run-queue/kvm/x86_64-randconfig-b0-07262114/linux-devel:devel-spot-20=
1507260856:23c405912b881e3ca516554efde852c2ad550b31:bisect-linux-8/.vmlinuz=
-23c405912b881e3ca516554efde852c2ad550b31-20150727002602-12-ivb41 branch=3D=
linux-devel/devel-spot-201507260856 BOOT_IMAGE=3D/pkg/linux/x86_64-randconf=
ig-b0-07262114/gcc-4.9/23c405912b881e3ca516554efde852c2ad550b31/vmlinuz-4.2=
.0-rc3-00002-g23c4059 drbd.minor_count=3D8
> [    0.000000] sysrq: sysrq always enabled.
> [    0.000000] PID hash table entries: 2048 (order: 2, 16384 bytes)
> [    0.000000] Dentry cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
> [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.000000] AGP: Checking aperture...
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] Memory: 225476K/306680K available (16139K kernel code, 860=
3K rwdata, 9052K rodata, 1368K init, 13640K bss, 81204K reserved, 0K cma-re=
served)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1,=
 Nodes=3D1
> [    0.000000] Running RCU self tests
> [    0.000000] NR_IRQS:4352 nr_irqs:256 16
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
> [    0.000000]  memory used by lock dependency info: 8159 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff=
, max_idle_ns: 19112604467 ns
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Detected 2693.508 MHz processor
> [    0.152862] Calibrating delay loop (skipped) preset value.. 5387.01 Bo=
goMIPS (lpj=3D26935080)
> [    0.153606] pid_max: default: 4096 minimum: 301
> [    0.154087] ACPI: Core revision 20150619
> [    0.211493] ACPI: All ACPI Tables successfully acquired
> [    0.212212] Security Framework initialized
> [    0.212576] Yama: becoming mindful.
> [    0.213011] Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
> [    0.213595] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.215843] Initializing cgroup subsys freezer
> [    0.216306] Initializing cgroup subsys debug
> [    0.216773] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
> [    0.217248] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
> [    0.217762] CPU: GenuineIntel Common KVM processor (fam: 0f, model: 06=
, stepping: 01)
> [    0.222080] ftrace: allocating 43476 entries in 170 pages
> [    0.266730] Performance Events: no PMU driver, software events only.
> [    0.268450] enabled ExtINT on CPU#0
> [    0.269377] ENABLING IO-APIC IRQs
> [    0.269689] init IO_APIC IRQs
> [    0.269959]  apic 0 pin 0 not connected
> [    0.270385] IOAPIC[0]: Set routing entry (0-1 -> 0x31 -> IRQ 1 Mode:0 =
Active:0 Dest:1)
> [    0.271137] IOAPIC[0]: Set routing entry (0-2 -> 0x30 -> IRQ 0 Mode:0 =
Active:0 Dest:1)
> [    0.271835] IOAPIC[0]: Set routing entry (0-3 -> 0x33 -> IRQ 3 Mode:0 =
Active:0 Dest:1)
> [    0.272619] IOAPIC[0]: Set routing entry (0-4 -> 0x34 -> IRQ 4 Mode:0 =
Active:0 Dest:1)
> [    0.273329] IOAPIC[0]: Set routing entry (0-5 -> 0x35 -> IRQ 5 Mode:1 =
Active:0 Dest:1)
> [    0.274048] IOAPIC[0]: Set routing entry (0-6 -> 0x36 -> IRQ 6 Mode:0 =
Active:0 Dest:1)
> [    0.274751] IOAPIC[0]: Set routing entry (0-7 -> 0x37 -> IRQ 7 Mode:0 =
Active:0 Dest:1)
> [    0.275460] IOAPIC[0]: Set routing entry (0-8 -> 0x38 -> IRQ 8 Mode:0 =
Active:0 Dest:1)
> [    0.276180] IOAPIC[0]: Set routing entry (0-9 -> 0x39 -> IRQ 9 Mode:1 =
Active:0 Dest:1)
> [    0.276891] IOAPIC[0]: Set routing entry (0-10 -> 0x3a -> IRQ 10 Mode:=
1 Active:0 Dest:1)
> [    0.277609] IOAPIC[0]: Set routing entry (0-11 -> 0x3b -> IRQ 11 Mode:=
1 Active:0 Dest:1)
> [    0.278340] IOAPIC[0]: Set routing entry (0-12 -> 0x3c -> IRQ 12 Mode:=
0 Active:0 Dest:1)
> [    0.279081] IOAPIC[0]: Set routing entry (0-13 -> 0x3d -> IRQ 13 Mode:=
0 Active:0 Dest:1)
> [    0.279795] IOAPIC[0]: Set routing entry (0-14 -> 0x3e -> IRQ 14 Mode:=
0 Active:0 Dest:1)
> [    0.280527] IOAPIC[0]: Set routing entry (0-15 -> 0x3f -> IRQ 15 Mode:=
0 Active:0 Dest:1)
> [    0.281234]  apic 0 pin 16 not connected
> [    0.281582]  apic 0 pin 17 not connected
> [    0.281924]  apic 0 pin 18 not connected
> [    0.282319]  apic 0 pin 19 not connected
> [    0.282667]  apic 0 pin 20 not connected
> [    0.283017]  apic 0 pin 21 not connected
> [    0.283362]  apic 0 pin 22 not connected
> [    0.283713]  apic 0 pin 23 not connected
> [    0.284211] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=
=3D-1
> [    0.284916] Using local APIC timer interrupts.
> [    0.284916] calibrating APIC timer ...
> [    0.402003] ... lapic delta =3D 6250663
> [    0.402474] ... PM-Timer delta =3D 357886
> [    0.402957] ... PM-Timer result ok
> [    0.403380] ..... delta 6250663
> [    0.403740] ..... mult: 268463931
> [    0.404123] ..... calibration result: 10001060
> [    0.404661] ..... CPU clock speed is 2693.1336 MHz.
> [    0.405227] ..... host bus clock speed is 1000.1060 MHz.
> [    0.406865] devtmpfs: initialized
> [    0.411065] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 19112604462750000 ns
> [    0.412668] prandom: seed boundary self test passed
> [    0.413645] prandom: 100 self tests passed
> [    0.414143] pinctrl core: initialized pinctrl subsystem
> [    0.416603] regulator-dummy: no parameters
> [    0.418294] NET: Registered protocol family 16
> [    0.421623] cpuidle: using governor ladder
> [    0.423151] ACPI: bus type PCI registered
> [    0.423868] dca service started, version 1.12.1
> [    0.424596] PCI: Using configuration type 1 for base access
> [    0.524334] ACPI: Added _OSI(Module Device)
> [    0.524826] ACPI: Added _OSI(Processor Device)
> [    0.525318] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.525824] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.547967] ACPI: Interpreter enabled
> [    0.548431] ACPI: (supports S0 S5)
> [    0.548847] ACPI: Using IOAPIC for interrupt routing
> [    0.549701] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.644420] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
> [    0.645155] acpi PNP0A03:00: _OSC: OS supports [Segments MSI]
> [    0.645950] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
> [    0.648539] acpi PNP0A03:00: fail to add MMCONFIG information, can't a=
ccess extended PCI configuration space under this bridge.
> [    0.650767] PCI host bridge to bus 0000:00
> [    0.651229] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    0.651817] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    0.652538] pci_bus 0000:00: root bus resource [io  0x0d00-0xadff wind=
ow]
> [    0.653273] pci_bus 0000:00: root bus resource [io  0xae0f-0xaeff wind=
ow]
> [    0.653998] pci_bus 0000:00: root bus resource [io  0xaf20-0xafdf wind=
ow]
> [    0.654714] pci_bus 0000:00: root bus resource [io  0xafe4-0xffff wind=
ow]
> [    0.655445] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bf=
fff window]
> [    0.656273] pci_bus 0000:00: root bus resource [mem 0x12c00000-0xfebff=
fff window]
> [    0.657171] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
> [    0.661005] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
> [    0.664758] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
> [    0.676887] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
> [    0.681889] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-=
0x01f7]
> [    0.682783] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
> [    0.683552] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-=
0x0177]
> [    0.684313] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
> [    0.687564] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
> [    0.688596] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PI=
IX4 ACPI
> [    0.689376] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PI=
IX4 SMB
> [    0.692852] pci 0000:00:02.0: [1013:00b8] type 00 class 0x030000
> [    0.698083] pci 0000:00:02.0: reg 0x10: [mem 0xfc000000-0xfdffffff pre=
f]
> [    0.703207] pci 0000:00:02.0: reg 0x14: [mem 0xfebf0000-0xfebf0fff]
> [    0.725568] pci 0000:00:02.0: reg 0x30: [mem 0xfebe0000-0xfebeffff pre=
f]
> [    0.729158] pci 0000:00:03.0: [8086:100e] type 00 class 0x020000
> [    0.734081] pci 0000:00:03.0: reg 0x10: [mem 0xfebc0000-0xfebdffff]
> [    0.739003] pci 0000:00:03.0: reg 0x14: [io  0xc000-0xc03f]
> [    0.760653] pci 0000:00:03.0: reg 0x30: [mem 0xfeb80000-0xfebbffff pre=
f]
> [    0.764196] pci 0000:00:04.0: [1af4:1001] type 00 class 0x010000
> [    0.769257] pci 0000:00:04.0: reg 0x10: [io  0xc040-0xc07f]
> [    0.774130] pci 0000:00:04.0: reg 0x14: [mem 0xfebf1000-0xfebf1fff]
> [    0.798838] pci 0000:00:05.0: [1af4:1001] type 00 class 0x010000
> [    0.803965] pci 0000:00:05.0: reg 0x10: [io  0xc080-0xc0bf]
> [    0.808949] pci 0000:00:05.0: reg 0x14: [mem 0xfebf2000-0xfebf2fff]
> [    0.833845] pci 0000:00:06.0: [1af4:1001] type 00 class 0x010000
> [    0.839025] pci 0000:00:06.0: reg 0x10: [io  0xc0c0-0xc0ff]
> [    0.843996] pci 0000:00:06.0: reg 0x14: [mem 0xfebf3000-0xfebf3fff]
> [    0.868799] pci 0000:00:07.0: [1af4:1001] type 00 class 0x010000
> [    0.873941] pci 0000:00:07.0: reg 0x10: [io  0xc100-0xc13f]
> [    0.878899] pci 0000:00:07.0: reg 0x14: [mem 0xfebf4000-0xfebf4fff]
> [    0.904057] pci 0000:00:08.0: [1af4:1001] type 00 class 0x010000
> [    0.909384] pci 0000:00:08.0: reg 0x10: [io  0xc140-0xc17f]
> [    0.914369] pci 0000:00:08.0: reg 0x14: [mem 0xfebf5000-0xfebf5fff]
> [    0.940075] pci 0000:00:09.0: [1af4:1001] type 00 class 0x010000
> [    0.945447] pci 0000:00:09.0: reg 0x10: [io  0xc180-0xc1bf]
> [    0.950448] pci 0000:00:09.0: reg 0x14: [mem 0xfebf6000-0xfebf6fff]
> [    0.975718] pci 0000:00:0a.0: [1af4:1001] type 00 class 0x010000
> [    0.980998] pci 0000:00:0a.0: reg 0x10: [io  0xc1c0-0xc1ff]
> [    0.985995] pci 0000:00:0a.0: reg 0x14: [mem 0xfebf7000-0xfebf7fff]
> [    1.011032] pci 0000:00:0b.0: [8086:25ab] type 00 class 0x088000
> [    1.013974] pci 0000:00:0b.0: reg 0x10: [mem 0xfebf8000-0xfebf800f]
> [    1.030349] pci_bus 0000:00: on NUMA node 0
> [    1.039283] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
> [    1.041919] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
> [    1.044535] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
> [    1.047173] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
> [    1.048615] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
> [    1.055130] ACPI: Enabled 16 GPEs in block 00 to 0F
> [    1.059654] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    1.060298] vgaarb: device added: PCI:0000:00:02.0,decodes=3Dio+mem,ow=
ns=3Dio+mem,locks=3Dnone
> [    1.061174] vgaarb: loaded
> [    1.061476] vgaarb: bridge control possible 0000:00:02.0
> [    1.066957] wmi: Mapper loaded
> [    1.067845] Advanced Linux Sound Architecture Driver Initialized.
> [    1.068880] PCI: Using ACPI for IRQ routing
> [    1.069353] PCI: pci_cache_line_size set to 64 bytes
> [    1.070092] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
> [    1.070775] e820: reserve RAM buffer [mem 0x12be0000-0x13ffffff]
> [    1.074257] HPET: 3 timers in total, 0 timers will be used for per-cpu=
 timer
> [    1.075065] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
> [    1.075675] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
> [    1.081841] clocksource: Switched to clocksource kvm-clock
> [    1.084013] Warning: could not register all branches stats
> [    1.084659] Warning: could not register annotated branches stats
> [    1.180238] FS-Cache: Loaded
> [    1.180848] pnp: PnP ACPI init
> [    1.182186] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    1.183620] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
> [    1.185034] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
> [    1.186337] pnp 00:03: [dma 2]
> [    1.187126] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
> [    1.188867] pnp 00:04: Plug and Play ACPI device, IDs PNP0400 (active)
> [    1.190585] pnp 00:05: Plug and Play ACPI device, IDs PNP0501 (active)
> [    1.196655] pnp: PnP ACPI: found 6 devices
> [    1.208047] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    1.209650] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    1.210335] pci_bus 0000:00: resource 5 [io  0x0d00-0xadff window]
> [    1.211015] pci_bus 0000:00: resource 6 [io  0xae0f-0xaeff window]
> [    1.211691] pci_bus 0000:00: resource 7 [io  0xaf20-0xafdf window]
> [    1.212391] pci_bus 0000:00: resource 8 [io  0xafe4-0xffff window]
> [    1.213062] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff win=
dow]
> [    1.213791] pci_bus 0000:00: resource 10 [mem 0x12c00000-0xfebfffff wi=
ndow]
> [    1.214695] NET: Registered protocol family 1
> [    1.215247] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
> [    1.215901] pci 0000:00:01.0: PIIX3: Enabling Passive Release
> [    1.216552] pci 0000:00:01.0: Activating ISA DMA hang workarounds
> [    1.217274] pci 0000:00:02.0: Video device with shadowed ROM
> [    1.217991] PCI: CLS 0 bytes, default 64
> [    1.219033] Unpacking initramfs...
> [    2.291024] debug: unmapping init [mem 0xffff880011525000-0xffff880012=
bd7fff]
> [    2.293263] microcode: no support for this CPU vendor
> [    2.298919] sha1_ssse3: Neither AVX nor AVX2 nor SSSE3 is available/us=
able.
> [    2.299716] sha256_ssse3: Neither AVX nor SSSE3 is available/usable.
> [    2.300432] CPU feature 'AVX registers' is not supported.
> [    2.301032] CPU feature 'AVX registers' is not supported.
> [    2.301624] CPU feature 'AVX registers' is not supported.
> [    2.302293] CPU feature 'AVX registers' is not supported.
> [    2.302892] CPU feature 'AVX registers' is not supported.
> [    2.305987] futex hash table entries: 16 (order: -2, 1280 bytes)
> [    2.308343] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    2.359079] zpool: loaded
> [    2.359408] zbud: loaded
> [    2.362694] VFS: Disk quotas dquot_6.6.0
> [    2.363854] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    2.374151] romfs: ROMFS MTD (C) 2007 Red Hat, Inc.
> [    2.375810] fuse init (API version 7.23)
> [    2.378554] Key type big_key registered
> [    2.388170] Key type asymmetric registered
> [    2.388648] test_string_helpers: Running tests...
> [    2.392468] test_hexdump: Running tests...
> [    2.393471] test_firmware: interface ready
> [    2.394011] rbtree testing -> 13802 cycles
> [    2.959570] augmented rbtree testing -> 20984 cycles
> [    3.812689] tsc: Refined TSC clocksource calibration: 2693.505 MHz
> [    3.813376] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
6d346f670a, max_idle_ns: 440795255135 ns
> [    3.820358] VIA Graphics Integration Chipset framebuffer 2.4 initializ=
ing
> [    3.822440] no IO addresses supplied
> [    3.823478] hgafb: HGA card not detected.
> [    3.823945] hgafb: probe of hgafb.0 failed with error -22
> [    3.824969] cirrusfb 0000:00:02.0: Cirrus Logic chipset on PCI bus, RA=
M (4096 kB) at 0xfc000000
> [    3.829384] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input0
> [    3.830228] ACPI: Power Button [PWRF]
> [    3.832492] ioatdma: Intel(R) QuickData Technology Driver 4.00
> [    3.835607] xenfs: not registering filesystem on non-xen platform
> [    4.022793] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    4.046816] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200=
) is a 16550A
> [    4.053043] lp: driver loaded but no devices found
> [    4.053590] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:57 dwmw=
2 Exp $
> [    4.054362] ac.o: No PCI boards found.
> [    4.054769] ac.o: For an ISA board you must supply memory and irq para=
meters.
> [    4.056720] Non-volatile memory driver v1.3
> [    4.057960] Linux agpgart interface v0.103
> [    4.059787] Hangcheck: starting hangcheck timer 0.9.1 (tick is 180 sec=
onds, margin is 60 seconds).
> [    4.062065] [drm] Initialized drm 1.1.0 20060810
> [    4.062924] [drm] amdgpu kernel modesetting enabled.
> [    4.066912] parport_pc 00:04: reported by Plug and Play ACPI
> [    4.067981] parport0: PC-style at 0x378, irq 7 [PCSPP(,...)]
> [    4.069664] lp0: using parport0 (interrupt-driven).
> [    4.074133] ibmasm: IBM ASM Service Processor Driver version 1.0 loaded
> [    4.075121] dummy-irq: no IRQ given.  Use irq=3DN
> [    4.077401] Silicon Labs C2 port support v. 0.51.0 - (C) 2007 Rodolfo =
Giometti
> [    4.083290] mtdoops: mtd device (mtddev=3Dname/number) must be supplied
> [    4.084086] device id =3D 2440
> [    4.084412] device id =3D 2480
> [    4.084729] device id =3D 24c0
> [    4.085055] device id =3D 24d0
> [    4.085373] device id =3D 25a1
> [    4.085687] device id =3D 2670
> [    4.086208] SBC-GXx flash: IO:0x258-0x259 MEM:0xdc000-0xdffff
> [    4.087336] Ramix PMC551 PCI Mezzanine Ram Driver. (C) 1999,2000 Norte=
l Networks.
> [    4.088146] pmc551: not detected
> [    4.116336] No valid DiskOnChip devices found
> [    4.117733] parport0: powerup/reset Butterfly
> [    4.242614] parport_pc 00:04: registered master spi42
> [    4.244156] spi spi42.1: spi_bitbang_setup, 66 nsec/bit
> [    4.245233] spi spi42.1: setup mode 0, 8 bits/w, 15000000 Hz max --> 0
> [    4.247128] parport_pc 00:04: registered child spi42.1
> [    4.248148] parport0: dataflash at spi42.1
> [    4.248951] parport0: AVR Butterfly
> [    4.250633] parport0: cannot grant exclusive access for device spi-lm7=
0llp
> [    4.252028] spi-lm70llp: spi_lm70llp probe fail, status -12
> [    4.254514] HSI/SSI char device loaded
> [    4.259467] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0=
x60,0x64 irq 1,12
> [    4.262936] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    4.264019] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    4.266570] parport0: cannot grant exclusive access for device parkbd
> [    4.268667] hv_vmbus: registering driver hyperv_keyboard
> [    4.337767] mousedev: PS/2 mouse device common for all mice
> [    4.339041] evbug: Connected device: input0 (Power Button at LNXPWRBN/=
button/input0)
> [    4.342070] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input1
> [    4.351963] evbug: Connected device: input1 (AT Translated Set 2 keybo=
ard at isa0060/serio0/input0)
> [    4.353336] rtc rtc0: invalid alarm value: 1900-1-27 2022213768:107374=
1856:0
> [    4.354904] rtc-test rtc-test.0: rtc core: registered test as rtc0
> [    4.356071] rtc rtc1: invalid alarm value: 1900-1-27 2022213768:107374=
1856:0
> [    4.357351] rtc-test rtc-test.1: rtc core: registered test as rtc1
> [    4.358690] i2c /dev entries driver
> [    4.360137] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, =
revision 0
> [    4.623517] Driver for 1-wire Dallas network protocol.
> [    4.624869] 1-Wire driver for the DS2760 battery monitor chip - (c) 20=
04-2005, Szabolcs Gyurko
> [    7.662338] pc87360: PC8736x not detected, module not inserted
> [    7.964407] alim7101_wdt: Steve Hill <steve@navaho.co.uk>
> [    7.965486] alim7101_wdt: ALi M7101 PMU not present - WDT not set
> [    7.966780] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver v0.05
> [    7.969118] ib700wdt: WDT driver for IB700 single board computer initi=
alising
> [    7.972592] i6300esb: Intel 6300ESB WatchDog Timer Driver v0.05
> [    7.974019] i6300esb: cannot register miscdev on minor=3D130 (err=3D-1=
6)
> [    7.975334] i6300ESB timer: probe of 0000:00:0b.0 failed with error -16
> [    7.976822] iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
> [    7.978282] it87_wdt: no device
> [    7.979146] pc87413_wdt: Version 1.1 at io 0x2E
> [    7.980054] pc87413_wdt: cannot register miscdev on minor=3D130 (err=
=3D-16)
> [    7.981340] nv_tco: NV TCO WatchDog Timer Driver v0.01
> [    7.983431] sbc60xxwdt: I/O address 0x0443 already in use
> [    7.984666] machzwd: MachZ ZF-Logic Watchdog driver initializing
> [    7.985830] machzwd: no ZF-Logic found
> [    7.986596] sbc_epx_c3: cannot register miscdev on minor=3D130 (err=3D=
-16)
> [    7.989752] wbsd: Winbond W83L51xD SD/MMC card interface driver
> [    7.990900] wbsd: Copyright(c) Pierre Ossman
> [    8.014703] dcdbas dcdbas: Dell Systems Management Base Driver (versio=
n 5.6.0-3.2)
> [    8.029091] hidraw: raw HID events driver (C) Jiri Kosina
> [    8.033163] hv_vmbus: registering driver hid_hyperv
> [    8.041742] panel: could not claim access to parport0. Aborting.
> [    8.043371] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> [    8.045047] BUG kmalloc-16 (Not tainted): Object already free
> [    8.046216] ----------------------------------------------------------=
-------------------
> [    8.046216] =

> [    8.048066] Disabling lock debugging due to kernel taint
> [    8.049127] INFO: Allocated in parport_register_dev_model+0x117/0x490 =
age=3D1 cpu=3D0 pid=3D1
> [    8.060317] INFO: Freed in parport_unregister_device+0x1a5/0x2d0 age=
=3D0 cpu=3D0 pid=3D1
> [    8.070909] INFO: Slab 0xffffea0000004500 objects=3D23 used=3D19 fp=3D=
0xffff880000115178 flags=3D0x4081
> [    8.072591] INFO: Object 0xffff880000115178 @offset=3D4472 fp=3D0xffff=
880000114d70
> [    8.072591] =

> [    8.074266] Bytes b4 ffff880000115168: 00 00 00 00 00 00 00 00 5a 5a 5=
a 5a 5a 5a 5a 5a  ........ZZZZZZZZ
> [    8.076100] Object ffff880000115178: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b =
6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
> [    8.077883] Redzone ffff880000115188: bb bb bb bb bb bb bb bb         =
                 ........
> [    8.079558] Padding ffff8800001152c8: 5a 5a 5a 5a 5a 5a 5a 5a         =
                 ZZZZZZZZ
> [    8.081225] CPU: 0 PID: 1 Comm: swapper Tainted: G    B           4.2.=
0-rc3-00002-g23c4059 #1
> [    8.082846]  ffff880000115178 ffff880010e03ac8 ffffffff81fa8b17 ffff88=
0010e03b08
> [    8.084398]  ffffffff8123e8ce 0000000000000008 0000000000000001 ffff88=
0010c03b00
> [    8.085949]  ffff880000115178 ffff880010c00380 ffffea0000004500 ffff88=
0010e03b58
> [    8.087488] Call Trace:
> [    8.087984]  [<ffffffff81fa8b17>] dump_stack+0x19/0x1b
> [    8.088975]  [<ffffffff8123e8ce>] print_trailer+0x1ae/0x250
> [    8.090087]  [<ffffffff81241a09>] free_debug_processing+0x329/0x3d0
> [    8.091356]  [<ffffffff819bfad6>] ? free_pardevice+0x26/0x40
> [    8.092492]  [<ffffffff81241d4c>] __slab_free+0x29c/0x4c0
> [    8.093578]  [<ffffffff8112fd01>] ? mark_held_locks+0x11/0x90
> [    8.094704]  [<ffffffff8112fd59>] ? mark_held_locks+0x69/0x90
> [    8.095846]  [<ffffffff8124628f>] ? kfree+0x3df/0x580
> [    8.096817]  [<ffffffff812463a6>] kfree+0x4f6/0x580
> [    8.097778]  [<ffffffff819bfad6>] ? free_pardevice+0x26/0x40
> [    8.098915]  [<ffffffff819bfad6>] free_pardevice+0x26/0x40
> [    8.100090]  [<ffffffff819c714f>] device_release+0x7f/0x100
> [    8.101213]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.102283]  [<ffffffff813f5c1d>] kobject_release+0x9d/0x110
> [    8.103411]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.104464]  [<ffffffff813f5aa2>] kobject_put+0xc2/0xd0
> [    8.105465]  [<ffffffff819c81d0>] put_device+0x30/0x40
> [    8.106454]  [<ffffffff819c9295>] device_unregister+0x35/0x40
> [    8.107549]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.108561]  [<ffffffff819c18f4>] parport_unregister_device+0x234/0x2d0
> [    8.109862]  [<ffffffff819bf990>] ? driver_detach+0x40/0x40
> [    8.110942]  [<ffffffff81c79a5d>] panel_attach+0x27d/0xf00
> [    8.111929]  [<ffffffff819bf990>] ? driver_detach+0x40/0x40
> [    8.112942]  [<ffffffff832d0c1c>] ? staging_init+0x8/0x8
> [    8.113906]  [<ffffffff819bf9c5>] port_check+0x35/0x40
> [    8.114834]  [<ffffffff819cb60f>] bus_for_each_dev+0x7f/0xc0
> [    8.116060]  [<ffffffff819bfd6d>] __parport_register_driver+0x13d/0x140
> [    8.117309]  [<ffffffff832d0ed3>] panel_init_module+0x2b7/0x33c
> [    8.118434]  [<ffffffff83269451>] do_one_initcall+0x14b/0x254
> [    8.119523]  [<ffffffff8110dd66>] ? parse_args+0x3a6/0x520
> [    8.120559]  [<ffffffff83269763>] kernel_init_freeable+0x209/0x2ce
> [    8.121722]  [<ffffffff81f9ec20>] ? rest_init+0x160/0x160
> [    8.122743]  [<ffffffff81f9ec2e>] kernel_init+0xe/0x160
> [    8.123735]  [<ffffffff81fc060f>] ret_from_fork+0x3f/0x70
> [    8.124753]  [<ffffffff81f9ec20>] ? rest_init+0x160/0x160
> [    8.125805] FIX kmalloc-16: Object at 0xffff880000115178 not freed
> [    8.127013] panel: driver version 0.9.5 not yet registered
> [    8.134972] ashmem: initialized
> [    8.135963] FPGA DOWNLOAD --->
> [    8.136565] FPGA image file name: xlinx_fpga_firmware.bit
> [    8.138197] GPIO INIT FAIL!!
> [    8.141118] dell_wmi_aio: No known WMI GUID found
> [    8.142282] acerhdf: error getting hardware information
> [    8.143316] Initializing HPQ6001 module
> [    8.144295] hdaps: supported laptop not found!
> [    8.145848] hdaps: driver init failed (ret=3D-19)!
> [    8.147023] msi_wmi: This machine doesn't have neither MSI-hotkeys nor=
 backlight through WMI
> [    8.150256] alienware_wmi: alienware-wmi: No known WMI GUID found
> [    8.151802] cros_ec_lpc: unsupported system.
> [    8.168359] Intel(R) PCI-E Non-Transparent Bridge Driver 2.0
> [    8.169959] Software Queue-Pair Transport over NTB, version 4
> [    8.171700]  fake-fmc-carrier: mezzanine 0
> [    8.172196]       Manufacturer: fake-vendor
> [    8.172656]       Product name: fake-design-for-testing
> [    8.173529] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    8.174382] fmc_write_eeprom fake-design-for-testing-f001: fmc_write_e=
eprom: no busid passed, refusing all cards
> [    8.175605] fmc fake-design-for-testing-f001: Driver has no ID: matche=
s all
> [    8.176868] fmc_chardev fake-design-for-testing-f001: Created misc dev=
ice "fake-design-for-testing-f001"
> [    8.180125] MediaTrix audio driver Copyright (C) by Hannu Savolainen 1=
993-1996
> [    8.180906] I/O, IRQ, DMA and type are mandatory
> [    8.181422] ad1848/cs4248 codec driver Copyright (C) by Hannu Savolain=
en 1993-1996
> [    8.182254] ad1848: No ISAPnP cards found, trying standard ones...
> [    8.182941] Pro Audio Spectrum driver Copyright (C) by Hannu Savolaine=
n 1993-1996
> [    8.183749] I/O, IRQ, DMA and type are mandatory
> [    8.184261] sb: Init: Starting Probe...
> [    8.184794] sb: Init: Done
> [    8.186687] MTVAP port 0x378 is busy
> [    8.187421] snd_mtpav: probe of snd_mtpav failed with error -16
> [    8.188836] snd_mts64: probe of snd_mts64.0 failed with error -5
> [    8.192233] ASIHPI driver 4.14.03
> [    8.199451] ... APIC ID:      00000000 (0)
> [    8.199905] ... APIC VERSION: 01050014
> [    8.200323] 0000000000000000000000000000000000000000000000000000000000=
000000
> [    8.201225] 0000000002000000000000000000000000000000000000000000000000=
000000
> [    8.202124] 0000000000000000000000000000000000000000000000000000000000=
008000
> [    8.203029] =

> [    8.203213] number of MP IRQ sources: 15.
> [    8.203653] number of IO-APIC #0 registers: 24.
> [    8.204145] testing the IO APIC.......................
> [    8.204716] IO APIC #0......
> [    8.205046] .... register #00: 00000000
> [    8.205463] .......    : physical APIC id: 00
> [    8.205935] .......    : Delivery Type: 0
> [    8.206376] .......    : LTS          : 0
> [    8.206807] .... register #01: 00170011
> [    8.207232] .......     : max redirection entries: 17
> [    8.207778] .......     : PRQ implemented: 0
> [    8.208248] .......     : IO APIC version: 11
> [    8.208721] .... register #02: 00000000
> [    8.209144] .......     : arbitration: 00
> [    8.209578] .... IRQ redirection table:
> [    8.210001] IOAPIC 0:
> [    8.210264]  pin00, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.211116]  pin01, enabled , edge , high, V(31), IRR(0), S(0), logica=
l , D(01), M(1)
> [    8.211979]  pin02, enabled , edge , high, V(30), IRR(0), S(0), logica=
l , D(01), M(1)
> [    8.212827]  pin03, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.213676]  pin04, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.214524]  pin05, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.215374]  pin06, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.216217]  pin07, enabled , edge , high, V(37), IRR(0), S(0), logica=
l , D(01), M(1)
> [    8.217066]  pin08, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.217906]  pin09, enabled , level, high, V(39), IRR(0), S(0), logica=
l , D(01), M(1)
> [    8.218754]  pin0a, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.219602]  pin0b, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.220450]  pin0c, enabled , edge , high, V(3C), IRR(0), S(0), logica=
l , D(01), M(1)
> [    8.221300]  pin0d, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.222160]  pin0e, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.223009]  pin0f, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.223846]  pin10, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.224691]  pin11, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.225538]  pin12, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.226384]  pin13, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.227231]  pin14, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.228082]  pin15, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.228922]  pin16, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.229766]  pin17, disabled, edge , high, V(00), IRR(0), S(0), physic=
al, D(00), M(0)
> [    8.230608] IRQ to pin mappings:
> [    8.230963] IRQ0 -> 0:2
> [    8.231273] IRQ1 -> 0:1
> [    8.231579] IRQ3 -> 0:3
> [    8.231898] IRQ4 -> 0:4
> [    8.232210] IRQ5 -> 0:5
> [    8.232514] IRQ6 -> 0:6
> [    8.232818] IRQ7 -> 0:7
> [    8.233133] IRQ8 -> 0:8
> [    8.233437] IRQ9 -> 0:9
> [    8.233743] IRQ10 -> 0:10
> [    8.234074] IRQ11 -> 0:11
> [    8.234397] IRQ12 -> 0:12
> [    8.234719] IRQ13 -> 0:13
> [    8.235049] IRQ14 -> 0:14
> [    8.235373] IRQ15 -> 0:15
> [    8.235697] .................................... done.
> [    8.238037] page_owner is disabled
> [    8.239605] Key type trusted registered
> [    8.247350] RIO: rio_register_scan for mport_id=3D-1
> [    8.250201] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> [    8.250863] EDD information not available.
> [    8.252054] ALSA device list:
> [    8.252393]   No soundcards found.
> [    8.253408] debug: unmapping init [mem 0xffffffff83268000-0xffffffff83=
3bdfff]
> [    8.254265] Write protecting the kernel read-only data: 26624k
> [    8.255660] debug: unmapping init [mem 0xffff880001fc4000-0xffff880001=
ffffff]
> [    8.256469] debug: unmapping init [mem 0xffff8800028d7000-0xffff880002=
9fffff]
> [    8.266339] random: init urandom read with 3 bits of entropy available
> [    8.402456] init: Failed to create pty - disabling logging for job
> [    8.403284] init: Temporary process spawn error: No space left on devi=
ce
> udevd[203]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYSTM:': No such file or directory
> udevd[210]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00001237sv00001AF4sd00001100bc06sc00i00': No such file or directory
> udevd[211]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYBUS:': No such file or directory
> udevd[212]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXSYBUS:': No such file or directory
> udevd[214]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv input:=
b0019v0000p0001e0000-e0,1,k74,ramlsfw': No such file or directory
> udevd[215]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00007000sv00001AF4sd00001100bc06sc01i00': No such file or directory
> udevd[216]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d00007010sv00001AF4sd00001100bc01sc01i80': No such file or directory
> udevd[217]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXCPU:': No such file or directory
> udevd[218]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:L=
NXCPU:': No such file or directory
> udevd[219]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0103:': No such file or directory
> udevd[220]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A03:': No such file or directory
> udevd[221]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A06:': No such file or directory
> udevd[227]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[228]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[229]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[230]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[231]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0C0F:': No such file or directory
> udevd[233]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0A06:': No such file or directory
> udevd[260]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:A=
PP0001:': No such file or directory
> udevd[261]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0303:': No such file or directory
> udevd[262]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0400:': No such file or directory
> udevd[263]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0501:': No such file or directory
> udevd[264]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0501:': No such file or directory
> udevd[265]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0700:': No such file or directory
> udevd[267]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0F13:': No such file or directory
> udevd[266]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0B00:': No such file or directory
> udevd[268]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:Q=
EMU0001:': No such file or directory
> udevd[269]: failed to execute '/sbin/modprobe' '/sbin/modprobe -q fbcon':=
 No such file or directory
> udevd[270]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d0000100Esv00001AF4sd00001100bc02sc00i00': No such file or directory
> udevd[274]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[275]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[271]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[272]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[273]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[276]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[277]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0001AF4d00001001sv00001AF4sd00000002bc01sc00i00': No such file or directory
> udevd[278]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv pci:v0=
0008086d000025ABsv00001AF4sd00001100bc08sc80i00': No such file or directory
> udevd[280]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv acpi:P=
NP0103:': No such file or directory
> udevd[281]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:SP5100 TCO timer': No such file or directory
> udevd[282]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:dell_rbu': No such file or directory
> udevd[279]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:NV_TCO': No such file or directory
> udevd[284]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:i5k_amb': No such file or directory
> udevd[283]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:hgafb': No such file or directory
> udevd[288]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:pcspkr': No such file or directory
> udevd[286]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv input:=
b0011v0001p0001eAB41-e0,1,4,11,14,k71,72,73,74,75,76,77,79,7A,7B,7C,7D,7E,7=
F,80,8C,8E,8F,9B,9C,9D,9E,9F,A3,A4,A5,A6,AC,AD,B7,B8,B9,D9,E2,ram4,l0,1,2,s=
fw': No such file or directory
> udevd[287]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv serio:=
ty01pr00id00ex00': No such file or directory
> udevd[289]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv platfo=
rm:platform-framebuffer': No such file or directory
> udevd[290]: failed to execute '/sbin/modprobe' '/sbin/modprobe -bv spi:mt=
d_dataflash': No such file or directory
> Kernel tests: Boot OK!
> Kernel tests: Boot OK!
> Trinity v1.4pre  Dave Jones <davej@redhat.com>
> [init] Marking syscall get_robust_list (64bit:274 32bit:312) as to be dis=
abled.
> Done parsing arguments.
> Marking all syscalls as enabled.
> [init] Disabling syscalls marked as disabled by command line options
> [init] Marked 64-bit syscall get_robust_list (274) as deactivated.
> [init] Marked 32-bit syscall get_robust_list (312) as deactivated.
> [init] 32-bit syscalls: 350 enabled, 1 disabled.  64-bit syscalls: 313 en=
abled, 1 disabled.
> DANGER: RUNNING AS ROOT.
> Unless you are running in a virtual machine, this could cause serious pro=
blems such as overwriting CMOS
> or similar which could potentially make this machine unbootable without a=
 firmware reset.
> =

> ctrl-c now unless you really know what you are doing.
> =

> Elapsed time: 20
> qemu-system-x86_64 -enable-kvm -cpu kvm64 -kernel /pkg/linux/x86_64-randc=
onfig-b0-07262114/gcc-4.9/23c405912b881e3ca516554efde852c2ad550b31/vmlinuz-=
4.2.0-rc3-00002-g23c4059 -append 'hung_task_panic=3D1 earlyprintk=3DttyS0,1=
15200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupd=
ate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdo=
g=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,=
115200 console=3Dtty0 vga=3Dnormal  root=3D/dev/ram0 rw link=3D/kbuild-test=
s/run-queue/kvm/x86_64-randconfig-b0-07262114/linux-devel:devel-spot-201507=
260856:23c405912b881e3ca516554efde852c2ad550b31:bisect-linux-8/.vmlinuz-23c=
405912b881e3ca516554efde852c2ad550b31-20150727002602-12-ivb41 branch=3Dlinu=
x-devel/devel-spot-201507260856 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-b=
0-07262114/gcc-4.9/23c405912b881e3ca516554efde852c2ad550b31/vmlinuz-4.2.0-r=
c3-00002-g23c4059 drbd.minor_count=3D8'  -initrd /osimage/quantal/quantal-c=
ore-x86_64.cgz -m 300 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=3D=
net0 -boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -=
drive file=3D/fs/sda5/disk0-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -driv=
e file=3D/fs/sda5/disk1-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -drive fi=
le=3D/fs/sda5/disk2-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -drive file=
=3D/fs/sda5/disk3-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -drive file=3D/=
fs/sda5/disk4-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/s=
da5/disk5-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -drive file=3D/fs/sda5/=
disk6-quantal-ivb41-13,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid=
-quantal-ivb41-13 -serial file:/dev/shm/kboot/serial-quantal-ivb41-13 -daem=
onize -display none -monitor null =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 4.2.0-rc3 Kernel Configuration
> #
> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_ARCH_DEFCONFIG=3D"arch/x86/configs/x86_64_defconfig"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_HAVE_LATENCYTOP_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
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
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_ARCH_SUPPORTS_OPTIMIZED_INLINING=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HWEIGHT_CFLAGS=3D"-fcall-saved-rdi -fcall-saved-rsi -fcall-sa=
ved-rdx -fcall-saved-rcx -fcall-saved-r8 -fcall-saved-r9 -fcall-saved-r10 -=
fcall-saved-r11"
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D4
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
> # CONFIG_KERNEL_GZIP is not set
> CONFIG_KERNEL_BZIP2=3Dy
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
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
> CONFIG_GENERIC_IRQ_CHIP=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_IRQ_DOMAIN_DEBUG is not set
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_DATA=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_HZ_PERIODIC=3Dy
> # CONFIG_NO_HZ_IDLE is not set
> # CONFIG_NO_HZ is not set
> CONFIG_HIGH_RES_TIMERS=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=3Dy
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> # CONFIG_IRQ_TIME_ACCOUNTING is not set
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> # CONFIG_TASKSTATS is not set
> =

> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=3Dy
> CONFIG_RCU_EXPERT=3Dy
> CONFIG_SRCU=3Dy
> # CONFIG_TASKS_RCU is not set
> CONFIG_RCU_STALL_COMMON=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> CONFIG_RCU_KTHREAD_PRIO=3D0
> # CONFIG_RCU_EXPEDITE_BOOT is not set
> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> CONFIG_LOG_BUF_SHIFT=3D17
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_CGROUP_DEBUG=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> # CONFIG_CGROUP_DEVICE is not set
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_MEMCG is not set
> # CONFIG_CGROUP_HUGETLB is not set
> # CONFIG_CGROUP_PERF is not set
> CONFIG_CGROUP_SCHED=3Dy
> # CONFIG_FAIR_GROUP_SCHED is not set
> # CONFIG_RT_GROUP_SCHED is not set
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
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
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_SYSCTL=3Dy
> CONFIG_ANON_INODES=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> CONFIG_EXPERT=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> # CONFIG_SYSCTL_SYSCALL is not set
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> # CONFIG_ELF_CORE is not set
> CONFIG_PCSPKR_PLATFORM=3Dy
> # CONFIG_BASE_FULL is not set
> CONFIG_FUTEX=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> # CONFIG_BPF_SYSCALL is not set
> CONFIG_SHMEM=3Dy
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
> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> # CONFIG_SLOB is not set
> # CONFIG_SYSTEM_TRUSTED_KEYRING is not set
> # CONFIG_PROFILING is not set
> CONFIG_TRACEPOINTS=3Dy
> CONFIG_HAVE_OPROFILE=3Dy
> CONFIG_OPROFILE_NMI_TIMER=3Dy
> # CONFIG_JUMP_LABEL is not set
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
> CONFIG_HAVE_CLK=3Dy
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
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_HAVE_CC_STACKPROTECTOR=3Dy
> # CONFIG_CC_STACKPROTECTOR is not set
> CONFIG_CC_STACKPROTECTOR_NONE=3Dy
> # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
> # CONFIG_CC_STACKPROTECTOR_STRONG is not set
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_COPY_THREAD_TLS=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
> CONFIG_SLABINFO=3Dy
> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D1
> # CONFIG_MODULES is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> # CONFIG_BLOCK is not set
> CONFIG_ASN1=3Dy
> CONFIG_UNINLINE_SPIN_UNLOCK=3Dy
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
> # CONFIG_X86_X2APIC is not set
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_X86_EXTENDED_PLATFORM is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> CONFIG_IOSF_MBI_DEBUG=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_XEN=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> CONFIG_XEN_PVH=3Dy
> CONFIG_KVM_GUEST=3Dy
> # CONFIG_KVM_DEBUG_FS is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> CONFIG_NO_BOOTMEM=3Dy
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_PROCESSOR_SELECT=3Dy
> # CONFIG_CPU_SUP_INTEL is not set
> CONFIG_CPU_SUP_AMD=3Dy
> # CONFIG_CPU_SUP_CENTAUR is not set
> CONFIG_HPET_TIMER=3Dy
> # CONFIG_DMI is not set
> CONFIG_GART_IOMMU=3Dy
> # CONFIG_CALGARY_IOMMU is not set
> CONFIG_SWIOTLB=3Dy
> CONFIG_IOMMU_HELPER=3Dy
> CONFIG_NR_CPUS=3D1
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> CONFIG_UP_LATE_INIT=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> # CONFIG_X86_MCE is not set
> # CONFIG_X86_16BIT is not set
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_I8K=3Dy
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_MICROCODE_INTEL_EARLY=3Dy
> CONFIG_MICROCODE_AMD_EARLY=3Dy
> CONFIG_MICROCODE_EARLY=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_ARCH_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_HAVE_MEMORY_PRESENT=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_ALLOC_MEM_MAP_TOGETHER=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_MEMBLOCK=3Dy
> CONFIG_HAVE_MEMBLOCK_NODE_MAP=3Dy
> CONFIG_ARCH_DISCARD_MEMBLOCK=3Dy
> # CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
> # CONFIG_MEMORY_HOTPLUG is not set
> CONFIG_PAGEFLAGS_EXTENDED=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_ZONE_DMA_FLAG=3D1
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_NEED_PER_CPU_KM=3Dy
> CONFIG_CLEANCACHE=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> CONFIG_ZSMALLOC=3Dy
> # CONFIG_PGTABLE_MAPPING is not set
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_ARCH_SUPPORTS_DEFERRED_STRUCT_PAGE_INIT=3Dy
> # CONFIG_X86_CHECK_BIOS_CORRUPTION is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> # CONFIG_MTRR_SANITIZER is not set
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> # CONFIG_EFI is not set
> # CONFIG_SECCOMP is not set
> CONFIG_HZ_100=3Dy
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D100
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> # CONFIG_KEXEC_FILE is not set
> # CONFIG_CRASH_DUMP is not set
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> # CONFIG_RANDOMIZE_BASE is not set
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> =

> #
> # Power management and ACPI options
> #
> # CONFIG_SUSPEND is not set
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_AUTOSLEEP=3Dy
> CONFIG_PM_WAKELOCKS=3Dy
> CONFIG_PM_WAKELOCKS_LIMIT=3D100
> # CONFIG_PM_WAKELOCKS_GC is not set
> CONFIG_PM=3Dy
> # CONFIG_PM_DEBUG is not set
> CONFIG_PM_CLK=3Dy
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_PROCFS_POWER is not set
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> # CONFIG_ACPI_EC_DEBUGFS is not set
> CONFIG_ACPI_AC=3Dy
> # CONFIG_ACPI_BATTERY is not set
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dy
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> # CONFIG_ACPI_PROCESSOR_AGGREGATOR is not set
> CONFIG_ACPI_THERMAL=3Dy
> # CONFIG_ACPI_CUSTOM_DSDT is not set
> # CONFIG_ACPI_INITRD_TABLE_OVERRIDE is not set
> CONFIG_ACPI_DEBUG=3Dy
> # CONFIG_ACPI_PCI_SLOT is not set
> CONFIG_X86_PM_TIMER=3Dy
> # CONFIG_ACPI_CONTAINER is not set
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dy
> # CONFIG_ACPI_HED is not set
> CONFIG_ACPI_CUSTOM_METHOD=3Dy
> # CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> # CONFIG_ACPI_APEI is not set
> # CONFIG_PMIC_OPREGION is not set
> CONFIG_SFI=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_STAT_DETAILS=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> CONFIG_X86_PCC_CPUFREQ=3Dy
> CONFIG_X86_ACPI_CPUFREQ=3Dy
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dy
> CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dy
> CONFIG_X86_SPEEDSTEP_CENTRINO=3Dy
> CONFIG_X86_P4_CLOCKMOD=3Dy
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dy
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> CONFIG_CPU_IDLE_GOV_LADDER=3Dy
> # CONFIG_CPU_IDLE_GOV_MENU is not set
> # CONFIG_ARCH_NEEDS_CPU_IDLE_COUPLED is not set
> =

> #
> # Memory power savings
> #
> CONFIG_I7300_IDLE_IOAT_CHANNEL=3Dy
> CONFIG_I7300_IDLE=3Dy
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI=3Dy
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCI_CNB20LE_QUIRK=3Dy
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCI_BUS_ADDR_T_64BIT=3Dy
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> # CONFIG_PCI_STUB is not set
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> # CONFIG_HT_IRQ is not set
> CONFIG_PCI_ATS=3Dy
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=3Dy
> CONFIG_PCI_LABEL=3Dy
> =

> #
> # PCI host controller drivers
> #
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> CONFIG_PCCARD=3Dy
> CONFIG_PCMCIA=3Dy
> # CONFIG_PCMCIA_LOAD_CIS is not set
> # CONFIG_CARDBUS is not set
> =

> #
> # PC-card bridges
> #
> CONFIG_YENTA=3Dy
> CONFIG_YENTA_O2=3Dy
> # CONFIG_YENTA_RICOH is not set
> CONFIG_YENTA_TI=3Dy
> # CONFIG_YENTA_TOSHIBA is not set
> CONFIG_PD6729=3Dy
> # CONFIG_I82092 is not set
> CONFIG_PCCARD_NONSTATIC=3Dy
> # CONFIG_HOTPLUG_PCI is not set
> CONFIG_RAPIDIO=3Dy
> CONFIG_RAPIDIO_DISC_TIMEOUT=3D30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DMA_ENGINE=3Dy
> CONFIG_RAPIDIO_DEBUG=3Dy
> CONFIG_RAPIDIO_ENUM_BASIC=3Dy
> =

> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_TSI57X=3Dy
> CONFIG_RAPIDIO_CPS_XX=3Dy
> CONFIG_RAPIDIO_TSI568=3Dy
> # CONFIG_RAPIDIO_CPS_GEN2 is not set
> # CONFIG_X86_SYSFB is not set
> =

> #
> # Executable file formats / Emulations
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> # CONFIG_HAVE_AOUT is not set
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=3Dy
> # CONFIG_IA32_EMULATION is not set
> CONFIG_X86_DEV_DMA_OPS=3Dy
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
> CONFIG_HAVE_BPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> # CONFIG_DEVTMPFS_MOUNT is not set
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> CONFIG_FW_LOADER=3Dy
> CONFIG_FIRMWARE_IN_KERNEL=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> CONFIG_FW_LOADER_USER_HELPER_FALLBACK=3Dy
> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> CONFIG_DEBUG_DEVRES=3Dy
> CONFIG_SYS_HYPERVISOR=3Dy
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
> =

> #
> # Bus devices
> #
> # CONFIG_CONNECTOR is not set
> CONFIG_MTD=3Dy
> CONFIG_MTD_REDBOOT_PARTS=3Dy
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=3D-1
> CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=3Dy
> CONFIG_MTD_REDBOOT_PARTS_READONLY=3Dy
> CONFIG_MTD_CMDLINE_PARTS=3Dy
> # CONFIG_MTD_AR7_PARTS is not set
> =

> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_OOPS=3Dy
> # CONFIG_MTD_PARTITIONED_MASTER is not set
> =

> #
> # RAM/ROM/Flash chip drivers
> #
> CONFIG_MTD_CFI=3Dy
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
> CONFIG_MTD_ROM=3Dy
> CONFIG_MTD_ABSENT=3Dy
> =

> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=3Dy
> # CONFIG_MTD_PHYSMAP is not set
> CONFIG_MTD_SBC_GXX=3Dy
> CONFIG_MTD_AMD76XROM=3Dy
> # CONFIG_MTD_ICHXROM is not set
> CONFIG_MTD_ESB2ROM=3Dy
> CONFIG_MTD_CK804XROM=3Dy
> CONFIG_MTD_SCB2_FLASH=3Dy
> # CONFIG_MTD_NETtel is not set
> # CONFIG_MTD_L440GX is not set
> # CONFIG_MTD_PCI is not set
> CONFIG_MTD_PCMCIA=3Dy
> CONFIG_MTD_PCMCIA_ANONYMOUS=3Dy
> CONFIG_MTD_GPIO_ADDR=3Dy
> # CONFIG_MTD_INTEL_VR_NOR is not set
> # CONFIG_MTD_PLATRAM is not set
> CONFIG_MTD_LATCH_ADDR=3Dy
> =

> #
> # Self-contained MTD device drivers
> #
> CONFIG_MTD_PMC551=3Dy
> CONFIG_MTD_PMC551_BUGFIX=3Dy
> CONFIG_MTD_PMC551_DEBUG=3Dy
> # CONFIG_MTD_DATAFLASH is not set
> CONFIG_MTD_SST25L=3Dy
> # CONFIG_MTD_SLRAM is not set
> # CONFIG_MTD_PHRAM is not set
> # CONFIG_MTD_MTDRAM is not set
> =

> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> CONFIG_MTD_NAND_ECC=3Dy
> # CONFIG_MTD_NAND_ECC_SMC is not set
> CONFIG_MTD_NAND=3Dy
> CONFIG_MTD_NAND_BCH=3Dy
> CONFIG_MTD_NAND_ECC_BCH=3Dy
> CONFIG_MTD_SM_COMMON=3Dy
> CONFIG_MTD_NAND_DENALI=3Dy
> # CONFIG_MTD_NAND_DENALI_PCI is not set
> # CONFIG_MTD_NAND_DENALI_DT is not set
> CONFIG_MTD_NAND_GPIO=3Dy
> # CONFIG_MTD_NAND_OMAP_BCH_BUILD is not set
> CONFIG_MTD_NAND_IDS=3Dy
> CONFIG_MTD_NAND_RICOH=3Dy
> CONFIG_MTD_NAND_DISKONCHIP=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=3Dy
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=3D0
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=3Dy
> # CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE is not set
> CONFIG_MTD_NAND_DOCG4=3Dy
> CONFIG_MTD_NAND_CAFE=3Dy
> # CONFIG_MTD_NAND_NANDSIM is not set
> # CONFIG_MTD_NAND_PLATFORM is not set
> CONFIG_MTD_NAND_HISI504=3Dy
> # CONFIG_MTD_ONENAND is not set
> =

> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> CONFIG_MTD_LPDDR=3Dy
> CONFIG_MTD_QINFO_PROBE=3Dy
> # CONFIG_MTD_SPI_NOR is not set
> CONFIG_MTD_UBI=3Dy
> CONFIG_MTD_UBI_WL_THRESHOLD=3D4096
> CONFIG_MTD_UBI_BEB_LIMIT=3D20
> # CONFIG_MTD_UBI_FASTMAP is not set
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dy
> CONFIG_PARPORT_PC=3Dy
> # CONFIG_PARPORT_SERIAL is not set
> CONFIG_PARPORT_PC_FIFO=3Dy
> CONFIG_PARPORT_PC_SUPERIO=3Dy
> # CONFIG_PARPORT_PC_PCMCIA is not set
> # CONFIG_PARPORT_GSC is not set
> # CONFIG_PARPORT_AX88796 is not set
> # CONFIG_PARPORT_1284 is not set
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dy
> # CONFIG_AD525X_DPOT is not set
> CONFIG_DUMMY_IRQ=3Dy
> CONFIG_IBM_ASM=3Dy
> # CONFIG_PHANTOM is not set
> CONFIG_SGI_IOC4=3Dy
> CONFIG_TIFM_CORE=3Dy
> CONFIG_TIFM_7XX1=3Dy
> CONFIG_ICS932S401=3Dy
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_HP_ILO=3Dy
> CONFIG_APDS9802ALS=3Dy
> CONFIG_ISL29003=3Dy
> CONFIG_ISL29020=3Dy
> CONFIG_SENSORS_TSL2550=3Dy
> CONFIG_SENSORS_BH1780=3Dy
> CONFIG_SENSORS_BH1770=3Dy
> CONFIG_SENSORS_APDS990X=3Dy
> CONFIG_HMC6352=3Dy
> CONFIG_DS1682=3Dy
> CONFIG_TI_DAC7512=3Dy
> CONFIG_VMWARE_BALLOON=3Dy
> CONFIG_BMP085=3Dy
> CONFIG_BMP085_I2C=3Dy
> CONFIG_BMP085_SPI=3Dy
> # CONFIG_USB_SWITCH_FSA9480 is not set
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> CONFIG_C2PORT=3Dy
> # CONFIG_C2PORT_DURAMAR_2150 is not set
> =

> #
> # EEPROM support
> #
> CONFIG_EEPROM_AT24=3Dy
> CONFIG_EEPROM_AT25=3Dy
> CONFIG_EEPROM_LEGACY=3Dy
> # CONFIG_EEPROM_MAX6875 is not set
> CONFIG_EEPROM_93CX6=3Dy
> # CONFIG_EEPROM_93XX46 is not set
> CONFIG_CB710_CORE=3Dy
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
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
> CONFIG_ALTERA_STAPL=3Dy
> CONFIG_INTEL_MEI=3Dy
> CONFIG_INTEL_MEI_ME=3Dy
> CONFIG_INTEL_MEI_TXE=3Dy
> # CONFIG_VMWARE_VMCI is not set
> =

> #
> # Intel MIC Bus Driver
> #
> CONFIG_INTEL_MIC_BUS=3Dy
> =

> #
> # SCIF Bus Driver
> #
> # CONFIG_SCIF_BUS is not set
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
> CONFIG_GENWQE=3Dy
> CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=3D0
> CONFIG_ECHO=3Dy
> # CONFIG_CXL_BASE is not set
> # CONFIG_CXL_KERNEL_API is not set
> CONFIG_HAVE_IDE=3Dy
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> # CONFIG_SCSI_DMA is not set
> # CONFIG_SCSI_NETLINK is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> # CONFIG_FIREWIRE is not set
> CONFIG_FIREWIRE_NOSY=3Dy
> # CONFIG_MACINTOSH_DRIVERS is not set
> # CONFIG_NETDEVICES is not set
> # CONFIG_VHOST_NET is not set
> CONFIG_VHOST_CROSS_ENDIAN_LEGACY=3Dy
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dy
> CONFIG_INPUT_POLLDEV=3Dy
> CONFIG_INPUT_SPARSEKMAP=3Dy
> CONFIG_INPUT_MATRIXKMAP=3Dy
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> CONFIG_INPUT_MOUSEDEV_PSAUX=3Dy
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
> # CONFIG_KEYBOARD_ADP5520 is not set
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
> # CONFIG_KEYBOARD_LM8333 is not set
> CONFIG_KEYBOARD_MAX7359=3Dy
> # CONFIG_KEYBOARD_MCS is not set
> CONFIG_KEYBOARD_MPR121=3Dy
> # CONFIG_KEYBOARD_NEWTON is not set
> CONFIG_KEYBOARD_OPENCORES=3Dy
> CONFIG_KEYBOARD_SAMSUNG=3Dy
> CONFIG_KEYBOARD_STOWAWAY=3Dy
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_KEYBOARD_CROS_EC=3Dy
> # CONFIG_INPUT_MOUSE is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
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
> CONFIG_SERIO_CT82C710=3Dy
> CONFIG_SERIO_PARKBD=3Dy
> CONFIG_SERIO_PCIPS2=3Dy
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dy
> CONFIG_SERIO_ALTERA_PS2=3Dy
> # CONFIG_SERIO_PS2MULT is not set
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_HYPERV_KEYBOARD=3Dy
> CONFIG_GAMEPORT=3Dy
> CONFIG_GAMEPORT_NS558=3Dy
> # CONFIG_GAMEPORT_L4 is not set
> CONFIG_GAMEPORT_EMU10K1=3Dy
> CONFIG_GAMEPORT_FM801=3Dy
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> # CONFIG_VT is not set
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
> CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=3Dy
> CONFIG_SERIAL_8250_PNP=3Dy
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> # CONFIG_SERIAL_8250_CS is not set
> CONFIG_SERIAL_8250_NR_UARTS=3D4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> # CONFIG_SERIAL_8250_EXTENDED is not set
> # CONFIG_SERIAL_8250_DW is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> # CONFIG_SERIAL_JSM is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> # CONFIG_SERIAL_IFX6X60 is not set
> # CONFIG_SERIAL_ARC is not set
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_TTY_PRINTK is not set
> CONFIG_PRINTER=3Dy
> # CONFIG_LP_CONSOLE is not set
> # CONFIG_PPDEV is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> # CONFIG_VIRTIO_CONSOLE is not set
> # CONFIG_IPMI_HANDLER is not set
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dy
> CONFIG_HW_RANDOM_INTEL=3Dy
> # CONFIG_HW_RANDOM_AMD is not set
> # CONFIG_HW_RANDOM_VIA is not set
> # CONFIG_HW_RANDOM_VIRTIO is not set
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_NVRAM=3Dy
> # CONFIG_R3964 is not set
> CONFIG_APPLICOM=3Dy
> =

> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> CONFIG_CARDMAN_4000=3Dy
> CONFIG_CARDMAN_4040=3Dy
> # CONFIG_MWAVE is not set
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> CONFIG_HPET_MMAP_DEFAULT=3Dy
> CONFIG_HANGCHECK_TIMER=3Dy
> CONFIG_TCG_TPM=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> CONFIG_TCG_TIS_I2C_INFINEON=3Dy
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dy
> CONFIG_TCG_NSC=3Dy
> CONFIG_TCG_ATMEL=3Dy
> CONFIG_TCG_INFINEON=3Dy
> CONFIG_TCG_XEN=3Dy
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_TIS_ST33ZP24 is not set
> # CONFIG_TELCLOCK is not set
> CONFIG_DEVPORT=3Dy
> CONFIG_XILLYBUS=3Dy
> CONFIG_XILLYBUS_PCIE=3Dy
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> # CONFIG_ACPI_I2C_OPREGION is not set
> CONFIG_I2C_BOARDINFO=3Dy
> # CONFIG_I2C_COMPAT is not set
> CONFIG_I2C_CHARDEV=3Dy
> CONFIG_I2C_MUX=3Dy
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> CONFIG_I2C_MUX_PCA9541=3Dy
> CONFIG_I2C_MUX_PCA954x=3Dy
> CONFIG_I2C_MUX_PINCTRL=3Dy
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
> CONFIG_I2C_ALI1535=3Dy
> # CONFIG_I2C_ALI1563 is not set
> CONFIG_I2C_ALI15X3=3Dy
> # CONFIG_I2C_AMD756 is not set
> # CONFIG_I2C_AMD8111 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dy
> # CONFIG_I2C_ISMT is not set
> CONFIG_I2C_PIIX4=3Dy
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_SIS5595=3Dy
> CONFIG_I2C_SIS630=3Dy
> # CONFIG_I2C_SIS96X is not set
> # CONFIG_I2C_VIA is not set
> CONFIG_I2C_VIAPRO=3Dy
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dy
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dy
> # CONFIG_I2C_DESIGNWARE_PLATFORM is not set
> CONFIG_I2C_DESIGNWARE_PCI=3Dy
> CONFIG_I2C_GPIO=3Dy
> CONFIG_I2C_KEMPLD=3Dy
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dy
> # CONFIG_I2C_PXA_PCI is not set
> # CONFIG_I2C_SIMTEC is not set
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_PARPORT is not set
> # CONFIG_I2C_PARPORT_LIGHT is not set
> # CONFIG_I2C_TAOS_EVM is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_CROS_EC_TUNNEL is not set
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> CONFIG_SPI=3Dy
> CONFIG_SPI_DEBUG=3Dy
> CONFIG_SPI_MASTER=3Dy
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> CONFIG_SPI_BITBANG=3Dy
> CONFIG_SPI_BUTTERFLY=3Dy
> CONFIG_SPI_CADENCE=3Dy
> CONFIG_SPI_GPIO=3Dy
> CONFIG_SPI_LM70_LLP=3Dy
> CONFIG_SPI_OC_TINY=3Dy
> CONFIG_SPI_PXA2XX_DMA=3Dy
> CONFIG_SPI_PXA2XX=3Dy
> CONFIG_SPI_PXA2XX_PCI=3Dy
> # CONFIG_SPI_SC18IS602 is not set
> CONFIG_SPI_XCOMM=3Dy
> # CONFIG_SPI_XILINX is not set
> CONFIG_SPI_ZYNQMP_GQSPI=3Dy
> CONFIG_SPI_DESIGNWARE=3Dy
> CONFIG_SPI_DW_PCI=3Dy
> CONFIG_SPI_DW_MID_DMA=3Dy
> CONFIG_SPI_DW_MMIO=3Dy
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
> CONFIG_HSI_CHAR=3Dy
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
> CONFIG_PINCTRL=3Dy
> =

> #
> # Pin controllers
> #
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> CONFIG_DEBUG_PINCTRL=3Dy
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> CONFIG_PINCTRL_INTEL=3Dy
> CONFIG_PINCTRL_SUNRISEPOINT=3Dy
> CONFIG_ARCH_WANT_OPTIONAL_GPIOLIB=3Dy
> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIO_DEVRES=3Dy
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_SYSFS=3Dy
> CONFIG_GPIO_GENERIC=3Dy
> CONFIG_GPIO_MAX730X=3Dy
> =

> #
> # Memory mapped GPIO drivers
> #
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_F7188X is not set
> CONFIG_GPIO_GENERIC_PLATFORM=3Dy
> CONFIG_GPIO_ICH=3Dy
> # CONFIG_GPIO_IT8761E is not set
> CONFIG_GPIO_LYNXPOINT=3Dy
> CONFIG_GPIO_SCH=3Dy
> # CONFIG_GPIO_SCH311X is not set
> CONFIG_GPIO_VX855=3Dy
> =

> #
> # I2C GPIO expanders
> #
> CONFIG_GPIO_ADP5588=3Dy
> # CONFIG_GPIO_ADP5588_IRQ is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> CONFIG_GPIO_PCF857X=3Dy
> # CONFIG_GPIO_SX150X is not set
> =

> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ADP5520 is not set
> # CONFIG_GPIO_ARIZONA is not set
> CONFIG_GPIO_CRYSTAL_COVE=3Dy
> CONFIG_GPIO_DA9052=3Dy
> CONFIG_GPIO_DA9055=3Dy
> CONFIG_GPIO_JANZ_TTL=3Dy
> # CONFIG_GPIO_KEMPLD is not set
> CONFIG_GPIO_LP3943=3Dy
> CONFIG_GPIO_TPS65910=3Dy
> CONFIG_GPIO_TPS65912=3Dy
> CONFIG_GPIO_WM831X=3Dy
> # CONFIG_GPIO_WM8350 is not set
> CONFIG_GPIO_WM8994=3Dy
> =

> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=3Dy
> CONFIG_GPIO_BT8XX=3Dy
> CONFIG_GPIO_INTEL_MID=3Dy
> CONFIG_GPIO_ML_IOH=3Dy
> # CONFIG_GPIO_RDC321X is not set
> =

> #
> # SPI GPIO expanders
> #
> CONFIG_GPIO_MAX7301=3Dy
> CONFIG_GPIO_MCP23S08=3Dy
> # CONFIG_GPIO_MC33880 is not set
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
> # CONFIG_W1_SLAVE_SMEM is not set
> CONFIG_W1_SLAVE_DS2408=3Dy
> # CONFIG_W1_SLAVE_DS2408_READBACK is not set
> CONFIG_W1_SLAVE_DS2413=3Dy
> # CONFIG_W1_SLAVE_DS2406 is not set
> CONFIG_W1_SLAVE_DS2423=3Dy
> CONFIG_W1_SLAVE_DS2431=3Dy
> CONFIG_W1_SLAVE_DS2433=3Dy
> CONFIG_W1_SLAVE_DS2433_CRC=3Dy
> CONFIG_W1_SLAVE_DS2760=3Dy
> CONFIG_W1_SLAVE_DS2780=3Dy
> CONFIG_W1_SLAVE_DS2781=3Dy
> CONFIG_W1_SLAVE_DS28E04=3Dy
> CONFIG_W1_SLAVE_BQ27000=3Dy
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_PDA_POWER=3Dy
> CONFIG_GENERIC_ADC_BATTERY=3Dy
> # CONFIG_WM831X_BACKUP is not set
> CONFIG_WM831X_POWER=3Dy
> # CONFIG_WM8350_POWER is not set
> # CONFIG_TEST_POWER is not set
> CONFIG_BATTERY_88PM860X=3Dy
> CONFIG_BATTERY_DS2760=3Dy
> # CONFIG_BATTERY_DS2780 is not set
> CONFIG_BATTERY_DS2781=3Dy
> # CONFIG_BATTERY_DS2782 is not set
> CONFIG_BATTERY_SBS=3Dy
> # CONFIG_BATTERY_BQ27x00 is not set
> # CONFIG_BATTERY_DA9052 is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_CHARGER_88PM860X=3Dy
> # CONFIG_CHARGER_PCF50633 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> CONFIG_CHARGER_LP8727=3Dy
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_MAX8997=3Dy
> CONFIG_CHARGER_BQ2415X=3Dy
> CONFIG_CHARGER_BQ24190=3Dy
> CONFIG_CHARGER_BQ24257=3Dy
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ25890 is not set
> CONFIG_CHARGER_SMB347=3Dy
> CONFIG_CHARGER_TPS65090=3Dy
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> CONFIG_CHARGER_RT9455=3Dy
> CONFIG_POWER_RESET=3Dy
> CONFIG_POWER_RESET_RESTART=3Dy
> CONFIG_POWER_AVS=3Dy
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dy
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7314=3Dy
> CONFIG_SENSORS_AD7414=3Dy
> # CONFIG_SENSORS_AD7418 is not set
> CONFIG_SENSORS_ADM1021=3Dy
> CONFIG_SENSORS_ADM1025=3Dy
> CONFIG_SENSORS_ADM1026=3Dy
> # CONFIG_SENSORS_ADM1029 is not set
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM9240=3Dy
> CONFIG_SENSORS_ADT7X10=3Dy
> CONFIG_SENSORS_ADT7310=3Dy
> CONFIG_SENSORS_ADT7410=3Dy
> CONFIG_SENSORS_ADT7411=3Dy
> CONFIG_SENSORS_ADT7462=3Dy
> # CONFIG_SENSORS_ADT7470 is not set
> CONFIG_SENSORS_ADT7475=3Dy
> CONFIG_SENSORS_ASC7621=3Dy
> CONFIG_SENSORS_K8TEMP=3Dy
> # CONFIG_SENSORS_K10TEMP is not set
> CONFIG_SENSORS_FAM15H_POWER=3Dy
> # CONFIG_SENSORS_APPLESMC is not set
> # CONFIG_SENSORS_ASB100 is not set
> CONFIG_SENSORS_ATXP1=3Dy
> CONFIG_SENSORS_DS620=3Dy
> CONFIG_SENSORS_DS1621=3Dy
> CONFIG_SENSORS_DELL_SMM=3Dy
> CONFIG_SENSORS_DA9052_ADC=3Dy
> # CONFIG_SENSORS_DA9055 is not set
> CONFIG_SENSORS_I5K_AMB=3Dy
> CONFIG_SENSORS_F71805F=3Dy
> CONFIG_SENSORS_F71882FG=3Dy
> CONFIG_SENSORS_F75375S=3Dy
> CONFIG_SENSORS_MC13783_ADC=3Dy
> CONFIG_SENSORS_FSCHMD=3Dy
> # CONFIG_SENSORS_GL518SM is not set
> CONFIG_SENSORS_GL520SM=3Dy
> CONFIG_SENSORS_G760A=3Dy
> CONFIG_SENSORS_G762=3Dy
> CONFIG_SENSORS_GPIO_FAN=3Dy
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IIO_HWMON=3Dy
> # CONFIG_SENSORS_I5500 is not set
> CONFIG_SENSORS_CORETEMP=3Dy
> # CONFIG_SENSORS_IT87 is not set
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=3Dy
> CONFIG_SENSORS_LINEAGE=3Dy
> CONFIG_SENSORS_LTC2945=3Dy
> CONFIG_SENSORS_LTC4151=3Dy
> # CONFIG_SENSORS_LTC4215 is not set
> CONFIG_SENSORS_LTC4222=3Dy
> # CONFIG_SENSORS_LTC4245 is not set
> CONFIG_SENSORS_LTC4260=3Dy
> CONFIG_SENSORS_LTC4261=3Dy
> CONFIG_SENSORS_MAX1111=3Dy
> CONFIG_SENSORS_MAX16065=3Dy
> CONFIG_SENSORS_MAX1619=3Dy
> CONFIG_SENSORS_MAX1668=3Dy
> CONFIG_SENSORS_MAX197=3Dy
> CONFIG_SENSORS_MAX6639=3Dy
> CONFIG_SENSORS_MAX6642=3Dy
> CONFIG_SENSORS_MAX6650=3Dy
> CONFIG_SENSORS_MAX6697=3Dy
> CONFIG_SENSORS_HTU21=3Dy
> CONFIG_SENSORS_MCP3021=3Dy
> CONFIG_SENSORS_MENF21BMC_HWMON=3Dy
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dy
> CONFIG_SENSORS_LM70=3Dy
> CONFIG_SENSORS_LM73=3Dy
> # CONFIG_SENSORS_LM75 is not set
> CONFIG_SENSORS_LM77=3Dy
> CONFIG_SENSORS_LM78=3Dy
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=3Dy
> # CONFIG_SENSORS_LM85 is not set
> CONFIG_SENSORS_LM87=3Dy
> CONFIG_SENSORS_LM90=3Dy
> CONFIG_SENSORS_LM92=3Dy
> CONFIG_SENSORS_LM93=3Dy
> # CONFIG_SENSORS_LM95234 is not set
> CONFIG_SENSORS_LM95241=3Dy
> CONFIG_SENSORS_LM95245=3Dy
> CONFIG_SENSORS_PC87360=3Dy
> CONFIG_SENSORS_PC87427=3Dy
> CONFIG_SENSORS_NTC_THERMISTOR=3Dy
> # CONFIG_SENSORS_NCT6683 is not set
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT7802=3Dy
> CONFIG_SENSORS_NCT7904=3Dy
> CONFIG_SENSORS_PCF8591=3Dy
> # CONFIG_PMBUS is not set
> CONFIG_SENSORS_SHT15=3Dy
> CONFIG_SENSORS_SHT21=3Dy
> CONFIG_SENSORS_SHTC1=3Dy
> CONFIG_SENSORS_SIS5595=3Dy
> # CONFIG_SENSORS_DME1737 is not set
> # CONFIG_SENSORS_EMC1403 is not set
> CONFIG_SENSORS_EMC2103=3Dy
> CONFIG_SENSORS_EMC6W201=3Dy
> CONFIG_SENSORS_SMSC47M1=3Dy
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> CONFIG_SENSORS_SCH56XX_COMMON=3Dy
> CONFIG_SENSORS_SCH5627=3Dy
> CONFIG_SENSORS_SCH5636=3Dy
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS1015=3Dy
> CONFIG_SENSORS_ADS7828=3Dy
> CONFIG_SENSORS_ADS7871=3Dy
> CONFIG_SENSORS_AMC6821=3Dy
> CONFIG_SENSORS_INA209=3Dy
> CONFIG_SENSORS_INA2XX=3Dy
> CONFIG_SENSORS_TC74=3Dy
> CONFIG_SENSORS_THMC50=3Dy
> CONFIG_SENSORS_TMP102=3Dy
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP401 is not set
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dy
> CONFIG_SENSORS_VIA686A=3Dy
> CONFIG_SENSORS_VT1211=3Dy
> # CONFIG_SENSORS_VT8231 is not set
> CONFIG_SENSORS_W83781D=3Dy
> # CONFIG_SENSORS_W83791D is not set
> CONFIG_SENSORS_W83792D=3Dy
> # CONFIG_SENSORS_W83793 is not set
> # CONFIG_SENSORS_W83795 is not set
> CONFIG_SENSORS_W83L785TS=3Dy
> CONFIG_SENSORS_W83L786NG=3Dy
> CONFIG_SENSORS_W83627HF=3Dy
> # CONFIG_SENSORS_W83627EHF is not set
> # CONFIG_SENSORS_WM831X is not set
> CONFIG_SENSORS_WM8350=3Dy
> =

> #
> # ACPI drivers
> #
> # CONFIG_SENSORS_ACPI_POWER is not set
> CONFIG_SENSORS_ATK0110=3Dy
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_HWMON is not set
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_DEFAULT_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> CONFIG_THERMAL_GOV_POWER_ALLOCATOR=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dy
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> CONFIG_INT340X_THERMAL=3Dy
> CONFIG_ACPI_THERMAL_REL=3Dy
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
> # CONFIG_SOFT_WATCHDOG is not set
> CONFIG_DA9052_WATCHDOG=3Dy
> # CONFIG_DA9055_WATCHDOG is not set
> CONFIG_MENF21BMC_WATCHDOG=3Dy
> CONFIG_WM831X_WATCHDOG=3Dy
> CONFIG_WM8350_WATCHDOG=3Dy
> CONFIG_XILINX_WATCHDOG=3Dy
> CONFIG_CADENCE_WATCHDOG=3Dy
> # CONFIG_DW_WATCHDOG is not set
> CONFIG_RN5T618_WATCHDOG=3Dy
> CONFIG_MAX63XX_WATCHDOG=3Dy
> CONFIG_RETU_WATCHDOG=3Dy
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dy
> CONFIG_ALIM7101_WDT=3Dy
> CONFIG_F71808E_WDT=3Dy
> CONFIG_SP5100_TCO=3Dy
> # CONFIG_SBC_FITPC2_WATCHDOG is not set
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dy
> CONFIG_IBMASR=3Dy
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dy
> CONFIG_ITCO_WDT=3Dy
> # CONFIG_ITCO_VENDOR_SUPPORT is not set
> CONFIG_IT8712F_WDT=3Dy
> CONFIG_IT87_WDT=3Dy
> # CONFIG_HP_WATCHDOG is not set
> CONFIG_KEMPLD_WDT=3Dy
> # CONFIG_SC1200_WDT is not set
> CONFIG_PC87413_WDT=3Dy
> CONFIG_NV_TCO=3Dy
> CONFIG_60XX_WDT=3Dy
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dy
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_VIA_WDT is not set
> CONFIG_W83627HF_WDT=3Dy
> # CONFIG_W83877F_WDT is not set
> # CONFIG_W83977F_WDT is not set
> CONFIG_MACHZ_WDT=3Dy
> CONFIG_SBC_EPX_C3_WATCHDOG=3Dy
> CONFIG_MEN_A21_WDT=3Dy
> CONFIG_XEN_WDT=3Dy
> =

> #
> # PCI-based Watchdog Cards
> #
> # CONFIG_PCIPCWATCHDOG is not set
> CONFIG_WDTPCI=3Dy
> CONFIG_SSB_POSSIBLE=3Dy
> =

> #
> # Sonics Silicon Backplane
> #
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> =

> #
> # Broadcom specific AMBA
> #
> CONFIG_BCMA=3Dy
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> # CONFIG_BCMA_DRIVER_GPIO is not set
> CONFIG_BCMA_DEBUG=3Dy
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> CONFIG_MFD_AS3711=3Dy
> CONFIG_PMIC_ADP5520=3Dy
> # CONFIG_MFD_AAT2870_CORE is not set
> CONFIG_MFD_BCM590XX=3Dy
> # CONFIG_MFD_AXP20X is not set
> CONFIG_MFD_CROS_EC=3Dy
> # CONFIG_MFD_CROS_EC_I2C is not set
> # CONFIG_PMIC_DA903X is not set
> CONFIG_PMIC_DA9052=3Dy
> # CONFIG_MFD_DA9052_SPI is not set
> CONFIG_MFD_DA9052_I2C=3Dy
> CONFIG_MFD_DA9055=3Dy
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=3Dy
> CONFIG_MFD_MC13XXX=3Dy
> CONFIG_MFD_MC13XXX_SPI=3Dy
> CONFIG_MFD_MC13XXX_I2C=3Dy
> # CONFIG_HTC_PASIC3 is not set
> CONFIG_HTC_I2CPLD=3Dy
> CONFIG_MFD_INTEL_QUARK_I2C_GPIO=3Dy
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dy
> CONFIG_INTEL_SOC_PMIC=3Dy
> CONFIG_MFD_JANZ_CMODIO=3Dy
> CONFIG_MFD_KEMPLD=3Dy
> CONFIG_MFD_88PM800=3Dy
> # CONFIG_MFD_88PM805 is not set
> CONFIG_MFD_88PM860X=3Dy
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> CONFIG_MFD_MAX8907=3Dy
> # CONFIG_MFD_MAX8925 is not set
> CONFIG_MFD_MAX8997=3Dy
> CONFIG_MFD_MAX8998=3Dy
> # CONFIG_MFD_MT6397 is not set
> CONFIG_MFD_MENF21BMC=3Dy
> CONFIG_EZX_PCAP=3Dy
> CONFIG_MFD_RETU=3Dy
> CONFIG_MFD_PCF50633=3Dy
> # CONFIG_PCF50633_ADC is not set
> # CONFIG_PCF50633_GPIO is not set
> # CONFIG_UCB1400_CORE is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RTSX_PCI is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> CONFIG_MFD_RN5T618=3Dy
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dy
> CONFIG_MFD_SM501_GPIO=3Dy
> CONFIG_MFD_SKY81452=3Dy
> CONFIG_MFD_SMSC=3Dy
> # CONFIG_ABX500_CORE is not set
> CONFIG_MFD_SYSCON=3Dy
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> CONFIG_MFD_LP3943=3Dy
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=3Dy
> # CONFIG_TPS65010 is not set
> CONFIG_TPS6507X=3Dy
> CONFIG_MFD_TPS65090=3Dy
> CONFIG_MFD_TPS65217=3Dy
> # CONFIG_MFD_TPS65218 is not set
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
> # CONFIG_MFD_TMIO is not set
> CONFIG_MFD_VX855=3Dy
> CONFIG_MFD_ARIZONA=3Dy
> CONFIG_MFD_ARIZONA_I2C=3Dy
> # CONFIG_MFD_ARIZONA_SPI is not set
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
> CONFIG_REGULATOR_88PM800=3Dy
> # CONFIG_REGULATOR_88PM8607 is not set
> CONFIG_REGULATOR_ACT8865=3Dy
> CONFIG_REGULATOR_AD5398=3Dy
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AS3711=3Dy
> CONFIG_REGULATOR_BCM590XX=3Dy
> CONFIG_REGULATOR_DA9052=3Dy
> CONFIG_REGULATOR_DA9055=3Dy
> # CONFIG_REGULATOR_DA9210 is not set
> # CONFIG_REGULATOR_DA9211 is not set
> # CONFIG_REGULATOR_FAN53555 is not set
> CONFIG_REGULATOR_GPIO=3Dy
> CONFIG_REGULATOR_ISL9305=3Dy
> # CONFIG_REGULATOR_ISL6271A is not set
> # CONFIG_REGULATOR_LP3971 is not set
> CONFIG_REGULATOR_LP3972=3Dy
> CONFIG_REGULATOR_LP872X=3Dy
> CONFIG_REGULATOR_LP8755=3Dy
> CONFIG_REGULATOR_LTC3589=3Dy
> # CONFIG_REGULATOR_MAX1586 is not set
> CONFIG_REGULATOR_MAX8649=3Dy
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8907=3Dy
> CONFIG_REGULATOR_MAX8952=3Dy
> # CONFIG_REGULATOR_MAX8973 is not set
> CONFIG_REGULATOR_MAX8997=3Dy
> # CONFIG_REGULATOR_MAX8998 is not set
> # CONFIG_REGULATOR_MC13783 is not set
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_PCAP is not set
> # CONFIG_REGULATOR_PCF50633 is not set
> # CONFIG_REGULATOR_PFUZE100 is not set
> # CONFIG_REGULATOR_QCOM_SPMI is not set
> CONFIG_REGULATOR_RN5T618=3Dy
> CONFIG_REGULATOR_SKY81452=3Dy
> # CONFIG_REGULATOR_TPS51632 is not set
> # CONFIG_REGULATOR_TPS6105X is not set
> CONFIG_REGULATOR_TPS62360=3Dy
> CONFIG_REGULATOR_TPS65023=3Dy
> # CONFIG_REGULATOR_TPS6507X is not set
> # CONFIG_REGULATOR_TPS65090 is not set
> CONFIG_REGULATOR_TPS65217=3Dy
> # CONFIG_REGULATOR_TPS6524X is not set
> CONFIG_REGULATOR_TPS65910=3Dy
> CONFIG_REGULATOR_TPS65912=3Dy
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8350=3Dy
> # CONFIG_REGULATOR_WM8994 is not set
> # CONFIG_MEDIA_SUPPORT is not set
> =

> #
> # Graphics support
> #
> CONFIG_AGP=3Dy
> CONFIG_AGP_AMD64=3Dy
> CONFIG_AGP_INTEL=3Dy
> # CONFIG_AGP_SIS is not set
> CONFIG_AGP_VIA=3Dy
> CONFIG_INTEL_GTT=3Dy
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D16
> CONFIG_VGA_SWITCHEROO=3Dy
> =

> #
> # Direct Rendering Manager
> #
> CONFIG_DRM=3Dy
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_KMS_HELPER=3Dy
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> CONFIG_DRM_TTM=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> # CONFIG_DRM_I2C_ADV7511 is not set
> CONFIG_DRM_I2C_CH7006=3Dy
> # CONFIG_DRM_I2C_SIL164 is not set
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> CONFIG_DRM_TDFX=3Dy
> # CONFIG_DRM_R128 is not set
> # CONFIG_DRM_RADEON is not set
> CONFIG_DRM_AMDGPU=3Dy
> CONFIG_DRM_AMDGPU_CIK=3Dy
> # CONFIG_DRM_AMDGPU_USERPTR is not set
> CONFIG_DRM_NOUVEAU=3Dy
> CONFIG_NOUVEAU_DEBUG=3D5
> CONFIG_NOUVEAU_DEBUG_DEFAULT=3D3
> # CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
> # CONFIG_DRM_I810 is not set
> CONFIG_DRM_I915=3Dy
> # CONFIG_DRM_I915_KMS is not set
> CONFIG_DRM_I915_FBDEV=3Dy
> CONFIG_DRM_I915_PRELIMINARY_HW_SUPPORT=3Dy
> # CONFIG_DRM_MGA is not set
> CONFIG_DRM_SIS=3Dy
> CONFIG_DRM_VIA=3Dy
> CONFIG_DRM_SAVAGE=3Dy
> CONFIG_DRM_VGEM=3Dy
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dy
> CONFIG_DRM_GMA600=3Dy
> # CONFIG_DRM_GMA3600 is not set
> # CONFIG_DRM_UDL is not set
> # CONFIG_DRM_AST is not set
> CONFIG_DRM_MGAG200=3Dy
> CONFIG_DRM_CIRRUS_QEMU=3Dy
> CONFIG_DRM_QXL=3Dy
> CONFIG_DRM_BOCHS=3Dy
> # CONFIG_DRM_VIRTIO_GPU is not set
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB=3Dy
> CONFIG_FIRMWARE_EDID=3Dy
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
> CONFIG_FB_HECUBA=3Dy
> CONFIG_FB_SVGALIB=3Dy
> # CONFIG_FB_MACMODES is not set
> CONFIG_FB_BACKLIGHT=3Dy
> CONFIG_FB_MODE_HELPERS=3Dy
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=3Dy
> CONFIG_FB_PM2=3Dy
> CONFIG_FB_PM2_FIFO_DISCONNECT=3Dy
> CONFIG_FB_CYBER2000=3Dy
> CONFIG_FB_CYBER2000_DDC=3Dy
> CONFIG_FB_ARC=3Dy
> # CONFIG_FB_ASILIANT is not set
> CONFIG_FB_IMSTT=3Dy
> # CONFIG_FB_VGA16 is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_N411=3Dy
> CONFIG_FB_HGA=3Dy
> CONFIG_FB_OPENCORES=3Dy
> CONFIG_FB_S1D13XXX=3Dy
> CONFIG_FB_NVIDIA=3Dy
> CONFIG_FB_NVIDIA_I2C=3Dy
> # CONFIG_FB_NVIDIA_DEBUG is not set
> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> CONFIG_FB_RIVA=3Dy
> # CONFIG_FB_RIVA_I2C is not set
> # CONFIG_FB_RIVA_DEBUG is not set
> CONFIG_FB_RIVA_BACKLIGHT=3Dy
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> CONFIG_FB_RADEON=3Dy
> CONFIG_FB_RADEON_I2C=3Dy
> CONFIG_FB_RADEON_BACKLIGHT=3Dy
> CONFIG_FB_RADEON_DEBUG=3Dy
> # CONFIG_FB_ATY128 is not set
> CONFIG_FB_ATY=3Dy
> CONFIG_FB_ATY_CT=3Dy
> CONFIG_FB_ATY_GENERIC_LCD=3Dy
> CONFIG_FB_ATY_GX=3Dy
> CONFIG_FB_ATY_BACKLIGHT=3Dy
> CONFIG_FB_S3=3Dy
> # CONFIG_FB_S3_DDC is not set
> CONFIG_FB_SAVAGE=3Dy
> # CONFIG_FB_SAVAGE_I2C is not set
> CONFIG_FB_SAVAGE_ACCEL=3Dy
> CONFIG_FB_SIS=3Dy
> # CONFIG_FB_SIS_300 is not set
> # CONFIG_FB_SIS_315 is not set
> CONFIG_FB_VIA=3Dy
> # CONFIG_FB_VIA_DIRECT_PROCFS is not set
> # CONFIG_FB_VIA_X_COMPATIBILITY is not set
> CONFIG_FB_NEOMAGIC=3Dy
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> CONFIG_FB_VOODOO1=3Dy
> CONFIG_FB_VT8623=3Dy
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> CONFIG_FB_CARMINE=3Dy
> # CONFIG_FB_CARMINE_DRAM_EVAL is not set
> CONFIG_CARMINE_DRAM_CUSTOM=3Dy
> CONFIG_FB_SM501=3Dy
> CONFIG_FB_VIRTUAL=3Dy
> CONFIG_XEN_FBDEV_FRONTEND=3Dy
> CONFIG_FB_METRONOME=3Dy
> CONFIG_FB_MB862XX=3Dy
> CONFIG_FB_MB862XX_PCI_GDC=3Dy
> CONFIG_FB_MB862XX_I2C=3Dy
> # CONFIG_FB_BROADSHEET is not set
> CONFIG_FB_AUO_K190X=3Dy
> CONFIG_FB_AUO_K1900=3Dy
> # CONFIG_FB_AUO_K1901 is not set
> # CONFIG_FB_HYPERV is not set
> # CONFIG_FB_SIMPLE is not set
> CONFIG_BACKLIGHT_LCD_SUPPORT=3Dy
> CONFIG_LCD_CLASS_DEVICE=3Dy
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> CONFIG_LCD_ILI922X=3Dy
> CONFIG_LCD_ILI9320=3Dy
> # CONFIG_LCD_TDO24M is not set
> CONFIG_LCD_VGG2432A4=3Dy
> # CONFIG_LCD_PLATFORM is not set
> # CONFIG_LCD_S6E63M0 is not set
> CONFIG_LCD_LD9040=3Dy
> # CONFIG_LCD_AMS369FG06 is not set
> CONFIG_LCD_LMS501KF03=3Dy
> CONFIG_LCD_HX8357=3Dy
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> CONFIG_BACKLIGHT_GENERIC=3Dy
> CONFIG_BACKLIGHT_LM3533=3Dy
> # CONFIG_BACKLIGHT_DA9052 is not set
> # CONFIG_BACKLIGHT_APPLE is not set
> CONFIG_BACKLIGHT_SAHARA=3Dy
> CONFIG_BACKLIGHT_WM831X=3Dy
> CONFIG_BACKLIGHT_ADP5520=3Dy
> CONFIG_BACKLIGHT_ADP8860=3Dy
> CONFIG_BACKLIGHT_ADP8870=3Dy
> # CONFIG_BACKLIGHT_88PM860X is not set
> CONFIG_BACKLIGHT_PCF50633=3Dy
> CONFIG_BACKLIGHT_LM3639=3Dy
> CONFIG_BACKLIGHT_SKY81452=3Dy
> CONFIG_BACKLIGHT_TPS65217=3Dy
> CONFIG_BACKLIGHT_AS3711=3Dy
> # CONFIG_BACKLIGHT_GPIO is not set
> CONFIG_BACKLIGHT_LV5207LP=3Dy
> CONFIG_BACKLIGHT_BD6107=3Dy
> CONFIG_VGASTATE=3Dy
> CONFIG_HDMI=3Dy
> # CONFIG_LOGO is not set
> CONFIG_SOUND=3Dy
> CONFIG_SOUND_OSS_CORE=3Dy
> # CONFIG_SOUND_OSS_CORE_PRECLAIM is not set
> CONFIG_SND=3Dy
> CONFIG_SND_TIMER=3Dy
> CONFIG_SND_PCM=3Dy
> CONFIG_SND_HWDEP=3Dy
> CONFIG_SND_RAWMIDI=3Dy
> CONFIG_SND_JACK=3Dy
> # CONFIG_SND_SEQUENCER is not set
> CONFIG_SND_OSSEMUL=3Dy
> # CONFIG_SND_MIXER_OSS is not set
> CONFIG_SND_PCM_OSS=3Dy
> # CONFIG_SND_PCM_OSS_PLUGINS is not set
> CONFIG_SND_HRTIMER=3Dy
> # CONFIG_SND_DYNAMIC_MINORS is not set
> # CONFIG_SND_SUPPORT_OLD_API is not set
> CONFIG_SND_PROC_FS=3Dy
> CONFIG_SND_VERBOSE_PROCFS=3Dy
> # CONFIG_SND_VERBOSE_PRINTK is not set
> # CONFIG_SND_DEBUG is not set
> CONFIG_SND_VMASTER=3Dy
> CONFIG_SND_DMA_SGBUF=3Dy
> # CONFIG_SND_RAWMIDI_SEQ is not set
> # CONFIG_SND_OPL3_LIB_SEQ is not set
> # CONFIG_SND_OPL4_LIB_SEQ is not set
> # CONFIG_SND_SBAWE_SEQ is not set
> # CONFIG_SND_EMU10K1_SEQ is not set
> CONFIG_SND_MPU401_UART=3Dy
> CONFIG_SND_OPL3_LIB=3Dy
> CONFIG_SND_VX_LIB=3Dy
> CONFIG_SND_AC97_CODEC=3Dy
> CONFIG_SND_DRIVERS=3Dy
> # CONFIG_SND_PCSP is not set
> # CONFIG_SND_DUMMY is not set
> # CONFIG_SND_ALOOP is not set
> CONFIG_SND_MTPAV=3Dy
> CONFIG_SND_MTS64=3Dy
> # CONFIG_SND_SERIAL_U16550 is not set
> CONFIG_SND_MPU401=3Dy
> # CONFIG_SND_PORTMAN2X4 is not set
> # CONFIG_SND_AC97_POWER_SAVE is not set
> CONFIG_SND_SB_COMMON=3Dy
> CONFIG_SND_PCI=3Dy
> # CONFIG_SND_AD1889 is not set
> # CONFIG_SND_ALS300 is not set
> CONFIG_SND_ALS4000=3Dy
> CONFIG_SND_ALI5451=3Dy
> CONFIG_SND_ASIHPI=3Dy
> # CONFIG_SND_ATIIXP is not set
> CONFIG_SND_ATIIXP_MODEM=3Dy
> # CONFIG_SND_AU8810 is not set
> # CONFIG_SND_AU8820 is not set
> CONFIG_SND_AU8830=3Dy
> CONFIG_SND_AW2=3Dy
> CONFIG_SND_AZT3328=3Dy
> CONFIG_SND_BT87X=3Dy
> CONFIG_SND_BT87X_OVERCLOCK=3Dy
> CONFIG_SND_CA0106=3Dy
> CONFIG_SND_CMIPCI=3Dy
> CONFIG_SND_OXYGEN_LIB=3Dy
> # CONFIG_SND_OXYGEN is not set
> # CONFIG_SND_CS4281 is not set
> CONFIG_SND_CS46XX=3Dy
> CONFIG_SND_CS46XX_NEW_DSP=3Dy
> CONFIG_SND_CTXFI=3Dy
> CONFIG_SND_DARLA20=3Dy
> CONFIG_SND_GINA20=3Dy
> CONFIG_SND_LAYLA20=3Dy
> # CONFIG_SND_DARLA24 is not set
> CONFIG_SND_GINA24=3Dy
> CONFIG_SND_LAYLA24=3Dy
> CONFIG_SND_MONA=3Dy
> CONFIG_SND_MIA=3Dy
> CONFIG_SND_ECHO3G=3Dy
> # CONFIG_SND_INDIGO is not set
> CONFIG_SND_INDIGOIO=3Dy
> # CONFIG_SND_INDIGODJ is not set
> # CONFIG_SND_INDIGOIOX is not set
> CONFIG_SND_INDIGODJX=3Dy
> CONFIG_SND_EMU10K1=3Dy
> CONFIG_SND_EMU10K1X=3Dy
> # CONFIG_SND_ENS1370 is not set
> # CONFIG_SND_ENS1371 is not set
> CONFIG_SND_ES1938=3Dy
> # CONFIG_SND_ES1968 is not set
> # CONFIG_SND_FM801 is not set
> CONFIG_SND_HDSP=3Dy
> =

> #
> # Don't forget to add built-in firmwares for HDSP driver
> #
> CONFIG_SND_HDSPM=3Dy
> CONFIG_SND_ICE1712=3Dy
> CONFIG_SND_ICE1724=3Dy
> # CONFIG_SND_INTEL8X0 is not set
> CONFIG_SND_INTEL8X0M=3Dy
> CONFIG_SND_KORG1212=3Dy
> CONFIG_SND_LOLA=3Dy
> # CONFIG_SND_LX6464ES is not set
> CONFIG_SND_MAESTRO3=3Dy
> # CONFIG_SND_MAESTRO3_INPUT is not set
> CONFIG_SND_MIXART=3Dy
> # CONFIG_SND_NM256 is not set
> CONFIG_SND_PCXHR=3Dy
> CONFIG_SND_RIPTIDE=3Dy
> CONFIG_SND_RME32=3Dy
> CONFIG_SND_RME96=3Dy
> CONFIG_SND_RME9652=3Dy
> CONFIG_SND_SONICVIBES=3Dy
> CONFIG_SND_TRIDENT=3Dy
> CONFIG_SND_VIA82XX=3Dy
> CONFIG_SND_VIA82XX_MODEM=3Dy
> CONFIG_SND_VIRTUOSO=3Dy
> CONFIG_SND_VX222=3Dy
> CONFIG_SND_YMFPCI=3Dy
> =

> #
> # HD-Audio
> #
> CONFIG_SND_HDA=3Dy
> CONFIG_SND_HDA_INTEL=3Dy
> # CONFIG_SND_HDA_HWDEP is not set
> CONFIG_SND_HDA_RECONFIG=3Dy
> # CONFIG_SND_HDA_INPUT_BEEP is not set
> # CONFIG_SND_HDA_PATCH_LOADER is not set
> CONFIG_SND_HDA_CODEC_REALTEK=3Dy
> CONFIG_SND_HDA_CODEC_ANALOG=3Dy
> CONFIG_SND_HDA_CODEC_SIGMATEL=3Dy
> CONFIG_SND_HDA_CODEC_VIA=3Dy
> CONFIG_SND_HDA_CODEC_HDMI=3Dy
> CONFIG_SND_HDA_CODEC_CIRRUS=3Dy
> # CONFIG_SND_HDA_CODEC_CONEXANT is not set
> # CONFIG_SND_HDA_CODEC_CA0110 is not set
> CONFIG_SND_HDA_CODEC_CA0132=3Dy
> CONFIG_SND_HDA_CODEC_CA0132_DSP=3Dy
> CONFIG_SND_HDA_CODEC_CMEDIA=3Dy
> CONFIG_SND_HDA_CODEC_SI3054=3Dy
> CONFIG_SND_HDA_GENERIC=3Dy
> CONFIG_SND_HDA_POWER_SAVE_DEFAULT=3D0
> CONFIG_SND_HDA_CORE=3Dy
> CONFIG_SND_HDA_DSP_LOADER=3Dy
> CONFIG_SND_HDA_I915=3Dy
> CONFIG_SND_HDA_PREALLOC_SIZE=3D64
> CONFIG_SND_SPI=3Dy
> # CONFIG_SND_PCMCIA is not set
> # CONFIG_SND_SOC is not set
> CONFIG_SOUND_PRIME=3Dy
> CONFIG_SOUND_OSS=3Dy
> CONFIG_SOUND_TRACEINIT=3Dy
> CONFIG_SOUND_DMAP=3Dy
> # CONFIG_SOUND_VMIDI is not set
> CONFIG_SOUND_TRIX=3Dy
> # CONFIG_SOUND_MSS is not set
> CONFIG_SOUND_MPU401=3Dy
> CONFIG_SOUND_PAS=3Dy
> # CONFIG_PAS_JOYSTICK is not set
> # CONFIG_SOUND_PSS is not set
> # CONFIG_SOUND_SB is not set
> # CONFIG_SOUND_YM3812 is not set
> # CONFIG_SOUND_UART6850 is not set
> # CONFIG_SOUND_AEDSP16 is not set
> CONFIG_AC97_BUS=3Dy
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
> CONFIG_HID_ACRUX_FF=3Dy
> # CONFIG_HID_APPLE is not set
> CONFIG_HID_AUREAL=3Dy
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_CHERRY=3Dy
> CONFIG_HID_CHICONY=3Dy
> CONFIG_HID_PRODIKEYS=3Dy
> CONFIG_HID_CYPRESS=3Dy
> CONFIG_HID_DRAGONRISE=3Dy
> CONFIG_DRAGONRISE_FF=3Dy
> CONFIG_HID_EMS_FF=3Dy
> CONFIG_HID_ELECOM=3Dy
> CONFIG_HID_EZKEY=3Dy
> CONFIG_HID_KEYTOUCH=3Dy
> CONFIG_HID_KYE=3Dy
> CONFIG_HID_WALTOP=3Dy
> CONFIG_HID_GYRATION=3Dy
> CONFIG_HID_ICADE=3Dy
> # CONFIG_HID_TWINHAN is not set
> CONFIG_HID_KENSINGTON=3Dy
> CONFIG_HID_LCPOWER=3Dy
> # CONFIG_HID_LENOVO is not set
> # CONFIG_HID_LOGITECH is not set
> # CONFIG_HID_MAGICMOUSE is not set
> # CONFIG_HID_MICROSOFT is not set
> CONFIG_HID_MONTEREY=3Dy
> CONFIG_HID_MULTITOUCH=3Dy
> # CONFIG_HID_ORTEK is not set
> # CONFIG_HID_PANTHERLORD is not set
> # CONFIG_HID_PETALYNX is not set
> # CONFIG_HID_PICOLCD is not set
> CONFIG_HID_PLANTRONICS=3Dy
> CONFIG_HID_PRIMAX=3Dy
> # CONFIG_HID_SAITEK is not set
> CONFIG_HID_SAMSUNG=3Dy
> # CONFIG_HID_SPEEDLINK is not set
> # CONFIG_HID_STEELSERIES is not set
> CONFIG_HID_SUNPLUS=3Dy
> CONFIG_HID_RMI=3Dy
> CONFIG_HID_GREENASIA=3Dy
> CONFIG_GREENASIA_FF=3Dy
> CONFIG_HID_HYPERV_MOUSE=3Dy
> CONFIG_HID_SMARTJOYPLUS=3Dy
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dy
> # CONFIG_HID_TOPSEED is not set
> CONFIG_HID_THINGM=3Dy
> CONFIG_HID_THRUSTMASTER=3Dy
> # CONFIG_THRUSTMASTER_FF is not set
> CONFIG_HID_WACOM=3Dy
> CONFIG_HID_WIIMOTE=3Dy
> CONFIG_HID_XINMO=3Dy
> CONFIG_HID_ZEROPLUS=3Dy
> CONFIG_ZEROPLUS_FF=3Dy
> # CONFIG_HID_ZYDACRON is not set
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dy
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
> # CONFIG_UWB is not set
> CONFIG_MMC=3Dy
> CONFIG_MMC_DEBUG=3Dy
> # CONFIG_MMC_CLKGATE is not set
> =

> #
> # MMC/SD/SDIO Card Drivers
> #
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=3Dy
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_SDHCI is not set
> CONFIG_MMC_WBSD=3Dy
> CONFIG_MMC_TIFM_SD=3Dy
> CONFIG_MMC_SPI=3Dy
> CONFIG_MMC_SDRICOH_CS=3Dy
> CONFIG_MMC_CB710=3Dy
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_USDHI6ROL0=3Dy
> CONFIG_MMC_TOSHIBA_PCI=3Dy
> CONFIG_MMC_MTK=3Dy
> CONFIG_MEMSTICK=3Dy
> # CONFIG_MEMSTICK_DEBUG is not set
> =

> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=3Dy
> =

> #
> # MemoryStick Host Controller Drivers
> #
> # CONFIG_MEMSTICK_TIFM_MS is not set
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> # CONFIG_MEMSTICK_R592 is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> CONFIG_LEDS_CLASS_FLASH=3Dy
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
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP55XX_COMMON=3Dy
> CONFIG_LEDS_LP5521=3Dy
> # CONFIG_LEDS_LP5523 is not set
> CONFIG_LEDS_LP5562=3Dy
> # CONFIG_LEDS_LP8501 is not set
> # CONFIG_LEDS_LP8860 is not set
> CONFIG_LEDS_PCA955X=3Dy
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_WM831X_STATUS is not set
> # CONFIG_LEDS_WM8350 is not set
> CONFIG_LEDS_DA9052=3Dy
> CONFIG_LEDS_DAC124S085=3Dy
> CONFIG_LEDS_REGULATOR=3Dy
> CONFIG_LEDS_BD2802=3Dy
> CONFIG_LEDS_LT3593=3Dy
> CONFIG_LEDS_ADP5520=3Dy
> CONFIG_LEDS_DELL_NETBOOKS=3Dy
> CONFIG_LEDS_MC13783=3Dy
> CONFIG_LEDS_TCA6507=3Dy
> CONFIG_LEDS_TLC591XX=3Dy
> CONFIG_LEDS_MAX8997=3Dy
> # CONFIG_LEDS_LM355x is not set
> CONFIG_LEDS_MENF21BMC=3Dy
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dy
> CONFIG_LEDS_PM8941_WLED=3Dy
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> # CONFIG_LEDS_TRIGGER_TIMER is not set
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dy
> # CONFIG_LEDS_TRIGGER_HEARTBEAT is not set
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dy
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_GPIO is not set
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dy
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> # CONFIG_LEDS_TRIGGER_TRANSIENT is not set
> CONFIG_LEDS_TRIGGER_CAMERA=3Dy
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> # CONFIG_EDAC is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> # CONFIG_RTC_HCTOSYS is not set
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> =

> #
> # RTC interfaces
> #
> # CONFIG_RTC_INTF_SYSFS is not set
> # CONFIG_RTC_INTF_PROC is not set
> CONFIG_RTC_INTF_DEV=3Dy
> CONFIG_RTC_INTF_DEV_UIE_EMUL=3Dy
> CONFIG_RTC_DRV_TEST=3Dy
> =

> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_88PM860X=3Dy
> CONFIG_RTC_DRV_88PM80X=3Dy
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_DS1307=3Dy
> CONFIG_RTC_DRV_DS1374=3Dy
> CONFIG_RTC_DRV_DS1374_WDT=3Dy
> CONFIG_RTC_DRV_DS1672=3Dy
> CONFIG_RTC_DRV_DS3232=3Dy
> CONFIG_RTC_DRV_MAX6900=3Dy
> # CONFIG_RTC_DRV_MAX8907 is not set
> # CONFIG_RTC_DRV_MAX8998 is not set
> CONFIG_RTC_DRV_MAX8997=3Dy
> # CONFIG_RTC_DRV_RS5C372 is not set
> CONFIG_RTC_DRV_ISL1208=3Dy
> CONFIG_RTC_DRV_ISL12022=3Dy
> # CONFIG_RTC_DRV_ISL12057 is not set
> CONFIG_RTC_DRV_X1205=3Dy
> CONFIG_RTC_DRV_PCF2127=3Dy
> CONFIG_RTC_DRV_PCF8523=3Dy
> CONFIG_RTC_DRV_PCF8563=3Dy
> CONFIG_RTC_DRV_PCF85063=3Dy
> CONFIG_RTC_DRV_PCF8583=3Dy
> # CONFIG_RTC_DRV_M41T80 is not set
> CONFIG_RTC_DRV_BQ32K=3Dy
> # CONFIG_RTC_DRV_TPS65910 is not set
> CONFIG_RTC_DRV_S35390A=3Dy
> # CONFIG_RTC_DRV_FM3130 is not set
> # CONFIG_RTC_DRV_RX8581 is not set
> # CONFIG_RTC_DRV_RX8025 is not set
> # CONFIG_RTC_DRV_EM3027 is not set
> CONFIG_RTC_DRV_RV3029C2=3Dy
> =

> #
> # SPI RTC drivers
> #
> CONFIG_RTC_DRV_M41T93=3Dy
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> CONFIG_RTC_DRV_DS1343=3Dy
> CONFIG_RTC_DRV_DS1347=3Dy
> # CONFIG_RTC_DRV_DS1390 is not set
> CONFIG_RTC_DRV_MAX6902=3Dy
> CONFIG_RTC_DRV_R9701=3Dy
> # CONFIG_RTC_DRV_RS5C348 is not set
> CONFIG_RTC_DRV_DS3234=3Dy
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_RX4581 is not set
> CONFIG_RTC_DRV_MCP795=3Dy
> =

> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> # CONFIG_RTC_DRV_DS1286 is not set
> CONFIG_RTC_DRV_DS1511=3Dy
> CONFIG_RTC_DRV_DS1553=3Dy
> CONFIG_RTC_DRV_DS1685_FAMILY=3Dy
> # CONFIG_RTC_DRV_DS1685 is not set
> # CONFIG_RTC_DRV_DS1689 is not set
> # CONFIG_RTC_DRV_DS17285 is not set
> CONFIG_RTC_DRV_DS17485=3Dy
> # CONFIG_RTC_DRV_DS17885 is not set
> # CONFIG_RTC_DS1685_PROC_REGS is not set
> # CONFIG_RTC_DS1685_SYSFS_REGS is not set
> # CONFIG_RTC_DRV_DS1742 is not set
> # CONFIG_RTC_DRV_DS2404 is not set
> # CONFIG_RTC_DRV_DA9052 is not set
> # CONFIG_RTC_DRV_DA9055 is not set
> CONFIG_RTC_DRV_STK17TA8=3Dy
> CONFIG_RTC_DRV_M48T86=3Dy
> CONFIG_RTC_DRV_M48T35=3Dy
> CONFIG_RTC_DRV_M48T59=3Dy
> # CONFIG_RTC_DRV_MSM6242 is not set
> CONFIG_RTC_DRV_BQ4802=3Dy
> CONFIG_RTC_DRV_RP5C01=3Dy
> CONFIG_RTC_DRV_V3020=3Dy
> CONFIG_RTC_DRV_WM831X=3Dy
> CONFIG_RTC_DRV_WM8350=3Dy
> CONFIG_RTC_DRV_PCF50633=3Dy
> =

> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_PCAP=3Dy
> CONFIG_RTC_DRV_MC13XXX=3Dy
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_DMADEVICES=3Dy
> CONFIG_DMADEVICES_DEBUG=3Dy
> CONFIG_DMADEVICES_VDEBUG=3Dy
> =

> #
> # DMA Devices
> #
> CONFIG_INTEL_MIC_X100_DMA=3Dy
> CONFIG_INTEL_IOATDMA=3Dy
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dy
> CONFIG_DW_DMAC_PCI=3Dy
> CONFIG_HSU_DMA=3Dy
> CONFIG_HSU_DMA_PCI=3Dy
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> # CONFIG_DMATEST is not set
> CONFIG_DMA_ENGINE_RAID=3Dy
> CONFIG_DCA=3Dy
> # CONFIG_AUXDISPLAY is not set
> CONFIG_UIO=3Dy
> CONFIG_UIO_CIF=3Dy
> CONFIG_UIO_PDRV_GENIRQ=3Dy
> CONFIG_UIO_DMEM_GENIRQ=3Dy
> CONFIG_UIO_AEC=3Dy
> CONFIG_UIO_SERCOS3=3Dy
> CONFIG_UIO_PCI_GENERIC=3Dy
> CONFIG_UIO_NETX=3Dy
> CONFIG_UIO_PRUSS=3Dy
> CONFIG_UIO_MF624=3Dy
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> =

> #
> # Virtio drivers
> #
> # CONFIG_VIRTIO_PCI is not set
> CONFIG_VIRTIO_BALLOON=3Dy
> CONFIG_VIRTIO_INPUT=3Dy
> CONFIG_VIRTIO_MMIO=3Dy
> CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dy
> # CONFIG_HYPERV_BALLOON is not set
> =

> #
> # Xen driver support
> #
> # CONFIG_XEN_BALLOON is not set
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XEN_BACKEND=3Dy
> CONFIG_XENFS=3Dy
> CONFIG_XEN_COMPAT_XENFS=3Dy
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dy
> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_TMEM=3Dy
> CONFIG_XEN_PCIDEV_BACKEND=3Dy
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_ACPI_PROCESSOR=3Dy
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> CONFIG_STAGING=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_PANEL=3Dy
> CONFIG_PANEL_PARPORT=3D0
> CONFIG_PANEL_PROFILE=3D5
> CONFIG_PANEL_CHANGE_MESSAGE=3Dy
> CONFIG_PANEL_BOOT_MESSAGE=3D""
> =

> #
> # IIO staging drivers
> #
> =

> #
> # Accelerometers
> #
> CONFIG_ADIS16201=3Dy
> CONFIG_ADIS16203=3Dy
> CONFIG_ADIS16204=3Dy
> # CONFIG_ADIS16209 is not set
> # CONFIG_ADIS16220 is not set
> # CONFIG_ADIS16240 is not set
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
> # CONFIG_AD7280 is not set
> =

> #
> # Analog digital bi-direction converters
> #
> # CONFIG_ADT7316 is not set
> =

> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> CONFIG_AD7152=3Dy
> # CONFIG_AD7746 is not set
> =

> #
> # Direct Digital Synthesis
> #
> CONFIG_AD9832=3Dy
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
> # CONFIG_TSL2583 is not set
> CONFIG_TSL2x7x=3Dy
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
> CONFIG_ADE7753=3Dy
> CONFIG_ADE7754=3Dy
> CONFIG_ADE7758=3Dy
> CONFIG_ADE7759=3Dy
> # CONFIG_ADE7854 is not set
> =

> #
> # Resolver to digital converters
> #
> CONFIG_AD2S90=3Dy
> # CONFIG_AD2S1200 is not set
> # CONFIG_AD2S1210 is not set
> =

> #
> # Triggers - standalone
> #
> CONFIG_IIO_PERIODIC_RTC_TRIGGER=3Dy
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> # CONFIG_FB_SM7XX is not set
> # CONFIG_FB_SM750 is not set
> # CONFIG_FB_XGI is not set
> CONFIG_FT1000=3Dy
> # CONFIG_FT1000_PCMCIA is not set
> =

> #
> # Speakup console speech
> #
> CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4=3Dy
> CONFIG_STAGING_MEDIA=3Dy
> =

> #
> # Android
> #
> CONFIG_ASHMEM=3Dy
> CONFIG_ANDROID_TIMED_OUTPUT=3Dy
> CONFIG_ANDROID_TIMED_GPIO=3Dy
> CONFIG_ANDROID_LOW_MEMORY_KILLER=3Dy
> # CONFIG_SYNC is not set
> # CONFIG_ION is not set
> # CONFIG_WIMAX_GDM72XX is not set
> # CONFIG_MTD_SPINAND_MT29F is not set
> # CONFIG_DGNC is not set
> # CONFIG_DGAP is not set
> CONFIG_GS_FPGABOOT=3Dy
> CONFIG_CRYPTO_SKEIN=3Dy
> # CONFIG_UNISYSSPAR is not set
> # CONFIG_FB_TFT is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> # CONFIG_ACER_WMI is not set
> CONFIG_ACERHDF=3Dy
> CONFIG_ALIENWARE_WMI=3Dy
> CONFIG_ASUS_LAPTOP=3Dy
> # CONFIG_DELL_LAPTOP is not set
> # CONFIG_DELL_WMI is not set
> CONFIG_DELL_WMI_AIO=3Dy
> CONFIG_DELL_SMO8800=3Dy
> # CONFIG_FUJITSU_LAPTOP is not set
> CONFIG_FUJITSU_TABLET=3Dy
> # CONFIG_HP_ACCEL is not set
> CONFIG_HP_WIRELESS=3Dy
> # CONFIG_HP_WMI is not set
> # CONFIG_PANASONIC_LAPTOP is not set
> CONFIG_THINKPAD_ACPI=3Dy
> # CONFIG_THINKPAD_ACPI_ALSA_SUPPORT is not set
> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> CONFIG_THINKPAD_ACPI_DEBUG=3Dy
> CONFIG_THINKPAD_ACPI_UNSAFE_LEDS=3Dy
> # CONFIG_THINKPAD_ACPI_VIDEO is not set
> # CONFIG_THINKPAD_ACPI_HOTKEY_POLL is not set
> CONFIG_SENSORS_HDAPS=3Dy
> # CONFIG_INTEL_MENLOW is not set
> CONFIG_ACPI_WMI=3Dy
> CONFIG_MSI_WMI=3Dy
> # CONFIG_TOPSTAR_LAPTOP is not set
> # CONFIG_ACPI_TOSHIBA is not set
> CONFIG_TOSHIBA_BT_RFKILL=3Dy
> CONFIG_TOSHIBA_HAPS=3Dy
> CONFIG_ACPI_CMPC=3Dy
> CONFIG_INTEL_IPS=3Dy
> CONFIG_IBM_RTL=3Dy
> CONFIG_SAMSUNG_LAPTOP=3Dy
> CONFIG_MXM_WMI=3Dy
> # CONFIG_SAMSUNG_Q10 is not set
> CONFIG_APPLE_GMUX=3Dy
> CONFIG_INTEL_RST=3Dy
> CONFIG_INTEL_SMARTCONNECT=3Dy
> CONFIG_PVPANIC=3Dy
> CONFIG_INTEL_PMC_IPC=3Dy
> CONFIG_CHROME_PLATFORMS=3Dy
> CONFIG_CHROMEOS_PSTORE=3Dy
> CONFIG_CROS_EC_CHARDEV=3Dy
> CONFIG_CROS_EC_LPC=3Dy
> CONFIG_CROS_EC_PROTO=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> =

> #
> # Common Clock Framework
> #
> CONFIG_COMMON_CLK_WM831X=3Dy
> CONFIG_COMMON_CLK_SI5351=3Dy
> # CONFIG_COMMON_CLK_PXA is not set
> CONFIG_COMMON_CLK_CDCE706=3Dy
> =

> #
> # Hardware Spinlock drivers
> #
> =

> #
> # Clock Source drivers
> #
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
> CONFIG_ALTERA_MBOX=3Dy
> # CONFIG_IOMMU_SUPPORT is not set
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
> # CONFIG_SUNXI_SRAM is not set
> CONFIG_SOC_TI=3Dy
> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
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
> CONFIG_HID_SENSOR_ACCEL_3D=3Dy
> # CONFIG_IIO_ST_ACCEL_3AXIS is not set
> CONFIG_KXSD9=3Dy
> CONFIG_MMA8452=3Dy
> CONFIG_KXCJK1013=3Dy
> CONFIG_MMA9551_CORE=3Dy
> # CONFIG_MMA9551 is not set
> CONFIG_MMA9553=3Dy
> # CONFIG_STK8312 is not set
> CONFIG_STK8BA50=3Dy
> =

> #
> # Analog to digital converters
> #
> CONFIG_AD_SIGMA_DELTA=3Dy
> # CONFIG_AD7266 is not set
> CONFIG_AD7291=3Dy
> CONFIG_AD7298=3Dy
> # CONFIG_AD7476 is not set
> # CONFIG_AD7791 is not set
> CONFIG_AD7793=3Dy
> CONFIG_AD7887=3Dy
> CONFIG_AD7923=3Dy
> # CONFIG_AD799X is not set
> # CONFIG_DA9150_GPADC is not set
> CONFIG_CC10001_ADC=3Dy
> # CONFIG_MAX1027 is not set
> CONFIG_MAX1363=3Dy
> # CONFIG_MCP320X is not set
> CONFIG_MCP3422=3Dy
> CONFIG_NAU7802=3Dy
> CONFIG_QCOM_SPMI_IADC=3Dy
> # CONFIG_QCOM_SPMI_VADC is not set
> CONFIG_TI_ADC081C=3Dy
> CONFIG_TI_ADC128S052=3Dy
> =

> #
> # Amplifiers
> #
> CONFIG_AD8366=3Dy
> =

> #
> # Hid Sensor IIO Common
> #
> CONFIG_HID_SENSOR_IIO_COMMON=3Dy
> CONFIG_HID_SENSOR_IIO_TRIGGER=3Dy
> =

> #
> # SSP Sensor Common
> #
> # CONFIG_IIO_SSP_SENSORHUB is not set
> CONFIG_IIO_ST_SENSORS_I2C=3Dy
> CONFIG_IIO_ST_SENSORS_SPI=3Dy
> CONFIG_IIO_ST_SENSORS_CORE=3Dy
> =

> #
> # Digital to analog converters
> #
> # CONFIG_AD5064 is not set
> # CONFIG_AD5360 is not set
> CONFIG_AD5380=3Dy
> CONFIG_AD5421=3Dy
> CONFIG_AD5446=3Dy
> CONFIG_AD5449=3Dy
> # CONFIG_AD5504 is not set
> CONFIG_AD5624R_SPI=3Dy
> # CONFIG_AD5686 is not set
> CONFIG_AD5755=3Dy
> # CONFIG_AD5764 is not set
> CONFIG_AD5791=3Dy
> CONFIG_AD7303=3Dy
> # CONFIG_M62332 is not set
> # CONFIG_MAX517 is not set
> CONFIG_MCP4725=3Dy
> # CONFIG_MCP4922 is not set
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
> # CONFIG_ADIS16080 is not set
> CONFIG_ADIS16130=3Dy
> CONFIG_ADIS16136=3Dy
> CONFIG_ADIS16260=3Dy
> # CONFIG_ADXRS450 is not set
> CONFIG_BMG160=3Dy
> # CONFIG_HID_SENSOR_GYRO_3D is not set
> CONFIG_IIO_ST_GYRO_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_GYRO_SPI_3AXIS=3Dy
> CONFIG_ITG3200=3Dy
> =

> #
> # Humidity sensors
> #
> # CONFIG_DHT11 is not set
> # CONFIG_SI7005 is not set
> # CONFIG_SI7020 is not set
> =

> #
> # Inertial measurement units
> #
> # CONFIG_ADIS16400 is not set
> # CONFIG_ADIS16480 is not set
> CONFIG_KMX61=3Dy
> CONFIG_INV_MPU6050_IIO=3Dy
> CONFIG_IIO_ADIS_LIB=3Dy
> CONFIG_IIO_ADIS_LIB_BUFFER=3Dy
> =

> #
> # Light sensors
> #
> # CONFIG_ACPI_ALS is not set
> # CONFIG_ADJD_S311 is not set
> CONFIG_AL3320A=3Dy
> # CONFIG_APDS9300 is not set
> CONFIG_BH1750=3Dy
> # CONFIG_CM32181 is not set
> # CONFIG_CM3232 is not set
> CONFIG_CM3323=3Dy
> CONFIG_CM36651=3Dy
> CONFIG_GP2AP020A00F=3Dy
> CONFIG_ISL29125=3Dy
> CONFIG_HID_SENSOR_ALS=3Dy
> CONFIG_HID_SENSOR_PROX=3Dy
> # CONFIG_JSA1212 is not set
> CONFIG_SENSORS_LM3533=3Dy
> CONFIG_LTR501=3Dy
> CONFIG_STK3310=3Dy
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
> # CONFIG_AK09911 is not set
> # CONFIG_MAG3110 is not set
> # CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
> CONFIG_MMC35240=3Dy
> CONFIG_IIO_ST_MAGN_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_I2C_3AXIS=3Dy
> CONFIG_IIO_ST_MAGN_SPI_3AXIS=3Dy
> CONFIG_BMC150_MAGN=3Dy
> =

> #
> # Inclinometer sensors
> #
> # CONFIG_HID_SENSOR_INCLINOMETER_3D is not set
> # CONFIG_HID_SENSOR_DEVICE_ROTATION is not set
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
> CONFIG_BMP280=3Dy
> # CONFIG_HID_SENSOR_PRESS is not set
> CONFIG_MPL115=3Dy
> CONFIG_MPL3115=3Dy
> # CONFIG_MS5611 is not set
> CONFIG_IIO_ST_PRESS=3Dy
> CONFIG_IIO_ST_PRESS_I2C=3Dy
> CONFIG_IIO_ST_PRESS_SPI=3Dy
> # CONFIG_T5403 is not set
> =

> #
> # Lightning sensors
> #
> CONFIG_AS3935=3Dy
> =

> #
> # Proximity sensors
> #
> # CONFIG_SX9500 is not set
> =

> #
> # Temperature sensors
> #
> CONFIG_MLX90614=3Dy
> # CONFIG_TMP006 is not set
> CONFIG_NTB=3Dy
> CONFIG_NTB_INTEL=3Dy
> CONFIG_NTB_PINGPONG=3Dy
> # CONFIG_NTB_TOOL is not set
> CONFIG_NTB_TRANSPORT=3Dy
> # CONFIG_VME_BUS is not set
> # CONFIG_PWM is not set
> CONFIG_IPACK_BUS=3Dy
> # CONFIG_BOARD_TPCI200 is not set
> # CONFIG_SERIAL_IPOCTAL is not set
> CONFIG_RESET_CONTROLLER=3Dy
> CONFIG_FMC=3Dy
> CONFIG_FMC_FAKEDEV=3Dy
> # CONFIG_FMC_TRIVIAL is not set
> CONFIG_FMC_WRITE_EEPROM=3Dy
> CONFIG_FMC_CHARDEV=3Dy
> =

> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=3Dy
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> CONFIG_BCM_KONA_USB2_PHY=3Dy
> # CONFIG_POWERCAP is not set
> # CONFIG_MCB is not set
> CONFIG_THUNDERBOLT=3Dy
> =

> #
> # Android
> #
> CONFIG_ANDROID=3Dy
> CONFIG_ANDROID_BINDER_IPC=3Dy
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dy
> CONFIG_EDD_OFF=3Dy
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DELL_RBU=3Dy
> CONFIG_DCDBAS=3Dy
> CONFIG_ISCSI_IBFT_FIND=3Dy
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_FS_POSIX_ACL is not set
> CONFIG_EXPORTFS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FSNOTIFY=3Dy
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> # CONFIG_QUOTA_NETLINK_INTERFACE is not set
> # CONFIG_PRINT_QUOTA_WARNING is not set
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_FUSE_FS=3Dy
> CONFIG_CUSE=3Dy
> CONFIG_OVERLAY_FS=3Dy
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dy
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> # CONFIG_PROC_PAGE_MONITOR is not set
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> # CONFIG_TMPFS_POSIX_ACL is not set
> # CONFIG_TMPFS_XATTR is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ECRYPT_FS is not set
> CONFIG_JFFS2_FS=3Dy
> CONFIG_JFFS2_FS_DEBUG=3D0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> # CONFIG_JFFS2_SUMMARY is not set
> CONFIG_JFFS2_FS_XATTR=3Dy
> # CONFIG_JFFS2_FS_POSIX_ACL is not set
> CONFIG_JFFS2_FS_SECURITY=3Dy
> CONFIG_JFFS2_COMPRESSION_OPTIONS=3Dy
> CONFIG_JFFS2_ZLIB=3Dy
> CONFIG_JFFS2_LZO=3Dy
> CONFIG_JFFS2_RTIME=3Dy
> CONFIG_JFFS2_RUBIN=3Dy
> CONFIG_JFFS2_CMODE_NONE=3Dy
> # CONFIG_JFFS2_CMODE_PRIORITY is not set
> # CONFIG_JFFS2_CMODE_SIZE is not set
> # CONFIG_JFFS2_CMODE_FAVOURLZO is not set
> CONFIG_UBIFS_FS=3Dy
> # CONFIG_UBIFS_FS_ADVANCED_COMPR is not set
> CONFIG_UBIFS_FS_LZO=3Dy
> CONFIG_UBIFS_FS_ZLIB=3Dy
> # CONFIG_LOGFS is not set
> CONFIG_ROMFS_FS=3Dy
> CONFIG_ROMFS_BACKED_BY_MTD=3Dy
> CONFIG_ROMFS_ON_MTD=3Dy
> # CONFIG_PSTORE is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"iso8859-1"
> # CONFIG_NLS_CODEPAGE_437 is not set
> # CONFIG_NLS_CODEPAGE_737 is not set
> CONFIG_NLS_CODEPAGE_775=3Dy
> CONFIG_NLS_CODEPAGE_850=3Dy
> CONFIG_NLS_CODEPAGE_852=3Dy
> CONFIG_NLS_CODEPAGE_855=3Dy
> CONFIG_NLS_CODEPAGE_857=3Dy
> CONFIG_NLS_CODEPAGE_860=3Dy
> CONFIG_NLS_CODEPAGE_861=3Dy
> CONFIG_NLS_CODEPAGE_862=3Dy
> CONFIG_NLS_CODEPAGE_863=3Dy
> # CONFIG_NLS_CODEPAGE_864 is not set
> CONFIG_NLS_CODEPAGE_865=3Dy
> CONFIG_NLS_CODEPAGE_866=3Dy
> # CONFIG_NLS_CODEPAGE_869 is not set
> # CONFIG_NLS_CODEPAGE_936 is not set
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
> CONFIG_NLS_ISO8859_6=3Dy
> CONFIG_NLS_ISO8859_7=3Dy
> # CONFIG_NLS_ISO8859_9 is not set
> # CONFIG_NLS_ISO8859_13 is not set
> CONFIG_NLS_ISO8859_14=3Dy
> CONFIG_NLS_ISO8859_15=3Dy
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> # CONFIG_NLS_MAC_CENTEURO is not set
> CONFIG_NLS_MAC_CROATIAN=3Dy
> CONFIG_NLS_MAC_CYRILLIC=3Dy
> # CONFIG_NLS_MAC_GAELIC is not set
> CONFIG_NLS_MAC_GREEK=3Dy
> # CONFIG_NLS_MAC_ICELAND is not set
> CONFIG_NLS_MAC_INUIT=3Dy
> # CONFIG_NLS_MAC_ROMANIAN is not set
> # CONFIG_NLS_MAC_TURKISH is not set
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
> CONFIG_FRAME_WARN=3D2048
> # CONFIG_STRIP_ASM_SYMS is not set
> CONFIG_READABLE_ASM=3Dy
> CONFIG_UNUSED_SYMBOLS=3Dy
> CONFIG_PAGE_OWNER=3Dy
> CONFIG_DEBUG_FS=3Dy
> CONFIG_HEADERS_CHECK=3Dy
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
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
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SLUB_DEBUG_ON=3Dy
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> CONFIG_DEBUG_VM=3Dy
> CONFIG_DEBUG_VM_VMACACHE=3Dy
> CONFIG_DEBUG_VM_RB=3Dy
> CONFIG_DEBUG_VIRTUAL=3Dy
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=3Dy
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_HAVE_ARCH_KMEMCHECK=3Dy
> CONFIG_HAVE_ARCH_KASAN=3Dy
> # CONFIG_KASAN is not set
> # CONFIG_DEBUG_SHIRQ is not set
> =

> #
> # Debug Lockups and Hangs
> #
> # CONFIG_LOCKUP_DETECTOR is not set
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=3Dy
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D1
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=3D0
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_SCHED_DEBUG=3Dy
> # CONFIG_SCHED_INFO is not set
> # CONFIG_SCHEDSTATS is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_TIMEKEEPING=3Dy
> CONFIG_TIMER_STATS=3Dy
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> # CONFIG_DEBUG_RT_MUTEXES is not set
> CONFIG_DEBUG_SPINLOCK=3Dy
> CONFIG_DEBUG_MUTEXES=3Dy
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=3Dy
> CONFIG_DEBUG_LOCK_ALLOC=3Dy
> CONFIG_PROVE_LOCKING=3Dy
> CONFIG_LOCKDEP=3Dy
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> CONFIG_TRACE_IRQFLAGS=3Dy
> CONFIG_STACKTRACE=3Dy
> # CONFIG_DEBUG_KOBJECT is not set
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PI_LIST is not set
> # CONFIG_DEBUG_SG is not set
> CONFIG_DEBUG_NOTIFIERS=3Dy
> CONFIG_DEBUG_CREDENTIALS=3Dy
> =

> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=3Dy
> CONFIG_PROVE_RCU_REPEATEDLY=3Dy
> # CONFIG_SPARSE_RCU_POINTER is not set
> # CONFIG_TORTURE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D21
> CONFIG_RCU_TRACE=3Dy
> # CONFIG_RCU_EQS_DEBUG is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAILSLAB is not set
> CONFIG_FAIL_PAGE_ALLOC=3Dy
> # CONFIG_FAIL_MMC_REQUEST is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> # CONFIG_LATENCYTOP is not set
> CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_FP_TEST=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
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
> # CONFIG_FUNCTION_GRAPH_TRACER is not set
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_TRACE_BRANCH_PROFILING=3Dy
> # CONFIG_BRANCH_PROFILE_NONE is not set
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_PROFILE_ALL_BRANCHES=3Dy
> CONFIG_TRACING_BRANCHES=3Dy
> CONFIG_BRANCH_TRACER=3Dy
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_UPROBE_EVENT is not set
> # CONFIG_PROBE_EVENTS is not set
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> # CONFIG_FTRACE_STARTUP_TEST is not set
> CONFIG_MMIOTRACE=3Dy
> CONFIG_TRACEPOINT_BENCHMARK=3Dy
> # CONFIG_RING_BUFFER_BENCHMARK is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> CONFIG_TRACE_ENUM_MAP_FILE=3Dy
> =

> #
> # Runtime Testing
> #
> CONFIG_TEST_LIST_SORT=3Dy
> # CONFIG_BACKTRACE_SELF_TEST is not set
> CONFIG_RBTREE_TEST=3Dy
> # CONFIG_ATOMIC64_SELFTEST is not set
> CONFIG_TEST_HEXDUMP=3Dy
> CONFIG_TEST_STRING_HELPERS=3Dy
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
> CONFIG_BUILD_DOCSRC=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> CONFIG_TEST_FIRMWARE=3Dy
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_STRICT_DEVMEM=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> # CONFIG_EARLY_PRINTK is not set
> CONFIG_X86_PTDUMP=3Dy
> CONFIG_DEBUG_RODATA=3Dy
> # CONFIG_DEBUG_RODATA_TEST is not set
> # CONFIG_DOUBLEFAULT is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_IOMMU_DEBUG=3Dy
> # CONFIG_IOMMU_STRESS is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_IO_DELAY_TYPE_0X80=3D0
> CONFIG_IO_DELAY_TYPE_0XED=3D1
> CONFIG_IO_DELAY_TYPE_UDELAY=3D2
> CONFIG_IO_DELAY_TYPE_NONE=3D3
> # CONFIG_IO_DELAY_0X80 is not set
> CONFIG_IO_DELAY_0XED=3Dy
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEFAULT_IO_DELAY_TYPE=3D1
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> CONFIG_OPTIMIZE_INLINING=3Dy
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> CONFIG_X86_DEBUG_STATIC_CPU_HAS=3Dy
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_BIG_KEYS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> # CONFIG_ENCRYPTED_KEYS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=3Dy
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITYFS=3Dy
> # CONFIG_SECURITY_NETWORK is not set
> CONFIG_SECURITY_PATH=3Dy
> # CONFIG_SECURITY_TOMOYO is not set
> # CONFIG_SECURITY_APPARMOR is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_YAMA_STACKED is not set
> CONFIG_INTEGRITY=3Dy
> # CONFIG_INTEGRITY_SIGNATURE is not set
> # CONFIG_IMA is not set
> # CONFIG_EVM is not set
> CONFIG_DEFAULT_SECURITY_YAMA=3Dy
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_DEFAULT_SECURITY=3D"yama"
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
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> # CONFIG_CRYPTO_USER is not set
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_WORKQUEUE=3Dy
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_MCRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dy
> CONFIG_CRYPTO_ABLK_HELPER=3Dy
> CONFIG_CRYPTO_GLUE_HELPER_X86=3Dy
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dy
> # CONFIG_CRYPTO_GCM is not set
> # CONFIG_CRYPTO_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dy
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> # CONFIG_CRYPTO_CTS is not set
> # CONFIG_CRYPTO_ECB is not set
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
> CONFIG_CRYPTO_CRC32=3Dy
> # CONFIG_CRYPTO_CRC32_PCLMUL is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dy
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dy
> CONFIG_CRYPTO_MD4=3Dy
> # CONFIG_CRYPTO_MD5 is not set
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_RMD128=3Dy
> CONFIG_CRYPTO_RMD160=3Dy
> # CONFIG_CRYPTO_RMD256 is not set
> # CONFIG_CRYPTO_RMD320 is not set
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> # CONFIG_CRYPTO_SHA512_SSSE3 is not set
> CONFIG_CRYPTO_SHA1_MB=3Dy
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_TGR192=3Dy
> # CONFIG_CRYPTO_WP512 is not set
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dy
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> CONFIG_CRYPTO_AES_X86_64=3Dy
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dy
> CONFIG_CRYPTO_ARC4=3Dy
> CONFIG_CRYPTO_BLOWFISH=3Dy
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dy
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA=3Dy
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dy
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_CAST_COMMON=3Dy
> CONFIG_CRYPTO_CAST5=3Dy
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dy
> CONFIG_CRYPTO_CAST6=3Dy
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dy
> CONFIG_CRYPTO_DES=3Dy
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dy
> CONFIG_CRYPTO_FCRYPT=3Dy
> # CONFIG_CRYPTO_KHAZAD is not set
> CONFIG_CRYPTO_SALSA20=3Dy
> # CONFIG_CRYPTO_SALSA20_X86_64 is not set
> # CONFIG_CRYPTO_CHACHA20 is not set
> CONFIG_CRYPTO_SEED=3Dy
> CONFIG_CRYPTO_SERPENT=3Dy
> # CONFIG_CRYPTO_SERPENT_SSE2_X86_64 is not set
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dy
> # CONFIG_CRYPTO_SERPENT_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dy
> # CONFIG_CRYPTO_TWOFISH is not set
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dy
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dy
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dy
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> # CONFIG_CRYPTO_ZLIB is not set
> CONFIG_CRYPTO_LZO=3Dy
> CONFIG_CRYPTO_842=3Dy
> CONFIG_CRYPTO_LZ4=3Dy
> # CONFIG_CRYPTO_LZ4HC is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dy
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> # CONFIG_CRYPTO_USER_API_HASH is not set
> # CONFIG_CRYPTO_USER_API_SKCIPHER is not set
> # CONFIG_CRYPTO_USER_API_RNG is not set
> # CONFIG_CRYPTO_USER_API_AEAD is not set
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dy
> # CONFIG_CRYPTO_DEV_PADLOCK_SHA is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DD is not set
> CONFIG_CRYPTO_DEV_QAT=3Dy
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dy
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> # CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set
> # CONFIG_PUBLIC_KEY_ALGO_RSA is not set
> CONFIG_HAVE_KVM=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> # CONFIG_KVM is not set
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
> CONFIG_PERCPU_RWSEM=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dy
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> CONFIG_CRC32_SLICEBY4=3Dy
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC7=3Dy
> CONFIG_LIBCRC32C=3Dy
> CONFIG_CRC8=3Dy
> # CONFIG_AUDIT_ARCH_COMPAT_GENERIC is not set
> CONFIG_RANDOM32_SELFTEST=3Dy
> CONFIG_842_COMPRESS=3Dy
> CONFIG_842_DECOMPRESS=3Dy
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_COMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dy
> CONFIG_REED_SOLOMON_DEC16=3Dy
> CONFIG_BCH=3Dy
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DQL=3Dy
> CONFIG_NLATTR=3Dy
> CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=3Dy
> # CONFIG_AVERAGE is not set
> CONFIG_CLZ_TAB=3Dy
> CONFIG_CORDIC=3Dy
> # CONFIG_DDR is not set
> CONFIG_MPILIB=3Dy
> CONFIG_ARCH_HAS_SG_CHAIN=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy


--===============7021584629535096915==--

