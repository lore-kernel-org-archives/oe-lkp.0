Content-Type: multipart/mixed; boundary="===============7925463463556316012=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@kernel.org>
To: lkp@lists.01.org
Subject: Re: 52e5fcd49b ("x86/entry/64: Move the IST stacks into .."): BUG: kernel hang in boot stage
Date: Sat, 25 Nov 2017 20:22:49 -0800
Message-ID: <CALCETrVrj=0yAS2oGQHoNN5F2OCGq1ho3SHt6YusHF4YQZFbXA@mail.gmail.com>
In-Reply-To: <5a1a368a.QuwCto4533RIkWTa%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7925463463556316012==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 25, 2017 at 7:35 PM, kernel test robot
<fengguang.wu@intel.com> wrote:
> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git WIP.x86/=
mm
>
> commit 52e5fcd49b0d6ab89ae80575078a6753b4ff31f9
> Author:     Andy Lutomirski <luto@kernel.org>
> AuthorDate: Mon Nov 20 09:07:47 2017 -0800
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Tue Nov 21 09:35:23 2017 +0100
>
>     x86/entry/64: Move the IST stacks into cpu_entry_area

I haven't looked at all yet, but off the top of my head, I'd guess
that the problem is that we're loading the final IDT before we set up
the cpu_entry_area.  I'll check that in the morning.

>
>     The IST stacks are needed when an IST exception occurs and are
>     accessed before any kernel code at all runs.  Move them into
>     cpu_entry_area.
>
>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
>     Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
>     Cc: Borislav Petkov <bp@alien8.de>
>     Cc: Borislav Petkov <bpetkov@suse.de>
>     Cc: Brian Gerst <brgerst@gmail.com>
>     Cc: Dave Hansen <dave.hansen@intel.com>
>     Cc: Denys Vlasenko <dvlasenk@redhat.com>
>     Cc: H. Peter Anvin <hpa@zytor.com>
>     Cc: Josh Poimboeuf <jpoimboe@redhat.com>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Link: http://lkml.kernel.org/r/be2a840400d3d4f04e7061c1a81a94fe604a3b=
9a.1511195781.git.luto(a)kernel.org
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>
> 733bb25e2f  x86/irq/64: In the stack overflow warning, print the offendin=
g IP
> 52e5fcd49b  x86/entry/64: Move the IST stacks into cpu_entry_area
> d44595c882  x86/entry/64: Fix build warning in syscall_init()
> +-------------------------------------------------------+------------+---=
---------+------------+
> |                                                       | 733bb25e2f | 52=
e5fcd49b | d44595c882 |
> +-------------------------------------------------------+------------+---=
---------+------------+
> | boot_successes                                        | 14         | 0 =
         | 0          |
> | boot_failures                                         | 30         | 15=
         | 13         |
> | WARNING:possible_circular_locking_dependency_detected | 30         |   =
         |            |
> | BUG:kernel_hang_in_boot_stage                         | 0          | 15=
         | 13         |
> +-------------------------------------------------------+------------+---=
---------+------------+
>
> [    0.097620]   remote IPI:
> [  105.440124] INFO: rcu_sched detected expedited stalls on CPUs/tasks: {=
 1-... } 31601 jiffies s: 1 root: 0x2/.
> [  105.442567] blocking rcu_node structures:
> [  105.443030] Task dump for CPU 1:
> [  105.443338] swapper/1       R  running task    30336     0      1 0x80=
000000
> [  105.444144] Call Trace:
> [  105.444436]  ? trace_hardirqs_on_thunk+0x1a/0x1c
> [  105.444962]  ? retint_kernel+0x10/0x10
> [  105.445389]  ? default_idle+0x1b/0x60
> [  105.445814]  ? trace_hardirqs_on_caller+0x3e4/0x493
> [  105.446356]  ? default_idle+0x4f/0x60
> [  105.446674]  ? do_idle+0xe6/0x18c
> [  105.447057]  ? cpu_startup_entry+0xc4/0xc6
> [  105.447517]  ? play_idle+0x360/0x360
> [  105.447929]  ? trace_hardirqs_on_caller+0x3e4/0x493
> [  105.448473]  ? start_secondary+0x3d5/0x3fa
> [  105.448940]  ? set_cpu_sibling_map+0xd4c/0xd4c
> [  105.449441]  ? secondary_startup_64+0xa5/0xb0
> [  422.880009] INFO: rcu_sched detected expedited stalls on CPUs/tasks: {=
 1-... } 126833 jiffies s: 1 root: 0x2/.
> [  422.882893] blocking rcu_node structures:
> [  422.883311] Task dump for CPU 1:
> [  422.883675] swapper/1       R  running task    30336     0      1 0x80=
000000
> [  422.884444] Call Trace:
> [  422.884708]  ? trace_hardirqs_on_thunk+0x1a/0x1c
> [  422.885312]  ? retint_kernel+0x10/0x10
> [  422.885714]  ? default_idle+0x1b/0x60
> [  422.886130]  ? trace_hardirqs_on_caller+0x3e4/0x493
> [  422.886643]  ? default_idle+0x4f/0x60
> [  422.887054]  ? do_idle+0xe6/0x18c
> [  422.887412]  ? cpu_startup_entry+0xc4/0xc6
> [  422.887845]  ? play_idle+0x360/0x360
> [  422.888236]  ? trace_hardirqs_on_caller+0x3e4/0x493
> [  422.888751]  ? start_secondary+0x3d5/0x3fa
> [  422.889447]  ? set_cpu_sibling_map+0xd4c/0xd4c
> [  422.889977]  ? secondary_startup_64+0xa5/0xb0
> BUG: kernel hang in boot stage
>
>
>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 39f1e8c533952c0b2ac9af0a86b9a092a15bd6f4 bebc6082da0a9f5=
d47a1ea2edc099bf671058bd4 --
> git bisect  bad cc821973c2db8983eddbe3b95381f1a294dffc3e  # 03:04  B     =
 0     2   15   0  Merge 'ulf.hansson-mmc/next' into devel-spot-201711251422
> git bisect  bad 3c1338e5ed50e302ce69782b084443ffd6bbb096  # 03:32  B     =
 0     5   18   0  Merge 'linux-review/Baolin-Wang/dt-bindings-clocksource-=
Add-Spreadtrum-SC9860-timer/20171125-090749' into devel-spot-201711251422
> git bisect good 85e9dbd9f47589de4533ffc6c1f22cd01f77b2ed  # 03:59  G     =
11     0    9   9  Merge 'xen-tip/master' into devel-spot-201711251422
> git bisect good 0c7c18645d6bc80afcba8811a0f07a7315f36c7c  # 04:34  G     =
11     0    8   8  Merge 'ast/master' into devel-spot-201711251422
> git bisect  bad a5b16fedb008a53c420a922442de1a4e62e5a5f9  # 05:00  B     =
 0    11   24   0  Merge 'peterz-queue/master' into devel-spot-201711251422
> git bisect good bb371665593881f88bec6420befda53f6cae9dc8  # 05:17  G     =
11     0    8   8  Merge 'tip/master' into devel-spot-201711251422
> git bisect good 05d3f1a1d5a3d37ca4b591d5524f5a5b159d0564  # 05:33  G     =
11     0    0   0  perf tools: Move symbol__calc_percent() call to outside =
symbol__disassemble()
> git bisect good a54fa4320e30d28fd1000c92fabdc00d5a3e237c  # 05:52  G     =
11     0    7   7  Merge branch 'x86/urgent'
> git bisect good b20b4a9661e074585f93f1872573427dcf22b50c  # 06:04  G     =
11     0    7   7  x86/entry/64: Create a percpu SYSCALL entry trampoline
> git bisect  bad b8b9930e8ee55c65e167e0c4aca2ac140ed3c8d3  # 06:30  B     =
 0     4   17   0  Merge branch 'WIP.x86/mm'
> git bisect good bcdd83b3b4765596c7e9e1c2adc5211f2bd9da52  # 06:56  G     =
11     0    9   9  Merge branch 'sched/urgent'
> git bisect  bad 52e5fcd49b0d6ab89ae80575078a6753b4ff31f9  # 07:34  B     =
 0    11   24   0  x86/entry/64: Move the IST stacks into cpu_entry_area
> git bisect good 733bb25e2fc0f7348b5480bfdaefad6e3ac587ee  # 07:56  G     =
11     0    8   8  x86/irq/64: In the stack overflow warning, print the off=
ending IP
> # first bad commit: [52e5fcd49b0d6ab89ae80575078a6753b4ff31f9] x86/entry/=
64: Move the IST stacks into cpu_entry_area
> git bisect good 733bb25e2fc0f7348b5480bfdaefad6e3ac587ee  # 08:04  G     =
30     0   19  28  x86/irq/64: In the stack overflow warning, print the off=
ending IP
> # extra tests with debug options
> git bisect  bad 52e5fcd49b0d6ab89ae80575078a6753b4ff31f9  # 08:39  B     =
 0     5   18   0  x86/entry/64: Move the IST stacks into cpu_entry_area
> # extra tests on HEAD of linux-devel/devel-spot-201711251422
> git bisect  bad 39f1e8c533952c0b2ac9af0a86b9a092a15bd6f4  # 08:48  B     =
 0    13   29   0  0day head guard for 'devel-spot-201711251422'
> # extra tests on tree/branch peterz-queue/WIP.x86/mm
> git bisect  bad d44595c88270b4d6b829f5ebd5d8b4cb0402dc41  # 11:12  B     =
 0    11   24   0  x86/entry/64: Fix build warning in syscall_init()
> # extra tests with first bad commit reverted
> git bisect good 207ffb0585cc101fd7134973dcda1fe726f1fa2b  # 11:34  G     =
11     0    9   9  Revert "x86/entry/64: Move the IST stacks into cpu_entry=
_area"
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion

--===============7925463463556316012==--

