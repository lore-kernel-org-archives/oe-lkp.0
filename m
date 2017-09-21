Content-Type: multipart/mixed; boundary="===============1022820040398303766=="
MIME-Version: 1.0
From: Subash Abhinov Kasiviswanathan <subashab@codeaurora.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [drivers] ceed73a2cf: drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:#suspicious_rcu_dereference_check()usage
Date: Wed, 20 Sep 2017 21:31:01 -0600
Message-ID: <f337e96a6e736d3e261bcae0847ce6a4@codeaurora.org>
In-Reply-To: <20170920015545.GC30213@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1022820040398303766==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017-09-19 19:55, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: ceed73a2cf4aff2921802aa3d21d45280677547d ("drivers: net:
> ethernet: qualcomm: rmnet: Initial implementation")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-i386 -enable-kvm -cpu Haswell,+smep,+smap =

> -m 360M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire
> log/backtrace):
> =

> =

> +------------------------------------------------------------------------=
---------------------+------------+------------+
> |
>                        | cdf4969c42 | ceed73a2cf |
> +------------------------------------------------------------------------=
---------------------+------------+------------+
> | boot_successes
>                        | 52         | 44         |
> | boot_failures
>                        | 0          | 8          |
> |
> drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:#suspicious_rcu_derefe=
rence_check()usage
> | 0          | 8          |
> +------------------------------------------------------------------------=
---------------------+------------+------------+
> =

> =

> =

> [  101.364846] WARNING: suspicious RCU usage
> [  101.365654] 4.13.0-rc6-01701-gceed73a #1 Not tainted
> [  101.370873] -----------------------------
> [  101.372472] drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c:57
> suspicious rcu_dereference_check() usage!
> [  101.374427]
> [  101.374427] other info that might help us debug this:
> [  101.374427]
> [  101.387491]
> [  101.387491] rcu_scheduler_active =3D 2, debug_locks =3D 1
> [  101.389368] 1 lock held by trinity-main/2809:
> [  101.390736]  #0:  (rtnl_mutex){+.+.+.}, at: [<8146085b>] =

> rtnl_lock+0xf/0x11
> [  101.395482]
> [  101.395482] stack backtrace:
> [  101.396948] CPU: 0 PID: 2809 Comm: trinity-main Not tainted
> 4.13.0-rc6-01701-gceed73a #1
> [  101.398857] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS 1.9.3-20161025_171302-gandalf 04/01/2014
> [  101.401079] Call Trace:
> [  101.401656]  dump_stack+0xa1/0xeb
> [  101.402871]  lockdep_rcu_suspicious+0xc7/0xd0
> [  101.403665]  rmnet_is_real_dev_registered+0x40/0x4e
> [  101.405199]  rmnet_config_notify_cb+0x2c/0x142
> [  101.406344]  ? wireless_nlevent_flush+0x47/0x71
> [  101.407385]  notifier_call_chain+0x2d/0x47
> [  101.408645]  raw_notifier_call_chain+0xc/0xe
> [  101.409882]  call_netdevice_notifiers_info+0x41/0x49
> [  101.411402]  call_netdevice_notifiers+0xc/0xe
> [  101.412713]  rollback_registered_many+0x268/0x36e
> [  101.413702]  rollback_registered+0x39/0x56
> [  101.414965]  unregister_netdevice_queue+0x79/0x88
> [  101.415908]  unregister_netdev+0x16/0x1d
> [  101.417030]  gprs_attach+0x129/0x133
> [  101.417700]  pep_setsockopt+0xa2/0x118
> [  101.418851]  sock_common_setsockopt+0x13/0x18
> [  101.420462]  SyS_setsockopt+0x59/0x77
> [  101.421196]  SyS_socketcall+0x16c/0x1cf
> [  101.422148]  do_int80_syscall_32+0x57/0x11d
> [  101.423137]  entry_INT80_32+0x33/0x33
> [  101.423827] EIP: 0x77fc61b2
> [  101.424802] EFLAGS: 00000206 CPU: 0
> [  101.425465] EAX: ffffffda EBX: 0000000e ECX: 7fc2cc50 EDX: 7fc2ccd0
> [  101.426928] ESI: 00000005 EDI: 00000152 EBP: 77da037c ESP: 7fc2cc48
> [  101.428482]  DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b
> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached
> in this email
> =

> =

> =

> Thanks,
> Xiaolong

Hi Xiaolong

Thanks for the report.

I am somehow unable to reproduce this on my system.
There are some errors while running lkp.
I'll try to see if I can reproduce this some other way locally.

//some startup errors
cpio: root:lkp: invalid group

...
//errors while executing.

[child0:2600] move_pages (317) returned ENOSYS, marking as inactive.
*** glibc detected *** /trinity: double free or corruption (out): =

0x08630000 ***
=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D
/lib/i386-linux-gnu/libc.so.6(+0x73e42)[0x77e96e42]
/trinity[0x8058af6]
/trinity[0x8051888]
/trinity[0x8054894]
/trinity[0x804a9f5]
/trinity[0x804e3be]
/trinity[0x804a085]
/lib/i386-linux-gnu/libc.so.6(__libc_start_main+0xf3)[0x77e3c4d3]
...

//seems like there is an error while connecting to system bus.
//If this is a known error, is there a workaround for this?
[   88.296910] init: tty6 main process ended, respawning
error: 'rc.local' exited outside the expected code flow.
[   97.252708] init: Failed to create pty - disabling logging for job
[   97.253484] init: Temporary process spawn error: No such file or =

directory
[   97.272202] init: rc main process (330) killed by TERM signal
unable to connect to system bus: Failed to connect to socket =

/var/run/dbus/system_bus_socket: No such file or directory
[   97.274761] init: tty4 main process (2618) killed by TERM signal
[   97.276215] init: tty5 main process (2619) killed by TERM signal
[   97.277613] init: tty2 main process (2620) killed by TERM signal
[   97.279151] init: tty3 main process (2621) killed by TERM signal
[   97.280569] init: tty6 main process (2622) killed by TERM signal
[   97.282103] init: hwclock-save main process (2625) terminated with =

status 70
[   97.283737] init: plymouth-upstart-bridge main process (2626) =

terminated with status 1
  * Asking all remaining processes to terminate...                        =

[ OK ]
  * All processes ended within 1 seconds....                              =

[ OK ]
  * Deactivating swap...                                                  =

[ OK ]
umount: /run/lock: not mounted
mount: / is busy
  * Will now restart
[   97.579289] Unregister pv shared memory for cpu 0
[   97.580380] reboot: Restarting system
[   97.580716] reboot: machine restart

-- =

Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a =

Linux Foundation Collaborative Project

--===============1022820040398303766==--

