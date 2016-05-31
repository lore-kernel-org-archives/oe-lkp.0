Content-Type: multipart/mixed; boundary="===============8846232110706950253=="
MIME-Version: 1.0
From: Eduardo Valentin <edubezval@gmail.com>
To: lkp@lists.01.org
Subject: Re: [thermal: core] 97d8135659: WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_create_group
Date: Mon, 30 May 2016 21:03:43 -0700
Message-ID: <20160531040342.GA12535@localhost.localdomain>
In-Reply-To: <574d0ba1.EdVAGla5VyblGQXh%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8846232110706950253==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey!

On Tue, May 31, 2016 at 11:57:21AM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux Eduardo-Valentin/thermal-core-prevent-zo=
nes-with-no-types-to-be-registered/20160531-054136
> =

> commit 97d8135659e25ffd8c586e3f406e9cc531ec9ada
> Author:     Eduardo Valentin <edubezval@gmail.com>
> AuthorDate: Mon May 30 14:27:23 2016 -0700
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Tue May 31 05:41:39 2016 +0800
> =

>     thermal: core: use dev.groups to manage always present tz attributes
>     =

>     Thermal zones attributes are all being created using
>     device_create_file(). This has the disadvantage of making the code
>     complicated and sometimes we may miss the cleanup of them.
>     =

>     This patch starts to move the thermal zone sysfs attributes to the
>     dev.groups, so Linux device core manage them for us. For now, this pa=
tch
>     only moves those attributes are always present regardless of thermal
>     zone condition.
>     =

>     This change has also the advantage of cleaning up the thermal zone
>     parameters sysfs entries that are left unclean after device
>     registration.
>     =

>     Cc: Zhang Rui <rui.zhang@intel.com>
>     Cc: linux-pm(a)vger.kernel.org
>     Cc: linux-kernel(a)vger.kernel.org
>     Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
> =

> +----------------------------------------------------+------------+------=
------+------------+
> |                                                    | 00df3b0fa7 | 97d81=
35659 | 3235aa7037 |
> +----------------------------------------------------+------------+------=
------+------------+
> | boot_successes                                     | 63         | 0    =
      | 0          |
> | boot_failures                                      | 0          | 22   =
      | 13         |
> | WARNING:at_fs/sysfs/group.c:#internal_create_group | 0          | 22   =
      | 13         |
> | BUG:unable_to_handle_kernel                        | 0          | 22   =
      | 13         |
> | Oops                                               | 0          | 22   =
      | 13         |
> | EIP_is_at_string                                   | 0          | 22   =
      | 13         |
> | Kernel_panic-not_syncing:Fatal_exception           | 0          | 22   =
      | 13         |
> | backtrace:power_supply_register                    | 0          | 22   =
      | 13         |
> | backtrace:test_power_init                          | 0          | 22   =
      | 13         |
> | backtrace:kernel_init_freeable                     | 0          | 22   =
      | 13         |
> +----------------------------------------------------+------------+------=
------+------------+
> =

> [    9.247998] power_supply test_battery: uevent
> [    9.248630] power_supply test_battery: POWER_SUPPLY_NAME=3Dtest_battery
> [    9.253672] ------------[ cut here ]------------
> [    9.254381] WARNING: CPU: 0 PID: 1 at fs/sysfs/group.c:61 internal_cre=
ate_group+0x20e/0x2b0
> [    9.255723] BUG: unable to handle kernel paging request at 6c756d65
> [    9.256688] IP: [<c8feab11>] string+0x21/0x90
> [    9.257367] *pdpt =3D 0000000000000000 *pde =3D 0000000000000000 =

> [    9.258217] Oops: 0000 [#1] PREEMPT SMP =

> [    9.258806] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.6.0-rc6-00055-=
g97d8135 #109
> [    9.259952] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    9.261204] task: cf43c000 ti: cf43e000 task.ti: cf43e000
> [    9.261929] EIP: 0060:[<c8feab11>] EFLAGS: 00010086 CPU: 0
> [    9.262771] EIP is at string+0x21/0x90
> [    9.263335] EAX: ca5dc7aa EBX: cf43fe20 ECX: 6c756d65 EDX: ffffffff
> [    9.278285] ESI: fffffffe EDI: 00000002 EBP: cf43fd44 ESP: cf43fd34
> [    9.279146]  DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068
> [    9.279896] CR0: 80050033 CR2: 6c756d65 CR3: 09e45000 CR4: 000406b0
> [    9.280866] Stack:
> [    9.281166]  ca5dcb80 cf43fe20 ca5dc7aa 00000002 cf43fd78 c8fec580 fff=
fff04 ffff0a00
> [    9.282400]  ca5dc7a0 000003e0 ca5dcb80 c9a90b4c ffffff04 ffff0a00 000=
003e0 00000000
> [    9.283659]  c8f87d4e cf43fd88 c8fecd8e cf43fe1c 00000000 cf43fdac c8e=
a0eac cf43fe1c
> [    9.284899] Call Trace:
> [    9.285266]  [<c8fec580>] vsnprintf+0xf0/0x480
> [    9.285879]  [<c8f87d4e>] ? internal_create_group+0x20e/0x2b0
> [    9.286746]  [<c8fecd8e>] vscnprintf+0xe/0x40
> [    9.287397]  [<c8ea0eac>] vprintk_emit+0x8c/0x510
> [    9.302114]  [<c8f87d4e>] ? internal_create_group+0x20e/0x2b0
> [    9.302920]  [<c8ea1346>] vprintk+0x16/0x20
> [    9.303516]  [<c8e4a207>] __warn+0x57/0xd0
> [    9.304076]  [<c8e4a2a8>] warn_slowpath_fmt+0x28/0x30
> [    9.304892]  [<c8f87d4e>] internal_create_group+0x20e/0x2b0
> [    9.305704]  [<c8f87ed3>] sysfs_create_groups+0x33/0x90
> [    9.306449]  [<c9198abd>] device_add+0x59d/0x5f0
> [    9.307142]  [<c91a5dd0>] ? pm_runtime_init+0xe0/0xf0
> [    9.307839]  [<c9198bf2>] device_register+0x12/0x20
> [    9.308564]  [<c94c7ecf>] thermal_zone_device_register+0x14f/0x590
> [    9.309485]  [<c9467ab5>] __power_supply_register+0x265/0x310
> [    9.310304]  [<c9467f6a>] power_supply_register+0xa/0x10
> [    9.311029]  [<c9c917a5>] test_power_init+0x1d/0x84
> [    9.311785]  [<c9c91788>] ? wm831x_power_driver_init+0x11/0x11
> [    9.312629]  [<c9c57bac>] do_one_initcall+0xd0/0x151
> [    9.313332]  [<c9c574ce>] ? set_debug_rodata+0xf/0xf
> [    9.314010]  [<c8e64969>] ? parse_args+0x259/0x450
> [    9.332793]  [<c9c57cfb>] ? kernel_init_freeable+0xce/0x16a
> [    9.333607]  [<c9c57d1e>] kernel_init_freeable+0xf1/0x16a
> [    9.334369]  [<c97d2bc8>] kernel_init+0x8/0xf0
> [    9.334964]  [<c97da449>] ret_from_kernel_thread+0x21/0x38
> [    9.335803]  [<c97d2bc0>] ? rest_init+0x120/0x120
> [    9.336486] Code: 74 26 00 8d bc 27 00 00 00 00 55 89 e5 57 56 53 83 e=
c 04 89 55 f0 8b 55 0c c1 fa 10 81 f9 ff 0f 00 00 8d 72 ff 76 53 85 d2 74 5=
f <0f> b6 19 8d 79 01 84 db 74 55 83 c6 01 b9 01 00 00 00 eb 0f 8d
> [    9.340346] EIP: [<c8feab11>] string+0x21/0x90 SS:ESP 0068:cf43fd34
> [    9.341267] CR2: 000000006c756d65
> [    9.341787] ---[ end trace 74ad2750544ebaea ]---
> [    9.342455] Kernel panic - not syncing: Fatal exception

Looking into this right now.


--===============8846232110706950253==--

