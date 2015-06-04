Content-Type: multipart/mixed; boundary="===============6606775878738498762=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] WARNING: CPU: 0 PID: 10 at kernel/kthread.c:333 __kthread_bind_mask()
Date: Thu, 04 Jun 2015 11:40:00 +0200
Message-ID: <20150604094000.GE3644@twins.programming.kicks-ass.net>
In-Reply-To: <20150604045450.GA30151@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6606775878738498762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 04, 2015 at 12:54:50PM +0800, Fengguang Wu wrote:
> [    2.442390] ------------[ cut here ]------------
> [    2.443944] WARNING: CPU: 0 PID: 10 at kernel/kthread.c:333 __kthread_=
bind_mask+0x34/0x6e()
> [    2.446978] Modules linked in:
> [    2.448359] CPU: 0 PID: 10 Comm: khelper Not tainted 4.1.0-rc6-00314-g=
6455666 #4
> [    2.450990] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    2.454132]  0000000000000009 ffff88000f643d68 ffffffff81a3df14 000000=
0000000b02
> [    2.470295]  0000000000000000 ffff88000f643da8 ffffffff810f308f 000000=
000f643da8
> [    2.503291]  ffffffff8110d116 ffff88000f55d580 ffff88000f5240c0 ffff88=
000f4936e0
> [    2.506510] Call Trace:
> [    2.520770]  [<ffffffff81a3df14>] dump_stack+0x4c/0x65
> [    2.522479]  [<ffffffff810f308f>] warn_slowpath_common+0xa1/0xbb
> [    2.524334]  [<ffffffff8110d116>] ? __kthread_bind_mask+0x34/0x6e
> [    2.526219]  [<ffffffff810f314c>] warn_slowpath_null+0x1a/0x1c
> [    2.528069]  [<ffffffff8110d116>] __kthread_bind_mask+0x34/0x6e
> [    2.529925]  [<ffffffff8110d381>] kthread_bind_mask+0x13/0x15
> [    2.531738]  [<ffffffff8110679d>] worker_attach_to_pool+0x39/0x7c
> [    2.546650]  [<ffffffff8110866b>] rescuer_thread+0x130/0x318

Ah, I clearly missed that the rescuer_thread() also did
worker_attach_to_pool() from a !virgin kthread.

Thanks

> [    2.548484]  [<ffffffff8110853b>] ? cancel_delayed_work_sync+0x15/0x15
> [    2.550411]  [<ffffffff8110853b>] ? cancel_delayed_work_sync+0x15/0x15
> [    2.552207]  [<ffffffff8110cd0f>] kthread+0xf8/0x100
> [    2.553864]  [<ffffffff8110cc17>] ? kthread_create_on_node+0x184/0x184
> [    2.555795]  [<ffffffff81a457c2>] ret_from_fork+0x42/0x70
> [    2.557538]  [<ffffffff8110cc17>] ? kthread_create_on_node+0x184/0x184
> [    2.572520] ---[ end trace 362b92c9255ab666 ]---
> [    2.574163] ------------[ cut here ]------------

--===============6606775878738498762==--

