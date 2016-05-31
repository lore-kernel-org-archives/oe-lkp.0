Content-Type: multipart/mixed; boundary="===============5469451609082226706=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [gpio] 86ea8a95a4: kernel BUG at drivers/base/driver.c:153!
Date: Tue, 31 May 2016 16:03:53 +0800
Message-ID: <20160531080353.GA11842@yexl-desktop>
In-Reply-To: <20160531024421.GA28112@sophia>
List-Id: <oe-lkp.lists.linux.dev>

--===============5469451609082226706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 30, 2016 at 10:44:39PM -0400, William Breathitt Gray wrote:
>On Tue, May 31, 2016 at 10:24:54AM +0800, kernel test robot wrote:
>>
>>
>>FYI, we noticed the following commit:
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>commit 86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e ("gpio: 104-idio-16: Util=
ize the ISA bus driver")
>>
>>
>>on test machine: vm-vp-quantal-i386: 1 threads qemu-system-i386 -enable-k=
vm -cpu Haswell,+smep,+smap with 360M memory
>>
>>caused below changes:
>>
>>
>>+------------------------------------------------------------------+-----=
-------+------------+
>>|                                                                  | 72bf=
7443ba | 86ea8a95a4 |
>>+------------------------------------------------------------------+-----=
-------+------------+
>>| boot_successes                                                   | 0   =
       | 0          |
>>| boot_failures                                                    | 12  =
       | 12         |
>>| invoked_oom-killer:gfp_mask=3D0x                                   | 12=
         |            |
>>| Mem-Info                                                         | 12  =
       |            |
>>| Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 12  =
       |            |
>>| backtrace:btrfs_test_extent_io                                   | 12  =
       |            |
>>| backtrace:init_btrfs_fs                                          | 12  =
       |            |
>>| backtrace:kernel_init_freeable                                   | 12  =
       | 12         |
>>| page_allocation_failure:order:#,mode:#(GFP_KERNEL|__GFP_NORETRY) | 1   =
       |            |
>>| warn_alloc_failed+0x                                             | 1   =
       |            |
>>| backtrace:ring_buffer_consumer_thread                            | 1   =
       |            |
>>| kernel_BUG_at_drivers/base/driver.c                              | 0   =
       | 12         |
>>| invalid_opcode:#[##]SMP_DEBUG_PAGEALLOC                          | 0   =
       | 12         |
>>| EIP_is_at_driver_register                                        | 0   =
       | 12         |
>>| Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 12         |
>>| backtrace:isa_register_driver                                    | 0   =
       | 12         |
>>| backtrace:idio_16_driver_init                                    | 0   =
       | 12         |
>>+------------------------------------------------------------------+-----=
-------+------------+
>>
>>
>>
>>[   10.002548] xz_dec_test: module loaded
>>[   10.003490] xz_dec_test: Create a device node with 'mknod xz_dec_test =
c 250 0' and write .xz files to it.
>>[   10.005742] ------------[ cut here ]------------
>>[   10.006773] kernel BUG at drivers/base/driver.c:153!
>>[   10.008042] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC =

>>[   10.009379] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc4-00031-=
g86ea8a9 #1
>>[   10.011155] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
>>[   10.013090] task: d3e6e000 ti: d3e78000 task.ti: d3e78000
>>[   10.014213] EIP: 0060:[<c15d8814>] EFLAGS: 00010246 CPU: 0
>>[   10.015351] EIP is at driver_register+0x29/0xbc
>>[   10.016365] EAX: c1ec186c EBX: c1dea3d8 ECX: 00000000 EDX: 00000001
>>[   10.017576] ESI: 00000000 EDI: c9fb9340 EBP: d3e79f00 ESP: d3e79ef8
>>[   10.018782]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
>>[   10.019897] CR0: 80050033 CR2: 00000000 CR3: 01fed000 CR4: 000406d0
>>[   10.021104] Stack:
>>[   10.021834]  c1dea3c0 00000000 d3e79f20 c15dedf7 00000286 00000000 000=
00286 c1f23128
>>[   10.024194]  00000000 c9fb9340 d3e79f28 c1f2313b d3e79f84 c1ee7c5b d4d=
7a500 00000000
>>[   10.026562]  d3e79f00 c106ee1e 00000000 c1d83ad4 00060006 c1d80bf4 000=
00259 d4d7a5f8
>>[   10.028924] Call Trace:
>>[   10.029702]  [<c15dedf7>] isa_register_driver+0x2b/0x11a
>>[   10.030806]  [<c1f23128>] ? gpiolib_debugfs_init+0x1f/0x1f
>>[   10.031929]  [<c1f2313b>] idio_16_driver_init+0x13/0x15
>>[   10.033028]  [<c1ee7c5b>] do_one_initcall+0xf7/0x1a4
>>[   10.034092]  [<c106ee1e>] ? parse_args+0x282/0x38b
>>[   10.035143]  [<c1ee7e79>] ? kernel_init_freeable+0x171/0x212
>>[   10.036287]  [<c1ee7e9c>] kernel_init_freeable+0x194/0x212
>>[   10.037418]  [<c1902636>] kernel_init+0xd/0xd5
>>[   10.038424]  [<c1909889>] ret_from_kernel_thread+0x21/0x38
>>[   10.039547]  [<c1902629>] ? rest_init+0x116/0x116
>>[   10.040576] Code: 5d c3 55 89 e5 56 53 3e 8d 74 26 00 31 d2 89 c3 8b 4=
0 04 8b 70 48 b8 6c 18 ec c1 85 f6 0f 94 c2 31 c9 e8 08 1c b2 ff 85 f6 75 0=
2 <0f> 0b 8b 43 04 83 78 24 00 74 06 83 7b 20 00 75 18 83 78 28 00
>>[   10.048568] EIP: [<c15d8814>] driver_register+0x29/0xbc SS:ESP 0068:d3=
e79ef8
>>[   10.050047] ---[ end trace 7b29a3068007f652 ]---
>>[   10.066206] Kernel panic - not syncing: Fatal exception
>>
>>
>>FYI, raw QEMU command line is:
>>
>>	qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap -kernel /pkg/linux=
/i386-randconfig-x0-05280946/gcc-6/86ea8a95a42f752fe0aa1c7ad1bfe8ce9be5d30e=
/vmlinuz-4.6.0-rc4-00031-g86ea8a9 -append 'root=3D/dev/ram0 user=3Dlkp job=
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

>>
>>
>>
>>
>>
>>Thanks,
>>Xiaolong
>
>Hello,
>
>I believe this bug occurs when isa_register_driver is called before
>isa_bus_init; this is possible with built-in drivers since isa_bus_init
>is registered via device_initcall within the drivers/base/isa.c file.
>
>I submitted a patch addressing this on May 11; see:
>https://lkml.org/lkml/2016/5/11/857.

Hi, William =


Just verified your fix patch on top of commit: 86ea8a95a("gpio:
104-idio-16: Utilize the ISA bus driver"), kernel BUG hasn't been
triggered during boot test.

Thanks,
Xiaolong

>
>Let me know if this fixes the bug, or if there are any other issues.
>
>Thank you,
>
>William Breathitt Gray

--===============5469451609082226706==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
AgAAAAAEWVo=
--===============5469451609082226706==--

