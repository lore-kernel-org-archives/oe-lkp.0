Content-Type: multipart/mixed; boundary="===============1534319467936921853=="
MIME-Version: 1.0
From: John Stultz <john.stultz@linaro.org>
To: lkp@lists.01.org
Subject: Re: [time] 78a0b9a793a: INFO: possible recursive locking detected ]
Date: Mon, 15 Jun 2015 20:36:10 -0700
Message-ID: <CALAqxLUkrEZvCY+HfMggAc2cYgezdDb37TZE=tOJr2jeok_T1g@mail.gmail.com>
In-Reply-To: <1434424558.18774.198.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1534319467936921853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2015 at 8:15 PM, Huang Ying <ying.huang@intel.com> wrote:
> FYI, we noticed the below changes on
>
> https://git.linaro.org/people/john.stultz/linux.git wip
> commit 78a0b9a793a36f73a9a3330dec00859e15d9ad6d ("time: Do leapsecond adj=
ustment in gettime fastpaths")
>
>
> +------------------------------------------+------------+------------+
> |                                          | 4ae9e1e25d | 78a0b9a793 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 900        | 263        |
> | boot_failures                            | 0          | 37         |
> | INFO:possible_recursive_locking_detected | 0          | 37         |
> | BUG:spinlock_lockup_suspected_on_CPU     | 0          | 15         |
> | EIP_is_at_native_apic_mem_write          | 0          | 15         |
> | EIP_is_at_read_seqcount_begin            | 0          | 15         |
> | backtrace:SYSC_adjtimex                  | 0          | 32         |
> | backtrace:SyS_adjtimex                   | 0          | 32         |
> | backtrace:vfs_write                      | 0          | 7          |
> | backtrace:SyS_write                      | 0          | 7          |
> | BUG:kernel_test_hang                     | 0          | 22         |
> | backtrace:SYSC_clock_adjtime             | 0          | 5          |
> | backtrace:SyS_clock_adjtime              | 0          | 5          |
> | backtrace:lru_add_drain_all              | 0          | 1          |
> | backtrace:SyS_mlock                      | 0          | 2          |
> | backtrace:do_group_exit                  | 0          | 1          |
> | backtrace:SyS_exit_group                 | 0          | 1          |
> | backtrace:cpu_startup_entry              | 0          | 3          |
> | backtrace:__mm_populate                  | 0          | 1          |
> | backtrace:link_path_walk                 | 0          | 1          |
> | backtrace:path_init                      | 0          | 1          |
> | backtrace:do_sys_open                    | 0          | 1          |
> | backtrace:SyS_open                       | 0          | 1          |
> +------------------------------------------+------------+------------+
>
>
> [   23.011400] VFS: Warning: trinity-c1 using old stat() call. Recompile =
your binary.
> [   23.012387]
> [   23.012580] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> [   23.013218] [ INFO: possible recursive locking detected ]
> [   23.013841] 4.1.0-rc5-01505-gd6201b6 #2 Not tainted
> [   23.014419] ---------------------------------------------
> [   23.015051] trinity-c1/22948 is trying to acquire lock:
> [   23.015657]  (tk_core){----..}, at: [<4107d71c>] timekeeping_get_ns+0x=
10/0xe8
> [   23.016564]
> [   23.016564] but task is already holding lock:
> [   23.017241]  (tk_core){----..}, at: [<4107f150>] do_adjtimex+0x58/0xc2
> [   23.017380]
> [   23.017380] other info that might help us debug this:
> [   23.017380]  Possible unsafe locking scenario:
> [   23.017380]
> [   23.017380]        CPU0
> [   23.017380]        ----
> [   23.017380]   lock(tk_core);
> [   23.017380]   lock(tk_core);
> [   23.017380]
> [   23.017380]  *** DEADLOCK ***
> [   23.017380]
> [   23.017380]  May be due to missing lock nesting notation
> [   23.017380]
> [   23.017380] 2 locks held by trinity-c1/22948:
> [   23.017380]  #0:  (timekeeper_lock){-.-...}, at: [<4107f144>] do_adjti=
mex+0x4c/0xc2
> [   23.017380]  #1:  (tk_core){----..}, at: [<4107f150>] do_adjtimex+0x58=
/0xc2
> [   23.017380]
> [   23.017380] stack backtrace:
> [   23.017380] CPU: 1 PID: 22948 Comm: trinity-c1 Not tainted 4.1.0-rc5-0=
1505-gd6201b6 #2
> [   23.017380] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [   23.017380]  00000000 00000000 50211ddc 413ce68a 41c6a910 50211e50 410=
646c2 41551379
> [   23.017380]  41551d81 4155126c 00000000 4fc09210 41c6a910 00001f02 000=
00000 7803e01f
> [   23.017380]  00000000 4fc09210 00000000 00000002 4fc09238 4fc08d40 41c=
506f0 4fc09208
> [   23.017380] Call Trace:
> [   23.017380]  [<413ce68a>] dump_stack+0x49/0x73
> [   23.017380]  [<410646c2>] __lock_acquire+0xb78/0xcd3
> [   23.017380]  [<4106414b>] ? __lock_acquire+0x601/0xcd3
> [   23.017380]  [<41064ad9>] lock_acquire+0x5b/0x7d
> [   23.017380]  [<4107d71c>] ? timekeeping_get_ns+0x10/0xe8
> [   23.017380]  [<4107d5f1>] read_seqcount_begin+0x2e/0x74
> [   23.017380]  [<4107d71c>] ? timekeeping_get_ns+0x10/0xe8
> [   23.017380]  [<4107d71c>] timekeeping_get_ns+0x10/0xe8
> [   23.017380]  [<4107f150>] ? do_adjtimex+0x58/0xc2
> [   23.017380]  [<4107dabf>] __getnstimeofday64_preleap+0x29/0x5d
> [   23.017380]  [<4107f158>] do_adjtimex+0x60/0xc2
> [   23.017380]  [<4107aa8e>] posix_clock_realtime_adj+0xa/0xc
> [   23.017380]  [<4107af8a>] SYSC_clock_adjtime+0x60/0x92
> [   23.017380]  [<4107b732>] SyS_clock_adjtime+0xe/0x10
> [   23.017380]  [<413d3aab>] syscall_call+0x7/0x7
> [   23.017380]  [<413d0000>] ? do_wait_for_common+0x69/0xe4


Yea. With CONFIG_DEBUG_TIMEKEEPING we take the seqlock again, so that
placement of __getnstimeofday64_preleap() - which didn't have the
external lock - inside the timekeeping lock was wrong.

I actually deleted that WIP branch last week, and reworked versions of
the patches (which shouldn't have this issue) have been included in
tip/timers/core.  I still very much appreciate the extra testing being
done on my tree!

thanks
-john

--===============1534319467936921853==--

