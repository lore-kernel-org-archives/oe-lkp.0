Content-Type: multipart/mixed; boundary="===============8832154981181868935=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [kprobes/x86] a19b2e3d78: WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller
Date: Mon, 02 Oct 2017 09:33:16 +0200
Message-ID: <20171002073316.aw6aueg7rimqnuoq@hirez.programming.kicks-ass.net>
In-Reply-To: <20170930231251.emiuyrapdgzpcylp@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============8832154981181868935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 01, 2017 at 07:12:51AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: a19b2e3d783964d48d2b494439648e929bcdc976 ("kprobes/x86: Remove IR=
Q disabling from ftrace-based/optimized kprobes")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git perf/core
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 2G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +----------------------------------------------------------------+-------=
-----+------------+
> |                                                                | 5bb4fc=
2d86 | a19b2e3d78 |
> +----------------------------------------------------------------+-------=
-----+------------+
> | boot_successes                                                 | 12    =
     | 0          |
> | boot_failures                                                  | 0     =
     | 14         |
> | WARNING:at_kernel/locking/lockdep.c:#trace_hardirqs_off_caller | 0     =
     | 14         |
> | BUG:kernel_hang_in_test_stage                                  | 0     =
     | 2          |
> +----------------------------------------------------------------+-------=
-----+------------+
> =

> =

> =

> [   86.794775] WARNING: CPU: 1 PID: 1 at kernel/locking/lockdep.c:2962 tr=
ace_hardirqs_off_caller+0x6a/0xa1
> [   86.816156] Modules linked in:
> [   86.823679] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.14.0-rc2-00179=
-ga19b2e3 #139
> [   86.839654] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   86.860817] task: ffffa01adbd58040 task.stack: ffffc18ac0630000
> [   86.873128] RIP: 0010:trace_hardirqs_off_caller+0x6a/0xa1
> [   86.885573] RSP: 0000:ffffc18ac0633ca0 EFLAGS: 00010286
> [   86.896944] RAX: 0000000000000025 RBX: ffffa01adbd58040 RCX: ffffa01ad=
bd58040
> [   86.912305] RDX: 0000000000000092 RSI: ffffffffa013cb72 RDI: 000000000=
0000293
> [   86.927660] RBP: ffffc18ac0633cb0 R08: 0000000000000001 R09: 000000000=
0000001
> [   86.942861] R10: ffffc18ac0633e28 R11: dead000000000200 R12: ffffffffa=
009c722
> [   86.957936] R13: ffffa01adf40dbe0 R14: ffffffffa017f6ca R15: ffffffffa=
017f6ce
> [   86.973045] FS:  0000000000000000(0000) GS:ffffa01adf400000(0000) knlG=
S:0000000000000000
> [   86.990564] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   87.002751] CR2: ffffc18ac06cc000 CR3: 000000000b28f001 CR4: 000000000=
00206e0
> [   87.018115] Call Trace:
> [   87.025046]  trace_hardirqs_off+0xd/0xf
> [   87.034185]  setjmp_pre_handler+0x6c/0x95
> [   87.043738]  kprobe_ftrace_handler+0xc3/0xf4


So setjmp_pre_handler() does:

	regs->flags &=3D ~X86_EFLAGS_IF;
	trace_hardirqs_off();
	regs->ip =3D (unsigned long)(jp->entry);

Which clears IF on the regs, but those will only take effect after an
IRET, not instantly. This messes up he IRQ state tracing, which you're
telling it will instantly disable IRQs.

A possible 'fix' would be to do local_irq_disable() in front of that,
but I got pretty lost in that stuff so I can't say for sure if that
makes sense or not.

--===============8832154981181868935==--

