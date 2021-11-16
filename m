Content-Type: multipart/mixed; boundary="===============0619080706068948625=="
MIME-Version: 1.0
From: Hans de Goede <hdegoede@redhat.com>
To: lkp@lists.01.org
Subject: Re: [device property] 995fe757ec: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 16 Nov 2021 15:55:00 +0100
Message-ID: <f54546b1-b0dc-c2bc-3a5f-bcdaf35297fc@redhat.com>
In-Reply-To: <20211116074104.GC32102@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0619080706068948625==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On 11/16/21 08:41, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with gcc-9):
> =

> commit: 995fe757ecaeac44e023458af64d27655f9dbf73 ("[PATCH] device propert=
y: Check fwnode->secondary when finding properties")
> url: https://github.com/0day-ci/linux/commits/Daniel-Scally/device-proper=
ty-Check-fwnode-secondary-when-finding-properties/20211114-044259
> base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/driver-core.git=
 b5013d084e03e82ceeab4db8ae8ceeaebe76b0eb
> patch link: https://lore.kernel.org/lkml/20211113204141.520924-1-djrscall=
y(a)gmail.com
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------+------------+------------+
> |                                             | b5013d084e | 995fe757ec |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 23         | 0          |
> | boot_failures                               | 0          | 22         |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 22         |
> | Oops:#[##]                                  | 0          | 22         |
> | EIP:fwnode_property_get_reference_args      | 0          | 22         |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 22         |
> +---------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>

Ok, so this patch likely needs a v2 which changes the if to this:

        if (ret =3D=3D -EINVAL && !IS_ERR_OR_NULL(fwnode) &&
            !IS_ERR_OR_NULL(fwnode->secondary))
                ret =3D fwnode_call_int_op(fwnode->secondary, get_reference=
_args,
                                         prop, nargs_prop, nargs, index, ar=
gs);


So that we check fwnode before dereferencing it, note this also changes the
(ret < 0) check to (ret =3D=3D -EINVAL), this makes the secondary node hand=
ling
identical to fwnode_property_read_int_array() and
fwnode_property_read_string_array()

Danny, can you send a v2 with this change please?

Regards,

Hans






> =

> =

> [   17.327851][    T7] BUG: kernel NULL pointer dereference, address: 000=
00000
> [   17.329758][    T7] #PF: supervisor read access in kernel mode
> [   17.331371][    T7] #PF: error_code(0x0000) - not-present page
> [   17.332992][    T7] *pde =3D 00000000
> [   17.334107][    T7] Oops: 0000 [#1] PREEMPT
> [   17.335310][    T7] CPU: 0 PID: 7 Comm: kworker/u2:0 Tainted: G S     =
           5.15.0-11191-g995fe757ecae #1
> [   17.338036][    T7] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.12.0-1 04/01/2014
> [   17.340544][    T7] Workqueue: events_unbound deferred_probe_work_func
> [ 17.342291][ T7] EIP: fwnode_property_get_reference_args (drivers/base/p=
roperty.c:486 (discriminator 1)) =

> [ 17.344051][ T7] Code: 8b 45 0c 50 8b 45 08 50 89 d8 89 55 f4 ff d6 83 c=
4 0c 89 c6 85 c0 78 55 8d 65 f8 89 f0 5b 5e 5d c3 8d 74 26 00 be fa ff ff f=
f <8b> 03 85 c0 74 e8 3d 00 f0 ff ff 77 e1 8b 58 04 85 db 74 37 8b 5b
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 45 0c             	mov    0xc(%rbp),%eax
>    3:	50                   	push   %rax
>    4:	8b 45 08             	mov    0x8(%rbp),%eax
>    7:	50                   	push   %rax
>    8:	89 d8                	mov    %ebx,%eax
>    a:	89 55 f4             	mov    %edx,-0xc(%rbp)
>    d:	ff d6                	callq  *%rsi
>    f:	83 c4 0c             	add    $0xc,%esp
>   12:	89 c6                	mov    %eax,%esi
>   14:	85 c0                	test   %eax,%eax
>   16:	78 55                	js     0x6d
>   18:	8d 65 f8             	lea    -0x8(%rbp),%esp
>   1b:	89 f0                	mov    %esi,%eax
>   1d:	5b                   	pop    %rbx
>   1e:	5e                   	pop    %rsi
>   1f:	5d                   	pop    %rbp
>   20:	c3                   	retq   =

>   21:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>   25:	be fa ff ff ff       	mov    $0xfffffffa,%esi
>   2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
>   2c:	85 c0                	test   %eax,%eax
>   2e:	74 e8                	je     0x18
>   30:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>   35:	77 e1                	ja     0x18
>   37:	8b 58 04             	mov    0x4(%rax),%ebx
>   3a:	85 db                	test   %ebx,%ebx
>   3c:	74 37                	je     0x75
>   3e:	8b                   	.byte 0x8b
>   3f:	5b                   	pop    %rbx
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 03                	mov    (%rbx),%eax
>    2:	85 c0                	test   %eax,%eax
>    4:	74 e8                	je     0xffffffffffffffee
>    6:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>    b:	77 e1                	ja     0xffffffffffffffee
>    d:	8b 58 04             	mov    0x4(%rax),%ebx
>   10:	85 db                	test   %ebx,%ebx
>   12:	74 37                	je     0x4b
>   14:	8b                   	.byte 0x8b
>   15:	5b                   	pop    %rbx
> [   17.350847][    T7] EAX: 00000000 EBX: 00000000 ECX: 00000000 EDX: c37=
cd6d8
> [   17.352783][    T7] ESI: ffffffea EDI: f5b5a400 EBP: c4cffd24 ESP: c4c=
ffd14
> [   17.354673][    T7] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010246
> [   17.362075][    T7] CR0: 80050033 CR2: 00000000 CR3: 04206000 CR4: 000=
00690
> [   17.363993][    T7] Call Trace:
> [ 17.365018][ T7] fwnode_find_reference (drivers/base/property.c:514) =

> [ 17.366430][ T7] ? __this_cpu_preempt_check (lib/smp_processor_id.c:67) =

> [ 17.367825][ T7] ? lockdep_init_map_type (kernel/locking/lockdep.c:4813) =

> [ 17.369325][ T7] ? phylink_run_resolve+0x20/0x20 =

> [ 17.370897][ T7] ? init_timer_key (kernel/time/timer.c:818) =

> [ 17.372228][ T7] fwnode_get_phy_node (drivers/net/phy/phy_device.c:2986) =

> [ 17.373574][ T7] phylink_fwnode_phy_connect (drivers/net/phy/phylink.c:1=
180 drivers/net/phy/phylink.c:1166) =

> [ 17.375014][ T7] phylink_of_phy_connect (drivers/net/phy/phylink.c:1152) =

> [ 17.376373][ T7] dsa_slave_create (net/dsa/slave.c:1889 net/dsa/slave.c:=
2036) =

> [ 17.377765][ T7] dsa_tree_setup_switches (net/dsa/dsa2.c:477 net/dsa/dsa=
2.c:977) =

> [ 17.379282][ T7] dsa_register_switch (net/dsa/dsa2.c:1065 net/dsa/dsa2.c=
:1565 net/dsa/dsa2.c:1579) =

> [ 17.380762][ T7] dsa_loop_drv_probe (drivers/net/dsa/dsa_loop.c:333) =

> [ 17.382137][ T7] mdio_probe (drivers/net/phy/mdio_device.c:157) =

> [ 17.383362][ T7] really_probe (drivers/base/dd.c:744) =

> [ 17.384808][ T7] really_probe (drivers/base/dd.c:678) =

> [ 17.385999][ T7] __driver_probe_device (drivers/base/dd.c:751) =

> [ 17.387393][ T7] driver_probe_device (drivers/base/dd.c:781) =

> [ 17.388787][ T7] __device_attach_driver (drivers/base/dd.c:899) =

> [ 17.390253][ T7] ? driver_allows_async_probing (drivers/base/dd.c:867) =

> [ 17.391829][ T7] bus_for_each_drv (drivers/base/bus.c:427) =

> [ 17.393226][ T7] __device_attach (drivers/base/dd.c:969) =

> [ 17.394610][ T7] ? driver_allows_async_probing (drivers/base/dd.c:867) =

> [ 17.396270][ T7] device_initial_probe (drivers/base/dd.c:1017) =

> [ 17.397637][ T7] bus_probe_device (drivers/base/bus.c:487) =

> [ 17.398907][ T7] deferred_probe_work_func (drivers/base/dd.c:123) =

> [ 17.400385][ T7] process_one_work (arch/x86/include/asm/jump_label.h:41 =
include/linux/jump_label.h:212 include/trace/events/workqueue.h:108 kernel/=
workqueue.c:2303) =

> [ 17.401834][ T7] worker_thread (include/linux/list.h:282 kernel/workqueu=
e.c:2358 kernel/workqueue.c:2450) =

> [ 17.403204][ T7] kthread (kernel/kthread.c:327) =

> [ 17.404417][ T7] ? process_one_work (kernel/workqueue.c:2388) =

> [ 17.405766][ T7] ? set_kthread_struct (kernel/kthread.c:272) =

> [ 17.407168][ T7] ret_from_fork (arch/x86/entry/entry_32.S:775) =

> [   17.408421][    T7] Modules linked in:
> [   17.409637][    T7] CR2: 0000000000000000
> [   17.410743][    T7] ---[ end trace f8ecb8c3f56e69be ]---
> [ 17.412229][ T7] EIP: fwnode_property_get_reference_args (drivers/base/p=
roperty.c:486 (discriminator 1)) =

> [ 17.414104][ T7] Code: 8b 45 0c 50 8b 45 08 50 89 d8 89 55 f4 ff d6 83 c=
4 0c 89 c6 85 c0 78 55 8d 65 f8 89 f0 5b 5e 5d c3 8d 74 26 00 be fa ff ff f=
f <8b> 03 85 c0 74 e8 3d 00 f0 ff ff 77 e1 8b 58 04 85 db 74 37 8b 5b
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 45 0c             	mov    0xc(%rbp),%eax
>    3:	50                   	push   %rax
>    4:	8b 45 08             	mov    0x8(%rbp),%eax
>    7:	50                   	push   %rax
>    8:	89 d8                	mov    %ebx,%eax
>    a:	89 55 f4             	mov    %edx,-0xc(%rbp)
>    d:	ff d6                	callq  *%rsi
>    f:	83 c4 0c             	add    $0xc,%esp
>   12:	89 c6                	mov    %eax,%esi
>   14:	85 c0                	test   %eax,%eax
>   16:	78 55                	js     0x6d
>   18:	8d 65 f8             	lea    -0x8(%rbp),%esp
>   1b:	89 f0                	mov    %esi,%eax
>   1d:	5b                   	pop    %rbx
>   1e:	5e                   	pop    %rsi
>   1f:	5d                   	pop    %rbp
>   20:	c3                   	retq   =

>   21:	8d 74 26 00          	lea    0x0(%rsi,%riz,1),%esi
>   25:	be fa ff ff ff       	mov    $0xfffffffa,%esi
>   2a:*	8b 03                	mov    (%rbx),%eax		<-- trapping instruction
>   2c:	85 c0                	test   %eax,%eax
>   2e:	74 e8                	je     0x18
>   30:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>   35:	77 e1                	ja     0x18
>   37:	8b 58 04             	mov    0x4(%rax),%ebx
>   3a:	85 db                	test   %ebx,%ebx
>   3c:	74 37                	je     0x75
>   3e:	8b                   	.byte 0x8b
>   3f:	5b                   	pop    %rbx
> =

> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 03                	mov    (%rbx),%eax
>    2:	85 c0                	test   %eax,%eax
>    4:	74 e8                	je     0xffffffffffffffee
>    6:	3d 00 f0 ff ff       	cmp    $0xfffff000,%eax
>    b:	77 e1                	ja     0xffffffffffffffee
>    d:	8b 58 04             	mov    0x4(%rax),%ebx
>   10:	85 db                	test   %ebx,%ebx
>   12:	74 37                	je     0x4b
>   14:	8b                   	.byte 0x8b
>   15:	5b                   	pop    %rbx
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.15.0-11191-g995fe757ecae .config
> 	make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 olddefconfig prepare modules_=
prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
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

--===============0619080706068948625==--

