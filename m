Content-Type: multipart/mixed; boundary="===============4753454713714398492=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: lkp@lists.01.org
Subject: Re: b9ca5f8560 ("tty: pty: Fix race condition between .."): WARNING: possible circular locking dependency detected
Date: Fri, 29 Mar 2019 15:49:12 +0100
Message-ID: <20190329144912.GA13805@kroah.com>
In-Reply-To: <5c9e0c8d.seShxg/Fx+3ABgH1%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4753454713714398492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 08:16:13PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> =

> commit b9ca5f8560af244489b4a1bc1ae88b341f24bc95
> Author:     Sahara <keun-o.park@darkmatter.ae>
> AuthorDate: Mon Feb 11 11:09:15 2019 +0400
> Commit:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> CommitDate: Thu Mar 28 01:28:23 2019 +0900
> =

>     tty: pty: Fix race condition between release_one_tty and pty_write
>     =

>     Especially when a linked tty is used such as pty, the linked tty
>     port's buf works have not been cancelled while master tty port's
>     buf work has been cancelled. Since release_one_tty and flush_to_ldisc
>     run in workqueue threads separately, when pty_cleanup happens and
>     link tty port is freed, flush_to_ldisc tries to access freed port
>     and port->itty, eventually it causes a panic.
>     This patch utilizes the magic value with holding the tty_mutex to
>     check if the tty->link is valid.
>     =

>     Fixes: 2b022ab7542d ("pty: cancel pty slave port buf's work in tty_re=
lease")
>     Signed-off-by: Sahara <keun-o.park@darkmatter.ae>
>     Cc: stable <stable@vger.kernel.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> =

> 75ddbc1fb1  tty: vt.c: Fix TIOCL_BLANKSCREEN console blanking if blankint=
erval =3D=3D 0
> b9ca5f8560  tty: pty: Fix race condition between release_one_tty and pty_=
write
> 1baf02ec98  Add linux-next specific files for 20190329
> +-------------------------------------------------------+------------+---=
---------+---------------+
> |                                                       | 75ddbc1fb1 | b9=
ca5f8560 | next-20190329 |
> +-------------------------------------------------------+------------+---=
---------+---------------+
> | boot_successes                                        | 33         | 0 =
         | 0             |
> | boot_failures                                         | 0          | 13=
         | 15            |
> | WARNING:possible_circular_locking_dependency_detected | 0          | 13=
         | 15            |
> +-------------------------------------------------------+------------+---=
---------+---------------+
> =

> [   15.391201] Freeing unused kernel image memory: 944K
> [   15.393319] Run /init as init process
> [   15.477473] random: init: uninitialized urandom read (12 bytes read)
> [   15.558322] =

> [   15.559003] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   15.561203] WARNING: possible circular locking dependency detected
> [   15.563150] 5.1.0-rc1-00016-gb9ca5f8 #1 Not tainted
> [   15.568331] ------------------------------------------------------
> [   15.580095] rc.local/191 is trying to acquire lock:
> [   15.589105] (____ptrval____) (tty_mutex){+.+.}, at: pty_write+0x2f/0xb7
> [   15.600307] =

> [   15.600307] but task is already holding lock:
> [   15.602974] (____ptrval____) (&ldata->output_lock){+.+.}, at: n_tty_wr=
ite+0x115/0x3bb
> [   15.605798] =

> [   15.605798] which lock already depends on the new lock.
> [   15.605798] =

> [   15.608300] =

> [   15.608300] the existing dependency chain (in reverse order) is:
> [   15.611994] =

> [   15.611994] -> #4 (&ldata->output_lock){+.+.}:
> [   15.623017]        __mutex_lock+0x79/0x372
> [   15.623045]        n_tty_write+0x115/0x3bb
> [   15.623049]        tty_write+0x194/0x22b
> [   15.623079]        vfs_write+0xb1/0xd5
> [   15.623086]        ksys_write+0x4b/0x7b
> [   15.647711] init: plymouth main process (195) killed by SEGV signal
> [   15.650724]        do_syscall_64+0x58/0x66
> [   15.650754]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   15.685239] =

> [   15.685239] -> #3 (&o_tty->termios_rwsem/1){++++}:
> [   15.685299]        down_write+0x3c/0x7b
> [   15.685307]        tty_unthrottle+0x14/0x49
> [   15.685332]        n_tty_open+0x86/0x8d
> [   15.685338]        tty_ldisc_open+0x22/0x30
> [   15.685366]        tty_ldisc_setup+0x2d/0x4c
> [   15.727650]        tty_init_dev+0xfe/0x193
> [   15.727657]        ptmx_open+0x92/0x150
> [   15.727666]        chrdev_open+0x16c/0x18f
> [   15.727672]        do_dentry_open+0x181/0x298
> [   15.727678]        path_openat+0x528/0x650
> [   15.727689]        do_filp_open+0x48/0x9e
> [   15.735723]        do_sys_open+0x5c/0xc3
> [   15.739572]        do_syscall_64+0x58/0x66
> [   15.746991]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   15.757427] =

> [   15.757427] -> #2 (&tty->ldisc_sem){++++}:
> [   15.766988]        __ldsem_down_write_nested+0x42/0x21f
> [   15.773999]        tty_ldisc_lock+0x46/0x60
> [   15.776112]        tty_init_dev+0xd7/0x193
> [   15.777865]        tty_open+0x2f7/0x31d
> [   15.779223]        chrdev_open+0x16c/0x18f
> [   15.780654]        do_dentry_open+0x181/0x298
> [   15.781991]        path_openat+0x528/0x650
> [   15.789623]        do_filp_open+0x48/0x9e
> [   15.796915]        do_sys_open+0x5c/0xc3
> [   15.804146]        kernel_init_freeable+0x215/0x284
> [   15.813157]        kernel_init+0x5/0xeb
> [   15.820251]        ret_from_fork+0x24/0x30
> [   15.827767] =

> [   15.827767] -> #1 (&tty->legacy_mutex){+.+.}:
> [   15.836777]        __mutex_lock+0x79/0x372
> [   15.838698]        tty_init_dev+0x43/0x193
> [   15.840349]        tty_open+0x2f7/0x31d
> [   15.841760]        chrdev_open+0x16c/0x18f
> [   15.843071]        do_dentry_open+0x181/0x298
> [   15.844358]        path_openat+0x528/0x650
> [   15.848305]        do_filp_open+0x48/0x9e
> [   15.855789]        do_sys_open+0x5c/0xc3
> [   15.863014]        kernel_init_freeable+0x215/0x284
> [   15.871967]        kernel_init+0x5/0xeb
> [   15.879349]        ret_from_fork+0x24/0x30
> [   15.881580] =

> [   15.881580] -> #0 (tty_mutex){+.+.}:
> [   15.883640]        lock_acquire+0x144/0x16f
> [   15.884811]        __mutex_lock+0x79/0x372
> [   15.885803]        pty_write+0x2f/0xb7
> [   15.886693]        n_tty_write+0x21a/0x3bb
> [   15.887851]        tty_write+0x194/0x22b
> [   15.890606]        vfs_write+0xb1/0xd5
> [   15.897737]        ksys_write+0x4b/0x7b
> [   15.904866]        do_syscall_64+0x58/0x66
> [   15.912475]        entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   15.922784] =

> [   15.922784] other info that might help us debug this:
> [   15.922784] =

> [   15.927523] Chain exists of:
> [   15.927523]   tty_mutex --> &o_tty->termios_rwsem/1 --> &ldata->output=
_lock
> [   15.927523] =

> [   15.931529]  Possible unsafe locking scenario:
> [   15.931529] =

> [   15.933800]        CPU0                    CPU1
> [   15.942161]        ----                    ----
> [   15.950652]   lock(&ldata->output_lock);
> [   15.958041]                                lock(&o_tty->termios_rwsem/=
1);
> [   15.969346]                                lock(&ldata->output_lock);
> [   15.972347]   lock(tty_mutex);
> [   15.973536] =

> [   15.973536]  *** DEADLOCK ***
> [   15.973536] =

> [   15.975519] 4 locks held by rc.local/191:
> [   15.976751]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_ldi=
sc_ref_wait+0x1b/0x35
> [   15.979326]  #1: (____ptrval____) (&tty->atomic_write_lock){+.+.}, at:=
 tty_write_lock+0x13/0x3a
> [   15.995462]  #2: (____ptrval____) (&o_tty->termios_rwsem/1){++++}, at:=
 n_tty_write+0x62/0x3bb
> [   16.011273]  #3: (____ptrval____) (&ldata->output_lock){+.+.}, at: n_t=
ty_write+0x115/0x3bb
> [   16.026602] =

> [   16.026602] stack backtrace:
> [   16.034151] CPU: 1 PID: 191 Comm: rc.local Not tainted 5.1.0-rc1-00016=
-gb9ca5f8 #1
> [   16.047411] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   16.062578] Call Trace:
> [   16.065417]  dump_stack+0x67/0x8e
> [   16.066775]  print_circular_bug+0x1c7/0x1d4
> [   16.068353]  check_prev_add+0x168/0x317
> [   16.069787]  ? check_prev_add+0x2f1/0x317
> [   16.071089]  ? __lock_acquire+0xa02/0xb02
> [   16.072074]  __lock_acquire+0xa02/0xb02
> [   16.072933]  lock_acquire+0x144/0x16f
> [   16.073744]  ? pty_write+0x2f/0xb7
> [   16.074434]  ? pty_write+0x2f/0xb7
> [   16.075100]  __mutex_lock+0x79/0x372
> [   16.078781]  ? pty_write+0x2f/0xb7
> [   16.083937]  ? pty_write+0x2f/0xb7
> [   16.090640]  pty_write+0x2f/0xb7
> [   16.097181]  n_tty_write+0x21a/0x3bb
> [   16.102755]  ? __wake_up_locked_key_bookmark+0x12/0x12
> [   16.110519]  tty_write+0x194/0x22b
> [   16.112182]  ? copy_from_read_buf+0xf9/0xf9
> [   16.113493]  vfs_write+0xb1/0xd5
> [   16.114399]  ksys_write+0x4b/0x7b
> [   16.115248]  do_syscall_64+0x58/0x66
> [   16.116161]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> [   16.117376] RIP: 0033:0x7f1f91f15100
> [   16.118223] Code: 73 01 c3 48 8b 0d 40 0d 2d 00 31 d2 48 29 c2 64 89 1=
1 48 83 c8 ff eb ea 90 90 83 3d dd 70 2d 00 00 75 10 b8 01 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 de b0 01 00 48 89 04 24
> [   16.140575] RSP: 002b:00007ffe599448d8 EFLAGS: 00000246 ORIG_RAX: 0000=
000000000001
> [   16.153704] RAX: ffffffffffffffda RBX: 0000000000000017 RCX: 00007f1f9=
1f15100
> [   16.157815] RDX: 0000000000000017 RSI: 0000000000e0b808 RDI: 000000000=
0000001
> [   16.160600] RBP: 0000000000e0b808 R08: 000000000000000a R09: 00007f1f9=
2835700
> [   16.162841] R10: 00007ffe59944710 R11: 0000000000000246 R12: 00007f1f9=
21e7260
> [   16.164912] R13: 0000000000000017 R14: 0000000000000000 R15: 000000000=
0e12f88
> Kernel tests: Boot OK!
> [   16.254509] random: trinity: uninitialized urandom read (4 bytes read)
> [   16.343589] random: mountall: uninitialized urandom read (12 bytes rea=
d)

Thanks for this, I've now reverted it.

greg k-h

--===============4753454713714398492==--

