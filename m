Content-Type: multipart/mixed; boundary="===============8143211851371962684=="
MIME-Version: 1.0
From: William Breathitt Gray <vilhelm.gray@gmail.com>
To: lkp@lists.01.org
Subject: Re: [gpio] 86ea8a95a4: kernel BUG at drivers/base/driver.c:153!
Date: Mon, 30 May 2016 22:44:39 -0400
Message-ID: <20160531024421.GA28112@sophia>
In-Reply-To: <20160531022454.GA4923@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8143211851371962684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 10:24:54AM +0800, kernel test robot wrote:
>
>
>FYI, we noticed the following commit:
>
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>commit 86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e ("gpio: 104-idio-16: Utili=
ze the ISA bus driver")
>
>
>on test machine: vm-vp-quantal-i386: 1 threads qemu-system-i386 -enable-kv=
m -cpu Haswell,+smep,+smap with 360M memory
>
>caused below changes:
>
>
>+------------------------------------------------------------------+------=
------+------------+
>|                                                                  | 72bf7=
443ba | 86ea8a95a4 |
>+------------------------------------------------------------------+------=
------+------------+
>| boot_successes                                                   | 0    =
      | 0          |
>| boot_failures                                                    | 12   =
      | 12         |
>| invoked_oom-killer:gfp_mask=3D0x                                   | 12 =
        |            |
>| Mem-Info                                                         | 12   =
      |            |
>| Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 12   =
      |            |
>| backtrace:btrfs_test_extent_io                                   | 12   =
      |            |
>| backtrace:init_btrfs_fs                                          | 12   =
      |            |
>| backtrace:kernel_init_freeable                                   | 12   =
      | 12         |
>| page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_NORETRY) | 1    =
      |            |
>| warn_alloc_failed+0x                                             | 1    =
      |            |
>| backtrace:ring_buffer_consumer_thread                            | 1    =
      |            |
>| kernel_BUG_at_drivers/base/driver.c                              | 0    =
      | 12         |
>| invalid_opcode:#[##]SMP_DEBUG_PAGEALLOC                          | 0    =
      | 12         |
>| EIP_is_at_driver_register                                        | 0    =
      | 12         |
>| Kernel_panic-not_syncing:Fatal_exception                         | 0    =
      | 12         |
>| backtrace:isa_register_driver                                    | 0    =
      | 12         |
>| backtrace:idio_16_driver_init                                    | 0    =
      | 12         |
>+------------------------------------------------------------------+------=
------+------------+
>
>
>
>[   10.002548] xz_dec_test: module loaded
>[   10.003490] xz_dec_test: Create a device node with 'mknod xz_dec_test c=
 250 0' and write .xz files to it.
>[   10.005742] ------------[ cut here ]------------
>[   10.006773] kernel BUG at drivers/base/driver.c:153!
>[   10.008042] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC =

>[   10.009379] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc4-00031-g=
86ea8a9 #1
>[   10.011155] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS=
 Debian-1.8.2-1 04/01/2014
>[   10.013090] task: d3e6e000 ti: d3e78000 task.ti: d3e78000
>[   10.014213] EIP: 0060:[<c15d8814>] EFLAGS: 00010246 CPU: 0
>[   10.015351] EIP is at driver_register+0x29/0xbc
>[   10.016365] EAX: c1ec186c EBX: c1dea3d8 ECX: 00000000 EDX: 00000001
>[   10.017576] ESI: 00000000 EDI: c9fb9340 EBP: d3e79f00 ESP: d3e79ef8
>[   10.018782]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
>[   10.019897] CR0: 80050033 CR2: 00000000 CR3: 01fed000 CR4: 000406d0
>[   10.021104] Stack:
>[   10.021834]  c1dea3c0 00000000 d3e79f20 c15dedf7 00000286 00000000 0000=
0286 c1f23128
>[   10.024194]  00000000 c9fb9340 d3e79f28 c1f2313b d3e79f84 c1ee7c5b d4d7=
a500 00000000
>[   10.026562]  d3e79f00 c106ee1e 00000000 c1d83ad4 00060006 c1d80bf4 0000=
0259 d4d7a5f8
>[   10.028924] Call Trace:
>[   10.029702]  [<c15dedf7>] isa_register_driver+0x2b/0x11a
>[   10.030806]  [<c1f23128>] ? gpiolib_debugfs_init+0x1f/0x1f
>[   10.031929]  [<c1f2313b>] idio_16_driver_init+0x13/0x15
>[   10.033028]  [<c1ee7c5b>] do_one_initcall+0xf7/0x1a4
>[   10.034092]  [<c106ee1e>] ? parse_args+0x282/0x38b
>[   10.035143]  [<c1ee7e79>] ? kernel_init_freeable+0x171/0x212
>[   10.036287]  [<c1ee7e9c>] kernel_init_freeable+0x194/0x212
>[   10.037418]  [<c1902636>] kernel_init+0xd/0xd5
>[   10.038424]  [<c1909889>] ret_from_kernel_thread+0x21/0x38
>[   10.039547]  [<c1902629>] ? rest_init+0x116/0x116
>[   10.040576] Code: 5d c3 55 89 e5 56 53 3e 8d 74 26 00 31 d2 89 c3 8b 40=
 04 8b 70 48 b8 6c 18 ec c1 85 f6 0f 94 c2 31 c9 e8 08 1c b2 ff 85 f6 75 02=
 <0f> 0b 8b 43 04 83 78 24 00 74 06 83 7b 20 00 75 18 83 78 28 00
>[   10.048568] EIP: [<c15d8814>] driver_register+0x29/0xbc SS:ESP 0068:d3e=
79ef8
>[   10.050047] ---[ end trace 7b29a3068007f652 ]---
>[   10.066206] Kernel panic - not syncing: Fatal exception
>
>
>FYI, raw QEMU command line is:
>
>	qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -kernel /pkg/linux/=
i386-randconfig-x0-05280946/gcc-6/86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e/=
vmlinuz-4.6.0-rc4-00031-g86ea8a9 -append 'root=3D/dev/ram0 user=3Dlkp job=
=3D/lkp/scheduled/vm-vp-quantal-i386-61/bisect_boot-1-quantal-core-i386.cgz=
-i386-randconfig-x0-05280946-86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e-20160=
530-53474-w6nzwk-0.yaml ARCH=3Di386 kconfig=3Di386-randconfig-x0-05280946 b=
ranch=3Dlinux-devel/devel-spot-201605280759 commit=3D86ea8a95a42f752fe0aa1c=
7ad1bfe8ce9be5d30e BOOT_IMAGE=3D/pkg/linux/i386-randconfig-x0-05280946/gcc-=
6/86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e/vmlinuz-4.6.0-rc4-00031-g86ea8a9=
 max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-vp-quantal-i386/quantal-c=
ore-i386.cgz/i386-randconfig-x0-05280946/gcc-6/86ea8a95a42f752fe0aa1c7ad1bf=
e8ce9be5d30e/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_leve=
l=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_time=
out=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic=
 load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 =
vga=3Dnormal rw ip=3D::::vm-vp-quantal-i386-61::dhcp drbd.minor_count=3D8' =
 -initrd /fs/sdd1/initrd-vm-vp-quantal-i386-61 -m 360 -smp 1 -device e1000,=
netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog =
i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-vm-vp-quantal-i3=
86-61 -serial file:/dev/shm/kboot/serial-vm-vp-quantal-i386-61 -daemonize -=
display none -monitor null =

>
>
>
>
>
>Thanks,
>Xiaolong

Hello,

I believe this bug occurs when isa_register_driver is called before
isa_bus_init; this is possible with built-in drivers since isa_bus_init
is registered via device_initcall within the drivers/base/isa.c file.

I submitted a patch addressing this on May 11; see:
https://lkml.org/lkml/2016/5/11/857.

Let me know if this fixes the bug, or if there are any other issues.

Thank you,

William Breathitt Gray

--===============8143211851371962684==--

