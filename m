Content-Type: multipart/mixed; boundary="===============2388895135561491271=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [confidence: ] 6ce3dd6eec [ 10.247585] WARNING: CPU: 0 PID: 210 at block/blk-mq.c:647 blk_mq_start_request
Date: Sun, 22 Jul 2018 08:02:59 +0800
Message-ID: <20180722000252.GA25343@ming.t460p>
In-Reply-To: <20180721022805.GG12513@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2388895135561491271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 21, 2018 at 10:28:05AM +0800, kernel test robot wrote:
> =

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit 6ce3dd6eec114930cf2035a8bcb1e80477ed79a8
> Author:     Ming Lei <ming.lei@redhat.com>
> AuthorDate: Tue Jul 10 09:03:31 2018 +0800
> Commit:     Jens Axboe <axboe@kernel.dk>
> CommitDate: Tue Jul 17 16:04:00 2018 -0600
> =

>     blk-mq: issue directly if hw queue isn't busy in case of 'none'
>     =

>     In case of 'none' io scheduler, when hw queue isn't busy, it isn't
>     necessary to enqueue request to sw queue and dequeue it from
>     sw queue because request may be submitted to hw queue asap without
>     extra cost, meantime there shouldn't be much request in sw queue,
>     and we don't need to worry about effect on IO merge.
>     =

>     There are still some single hw queue SCSI HBAs(HPSA, megaraid_sas, ..=
.)
>     which may connect high performance devices, so 'none' is often requir=
ed
>     for obtaining good performance.
>     =

>     This patch improves IOPS and decreases CPU unilization on megaraid_sa=
s,
>     per Kashyap's test.
>     =

>     Cc: Kashyap Desai <kashyap.desai@broadcom.com>
>     Cc: Laurence Oberman <loberman@redhat.com>
>     Cc: Omar Sandoval <osandov@fb.com>
>     Cc: Christoph Hellwig <hch@lst.de>
>     Cc: Bart Van Assche <bart.vanassche@wdc.com>
>     Cc: Hannes Reinecke <hare@suse.de>
>     Reported-by: Kashyap Desai <kashyap.desai@broadcom.com>
>     Tested-by: Kashyap Desai <kashyap.desai@broadcom.com>
>     Signed-off-by: Ming Lei <ming.lei@redhat.com>
>     Signed-off-by: Jens Axboe <axboe@kernel.dk>
> =

> 71e9690b59  blk-iolatency: truncate our current time
> 6ce3dd6eec  blk-mq: issue directly if hw queue isn't busy in case of 'non=
e'
> 89cf553533  Add linux-next specific files for 20180720
> +-------------------------------------------------+------------+---------=
---+---------------+
> |                                                 | 71e9690b59 | 6ce3dd6e=
ec | next-20180720 |
> +-------------------------------------------------+------------+---------=
---+---------------+
> | boot_successes                                  | 32         | 4       =
   | 18            |
> | boot_failures                                   | 13         | 12      =
   | 12            |
> | BUG:workqueue_lockup-pool                       | 13         | 2       =
   | 3             |
> | WARNING:at_block/blk-mq.c:#blk_mq_start_request | 0          | 12      =
   | 11            |
> | RIP:blk_mq_start_request                        | 0          | 12      =
   | 11            |
> +-------------------------------------------------+------------+---------=
---+---------------+
> =

> [   10.225908] UDF-fs: error (device nbd11): udf_read_tagged: read failed=
, block=3D512, location=3D512
> [   10.230004] UDF-fs: error (device nbd6): udf_read_tagged: read failed,=
 block=3D512, location=3D512
> [   10.234011] UDF-fs: error (device nbd15): udf_read_tagged: read failed=
, block=3D512, location=3D512
> [   10.238978] UDF-fs: error (device nbd11): udf_read_tagged: read failed=
, block=3D256, location=3D256
> [   10.243423] UDF-fs: error (device nbd6): udf_read_tagged: read failed,=
 block=3D256, location=3D256
> [   10.247585] WARNING: CPU: 0 PID: 210 at block/blk-mq.c:647 blk_mq_star=
t_request+0x57/0x84
> [   10.255769] CPU: 0 PID: 210 Comm: kworker/0:1H Not tainted 4.18.0-rc4-=
00068-g6ce3dd6 #1
> [   10.258705] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   10.261751] Workqueue: kblockd blk_mq_run_work_fn
> [   10.263469] RIP: 0010:blk_mq_start_request+0x57/0x84
> [   10.265231] Code: 73 1e e8 32 9c b9 ff 81 4b 18 00 00 02 00 48 89 83 b=
0 00 00 00 48 89 de 48 89 ef e8 4a e5 00 00 8b 83 d4 00 00 00 85 c0 74 02 <=
0f> 0b 48 89 df e8 65 dd ff ff c7 83 d4 00 00 00 01 00 00 00 83 bd =

> [   10.271321] RSP: 0018:ffffc900002a7cb0 EFLAGS: 00010202
> [   10.273134] RAX: 0000000000000001 RBX: ffff88001c61ccc0 RCX: 000000000=
00000ff
> [   10.275339] RDX: 0000000000000000 RSI: ffff88001c5ae300 RDI: ffff88001=
c61ccc0
> [   10.277534] RBP: ffff88001c5f7008 R08: 0000000437ddd47e R09: 000000000=
0000000
> [   10.279729] R10: 0000000000000000 R11: ffff88001c61cd00 R12: 000000000=
000000a
> [   10.287969] R13: 0000000000000000 R14: ffff88001c5f7000 R15: ffff88001=
c308a00
> [   10.290141] FS:  0000000000000000(0000) GS:ffffffff82e98000(0000) knlG=
S:0000000000000000
> [   10.293062] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   10.294955] CR2: 00007f661eaba000 CR3: 0000000002e75002 CR4: 000000000=
00606b0
> [   10.297108] Call Trace:
> [   10.298313]  nbd_queue_rq+0x105/0x3c5
> [   10.310816]  ? kvm_sched_clock_read+0x5/0xd
> [   10.312427]  ? __lock_acquire+0x217/0x7ae
> [   10.314125]  blk_mq_dispatch_rq_list+0x2db/0x4ec
> [   10.315808]  ? blk_mq_flush_busy_ctxs+0x5d/0x145
> [   10.317460]  blk_mq_sched_dispatch_requests+0x127/0x165
> [   10.319212]  __blk_mq_run_hw_queue+0x9d/0xc4
> [   10.320769]  process_one_work+0x205/0x36f
> [   10.322277]  ? process_one_work+0x1a4/0x36f
> [   10.327153]  worker_thread+0x1ec/0x2bb
> [   10.329387]  ? process_scheduled_works+0x27/0x27
> [   10.331067]  kthread+0x117/0x11f
> [   10.332477]  ? kthread_flush_work_fn+0x9/0x9
> [   10.348547]  ret_from_fork+0x35/0x40
> [   10.349980] ---[ end trace 29f1a54dd1591b2f ]---
> [   10.352707] NILFS (nbd9): unable to read superblock

Hello,

Could you share your exact test case on nbd? So that we may integrate it
into blktests.

BTW, I can't find the related test script in the initrd, guess you put
all as binary?

Thanks,
Ming

--===============2388895135561491271==--

