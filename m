Content-Type: multipart/mixed; boundary="===============4521494778477196134=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 41e0d37f7a: divide error: 0000 [#1] SMP
Date: Tue, 03 May 2016 10:32:31 +0200
Message-ID: <20160503083231.GG3430@twins.programming.kicks-ass.net>
In-Reply-To: <87mvo8gd44.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4521494778477196134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 09:10:51AM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> commit 41e0d37f7ac81297c07ba311e4ad39465b8c8295 ("sched/fair: Do not call=
 cpufreq hook unless util changed")


> [   14.860950] Freeing unused kernel memory: 260K (ffff88103edbf000 - fff=
f88103ee00000)
> [   14.873013] systemd[1]: RTC configured in localtime, applying delta of=
 480 minutes to system time.
> [   14.884474] random: systemd urandom read with 5 bits of entropy availa=
ble
> [   14.903975] divide error: 0000 [#1] SMP =

> [   14.908375] Modules linked in:
> [   14.911793] CPU: 39 PID: 1 Comm: systemd Not tainted 4.6.0-rc4-00016-g=
41e0d37 #1
> [   14.920051] Hardware name: Intel Corporation S2600WP/S2600WP, BIOS SE5=
C600.86B.02.02.0002.122320131210 12/23/2013
> [   14.931509] task: ffff8810101d8000 ti: ffff88081ab20000 task.ti: ffff8=
8081ab20000
> [   14.939862] RIP: 0010:[<ffffffff8176ad32>]  [<ffffffff8176ad32>] intel=
_pstate_get+0x32/0x40
> [   14.949202] RSP: 0018:ffff88081ab23d70  EFLAGS: 00010006
> [   14.955129] RAX: 0000000000000000 RBX: 0000000000000024 RCX: ffff88080=
91e0300
> [   14.963094] RDX: 0000000000000000 RSI: 0000000000000100 RDI: 000000000=
0000024
> [   14.971057] RBP: ffff88081ab23d88 R08: 0000000000001000 R09: 000000000=
96a1000
> [   14.979022] R10: 0000000000ffff10 R11: 000000000000000f R12: 000000000=
0000202
> [   14.986984] R13: ffff88101390a040 R14: ffff88100e48e180 R15: ffff88101=
390a040
> [   14.994950] FS:  00007f66fe117880(0000) GS:ffff8810139c0000(0000) knlG=
S:0000000000000000
> [   15.003982] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   15.010393] CR2: 000055f78b760098 CR3: 000000103d759000 CR4: 000000000=
01406e0
> [   15.018359] Stack:
> [   15.020602]  ffffffff81764dad 0000000000000024 ffff88100e48e180 ffff88=
081ab23dc8
> [   15.028899]  ffffffff81040267 ffff88101390a0ac 0000000000000340 ffff88=
081ab23f20
> [   15.037197]  ffff88103cd7c400 ffff88100e48e180 ffff88101390a040 ffff88=
081ab23e30
> [   15.045493] Call Trace:
> [   15.048223]  [<ffffffff81764dad>] ? cpufreq_quick_get+0x3d/0x90
> [   15.054832]  [<ffffffff81040267>] show_cpuinfo+0x3c7/0x410
> [   15.060956]  [<ffffffff8121f5c4>] seq_read+0x2c4/0x3a0
> [   15.066685]  [<ffffffff81266ea8>] proc_reg_read+0x48/0x70
> [   15.072713]  [<ffffffff811f9d58>] __vfs_read+0x28/0xd0
> [   15.078451]  [<ffffffff813bab63>] ? security_file_permission+0xa3/0xc0
> [   15.085737]  [<ffffffff811faa97>] ? rw_verify_area+0x57/0xd0
> [   15.092054]  [<ffffffff811fab96>] vfs_read+0x86/0x130
> [   15.097691]  [<ffffffff811fbf96>] SyS_read+0x46/0xa0
> [   15.103234]  [<ffffffff818f71b2>] entry_SYSCALL_64_fastpath+0x1a/0xa4
> [   15.110421] Code: 05 dc 1b c3 00 89 ff 55 48 89 e5 48 8b 0c f8 48 85 c=
9 74 1f 48 63 51 1c 48 63 41 20 5d 48 0f af c2 31 d2 48 0f af 81 88 00 00 0=
0 <48> f7 b1 90 00 00 00 c3 31 c0 5d c3 66 90 0f 1f 44 00 00 8b 77 =

> [   15.132161] RIP  [<ffffffff8176ad32>] intel_pstate_get+0x32/0x40
> [   15.138875]  RSP <ffff88081ab23d70>
> [   15.142770] ---[ end trace e5d5a8bedf5502e1 ]---
> [   15.149323] Kernel panic - not syncing: Fatal exception
> =


That's intel_pstate.c:get_avg_frequency(), which assumes mperf !=3D 0. It
being 0 seems to suggest intel_pstate_sample() hasn't been called yet or
so.

Rafael?

--===============4521494778477196134==--

