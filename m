Content-Type: multipart/mixed; boundary="===============5694072178204734464=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched] a552935c0e: BUG: spinlock lockup suspected on CPU#1, swapper/1/0
Date: Fri, 27 May 2016 08:43:36 +0800
Message-ID: <20160527004336.GA25730@wfg-t540p.sh.intel.com>
In-Reply-To: <CAKfTPtCoL+=D3s4idYHQREW_S5v4d0WjTCyHjcn97GCJGWam9w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5694072178204734464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Vincent,

> [   14.729675] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   14.729675] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [   14.732027] Failed to execute /init (error -8)
> [   14.732027] Failed to execute /init (error -8)
> [   14.733689] Starting init: /sbin/init exists but couldn't execute
> it (error -8)
> [   14.733689] Starting init: /sbin/init exists but couldn't execute
> it (error -8)
> [   14.734678] Starting init: /etc/init exists but couldn't execute it
> (error -13)
> [   14.734678] Starting init: /etc/init exists but couldn't execute it
> (error -13)
> [   14.736360] Starting init: /bin/sh exists but couldn't execute it (err=
or -8)
> [   14.736360] Starting init: /bin/sh exists but couldn't execute it (err=
or -8)
> [   14.737535] Kernel panic - not syncing: No working init found.  Try
> passing init=3D option to kernel. See Linux Documentation/init.txt for
> guidance.
> [   14.737535] Kernel panic - not syncing: No working init found.  Try
> passing init=3D option to kernel. See Linux Documentation/init.txt for
> guidance.

It cannot run init. What's the md5sum of the downloaded initrd? =


% md5sum quantal-core-i386.cgz
c3c2e83aefd6d0c3aaf77967c2c2d891  quantal-core-i386.cgz

This is my locally reproduced dmesg:

[   14.374890] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   14.374890] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[   96.433487] BUG: spinlock lockup suspected on CPU#1, swapper/1/0
[   96.433487] BUG: spinlock lockup suspected on CPU#1, swapper/1/0
[   96.434598]  lock: 0xcfaa3ec0, .magic: dead4ead, .owner: init/1, .owner_=
cpu: 0
[   96.434598]  lock: 0xcfaa3ec0, .magic: dead4ead, .owner: init/1, .owner_=
cpu: 0
[   96.435858] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.6.0-rc7-00127-ga=
552935 #2
[   96.435858] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.6.0-rc7-00127-ga=
552935 #2
[   96.437157]  00000001[   96.437157]  00000001 00200046 00200046 00000000=
 00000000 c02d5dfc c02d5dfc c145ae3c c145ae3c c026838c c026838c cfaa3ec0 cf=
aa3ec0 c02d5e28 c02d5e28

[   96.438578]  c10b1e02[   96.438578]  c10b1e02 c1b52624 c1b52624 cfaa3ec0=
 cfaa3ec0 dead4ead dead4ead c026838c c026838c 00000001 00000001 00000000 00=
000000 cfaa3ec0 cfaa3ec0

[   96.440012]  00000000[   96.440012]  00000000 00000000 00000000 c02d5e44=
 c02d5e44 c10b2059 c10b2059 a08baba0 a08baba0 00000000 00000000 cfaa3ec0 cf=
aa3ec0 c10a1ec7 c10a1ec7

[   96.441428] Call Trace:
[   96.441428] Call Trace:
[   96.441859]  [<c145ae3c>] dump_stack+0x86/0xb3
[   96.441859]  [<c145ae3c>] dump_stack+0x86/0xb3
[   96.442622]  [<c10b1e02>] spin_dump+0x92/0x9d
[   96.442622]  [<c10b1e02>] spin_dump+0x92/0x9d
[   96.443371]  [<c10b2059>] do_raw_spin_lock+0x1aa/0x210
[   96.443371]  [<c10b2059>] do_raw_spin_lock+0x1aa/0x210
[   96.444270]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
[   96.444270]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
[   96.445196]  [<c176331e>] _raw_spin_lock+0x2e/0x36
[   96.445196]  [<c176331e>] _raw_spin_lock+0x2e/0x36
[   96.446017]  [<c10a1fae>] ? sched_rt_period_timer+0xe7/0x3e1
[   96.446017]  [<c10a1fae>] ? sched_rt_period_timer+0xe7/0x3e1
[   96.446981]  [<c10a1fae>] sched_rt_period_timer+0xe7/0x3e1
[   96.446981]  [<c10a1fae>] sched_rt_period_timer+0xe7/0x3e1
[   96.447934]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
[   96.447934]  [<c10a1ec7>] ? sched_rt_rq_enqueue+0xcd/0xcd
[   96.448862]  [<c10db0a8>] __hrtimer_run_queues+0x1ff/0x396
[   96.448862]  [<c10db0a8>] __hrtimer_run_queues+0x1ff/0x396
[   96.449810]  [<c10dbb18>] hrtimer_interrupt+0x9a/0x1e9
[   96.449810]  [<c10dbb18>] hrtimer_interrupt+0x9a/0x1e9
[   96.450694]  [<c10960f6>] ? irqtime_account_irq+0xf0/0xf7
[   96.450694]  [<c10960f6>] ? irqtime_account_irq+0xf0/0xf7
[   96.451621]  [<c103ee95>] local_apic_timer_interrupt+0x5c/0x63
[   96.451621]  [<c103ee95>] local_apic_timer_interrupt+0x5c/0x63
[   96.452632]  [<c103f906>] smp_apic_timer_interrupt+0x25/0x34
[   96.452632]  [<c103f906>] smp_apic_timer_interrupt+0x25/0x34
[   96.453600]  [<c1764596>] apic_timer_interrupt+0x2a/0x30                =
                    =

[   96.453600]  [<c1764596>] apic_timer_interrupt+0x2a/0x30                =
                    =


Thanks,
Fengguang

--===============5694072178204734464==--

