Content-Type: multipart/mixed; boundary="===============4826440589195201172=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 9ad0e5683d: IP-Config: Auto-configuration of network failed
Date: Mon, 26 Sep 2016 16:22:27 +0200
Message-ID: <20160926142227.GD5016@twins.programming.kicks-ass.net>
In-Reply-To: <20160926130541.e5ei5fja33hrvkn5@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4826440589195201172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 26, 2016 at 09:05:41PM +0800, Fengguang Wu wrote:

> Especially this WARNING can be reproduced easily:
> =

> [   34.961903] debug: unmapping init [mem 0xffff8eb458e8b000-0xffff8eb458=
ffffff]
> [   34.982281] random: init: uninitialized urandom read (12 bytes read)
> [   35.053338] ------------[ cut here ]------------
> [   35.054100] WARNING: CPU: 0 PID: 1 at kernel/sched/fair.c:3370 enqueue=
_entity+0x51/0xa20

<random rant>
We really should do something like:

#define WARN_ON_ONCE(cond) WARN_ONCE(cond, #cond)

The actual condition that fails is far more interesting than the line
number its on.

At least for SCHED_WARN_ON() I can do it locally, but I'll see if I can
make the generic code do that sometime.
</random rant>

> [   35.062212] CPU: 0 PID: 1 Comm: init Not tainted 4.8.0-rc6-00273-g9ad0=
e56 #2
> [   35.063126]  0000000000000000 ffff8eb45d17f990 ffffffffbc6f4d25 000000=
0000000000
> [   35.064166]  0000000000000000 ffff8eb45d17f9d0 ffffffffbc0bd0e0 00000d=
2a5d190040
> [   35.072024]  ffff8eb45e3d85b0 ffff8eb4507104a8 0000000000000001 000000=
0000000001
> [   35.073284] Call Trace:
> [   35.073688]  [<ffffffffbc6f4d25>] dump_stack+0x86/0xc1
> [   35.074506]  [<ffffffffbc0bd0e0>] __warn+0xc0/0xe0
> [   35.081969]  [<ffffffffbc0bd1cd>] warn_slowpath_null+0x1d/0x20
> [   35.082890]  [<ffffffffbc0f50a1>] enqueue_entity+0x51/0xa20
> [   35.083775]  [<ffffffffbc03f4e5>] ? kvm_sched_clock_read+0x25/0x40
> [   35.091450]  [<ffffffffbc104ce9>] ? __lock_is_held+0x49/0x70
> [   35.092203]  [<ffffffffbc0f5ace>] enqueue_task_fair+0x5e/0x900
> [   35.092965]  [<ffffffffbc03f4e5>] ? kvm_sched_clock_read+0x25/0x40
> [   35.093776]  [<ffffffffbc01ccd9>] ? sched_clock+0x9/0x10
> [   35.094475]  [<ffffffffbc0ec665>] ? sched_clock_cpu+0xa5/0xd0
> [   35.102039]  [<ffffffffbc0e572c>] activate_task+0x4c/0x60
> [   35.102884]  [<ffffffffbc0efa43>] attach_task+0x53/0x80
> [   35.103708]  [<ffffffffbc0f7ab6>] load_balance+0x596/0x960
> [   35.104560]  [<ffffffffbc0f81fc>] pick_next_task_fair+0x37c/0x540
> [   35.112201]  [<ffffffffbc0f80f4>] ? pick_next_task_fair+0x274/0x540
> [   35.113189]  [<ffffffffbd11091d>] __schedule+0x36d/0x720
> [   35.114026]  [<ffffffffbd110d84>] schedule+0x74/0x90
> [   35.121504]  [<ffffffffbc24b21f>] pipe_wait+0x6f/0xa0
> [   35.122175]  [<ffffffffbc0fe420>] ? __wake_up_common+0x80/0x80
> [   35.122937]  [<ffffffffbc24b959>] pipe_read+0x269/0x340
> [   35.123627]  [<ffffffffbc243338>] __vfs_read+0xd8/0x100
> [   35.124316]  [<ffffffffbc2433fd>] vfs_read+0x9d/0x120
> [   35.131678]  [<ffffffffbc243819>] SyS_read+0x49/0xa0
> [   35.132339]  [<ffffffffbc001a43>] do_syscall_64+0x273/0x390
> [   35.133068]  [<ffffffffbc129dc3>] ? rcu_eqs_enter+0x43/0x50
> [   35.133945]  [<ffffffffbc00101a>] ? trace_hardirqs_on_thunk+0x1a/0x1c
> [   35.138353]  [<ffffffffbd116483>] entry_SYSCALL64_slow_path+0x25/0x25
> [   35.139343] ---[ end trace 88c244b7a589cbf9 ]---

Ooh, shiny, I think I see what's wrong with that. Thanks!


--===============4826440589195201172==--

