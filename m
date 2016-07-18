Content-Type: multipart/mixed; boundary="===============5842434762850084999=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: BUG: sleeping function called from invalid context at kernel/irq/manage.c:110
Date: Mon, 18 Jul 2016 16:15:22 +0800
Message-ID: <20160718081522.GA13085@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5842434762850084999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

FYI, we noticed below error log

in testcase: boot
on test machine: 12 threads Sandy Bridge with 8G memory
with kernle built based on commit 310ca59d ("Linux 4.6.4")

[   17.735425] BUG: sleeping function called from invalid context at kernel=
/irq/manage.c:110
[   17.735426] in_atomic(): 1, irqs_disabled(): 1, pid: 489, name: modprobe
[   17.735429] CPU: 4 PID: 489 Comm: modprobe Not tainted 4.6.4 #1
[   17.735430] Hardware name:                  /DX79SI, BIOS SIX7910J.86A.0=
281.2011.1019.1612 10/19/2011
[   17.735435]  0000000000000000 ffff88021c9bb9f0 ffffffff8143285b ffff8800=
c18c4b80
[   17.735437]  000000000000006e ffff88021c9bba08 ffffffff810a1164 ffffffff=
81c8e628
[   17.735439]  ffff88021c9bba30 ffffffff810a11f9 ffff88021da6c000 ffff8800=
c1d73468
[   17.735440] Call Trace:
[   17.735447]  [<ffffffff8143285b>] dump_stack+0x63/0x88
[   17.735452]  [<ffffffff810a1164>] ___might_sleep+0xd4/0x120
[   17.735454]  [<ffffffff810a11f9>] __might_sleep+0x49/0x80
[   17.735459]  [<ffffffff810d7dd8>] synchronize_irq+0x38/0xa0
[   17.735462]  [<ffffffff810d75fe>] ? __irq_put_desc_unlock+0x1e/0x40
[   17.735465]  [<ffffffff810d8083>] ? __disable_irq_nosync+0x43/0x60
[   17.735468]  [<ffffffff810d80cc>] disable_irq+0x1c/0x20
[   17.735471]  [<ffffffff81640ae2>] e1000_netpoll+0xf2/0x120
[   17.735476]  [<ffffffff817ee9e0>] netpoll_poll_dev+0x60/0x1b0
[   17.735481]  [<ffffffff817ba2a1>] ? __kmalloc_reserve+0x31/0x90
[   17.735483]  [<ffffffff817eec9b>] netpoll_send_skb_on_dev+0x16b/0x250
[   17.735486]  [<ffffffff817ef06c>] netpoll_send_udp+0x2ec/0x450
[   17.735491]  [<ffffffffa00a2b62>] write_msg+0xb2/0xf0 [netconsole]
[   17.735494]  [<ffffffff810d4650>] call_console_drivers+0x120/0x130
[   17.735497]  [<ffffffff810d5f7a>] console_unlock+0x33a/0x5c0
[   17.735500]  [<ffffffff810d6c14>] register_console+0x1c4/0x380
[   17.735504]  [<ffffffffa00111c5>] init_netconsole+0x1c5/0x1000 [netconso=
le]
[   17.735506]  [<ffffffffa0011000>] ? 0xffffffffa0011000
[   17.735510]  [<ffffffff8100211d>] do_one_initcall+0xad/0x1d0
[   17.735512]  [<ffffffff810a11f9>] ? __might_sleep+0x49/0x80
[   17.735516]  [<ffffffff811dabfc>] ? kmem_cache_alloc_trace+0x18c/0x1e0
[   17.735521]  [<ffffffff8117506e>] do_init_module+0x5f/0x1d8
[   17.735525]  [<ffffffff81105e22>] load_module+0x1412/0x1af0
[   17.735528]  [<ffffffff81102740>] ? __symbol_put+0x40/0x40
[   17.735532]  [<ffffffff81203c57>] ? kernel_read_file+0x117/0x140
[   17.735535]  [<ffffffff81203d39>] ? kernel_read_file_from_fd+0x49/0x80
[   17.735538]  [<ffffffff81106753>] SYSC_finit_module+0xc3/0xf0
[   17.735541]  [<ffffffff8110679e>] SyS_finit_module+0xe/0x10
[   17.735546]  [<ffffffff8190d7f2>] entry_SYSCALL_64_fastpath+0x1a/0xa4

This happens not only in stable kernel, but also in v4.6 and v4.5.


Thanks,
Xiaolong

--===============5842434762850084999==--

