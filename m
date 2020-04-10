Content-Type: multipart/mixed; boundary="===============6445849580485991005=="
MIME-Version: 1.0
From: Yonghong Song <yhs@fb.com>
To: lkp@lists.01.org
Subject: Re: [bpf] 1bcd60aafb: canonical_address#:#[##]
Date: Fri, 10 Apr 2020 11:30:17 -0700
Message-ID: <02ad51bd-9924-af89-67ed-5894084827fa@fb.com>
In-Reply-To: <20200409092024.GF8179@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6445849580485991005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 4/9/20 2:20 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 1bcd60aafb39b0258603f63d5f451d51ecad245c ("[RFC PATCH bpf-next 03=
/16] bpf: provide a way for targets to register themselves")
> url: https://github.com/0day-ci/linux/commits/Yonghong-Song/bpf-implement=
-bpf-based-dumping-of-kernel-data-structures/20200409-075105
> base: https://git.kernel.org/cgit/linux/kernel/git/bpf/bpf-next.git master
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 034a45e60c | 1bcd60aafb |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 4          | 0          |
> | boot_failures                            | 0          | 4          |
> | canonical_address#:#[##]                 | 0          | 4          |
> | RIP:mntget                               | 0          | 4          |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 4          |
> +------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [    0.701420] smpboot: Total of 2 processors activated (11999.99 BogoMIP=
S)
> [    0.704085] devtmpfs: initialized
> [    0.705366] x86/mm: Memory block size: 128MB
> [    0.710473] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
> [    0.711845] futex hash table entries: 512 (order: 3, 32768 bytes, line=
ar)
> [    0.713988] general protection fault, probably for non-canonical addre=
ss 0xcb7b8adb56376100: 0000 [#1] SMP PTI
> [    0.715820] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.6.0-02317-g1bc=
d60aafb39b0 #1
> [    0.715820] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [    0.715820] RIP: 0010:mntget+0xd/0x15
> [    0.715820] Code: 65 48 33 04 25 28 00 00 00 74 05 e8 9d e2 e5 ff 48 8=
3 c4 30 5b 5d 41 5c 41 5d 41 5e c3 66 66 66 66 90 48 85 ff 48 89 f8 74 07 <=
48> 8b 57 28 65 ff 02 c3 66 66 66 66 90 53 48 8b 47 20 48 89 fb 48
> [    0.715820] RSP: 0000:ffffc90000013e48 EFLAGS: 00010286
> [    0.715820] RAX: cb7b8adb56376100 RBX: 0000000000000000 RCX: 000000000=
0000000
> [    0.715820] RDX: 0000000000000001 RSI: ffffc90000013e34 RDI: cb7b8adb5=
6376100
> [    0.715820] RBP: ffffc90000013e88 R08: ffffffff8209b97a R09: ffff88822=
a456370
> [    0.715820] R10: 0000000000000044 R11: ffff88822a04efd8 R12: ffffc9000=
0013e84
> [    0.715820] R13: ffffffff8226c380 R14: 0000000000000002 R15: ffffffff8=
26d566d
> [    0.715820] FS:  0000000000000000(0000) GS:ffff88823fc00000(0000) knlG=
S:0000000000000000
> [    0.715820] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.715820] CR2: 0000000000000000 CR3: 0000000002212000 CR4: 000000000=
00406f0
> [    0.715820] Call Trace:
> [    0.715820]  simple_pin_fs+0x75/0x98
> [    0.715820]  ? stack_map_init+0x48/0x48
> [    0.715820]  __bpfdump_init+0x5a/0xd7
> [    0.715820]  ? register_tracer+0x14c/0x1ac
> [    0.715820]  do_one_initcall+0x9d/0x1bb
> [    0.715820]  kernel_init_freeable+0x1c1/0x224
> [    0.715820]  ? rest_init+0xc6/0xc6
> [    0.715820]  kernel_init+0xa/0xff
> [    0.715820]  ret_from_fork+0x35/0x40
> [    0.715820] Modules linked in:
> [    0.715855] ---[ end trace 1e6dc54c74784c94 ]---
> [    0.717664] RIP: 0010:mntget+0xd/0x15
> [    0.719174] Code: 65 48 33 04 25 28 00 00 00 74 05 e8 9d e2 e5 ff 48 8=
3 c4 30 5b 5d 41 5c 41 5d 41 5e c3 66 66 66 66 90 48 85 ff 48 89 f8 74 07 <=
48> 8b 57 28 65 ff 02 c3 66 66 66 66 90 53 48 8b 47 20 48 89 fb 48
> [    0.719837] RSP: 0000:ffffc90000013e48 EFLAGS: 00010286
> [    0.721734] RAX: cb7b8adb56376100 RBX: 0000000000000000 RCX: 000000000=
0000000
> [    0.723831] RDX: 0000000000000001 RSI: ffffc90000013e34 RDI: cb7b8adb5=
6376100
> [    0.726052] RBP: ffffc90000013e88 R08: ffffffff8209b97a R09: ffff88822=
a456370
> [    0.727834] R10: 0000000000000044 R11: ffff88822a04efd8 R12: ffffc9000=
0013e84
> [    0.729939] R13: ffffffff8226c380 R14: 0000000000000002 R15: ffffffff8=
26d566d
> [    0.731834] FS:  0000000000000000(0000) GS:ffff88823fc00000(0000) knlG=
S:0000000000000000
> [    0.734900] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.735836] CR2: 0000000000000000 CR3: 0000000002212000 CR4: 000000000=
00406f0
> [    0.738028] Kernel panic - not syncing: Fatal exception

Thanks for the reporting! This is due to an uninitialized variable. Will
fix in the next version.

> =

> Elapsed time: 60
> =

> qemu-img create -f qcow2 disk-vm-snb-ssd-31-0 256G
> qemu-img create -f qcow2 disk-vm-snb-ssd-31-1 256G
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.6.0-02317-g1bcd60aafb39b0 .config
> 	make HOSTCC=3Dgcc-7 CC=3Dgcc-7 ARCH=3Dx86_64 olddefconfig prepare module=
s_prepare bzImage
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> job-script # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Rong Chen
>=20
--===============6445849580485991005==--

