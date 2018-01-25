Content-Type: multipart/mixed; boundary="===============8130915447040988959=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bpf] 87c1793b1b: divide_error:#[##]
Date: Thu, 25 Jan 2018 17:55:21 +0100
Message-ID: <aa68acd6-0794-a7dc-8501-1b454a7f8284@iogearbox.net>
In-Reply-To: <20180125162824.GA30528@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============8130915447040988959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 01/25/2018 05:28 PM, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 87c1793b1b7f34915e9e64cdb503efb281c769a7 ("bpf: add couple of tes=
t cases for div/mod by zero")
> https://git.kernel.org/cgit/linux/kernel/git/kvalo/ath.git master-pending

Yes, so this is from an old net-next tree that doesn't have the fixes
from Linus' tree included. This is fixed upstream already:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/k=
ernel/bpf?id=3Dc366287ebd698ef5e3de300d90cd62ee9ee7373e
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/k=
ernel/bpf?id=3D68fda450a7df51cff9e5a4d4a4d9d0d5f2589153

> in testcase: kernel_selftests
> with following parameters:
> =

> =

> test-description: The kernel contains a set of "self tests" under the too=
ls/testing/selftests/ directory. These are intended to be small unit tests =
to exercise individual code paths in the kernel.
> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
> =

> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | fcd1=
c91771 | 87c1793b1b |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 0   =
       | 0          |
> | boot_failures                                                    | 8   =
       | 6          |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 4 =
         | 2          |
> | Mem-Info                                                         | 4   =
       | 2          |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 4   =
       | 2          |
> | BUG:sleeping_function_called_from_invalid_context_at_mm/slab.h   | 4   =
       |            |
> | divide_error:#[##]                                               | 0   =
       | 4          |
> | RIP:___bpf_prog_run                                              | 0   =
       | 4          |
> | Kernel_panic-not_syncing:Fatal_exception                         | 0   =
       | 4          |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> =

> =

> [   33.217803] =

> [   33.278148] TAP version 13
> [   33.278154] =

> [   33.282038] selftests: test_verifier
> [   33.282042] =

> [   33.284788] divide error: 0000 [#1] SMP PTI
> [   33.285430] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [   33.285433] =

> [   33.286959] Modules linked in: sr_mod cdrom sg ata_generic pata_acpi p=
pdev crc32c_intel ata_piix snd_pcm snd_timer snd soundcore pcspkr serio_raw=
 libata i2c_piix4 parport_pc floppy parport ip_tables
> [   33.290039] CPU: 1 PID: 1141 Comm: test_verifier Not tainted 4.15.0-rc=
8-01653-g87c1793 #1
> [   33.291496] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [   33.292978] RIP: 0010:___bpf_prog_run+0xa98/0x1390
> [   33.293848] RSP: 0018:ffffc900014abd60 EFLAGS: 00010246
> [   33.294848] RAX: 0000000000000001 RBX: ffffc9000072d058 RCX: 000000000=
0000000
> [   33.296125] RDX: 0000000000000000 RSI: ffffc9000072d030 RDI: 000000000=
0000001
> [   33.297352] RBP: ffffc900014abdb0 R08: 00000009334b30ea R09: ffff88013=
3003080
> [   33.298609] R10: 0000000000000000 R11: ffff88007b22a500 R12: ffffffff8=
1e36fa0
> [   33.299885] R13: 0000000000000000 R14: 0000000000000000 R15: ffff88007=
fefcc00
> [   33.301084] FS:  00007f6514f5b740(0000) GS:ffff88013fd00000(0000) knlG=
S:0000000000000000
> [   33.302539] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   33.303574] CR2: 000000000233d298 CR3: 000000007af4e000 CR4: 000000000=
00006e0
> [   33.306540] Call Trace:
> [   33.307094]  ? __bpf_prog_run32+0x23/0x30
> [   33.307831]  ? kvm_clock_get_cycles+0x21/0x30
> [   33.308662]  ? ktime_get+0x3b/0x90
> [   33.309342]  ? bpf_test_run+0x73/0x130
> [   33.310050]  ? bpf_prog_test_run_skb+0x168/0x220
> [   33.310942]  ? SyS_bpf+0x7da/0x14b0
> [   33.311834]  ? security_capset+0x4e/0x70
> [   33.312650]  ? entry_SYSCALL_64_fastpath+0x20/0x83
> [   33.313519] Code: 48 83 7c d5 00 00 0f 84 c8 f5 ff ff 83 e0 0f 48 83 c=
3 08 8b 44 c5 00 48 89 04 24 0f b6 53 f9 c0 ea 04 0f b6 d2 8b 4c d5 00 31 d=
2 <48> f7 f1 48 89 04 24 0f b6 53 f9 83 e2 0f 48 89 44 d5 00 0f b6 =

> [   33.316638] RIP: ___bpf_prog_run+0xa98/0x1390 RSP: ffffc900014abd60
> [   33.317726] ---[ end trace 2b2cb4ff083bdd30 ]---
> [   33.318653] Kernel panic - not syncing: Fatal exception
> [   33.319845] Kernel Offset: disabled
> =

> Elapsed time: 40
> =

> #!/bin/bash
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached in=
 this email
> =

> =

> =

> Thanks,
> Xiaolong
> =



--===============8130915447040988959==--

