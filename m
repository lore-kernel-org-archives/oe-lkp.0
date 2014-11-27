Content-Type: multipart/mixed; boundary="===============1799868301630103208=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:790 rcu_nmi_enter()
Date: Wed, 26 Nov 2014 20:37:39 -0800
Message-ID: <20141127043739.GC6818@wfg-t540p.sh.intel.com>
In-Reply-To: <CALCETrW_-iJ7hW5kKqbFtzaGSS1ryHreXNidF4tCU6DDwgZxAQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1799868301630103208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Wed, Nov 26, 2014 at 04:42:00PM -0800, Andy Lutomirski wrote:
> On Wed, Nov 26, 2014 at 11:55 AM, Fengguang Wu <fengguang.wu@intel.com>=
 wrote:
> > Hi Andy,
> >
> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/parano=
id
> >
> > commit 995b9074245bb97a669cb0f1e0942b4f086f8e31
> > Author:     Andy Lutomirski <luto@amacapital.net>
> > AuthorDate: Fri Nov 21 17:35:26 2014 -0800
> > Commit:     Andy Lutomirski <luto@amacapital.net>
> > CommitDate: Mon Nov 24 11:56:06 2014 -0800
> =

> Good catch!  I didn't catch this bug testing it myself, but I think I
> caught and fixed it by inspection.
> =

> Is the robot behind on my branch?

Yes, sure. I aim to test every kernel tree/branch in the world.

> I *think* you're a couple days out of date.  If not, I need to
> investigate further.

You inspected it right. If the latest HEAD commit on your side is this,

commit 0a584d301550531d87debefeef554c7b74f401f3
Author:     Andy Lutomirski <luto@amacapital.net>
AuthorDate: Mon Nov 17 15:55:42 2014 -0800
Commit:     Andy Lutomirski <luto@amacapital.net>
CommitDate: Mon Nov 24 17:45:16 2014 -0800

    x86, mce: Improve timeout error messages
    =

    There are four different possible types of timeouts.  Distinguish
    them in the logs to help debug them.
    =

    Signed-off-by: Andy Lutomirski <luto@amacapital.net>


I've tested it and it's actually good as shown in the bisect log:

> > # extra tests on tree/branch luto/x86/paranoid
> > git bisect good 0a584d301550531d87debefeef554c7b74f401f3  # 14:15    36=
0+      0  x86, mce: Improve timeout error messages

Thanks,
Fengguang

> >     [TEST ONLY] Force RCU NMI nesting
> >
> > +--------------------------------------------------------+------------+=
------------+------------+
> > |                                                        | b7b2ac6ea2 |=
 995b907424 | d962a8c53c |
> > +--------------------------------------------------------+------------+=
------------+------------+
> > | boot_successes                                         | 360        |=
 81         | 12         |
> > | boot_failures                                          | 0          |=
 39         | 4          |
> > | WARNING:at_kernel/rcu/tree.c:#rcu_nmi_enter()          | 0          |=
 39         | 4          |
> > | WARNING:at_kernel/rcu/tree.c:#rcu_nmi_exit()           | 0          |=
 39         | 4          |
> > | WARNING:at_kernel/rcu/tree.c:#rcu_eqs_exit_common()    | 0          |=
 39         | 4          |
> > | WARNING:at_kernel/rcu/tree.c:#rcu_eqs_enter_common()   | 0          |=
 39         | 4          |
> > | WARNING:at_kernel/sched/sched.h:#select_task_rq_fair() | 0          |=
 39         | 4          |
> > | backtrace:do_fork                                      | 0          |=
 39         | 4          |
> > | backtrace:kthreadd                                     | 0          |=
 39         | 4          |
> > | backtrace:__call_usermodehelper                        | 0          |=
 19         | 2          |
> > | backtrace:do_execve_common                             | 0          |=
 39         | 4          |
> > | backtrace:SyS_execve                                   | 0          |=
 39         | 4          |
> > | backtrace:SyS_clone                                    | 0          |=
 39         | 4          |
> > | backtrace:wait_for_helper                              | 0          |=
 30         | 3          |
> > | backtrace:do_execve                                    | 0          |=
 15         | 2          |
> > | backtrace:run_init_process                             | 0          |=
 15         | 2          |
> > | WARNING:CPU:#PID:#at_kernel/sched/sched.h:#select_task | 0          |=
 0          | 1          |
> > +--------------------------------------------------------+------------+=
------------+------------+
> >
> >
> > [    0.164000] ------------[ cut here ]------------
> > [    0.164000] ------------[ cut here ]------------
> > [    0.164000] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:790 rcu_nmi_=
enter+0xd6/0xf0()
> > [    0.164000] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:790 rcu_nmi_=
enter+0xd6/0xf0()
> > [    0.164000] Modules linked in:
> > [    0.164000] Modules linked in:
> >
> > [    0.164000] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.18.0-rc6-000=
06-g995b907 #169
> > [    0.164000] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.18.0-rc6-000=
06-g995b907 #169
> > [    0.164000]  c21933b8
> > [    0.164000]  c21933b8 cfc7fe4c cfc7fe4c c1db13a9 c1db13a9 00000000 0=
0000000 cfc7fe80 cfc7fe80 c1086c7c c1086c7c c218eb9c c218eb9c 00000001 0000=
0001
> >
> > [    0.164000]  00000000
> > [    0.164000]  00000000 c21933b8 c21933b8 00000316 00000316 c111dfb6 c=
111dfb6 00000316 00000316 c111dfb6 c111dfb6 cfc7febc cfc7febc 00000000 0000=
0000
> >
> > [    0.164000]  cfc7d490
> > [    0.164000]  cfc7d490 cfc7fe90 cfc7fe90 c1086cf9 c1086cf9 00000009 0=
0000009 00000000 00000000 cfc7fe98 cfc7fe98 c111dfb6 c111dfb6 cfc7feb4 cfc7=
feb4
> >
> > [    0.164000] Call Trace:
> > [    0.164000] Call Trace:
> > [    0.164000]  [<c1db13a9>] dump_stack+0xb8/0x108
> > [    0.164000]  [<c1db13a9>] dump_stack+0xb8/0x108
> > [    0.164000]  [<c1086c7c>] warn_slowpath_common+0xcc/0x110
> > [    0.164000]  [<c1086c7c>] warn_slowpath_common+0xcc/0x110
> > [    0.164000]  [<c111dfb6>] ? rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c111dfb6>] ? rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c111dfb6>] ? rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c111dfb6>] ? rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c1086cf9>] warn_slowpath_null+0x39/0x50
> > [    0.164000]  [<c1086cf9>] warn_slowpath_null+0x39/0x50
> > [    0.164000]  [<c111dfb6>] rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c111dfb6>] rcu_nmi_enter+0xd6/0xf0
> > [    0.164000]  [<c10051b3>] do_int3+0xf3/0x290
> > [    0.164000]  [<c10051b3>] do_int3+0xf3/0x290
> > [    0.164000]  [<c1402cfb>] ? trace_hardirqs_off_thunk+0xc/0x11
> > [    0.164000]  [<c1402cfb>] ? trace_hardirqs_off_thunk+0xc/0x11
> > [    0.164000]  [<c1dc75cd>] int3+0x31/0x38
> > [    0.164000]  [<c1dc75cd>] int3+0x31/0x38
> > [    0.164000]  [<c106cb13>] ? native_safe_halt+0x13/0x30
> > [    0.164000]  [<c106cb13>] ? native_safe_halt+0x13/0x30
> > [    0.164000]  [<c100bf6b>] ? default_do_nmi+0x4b/0x4b
> > [    0.164000]  [<c100bf6b>] ? default_do_nmi+0x4b/0x4b
> > [    0.164000]  [<c10fd30a>] ? trace_hardirqs_on_caller+0x27a/0x3f0
> > [    0.164000]  [<c10fd30a>] ? trace_hardirqs_on_caller+0x27a/0x3f0
> > [    0.164000]  [<c100c416>] do_nmi+0x166/0x220
> > [    0.164000]  [<c100c416>] do_nmi+0x166/0x220
> > [    0.164000]  [<c1dc754a>] nmi_stack_correct+0x28/0x2d
> > [    0.164000]  [<c1dc754a>] nmi_stack_correct+0x28/0x2d
> > [    0.164000]  [<c106cb13>] ? native_safe_halt+0x13/0x30
> > [    0.164000]  [<c106cb13>] ? native_safe_halt+0x13/0x30
> > [    0.164000]  [<c1016029>] default_idle+0x29/0x40
> > [    0.164000]  [<c1016029>] default_idle+0x29/0x40
> > [    0.164000]  [<c1017377>] arch_cpu_idle+0x17/0x30
> > [    0.164000]  [<c1017377>] arch_cpu_idle+0x17/0x30
> > [    0.164000]  [<c10ef722>] cpu_startup_entry+0x722/0x870
> > [    0.164000]  [<c10ef722>] cpu_startup_entry+0x722/0x870
> > [    0.164000]  [<c10590b9>] ? setup_APIC_timer+0x109/0x120
> > [    0.164000]  [<c10590b9>] ? setup_APIC_timer+0x109/0x120
> > [    0.164000]  [<c10567be>] start_secondary+0x38e/0x440
> > [    0.164000]  [<c10567be>] start_secondary+0x38e/0x440
> > [    0.164000] ---[ end trace 2458105dd873601c ]---
> > [    0.164000] ---[ end trace 2458105dd873601c ]---
> >
> > git bisect start d962a8c53cb93a1841e5e54a60ce7f52f5ebd5cf 5d01410fe4d92=
081f349b013a2e7a95429e4f2c9 --
> > git bisect good 95336268c2f9a2418f5f0e46f4b7970af6d2bd34  # 09:42     8=
0+      0  Merge 'wireless-testing/master' into devel-cairo-smoke-201411250=
813
> > git bisect  bad fcea503aa41277952d2fc2e8b6b056220dddd32c  # 10:08     1=
0-      1  Merge 'luto/x86/paranoid' into devel-cairo-smoke-201411250813
> > git bisect good 449d9d1087c0783f04b8f18554f2c43e03b844a8  # 10:52    12=
0+      0  x86: Clean up current_stack_pointer
> > git bisect good b7b2ac6ea2b5951189cf2fdb801a82a36cb3faeb  # 11:15    12=
0+      0  x86, mce: Improve timeout error messages
> > git bisect  bad 995b9074245bb97a669cb0f1e0942b4f086f8e31  # 12:44     3=
0-     16  [TEST ONLY] Force RCU NMI nesting
> > # first bad commit: [995b9074245bb97a669cb0f1e0942b4f086f8e31] [TEST ON=
LY] Force RCU NMI nesting
> > git bisect good b7b2ac6ea2b5951189cf2fdb801a82a36cb3faeb  # 12:53    36=
0+      0  x86, mce: Improve timeout error messages
> > # extra tests on HEAD of linux-devel/devel-cairo-smoke-201411250813
> > git bisect  bad d962a8c53cb93a1841e5e54a60ce7f52f5ebd5cf  # 12:53      =
0-      4  0day head guard for 'devel-cairo-smoke-201411250813'
> > # extra tests on tree/branch luto/x86/paranoid
> > git bisect good 0a584d301550531d87debefeef554c7b74f401f3  # 14:15    36=
0+      0  x86, mce: Improve timeout error messages
> > # extra tests on tree/branch linus/master
> > git bisect good 5d01410fe4d92081f349b013a2e7a95429e4f2c9  # 15:07    36=
0+      0  Linux 3.18-rc6
> > # extra tests on tree/branch next/master
> >
> >
> > This script may reproduce the error.
> >
> > -----------------------------------------------------------------------=
-----
> > #!/bin/bash
> >
> > kernel=3D$1
> > initrd=3Dquantal-core-i386.cgz
> >
> > wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw=
/master/initrd/$initrd
> >
> > kvm=3D(
> >         qemu-system-x86_64
> >         -enable-kvm
> >         -cpu Haswell,+smep,+smap
> >         -kernel $kernel
> >         -initrd $initrd
> >         -m 320
> >         -smp 2
> >         -net nic,vlan=3D1,model=3De1000
> >         -net user,vlan=3D1
> >         -boot order=3Dnc
> >         -no-reboot
> >         -watchdog i6300esb
> >         -rtc base=3Dlocaltime
> >         -serial stdio
> >         -display none
> >         -monitor null
> > )
> >
> > append=3D(
> >         hung_task_panic=3D1
> >         earlyprintk=3DttyS0,115200
> >         debug
> >         apic=3Ddebug
> >         sysrq_always_enabled
> >         rcupdate.rcu_cpu_stall_timeout=3D100
> >         panic=3D-1
> >         softlockup_panic=3D1
> >         nmi_watchdog=3Dpanic
> >         oops=3Dpanic
> >         load_ramdisk=3D2
> >         prompt_ramdisk=3D0
> >         console=3DttyS0,115200
> >         console=3Dtty0
> >         vga=3Dnormal
> >         root=3D/dev/ram0
> >         rw
> >         drbd.minor_count=3D8
> > )
> >
> > "${kvm[@]}" --append "${append[*]}"
> > -----------------------------------------------------------------------=
-----
> >
> > Thanks,
> > Fengguang
> >
> > _______________________________________________
> > LKP mailing list
> > LKP(a)linux.intel.com
> >
> =

> =

> =

> -- =

> Andy Lutomirski
> AMA Capital Management, LLC

--===============1799868301630103208==--

