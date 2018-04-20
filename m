Content-Type: multipart/mixed; boundary="===============0042142822635661214=="
MIME-Version: 1.0
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
To: lkp@lists.01.org
Subject: Re: [kcov] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper/0:1]
Date: Fri, 20 Apr 2018 17:08:23 +0300
Message-ID: <be75eae0-624d-f5ab-1b07-9a0d86d366b5@virtuozzo.com>
In-Reply-To: <20180419030135.nn454aqxlqdwe7ah@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0042142822635661214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 04/19/2018 06:01 AM, Fengguang Wu wrote:
> Hello,
> =

> FYI this happens in mainline kernel 4.17.0-rc1.
> It at least dates back to v4.8 .
> =

> [   25.697463]
> [   25.697463] Start testing find_bit() with random-filled bitmap
> [   25.736615] find_next_bit:                30203201 ns, 163965 iteratio=
ns
> [   25.783266] find_next_zero_bit:           45554622 ns, 163716 iteratio=
ns
> [   25.832480] find_last_bit:                48003878 ns, 163965 iteratio=
ns
> [   52.050031] watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [swapper=
/0:1]
> [   52.050031] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc1 #210
> [   52.050031] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   52.050031] RIP: 0010:__sanitizer_cov_trace_pc+0x65/0x66:
> 						__sanitizer_cov_trace_pc at kernel/kcov.c:111
> [   52.050031] RSP: 0000:ffff88000fd43e40 EFLAGS: 00000246 ORIG_RAX: ffff=
ffffffffff13
> [   52.050031] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000017
> [   52.050031] RDX: 0000000000000000 RSI: ffff88000fd3e000 RDI: 000000000=
0000002
> [   52.050031] RBP: 0000000000050000 R08: 0000000000000008 R09: 000000000=
0000000
> [   52.050031] R10: ffff88000fd3e000 R11: 00000000222e2c32 R12: ffffffff8=
5565d90
> [   52.050031] R13: 0000000000030f80 R14: 0000000000030f80 R15: 000000000=
0000000
> [   52.050031] FS:  0000000000000000(0000) GS:ffff88001f600000(0000) knlG=
S:0000000000000000
> [   52.050031] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   52.050031] CR2: 0000000000000000 CR3: 0000000003c6a000 CR4: 000000000=
00006b0
> [   52.050031] Call Trace:
> [   52.050031]  find_first_bit+0x66/0x7c:
> 						find_first_bit at lib/find_bit.c:106 (discriminator 1)
> [   52.050031]  test_find_first_bit+0x3a/0x93


I suppose test_find_first_bit() needs a little more than zero cond_resched(=
) calls.


> [   52.050031]  find_bit_test+0x84/0x173:
> 						find_bit_test at lib/find_bit_benchmark.c:135
> [   52.050031]  ? test_find_next_and_bit+0x9b/0x9b
> [   52.050031]  do_one_initcall+0x18e/0x3df:
> 						do_one_initcall at init/main.c:883
> [   52.050031]  ? check_kcov_mode+0x5/0x37:
> 						check_kcov_mode at kernel/kcov.c:60
> [   52.050031]  ? __sanitizer_cov_trace_pc+0x2b/0x66:
> 						__sanitizer_cov_trace_pc at kernel/kcov.c:101
> [   52.050031]  ? check_kcov_mode+0x5/0x37:
> 						check_kcov_mode at kernel/kcov.c:60
> [   52.050031]  kernel_init_freeable+0x250/0x3a5:
> 						do_initcall_level at init/main.c:951
> 						 (inlined by) do_initcalls at init/main.c:959
> 						 (inlined by) do_basic_setup at init/main.c:977
> 						 (inlined by) kernel_init_freeable at init/main.c:1127
> [   52.050031]  ? rest_init+0x13a/0x13a:
> 						kernel_init at init/main.c:1050
> [   52.050031]  kernel_init+0x17/0x218:
> 						kernel_init at init/main.c:1053
> [   52.050031]  ? rest_init+0x13a/0x13a:
> 						kernel_init at init/main.c:1050
> [   52.050031]  ret_from_fork+0x35/0x40:
> 						ret_from_fork at arch/x86/entry/entry_64.S:418
> [   52.050031] Code: 1c 00 00 8b 8b 1c 1c 00 00 48 ff 05 d2 2d fd 04 48 8=
b 02 48 ff c0 48 39 c1 76 0e 48 ff 05 c8 2d fd 04 48 89 2c c2 48 89 02 5b 5=
d <c3> 48 8b 0c 24 40 0f b6 d6 40 0f b6 f7 31 ff 48 ff 05 e9 2d fd
> [   52.050031] Kernel panic - not syncing: softlockup: hung tasks

--===============0042142822635661214==--

