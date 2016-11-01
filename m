Content-Type: multipart/mixed; boundary="===============0862014344720084768=="
MIME-Version: 1.0
From: Dou Liyang <douly.fnst@cn.fujitsu.com>
To: lkp@lists.01.org
Subject: Re: [x86/acpi] 04c197c080: BUG: unable to handle kernel paging request at 0000003000000010
Date: Tue, 01 Nov 2016 17:07:52 +0800
Message-ID: <ec4a6b11-08be-77a3-f5e6-55f4796341f1@cn.fujitsu.com>
In-Reply-To: <57fc4b37.qTCeqeyF4oewr6Ub%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0862014344720084768==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi xiaolong,

Sorry for the late reply.

I think I should need to explain for this.

Firstly, please ignore this bug. Because, this patch has be discarded.
The work of this patch has already in the upstream(f3bf1dbe64).

Secondly, I think the cause of the bug is:

I use the "-EINVAL" incorrectly.

Thanks,
Dou.

This patch is repeated with him
At 10/11/2016 10:15 AM, kernel test robot wrote:
> FYI, we noticed the following commit:
>
> https://github.com/0day-ci/linux Dou-Liyang/Fix-the-local-APIC-id-validat=
ion-in-case-of-0xff/20161008-154907
> commit 04c197c080f2ed7a022f79701455c6837f4b9573 ("x86/acpi: Fix the local=
 APIC id validation in case of 0xff")
>
> in testcase: will-it-scale
> with following parameters:
>
> 	test: unlink2
> 	cpufreq_governor: performance
>
>
> Will It Scale takes a testcase and runs it from 1 through to n parallel c=
opies to see if the testcase will scale. It builds both a process and threa=
ds based test in order to see any differences between the two.
>
>
> on test machine: 72 threads Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz wit=
h 128G memory
>
> caused below changes:
>
>
> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | 1e1a4b0f54 | 04=
c197c080 |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 2          | 4 =
         |
> | boot_failures                                         | 0          | 7 =
         |
> | BUG:unable_to_handle_kernel                           | 0          | 3 =
         |
> | Oops                                                  | 0          | 3 =
         |
> | RIP:check_timer                                       | 0          | 3 =
         |
> | calltrace:native_smp_prepare_cpus                     | 0          | 3 =
         |
> | Kernel_panic-not_syncing:Fatal_exception              | 0          | 3 =
         |
> | PANIC:double_fault                                    | 0          | 2 =
         |
> | Bad_pagetable                                         | 0          | 1 =
         |
> | RIP:copy_user_enhanced_fast_string                    | 0          | 1 =
         |
> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0          | 1 =
         |
> | Kernel_panic-not_syncing:Machine_halted               | 0          | 1 =
         |
> | RIP:vgacon_scroll                                     | 0          | 1 =
         |
> | invoked_oom-killer:gfp_mask=3D0x                        | 0          | =
4          |
> | Mem-Info                                              | 0          | 4 =
         |
> +-------------------------------------------------------+------------+---=
---------+
>
>
>
> [    0.492621] ..MP-BIOS bug: 8254 timer not connected to IO-APIC
> [    0.499130] ...trying to set up timer (IRQ0) through the 8259A ...
> [    0.506027] ..... (found apic 2 pin 0) ...
> [    0.510601] BUG: unable to handle kernel paging request at 00000030000=
00010
> [    0.518391] IP: [<ffffffff8200964b>] check_timer+0x21d/0x61e
> [    0.524722] PGD 0
> [    0.526974] Oops: 0000 [#1] SMP
> [    0.530477] Modules linked in:
> [    0.533901] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.8.0-00989-g04c=
197c #1
> [    0.541865] Hardware name: Intel Corporation S2600WTT/S2600WTT, BIOS S=
E5C610.86B.01.01.0008.021120151325 02/11/2015
> [    0.553521] task: ffff882023b00000 task.stack: ffffc9000c468000
> [    0.560129] RIP: 0010:[<ffffffff8200964b>]  [<ffffffff8200964b>] check=
_timer+0x21d/0x61e
> [    0.569170] RSP: 0000:ffffc9000c46bd90  EFLAGS: 00010082
> [    0.575095] RAX: 0000003000000000 RBX: 0000000000000000 RCX: ffffffff8=
1e5cb48
> [    0.583058] RDX: 0000000000000001 RSI: 0000000000000046 RDI: 000000000=
0000046
> [    0.591031] RBP: ffffc9000c46be08 R08: 0000000000000000 R09: 000000000=
0000000
> [    0.598994] R10: 0000000000000040 R11: 0000000000000208 R12: 000000000=
0000002
> [    0.606957] R13: 0000000000000002 R14: 0000000000000002 R15: ffff88103=
f00ae20
> [    0.614927] FS:  0000000000000000(0000) GS:ffff88103f400000(0000) knlG=
S:0000000000000000
> [    0.623958] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    0.630368] CR2: 0000003000000010 CR3: 000000207ee06000 CR4: 000000000=
01406f0
> [    0.638331] Stack:
> [    0.640574]  0000000000000000 0000000000000246 ffffffff00000000 ffff88=
103f002080
> [    0.648870]  ffff88103f002080 0000000000000017 0000000000000001 ffffc9=
000c46bdd8
> [    0.657165]  ffffffff8145869d ffffc9000c46bde8 0000000000000718 000000=
0000000001
> [    0.665459] Call Trace:
> [    0.668193]  [<ffffffff8145869d>] ? radix_tree_lookup+0xd/0x10
> [    0.674710]  [<ffffffff8200a1a9>] setup_IO_APIC+0x17d/0x1c5
> [    0.680937]  [<ffffffff8200885c>] apic_bsp_setup+0xa1/0xac
> [    0.687059]  [<ffffffff820064b5>] native_smp_prepare_cpus+0x297/0x317
> [    0.694259]  [<ffffffff81ff1038>] kernel_init_freeable+0xcf/0x225
> [    0.701072]  [<ffffffff81929710>] ? rest_init+0x90/0x90
> [    0.706911]  [<ffffffff8192971e>] kernel_init+0xe/0x100
> [    0.712744]  [<ffffffff81936fc5>] ret_from_fork+0x25/0x30
> [    0.718776] Code: ff 48 c7 c7 50 6d c9 81 e8 31 54 17 ff 89 da 44 89 e=
e 48 c7 c7 90 6d c9 81 e8 20 54 17 ff 48 8b 45 a8 48 8b 00 48 39 45 a8 74 1=
a <44> 39 70 10 75 0f 44 39 60 14 75 09 44 89 68 10 89 58 14 eb 26
> [    0.740436] RIP  [<ffffffff8200964b>] check_timer+0x21d/0x61e
> [    0.746858]  RSP <ffffc9000c46bd90>
> [    0.750749] CR2: 0000003000000010
> [    0.754461] ---[ end trace 3618134a8804dce5 ]---
> [    0.759620] Kernel panic - not syncing: Fatal exception
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Kernel Test Robot
>
>



--===============0862014344720084768==--

