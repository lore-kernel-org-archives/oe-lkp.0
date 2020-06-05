Content-Type: multipart/mixed; boundary="===============6631925582790461338=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [net] a6211caa63: dmesg.UBSAN:signed-integer-overflow_in_arch/x86/include/asm/atomic.h
Date: Fri, 05 Jun 2020 06:17:51 -0700
Message-ID: <CANn89iK1EfAqw-SkXyQR=88fKnBpXCcR_FaiFkVDUNazNgAX1g@mail.gmail.com>
In-Reply-To: <20200605080929.GK12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6631925582790461338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 5, 2020 at 1:10 AM kernel test robot <rong.a.chen@intel.com> =
wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-4.9):
>
> commit: a6211caa634da39d861a47437ffcda8b38ef421b ("net: revert "net: get =
rid of an signed integer overflow in ip_idents_reserve()"")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>
> in testcase: boot
>
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
>

There you go.

We decided this was a bogus report, and that UBSAN requires sane compilers.

Please read the fine comment that was added in this commit and update
your compiler or do not mess with compiler flags.

+       /* If UBSAN reports an error there, please make sure your compiler
+        * supports -fno-strict-overflow before reporting it that was a bug
+        * in UBSAN, and it has been fixed in GCC-8.
+        */
+       return atomic_add_return(segs + delta, p_id) - segs;

Thanks.


>
> [   35.019158] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   35.019995] UBSAN: signed-integer-overflow in arch/x86/include/asm/ato=
mic.h:167:2
> [   35.020884] -1045826149 + -1341282523 cannot be represented in type 'i=
nt'
> [   35.021544] CPU: 0 PID: 350 Comm: systemd-timesyn Tainted: G S        =
        5.7.0-rc5-00221-ga6211caa634da #1
> [   35.022550] Call Trace:
> [   35.022812]  dump_stack+0x16/0x26
> [   35.023151]  ubsan_epilogue+0x8/0x40
> [   35.023526]  handle_overflow+0x80/0xa0
> [   35.023925]  ? __ip_append_data+0x8ca/0xdd0
> [   35.024408]  __ubsan_handle_add_overflow+0xa/0x10
> [   35.024872]  ip_idents_reserve+0x79/0x90
> [   35.025263]  __ip_select_ident+0x48/0x70
> [   35.025659]  __ip_make_skb+0x32f/0x410
> [   35.026039]  ip_make_skb+0xa6/0xe0
> [   35.026383]  ? ip_reply_glue_bits+0x50/0x50
> [   35.026770]  ? ip_route_output_key_hash+0xb6/0xe0
> [   35.027221]  udp_sendmsg+0x577/0xba0
> [   35.027551]  ? ip_reply_glue_bits+0x50/0x50
> [   35.027960]  ? lock_release+0x9d/0x260
> [   35.028328]  inet_sendmsg+0x2e/0x50
> [   35.028819]  __sys_sendto+0xe2/0x130
> [   35.029178]  ? lock_acquire+0x92/0x310
> [   35.029552]  ? __might_fault+0x41/0x80
> [   35.029903]  ? find_held_lock+0x2d/0xd0
> [   35.030262]  ? lock_release+0x9d/0x260
> [   35.030620]  __ia32_sys_socketcall+0x141/0x240
> [   35.031064]  do_int80_syscall_32+0x46/0x3d0
> [   35.031470]  entry_INT80_32+0x113/0x113
> [   35.031854] EIP: 0xb7f54a02
> [   35.032133] Code: 95 01 00 05 25 36 02 00 83 ec 14 8d 80 e8 99 ff ff 5=
0 6a 02 e8 1f ff 00 00 c7 04 24 7f 00 00 00 e8 7e 87 01 00 66 90 90 cd 80 <=
c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
> [   35.033938] EAX: ffffffda EBX: 0000000b ECX: bfecd7c8 EDX: 00000000
> [   35.034562] ESI: b7cd3000 EDI: 00000000 EBP: 00000000 ESP: bfecd7bc
> [   35.035199] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000=
293
> [   35.035865] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [  OK  ] Started OpenBSD Secure Shell server.
> [  OK  ] Started LSB: Start and stop bmc-watchdog.
> [  OK  ] Started LSB: Execute the kexec -e command to reboot system.
> [  OK  ] Started Login Service.
>          Starting Preprocess NFS configuration...
> [  OK  ] Reached target Host and Network Name Lookups.
>          Starting LSB: Load kernel image with kexec...
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Started Preprocess NFS configuration.
>          Starting Notify NFS peers of a restart...
>          Starting NFS status monitor for NFSv2/3 locking....
> [  OK  ] Started Notify NFS peers of a restart.
> [  OK  ] Started LSB: Load kernel image with kexec.
> [  OK  ] Started NFS status monitor for NFSv2/3 locking..
> [   48.881188] sysrq: Emergency Sync
> [   48.881750] sysrq: Resetting
>
>
> To reproduce:
>
>         # build kernel
>         cd linux
>         cp config-5.7.0-rc5-00221-ga6211caa634da .config
>         make HOSTCC=3Dgcc-4.9 CC=3Dgcc-4.9 ARCH=3Di386 olddefconfig prepa=
re modules_prepare bzImage
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script # job-script is attached in =
this email
>
>
>
> Thanks,
> Rong Chen
>
--===============6631925582790461338==--

