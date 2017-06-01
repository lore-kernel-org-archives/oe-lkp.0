Content-Type: multipart/mixed; boundary="===============3233063858615667706=="
MIME-Version: 1.0
From: kernel test robot <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: [lkp-robot] [usercopy] 5a78d1fa1e: kernel BUG at mm/slub.c:3878!
Date: Thu, 01 Jun 2017 10:02:50 +0800
Message-ID: <20170601020250.GD16905@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3233063858615667706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


FYI, we noticed the following commit:

commit: 5a78d1fa1ea08f87238f55b27871fb26116fd258 ("usercopy: split user-con=
trolled slabs to separate caches")
https://github.com/dwindsor/kspp slabcache-usercopy

in testcase: boot

on test machine: qemu-system-x86_64 -enable-kvm -cpu IvyBridge -smp 2 -m 1G

caused below changes (please refer to attached dmesg/kmsg for entire log/ba=
cktrace):


[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at mm/slub.c:3878!
[    0.000000] invalid opcode: 0000 [#1] SMP DEBUG_PAGEALLOC
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.12.0-rc2-next-2017=
0524-00019-g5a78d1f #564
[    0.000000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.9.3-20161025_171302-gandalf 04/01/2014
[    0.000000] task: ffffffffa2a14580 task.stack: ffffffffa2a00000
[    0.000000] RIP: 0010:kfree+0x37e/0x578
[    0.000000] RSP: 0000:ffffffffa2a03c10 EFLAGS: 00010002
[    0.000000] RAX: 0000000000000003 RBX: 0000000000000001 RCX: 00000000000=
00000
[    0.000000] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffffa2b=
cec80
[    0.000000] RBP: ffffffffa2a03c50 R08: 0000000000000000 R09: ffffffffa2a=
14c68
[    0.000000] R10: 00000000fff9e8e7 R11: 0000000000000000 R12: ffffea00003=
1b300
[    0.000000] R13: 0000000000000001 R14: 0000000000000000 R15: 00000000000=
00000
[    0.000000] FS:  0000000000000000(0000) GS:ffff880033e00000(0000) knlGS:=
0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: ffff8800341ff000 CR3: 000000000be0f000 CR4: 00000000000=
406b0
[    0.000000] Call Trace:
[    0.000000]  kvfree+0x48/0x4a
[    0.000000]  pcpu_extend_area_map+0x10c/0x11f
[    0.000000]  pcpu_alloc+0x3ce/0x7bb
[    0.000000]  __alloc_percpu+0x15/0x17
[    0.000000]  kmem_cache_open+0x49f/0x5ed
[    0.000000]  ? trace_hardirqs_off_caller+0xb3/0xc3
[    0.000000]  ? trace_hardirqs_off+0xd/0xf
[    0.000000]  __kmem_cache_create+0x14/0x8b
[    0.000000]  create_boot_cache+0x7c/0xd6
[    0.000000]  create_kmalloc_cache_usercopy+0xaf/0x139
[    0.000000]  create_kmalloc_caches+0x4bf/0x514
[    0.000000]  kmem_cache_init+0x127/0x1ef
[    0.000000]  start_kernel+0x2ba/0x71e
[    0.000000]  ? early_idt_handler_array+0x120/0x120
[    0.000000]  x86_64_start_reservations+0x5a/0x7b
[    0.000000]  x86_64_start_kernel+0x16b/0x19c
[    0.000000]  secondary_startup_64+0x9f/0x9f
[    0.000000] Code: 83 e3 01 83 f3 01 31 c9 31 d2 89 de 48 c7 c7 80 ec bc =
a2 e8 e9 57 f2 ff 48 63 c3 48 83 c0 02 48 ff 04 c5 18 21 d8 a2 85 db 74 02 =
<0f> 0b 49 8b 04 24 31 f6 48 c1 e8 0f 83 e0 01 48 83 f0 01 48 8d =

[    0.000000] RIP: kfree+0x37e/0x578 RSP: ffffffffa2a03c10
[    0.000000] ---[ end trace 5a8e2fc8a5208125 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception



To reproduce:

        git clone https://github.com/01org/lkp-tests.git
        cd lkp-tests
        bin/lkp qemu -k <bzImage> job-script  # job-script is attached in t=
his email



Thanks,
Xiaolong

--===============3233063858615667706==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg.xz"

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
AARZWg==
--===============3233063858615667706==--

