Content-Type: multipart/mixed; boundary="===============7095837003649002123=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/core] 92b1f046a2: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 24 Mar 2020 08:52:53 -0400
Message-ID: <94b177e1-7409-9597-fb4d-0f85583bbb86@linux.intel.com>
In-Reply-To: <20200324060033.GB11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============7095837003649002123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 3/24/2020 2:00 AM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 92b1f046a283a7dafd30067d93444fb6402b42d7 ("[PATCH] perf/core: Fix=
 endless multiplex timer")
> url: https://github.com/0day-ci/linux/commits/kan-liang-linux-intel-com/p=
erf-core-Fix-endless-multiplex-timer/20200304-050638
> =


The patch has been dropped.
It is replaced by Peter's patch.
https://lkml.kernel.org/r/20200305123851.GX2596(a)hirez.programming.kicks-a=
ss.net

We don't need to worry about the bug anymore.
Thanks,
Kan
> =

> in testcase: kernel-selftests
> with following parameters:
> =

> 	group: kselftests-00
> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 8G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +---------------------------------------------+------------+------------+
> |                                             | fdb6482244 | 92b1f046a2 |
> +---------------------------------------------+------------+------------+
> | boot_successes                              | 3          | 0          |
> | boot_failures                               | 21         | 9          |
> | BUG:kernel_in_stage                         | 21         | 9          |
> | BUG:kernel_NULL_pointer_dereference,address | 0          | 6          |
> | Oops:#[##]                                  | 0          | 6          |
> | RIP:__perf_event_disable                    | 0          | 6          |
> | Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
> | Mem-Info                                    | 0          | 1          |
> +---------------------------------------------+------------+------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
> =

> =

> [   54.787532] BUG: kernel NULL pointer dereference, address: 00000000000=
00094
> [   54.788968] #PF: supervisor read access in kernel mode
> [   54.790070] #PF: error_code(0x0000) - not-present page
> [   54.791164] PGD 0 P4D 0
> [   54.792019] Oops: 0000 [#1] SMP PTI
> [   54.792956] CPU: 0 PID: 9996 Comm: breakpoint_test Not tainted 5.6.0-r=
c1-00017-g92b1f046a283a7 #1
> [   54.794419] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.12.0-1 04/01/2014
> [   54.795898] RIP: 0010:__perf_event_disable+0x26/0x1a0
> [   54.797012] Code: 0f 1f 40 00 8b 87 a8 00 00 00 85 c0 0f 88 66 01 00 0=
0 41 55 41 54 49 89 d4 55 53 48 89 f5 f6 82 98 00 00 00 04 48 89 fb 75 7c <=
8b> 85 94 00 00 00 39 85 90 00 00 00 74 09 83 f8 01 0f 84 39 01 00
> [   54.801211] RSP: 0018:ffffa93d05073d30 EFLAGS: 00010046
> [   54.803308] RAX: 0000000000000000 RBX: ffff9c35692e7000 RCX: 000000000=
0000000
> [   54.813087] RDX: ffff9c34f6499500 RSI: 0000000000000000 RDI: ffff9c356=
92e7000
> [   54.815527] RBP: 0000000000000000 R08: ffffa93d05073eac R09: 000000000=
0000000
> [   54.818026] R10: ffffa93d05073d18 R11: ffffffff9b663150 R12: ffff9c34f=
6499500
> [   54.820629] R13: 0000000000000000 R14: ffff9c34f6499508 R15: 000000000=
0000000
> [   54.823122] FS:  00007fa354f06540(0000) GS:ffff9c357fc00000(0000) knlG=
S:0000000000000000
> [   54.825834] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   54.828126] CR2: 0000000000000094 CR3: 000000019fb0e000 CR4: 000000000=
00406f0
> [   54.830677] DR0: 0000556d8bb0a10b DR1: 0000000000000000 DR2: 000000000=
0000000
> [   54.833152] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 000000000=
0000600
> [   54.835683] Call Trace:
> [   54.837844]  ? __perf_event_enable+0x1f0/0x1f0
> [   54.839834]  event_function_call+0xd0/0x130
> [   54.841771]  ? __perf_event_enable+0x1f0/0x1f0
> [   54.843696]  ? _cond_resched+0x19/0x30
> [   54.853765]  perf_event_disable+0x15/0x30
> [   54.855597]  modify_user_hw_breakpoint+0x43/0x80
> [   54.857481]  ptrace_modify_breakpoint+0x120/0x150
> [   54.859393]  ptrace_set_debugreg+0xc8/0x1a0
> [   54.861232]  arch_ptrace+0x2f4/0x440
> [   54.862927]  __x64_sys_ptrace+0xc9/0x140
> [   54.864687]  do_syscall_64+0x5b/0x1f0
> [   54.866422]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [   54.868130] RIP: 0033:0x7fa354e378ff
> [   54.869124] Code: c7 44 24 10 08 00 00 00 48 89 44 24 18 48 8d 44 24 3=
0 8b 70 08 48 8b 50 10 4c 0f 43 50 18 48 89 44 24 20 b8 65 00 00 00 0f 05 <=
48> 3d 00 f0 ff ff 77 41 48 85 c0 78 06 41 83 f8 02 76 1e 48 8b 4c
> [   54.872340] RSP: 002b:00007fffe648e1a0 EFLAGS: 00000202 ORIG_RAX: 0000=
000000000065
> [   54.873760] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fa35=
4e378ff
> [   54.875136] RDX: 0000000000000388 RSI: 000000000000270d RDI: 000000000=
0000006
> [   54.876526] RBP: 00007fffe648e250 R08: 0000000000000005 R09: 000000000=
0000000
> [   54.877903] R10: 0000000000000000 R11: 0000000000000202 R12: 0000556d8=
bb09950
> [   54.879286] R13: 00007fffe648e7b0 R14: 0000000000000000 R15: 000000000=
0000000
> [   54.880682] Modules linked in: binfmt_misc intel_rapl_msr intel_rapl_c=
ommon sr_mod cdrom crct10dif_pclmul sg crc32_pclmul ppdev crc32c_intel ghas=
h_clmulni_intel bochs_drm drm_vram_helper drm_ttm_helper snd_pcm ttm snd_ti=
mer snd aesni_intel soundcore crypto_simd joydev ata_generic drm_kms_helper=
 pata_acpi cryptd glue_helper pcspkr serio_raw syscopyarea sysfillrect sysi=
mgblt fb_sys_fops parport_pc floppy drm parport ata_piix i2c_piix4 libata i=
p_tables
> [   54.887273] CR2: 0000000000000094
> [   54.888345] ---[ end trace 3c65e40013a20268 ]---
> =

> =

> To reproduce:
> =

>          # build kernel
> 	cd linux
> 	cp config-5.6.0-rc1-00017-g92b1f046a283a7 .config
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
--===============7095837003649002123==--

