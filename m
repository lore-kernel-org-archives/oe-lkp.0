Content-Type: multipart/mixed; boundary="===============8883806731741913169=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [usb] 9696ef14de: WARNING: CPU: 0 PID: 1 at lib/list_debug.c:36 __list_add+0x104/0x188
Date: Wed, 13 Jul 2016 10:55:25 +0800
Message-ID: <20160713025524.GF25851@yexl-desktop>
In-Reply-To: <HE1PR04MB14506FDCA1AA7E4AFBCA9F6E8B310@HE1PR04MB1450.eurprd04.prod.outlook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8883806731741913169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 01:55:26AM +0000, Peter Chen wrote:
> =

>
>>-----Original Message-----
>>From: lkp-request(a)eclists.intel.com [mailto:lkp-request(a)eclists.intel=
.com] On Behalf
>>Of kernel test robot
>>Sent: Wednesday, July 13, 2016 9:28 AM
>>To: Peter Chen <peter.chen@nxp.com>
>>Cc: 0day robot <fengguang.wu@intel.com>; LKML <linux-kernel@vger.kern=
el.org>;
>>lkp(a)01.org
>>Subject: [lkp] [usb] 9696ef14de: WARNING: CPU: 0 PID: 1 at lib/list_debug=
.c:36
>>__list_add+0x104/0x188
>>
>>
>>FYI, we noticed the following commit:
>>
>>https://github.com/0day-ci/linux Peter-Chen/usb-udc-core-fix-error-
>>handling/20160711-100832
>>commit 9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2 ("usb: udc: core: fix err=
or
>>handling")
>>
>
>Thanks,  but I really can't find the relationship between my patch and dum=
p.
>Can you reproduce it after running again or without my patch?
>

Sorry, it's a false report, the error dump also showed in parent commit,
please ignore the report and sorry for the noise.

Thanks,
Xiaolong

>Peter
>
>>in testcase: boot
>>
>>on test machine: 2 threads qemu-system-x86_64 -enable-kvm -cpu Nehalem wi=
th
>>320M memory
>>
>>caused below changes:
>>
>>[   22.076363] WARNING: CPU: 0 PID: 1 at lib/list_debug.c:36
>>__list_add+0x104/0x188
>>[   22.079911] list_add double add: new=3Dffff88000e422e10, prev=3Dffff88=
000e422e10,
>>next=3Dffff8800135e9168.
>>[   22.086059] CPU: 0 PID: 1 Comm: swapper Tainted: G        W       4.7.=
0-rc4-
>>00110-g9696ef1 #1
>>[   22.087856] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
>>Debian-1.8.2-1 04/01/2014
>>[   22.097535]  0000000000000000 ffff88001345fc00 ffffffff8190c8e2
>>ffff88001345fc40
>>[   22.099469]  ffffffff81175453 0000002400000009 ffff88000e422e10
>>ffff8800135e9168
>>[   22.101220]  ffff88000e422e10 0000000000000000 0000000000000001
>>ffff88001345fca8
>>[   22.103291] Call Trace:
>>[   22.109166]  [<ffffffff8190c8e2>] dump_stack+0x19/0x1b
>>[   22.110520]  [<ffffffff81175453>] __warn+0x10a/0x125
>>[   22.111632]  [<ffffffff811754b4>] warn_slowpath_fmt+0x46/0x4e
>>[   22.112939]  [<ffffffff82860938>] ? klist_add_tail+0x29/0x62
>>[   22.114418]  [<ffffffff8194b431>] __list_add+0x104/0x188
>>[   22.115600]  [<ffffffff82860962>] klist_add_tail+0x53/0x62
>>[   22.118742]  [<ffffffff81bd24e7>] device_add+0xb03/0xcca
>>[   22.121931]  [<ffffffff81bd283e>] device_create_groups_vargs+0xfe/0x133
>>[   22.123390]  [<ffffffff81bd28e7>] device_create_with_groups+0x2b/0x2d
>>[   22.130047]  [<ffffffff82871904>] ? __mutex_unlock_slowpath+0x1cb/0x1d8
>>[   22.131513]  [<ffffffff81b909eb>] misc_register+0x1e0/0x2ec
>>[   22.132751]  [<ffffffff85292b08>] mousedev_init+0x55/0x81
>>[   22.134198]  [<ffffffff85292ab3>] ? input_leds_init+0x12/0x12
>>[   22.135442]  [<ffffffff8522b831>] do_one_initcall+0xdc/0x16a
>>[   22.139131]  [<ffffffff8522bc46>] kernel_init_freeable+0x387/0x419
>>[   22.142059]  [<ffffffff8286183b>] kernel_init+0xa/0x103
>>[   22.144618]  [<ffffffff828778bf>] ret_from_fork+0x1f/0x40
>>[   22.148576]  [<ffffffff82861831>] ? rest_init+0xb8/0xb8
>>[   22.150009] ---[ end trace 75873bca450a4fe4 ]---
>>[   22.151559] mousedev: PS/2 mouse device common for all mice
>>[   22.155003] evbug: Connected device: input0 (Power Button at
>>LNXPWRBN/button/input0)
>>
>>
>>FYI, raw QEMU command line is:
>>
>>	qemu-system-x86_64 -enable-kvm -cpu Nehalem -kernel /pkg/linux/x86_64-
>>randconfig-s0-07121340/gcc-
>>6/9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2/vmlinuz-4.7.0-rc4-00110-g9696e=
f1
>>-append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-intel12-yoct=
o-x86_64-
>>3/bisect_boot-1-yocto-minimal-x86_64.cgz-x86_64-randconfig-s0-07121340-
>>9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2-20160712-19858-1j3k6zi-0.yaml
>>ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s0-07121340 branch=3Dlinux-deve=
l/devel-
>>hourly-2016071211 commit=3D9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2
>>BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s0-07121340/gcc-
>>6/9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2/vmlinuz-4.7.0-rc4-00110-g9696e=
f1
>>max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-intel12-yocto-x86_64/yoc=
to-
>>minimal-x86_64.cgz/x86_64-randconfig-s0-07121340/gcc-
>>6/9696ef14ded07fb0847f8e1cdda6d98a89ecd4f2/0 LKP_SERVER=3Dinn
>>earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug apic=3Ddebug
>>sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1
>>softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
>>prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw =
ip=3D::::vm-
>>intel12-yocto-x86_64-3::dhcp drbd.minor_count=3D8'  -initrd /fs/KVM/initr=
d-vm-intel12-
>>yocto-x86_64-3 -m 320 -smp 2 -device e1000,netdev=3Dnet0 -netdev user,id=
=3Dnet0 -
>>boot order=3Dnc -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -drive
>>file=3D/fs/KVM/disk0-vm-intel12-yocto-x86_64-3,media=3Ddisk,if=3Dvirtio -=
drive
>>file=3D/fs/KVM/disk1-vm-intel12-yocto-x86_64-3,media=3Ddisk,if=3Dvirtio -=
pidfile
>>/dev/shm/kboot/pid-vm-intel12-yocto-x86_64-3 -serial file:/dev/shm/kboot/=
serial-vm-
>>intel12-yocto-x86_64-3 -daemonize -display none -monitor null
>>
>>
>>
>>
>>
>>Thanks,
>>Xiaolong

--===============8883806731741913169==--

