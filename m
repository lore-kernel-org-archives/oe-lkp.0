Content-Type: multipart/mixed; boundary="===============1416005675335460535=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/vsyscall] 3dc33bd30f Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Tue, 21 Feb 2017 11:07:44 -0800
Message-ID: <CAGXu5jK0Lc5=9XvL6-Zo5hsVeeOooW1Dcmxz7Mf+-rX78pVc1Q@mail.gmail.com>
In-Reply-To: <20170218052725.s5i37la72t3vbgzz@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1416005675335460535==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 17, 2017 at 9:27 PM, Fengguang Wu <fengguang.wu@intel.com> wr=
ote:
> Hi Kees,
>
> It's an old patch, however the panic still happens in linux-next 20170217.

What version of glibc is running in the yocto image you're booting
with? For it to support CONFIG_LEGACY_VSYSCALL_NONE=3Dy

This is reported in the second one you sent:

[    3.292740] init[1] vsyscall attempted with vsyscall=3Dnone
ip:ffffffffff600400 cs:33 sp:7fff40d03bb8 ax:ffffffffff600400
si:7fc21c995a4c di:7fff40d03c78

I.e. init is expecting to use vsyscalls (it's too old a binary).

glibc 2.14 and later don't require the vsyscall table (as noted in the Kcon=
fig).

-Kees

>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> commit 3dc33bd30f3e1c1bcaaafa3482737694debf0f0b
> Author:     Kees Cook <keescook@chromium.org>
> AuthorDate: Wed Aug 12 17:55:19 2015 -0700
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Sun Sep 20 10:31:06 2015 +0200
>
>      x86/entry/vsyscall: Add CONFIG to control default
>
>      Most modern systems can run with vsyscall=3Dnone. In an effort to
>      provide a way for build-time defaults to lack legacy settings,
>      this adds a new CONFIG to select the type of vsyscall mapping to
>      use, similar to the existing "vsyscall" command line parameter.
>
>      Signed-off-by: Kees Cook <keescook@chromium.org>
>      Acked-by: Andy Lutomirski <luto@amacapital.net>
>      Cc: Borislav Petkov <bp@alien8.de>
>      Cc: Brian Gerst <brgerst@gmail.com>
>      Cc: Denys Vlasenko <dvlasenk@redhat.com>
>      Cc: H. Peter Anvin <hpa@zytor.com>
>      Cc: Josh Triplett <josh@joshtriplett.org>
>      Cc: Linus Torvalds <torvalds@linux-foundation.org>
>      Cc: Peter Zijlstra <peterz@infradead.org>
>      Cc: Thomas Gleixner <tglx@linutronix.de>
>      Link: http://lkml.kernel.org/r/20150813005519.GA11696(a)www.outflux.=
net
>      Signed-off-by: Ingo Molnar <mingo@kernel.org>
>
> +-----------------------------------------------------------+------------=
+------------+-----------+
> |                                                           | c25be94f28 =
| 3dc33bd30f | v4.10-rc8 |
> +-----------------------------------------------------------+------------=
+------------+-----------+
> | boot_successes                                            | 252        =
| 32         | 25        |
> | boot_failures                                             | 0          =
| 56         | 31        |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 0        =
  | 54         | 28        |
> | BUG:kernel_reboot-without-warning_in_boot_stage           | 0          =
| 2          |           |
> | BUG:kernel_hang_in_test_stage                             | 0          =
| 0          | 2         |
> | BUG:kernel_reboot-without-warning_in_test_stage           | 0          =
| 0          | 1         |
> +-----------------------------------------------------------+------------=
+------------+-----------+
>
> [   12.110061] floppy: error -5 while reading block 0
> [   12.130066] floppy: error -5 while reading block 0
> [   12.198488] gfs2: path_lookup on rootfs returned error -2
> [   12.203718] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b
> [   12.203718]
> [   12.206760] CPU: 0 PID: 1 Comm: init Not tainted 4.3.0-rc1-00133-g3dc3=
3bd #1
> [   12.208393] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [   12.210006]  0000000000000000 ffff88001e8cfca8 ffffffff8133b2e0 ffff88=
001e8cfd28
> [   12.210006]  ffffffff810dd97a ffffffff00000010 ffff88001e8cfd38 ffff88=
001e8cfcd0
> [   12.210006]  ffff88001e8d8000 000000000000000b ffff88001e8e4010 000000=
0000000001
> [   12.210006] Call Trace:
> [   12.210006]  [<ffffffff8133b2e0>] dump_stack+0x19/0x1b
> [   12.210006]  [<ffffffff810dd97a>] panic+0xb5/0x1db
> [   12.210006]  [<ffffffff810827cd>] do_exit+0x3fa/0x7d9
> [   12.210006]  [<ffffffff81082c11>] do_group_exit+0x39/0xa1
> [   12.210006]  [<ffffffff8108a9eb>] get_signal+0x4a0/0x4e1
> [   12.210006]  [<ffffffff8100b0d0>] do_signal+0x23/0x440
> [   12.210006]  [<ffffffff81340389>] ? ___ratelimit+0xc8/0xe2
> [   12.210006]  [<ffffffff810ab375>] ? __printk_ratelimit+0x13/0x15
> [   12.210006]  [<ffffffff81003798>] ? warn_bad_vsyscall+0x2e/0x83
> [   12.210006]  [<ffffffff810391bf>] ? bad_area_nosemaphore+0xe/0x10
> [   12.210006]  [<ffffffff810394c2>] ? __do_page_fault+0x15e/0x345
> [   12.210006]  [<ffffffff81003290>] prepare_exit_to_usermode+0x74/0x9d
> [   12.210006]  [<ffffffff81a6c0a2>] retint_user+0x8/0x10
> [   12.210006] Kernel Offset: disabled
>
> Elapsed time: 20
>
> git bisect start v4.4 v4.3 --
> git bisect  bad cd6caf550a2adc763c6301ecc0be01f422fb2aea  # 02:16      7-=
      9  Merge tag 'for-linus-4.4' of git://git.code.sf.net/p/openipmi/linu=
x-ipmi
> git bisect  bad 713009809681e5a7871e96e6992692c805b4480b  # 02:30      0-=
      2  Merge tag 'ext4_for_linus' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/tytso/ext4
> git bisect  bad ccf21b69a83afaee4d5499e0d03eacf23946e08c  # 02:41      0-=
     12  Merge branch 'for-4.4/reservations' of git://git.kernel.dk/linux-b=
lock
> git bisect good b831ef2cad979912850e34f82415c0c5d59de8cb  # 02:58     59+=
      0  Merge branch 'ras-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad ccc9d4a6d640cbde05d519edeb727881646cf71b  # 03:14     30-=
      5  Merge branch 'linus' of git://git.kernel.org/pub/scm/linux/kernel/=
git/herbert/crypto-2.6
> git bisect  bad f323c49b300baf89e2cb4050b0def1856c0b1852  # 03:24      0-=
     15  Merge branch 'x86-cpu-for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tip/tip
> git bisect  bad a75a3f6fc92888e4119744d8594ffdf748c3d444  # 03:35      0-=
      6  Merge branch 'x86-asm-for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/tip/tip
> git bisect good 53528695ff6d8b77011bc818407c13e30914a946  # 03:56     81+=
      0  Merge branch 'sched-core-for-linus' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/tip/tip
> git bisect good d2bea739f8b41d620c235d81e00289d01169dc3c  # 04:13     82+=
      0  Merge branch 'x86-apic-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
> git bisect  bad 034042cc1e2837a584cda0a5e4fc2b0a96b74543  # 04:22      0-=
      1  x86/entry/syscalls: Move syscall table declarations into asm/sysca=
lls.h
> git bisect  bad dd27f998f0ed3c797032a82033fa191be7c61e4c  # 04:36      2-=
      2  x86/entry/64/compat: Fix SYSENTER's NT flag before user memory acc=
ess
> git bisect  bad 0b101e62afe626ecae60173f92f1e0ec72151653  # 04:45      0-=
      3  x86/asm: Force inlining of cpu_relax()
> git bisect  bad 93f13a9f96771a064c716364aebc6e283b186eb8  # 05:00      0-=
      5  x86/entry/vsyscall: Fix undefined symbol warning
> git bisect  bad 3dc33bd30f3e1c1bcaaafa3482737694debf0f0b  # 05:18      1-=
      3  x86/entry/vsyscall: Add CONFIG to control default
> git bisect good c25be94f2870bf75552a41ad8b15f756e19ffb1d  # 06:28     81+=
      0  x86/asm/entry/32, selftests: Add 'test_syscall_vdso' test
> # first bad commit: [3dc33bd30f3e1c1bcaaafa3482737694debf0f0b] x86/entry/=
vsyscall: Add CONFIG to control default
> git bisect good c25be94f2870bf75552a41ad8b15f756e19ffb1d  # 08:36    242+=
      0  x86/asm/entry/32, selftests: Add 'test_syscall_vdso' test
> # extra tests with CONFIG_DEBUG_INFO_REDUCED
> git bisect  bad 3dc33bd30f3e1c1bcaaafa3482737694debf0f0b  # 08:45      0-=
      1  x86/entry/vsyscall: Add CONFIG to control default
> # extra tests on HEAD of linus/master
> git bisect  bad 747ae0a96f1a78b35c5a3d93ad37a16655e16340  # 09:03      0-=
      1  Merge tag 'media/v4.10-4' of git://git.kernel.org/pub/scm/linux/ke=
rnel/git/mchehab/linux-media
> # extra tests on tree/branch linus/master
> git bisect  bad 6dc39c50e4aeb769c8ae06edf2b1a732f3490913  # 09:17      5-=
      2  Merge branch 'for-linus' of git://git.kernel.dk/linux-block
> # extra tests on tree/branch linus/master
> git bisect  bad 6dc39c50e4aeb769c8ae06edf2b1a732f3490913  # 09:17      0-=
      2  Merge branch 'for-linus' of git://git.kernel.dk/linux-block
> # extra tests on tree/branch linux-next/master
> git bisect  bad 4ce4a759a3e221b5265ebd03c2f8888b69a7cf3e  # 09:40      0-=
      1  Add linux-next specific files for 20170217
>
>
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion



-- =

Kees Cook
Pixel Security

--===============1416005675335460535==--

