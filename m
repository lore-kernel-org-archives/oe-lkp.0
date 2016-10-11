Content-Type: multipart/mixed; boundary="===============0741477846143851565=="
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: lkp@lists.01.org
Subject: Re: [driver core] bea5b158ff: kobject (922508b4): tried to init an initialized object
Date: Tue, 11 Oct 2016 12:41:57 -0500
Message-ID: <CAL_JsqLkxaT19iYXXBkX3S4QqUUHJCg4aJEahEvgD5_D9i1w0w@mail.gmail.com>
In-Reply-To: <20161011021813.GA8647@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0741477846143851565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2016 at 9:18 PM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit bea5b158ff0da9c7246ff391f754f5f38e34577a ("driver core: add test o=
f driver remove calls during probe")
>
> in testcase: trinity
> with following parameters:
>
>         runtime: 300s
>
>
> Trinity is a linux system call fuzz tester.
>
>
> on test machine: qemu-system-i386 -enable-kvm -smp 2 -m 320M
>
> caused below changes:
>
>
> +------------------------------------------+------------+------------+
> |                                          | cebf8fd169 | bea5b158ff |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 66         | 9          |
> | boot_failures                            | 0          | 14         |
> | calltrace:init                           | 0          | 14         |
> | BUG:unable_to_handle_kernel              | 0          | 13         |
> | Oops                                     | 0          | 14         |
> | EIP_is_at_kobject_get                    | 0          | 9          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 14         |
> | EIP_is_at_cmos_alarm_irq_enable          | 0          | 5          |
> | calltrace:rtc_timer_do_work              | 0          | 5          |
> +------------------------------------------+------------+------------+
>
>
>
> [   86.913997] hub 1-0:1.0: 1 port detected
> [   86.939210] kobject (922508b4): tried to init an initialized object, s=
omething is seriously wrong.
> [   86.963866] CPU: 0 PID: 1 Comm: swapper Not tainted 4.8.0-rc4-00003-gb=
ea5b15 #2
> [   86.981948] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [   86.998513]  922508b4 922508b4 80031d20 8c7b56c9 80031d3c 8c7b7dd3 8d4=
316d4 922508b4
> [   87.011599]  92250868 8d5b8c6c 922508ac 80031d4c 8c983cce 92250868 922=
508ac 80031d58
> [   87.025144]  8c9844bb 92250868 80031d84 8caf3c1d 00000000 8d463eac 000=
00000 8004f6b0
> [   87.039181] Call Trace:
> [   87.045925] hub 1-0:1.0: activate --> -113
> [   87.054308]  [<8c7b56c9>] dump_stack+0x16/0x1d
> [   87.061221]  [<8c7b7dd3>] kobject_init+0x73/0x80
> [   87.069607]  [<8c983cce>] device_initialize+0x1e/0xe0
> [   87.078555]  [<8c9844bb>] device_register+0xb/0x20
> [   87.085778]  [<8caf3c1d>] usb_add_gadget_udc_release+0x8d/0x270
> [   87.095048]  [<8caf3e9a>] usb_add_gadget_udc+0xa/0x10
> [   87.103629]  [<8caf775e>] dummy_udc_probe+0x14e/0x1a0
> [   87.111472]  [<8c989781>] platform_drv_probe+0x31/0x90
> [   87.118765]  [<8c9875aa>] ? driver_sysfs_add+0x6a/0x90
> [   87.125607]  [<8c987e3a>] driver_probe_device+0x12a/0x490
> [   87.132450]  [<8c8bc39b>] ? acpi_driver_match_device+0x36/0x50
> [   87.140188]  [<8c988307>] __device_attach_driver+0x77/0x110
> [   87.147841]  [<8d09712d>] ? klist_next+0x6d/0x10c
> [   87.154259]  [<8c988290>] ? __driver_attach+0xf0/0xf0
> [   87.160991]  [<8c9864f7>] bus_for_each_drv+0x47/0x80
> [   87.167830]  [<8c987b85>] __device_attach+0xb5/0x130
> [   87.174578]  [<8c988290>] ? __driver_attach+0xf0/0xf0
> [   87.181276]  [<8c9883cd>] device_initial_probe+0xd/0x10
> [   87.188316]  [<8c986787>] bus_probe_device+0x77/0x80
> [   87.195082]  [<8c98417e>] device_add+0x34e/0x5a0
> [   87.201236]  [<8c7c4840>] ? kvasprintf_const+0x40/0x90
> [   87.208206]  [<8c7b7d1b>] ? kobject_set_name_vargs+0x6b/0x90
> [   87.215924]  [<8c989e6c>] platform_device_add+0xfc/0x280
> [   87.222985]  [<8d6d0b84>] init+0x20b/0x2ec
> [   87.228620]  [<8d6d0979>] ? usb_udc_init+0x3f/0x3f
> [   87.235201]  [<8d696c1d>] do_one_initcall+0x7c/0xfb
> [   87.241716]  [<8d696d5e>] ? kernel_init_freeable+0xc2/0x15e
> [   87.249468]  [<8d696d81>] kernel_init_freeable+0xe5/0x15e
> [   87.257858]  [<8d0974fb>] kernel_init+0xb/0x100
> [   87.266182]  [<8c4c727c>] ? schedule_tail+0xc/0x50
> [   87.276843]  [<8d0a1942>] ret_from_kernel_thread+0xe/0x24
> [   87.288157]  [<8d0974f0>] ? rest_init+0x110/0x110

I traced this down to dummy udc re-using struct gadget which contains
a struct device. A memset on remove fixes it. Patch coming.

Rob

--===============0741477846143851565==--

