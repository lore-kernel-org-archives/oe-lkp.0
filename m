Content-Type: multipart/mixed; boundary="===============0705558107491522977=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86] 7b1f0050e4 PANIC: double fault, error_code: 0x0
Date: Tue, 21 Nov 2017 06:33:13 -0700
Message-ID: <B494B6DF-0CA0-4D14-AAF8-683813E3246B@amacapital.net>
In-Reply-To: <20171121101907.k6a4xlzgjhibeopz@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0705558107491522977==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Nov 21, 2017, at 3:19 AM, Fengguang Wu <fengguang.wu@intel.com> wrot=
e:
> =

> Hi Andy,
> =

> FYI, this error looks still active in branch HEAD:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/entry_=
stack.wip
> =


Hmm, I thought I deleted that branch.  Now it's just x86/entry_stack.

> commit 7b1f0050e45387563fb77c5ee18270567573b590
> Author:     Andy Lutomirski <luto@kernel.org>
> AuthorDate: Tue Aug 15 14:49:36 2017 -0700
> Commit:     Andy Lutomirski <luto@kernel.org>
> CommitDate: Sun Nov 12 20:38:57 2017 -0800
> =

>     x86/asm/64: Use a percpu trampoline stack for IDT entries
> =

>     Historically, IDT entries from usermode have always gone directly
>     to the running task's kernel stack.  Rearrange it so that we enter on
>     a percpu trampoline stack and then manually switch to the task's stac=
k.
>     This touches a couple of extra cachelines, but it gives us a chance
>     to run some code before we touch the kernel stack.
> =

>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
> =

> 7eb0bb9aa6  x86/espfix/64: Stop assuming that pt_regs is on the entry sta=
ck
> 7b1f0050e4  x86/asm/64: Use a percpu trampoline stack for IDT entries
> 6ba0c46abf  x86/entry/64: Create a percpu SYSCALL entry trampoline
> +-----------------------------------------+------------+------------+----=
--------+
> |                                         | 7eb0bb9aa6 | 7b1f0050e4 | 6ba=
0c46abf |
> +-----------------------------------------+------------+------------+----=
--------+
> | boot_successes                          | 35         | 0          | 0  =
        |
> | boot_failures                           | 0          | 15         | 11 =
        |
> | PANIC:double_fault                      | 0          | 15         | 11 =
        |
> | RIP:trace_hardirqs_off_thunk            | 0          | 15         | 11 =
        |
> | RIP:__do_page_fault                     | 0          | 15         | 11 =
        |
> | RIP:__lock_acquire                      | 0          | 15         | 11 =
        |
> | Kernel_panic-not_syncing:Machine_halted | 0          | 15         | 11 =
        |
> +-----------------------------------------+------------+------------+----=
--------+
> =

> [    9.297444] rivafb_setup START
> [    9.297836] nvidiafb_setup START
> [    9.298253] VIA Graphics Integration Chipset framebuffer 2.4 initializ=
ing
> [    9.299394] vmlfb: initializing
> [    9.299952] no IO addresses supplied
> [    9.301830] PANIC: double fault, error_code: 0x0
> [    9.302034] CPU: 0 PID: 163 Comm: v86d Not tainted 4.14.0-rc7-00072-g7=
b1f005 #1
> [    9.302034] task: ffff88001a160000 task.stack: ffff8800198e8000
> [    9.302034] RIP: 0010:trace_hardirqs_off_thunk+0x8/0x1c
> [    9.302034] RSP: 0000:ffffffffff576000 EFLAGS: 00010097
> [    9.302034] RAX: 00000000833317c7 RBX: 0000000000000001 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec23 RSI: 1fffffffffeaec23 RDI: ffff88001=
a160208
> [    9.302034] RBP: ffffffffff576020 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5761d8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034] FS:  0000000000000000(0000) GS:ffffffff83c63000(0000) knlG=
S:0000000000000000
> [    9.302034] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    9.302034] CR2: ffffffffff575ff8 CR3: 0000000018248002 CR4: 000000000=
01606b0
> [    9.302034] Call Trace:
> [    9.302034]  <SYSENTER>
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  error_entry+0x73/0xd0
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff5760e0 EFLAGS: 00010802 ORIG_RAX: 0000=
000000000003
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec23 RSI: 1fffffffffeaec23 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaec57 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5761d8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? async_page_fault+0x13/0x60
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576280 EFLAGS: 00010802
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec57 RSI: 1fffffffffeaec57 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaec8b R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576378 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576420 EFLAGS: 00010806
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec8b RSI: 1fffffffffeaec8b RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaecbf R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576518 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff5765c0 EFLAGS: 00010802
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaecbf RSI: 1fffffffffeaecbf RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaecf3 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5766b8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576760 EFLAGS: 00010806
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaecf3 RSI: 1fffffffffeaecf3 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaed27 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576858 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576900 EFLAGS: 00010806
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaed27 RSI: 1fffffffffeaed27 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaed5b R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5769f8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576aa0 EFLAGS: 00010802
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaed5b RSI: 1fffffffffeaed5b RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaed9c R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576b98 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__lock_acquire+0xa4/0x4c20
> [    9.302034] RSP: 0000:ffffffffff576c40 EFLAGS: 00010086
> [    9.302034] RAX: fffffbffffeaed9c RBX: 0000000000000046 RCX: 000000000=
0000000
> [    9.302034] RDX: dffffc0000000000 RSI: 0000000000000000 RDI: ffff88001=
a1603f0
> [    9.302034] RBP: ffffffffff576e30 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: ffff88001=
a1603f0
> [    9.302034] R13: ffff88001a160420 R14: 0000000000000000 R15: ffffffff8=
3d3e6a0
> [    9.302034]  ? __context_tracking_exit+0x39/0x40
> [    9.302034]  ? debug_show_all_locks+0x280/0x280
> [    9.302034]  ? lock_acquire+0xd3/0x1a0
> [    9.302034]  lock_acquire+0xd3/0x1a0
> [    9.302034]  ? __context_tracking_exit+0x39/0x40
> [    9.302034]  vtime_user_exit+0x65/0x190
> [    9.302034]  ? __context_tracking_exit+0x39/0x40
> [    9.302034]  __context_tracking_exit+0x39/0x40
> [    9.302034]  error_entry+0x6d/0xd0
> [    9.302034] RIP: 0033:0x7f4fed4724f0
> [    9.302034] RSP: 002b:00007ffd80ffce40 EFLAGS: 00010202 ORIG_RAX: 0000=
000000000014
> [    9.302034] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
> [    9.302034] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
> [    9.302034] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000=
0000000
> [    9.302034] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [    9.302034] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    9.302034]  ? async_page_fault+0x33/0x60
> [    9.302034]  </SYSENTER>
> [    9.302034] Code: 32 00 e9 44 f8 ff ff 55 48 89 e5 57 56 52 51 50 41 5=
0 41 51 41 52 41 53 48 8b 7d 08 e8 da 72 1a 00 eb 34 55 48 89 e5 57 56 52 5=
1 <50> 41 50 41 51 41 52 41 53 48 8b 7d 08 e8 1e 78 1a 00 eb 18 55 =

> [    9.302034] Kernel panic - not syncing: Machine halted.
> [    9.302034] CPU: 0 PID: 163 Comm: v86d Not tainted 4.14.0-rc7-00072-g7=
b1f005 #1
> [    9.302034] Call Trace:
> [    9.302034]  <#DF>
> [    9.302034]  panic+0x190/0x2d6
> [    9.302034]  ? __stack_chk_fail+0x1a/0x1a
> [    9.302034]  df_debug+0x29/0x30
> [    9.302034]  do_double_fault+0x109/0x1e0
> [    9.302034]  double_fault+0x24/0x30
> [    9.302034] RIP: 0010:trace_hardirqs_off_thunk+0x8/0x1c
> [    9.302034] RSP: 0000:ffffffffff576000 EFLAGS: 00010097
> [    9.302034] RAX: 00000000833317c7 RBX: 0000000000000001 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec23 RSI: 1fffffffffeaec23 RDI: ffff88001=
a160208
> [    9.302034] RBP: ffffffffff576020 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5761d8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  </#DF>
> [    9.302034]  <SYSENTER>
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  error_entry+0x73/0xd0
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff5760e0 EFLAGS: 00010802 ORIG_RAX: 0000=
000000000003
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec23 RSI: 1fffffffffeaec23 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaec57 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5761d8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? async_page_fault+0x13/0x60
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576280 EFLAGS: 00010802
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec57 RSI: 1fffffffffeaec57 RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaec8b R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576378 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff576420 EFLAGS: 00010806
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaec8b RSI: 1fffffffffeaec8b RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaecbf R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff576518 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [    9.302034]  do_page_fault+0x2a/0x70
> [    9.302034]  async_page_fault+0x29/0x60
> [    9.302034] RIP: 0010:__do_page_fault+0x62/0x850
> [    9.302034] RSP: 0000:ffffffffff5765c0 EFLAGS: 00010802
> [    9.302034] RAX: dffffc0000000000 RBX: 0000000000000003 RCX: ffffffff8=
33317c7
> [    9.302034] RDX: fffffbffffeaecbf RSI: 1fffffffffeaecbf RDI: ffff88001=
a160208
> [    9.302034] RBP: fffffbffffeaecf3 R08: 0000000000000001 R09: 000000000=
0000001
> [    9.302034] R10: ffff88001a160000 R11: 0000000000000000 R12: 000000000=
0000003
> [    9.302034] R13: ffffffffff5766b8 R14: 0000000000000000 R15: ffff88001=
a160000
> [    9.302034]  ? native_iret+0x7/0x7
> [    9.302034]  ? bad_area_access_error+0x310/0x310
> [    9.302034]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 44ee113b0722ec382cc607a446e09b7730bf88c9 bebc6082da0a9f5=
d47a1ea2edc099bf671058bd4 --
> git bisect  bad adfb2a3ce377dc0e589120ab4836320ff24916d7  # 14:08  B     =
 0     9   22   0  Merge 'chanwoo-extcon/extcon-next' into devel-hourly-201=
7111604
> git bisect good 1cd9cd736e10b4f64b481e7a027d845c301dc80c  # 14:26  G     =
11     0    0   0  Merge 'arm-platforms/kvm-arm64/fixes-4.14' into devel-ho=
urly-2017111604
> git bisect  bad e12f86ff33e640db2dd2397976b526acd0192d80  # 14:48  B     =
 0    11   24   0  Merge 'linux-review/SF-Markus-Elfring/samples-sockmap-Fi=
x-duplicate-error-messages-in-sockmap_test_sockets/20171112-131951' into de=
vel-hourly-2017111604
> git bisect good 62cf56670db3118feac581df2a8e071fefe7d19d  # 15:11  G     =
11     0    0   0  Merge 'ti/ti-lsk-linux-4.14.y' into devel-hourly-2017111=
604
> git bisect good 78788cfcc17257d0ab85147d698296fe23d7ee8d  # 15:36  G     =
11     0    0   2  Merge 'linux-review/David-Daney/dt-bindings-Add-Cavium-O=
cteon-Common-Ethernet-Interface/20171112-183641' into devel-hourly-20171116=
04
> git bisect good 79cb98f5e0616bf7857f314512d8073517cbf9d2  # 16:13  G     =
11     0    0   4  Merge 'linux-review/Sven-Joachim/builddeb-Pass-the-kerne=
l-debarch-substvar-to-dpkg-genchanges/20171112-162435' into devel-hourly-20=
17111604
> git bisect  bad 27b9091480972ae607e4950b69ec59e21c549645  # 16:41  B     =
 0    11   28   4  Merge 'luto/x86/entry_stack.wip' into devel-hourly-20171=
11604
> git bisect good 5540b99d7fa3235a9d40a5b75fff6b3919ec0022  # 16:58  G     =
11     0    0   0  Merge 'linux-review/Rick-Chen/clocksource-drivers-atcpit=
100-Add-andestech-atcpit100-timer/20171112-153955' into devel-hourly-201711=
1604
> git bisect good 8b17caee94c8bfbed0af9ee97b9b8531a8e81983  # 17:15  G     =
11     0    0   0  x86/unwind/64: Add support for the SYSENTER stack
> git bisect  bad 37c58d3e96a94a7e1dd0f8f4cd33a6493ebf957a  # 17:31  B     =
 0     2   15   0  x86/asm/64: Return to userspace from the trampoline stack
> git bisect good 7eb0bb9aa65852e08ebab3de65ef333fe0144d4c  # 17:54  G     =
10     0    0   0  x86/espfix/64: Stop assuming that pt_regs is on the entr=
y stack
> git bisect  bad 7b1f0050e45387563fb77c5ee18270567573b590  # 18:46  B     =
 0    11   28   4  x86/asm/64: Use a percpu trampoline stack for IDT entries
> # first bad commit: [7b1f0050e45387563fb77c5ee18270567573b590] x86/asm/64=
: Use a percpu trampoline stack for IDT entries
> git bisect good 7eb0bb9aa65852e08ebab3de65ef333fe0144d4c  # 20:00  G     =
31     0    0   0  x86/espfix/64: Stop assuming that pt_regs is on the entr=
y stack
> # extra tests with debug options
> git bisect  bad 7b1f0050e45387563fb77c5ee18270567573b590  # 20:17  B     =
 0     6   20   1  x86/asm/64: Use a percpu trampoline stack for IDT entries
> # extra tests on HEAD of linux-devel/devel-hourly-2017111604
> git bisect  bad 44ee113b0722ec382cc607a446e09b7730bf88c9  # 20:18  B     =
 0    13   29   0  0day head guard for 'devel-hourly-2017111604'
> # extra tests on tree/branch luto/x86/entry_stack.wip
> git bisect  bad 6ba0c46abfbfb7f68c34cfb23b042e74e765edbb  # 20:36  B     =
 0    11   24   0  x86/entry/64: Create a percpu SYSCALL entry trampoline
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> <dmesg-yocto-ivb41-104:20171116181337:x86_64-randconfig-s4-11161312:4.14.=
0-rc7-00072-g7b1f005:1.gz>
> <config-4.14.0-rc7-00072-g7b1f005>
> <reproduce-yocto-ivb41-72:20171116181337:x86_64-randconfig-s4-11161312:4.=
14.0-rc7-00072-g7b1f005:1>

--===============0705558107491522977==--

