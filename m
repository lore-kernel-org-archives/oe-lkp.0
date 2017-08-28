Content-Type: multipart/mixed; boundary="===============0715112964337379112=="
MIME-Version: 1.0
From: Du, Changbin <changbin.du@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [drm/i915/gvt] b3a5c1c316: BUG:unable_to_handle_kernel
Date: Mon, 28 Aug 2017 03:00:28 +0000
Message-ID: <0C18FE92A7765D4EB9EE5D38D86A563A53BEA0BC@SHSMSX103.ccr.corp.intel.com>
In-Reply-To: <20170825081709.GK30390@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0715112964337379112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This crash is not related to my patch. And without gvtg enabled(default dis=
abled), the code will not execute.
Seems this is a tty crash.

-----Original Message-----
From: lkp-robot-request(a)eclists.intel.com [mailto:lkp-robot-request(a)ecl=
ists.intel.com] On Behalf Of Ye, Xiaolong
Sent: 2017=E5=B9=B48=E6=9C=8825=E6=97=A5 16:17
To: Du, Changbin <changbin.du@intel.com>
Cc: lkp(a)01.org
Subject: [lkp-robot] [drm/i915/gvt] b3a5c1c316: BUG:unable_to_handle_kernel


FYI, we noticed the following commit:

commit: b3a5c1c31605c79d9eab5979039638ff13317a1c ("drm/i915/gvt: Add suppor=
t for PCIe extended configuration space")
https://github.com/01org/gvt-linux.git gvt-next

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


+------------------------------------------+------------+------------+
|                                          | 1523aa261a | b3a5c1c316 |
+------------------------------------------+------------+------------+
| boot_successes                           | 4          | 0          |
| boot_failures                            | 2          | 2          |
| BUG:kernel_hang_in_test_stage            | 2          |            |
| BUG:unable_to_handle_kernel              | 0          | 2          |
| Oops:#[##]                               | 0          | 2          |
| Kernel_panic-not_syncing:Fatal_exception | 0          | 2          |
+------------------------------------------+------------+------------+



[    0.024503] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000440
[    0.024503] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000440
[    0.025990] IP: tty_audit_fork+0x14/0x30
[    0.025990] IP: tty_audit_fork+0x14/0x30
[    0.026733] PGD 0 =

[    0.026733] PGD 0 =

[    0.026734] P4D 0 =

[    0.026734] P4D 0 =

[    0.027119] =

[    0.027119] =

[    0.027796] Oops: 0000 [#1]
[    0.027796] Oops: 0000 [#1]
[    0.028333] Modules linked in:
[    0.028333] Modules linked in:
[    0.028912] CPU: 0 PID: 0 Comm: swapper Not tainted 4.13.0-rc2-00379-gb3=
a5c1c #165
[    0.028912] CPU: 0 PID: 0 Comm: swapper Not tainted 4.13.0-rc2-00379-gb3=
a5c1c #165
[    0.030000] task: ffffffff81c1c580 task.stack: ffffffff81c00000
[    0.030000] task: ffffffff81c1c580 task.stack: ffffffff81c00000
[    0.030000] RIP: 0010:tty_audit_fork+0x14/0x30
[    0.030000] RIP: 0010:tty_audit_fork+0x14/0x30
[    0.030000] RSP: 0000:ffffffff81c03d08 EFLAGS: 00010246
[    0.030000] RSP: 0000:ffffffff81c03d08 EFLAGS: 00010246
[    0.030000] RAX: 0000000000000000 RBX: 0000000000800300 RCX: 00000000000=
00008
[    0.030000] RAX: 0000000000000000 RBX: 0000000000800300 RCX: 00000000000=
00008
[    0.030000] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88001cc=
60000
[    0.030000] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff88001cc=
60000
[    0.030000] RBP: ffffffff81c03dd8 R08: 0000000000000000 R09: 00000000000=
00000
[    0.030000] RBP: ffffffff81c03dd8 R08: 0000000000000000 R09: 00000000000=
00000
[    0.030000] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88001cc=
50000
[    0.030000] R10: 0000000000000001 R11: 0000000000000001 R12: ffff88001cc=
50000
[    0.030000] R13: 0000000000000000 R14: ffffffff81674790 R15: ffff88001cc=
60000
[    0.030000] R13: 0000000000000000 R14: ffffffff81674790 R15: ffff88001cc=
60000
[    0.030000] FS:  0000000000000000(0000) GS:ffffffff81c28000(0000) knlGS:=
0000000000000000
[    0.030000] FS:  0000000000000000(0000) GS:ffffffff81c28000(0000) knlGS:=
0000000000000000
[    0.030000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.030000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.030000] CR2: 0000000000000440 CR3: 0000000001c17000 CR4: 00000000000=
006b0
[    0.030000] CR2: 0000000000000440 CR3: 0000000001c17000 CR4: 00000000000=
006b0
[    0.030000] Call Trace:
[    0.030000] Call Trace:
[    0.030000]  ? copy_process+0x1929/0x1990
[    0.030000]  ? copy_process+0x1929/0x1990
[    0.030000]  ? acpi_hw_read_port+0x3f/0x9b
[    0.030000]  ? acpi_hw_read_port+0x3f/0x9b
[    0.030000]  _do_fork+0x7e/0x3d0
[    0.030000]  _do_fork+0x7e/0x3d0
[    0.030000]  ? acpi_read_bit_register+0x128/0x137
[    0.030000]  ? acpi_read_bit_register+0x128/0x137
[    0.030000]  kernel_thread+0x24/0x30
[    0.030000]  kernel_thread+0x24/0x30
[    0.030000]  rest_init+0x1d/0xf0
[    0.030000]  rest_init+0x1d/0xf0
[    0.030000]  start_kernel+0x4da/0x4e7
[    0.030000]  start_kernel+0x4da/0x4e7
[    0.030000]  ? early_idt_handler_array+0x120/0x120
[    0.030000]  ? early_idt_handler_array+0x120/0x120
[    0.030000]  x86_64_start_reservations+0x2a/0x2c
[    0.030000]  x86_64_start_reservations+0x2a/0x2c
[    0.030000]  x86_64_start_kernel+0xe5/0xf2
[    0.030000]  x86_64_start_kernel+0xe5/0xf2
[    0.030000]  secondary_startup_64+0x9f/0x9f
[    0.030000]  secondary_startup_64+0x9f/0x9f
[    0.030000] Code: df e8 71 ff ff ff 48 89 df e8 d9 fd ff ff 5b 5d c3 66 =
0f 1f 44 00 00 55 48 8b 04 25 c0 70 c2 81 48 8b 80 b0 04 00 00 48 89 e5 5d =
<8b> 80 40 04 00 00 89 87 40 04 00 00 c3 0f 1f 44 00 00 66 2e 0f =

[    0.030000] Code: df e8 71 ff ff ff 48 89 df e8 d9 fd ff ff 5b 5d c3 66 =
0f 1f 44 00 00 55 48 8b 04 25 c0 70 c2 81 48 8b 80 b0 04 00 00 48 89 e5 5d =
<8b> 80 40 04 00 00 89 87 40 04 00 00 c3 0f 1f 44 00 00 66 2e 0f =

[    0.030000] RIP: tty_audit_fork+0x14/0x30 RSP: ffffffff81c03d08
[    0.030000] RIP: tty_audit_fork+0x14/0x30 RSP: ffffffff81c03d08
[    0.030000] CR2: 0000000000000440
[    0.030000] CR2: 0000000000000440
[    0.030000] random: get_random_bytes called from init_oops_id+0x2f/0x40 =
with crng_init=3D0
[    0.030000] random: get_random_bytes called from init_oops_id+0x2f/0x40 =
with crng_init=3D0
[    0.030000] ---[ end trace 0000000000000000 ]---


To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script  # job-script is attached in t=
his email



Thanks,
Xiaolong

--===============0715112964337379112==--

