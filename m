Content-Type: multipart/mixed; boundary="===============0053159770616821050=="
MIME-Version: 1.0
From: Kirill Tkhai <ktkhai@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [net] 37b927536f: kernel_BUG_at_net/core/net_namespace.c
Date: Mon, 26 Feb 2018 12:40:33 +0300
Message-ID: <7f32f11e-ed61-5a90-d8f1-63511959ae70@virtuozzo.com>
In-Reply-To: <20180226020446.GC3019@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0053159770616821050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 26.02.2018 05:04, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 37b927536f46b27de240934db9580c3d3eba9937 ("net: Introduce net_sem=
 for protection of pernet_list")
> url: https://github.com/0day-ci/linux/commits/Kirill-Tkhai/Replacing-net_=
mutex-with-rw_semaphore/20180215-064145
> =

> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | b6d8347bf7 | 37b927536f |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 8          | 0          |
> | boot_failures                            | 0          | 8          |
> | kernel_BUG_at_net/core/net_namespace.c   | 0          | 8          |
> | invalid_opcode:#[##]                     | 0          | 8          |
> | RIP:ops_init                             | 0          | 8          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 8          |
> +------------------------------------------+------------+------------+
> =

> =

> =

> [    0.258559] kernel BUG at net/core/net_namespace.c:73!
> [    0.260018] invalid opcode: 0000 [#1]
> [    0.261073] Modules linked in:
> [    0.262005] CPU: 0 PID: 1 Comm: swapper Not tainted 4.15.0-05871-g37b9=
275 #1
> [    0.263875] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.266084] RIP: 0010:ops_init+0x101/0x120
> [    0.267233] RSP: 0000:ffffc9000000be00 EFLAGS: 00010246
> [    0.268647] RAX: 0000000000000000 RBX: ffffffff823280a0 RCX: 000000000=
0000000
> [    0.270000] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88001=
c602180
> [    0.270000] RBP: ffff88001c602140 R08: ffffffff82323d00 R09: ffff88001=
c602140
> [    0.270000] R10: ffffffff82323308 R11: ffffffff827ff64d R12: ffffffff8=
2323400
> [    0.270000] R13: 0000000000000003 R14: ffffffff826e17b9 R15: 000000000=
0000000
> [    0.270000] FS:  0000000000000000(0000) GS:ffffffff82235000(0000) knlG=
S:0000000000000000
> [    0.270000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.270000] CR2: 0000000000000000 CR3: 0000000002213000 CR4: 000000000=
00006b0
> [    0.270000] Call Trace:
> [    0.270000]  ? set_debug_rodata+0x11/0x11
> [    0.270000]  register_pernet_operations+0x101/0x1e0
> [    0.270000]  register_pernet_subsys+0x24/0x40
> [    0.270000]  netlink_proto_init+0x143/0x160
> [    0.270000]  ? eth_offload_init+0x14/0x14
> [    0.270000]  do_one_initcall+0x4d/0x190
> [    0.270000]  kernel_init_freeable+0x10e/0x190
> [    0.270000]  ? rest_init+0xa0/0xa0
> [    0.270000]  kernel_init+0xa/0xf0
> [    0.270000]  ret_from_fork+0x3a/0x50
> [    0.270000] Code: 8d 14 c5 e8 ff ff ff e8 be 14 11 00 4b 89 2c ef 49 8=
d 7e 08 4d 89 bc 24 50 06 00 00 be 08 00 00 00 e8 34 22 95 ff e9 77 ff ff f=
f <0f> 0b 0f 0b b8 f4 ff ff ff eb 91 b8 f4 ff ff ff e9 77 ff ff ff =

> [    0.270000] RIP: ops_init+0x101/0x120 RSP: ffffc9000000be00
> [    0.270013] ---[ end trace e0045ead2b146f98 ]---

There was the check:

	BUG_ON(!mutex_is_locked(&net_mutex));
 =

which was killed in one of next commits of this patchset:

	commit 447cd7a0d7d1e5b4486e99cce289654fec9951e3
	Author: Kirill Tkhai <ktkhai@virtuozzo.com>
	Date:   Tue Feb 13 12:26:44 2018 +0300

	net: Allow pernet_operations to be executed in parallel

So, the whole patchset as an atomic change is safe; and the only thing
is the hunk removing the BUG_ON() had to go in another patch.

Anyway, thanks for testing, Xiaolong.

Kirill

--===============0053159770616821050==--

