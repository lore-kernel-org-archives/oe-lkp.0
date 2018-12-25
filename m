Content-Type: multipart/mixed; boundary="===============7198722556775837439=="
MIME-Version: 1.0
From: Chao Yu <yuchao0@huawei.com>
To: lkp@lists.01.org
Subject: Re: [f2fs] aa5ba25c63: WARNING:at_fs/f2fs/segment.c:#f2fs_wait_on_page_writeback[f2fs]
Date: Tue, 25 Dec 2018 17:52:29 +0800
Message-ID: <808f7e34-0432-ae2b-f584-8c53fa100312@huawei.com>
In-Reply-To: <20181224004958.GK23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7198722556775837439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the report, I've updated the patch.

On 2018/12/24 8:49, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: aa5ba25c6364dff554416b8aea334acc4146b349 ("f2fs: check PageWriteb=
ack flag for ordered case")
> https://git.kernel.org/cgit/linux/kernel/git/chao/linux.git f2fs-dev
> =

> in testcase: xfstests
> with following parameters:
> =

> 	disk: 4HDD
> 	fs: f2fs
> 	test: generic-slow1
> =

> test-description: xfstests is a regression test suite for xfs and other f=
iles ystems.
> test-url: git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-----------------------------------------------------------------+------=
------+------------+
> |                                                                 | e62c1=
d30c1 | aa5ba25c63 |
> +-----------------------------------------------------------------+------=
------+------------+
> | boot_successes                                                  | 45   =
      | 69         |
> | boot_failures                                                   | 2    =
      | 24         |
> | End_of_test:RCU_HOTPLUG                                         | 2    =
      |            |
> | WARNING:at_fs/f2fs/segment.c:#f2fs_wait_on_page_writeback[f2fs] | 0    =
      | 24         |
> | RIP:f2fs_wait_on_page_writeback[f2fs]                           | 0    =
      | 24         |
> +-----------------------------------------------------------------+------=
------+------------+
> =

> =

> =

> [  182.205329] WARNING: CPU: 0 PID: 3485 at fs/f2fs/segment.c:3286 f2fs_w=
ait_on_page_writeback+0x8d/0xb0 [f2fs]
> [  182.209739] Modules linked in: dm_mod f2fs sr_mod crct10dif_pclmul cdr=
om sg crc32_pclmul crc32c_intel ghash_clmulni_intel ppdev ata_generic pata_=
acpi snd_pcm aesni_intel crypto_simd cryptd glue_helper snd_timer snd sound=
core serio_raw pcspkr ata_piix libata i2c_piix4 parport_pc parport floppy i=
p_tables
> [  182.217889] CPU: 0 PID: 3485 Comm: kworker/0:141 Not tainted 4.20.0-rc=
4-00036-gaa5ba25 #1
> [  182.220045] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [  182.222212] Workqueue: dio/vda dio_aio_complete_work
> [  182.223520] RIP: 0010:f2fs_wait_on_page_writeback+0x8d/0xb0 [f2fs]
> [  182.225061] Code: 8b 00 f6 c4 80 74 0d be 0f 00 00 00 48 89 df e8 f9 6=
b ff e0 48 8b 43 08 48 8d 50 ff a8 01 48 0f 45 da 48 8b 03 f6 c4 80 74 95 <=
0f> 0b f0 41 80 4c 24 48 04 eb 8a 48 89 df 5b 5d 41 5c e9 5c 72 00
> [  182.228200] RSP: 0018:ffffc90002d9bd38 EFLAGS: 00010282
> [  182.229095] RAX: 000fffffc000a0b7 RBX: ffffea0002882080 RCX: 000000000=
0000000
> [  182.230241] RDX: ffffea0002882387 RSI: ffffc90002d9bcd0 RDI: ffffffff8=
2607150
> [  182.231397] RBP: 0000000000000001 R08: ffff88806f174d30 R09: 000000000=
00003a8
> [  182.232549] R10: ffffffff82603d78 R11: 0000000000000000 R12: ffff8880a=
a27b000
> [  182.233693] R13: ffff8880aa27b2d8 R14: ffff8880a34ed101 R15: 000000000=
00000f7
> [  182.234836] FS:  0000000000000000(0000) GS:ffff88813fc00000(0000) knlG=
S:0000000000000000
> [  182.236200] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  182.237076] CR2: 00007f7fd41f7000 CR3: 000000009f10c000 CR4: 000000000=
00406f0
> [  182.238109] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000000=
0000000
> [  182.239141] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000000000=
0000400
> [  182.240169] Call Trace:
> [  182.240654]  f2fs_wait_on_node_pages_writeback+0x81/0x170 [f2fs]
> [  182.241556]  f2fs_do_sync_file+0x6a4/0x900 [f2fs]
> [  182.242305]  dio_complete+0x1ee/0x210
> [  182.242934]  process_one_work+0x1ae/0x3d0
> [  182.243597]  worker_thread+0x3c/0x3b0
> [  182.244225]  ? process_one_work+0x3d0/0x3d0
> [  182.244906]  kthread+0x11e/0x140
> [  182.245478]  ? kthread_park+0x90/0x90
> [  182.246102]  ret_from_fork+0x35/0x40
> [  182.246713] ---[ end trace e675fa4d1f37ed91 ]---
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
> =

> =

> =

> Thanks,
> lkp
> =



--===============7198722556775837439==--

