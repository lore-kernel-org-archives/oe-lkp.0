Content-Type: multipart/mixed; boundary="===============0736245978023728258=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: [x86/mm] e2a7dcce31: kernel_BUG_at_arch/x86/mm/tlb.c
Date: Sat, 27 May 2017 09:00:38 -0700
Message-ID: <CALCETrX71xoZN2MsPVm+zMg9XrrUyMz6bzfLn3B9Vs0cTnegQA@mail.gmail.com>
In-Reply-To: <20170527133113.GA33229@inn.lkp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0736245978023728258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 27, 2017 at 6:31 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed the following commit:
>
> commit: e2a7dcce31f10bd7471b4245a6d1f2de344e7adf ("x86/mm: Rework lazy TL=
B to track the actual loaded mm")
> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git x86/tlbflush_=
cleanup

Ugh, there's an unpleasant interaction between this patch and
intel_idle.  I suspect that the intel_idle code in question is either
wrong or pointless, but I want to investigate further.  Ingo, can you
hold off on applying this patch?

>
> in testcase: will-it-scale
> with following parameters:
>
>         test: readseek2
>         cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
> on test machine: 32 threads Intel(R) Xeon(R) CPU E5-2680 0 @ 2.70GHz with=
 64G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +------------------------------------------+------------+------------+
> |                                          | ed3e5f1969 | e2a7dcce31 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 11         | 1          |
> | boot_failures                            | 0          | 4          |
> | kernel_BUG_at_arch/x86/mm/tlb.c          | 0          | 4          |
> | invalid_opcode:#[##]                     | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> +------------------------------------------+------------+------------+
>
>
>
> [   22.777203] kernel BUG at arch/x86/mm/tlb.c:39!
> [   22.784095] invalid opcode: 0000 [#1] SMP
> [   22.788850] Modules linked in: ip_tables
> [   22.793503] CPU: 2 PID: 0 Comm: swapper/2 Not tainted 4.12.0-rc2-00061=
-ge2a7dcc #1
> [   22.802448] Hardware name: Intel Corporation S2600CP/S2600CP, BIOS SE5=
C600.86B.99.99.x036.091920111209 09/19/2011
> [   22.814399] task: ffff88081bb725c0 task.stack: ffffc90006358000
> [   22.821303] RIP: 0010:leave_mm+0x39/0x40
> [   22.825950] RSP: 0018:ffffc9000635be48 EFLAGS: 00010046
> [   22.832065] RAX: 0000000000000001 RBX: ffffffff81fa8ba0 RCX: 000000000=
000001f
> [   22.840312] RDX: ffffffff81f1f9a0 RSI: ffffffff81fa8ba0 RDI: 000000000=
0000002
> [   22.848568] RBP: ffffc9000635be70 R08: 0000000000000760 R09: 000000000=
0000008
> [   22.856823] R10: ffffc9000635be50 R11: 0000000000000760 R12: 000000000=
0000004
> [   22.865069] R13: 0000000000000005 R14: 0000000000000030 R15: ffffffff8=
1fa8d80
> [   22.873325] FS:  0000000000000000(0000) GS:ffff88081f280000(0000) knlG=
S:0000000000000000
> [   22.882838] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   22.889527] CR2: 000055635b17b0b8 CR3: 0000000001e09000 CR4: 000000000=
00406e0
> [   22.897780] Call Trace:
> [   22.900782]  ? intel_idle+0x109/0x110
> [   22.905159]  cpuidle_enter_state+0xf2/0x2d0
> [   22.910118]  cpuidle_enter+0x17/0x20
> [   22.914388]  call_cpuidle+0x23/0x40
> [   22.918551]  do_idle+0x189/0x1e0
> [   22.922431]  cpu_startup_entry+0x1d/0x20
> [   22.927091]  start_secondary+0x107/0x130
> [   22.931750]  secondary_startup_64+0x9f/0x9f
> [   22.936692] Code: 8b 05 04 bd fa 7e 83 f8 01 74 20 48 81 fa a0 f9 f1 8=
1 74 15 55 31 d2 48 c7 c6 a0 f9 f1 81 31 ff 48 89 e5 e8 9a ff ff ff 5d f3 c=
3 <0f> 0b 0f 1f 44 00 00 66 66 66 66 90 55 48 8b 05 37 f5 02 01 48
> [   22.958497] RIP: leave_mm+0x39/0x40 RSP: ffffc9000635be48
> [   22.964859] ---[ end trace 1426870dcae851dd ]---
>
>
> To reproduce:
>
>         git clone https://github.com/01org/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Kernel Test Robot

--===============0736245978023728258==--

