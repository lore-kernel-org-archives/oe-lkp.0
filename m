Content-Type: multipart/mixed; boundary="===============8500409310532910439=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: 8700e3e7c4: BUG: unable to handle kernel NULL pointer dereference at 000001fc
Date: Wed, 17 Aug 2016 08:18:26 -0700
Message-ID: <8760qza0fx.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <f269bdd2-6213-eb9c-a224-a05daeb3ee7a@mellanox.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8500409310532910439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Yonatan Cohen <yonatanc@mellanox.com> writes:

>> -----Original Message-----
>> From: lkp-request(a)eclists.intel.com [mailto:lkp-request(a)eclists.inte=
l.com] On Behalf Of kernel test robot
>> Sent: Monday, August 15, 2016 7:40 AM
>> To: Moni Shoua <monis@mellanox.com>
>> Cc: Doug Ledford <dledford@redhat.com>; Kamal Heib
>> <kamalh@mellanox.com>; Amir Vadai (revoke on 17.10.15)
>> <amirv@mellanox.com>; Haggai Eran <haggaie@mellanox.com>; LKML
>> <linux-kernel@vger.kernel.org>; Linus Torvalds
>> <torvalds@linux-foundation.org>; lkp(a)01.org
>> Subject: [lkp] 8700e3e7c4: BUG: unable to handle kernel NULL pointer der=
eference at 000001fc
>>
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git maste=
r commit 8700e3e7c4857d28ebaa824509934556da0b3e76 ("Soft RoCE driver")
>>
>> in testcase: boot
>>
>> on test machine: 1 threads qemu-system-i386 -enable-kvm with 256M memory
>>
>> caused below changes:
>>
>>
>> +-----------------------------------------------------+----------+------=
------+
>> |                                                     | v4.7-rc4 |
>> | 8700e3e7c4 |
>> +-----------------------------------------------------+----------+------=
------+
>> | boot_successes                                      | 15       | 0    =
      |
>> | boot_failures                                       | 10       | 18   =
      |
>> | invoked_oom-killer:gfp_mask=3D0x                      | 1        |    =
        |
>> | Mem-Info                                            | 1        |      =
      |
>> | INFO:task_blocked_for_more_than#seconds             | 2        |      =
      |
>> | EIP_is_at__default_send_IPI_dest_field              | 2        |      =
      |
>> | Kernel_panic-not_syncing:hung_task:blocked_tasks    | 2        |      =
      |
>> | backtrace:torture_shuffle                           | 2        |      =
      |
>> | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 7        |      =
      |
>> | backtrace:mark_rodata_ro                            | 7        |      =
      |
>> | BUG:unable_to_handle_kernel                         | 0        | 18   =
      |
>> | Oops                                                | 0        | 18   =
      |
>> | EIP_is_at_setup_udp_tunnel_sock                     | 0        | 18   =
      |
>> | Kernel_panic-not_syncing:Fatal_exception            | 0        | 18   =
      |
>> | backtrace:rxe_net_init                              | 0        | 18   =
      |
>> | backtrace:rxe_module_init                           | 0        | 18   =
      |
>> | backtrace:kernel_init_freeable                      | 0        | 18   =
      |
>> +-----------------------------------------------------+----------+------=
------+
>>
>>
>>
>> [   46.816381] usnic_verbs:usnic_uiom_init:581: IOMMU required but not p=
resent or enabled.  USNIC QPs will not function w/o enabling IOMMU
>> [   46.835874] usnic_verbs:usnic_ib_init:647: Unable to initalize umem w=
ith err -1
>> [   46.864766] iscsi: registered transport (iser)
>> [   46.884623] BUG: unable to handle kernel NULL pointer dereference at =
000001fc
>> [   46.888632] IP: [<c220705a>] setup_udp_tunnel_sock+0x6/0x4f
>> [   46.891355] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53
>> [   46.893918] Oops: 0002 [#1] PREEMPT
>> [   46.896014] CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0-rc4-00001-g=
8700e3e #1
>> [   46.900280] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BI=
OS Debian-1.8.2-1 04/01/2014
>> [   46.904905] task: cf06c040 ti: cf05e000 task.ti: cf05e000
>> [   46.907854] EIP: 0060:[<c220705a>] EFLAGS: 00210246 CPU: 0
>> [   46.911137] EIP is at setup_udp_tunnel_sock+0x6/0x4f
>> [   46.914070] EAX: 00000044 EBX: 00000001 ECX: cf05fef0 EDX: ca8142e0
>> [   46.917236] ESI: c2c4505b EDI: cf05fef0 EBP: cf05fed0 ESP: cf05fed0
>> [   46.919836]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
>> [   46.922046] CR0: 80050033 CR2: 000001fc CR3: 02cec000 CR4: 000006b0
>> [   46.924550] Stack:
>> [   46.926014]  cf05ff10 c1fd4657 ca8142e0 0000000a 00000000 00000000 00=
00b712 00000008
>> [   46.931274]  00000000 6bb5bd01 c1fd48de 00000000 00000000 cf05ff1c 00=
000000 00000000
>> [   46.936122]  cf05ff1c c1fd4bdf 00000000 cf05ff28 c2c4507b ffffffff cf=
05ff88 c2bf1c74
>> [   46.942350] Call Trace:
>> [   46.944403]  [<c1fd4657>] rxe_setup_udp_tunnel+0x8f/0x99
>> [   46.947689]  [<c1fd48de>] ? net_to_rxe+0x4e/0x4e
>> [   46.950567]  [<c1fd4bdf>] rxe_net_init+0xe/0xa4
>> [   46.953147]  [<c2c4507b>] rxe_module_init+0x20/0x4c
>> [   46.955448]  [<c2bf1c74>] do_one_initcall+0x89/0x113
>> [   46.957797]  [<c2bf15eb>] ? set_debug_rodata+0xf/0xf
>> [   46.959966]  [<c2bf1dbc>] ? kernel_init_freeable+0xbe/0x15b
>> [   46.962262]  [<c2bf1ddc>] kernel_init_freeable+0xde/0x15b
>> [   46.964418]  [<c232eb54>] kernel_init+0x8/0xd0
>> [   46.966618]  [<c2333122>] ret_from_kernel_thread+0xe/0x24
>> [   46.969592]  [<c232eb4c>] ? rest_init+0x6f/0x6f
>> [ 46.973288] Code: 80 04 f7 ff c7 06 00 00 00 00 89 d8 8b 75 f0 65
>> 33 35 14 00 00 00 74 05 e8 3a 1f e6 fe 8d 65 f4 5b 5e 5f 5d c3 55 8b
>> 42 14 89 e5 <80> a0 b8 01 00 00 ef fe 80 bb 01 00 00 8b 11 89 90 60
>> 01 00 00
>> [   46.991320] EIP: [<c220705a>] setup_udp_tunnel_sock+0x6/0x4f SS:ESP 0=
068:cf05fed0
>> [   46.995035] CR2: 00000000000001fc
>> [   46.996817] ---[ end trace 1be5f94d2ecf9b78 ]---
>> [   47.001073] Kernel panic - not syncing: Fatal exception
>>
>>
>> FYI, raw QEMU command line is:
>>
>> 	qemu-system-i386 -enable-kvm -kernel
>> /pkg/linux/i386-randconfig-c0-08121125/gcc-4.9/8700e3e7c4857d28ebaa82450=
9934556da0b3e76/vmlinuz-4.7.0-rc4-00001-g8700e3e
>> -append 'ip=3D::::vm-intel12-openwrt-i386-1::dhcp root=3D/dev/ram0
>> user=3Dlkp
>> job=3D/lkp/scheduled/vm-intel12-openwrt-i386-1/boot-1-openwrt-i386.cgz-8=
700e3e7c4857d28ebaa824509934556da0b3e76-20160812-54756-6to0wa-0.yaml
>> ARCH=3Di386 kconfig=3Di386-randconfig-c0-08121125 branch=3Dlinus/master
>> commit=3D8700e3e7c4857d28ebaa824509934556da0b3e76
>> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-c0-08121125/gcc-4.9/8700e3e7c485=
7d28ebaa824509934556da0b3e76/vmlinuz-4.7.0-rc4-00001-g8700e3e
>> max_uptime=3D600
>> RESULT_ROOT=3D/result/boot/1/vm-intel12-openwrt-i386/openwrt-i386.cgz/i3=
86-randconfig-c0-08121125/gcc-4.9/8700e3e7c4857d28ebaa824509934556da0b3e76/0
>> LKP_SERVER=3Dinn debug apic=3Ddebug sysrq_always_enabled
>> rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1
>> nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0
>> systemd.log_level=3Derr ignore_loglevel ea
> rlyprintk=3DttyS0,115200 console=3DttyS0,115200 console=3Dtty0 vga=3Dnorm=
al rw
> drbd.minor_count=3D8' -initrd /fs/KVM/initrd-vm-intel12-openwrt-i386-1
> -m 256 -smp 1 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot
> order=3Dnc -no-reboot -watchdog i6300esb -watchdog-action debug -rtc
> base=3Dlocaltime -drive
> file=3D/fs/KVM/disk0-vm-intel12-openwrt-i386-1,media=3Ddisk,if=3Dvirtio
> -drive
> file=3D/fs/KVM/disk1-vm-intel12-openwrt-i386-1,media=3Ddisk,if=3Dvirtio
> -pidfile /dev/shm/kboot/pid-vm-intel12-openwrt-i386-1 -serial
> file:/dev/shm/kboot/serial-vm-intel12-openwrt-i386-1 -daemonize
> -display none -monitor null
>>
>>
>>
>>
>>
>> Thanks,
>> Xiaolong
>>
> can you please provide more info to help reproduced this crash  ?
> on which operating system did this happen ?
> which HCA device was the rxe device attached to ? mlx4 or mlx5 ?
> thanks

The test is done in virtual machine.  And it failed during boot stage,
so I think the root file system is not relevant.  And there are no rxe
device in the virtual machine.  So I guess your driver init code may not
run properly when compiled builtin and without the real device.

Best Regards,
Huang, Ying

--===============8500409310532910439==--

