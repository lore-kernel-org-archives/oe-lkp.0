Content-Type: multipart/mixed; boundary="===============1067233753529640362=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [workqueue] WARNING: CPU: 0 PID: 76 at drivers/block/floppy.c:968 schedule_bh()
Date: Tue, 08 Jul 2014 10:04:30 -0400
Message-ID: <20140708140430.GE4979@htj.dyndns.org>
In-Reply-To: <20140708021149.GA12956@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============1067233753529640362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(cc'ing Jiri)

On Tue, Jul 08, 2014 at 10:11:49AM +0800, Fengguang Wu wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit b22ce2785d97423846206cceec4efee0c4afd980
> Author:     Tejun Heo <tj@kernel.org>
> AuthorDate: Wed Aug 28 17:33:37 2013 -0400
> Commit:     Tejun Heo <tj@kernel.org>
> CommitDate: Thu Aug 29 09:19:28 2013 -0400
> =

>     workqueue: cond_resched() after processing each work item
...
> [   45.121121] PCI: setting IRQ 11 as level-triggered
> [   45.407538] e1000 0000:00:03.0: setting latency timer to 64
> [   45.686040] ------------[ cut here ]------------
> [   45.975060] WARNING: CPU: 0 PID: 76 at drivers/block/floppy.c:968 sche=
dule_bh+0x47/0x80()
> [   47.312537] CPU: 0 PID: 76 Comm: kworker/u2:1 Not tainted 3.11.0-rc7-0=
0025-gb22ce27 #8
> [   47.848171] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Bochs 01/01/2011
> [   48.433222] Workqueue: events_unbound async_run_entry_fn
> [   48.725491]  00000000 d25d7e0c c2745b10 d25d7e3c c105472d c2ff0b10 000=
00000 0000004c
> [   49.494639]  c30df57c 000003c8 c1a2fb57 c1a2fb57 00000001 c1a33aa0 c39=
a0ca0 d25d7e4c
> [   51.548252]  c1054812 00000009 00000000 d25d7e5c c1a2fb57 00000000 000=
00000 d25d7e84
> [   56.319716] Call Trace:
> [   58.164457]  [<c2745b10>] dump_stack+0x16/0x18
> [   61.355641]  [<c105472d>] warn_slowpath_common+0x8d/0xb0
> [   62.920432]  [<c1054812>] warn_slowpath_null+0x22/0x30
> [   63.411821]  [<c1a2fb57>] schedule_bh+0x47/0x80
> [   66.271423]  [<c1a33ed5>] wait_til_done+0x15/0x230
> [   75.990887]  [<c1a348d7>] user_reset_fdc+0xa7/0x110
> [   78.921153]  [<c384c939>] floppy_async_init+0x9ee/0x1263
> [   83.512228]  [<c108a0e4>] async_run_entry_fn+0x44/0x1e0
> [   89.499077]  [<c1075f5b>] process_one_work+0x33b/0x840
> [   91.634105]  [<c1076874>] worker_thread+0x414/0x890
> [   92.265965]  [<c1080ba6>] kthread+0xa6/0xb0
> [   92.658144]  [<c2763f57>] ret_from_kernel_thread+0x1b/0x28
> [   93.254541] ---[ end trace 857f8343e4eb716b ]---
> [   93.508601] floppy0: no floppy controllers found

Hmmm... this is schedule_bh() in floppy.c complaining that the work
item is already pending.  The cond_resched() addition by b22ce2785d97
doesn't change the semantics around work item execution although it
could have exposed an existing problem in the floppy driver.  I'll
look into how this could happen.

Thanks.

-- =

tejun

--===============1067233753529640362==--

