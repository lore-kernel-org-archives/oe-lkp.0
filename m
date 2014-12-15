Content-Type: multipart/mixed; boundary="===============1177080992196909002=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [x86_64, vsyscall] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Sun, 14 Dec 2014 17:03:05 -0800
Message-ID: <CALCETrUYd3obWmBRWooA+J1fpxvsjvLEyReZ=2weMUQHhgykrg@mail.gmail.com>
In-Reply-To: <1418605089.5745.139.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1177080992196909002==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2014 at 4:58 PM, Huang Ying <ying.huang@linux.intel.com> =
wrote:
> FYI, we noticed the below changes on
>
> commit 1ad83c858c7d4ea210429142c99a1548e6715a35 ("x86_64,vsyscall: Make v=
syscall emulation configurable")
>

This is expected.  You turned off an expert option, disabling
emulation of a deprecated feature that your init needs. :)  If you
enable that option but boot with vsyscall=3Dnone, you'll get the same
OOPS, but you'll get a helpful error message, too.

Either force CONFIG_X86_VSYSCALL_EMULATION=3Dy or upgrade to a modern
gilbc and make sure you rebuild all your static binaries.

--Andy

>
> +-----------------------------------------------------------+------------=
+------------+
> |                                                           | 95c46b5692 =
| 1ad83c858c |
> +-----------------------------------------------------------+------------=
+------------+
> | boot_successes                                            | 20         =
| 1          |
> | early-boot-hang                                           | 1          =
|            |
> | boot_failures                                             | 0          =
| 9          |
> | Kernel_panic-not_syncing:Attempted_to_kill_init!exitcode=3D | 0        =
  | 9          |
> +-----------------------------------------------------------+------------=
+------------+
>
>
> bootlogd.
> [   18.959051] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 =
sp 00007fffa5199598 error 15
> [   18.960174] init[1]: segfault at ffffffffff600400 ip ffffffffff600400 =
sp 00007fffa5198a78 error 15
> [   18.961242] Kernel panic - not syncing: Attempted to kill init! exitco=
de=3D0x0000000b
> [   18.961242]
> [   18.962183] CPU: 0 PID: 1 Comm: init Not tainted 3.18.0-g5fbea33 #102
> [   18.962834] Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
> [   18.963339]  0000000000000001 ffff88001146fc38 ffffffff820e3f19 000000=
0000000001
> [   18.963339]  ffffffff82a10f58 ffff88001146fcb8 ffffffff820df795 ffffff=
ff8116cf66
> [   18.963339]  0000000000000010 ffff88001146fcc8 ffff88001146fc68 ffff88=
001146fc98
> [   18.963339] Call Trace:
> [   18.963339]  [<ffffffff820e3f19>] dump_stack+0x7c/0xa9
> [   18.963339]  [<ffffffff820df795>] panic+0x107/0x2b3
> [   18.963339]  [<ffffffff8116cf66>] ? do_exit+0xd86/0x1100
> [   18.963339]  [<ffffffff8116d278>] do_exit+0x1098/0x1100
> [   18.963339]  [<ffffffff81176bf2>] ? __sigqueue_free+0x52/0x60
> [   18.963339]  [<ffffffff8116d3cf>] do_group_exit+0x7f/0x140
> [   18.963339]  [<ffffffff8117ce35>] get_signal+0xb85/0xd00
> [   18.963339]  [<ffffffff811ae619>] ? sched_clock_cpu+0x159/0x190
> [   18.963339]  [<ffffffff81072654>] do_signal+0x24/0x1b0
> [   18.963339]  [<ffffffff811dc678>] ? do_raw_spin_unlock+0xf8/0x150
> [   18.963339]  [<ffffffff811e0000>] ? state_store+0xe0/0x120
> [   18.963339]  [<ffffffff820dfc79>] ? printk+0x4d/0x56
> [   18.963339]  [<ffffffff811af6e1>] ? vtime_account_user+0x91/0xa0
> [   18.963339]  [<ffffffff812ac5ce>] ? context_tracking_user_exit+0x13e/0=
x200
> [   18.963339]  [<ffffffff81072998>] do_notify_resume+0x1b8/0x200
> [   18.963339]  [<ffffffff821080bc>] retint_signal+0x48/0x8c
> [   18.963339] Kernel Offset: 0x0 from 0xffffffff81000000 (relocation ran=
ge: 0xffffffff80000000-0xffffffff9fffffff)
>
> Elapsed time: 25
>
> Thanks,
> Huang, Ying
>
>
> _______________________________________________
> LKP mailing list
> LKP(a)linux.intel.com
>
>



-- =

Andy Lutomirski
AMA Capital Management, LLC

--===============1177080992196909002==--

