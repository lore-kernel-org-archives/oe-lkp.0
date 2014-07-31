Content-Type: multipart/mixed; boundary="===============7790700108889968692=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86_64, vsyscall] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Thu, 31 Jul 2014 07:42:42 -0700
Message-ID: <CALCETrVuhs+z0Z4j9waMeRvy3zScYHgO_dS4s4bGASJqC76f0g@mail.gmail.com>
In-Reply-To: <20140731110450.GC9455@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============7790700108889968692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Jul 31, 2014 4:05 AM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>
> On Wed, Jul 30, 2014 at 01:14:06PM -0700, Andy Lutomirski wrote:
> > On Wed, Jul 30, 2014 at 8:33 AM, Fengguang Wu <fengguang.wu@intel.com=
> wrote:
> > > On Wed, Jul 30, 2014 at 07:58:13AM -0700, Andy Lutomirski wrote:
> > >> On Wed, Jul 30, 2014 at 7:29 AM, Fengguang Wu <fengguang.wu@intel.=
com> wrote:
> > >> > Greetings,
> > >> >
> > >> > 0day kernel testing robot got the below dmesg and the first bad co=
mmit is
> > >> >
> > >> > git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git x86/v=
syscall
> > >> > commit 442aba0c6131f0c41dfc5edb6bfb88335556523f
> > >> > Author:     Andy Lutomirski <luto@amacapital.net>
> > >> > AuthorDate: Mon Jun 16 18:50:12 2014 -0700
> > >> > Commit:     Andy Lutomirski <luto@amacapital.net>
> > >> > CommitDate: Mon Jun 30 14:32:44 2014 -0700
> > >>
> > >> Was this a merge?
> > >
> > > It's not a merge commit.
> >
> > Hmm.  It looks like that commit is from a version of x86/vsyscall
> > that's rather out-of-date.  Is it possible that the script is testing
> > an old version of the tree?  I haven't touched it in almost a week, I
> > think.
>
> The current luto/x86/vsyscall HEAD commit
> 1e67c32df4dddf763271c3ace52fdec66877740c has these errors:
>
> +-----------------------------------------------------------+---+
> |                                                           |   |
> +-----------------------------------------------------------+---+
> | boot_successes                                            | 1 |
> | boot_failures                                             | 9 |
> | general_protection_fault                                  | 3 |
> | RIP:crypto_ahash_setkey                                   | 3 |
> | Kernel_panic-not_syncing:Fatal_exception                  | 8 |
> | backtrace:cryptomgr_test                                  | 8 |
> | BUG:unable_to_handle_kernel_paging_request                | 5 |
> | Oops                                                      | 5 |
> | RIP:kzfree                                                | 5 |
> | Kernel_panic-not_syncing:Attempted_to_kill_init_exitcode=3D | 1 |
> | INFO:suspicious_RCU_usage                                 | 1 |
> +-----------------------------------------------------------+---+
>
> mount: can't read '/proc/mounts': No such file or directory
> [   32.915296] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 =
sp 00007fff994dc878 error 15

It looks like your initramfs uses an old glibc that needs vsyscalls,
and it looks like you've built a config that turns off
CONFIG_X86_VSYSCALL_EMULATION.  :)

This is very unlikely to make it into Linux 3.17, though.

> [   32.916078] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 =
sp 00007fff994dbe78 error 15
> [   32.916925] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b
> [   32.916925]
> [   32.917698] CPU: 0 PID: 1 Comm: init Not tainted 3.16.0-rc4-00019-g1e6=
7c32 #1
> [   32.918301]  0000000000000000 ffff880000033cc0 ffffffff81ff4e8f ffff88=
0000033d38
> [   32.918944]  ffffffff81ff1972 ffff880000000010 ffff880000033d48 ffff88=
0000033ce8
> [   32.919611]  ffffffff82c440c0 000000000000000b 8c6318c6318c6320 000000=
07aa003caf
> [   32.920011] Call Trace:
> [   32.920011]  [<ffffffff81ff4e8f>] dump_stack+0x19/0x1b
> [   32.920011]  [<ffffffff81ff1972>] panic+0xcb/0x1fb
> [   32.920011]  [<ffffffff81093b3c>] do_exit+0x3dd/0x80f
> [   32.920011]  [<ffffffff810b0739>] ? local_clock+0x14/0x1d
> [   32.920011]  [<ffffffff8109400f>] do_group_exit+0x75/0xb4
> [   32.920011]  [<ffffffff8109c803>] get_signal_to_deliver+0x48a/0x4aa
> [   32.920011]  [<ffffffff8100231a>] do_signal+0x43/0x5ba
> [   32.920011]  [<ffffffff810b4b95>] ? lock_release_holdtime+0x6c/0x77
> [   32.920011]  [<ffffffff810b83d1>] ? lock_release_non_nested+0xd0/0x21e
> [   32.920011]  [<ffffffff810b0662>] ? sched_clock_cpu+0x4e/0x62
> [   32.920011]  [<ffffffff810fd43f>] ? might_fault+0x4f/0x9c
> [   32.920011]  [<ffffffff810b617f>] ? trace_hardirqs_off_caller+0x36/0xa5
> [   32.920011]  [<ffffffff820048d8>] ? retint_signal+0x11/0x99
> [   32.920011]  [<ffffffff810028b5>] do_notify_resume+0x24/0x53
> [   32.920011]  [<ffffffff82004914>] retint_signal+0x4d/0x99
> [   32.920011] Kernel Offset: 0x0 from 0xffffffff81000000 (relocation ran=
ge: 0xffffffff80000000-0xffffffff9fffffff)
> [   32.920011] drm_kms_helper: panic occurred, switching back to text con=
sole
> [   32.920011]
> [   32.920011] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   32.920011] [ INFO: suspicious RCU usage. ]
> [   32.920011] 3.16.0-rc4-00019-g1e67c32 #1 Not tainted
> [   32.920011] -------------------------------
> [   32.920011] include/linux/rcupdate.h:539 Illegal context switch in RCU=
 read-side critical section!

This one is unrelated, I hope.


> Oops, github needs this link for downloading big files:
>
> https://github.com/fengguang/reproduce-kernel-bug/raw/master/initrd/yocto=
-minimal-i386.cgz

Or https://github.com/fengguang/reproduce-kernel-bug/blob/master/initrd/yoc=
to-minimal-x86_64.cgz,
I guess?  The particular failure you're seeing here is only possible
on 64-bit kernels.

--Andy

--===============7790700108889968692==--

