Content-Type: multipart/mixed; boundary="===============6851673479329708086=="
MIME-Version: 1.0
From: Matt Fleming <matt@codeblueprint.co.uk>
To: lkp@lists.01.org
Subject: Re: [sched/core] cb42c9a3eb WARNING: CPU: 0 PID: 40 at kernel/sched/sched.h:804 rq_clock_task
Date: Mon, 20 Feb 2017 22:21:33 +0000
Message-ID: <20170220222133.GP28416@codeblueprint.co.uk>
In-Reply-To: <20170220015619.gnb6apcw3ahgw3rr@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6851673479329708086==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Feb, at 09:56:19AM, Fengguang Wu wrote:
> =

> [   83.791548] ------------[ cut here ]------------
> [   83.793245] WARNING: CPU: 0 PID: 40 at kernel/sched/sched.h:804 rq_clo=
ck_task+0x126/0x290
> [   83.796441] rq->clock_update_flags < RQCF_ACT_SKIP
> [   83.796454] CPU: 0 PID: 40 Comm: torture_shuffle Not tainted 4.10.0-rc=
3-00256-gcb42c9a #3
> [   83.800931] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   83.815146] Call Trace:
> [   83.816232]  dump_stack+0x2c6/0x39a
> [   83.817461]  __warn+0x23d/0x280
> [   83.818643]  ? rq_clock_task+0x126/0x290
> [   83.819947]  ? rq_clock_task+0x126/0x290
> [   83.821244]  warn_slowpath_fmt+0x57/0x70
> [   83.831558]  rq_clock_task+0x126/0x290
> [   83.832837]  set_next_entity+0x90/0xc0
> [   83.834107]  set_curr_task_fair+0x48/0x60
> [   83.835414]  do_set_cpus_allowed+0x26f/0x470
> [   83.836768]  __set_cpus_allowed_ptr+0x1e8/0x510
> [   83.838161]  set_cpus_allowed_ptr+0x1d/0x30
> [   83.839498]  torture_shuffle+0x21b/0x610
> [   83.858854]  kthread+0x224/0x240
> [   83.860043]  ? torture_shutdown+0x620/0x620
> [   83.861375]  ? __kthread_bind_mask+0xf0/0xf0
> [   83.862748]  ret_from_fork+0x19/0x30
> [   83.864065] ---[ end trace 6227f0c8323ad65a ]---
> [   86.016087] ACPI: PCI Interrupt Link [LNKD] enabled at IRQ 11

Urgh, yeah. This is similar to the one that Peter fixed in

  commit 1b1d62254df0f ("sched/core: Add missing update_rq_clock() call in =
sched_move_task()")

I'll take a closer look at submitting a fix in the morning.

--===============6851673479329708086==--

