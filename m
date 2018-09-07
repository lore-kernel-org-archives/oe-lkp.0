Content-Type: multipart/mixed; boundary="===============8551684711658919471=="
MIME-Version: 1.0
From: Jiri Slaby <jslaby@suse.cz>
To: lkp@lists.01.org
Subject: Re: [tty] 0b4f83d510: INFO:task_blocked_for_more_than#seconds
Date: Fri, 07 Sep 2018 08:39:27 +0200
Message-ID: <d5d23bc5-0e11-5cee-6d66-514dfc4fc25b@suse.cz>
In-Reply-To: <20180907045041.GF1110@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8551684711658919471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/07/2018, 06:50 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 0b4f83d510f6fef6bb9da25f122c8d733d50516f ("[PATCH 2/4] tty: Hold =
tty_ldisc_lock() during tty_reopen()")
> url: https://github.com/0day-ci/linux/commits/Dmitry-Safonov/tty-Hold-wri=
te-ldisc-sem-in-tty_reopen/20180829-165618
> base: https://git.kernel.org/cgit/linux/kernel/git/gregkh/tty.git tty-tes=
ting
> =

> in testcase: trinity
> with following parameters:
> =

> 	runtime: 300s
> =

> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 256M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +--------------------------------------------------+------------+--------=
----+
> |                                                  | 58dd163974 | 0b4f83d=
510 |
> +--------------------------------------------------+------------+--------=
----+
> | boot_successes                                   | 14         | 4      =
    |
> | boot_failures                                    | 0          | 6      =
    |
> | INFO:task_blocked_for_more_than#seconds          | 0          | 6      =
    |
> | Kernel_panic-not_syncing:hung_task:blocked_tasks | 0          | 6      =
    |
> +--------------------------------------------------+------------+--------=
----+
> =

> =

> =

> [  244.816801] INFO: task validate_data:655 blocked for more than 120 sec=
onds.
> [  244.818833]       Not tainted 4.18.0-11684-g0b4f83d #1
> [  244.820028] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  244.826965] validate_data   D    0   655    623 0x20020000
> [  244.828279] Call Trace:
> [  244.828958]  ? __schedule+0x843/0x950
> [  244.830173]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.834903]  schedule+0x31/0x70
> [  244.835665]  schedule_timeout+0x34/0x760
> [  244.836613]  ? ftrace_likely_update+0x35/0x60
> [  244.837683]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.838818]  ? ftrace_likely_update+0x35/0x60
> [  244.840127]  ? ftrace_likely_update+0x35/0x60
> [  244.845947]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.847882]  __ldsem_down_read_nested+0x23a/0x3b0
> [  244.849886]  ? tty_ldisc_ref_wait+0x25/0x50
> [  244.853807]  tty_ldisc_ref_wait+0x25/0x50
> [  244.854946]  tty_compat_ioctl+0x8a/0x120
> [  244.855928]  ? this_tty+0x80/0x80
> [  244.856742]  __ia32_compat_sys_ioctl+0xc28/0x1ce0
> [  244.857981]  do_int80_syscall_32+0x1d2/0x5f0
> [  244.859003]  entry_INT80_compat+0x88/0xa0
> [  244.859972] INFO: task dnsmasq:668 blocked for more than 120 seconds.
> [  244.868315]       Not tainted 4.18.0-11684-g0b4f83d #1
> [  244.869583] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  244.871744] dnsmasq         D    0   668      1 0x20020000
> [  244.873063] Call Trace:
> [  244.873697]  ? __schedule+0x843/0x950
> [  244.874572]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.875725]  schedule+0x31/0x70
> [  244.876576]  schedule_timeout+0x34/0x760
> [  244.877573]  ? ftrace_likely_update+0x35/0x60
> [  244.878660]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.879872]  ? ftrace_likely_update+0x35/0x60
> [  244.890522]  ? ftrace_likely_update+0x35/0x60
> [  244.891572]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.892746]  __ldsem_down_read_nested+0x23a/0x3b0
> [  244.893861]  ? tty_ldisc_ref_wait+0x25/0x50
> [  244.894841]  tty_ldisc_ref_wait+0x25/0x50
> [  244.895911]  tty_compat_ioctl+0x8a/0x120
> [  244.896916]  ? this_tty+0x80/0x80
> [  244.897717]  __ia32_compat_sys_ioctl+0xc28/0x1ce0
> [  244.898821]  do_int80_syscall_32+0x1d2/0x5f0
> [  244.899830]  entry_INT80_compat+0x88/0xa0
> [  244.909466] INFO: task dropbear:734 blocked for more than 120 seconds.
> [  244.911173]       Not tainted 4.18.0-11684-g0b4f83d #1
> [  244.912394] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disable=
s this message.
> [  244.914176] dropbear        D    0   734      1 0x20020000
> [  244.915446] Call Trace:
> [  244.916068]  ? __schedule+0x843/0x950
> [  244.916945]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.918076]  schedule+0x31/0x70
> [  244.918832]  schedule_timeout+0x34/0x760
> [  244.919781]  ? ftrace_likely_update+0x35/0x60
> [  244.921104]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.922304]  ? ftrace_likely_update+0x35/0x60
> [  244.923347]  ? ftrace_likely_update+0x35/0x60
> [  244.924369]  ? __ldsem_down_read_nested+0x1c4/0x3b0
> [  244.925496]  __ldsem_down_read_nested+0x23a/0x3b0
> [  244.926598]  ? tty_ldisc_ref_wait+0x25/0x50
> [  244.927578]  tty_ldisc_ref_wait+0x25/0x50
> [  244.928526]  tty_compat_ioctl+0x8a/0x120
> [  244.929449]  ? this_tty+0x80/0x80
> [  244.930240]  __ia32_compat_sys_ioctl+0xc28/0x1ce0
> [  244.940083]  do_int80_syscall_32+0x1d2/0x5f0
> [  244.941310]  entry_INT80_compat+0x88/0xa0
> [  244.944070] =

> [  244.944070] Showing all locks held in the system:
> [  244.945558] 1 lock held by khungtaskd/18:
> [  244.946495]  #0: (____ptrval____) (rcu_read_lock){....}, at: debug_sho=
w_all_locks+0x16/0x190
> [  244.948503] 2 locks held by askfirst/235:
> [  244.949439]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_ldi=
sc_ref_wait+0x25/0x50
> [  244.951762]  #1: (____ptrval____) (&ldata->atomic_read_lock){+.+.}, at=
: n_tty_read+0x13d/0xa00

Here, it just seems to wait for input from the user.

> [  244.953799] 1 lock held by validate_data/655:
> [  244.954814]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_ldi=
sc_ref_wait+0x25/0x50
> [  244.956764] 1 lock held by dnsmasq/668:
> [  244.957649]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_ldi=
sc_ref_wait+0x25/0x50
> [  244.959598] 1 lock held by dropbear/734:
> [  244.967564]  #0: (____ptrval____) (&tty->ldisc_sem){++++}, at: tty_ldi=
sc_ref_wait+0x25/0x50

Hmm, I assume there is another task waiting for write_ldsem and that one
prevents these readers to proceed. Unfortunately, due to the defunct
__ptrval__ pointer hashing crap, we do not see who is waiting for what.
But I am guessing all are the same locks.

So I think, we are forced to limit the waiting to 5 seconds in reopen in
the end too (the same as we do for new open in tty_init_dev).

Dmitry, could you add the limit and handle the return value of
tty_ldisc_lock now?

thanks,
-- =

js
suse labs

--===============8551684711658919471==--

