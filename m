Content-Type: multipart/mixed; boundary="===============0986147753489662151=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Sat, 15 Apr 2017 19:56:02 -0400
Message-ID: <20170415195602.54f9d410@gandalf.local.home>
In-Reply-To: <58f2a269.sppbeTEwDGClXSiJ%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0986147753489662151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 16 Apr 2017 06:44:57 +0800
kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

Hi Fengguang,

What's the issues here? There's a lot of data and I don't see any
panics. Is the problem this?

[    1.432465] Kprobe smoke test: started
[    1.463294] WARNING: kernel stack frame pointer at cf493efc in swapper/0=
:1 has bad value 00200246
[    1.463297] unwind stack type:0 next_sp:  (null) mask:2 graph_idx:0
[    1.463299] cf493d18: 00000000cf490040 (0xcf490040)
[    1.463300] cf493d1c: 00000000cf493d5c (0xcf493d5c)
[    1.463304] cf493d20: 00000000c101318f (__save_stack_trace+0x9a/0xa4)
[    1.463306] cf493d24: 0000000000490040 (0x490040)
[    1.463307] cf493d28: 0000000000000000 ...
[    1.463308] cf493d2c: 00000000cf492000 (0xcf492000)
[    1.463309] cf493d30: 00000000cf494000 (0xcf494000)
[    1.463310] cf493d34: 0000000000000000 ...

Which would make sense as kprobes may use ftrace if a probe is set at
the same location as a ftrace nop. And the -mfentry moves the place
where the ftrace nop is to the start of a function.

That is, this bug may have always been there, but without -mfentry, the
ftrace nop is not at the start of the function, which means kprobe
smoke tests probably would never land on one. But now that -mfentry is
implemented, it's much more likely.

I'll still look deeper into this. But I also Cc'd Masami.

-- Steve

> =

> commit 644e0e8dc76b919976c44d3929164d42cbe656bc
> Author:     Steven Rostedt (VMware) <rostedt@goodmis.org>
> AuthorDate: Thu Mar 23 10:33:52 2017 -0400
> Commit:     Thomas Gleixner <tglx@linutronix.de>
> CommitDate: Fri Mar 24 10:14:07 2017 +0100
> =

>     x86/ftrace: Add -mfentry support to x86_32 with DYNAMIC_FTRACE set
>     =

>     x86_64 has had fentry support for some time. I did not add support to=
 x86_32
>     as I was unsure if it will be used much in the future. It is still ve=
ry much
>     used, and there's issues with function graph tracing with gcc playing=
 around
>     with the mcount frames, causing function graph to panic. The fentry c=
ode
>     does not have this issue, and is able to cope as there is no frame to=
 mess
>     up.
>     =

>     Note, this only adds support for fentry when DYNAMIC_FTRACE is set. T=
here's
>     really no reason to not have that set, because the performance of the
>     machine drops significantly when it's not enabled.
>     =

>     Keep !DYNAMIC_FTRACE around to test it off, as there's still some arc=
hs
>     that have FTRACE but not DYNAMIC_FTRACE.
>     =

>     Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>     Reviewed-by: Masami Hiramatsu <mhiramat@kernel.org>
>     Reviewed-by: Josh Poimboeuf <jpoimboe@redhat.com>
>     Reviewed-by: Ingo Molnar <mingo@kernel.org>
>     Cc: Peter Zijlstra <peterz@infradead.org>
>     Cc: Andy Lutomirski <luto@amacapital.net>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Link: http://lkml.kernel.org/r/20170323143446.052202377(a)goodmis.org
>     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> =

> ff04b440d2  x86/ftrace: Clean up ftrace_regs_caller
> 644e0e8dc7  x86/ftrace: Add -mfentry support to x86_32 with DYNAMIC_FTRAC=
E set
> f4fa27cbc0  Add linux-next specific files for 20170413
> +----------------+------------+------------+---------------+
> |                | ff04b440d2 | 644e0e8dc7 | next-20170413 |
> +----------------+------------+------------+---------------+
> | boot_successes | 35         | 4          | 2             |
> +----------------+------------+------------+---------------+
> =

> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 9e6fa09147a76480acacba38c58cc563e4bcdaba 39da7c509acff13=
fc8cb12ec1bb20337c988ed36 --
> git bisect  bad f67391ec3106c1d413378e9865607ed333d9f258  # 01:57  B     =
 0     1   12   0  Merge 'tip/timers/core' into devel-spot-201704160001
> git bisect  bad c9e9c5dce19dad94265db1b2d5ab9dd7e5ffc283  # 02:18  B     =
 0    11   24   2  Merge 'peterz-queue/debug/tmp' into devel-spot-201704160=
001
> git bisect  bad 0e96f8517807516f76c5fa5a7d33e8c9606b809e  # 02:40  B     =
 0     7   20   2  Merge 'tip/master' into devel-spot-201704160001
> git bisect good fb1f820a4b89e7e5ac0275b2e6ea420c755bb614  # 03:00  G     =
11     0    0   0  Merge 'linux-review/Liping-Zhang/netfilter-nft_set_bitma=
p-free-dummy-elements-when-destroy-the-set/20170415-234258' into devel-spot=
-201704160001
> git bisect good 143e0e5c2bfeee4d4d1d84c59904d95c52d0ed7b  # 03:20  G     =
11     0    0   0  Merge 'linux-review/Axel-Lin/regulator-rn5t618-Fix-out-o=
f-bounds-array-access/20170415-230416' into devel-spot-201704160001
> git bisect good f3fcb80385a3475a812fde289e03537869ab92af  # 03:38  G     =
10     0    0   0  Merge 'tip/WIP.hotplug' into devel-spot-201704160001
> git bisect good 28c624c63a2d84de073c05f5e2509024a0f743f4  # 03:51  G     =
11     0    0   0  Merge branch 'perf/core'
> git bisect  bad 9b8cacf73d9ab2adf37e7914d2c4db088693a898  # 04:05  B     =
 0    11   22   0  Merge branch 'x86/boot'
> git bisect good a5cd3116254c17a6c236b2aa8da96dddb7587ac3  # 04:20  G     =
11     0    0   0  Merge branch 'x86-mm-for-xen'
> git bisect good d88961b5d4366c33d35d9ad309791ed9e4424f6c  # 04:41  G     =
11     0    0   0  x86/boot/e820: Clean up and standardize sizeof() uses
> git bisect  bad 41aab5b5ca558bcce32adfe723eb02a2642176ce  # 04:52  B     =
 0     5   16   0  Merge branch 'x86/asm'
> git bisect  bad 9a93848fe787a53aec404e4e00d8f7f9bbdaebb4  # 05:08  B     =
 0     7   19   1  x86/debug: Implement __WARN() using UD0
> git bisect good db65d7b6dcd313ad54c3589813f70b805dbb48ec  # 05:25  G     =
11     0    0   0  x86/ftrace: Rename mcount_64.S to ftrace_64.S
> git bisect good ff04b440d2d645fd8a5b3385b1b2e4d19d3fe746  # 05:43  G     =
11     0    0   0  x86/ftrace: Clean up ftrace_regs_caller
> git bisect  bad 1fa9d67a2f07893fc7e4a880867a6cbb81dda547  # 05:57  B     =
 0     7   19   0  x86/ftrace: Use Makefile logic instead of #ifdef for com=
piling ftrace_*.o
> git bisect  bad 644e0e8dc76b919976c44d3929164d42cbe656bc  # 06:08  B     =
 0     3   14   0  x86/ftrace: Add -mfentry support to x86_32 with DYNAMIC_=
FTRACE set
> # first bad commit: [644e0e8dc76b919976c44d3929164d42cbe656bc] x86/ftrace=
: Add -mfentry support to x86_32 with DYNAMIC_FTRACE set
> git bisect good ff04b440d2d645fd8a5b3385b1b2e4d19d3fe746  # 06:18  G     =
31     0    0   0  x86/ftrace: Clean up ftrace_regs_caller
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 644e0e8dc76b919976c44d3929164d42cbe656bc  # 06:27  B     =
 0    11   23   0  x86/ftrace: Add -mfentry support to x86_32 with DYNAMIC_=
FTRACE set
> # extra tests on HEAD of linux-devel/devel-spot-201704160001
> git bisect  bad 9e6fa09147a76480acacba38c58cc563e4bcdaba  # 06:27  B     =
 0    13   27   0  0day head guard for 'devel-spot-201704160001'
> # extra tests on tree/branch linux-next/master
> git bisect  bad f4fa27cbc0b6b9f3f41a8fbd771af3abbc480f13  # 06:39  B     =
 0     3   14   0  Add linux-next specific files for 20170413
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion


--===============0986147753489662151==--

