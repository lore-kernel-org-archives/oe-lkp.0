Content-Type: multipart/mixed; boundary="===============2283917249531120966=="
MIME-Version: 1.0
From: Waiman Long <longman@redhat.com>
To: lkp@lists.01.org
Subject: Re: [locking/paravirt] 9043442b43: WARNING:at_kernel/jump_label.c:#static_key_disable_cpuslocked
Date: Wed, 11 Oct 2017 16:14:30 -0400
Message-ID: <8ddf11c2-1cf7-c74c-e72a-29a7404370fe@redhat.com>
In-Reply-To: <20171011195627.eh6cqiclnxx2cf45@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============2283917249531120966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/11/2017 03:56 PM, kernel test robot wrote:
> FYI, we noticed the following commit (built with gcc-6):
>
> commit: 9043442b43b1fddf202591b84702863286700c1a ("locking/paravirt: Use =
new static key for controlling call of virt_spin_lock()")
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/core
>
> in testcase: will-it-scale
> with following parameters:
>
> 	nr_task: 100%
> 	mode: process
> 	test: mmap2
> 	cpufreq_governor: performance
>
> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
>
>
> on test machine: 8 threads Ivy Bridge with 16G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
> +----------------+------------+------------+
> |                | af1a34f211 | 9043442b43 |
> +----------------+------------+------------+
> | boot_successes | 4          | 4          |
> +----------------+------------+------------+
>
>
>
> kern  :warn  : [    0.000000] WARNING: CPU: 0 PID: 0 at kernel/jump_label=
.c:161 static_key_disable_cpuslocked+0x69/0x80
> kern  :warn  : [    0.000000] Modules linked in:
> kern  :warn  : [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.1=
4.0-rc4-00059-g9043442 #1
> kern  :warn  : [    0.000000] Hardware name:                  /DZ77BH-55K=
, BIOS BHZ7710H.86A.0097.2012.1228.1346 12/28/2012
> kern  :warn  : [    0.000000] task: ffffffff81e10480 task.stack: ffffffff=
81e00000
> kern  :warn  : [    0.000000] RIP: 0010:static_key_disable_cpuslocked+0x6=
9/0x80
> kern  :warn  : [    0.000000] RSP: 0000:ffffffff81e03e98 EFLAGS: 00010092=
 ORIG_RAX: 0000000000000000
> kern  :warn  : [    0.000000] RAX: 0000000000000041 RBX: ffffffff81e36fc0=
 RCX: ffffffff81e60c88
> kern  :warn  : [    0.000000] RDX: 0000000000000001 RSI: 0000000000000092=
 RDI: 0000000000000047
> kern  :warn  : [    0.000000] RBP: ffffffff81e03ea8 R08: 6573752064656b63=
 R09: 00000000000000a6
> kern  :warn  : [    0.000000] R10: 0000000000000000 R11: 0000000000000041=
 R12: ffff88041efc2400
> kern  :warn  : [    0.000000] R13: ffffffff82170920 R14: ffffffff8218b780=
 R15: 0000000000000000
> kern  :warn  : [    0.000000] FS:  0000000000000000(0000) GS:ffff88041ec0=
0000(0000) knlGS:0000000000000000
> kern  :warn  : [    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> kern  :warn  : [    0.000000] CR2: ffff88041e4e0000 CR3: 000000041de09000=
 CR4: 00000000000606b0
> kern  :warn  : [    0.000000] Call Trace:
> kern  :warn  : [    0.000000]  static_key_disable+0x1a/0x30
> kern  :warn  : [    0.000000]  native_pv_lock_init+0x1b/0x1e
> kern  :warn  : [    0.000000]  native_smp_prepare_boot_cpu+0x32/0x35
> kern  :warn  : [    0.000000]  start_kernel+0x14f/0x421
> kern  :warn  : [    0.000000]  x86_64_start_reservations+0x2a/0x2c
> kern  :warn  : [    0.000000]  x86_64_start_kernel+0x72/0x75
> kern  :warn  : [    0.000000]  secondary_startup_64+0xa5/0xa5
> kern  :warn  : [    0.000000] Code: 0f b1 13 85 c0 75 2c 48 c7 c7 20 5d f=
0 81 e8 ef 25 7b 00 5b 41 5c 5d c3 48 c7 c6 80 92 a3 81 48 c7 c7 20 83 cb 8=
1 e8 48 be f3 ff <0f> ff eb ab 0f ff eb b6 48 89 df e8 17 fc ff ff eb ca 0f=
 1f 44 =

> kern  :warn  : [    0.000000] ---[ end trace c894ffaa5cf6e690 ]---
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> lkp

I think you need to move native_pv_lock_init() after jump_lable_init().

Cheers,
Longman


--===============2283917249531120966==--

