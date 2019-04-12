Content-Type: multipart/mixed; boundary="===============6349181183624741925=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locking/rwsem] f03c360396: WARNING:at_init/main.c:#start_kernel
Date: Fri, 12 Apr 2019 10:01:19 -0400
Message-ID: <4d35a232-ed7b-b74e-bbae-30013355ceb8@redhat.com>
In-Reply-To: <20190412031809.GJ17122@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6349181183624741925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/11/2019 11:18 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
>
> commit: f03c36039664fc53ebf6d8322c46aaf8e373f70c ("locking/rwsem: Merge o=
wner into count on x86-64")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git WIP.locking/core
>
> in testcase: trinity
> with following parameters:
>
> 	runtime: 300s
>
> test-description: Trinity is a linux system call fuzz tester.
> test-url: http://codemonkey.org.uk/projects/trinity/
>
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +----------------------------------------------------+------------+------=
------+
> |                                                    | 1878939138 | f03c3=
60396 |
> +----------------------------------------------------+------------+------=
------+
> | boot_successes                                     | 0          | 0    =
      |
> | boot_failures                                      | 4          | 9    =
      |
> | BUG:kernel_hang_in_boot-around-mounting-root_stage | 3          | 5    =
      |
> | BUG:kernel_reboot-without-warning_in_test_stage    | 1          |      =
      |
> | WARNING:at_init/main.c:#start_kernel               | 0          | 9    =
      |
> | RIP:start_kernel                                   | 0          | 9    =
      |
> +----------------------------------------------------+------------+------=
------+
>
>
>
> [    4.777899] WARNING: CPU: 0 PID: 0 at init/main.c:663 start_kernel+0x3=
66/0x512
> [    4.777906] Modules linked in:
> [    4.777920] CPU: 0 PID: 0 Comm: swapper Not tainted 5.1.0-rc4-00083-gf=
03c360 #2
> [    4.777929] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    4.777943] RIP: 0010:start_kernel+0x366/0x512
> [    4.777957] Code: 01 00 e8 f2 85 00 00 e8 84 cd 01 00 e8 0e 48 02 00 e=
8 34 2b 8b fe 9c 58 0f ba e0 09 73 0e 48 c7 c7 e0 08 a0 99 e8 2c 91 bd fd <=
0f> 0b c6 05 4b c0 b9 ff 00 e8 64 d2 cb fd fb e8 c9 ca 02 00 e8 87
> [    4.777966] RSP: 0000:ffffffff9a207ed8 EFLAGS: 00010282
> [    4.777977] RAX: dffffc0000000008 RBX: ffff8881f699cb00 RCX: ffffffff9=
896f4d5
> [    4.777986] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff9=
88f0c4b
> [    4.777995] RBP: 1ffffffff3440fdb R08: fffffbfff35085ae R09: fffffbfff=
35085ae
> [    4.778003] R10: 0000000000000001 R11: fffffbfff35085ad R12: ffffffff9=
ad812e0
> [    4.778011] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    4.778020] FS:  0000000000000000(0000) GS:ffffffff9a2a7000(0000) knlG=
S:0000000000000000
> [    4.778029] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    4.778037] CR2: 00000000ffffffff CR3: 00000001e884c000 CR4: 000000000=
00006b0
> [    4.778046] Call Trace:
> [    4.778063]  ? mem_encrypt_init+0x1/0x1
> [    4.778080]  ? memcpy_orig+0x16/0x110
> [    4.778093]  secondary_startup_64+0xb6/0xc0
> [    4.778116] random: get_random_bytes called from print_oops_end_marker=
+0x34/0x47 with crng_init=3D0
> [    4.778128] ---[ end trace 8182026d66b2a4ad ]---
>
>
> To reproduce:
>
>         # build kernel
> 	cd linux
> 	cp config-5.1.0-rc4-00083-gf03c360 .configf03c36039664fc53ebf6d8322c46aa=
f8e373f70c
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 modules_prepare
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 SHELL=3D/bin/bash
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 bzImage
>
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
I think it was caused by the bug that I forgot to initialize sem->owner
in __init_rwsem() when CONFIG_RWSEM_SPIN_ON_OWNER isn't defined as
pointed out by Peter. That will be fixed in the next version of the
patchset.

Thanks,
Longman


--===============6349181183624741925==--

