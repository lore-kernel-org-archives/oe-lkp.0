Content-Type: multipart/mixed; boundary="===============4614996876497222652=="
MIME-Version: 1.0
From: Jens Axboe <axboe@fb.com>
To: lkp@lists.01.org
Subject: Re: [writeback] 8bc4ad9498: INFO: suspicious RCU usage. ]
Date: Thu, 01 Sep 2016 14:13:34 -0600
Message-ID: <25429877-af98-30b2-1980-6686a7b7b78f@fb.com>
In-Reply-To: <57c8012a.zlFYe5dba5wTaKD+%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4614996876497222652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/01/2016 04:21 AM, kernel test robot wrote:
>
> FYI, we noticed the following commit:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git wb-=
buf-throttle
> commit 8bc4ad9498f81d6689da42457615db0989e720d3 ("writeback: throttle buf=
fered writeback")
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu Westmere -m 512M
>
> caused below changes:
>
>
> +--------------------------------------+------------+------------+
> |                                      | b2e4e4e34d | 8bc4ad9498 |
> +--------------------------------------+------------+------------+
> | boot_successes                       | 6          | 0          |
> | boot_failures                        | 0          | 8          |
> | INFO:suspicious_RCU_usage            | 0          | 8          |
> | message:INFO:suspicious_RCU_usage    | 0          | 0.0        |
> | pattern:INFO:suspicious_RCU_usage    | 0          | 0          |
> | calltrace:disk_events_workfn         | 0          | 8          |
> | message:calltrace:disk_events_workfn | 0          | 0.0        |
> | pattern:calltrace:disk_events_workfn | 0          | 0          |
> +--------------------------------------+------------+------------+
>
>
>
> [    7.323356] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    7.334239]
> [    7.337256] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    7.340532] [ INFO: suspicious RCU usage. ]
> [    7.342419] 4.8.0-rc4-00008-g8bc4ad9 #1 Not tainted
> [    7.347065] -------------------------------
> [    7.350132] include/linux/cgroup.h:435 suspicious rcu_dereference_chec=
k() usage!
> [    7.355928]
> [    7.355928] other info that might help us debug this:
> [    7.355928]
> [    7.360548]
> [    7.360548] rcu_scheduler_active =3D 1, debug_locks =3D 0
> [    7.366185] 3 locks held by kworker/0:1/19:
> [    7.369225]  #0:  ("events_freezable_power_efficient"){.+.+..}, at: [<=
ffffffff810fc9d9>] process_one_work+0x151/0x4ee
> [    7.377225]  #1:  ((&(&ev->dwork)->work)){+.+...}, at: [<ffffffff810fc=
9d9>] process_one_work+0x151/0x4ee
> [    7.384175]  #2:  (&(&q->__queue_lock)->rlock){-.....}, at: [<ffffffff=
81789b1d>] cfq_set_request+0x5e/0x2a3
> [    7.389264]
> [    7.389264] stack backtrace:
> [    7.391300] CPU: 0 PID: 19 Comm: kworker/0:1 Not tainted 4.8.0-rc4-000=
08-g8bc4ad9 #1
> [    7.395279] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    7.398012] Workqueue: events_freezable_power_ disk_events_workfn
> [    7.399933]  0000000000000000 ffff88003db1f8e8 ffffffff8178ed3b ffff88=
003db184c0
> [    7.404348]  0000000000000001 ffff88003db1f918 ffffffff81123472 ffff88=
003db184c0
> [    7.407158]  ffffffff84091180 0000000000000003 ffff880039d4c400 ffff88=
003db1f938
> [    7.410074] Call Trace:
> [    7.411328]  [<ffffffff8178ed3b>] dump_stack+0x82/0xb8
> [    7.413982]  [<ffffffff81123472>] lockdep_rcu_suspicious+0xf7/0x100
> [    7.415828]  [<ffffffff817873f4>] bio_blkcg+0x89/0x93
> [    7.417336]  [<ffffffff817891f0>] check_blkcg_changed+0x58/0x1b8
> [    7.419027]  [<ffffffff81125fa7>] ? lock_acquire+0x125/0x1be
> [    7.421418]  [<ffffffff81125fa7>] ? lock_acquire+0x125/0x1be
> [    7.424049]  [<ffffffff811238d3>] ? lock_acquired+0xfc/0x2f2
> [    7.426893]  [<ffffffff81789b1d>] ? cfq_set_request+0x5e/0x2a3
> [    7.428722]  [<ffffffff81789b90>] cfq_set_request+0xd1/0x2a3
> [    7.430315]  [<ffffffff82efb493>] ? _raw_spin_unlock_irq+0x2c/0x3b
> [    7.432134]  [<ffffffff81124a52>] ? trace_hardirqs_on_caller+0x17c/0x1=
98
> [    7.434083]  [<ffffffff81124a7b>] ? trace_hardirqs_on+0xd/0xf
> [    7.435703]  [<ffffffff82efb498>] ? _raw_spin_unlock_irq+0x31/0x3b
> [    7.437472]  [<ffffffff8176dd78>] ? ioc_create_icq+0x15e/0x175
> [    7.439690]  [<ffffffff81763fe3>] elv_set_request+0x1f/0x24
> [    7.442157]  [<ffffffff8176856d>] get_request+0x38f/0x77f
> [    7.444694]  [<ffffffff8111b59c>] ? add_wait_queue_exclusive+0x44/0x44
> [    7.447449]  [<ffffffff817689c2>] blk_get_request+0x65/0xa8
> [    7.449868]  [<ffffffff81c692df>] ide_cd_queue_pc+0x76/0x19d
> [    7.451986]  [<ffffffff8112539e>] ? __lock_acquire+0x679/0xed1
> [    7.453757]  [<ffffffff81c695ee>] cdrom_check_status+0x51/0x53
> [    7.455372]  [<ffffffff81c6a27e>] ide_cdrom_check_events_real+0x20/0x3f
> [    7.457294]  [<ffffffff82579f94>] cdrom_update_events+0x18/0x21
> [    7.458987]  [<ffffffff82579faf>] cdrom_check_events+0x12/0x1f
> [    7.460713]  [<ffffffff81c68317>] idecd_check_events+0x1c/0x1e
> [    7.462393]  [<ffffffff81778d12>] disk_check_events+0x47/0x103
> [    7.464129]  [<ffffffff81778dea>] disk_events_workfn+0x1c/0x1e
> [    7.465844]  [<ffffffff810fcafa>] process_one_work+0x272/0x4ee
> [    7.467462]  [<ffffffff810fd247>] worker_thread+0x1eb/0x2c9
> [    7.469137]  [<ffffffff810fd05c>] ? rescuer_thread+0x2b3/0x2b3
> [    7.471338]  [<ffffffff81101dd4>] kthread+0xc5/0xcd
> [    7.472978]  [<ffffffff82efbf2f>] ret_from_fork+0x1f/0x40
> [    7.474501]  [<ffffffff81101d0f>] ? kthread_create_on_node+0x1b0/0x1b0
> [    7.477061] Loading iSCSI transport class v2.0-870.
> [    7.479285] rdac: device handler registered

Pretty sure this has nothing to do with the writeback code, it's just =

triggering and now blaming one of those commits since they touch the =

same function. The RCU usage in there dates back to:

commit 598971bfbdfdc8701337dc1636c7919c44699914
Author: Tejun Heo <tj@kernel.org>
Date:   Mon Mar 19 15:10:58 2012 -0700

     cfq: don't use icq_get_changed()

Tejun, see what's up there, if anything?

-- =

Jens Axboe


--===============4614996876497222652==--

