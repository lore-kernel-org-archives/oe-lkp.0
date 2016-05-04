Content-Type: multipart/mixed; boundary="===============8203814309978003986=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: [serial] 13a7238eea: WARNING: CPU: 0 PID: 1 at drivers/tty/serial/serial_core.c:99 uart_change_pm+0x35/0x162
Date: Tue, 03 May 2016 20:34:00 -0700
Message-ID: <57296DA8.20502@hurleysoftware.com>
In-Reply-To: <20160504031311.GA4373@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8203814309978003986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 05/03/2016 08:13 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
> commit 13a7238eeab5718bf968e2a835205ba659a38a77 ("serial: core: Prevent u=
nsafe uart port access, part 3")

This should be fixed on most recent tty-testing and tty-next branches.

Please re-test on last tty-testing branch including commit 7da4b8b7378790dd=
1e4af1bb7522863127fa1438
("serial: core: Fix port mutex assert if lockdep disabled")

Regards,
Peter Hurley


> on test machine: vm-vp-quantal-x86_64: 2 threads qemu-system-x86_64 -enab=
le-kvm with 360M memory
> =

> caused below changes:
> =

> =

> [    7.249323] ------------[ cut here ]------------
> [    7.249323] ------------[ cut here ]------------
> [    7.250172] WARNING: CPU: 0 PID: 1 at drivers/tty/serial/serial_core.c=
:99 uart_change_pm+0x35/0x162
> [    7.250172] WARNING: CPU: 0 PID: 1 at drivers/tty/serial/serial_core.c=
:99 uart_change_pm+0x35/0x162
> [    7.252110] Modules linked in:
> [    7.252110] Modules linked in:
> =

> [    7.252679] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.=
6.0-rc5-00015-g13a7238 #1
> [    7.252679] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B           4.=
6.0-rc5-00015-g13a7238 #1
> [    7.254232] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    7.254232] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    7.255806]  0000000000000000
> [    7.255806]  0000000000000000 ffff88000f42f668 ffff88000f42f668 ffffff=
ff815a2566 ffffffff815a2566 0000000000000286 0000000000000286
> =

> [    7.257180]  0000000041b58ab3
> [    7.257180]  0000000041b58ab3 ffffffff81f66067 ffffffff81f66067 ffffff=
ff815a240c ffffffff815a240c ffffffff81f7647d ffffffff81f7647d
> =

> [    7.258601]  ffffffff81238abf
> [    7.258601]  ffffffff81238abf 000000000042f6a8 000000000042f6a8 ffffed=
0001e85ecb ffffed0001e85ecb 0000000000000000 0000000000000000
> =

> [    7.259973] Call Trace:
> [    7.259973] Call Trace:
> [    7.260422]  [<ffffffff815a2566>] dump_stack+0x15a/0x1de
> [    7.260422]  [<ffffffff815a2566>] dump_stack+0x15a/0x1de
> [    7.261374]  [<ffffffff815a240c>] ? _atomic_dec_and_lock+0xaf/0xaf
> [    7.261374]  [<ffffffff815a240c>] ? _atomic_dec_and_lock+0xaf/0xaf
> [    7.262470]  [<ffffffff81238abf>] ? is_module_text_address+0x1f/0x1f
> [    7.262470]  [<ffffffff81238abf>] ? is_module_text_address+0x1f/0x1f
> [    7.263595]  [<ffffffff817af33b>] ? uart_change_pm+0x35/0x162
> [    7.263595]  [<ffffffff817af33b>] ? uart_change_pm+0x35/0x162
> [    7.264623]  [<ffffffff8110d1fc>] __warn+0x16e/0x189
> [    7.264623]  [<ffffffff8110d1fc>] __warn+0x16e/0x189
> [    7.265523]  [<ffffffff8110d37a>] warn_slowpath_null+0x18/0x1a
> [    7.265523]  [<ffffffff8110d37a>] warn_slowpath_null+0x18/0x1a
> [    7.266561]  [<ffffffff817af33b>] uart_change_pm+0x35/0x162
> [    7.266561]  [<ffffffff817af33b>] uart_change_pm+0x35/0x162
> [    7.267553]  [<ffffffff817b6ba1>] uart_add_one_port+0xb36/0x1008
> [    7.267553]  [<ffffffff817b6ba1>] uart_add_one_port+0xb36/0x1008
> [    7.268637]  [<ffffffff817b606b>] ? uart_unregister_driver+0x150/0x150
> [    7.268637]  [<ffffffff817b606b>] ? uart_unregister_driver+0x150/0x150
> [    7.269786]  [<ffffffff81b45c0e>] ? mutex_trylock+0x4eb/0x4eb
> [    7.269786]  [<ffffffff81b45c0e>] ? mutex_trylock+0x4eb/0x4eb
> [    7.270838]  [<ffffffff817bcba7>] serial8250_register_8250_port+0xf68/=
0x14e5
> [    7.270838]  [<ffffffff817bcba7>] serial8250_register_8250_port+0xf68/=
0x14e5
> [    7.272116]  [<ffffffff817bed3f>] serial_pnp_probe+0x2d8/0x5f1
> [    7.272116]  [<ffffffff817bed3f>] serial_pnp_probe+0x2d8/0x5f1
> [    7.273146]  [<ffffffff817bea67>] ? check_name+0x6e/0x6e
> [    7.273146]  [<ffffffff817bea67>] ? check_name+0x6e/0x6e
> [    7.274125]  [<ffffffff817bea67>] ? check_name+0x6e/0x6e
> [    7.274125]  [<ffffffff817bea67>] ? check_name+0x6e/0x6e
> [    7.275076]  [<ffffffff817625ff>] pnp_device_probe+0x1c1/0x1dc
> [    7.275076]  [<ffffffff817625ff>] pnp_device_probe+0x1c1/0x1dc
> [    7.276109]  [<ffffffff817f3514>] driver_probe_device+0x325/0x63c
> [    7.276109]  [<ffffffff817f3514>] driver_probe_device+0x325/0x63c
> [    7.277191]  [<ffffffff817f382b>] ? driver_probe_device+0x63c/0x63c
> [    7.277191]  [<ffffffff817f382b>] ? driver_probe_device+0x63c/0x63c
> [    7.278299]  [<ffffffff817f3963>] __driver_attach+0x138/0x179
> [    7.278299]  [<ffffffff817f3963>] __driver_attach+0x138/0x179
> [    7.279316]  [<ffffffff817eee66>] bus_for_each_dev+0x10d/0x143
> [    7.279316]  [<ffffffff817eee66>] bus_for_each_dev+0x10d/0x143
> [    7.280372]  [<ffffffff817eed59>] ? next_device+0x52/0x52
> [    7.280372]  [<ffffffff817eed59>] ? next_device+0x52/0x52
> [    7.281334]  [<ffffffff817f27c5>] driver_attach+0x50/0x53
> [    7.281334]  [<ffffffff817f27c5>] driver_attach+0x50/0x53
> [    7.282302]  [<ffffffff817f1cb3>] bus_add_driver+0x31d/0x53e
> [    7.282302]  [<ffffffff817f1cb3>] bus_add_driver+0x31d/0x53e
> [    7.283346]  [<ffffffff817f5063>] driver_register+0x24b/0x2c3
> [    7.283346]  [<ffffffff817f5063>] driver_register+0x24b/0x2c3
> [    7.284370]  [<ffffffff81761ce6>] pnp_register_driver+0x98/0x9f
> [    7.284370]  [<ffffffff81761ce6>] pnp_register_driver+0x98/0x9f
> [    7.285420]  [<ffffffff834431e7>] ? univ8250_console_init+0x28/0x28
> [    7.285420]  [<ffffffff834431e7>] ? univ8250_console_init+0x28/0x28
> [    7.286579]  [<ffffffff817bf068>] serial8250_pnp_init+0x10/0x12
> [    7.286579]  [<ffffffff817bf068>] serial8250_pnp_init+0x10/0x12
> [    7.287635]  [<ffffffff83443259>] serial8250_init+0x72/0x232
> [    7.287635]  [<ffffffff83443259>] serial8250_init+0x72/0x232
> [    7.288650]  [<ffffffff834431e7>] ? univ8250_console_init+0x28/0x28
> [    7.288650]  [<ffffffff834431e7>] ? univ8250_console_init+0x28/0x28
> [    7.289775]  [<ffffffff81000598>] do_one_initcall+0x287/0x36d
> [    7.289775]  [<ffffffff81000598>] do_one_initcall+0x287/0x36d
> [    7.290802]  [<ffffffff81000311>] ? try_to_run_init_process+0x31/0x31
> [    7.290802]  [<ffffffff81000311>] ? try_to_run_init_process+0x31/0x31
> [    7.291954]  [<ffffffff833d900a>] kernel_init_freeable+0x60e/0x6a9
> [    7.291954]  [<ffffffff833d900a>] kernel_init_freeable+0x60e/0x6a9
> [    7.293060]  [<ffffffff81b3e0fd>] kernel_init+0xc/0x11b
> [    7.293060]  [<ffffffff81b3e0fd>] kernel_init+0xc/0x11b
> [    7.293998]  [<ffffffff81b4f6a2>] ret_from_fork+0x22/0x40
> [    7.293998]  [<ffffffff81b4f6a2>] ret_from_fork+0x22/0x40
> [    7.294964]  [<ffffffff81b3e0f1>] ? rest_init+0xe8/0xe8
> [    7.294964]  [<ffffffff81b3e0f1>] ? rest_init+0xe8/0xe8
> [    7.295921] ---[ end trace 3dfe53a1b1117774 ]---
> [    7.295921] ---[ end trace 3dfe53a1b1117774 ]---
> =

> =

> FYI, raw QEMU command line is:
> =

> 	qemu-system-x86_64 -enable-kvm -kernel /pkg/linux/x86_64-randconfig-s0-0=
4291414/gcc-5/13a7238eeab5718bf968e2a835205ba659a38a77/vmlinuz-4.6.0-rc5-00=
015-g13a7238 -append 'root=3D/dev/ram0 user=3Dlkp job=3D/lkp/scheduled/vm-v=
p-quantal-x86_64-44/bisect_boot-1-quantal-core-x86_64.cgz-x86_64-randconfig=
-s0-04291414-13a7238eeab5718bf968e2a835205ba659a38a77-20160429-40248-hp2gqc=
-0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s0-04291414 branch=3Dlinu=
x-devel/devel-spot-201604291342 commit=3D13a7238eeab5718bf968e2a835205ba659=
a38a77 BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-s0-04291414/gcc-5/13a7238e=
eab5718bf968e2a835205ba659a38a77/vmlinuz-4.6.0-rc5-00015-g13a7238 max_uptim=
e=3D600 RESULT_ROOT=3D/result/boot/1/vm-vp-quantal-x86_64/quantal-core-x86_=
64.cgz/x86_64-randconfig-s0-04291414/gcc-5/13a7238eeab5718bf968e2a835205ba6=
59a38a77/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115200 systemd.log_level=3D=
err debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic o
ops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,115200 cons=
ole=3Dtty0 vga=3Dnormal rw ip=3D::::vm-vp-quantal-x86_64-44::dhcp drbd.mino=
r_count=3D8'  -initrd /fs/sdi1/initrd-vm-vp-quantal-x86_64-44 -m 360 -smp 2=
 -device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-re=
boot -watchdog i6300esb -rtc base=3Dlocaltime -pidfile /dev/shm/kboot/pid-v=
m-vp-quantal-x86_64-44 -serial file:/dev/shm/kboot/serial-vm-vp-quantal-x86=
_64-44 -daemonize -display none -monitor null =

> =

> =

> =

> =

> =

> Thanks,
> Xiaolong
> =



--===============8203814309978003986==--

