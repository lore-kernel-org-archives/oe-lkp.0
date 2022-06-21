Content-Type: multipart/mixed; boundary="===============3435224189435819933=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [rcu] b709abb270: WARNING:at_kernel/rcu/tasks.h:#rcu_tasks_verify_work_fn
Date: Mon, 20 Jun 2022 22:03:17 -0400
Message-ID: <d93b9e08-7976-2901-b363-f9b3b36a884f@redhat.com>
In-Reply-To: <20220621010916.GA13677@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3435224189435819933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 6/20/22 21:09, kernel test robot wrote:
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-11):
>
> commit: b709abb270544e45bbf3135c03fcfa916899f054 ("[PATCH-rcu] rcu-tasks:=
 Use delayed_work to delay rcu_tasks_verify_self_tests()")
> url: https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/rcu-tasks=
-Use-delayed_work-to-delay-rcu_tasks_verify_self_tests/20220614-200840
> base: https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git =
dev
> patch link: https://lore.kernel.org/rcu/20220614120620.1202389-1-longman(=
a)redhat.com
>
> in testcase: boot
>
> on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -=
m 16G
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [   64.538953][    T1] ------------[ cut here ]------------
> [   64.538955][    T1] WARNING: CPU: 0 PID: 1 at kernel/rcu/tasks.h:1861 =
rcu_tasks_verify_work_fn+0xa2/0x140
> [   82.542308][    T1] Modules linked in:
> [   82.542852][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G        W   =
      5.19.0-rc1-00114-gb709abb27054 #1 5174fcc90ab2355d70d76459e249e6beb14=
aec72
> [   82.546011][    T1] RIP: 0010:rcu_tasks_verify_work_fn+0xa2/0x140

I believe the WARN_ON(1) in rcu_tasks_verify_self_tests() got triggered =

30s after the first rcu_tasks_verify_work_fn() is called via =

late_initcall. The timestamp here transition from the WARNING line to =

the next one is more than 18s. I think the VM may have preempted heavily =

by the host causing significant delay or the cpu and memory resource =

available is being overpowered by the debugging code enabled in a kernel =

that include this RCU test. Also the WARNING timestamp of 64.538955 is =

way more than the 30s timeout of the verification test. So I think the =

warning is expected.

Cheers,
Longman

> [   82.546872][    T1] Code: fe 01 75 29 48 8b 35 fd fe ea 02 5b b9 fa 00=
 00 00 48 c7 c2 c0 86 4c 85 5d bf 01 00 00 00 41 5c 41 5d 41 5e e9 1f 88 fa=
 ff 90 <
> 0f> 0b 90 5b 5d 41 5c 41 5d 41 5e 31 c0 89 c2 89 c1 89 c6 89 c7 c3
> [   82.550826][    T1] RSP: 0000:ffffc90000017e60 EFLAGS: 00010246
> [   82.552888][    T1] RAX: 000000000000002c RBX: 0000000000000003 RCX: 0=
000000000000000
> [   82.553917][    T1] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0=
000000000000000
> [   82.554984][    T1] RBP: ffffffff83c38f58 R08: 0000000000000000 R09: 0=
000000000000000
> [   82.557733][    T1] R10: 0000000000000000 R11: 0000000000000000 R12: 0=
000000000000002
> [   82.558808][    T1] R13: 0000000000001d4c R14: 00000000ffffffff R15: f=
fffffff8491b888
> [   82.561186][    T1] FS:  0000000000000000(0000) GS:ffffffff8388e000(00=
00) knlGS:0000000000000000
> [   82.562420][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   82.564635][    T1] CR2: ffff88843ffff000 CR3: 0000000003876000 CR4: 0=
0000000000406b0
> [   82.565735][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0=
000000000000000
> [   82.566827][    T1] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0=
000000000000400
> [   82.569160][    T1] Call Trace:
> [   82.569637][    T1]  <TASK>
> [   82.570049][    T1]  ? rcu_tasks_verify_work_fn+0x140/0x140
> [   82.570816][    T1]  rcu_tasks_verify_schedule_work+0x95/0xc0
> [   82.572939][    T1]  do_one_initcall+0x6b/0x2c0
> [   82.573524][    T1]  do_initcalls+0x127/0x148
> [   82.574155][    T1]  kernel_init_freeable+0xcf/0xff
> [   82.574846][    T1]  ? rest_init+0xc0/0xc0
> [   82.576733][    T1]  kernel_init+0x15/0x140
> [   82.577335][    T1]  ret_from_fork+0x22/0x30
> [   82.577959][    T1]  </TASK>
> [   82.578375][    T1] irq event stamp: 1475417
> [   82.578987][    T1] hardirqs last  enabled at (1475425): [<ffffffff811=
161cd>] __up_console_sem+0x4d/0x80
> [   82.581613][    T1] hardirqs last disabled at (1475436): [<ffffffff811=
161b2>] __up_console_sem+0x32/0x80
> [   82.582980][    T1] softirqs last  enabled at (1475268): [<ffffffff828=
002c0>] __do_softirq+0x2c0/0x434
> [   82.585549][    T1] softirqs last disabled at (1475259): [<ffffffff810=
b57a0>] irq_exit_rcu+0xa0/0x100
> [   82.586852][    T1] ---[ end trace 0000000000000000 ]---
>
>
>
> To reproduce:
>
>          # build kernel
> 	cd linux
> 	cp config-5.19.0-rc1-00114-gb709abb27054 .config
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 olddefconfig prepare modu=
les_prepare bzImage modules
> 	make HOSTCC=3Dgcc-11 CC=3Dgcc-11 ARCH=3Dx86_64 INSTALL_MOD_PATH=3D<mod-i=
nstall-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>
>
>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script=
 is attached in this email
>
>          # if come across any failure that blocks the test,
>          # please remove ~/.lkp and /lkp dir to run from a clean state.
>
>
>

--===============3435224189435819933==--

