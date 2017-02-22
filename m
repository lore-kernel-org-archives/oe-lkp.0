Content-Type: multipart/mixed; boundary="===============8421017858530998377=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [x86/vsyscall] 3dc33bd30f Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Tue, 21 Feb 2017 16:46:49 -0800
Message-ID: <CAGXu5jKHoSKuK9cE+dA0AYNyNVvXdV0yWf-TxQCvdOjaEOCSdw@mail.gmail.com>
In-Reply-To: <CABATaM7zPdGhqqGtFJ8hGRR6UUk+quWsFwiNY8FO1V2G8O3k3A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8421017858530998377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2017 at 4:39 PM, Chunyu Hu <chuhu.ncepu@gmail.com> wrote:
> I hit the similar panic on Fedora 25. Is it the same issue?
>
>
> [    2.527391] Freeing unused kernel memory: 1688K (ffffffffbdf66000 -
> ffffffffbe10c000)
> [    2.535222] Write protecting the kernel read-only data: 14336k
> [    2.542679] Freeing unused kernel memory: 1892K (ffff94cb30827000 -
> ffff94cb30a00000)
> [    2.553482] Freeing unused kernel memory: 700K (ffff94cb30d51000 -
> ffff94cb30e00000)
> [    2.572048] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> Fatal: [    2.598239] traps: init[1] general protection ip:7fc841bfc642
> sp:7ffc3fd85870 error:0no entropy gathering module dete[    2.606473]  in
> libc-2.24.so[7fc841bc5000+1bd000]
> cted

I would not expect a vsyscall table problem if it's truly using glibc
2.24. Maybe something regressed in glibc? That really looks like an
attempt to call vsyscalls?

-Kees

> [    2.617089] Kernel panic - not syncing: Attempted to kill init!
> exitcode=3D0x0000000b
> [    2.617089]
> [    2.618006] CPU: 1 PID: 1 Comm: init Not tainted 4.9.9-200.fc25.x86_64=
 #1
> [    2.618006] Hardware name: NEC Express5800/120Rf-1 [N8100-1212]
> /MS-9146-11A, BIOS 6.0.2N18 05/30/2006
> [    2.618006]  ffffb09180197c38 ffffffffbd3f467d ffff94cb3e30d700
> ffffffffbdc3a268
> [    2.618006]  ffffb09180197cc0 ffffffffbd1bfe28 ffff94cb00000010
> ffffb09180197cd0
> [    2.618006]  ffffb09180197c68 000000001acaa185 ffff94cb3e30d7c0
> 000000000000000b
> [    2.618006] Call Trace:
> [    2.618006]  [<ffffffffbd3f467d>] dump_stack+0x63/0x86
> [    2.618006]  [<ffffffffbd1bfe28>] panic+0xe4/0x22d
> [    2.618006]  [<ffffffffbd0a6e81>] do_exit+0xaf1/0xb00
> [    2.618006]  [<ffffffffbd0a6f17>] do_group_exit+0x47/0xb0
> [    2.618006]  [<ffffffffbd0b23a9>] get_signal+0x289/0x630
> [    2.618006]  [<ffffffffbd026067>] do_signal+0x37/0x690
> [    2.618006]  [<ffffffffbd0ce830>] ? wake_up_state+0x10/0x20
> [    2.618006]  [<ffffffffbd0afc85>] ? signal_wake_up_state+0x25/0x30
> [    2.618006]  [<ffffffffbd0afdbd>] ? complete_signal+0xfd/0x1e0
> [    2.618006]  [<ffffffffbd0b074e>] ? send_signal+0x3e/0x80
> [    2.719026]  [<ffffffffbd003286>] exit_to_usermode_loop+0x76/0xb0
> [    2.719026]  [<ffffffffbd003af0>] prepare_exit_to_usermode+0x40/0x50
> [    2.729016]  [<ffffffffbd81e86f>] retint_user+0x8/0x10
> [    2.729016] Kernel Offset: 0x3c000000 from 0xffffffff81000000 (relocat=
ion
> range: 0xffffffff80000000-0xffffffffbfffffff)
> [    2.729016] ---[ end Kernel panic - not syncing: Attempted to kill ini=
t!
> exitcode=3D0x0000000b
> [    2.729016]
> [    2.759787] ------------[ cut here ]------------
> [    2.760784] WARNING: CPU: 1 PID: 1 at arch/x86/kernel/smp.c:127
> native_smp_send_reschedule+0x3a/0x40
> [    2.760784] Modules linked in:
> [    2.760784] CPU: 1 PID: 1 Comm: init Not tainted 4.9.9-200.fc25.x86_64=
 #1
> [    2.760784] Hardware name: NEC Express5800/120Rf-1 [N8100-1212]
> /MS-9146-11A, BIOS 6.0.2N18 05/30/2006
> [    2.760784]  ffff94cb3fd03de8 ffffffffbd3f467d 0000000000000000
> 0000000000000000
> [    2.760784]  ffff94cb3fd03e28 ffffffffbd0a205b 0000007f3fd19670
> 0000000000000000
> [    2.760784]  ffff94cb3fc19600 0000000000000001 00000000fffb76e8
> ffff94cb3fd12768
> [    2.760784] Call Trace:
> [    2.760784]  <IRQ> [    2.760784]  [<ffffffffbd3f467d>]
> dump_stack+0x63/0x86
> [    2.760784]  [<ffffffffbd0a205b>] __warn+0xcb/0xf0
> [    2.760784]  [<ffffffffbd0a218d>] warn_slowpath_null+0x1d/0x20
> [    2.760784]  [<ffffffffbd04973a>] native_smp_send_reschedule+0x3a/0x40
> [    2.760784]  [<ffffffffbd0e200e>] trigger_load_balance+0x12e/0x1f0
> [    2.760784]  [<ffffffffbd0cf48c>] scheduler_tick+0x9c/0xd0
> [    2.760784]  [<ffffffffbd124270>] ? tick_sched_do_timer+0x50/0x50
> [    2.760784]  [<ffffffffbd113e67>] update_process_times+0x47/0x60
> [    2.760784]  [<ffffffffbd123bc5>] tick_sched_handle.isra.15+0x25/0x60
> [    2.760784]  [<ffffffffbd1242ad>] tick_sched_timer+0x3d/0x70
> [    2.760784]  [<ffffffffbd1148ce>] __hrtimer_run_queues+0xee/0x260
> [    2.760784]  [<ffffffffbd11505a>] hrtimer_interrupt+0x9a/0x180
> [    2.760784]  [<ffffffffbd04bf08>] local_apic_timer_interrupt+0x38/0x60
> [    2.760784]  [<ffffffffbd820a6d>] smp_apic_timer_interrupt+0x3d/0x50
> [    2.760784]  [<ffffffffbd81fc2c>] apic_timer_interrupt+0x8c/0xa0
> [    2.760784]  <EOI> [    2.760784]  [<ffffffffbd1bff31>] ?
> panic+0x1ed/0x22d
> [    2.760784]  [<ffffffffbd1bff2a>] ? panic+0x1e6/0x22d
> [    2.760784]  [<ffffffffbd0a6e81>] do_exit+0xaf1/0xb00
> [    2.760784]  [<ffffffffbd0a6f17>] do_group_exit+0x47/0xb0
> [    2.760784]  [<ffffffffbd0b23a9>] get_signal+0x289/0x630
> [    2.760784]  [<ffffffffbd026067>] do_signal+0x37/0x690
> [    2.760784]  [<ffffffffbd0ce830>] ? wake_up_state+0x10/0x20
> [    2.760784]  [<ffffffffbd0afc85>] ? signal_wake_up_state+0x25/0x30
> [    2.760784]  [<ffffffffbd0afdbd>] ? complete_signal+0xfd/0x1e0
> [    2.760784]  [<ffffffffbd0b074e>] ? send_signal+0x3e/0x80
> [    2.760784]  [<ffffffffbd003286>] exit_to_usermode_loop+0x76/0xb0
> [    2.760784]  [<ffffffffbd003af0>] prepare_exit_to_usermode+0x40/0x50
> [    2.760784]  [<ffffffffbd81e86f>] retint_user+0x8/0x10
> [    2.760784] ---[ end trace 700147443b06188a ]---



-- =

Kees Cook
Pixel Security

--===============8421017858530998377==--

