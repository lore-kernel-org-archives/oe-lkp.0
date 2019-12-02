Content-Type: multipart/mixed; boundary="===============1651352834652162918=="
MIME-Version: 1.0
From: John Garry <john.garry@huawei.com>
To: lkp@lists.01.org
Subject: Re: [blk] 017e1adde9: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 02 Dec 2019 14:15:41 +0000
Message-ID: <42eb0e2d-346b-c5b5-153d-b34329413a9f@huawei.com>
In-Reply-To: <20191201145716.GB18573@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1651352834652162918==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/12/2019 14:57, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 017e1adde9cfd7e488e6e8328d98f9d84e5f8fb8 ("[PATCH 4/8] blk-mq: Fa=
cilitate a shared sbitmap per tagset")
> url: https://github.com/0day-ci/linux/commits/Hannes-Reinecke/blk-mq-scsi=
-Provide-hostwide-shared-tags-for-SCSI-HBAs/20191126-234036
> base: https://git.kernel.org/cgit/linux/kernel/git/mkp/scsi.git for-next
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =


Thanks to kernel test robot.

So this looks like it is caused by the reason mentioned in Bart's review:

On 27/11/2019 17:03, Bart Van Assche wrote:
 >
 >> +struct blk_mq_tags *blk_mq_init_tags(struct blk_mq_tag_set *set,
 >> +                     unsigned int total_tags,
 >>                        unsigned int reserved_tags,
 >> -                     int node, int alloc_policy)
 >> +                     int node, int alloc_policy,
 >> +                     bool shared_tags)
 >>   {
 >>       struct blk_mq_tags *tags;
 >> @@ -488,9 +517,11 @@ struct blk_mq_tags *blk_mq_init_tags(unsigned int
 >> total_tags,
 >>       tags->nr_tags =3D total_tags;
 >>       tags->nr_reserved_tags =3D reserved_tags;
 >> -    if (blk_mq_init_bitmap_tags(tags, node, alloc_policy) < 0) {
 >> -        kfree(tags);
 >> -        tags =3D NULL;
 >> +    if (shared_tags) {

Indeed, this is wrong - the logic is inverted.

 >> +        if (blk_mq_init_bitmap_tags(tags, node, alloc_policy) < 0) {
 >> +            kfree(tags);
 >> +            tags =3D NULL;
 >> +        }
 >>       }
 >>       return tags;
 >>   }
 >
 > The above looks weird to me: the existing code path is only called if
 > shared tags are enabled? Shouldn't "if (shared_tags)" be changed into
 > "if (!shared_tags)"?


Thanks,
John



> +---------------------------------------------+------------+------------+
> |                                             | 240a6aa94a | 017e1adde9 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 4          | 0          |
> | boot_failures                               | 0          | 4          |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 4          |
> | Oops:#[##]                                  | 0          | 4          |
> | RIP:__sbitmap_queue_get                     | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 4          |
> +---------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> [    8.258248] BUG: kernel NULL pointer dereference, address: 00000000000=
00018
> [    8.259858] #PF: supervisor read access in kernel mode
> [    8.261077] #PF: error_code(0x0000) - not-present page
> [    8.262296] PGD 0 P4D 0
> [    8.263028] Oops: 0000 [#1] SMP PTI
> [    8.263943] CPU: 1 PID: 189 Comm: kworker/u4:2 Not tainted 5.4.0-rc1-0=
0274-g017e1adde9cfd #1
> [    8.265919] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    8.267892] Workqueue: events_unbound async_run_entry_fn
> [    8.269148] RIP: 0010:__sbitmap_queue_get+0x7/0x90
> [    8.270303] Code: 41 5e 41 5f c3 41 8b 4f 04 d3 e3 01 d8 5b 5d 41 5c 4=
1 5d 41 5e 41 5f c3 66 66 2e 0f 1f 84 00 00 00 00 00 41 54 55 53 48 89 fb <=
48> 8b 47 18 65 8b 28 44 8b 27 41 39 ec 76 50 0f b6 53 34 89 ee 48
> [    8.274368] RSP: 0018:ffffc90000107b38 EFLAGS: 00010246
> [    8.275608] RAX: ffff8881f1ec2800 RBX: 0000000000000000 RCX: 000000000=
0000000
> [    8.277193] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
> [    8.278781] RBP: 0000000000000000 R08: 0000000000000024 R09: 000000000=
0000000
> [    8.280372] R10: ffffc90000107b50 R11: ffff8881ef073047 R12: 000000000=
0000000
> [    8.281966] R13: 0000000000000000 R14: 0000000000000001 R15: ffffc9000=
0107d0f
> [    8.283557] FS:  0000000000000000(0000) GS:ffff88823fd00000(0000) knlG=
S:0000000000000000
> [    8.285471] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    8.286794] CR2: 0000000000000018 CR3: 00000001f319c000 CR4: 000000000=
00406e0
> [    8.288397] Call Trace:
> [    8.289707]  blk_mq_get_tag+0xf1/0x250
> [    8.290721]  ? finish_wait+0x80/0x80
> [    8.291666]  blk_mq_get_request+0xda/0x380
> [    8.292692]  blk_mq_alloc_request+0x84/0xd0
> [    8.293729]  blk_get_request+0x22/0x60
> [    8.294687]  __scsi_execute+0x38/0x250
> [    8.295650]  scsi_probe_and_add_lun+0x22d/0xda0
> [    8.296827]  __scsi_scan_target+0xf9/0x620
> [    8.297916]  ? __switch_to_asm+0x34/0x70
> [    8.298903]  ? __switch_to_asm+0x40/0x70
> [    8.299895]  ? __switch_to_asm+0x34/0x70
> [    8.300882]  ? __switch_to_asm+0x34/0x70
> [    8.301866]  ? __switch_to_asm+0x40/0x70
> [    8.302853]  scsi_scan_channel+0x5a/0x80
> [    8.303844]  scsi_scan_host_selected+0xe3/0x150
> [    8.304944]  do_scan_async+0x17/0x1a0
> [    8.305881]  async_run_entry_fn+0x39/0x160
> [    8.306901]  process_one_work+0x1ae/0x3d0
> [    8.307911]  worker_thread+0x3c/0x3b0
> [    8.308850]  ? process_one_work+0x3d0/0x3d0
> [    8.309884]  kthread+0x11e/0x140
> [    8.310740]  ? kthread_park+0x90/0x90
> [    8.311686]  ret_from_fork+0x35/0x40
> [    8.312609] Modules linked in: serio_raw libata(+) virtio_scsi i2c_pii=
x4 parport_pc(+) parport floppy ip_tables
> [    8.315085] CR2: 0000000000000018
> [    8.315978] ---[ end trace 808f3f155f356740 ]---
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.4.0-rc1-00274-g017e1adde9cfd .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> lkp
>=20

--===============1651352834652162918==--

