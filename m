Content-Type: multipart/mixed; boundary="===============4248978630065477851=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [tracepoint] 01edfaf177: WARNING:at_kernel/static_call.c:#__static_call_update
Date: Fri, 15 May 2020 19:13:13 +0200
Message-ID: <20200515171313.GG2940@hirez.programming.kicks-ass.net>
In-Reply-To: <20200513084811.GG17565@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============4248978630065477851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2020 at 04:48:11PM +0800, kernel test robot wrote:

> commit: 01edfaf177311fba9941254793431d2044b00fd7 ("[PATCH v4 12/18] trace=
point: Optimize using static_call()")
> url: https://github.com/0day-ci/linux/commits/Peter-Zijlstra/Add-static_c=
all/20200502-045208

*groan*, so I would really rather you grab patches from by git tree than
suck random crap from lkml like this :/

Anyway, I _suspect_ this is fixed in a later patch that initializes
static_call earlier, but I can't tell for sure, because I really
don't know what to do to reproduce this.

> [    1.990628] WARNING: CPU: 0 PID: 0 at kernel/static_call.c:113 __stati=
c_call_update+0x83/0x29c
> [    1.990660] Modules linked in:
> [    1.990703] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.7.0-rc3-next-2=
0200501-00012-g01edfaf177311f #1
> [    1.990742] RIP: 0010:__static_call_update+0x83/0x29c
> [    1.990781] Code: 4c 89 f2 48 ff 05 d1 9d 83 06 e8 8e 09 d2 ff 48 ff 0=
5 d5 9d 83 06 80 3d 8e a2 83 06 00 0f 85 f3 01 00 00 48 ff 05 c9 9d 83 06 <=
0f> 0b 48 ff 05 c8 9d 83 06 48 ff 05 c9 9d 83 06 e9 b0 01 00 00 48
> [    1.990814] RSP: 0000:ffffffff83c07cf8 EFLAGS: 00010002
> [    1.990850] RAX: 0000000000000000 RBX: ffffffff86682620 RCX: 000000000=
0000000
> [    1.990884] RDX: fffffbfff0780f87 RSI: ffffffff83c918c0 RDI: fffffbfff=
0780f93
> [    1.990916] RBP: ffffffff812943ec R08: fffffbfff07e3551 R09: fffffbfff=
07e3551
> [    1.990950] R10: ffffffff83f1aa87 R11: 0000000000000001 R12: ffffffff8=
3f6f0c0
> [    1.990982] R13: 00000000ffffffff R14: ffffffff812943ec R15: ffffffff8=
12943ec
> [    1.991017] FS:  0000000000000000(0000) GS:ffff8881e8000000(0000) knlG=
S:0000000000000000
> [    1.991049] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.991081] CR2: ffff88823ffff000 CR3: 0000000003c78000 CR4: 000000000=
00006b0
> [    1.991119] Call Trace:
> [    1.991164]  ? __SCT__tp_func_sched_waking+0x8/0x8
> [    1.991202]  ? allocate_probes+0x2d/0x4d
> [    1.991250]  ? probe_sched_switch+0x4f/0x4f
> [    1.991286]  ? __SCT__tp_func_sched_waking+0x8/0x8
> [    1.991331]  ? probe_sched_switch+0x4f/0x4f
> [    1.991366]  tracepoint_update_call+0x6d/0x79
> [    1.991416]  tracepoint_probe_register_prio+0x337/0x47f
> [    1.991499]  tracepoint_probe_register+0x16/0x1e
> [    1.991538]  tracing_start_sched_switch+0xc3/0x1ba
> [    1.991627]  tracing_start_cmdline_record+0x11/0x19
> [    1.991664]  trace_printk_start_comm+0x1c/0x24
> [    1.991725]  trace_event_init+0x1b8/0x20a
> [    1.991775]  trace_init+0xc/0x14
> [    1.991809]  start_kernel+0x8ed/0xe78
> [    1.991862]  ? thread_stack_cache_init+0xd/0xd
> [    1.991905]  ? __early_make_pgtable+0x1b9/0x204
> [    1.991963]  ? early_make_pgtable+0x27/0x2f
> [    1.992000]  ? early_idt_handler_common+0x35/0x4c
> [    1.992131]  x86_64_start_reservations+0x42/0x4a
> [    1.992170]  x86_64_start_kernel+0xe1/0xea
> [    1.992216]  secondary_startup_64+0xa4/0xb0
> [    1.992336] irq event stamp: 0
> [    1.992371] hardirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    1.992403] hardirqs last disabled at (0): [<0000000000000000>] 0x0
> [    1.992437] softirqs last  enabled at (0): [<0000000000000000>] 0x0
> [    1.992469] softirqs last disabled at (0): [<0000000000000000>] 0x0
> [    1.992562] ---[ end trace 15ea566c311b9aea ]---
> =

> =

> To reproduce:
> =

>         # build kernel
> 	cd linux
> 	cp config-5.7.0-rc3-next-20200501-00012-g01edfaf177311f .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email

Because ^ is just not going to happen. And from the provided information
I cannot decipher what it takes to trigger this.

Also, your dmesg had the trace_printk() splat in, and that is certainly
not from these patches.
--===============4248978630065477851==--

