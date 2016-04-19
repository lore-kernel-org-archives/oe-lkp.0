Content-Type: multipart/mixed; boundary="===============2551795699342308314=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [test] 265bbb5704: BUG: unable to handle kernel paging request at e8e04dec
Date: Tue, 19 Apr 2016 10:29:38 +0800
Message-ID: <20160419022938.GB24067@wfg-t540p.sh.intel.com>
In-Reply-To: <CAB=NE6Xz8Dp8+ZA2JXOTuhx+HO=H1bDHKm74N+iF_1e1VcBB=g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2551795699342308314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Luis, thank you for the feedback!

Xiaolong/Philip, would you help have a check?

Thanks,
Fengguang

On Sun, Apr 17, 2016 at 07:00:59PM -0700, Luis R. Rodriguez wrote:
> I've been making some changes to fix this before posting patches, and
> pushed a few branches out to kernel.org a few days ago now but haven't ev=
en
> heard of a build status which typically has taken about ~3 hours or so.
> =

> Now I haven't heard from 0-day for a few days about build / tun time stat=
us
> of a few branches I've pushed out both on my linux.git and linux-next.git
> and starting to wonder if there may be an issue or real long term
> maintenance thing going on ? The sysdata branches also had a timout occur
> on one build so wondering if perhaps there are rules that put your trees =
or
> branches in a dark corner to avoid delays in 0-day ?
> =

> How do I check to make sure I'm OK ?
> =

>   Luis
> On Apr 14, 2016 3:12 AM, "kernel test robot" <xiaolong.ye@intel.com> wr=
ote:
> =

> FYI, we noticed that kernel panic due to "BUG: unable to handle kernel
> paging request at e8e04dec"
> with your commit.
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git
> 20160412-sysdata-v1
> commit 265bbb5704d63eac3bdf81fe28b566b572a10d89 ("test: add sysdata loader
> tester")
> =

> =

> [    4.716154] Driver for 1-wire Dallas network protocol.
> [    5.108702] f71882fg: Not a Fintek device
> [    5.109238] f71882fg: Not a Fintek device
> [    5.496811] BUG: unable to handle kernel paging request at e8e04dec
> [    5.497564] IP: [<c13bff9e>] kobject_get+0xe/0xb0
> [    5.498132] *pdpt =3D 000000000209c001 *pde =3D 0000000000000000
> [    5.498782] Oops: 0000 [#1] PREEMPT SMP
> [    5.499216] Modules linked in:
> [    5.499587] CPU: 0 PID: 25 Comm: kworker/0:1 Not tainted
> 4.6.0-rc3-next-20160412-00002-g265bbb5 #261
> [    5.500565] Workqueue: events do_init_work
> [    5.501030] task: ca034000 ti: ca036000 task.ti: ca036000
> [    5.501608] EIP: 0060:[<c13bff9e>] EFLAGS: 00010286 CPU: 0
> [    5.502232] EIP is at kobject_get+0xe/0xb0
> [    5.502677] EAX: e8e04dcc EBX: e8e04dcc ECX: 00000000 EDX: 00000000
> [    5.503363] ESI: cb8365c0 EDI: 00000000 EBP: ca037de8 ESP: ca037dcc
> [    5.504050]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [    5.504636] CR0: 80050033 CR2: e8e04dec CR3: 0209f000 CR4: 000006b0
> [    5.505314] Stack:
> [    5.505550]  c193f43f cb8365b8 cb8365c0 00000000 00000000 e8e04dc4
> cb8365c0 ca037e2c
> [    5.506507]  c14d311d ffffffff 00000000 ca037e10 c11c2673 c118fc9d
> c013cd40 cb8365c0
> [    5.507450]  cb8365b8 ca037e18 c118fc9d ca037e2c c13c08ba 00000000
> cb8365c0 cb8365b8
> [    5.508400] Call Trace:
> [    5.508704]  [<c193f43f>] ? klist_init+0x2f/0x50
> [    5.509220]  [<c14d311d>] device_add+0xdd/0x650
> [    5.509738]  [<c11c2673>] ? kfree+0x93/0x280
> [    5.510232]  [<c118fc9d>] ? kfree_const+0x1d/0x30
> [    5.510740]  [<c118fc9d>] ? kfree_const+0x1d/0x30
> [    5.511252]  [<c13c08ba>] ? kobject_set_name_vargs+0x6a/0xa0
> [    5.511865]  [<c14d3897>] device_create_groups_vargs+0xe7/0x100
> [    5.512504]  [<c14d393f>] device_create_with_groups+0x2f/0x40
> [    5.513146]  [<c14c5e23>] misc_register+0x163/0x1b0
> [    5.513685]  [<c13dc44d>] do_init_work+0x4d/0xd0
> [    5.514214]  [<c1085994>] process_one_work+0x2c4/0x950
> [    5.514768]  [<c10858a7>] ? process_one_work+0x1d7/0x950
> [    5.515359]  [<c108639a>] worker_thread+0x37a/0x640
> [    5.515908]  [<c1086020>] ? process_one_work+0x950/0x950
> [    5.516477]  [<c108c011>] kthread+0xa1/0xc0
> [    5.516951]  [<c194af09>] ret_from_kernel_thread+0x21/0x38
> [    5.517546]  [<c108bf70>] ? kthread_unpark+0x50/0x50
> [    5.518112] Code: 54 cd c1 89 55 f8 e8 2e 79 da ff e8 ba d2 ff ff 8b 55
> f8 eb 9f b8 08 54 cd c1 eb c1 90 55 89 e5 56 53 89 c3 83 ec 14 85 c0 74 38
> <f6> 40 20 01 74 6c b8 01 00 00 00 3e 0f c1 43 1c 8d 70 01 31 c9
> [    5.521217] EIP: [<c13bff9e>] kobject_get+0xe/0xb0 SS:ESP 0068:ca037dcc
> [    5.522006] CR2: 00000000e8e04dec
> [    5.522383] ---[ end trace e8742962ac65bac4 ]---
> [    5.522897] Kernel panic - not syncing: Fatal exception
> =

> =

> FYI, raw QEMU command line is:
> =

>         qemu-system-i386 -enable-kvm -kernel
> /pkg/linux/i386-randconfig-i0-201615/gcc-5/265bbb5704d63eac3bdf81fe28b566=
b572a10d89/vmlinuz-4.6.0-rc3-next-20160412-00002-g265bbb5
> -append 'root=3D/dev/ram0 user=3Dlkp
> job=3D/lkp/scheduled/vm-lkp-wsx03-openwrt-i386-20/rand_boot-1-openwrt-i38=
6.cgz-i386-randconfig-i0-201615-265bbb5704d63eac3bdf81fe28b566b572a10d89-20=
160413-23967-gfd6wz-0.yaml
> ARCH=3Di386 kconfig=3Di386-randconfig-i0-201615
> branch=3Dmcgrof-next/20160412-sysdata-v1
> commit=3D265bbb5704d63eac3bdf81fe28b566b572a10d89
> BOOT_IMAGE=3D/pkg/linux/i386-randconfig-i0-201615/gcc-5/265bbb5704d63eac3=
bdf81fe28b566b572a10d89/vmlinuz-4.6.0-rc3-next-20160412-00002-g265bbb5
> max_uptime=3D600
> RESULT_ROOT=3D/result/boot/1/vm-lkp-wsx03-openwrt-i386/openwrt-i386.cgz/i=
386-randconfig-i0-201615/gcc-5/265bbb5704d63eac3bdf81fe28b566b572a10d89/0
> LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3Derr debug
> apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 pa=
nic=3D-1
> softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw
> ip=3D::::vm-lkp-wsx03-openwrt-i386-20::dhcp drbd.minor_count=3D8'  -initrd
> /fs/sdc1/initrd-vm-lkp-wsx03-openwrt-i386-20 -m 192 -smp 1 -device
> e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -w=
atchdog
> i6300esb -rtc base=3Dlocaltime -drive
> file=3D/fs/sdc1/disk0-vm-lkp-wsx03-openwrt-i386-20,media=3Ddisk,if=3Dvirt=
io
> -drive
> file=3D/fs/sdc1/disk1-vm-lkp-wsx03-openwrt-i386-20,media=3Ddisk,if=3Dvirt=
io
> -pidfile /dev/shm/kboot/pid-vm-lkp-wsx03-openwrt-i386-20 -serial
> file:/dev/shm/kboot/serial-vm-lkp-wsx03-openwrt-i386-20 -daemonize -displ=
ay
> none -monitor null
> =

> =

> =

> =

> =

> Thanks,
> Xiaolong Ye

> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============2551795699342308314==--

