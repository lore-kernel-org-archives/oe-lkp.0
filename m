Content-Type: multipart/mixed; boundary="===============4098957450459964387=="
MIME-Version: 1.0
From: Prarit Bhargava <prarit@redhat.com>
To: lkp@lists.01.org
Subject: Re: b1cbacc866 ("x86/smpboot: Do not use smp_num_siblings in .."): divide error: 0000 [#1] SMP DEBUG_PAGEALLOC
Date: Tue, 05 Dec 2017 07:23:06 -0500
Message-ID: <450d8bc5-dee3-98ce-b9a7-55de0903f0ca@redhat.com>
In-Reply-To: <5a265207.6iaCTw+bsnaHzUrb%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4098957450459964387==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/05/2017 03:00 AM, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
> =

> commit b1cbacc8663a4dce62e4ae501e859c82f4aeb1ca
> Author:     Prarit Bhargava <prarit@redhat.com>
> AuthorDate: Mon Dec 4 11:45:21 2017 -0500
> Commit:     Thomas Gleixner <tglx@linutronix.de>
> CommitDate: Mon Dec 4 23:03:48 2017 +0100
> =

>     x86/smpboot: Do not use smp_num_siblings in __max_logical_packages ca=
lculation
>     =

>     Documentation/x86/topology.txt defines smp_num_siblings as "The numbe=
r of
>     threads in a core".  Since commit bbb65d2d365e ("x86: use cpuid vecto=
r 0xb
>     when available for detecting cpu topology") smp_num_siblings is the
>     maximum number of threads in a core.  If Simultaneous MultiThreading
>     (SMT) is disabled on a system, smp_num_siblings is 2 and not 1 as
>     expected.
>     =

>     Use topology_max_smt_threads(), which contains the active numer of th=
reads,
>     in the __max_logical_packages calculation.
>     =


Looking now.

P.

>     Fixes: b4c0a7326f5d ("x86/smpboot: Fix __max_logical_packages estimat=
e")
>     Reported-by: Jakub Kicinski <kubakici@wp.pl>
>     Signed-off-by: Prarit Bhargava <prarit@redhat.com
>     Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>     Tested-by: Jakub Kicinski <kubakici@wp.pl>
>     Cc: netdev(a)vger.kernel.org
>     Cc: "netdev(a)vger.kernel.org"
>     Cc: Clark Williams <williams@redhat.com>
>     Link: https://lkml.kernel.org/r/20171204164521.17870-1-prarit(a)redha=
t.com
> =

> 866a79a1c9  x86/microcode/AMD: Add support for fam17h microcode loading
> b1cbacc866  x86/smpboot: Do not use smp_num_siblings in __max_logical_pac=
kages calculation
> cdf577209a  x86/power: Fix some ordering bugs in __restore_processor_cont=
ext()
> 5b33501b13  Merge branch 'WIP.x86/mm'
> +------------------------------------------+------------+------------+---=
---------+------------+
> |                                          | 866a79a1c9 | b1cbacc866 | cd=
f577209a | 5b33501b13 |
> +------------------------------------------+------------+------------+---=
---------+------------+
> | boot_successes                           | 33         | 0          | 0 =
         | 10         |
> | boot_failures                            | 0          | 15         | 19=
         |            |
> | divide_error:#[##]                       | 0          | 15         | 19=
         |            |
> | RIP:native_smp_cpus_done                 | 0          | 15         | 19=
         |            |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 15         | 19=
         |            |
> +------------------------------------------+------------+------------+---=
---------+------------+
> =

> [    0.025056] smpboot: CPU0: Intel QEMU Virtual CPU version 2.5+ (family=
: 0x6, model: 0x6, stepping: 0x3)
> [    0.026373] Performance Events: PMU not available due to virtualizatio=
n, using software events only.
> [    0.029102] Hierarchical SRCU implementation.
> [    0.030040] smp: Bringing up secondary CPUs ...
> [    0.030528] smp: Brought up 1 node, 1 CPU
> [    0.030953] divide error: 0000 [#1] SMP DEBUG_PAGEALLOC
> [    0.031000] Modules linked in:
> [    0.031000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.14.0-01223-gb1=
cbacc #1
> [    0.031000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
> [    0.031000] task: ffff88001e460000 task.stack: ffffc90000008000
> [    0.031000] RIP: 0010:native_smp_cpus_done+0x3a/0xd9
> [    0.031000] RSP: 0000:ffffc9000000bed8 EFLAGS: 00010246
> [    0.031000] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 000000000=
0000000
> [    0.031000] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff8=
2645830
> [    0.031000] RBP: ffffc9000000bee8 R08: 0000000000000000 R09: 000000000=
0000000
> [    0.031000] R10: ffff88001e460ce0 R11: 0000000000000001 R12: 000000000=
000a020
> [    0.031000] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [    0.031000] FS:  0000000000000000(0000) GS:ffff88001f800000(0000) knlG=
S:0000000000000000
> [    0.031000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.031000] CR2: 00000000ffffffff CR3: 000000000c822000 CR4: 000000000=
00006b0
> [    0.031000] Call Trace:
> [    0.031000]  smp_init+0xa4/0xa9
> [    0.031000]  kernel_init_freeable+0x7d/0x1af
> [    0.031000]  ? rest_init+0xc0/0xc0
> [    0.031000]  kernel_init+0x9/0xeb
> [    0.031000]  ret_from_fork+0x24/0x30
> [    0.031000] Code: 64 82 48 89 e5 41 54 49 c7 c4 20 a0 00 00 53 31 db 4=
2 0f b7 8c 20 d8 00 00 00 8b 05 26 7d de ff 0f af 0d 7b 67 de ff 8d 44 01 f=
f <f7> f1 89 c6 89 05 75 67 de ff e8 91 55 6b fe e8 96 33 00 00 83 =

> [    0.031000] RIP: native_smp_cpus_done+0x3a/0xd9 RSP: ffffc9000000bed8
> [    0.031004] ---[ end trace 5c005ba3fb078002 ]---
> [    0.031461] Kernel panic - not syncing: Fatal exception
> =

>                                                           # HH:MM RESULT =
GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start a2b385361ab06450408875fe58a45445ed300a40 4fbd8d194f06c8a=
3fd2af1ce560ddb31f7ec8323 --
> git bisect  bad 60f97903c07c2f9dec16f3434fa6bc8374553c75  # 07:54  B     =
 0     1   15   0  Merge 'krzk/for-next' into devel-catchup-201712050639
> git bisect  bad c5ae250423192c95979baa9e26553078c6fbdb12  # 09:33  B     =
 0     5   19   0  Merge 'linux-review/yuan-linyu/netlink-optimize-err-assi=
gnment/20171205-051606' into devel-catchup-201712050639
> git bisect  bad d45ca31b78f444ff0f7c6dbd56df9c75991b1748  # 10:16  B     =
 0     6   20   0  Merge 'jcmvbkbc-xtensa/xtensa-ssp-kasan' into devel-catc=
hup-201712050639
> git bisect good 9b490c677dc4246f6f2adad29d94a71a25f492a8  # 10:49  G     =
10     0    0   1  Merge 'abelloni/at91-dt-fixes' into devel-catchup-201712=
050639
> git bisect good fcfab2f4b076cdd0c000c2e1a30404e4007c2c06  # 11:13  G     =
11     0    0   0  Merge 'abelloni/at91-dt' into devel-catchup-201712050639
> git bisect  bad b9115db1d525e5a59a515ec6ffc53e5163b53f9b  # 11:52  B     =
 0    10   24   0  Merge 'tip/x86/urgent' into devel-catchup-201712050639
> git bisect good 2b67799bdf25d19690710a88c2bce9127cf3ba6f  # 12:16  G     =
10     0    0   0  x86: Make X86_BUG_FXSAVE_LEAK detectable in CPUID on AMD
> git bisect good 866a79a1c98c5004a410122b06f808152f2fe53c  # 12:53  G     =
11     0    0   0  x86/microcode/AMD: Add support for fam17h microcode load=
ing
> git bisect  bad 2ee90363a838cf41ebf1ad24bad274762e467d8d  # 13:15  B     =
 0     3   17   0  x86 / PCI: Make broadcom_postcore_init() check acpi_disa=
bled
> git bisect  bad b1cbacc8663a4dce62e4ae501e859c82f4aeb1ca  # 13:39  B     =
 0     1   15   0  x86/smpboot: Do not use smp_num_siblings in __max_logica=
l_packages calculation
> # first bad commit: [b1cbacc8663a4dce62e4ae501e859c82f4aeb1ca] x86/smpboo=
t: Do not use smp_num_siblings in __max_logical_packages calculation
> git bisect good 866a79a1c98c5004a410122b06f808152f2fe53c  # 13:55  G     =
31     0    0   0  x86/microcode/AMD: Add support for fam17h microcode load=
ing
> # extra tests with debug options
> git bisect  bad b1cbacc8663a4dce62e4ae501e859c82f4aeb1ca  # 14:22  B     =
 0    11   25   0  x86/smpboot: Do not use smp_num_siblings in __max_logica=
l_packages calculation
> # extra tests on HEAD of linux-devel/devel-catchup-201712050639
> git bisect  bad a2b385361ab06450408875fe58a45445ed300a40  # 14:22  B     =
 0    21   38   0  0day head guard for 'devel-catchup-201712050639'
> # extra tests on tree/branch tip/x86/urgent
> git bisect  bad cdf577209aad4cdbe3455d3efa6cf631f838c55d  # 14:37  B     =
 0     1   15   0  x86/power: Fix some ordering bugs in __restore_processor=
_context()
> # extra tests with first bad commit reverted
> git bisect good 886fa2f68001f51d63c3934943f4a844faaa5e8f  # 15:15  G     =
11     0    0   0  Revert "x86/smpboot: Do not use smp_num_siblings in __ma=
x_logical_packages calculation"
> # extra tests on tree/branch tip/master
> git bisect good 5b33501b13ab807284ae73492938d162e0f8629e  # 15:59  G     =
10     0    0   0  Merge branch 'WIP.x86/mm'
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
>=20

--===============4098957450459964387==--

