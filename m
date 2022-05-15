Content-Type: multipart/mixed; boundary="===============7705704043600981439=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 9c5743dff4: WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore
Date: Sun, 15 May 2022 11:06:49 +0800
Message-ID: <20220515030416.GA5866@xsang-OptiPlex-9020>
In-Reply-To: <Yn6Rhv+VhZlVpOjt@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============7705704043600981439==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Boris,

On Fri, May 13, 2022 at 07:12:38PM +0200, Borislav Petkov wrote:
> On Fri, May 13, 2022 at 09:52:08AM -0700, Linus Torvalds wrote:
> > On Fri, May 13, 2022 at 1:55 AM kernel test robot <oliver.sang@intel.=
com> wrote:
> > >
> > > FYI, we noticed the following commit (built with gcc-11): commit
> > > 9c5743dff415 ("x86/uaccess: fix code generation in put_user()")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> Err, is this seriously a report for a 5.9-something kernel?

yeah, after some update such like test suite, kconfig, it's possible for us=
 to
tigger some bisection again which finally points to old commit.

> =

> [  266.828722][    T1] CPU: 0 PID: 1 Comm: init Not tainted 5.9.0-13419-g=
9c5743dff415 #1
> =

> > >
> > > in testcase: boot
> > >
> > > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp=
 2 -m 16G
> > >
> > > caused below changes (please refer to attached dmesg/kmsg for entire =
log/backtrace):
> =

> Can you reproduce the same with the latest Linus master or tip/master or
> something current...?

sorry about this, "WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore"
cannot be reproduced on v5.18-rc6.

the problem is our bot actually picks
   "dmesg.Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D"
to do the bisection, unfortunately, this is still existing on v5.18-rc6 [1],
which confused our bot to regard this as a valid report.
(while generating final reports, bot tried to pick specific warning from dm=
esg)

we will investigate to avoid this kind of problem.


3cb12d27ff655e57 9c5743dff415a7384669229d327
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :50          82%          41:52    dmesg.Kernel_panic-not_syncin=
g:Attempted_to_kill_init!exitcode=3D  <--- still in v5.18-rc6
           :50          82%          41:52    dmesg.RIP:copy_kernel_to_fpre=
gs
           :50          82%          41:52    dmesg.RIP:ex_handler_fprestore
           :50          82%          41:52    dmesg.WARNING:at_arch/x86/mm/=
extable.c:#ex_handler_fprestore  <--- not in v5.18-rc6


[1]
[  255.392247][    T1] init: Failed to spawn kernel-tests main process: una=
ble to execute: Bad address
[  255.451755][    T1] init[1] bad frame in rt_sigreturn frame:00007ffeaf88=
1638 ip:7fbde926f700 sp:7ffeaf881bf8 orax:ffffffffffffffff in libc-2.15.so[=
7fbde9
239000+1b3000]
[  255.563440][  T223] init (223) used greatest stack depth: 11904 bytes le=
ft
[  255.566005][    T1] init[1] bad frame in rt_sigreturn frame:00007ffeaf88=
0ef8 ip:7fbde92f6c3e sp:7ffeaf8814c0 orax:ffffffffffffffff in libc-2.15.so[=
7fbde9
239000+1b3000]
[  255.573639][    T1] Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b
[  255.575676][    T1] CPU: 0 PID: 1 Comm: init Not tainted 5.18.0-rc6 #1
[  255.577359][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[  255.579574][    T1] Call Trace:
[  255.580392][    T1]  <TASK>
[  255.581213][    T1]  ? __dump_stack+0x6e/0x9d
[  255.582373][    T1]  ? dump_stack+0x37/0x64
[  255.583666][    T1]  ? panic+0x575/0xc88
[  255.584657][    T1]  ? rcuwait_wake_up+0x264/0x3d0
[  255.586047][    T1]  ? do_exit.cold+0x54/0x124
[  255.587132][    T1]  ? do_group_exit+0x89/0x2d0
[  255.588365][    T1]  ? get_signal+0x1cdc/0x1ce0
[  255.589512][    T1]  ? arch_do_signal_or_restart+0x28/0x150
[  255.591205][    T1]  ? exit_to_user_mode_prepare+0x834/0x8c0
[  255.592565][    T1]  ? syscall_exit_to_user_mode+0x16/0x50
[  255.594023][    T1]  ? do_syscall_64+0x70/0x90
[  255.595318][    T1]  ? file_end_write+0x46/0x490
[  255.596623][    T1]  ? rcu_read_lock_sched_held+0xdf/0x1d0
[  255.598142][    T1]  ? tracer_hardirqs_on+0x1bb/0x1d0
[  255.599418][    T1]  ? static_key_count+0x77/0x80
[  255.600884][    T1]  ? do_syscall_64+0x11/0x90
[  255.601994][    T1]  ? entry_SYSCALL_64_after_hwframe+0x44/0xae
[  255.603462][    T1]  </TASK>
[  255.604508][    T1] Kernel Offset: disabled


> =

> Thx.
> =

> -- =

> Regards/Gruss,
>     Boris.
> =

> https://people.kernel.org/tglx/notes-about-netiquette
--===============7705704043600981439==--

