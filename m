Content-Type: multipart/mixed; boundary="===============0327740657021646484=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [lib/rbtree] c21f87074d: WARNING:at_kernel/events/core.c:#perf_swevent_add
Date: Fri, 17 Nov 2017 14:05:22 -0800
Message-ID: <20171117140522.4e4ee98dbd7ddcb1f61d051a@linux-foundation.org>
In-Reply-To: <20171117022627.GE20330@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============0327740657021646484==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 17 Nov 2017 10:26:27 +0800 kernel test robot <xiaolong.ye@intel.c=
om> wrote:

> =

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: c21f87074dc24c9e5a13dc63918b2d30891d190f ("lib/rbtree-test: lower=
 default params")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> =

> in testcase: boot

Looks like a false positive to me.  That commit fiddles with
lib/interval_tree_test.c and lib/rbtree_test.c.

> on test machine: qemu-system-x86_64 -enable-kvm -smp 2 -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------------+------------+-------=
-----+
> |                                                   | ced2d43150 | c21f87=
074d |
> +---------------------------------------------------+------------+-------=
-----+
> | boot_successes                                    | 3          | 2     =
     |
> | boot_failures                                     | 13         | 14    =
     |
> | BUG:kernel_hang_in_test_stage                     | 13         | 14    =
     |
> | WARNING:at_kernel/events/core.c:#perf_swevent_add | 0          | 14    =
     |
> | RIP:perf_swevent_add                              | 0          | 14    =
     |
> +---------------------------------------------------+------------+-------=
-----+
> =

> =

> =

> [   14.436079] WARNING: CPU: 0 PID: 412 at kernel/events/core.c:7735 perf=
_swevent_add+0x90/0xe0
> [   14.437206] Modules linked in:
> [   14.437548] CPU: 0 PID: 412 Comm: trinity-main Not tainted 4.14.0-rc8-=
00303-gc21f870 #2
> [   14.438407] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   14.439350] task: ffff88001c554fc0 task.stack: ffff88001ef30000
> [   14.440006] RIP: 0010:perf_swevent_add+0x90/0xe0
> [   14.440546] RSP: 0018:ffff88001ef33c28 EFLAGS: 00010096
> [   14.441095] RAX: 00000000ffffffff RBX: ffff88001e00d3d8 RCX: 000000000=
0000002
> [   14.441876] RDX: ffff88001c554fc0 RSI: 0000000000000001 RDI: ffff88001=
e00d3d8
> [   14.442652] RBP: 0000000000000009 R08: 00000004e4fe313d R09: 000000009=
8260c66
> [   14.443429] R10: ffff88001ef33c58 R11: 0000000000000002 R12: 000000000=
0000000
> [   14.444187] R13: 0000000000000000 R14: 0000000000000001 R15: ffff88001=
ed7b508
> [   14.444931] FS:  00007ff942e15700(0000) GS:ffffffff81c29000(0000) knlG=
S:0000000000000000
> [   14.445780] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   14.446404] CR2: 0000000001697a28 CR3: 000000001dfbb000 CR4: 000000000=
00006b0
> [   14.447158] Call Trace:
> [   14.447468]  event_sched_in+0xee/0x240
> [   14.447884]  group_sched_in+0x5f/0x1a0
> [   14.448298]  ctx_sched_in+0x363/0x3ca
> [   14.448758]  perf_event_sched_in+0x66/0x6d
> [   14.449314]  ctx_resched+0x9d/0xaf
> [   14.449716]  __perf_install_in_context+0x104/0x137
> [   14.450225]  remote_function+0x1e/0x43
> [   14.450710]  ? rb_free_rcu+0x13/0x13
> [   14.451109]  smp_call_function_single+0x39/0x4a
> [   14.451644]  ? __perf_event_enable+0x182/0x182
> [   14.452111]  task_function_call+0x57/0x95
> [   14.452605]  ? __perf_event_enable+0x182/0x182
> [   14.453094]  perf_install_in_context+0xbe/0x128
> [   14.453580]  SyS_perf_event_open+0xea0/0x11bf
> [   14.454050]  entry_SYSCALL_64_fastpath+0x1e/0xad
> [   14.454606] RIP: 0033:0x7ff94292a6d9
> [   14.455002] RSP: 002b:00007ffdb9512bb8 EFLAGS: 00000246 ORIG_RAX: 0000=
00000000012a
> [   14.455852] RAX: ffffffffffffffda RBX: 0000000001695a20 RCX: 00007ff94=
292a6d9
> [   14.456618] RDX: ffffffffffffffff RSI: 0000000000000000 RDI: 000000000=
141c000
> [   14.457378] RBP: 0000000000002011 R08: 0000000000000003 R09: 000000000=
0000004
> [   14.458121] R10: ffffffffffffffff R11: 0000000000000246 R12: 000000000=
00225f1
> [   14.458919] R13: 0000000000002000 R14: 0000000001695a10 R15: 000000000=
00005f0
> [   14.459751] Code: 89 ed 49 bc eb 83 b5 80 46 86 c8 61 4c 09 f5 49 0f a=
f ec e8 41 a0 fe ff 48 c1 ed 38 4d 8d 64 ed 00 4d 85 e4 75 0e e8 2e a0 fe f=
f <0f> ff bb ea ff ff ff eb 37 e8 20 a0 fe ff 49 8b 6c ed 00 4c 8d =

> [   14.461842] ---[ end trace 43d85185818af4ed ]---
> =


that's the WARN_ON_ONCE() in

static int perf_swevent_add(struct perf_event *event, int flags)
{
	struct swevent_htable *swhash =3D this_cpu_ptr(&swevent_htable);
	struct hw_perf_event *hwc =3D &event->hw;
	struct hlist_head *head;

	if (is_sampling_event(event)) {
		hwc->last_period =3D hwc->sample_period;
		perf_swevent_set_period(event);
	}

	hwc->state =3D !(flags & PERF_EF_START);

	head =3D find_swevent_head(swhash, event);
	if (WARN_ON_ONCE(!head))
		return -EINVAL;

	hlist_add_head_rcu(&event->hlist_entry, head);
	perf_event_update_userpage(event);

	return 0;
}


--===============0327740657021646484==--

