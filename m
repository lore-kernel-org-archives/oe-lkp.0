Content-Type: multipart/mixed; boundary="===============3179922345505487630=="
MIME-Version: 1.0
From: Alex Shi <alex.shi@linaro.org>
To: lkp@lists.01.org
Subject: Re: [sched/balance] BUG: unable to handle kernel paging request at ffffffff00000058
Date: Mon, 17 Mar 2014 10:11:39 +0800
Message-ID: <532659DB.1050709@linaro.org>
In-Reply-To: <20140315014643.GB19456@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============3179922345505487630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/15/2014 09:46 AM, Fengguang Wu wrote:
> Alex, we noticed the below changes in
> =

> https://github.com/alexshi/power-scheduling.git single-balance
> commit e1f728f230025ba2f2ed71e19b156291f53b68fe ("sched/balance: replace =
idle_balance")
> =



Thanks a lot for your data! But I am wondering if the buggy commit
location is right? Since the following panic looks like due to original
kernel, not on my code, since I neither touched any functions on call
path, nor change the struct in panic function.

Could you use addr2line locate the issue line in function
wq_worker_waking_up().

void wq_worker_waking_up(struct task_struct *task, int cpu)
{
        struct worker *worker =3D kthread_data(task);

        if (!(worker->flags & WORKER_NOT_RUNNING)) {
                WARN_ON_ONCE(worker->pool->cpu !=3D cpu);
                atomic_inc(&worker->pool->nr_running);
        }
}

> [    3.814901] PM: Registering ACPI NVS region [mem 0x650a0000-0x65375fff=
] (2973696 bytes)
> [    3.816130] PM: Registering ACPI NVS region [mem 0x65df8000-0x66df7fff=
] (16777216 bytes)
> [    3.820540] PM: Registering ACPI NVS region [mem 0x7accf000-0x7b6fefff=
] (10682368 bytes)
> [    3.824649] BUG: unable to handle kernel paging request at ffffffff000=
00058
> [    3.828000] IP: [<ffffffff810f6389>] wq_worker_waking_up+0x14/0x5b
> [    3.828000] PGD 220d067 PUD 0 =

> [    3.828000] Oops: 0000 [#1] SMP =

> [    3.828000] Modules linked in:
> [    3.828000] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 3.14.0-rc6-00009=
-ge1f728f #1
> [    3.828000] Hardware name: Intel Corporation BRICKLAND/BRICKLAND, BIOS=
 BKLDSDP1.86B.0031.R01.1304221600 04/22/2013
> [    3.828000] task: ffff8808541f8000 ti: ffff8808541e6000 task.ti: ffff8=
808541e6000
> [    3.828000] RIP: 0010:[<ffffffff810f6389>]  [<ffffffff810f6389>] wq_wo=
rker_waking_up+0x14/0x5b
> [    3.828000] RSP: 0000:ffff8808541e7cf0  EFLAGS: 00010002
> [    3.828000] RAX: ffffffff00000000 RBX: ffff8808543b0910 RCX: ffffffff8=
24ee1c0
> [    3.828000] RDX: 00000005811058a8 RSI: 0000000000000001 RDI: ffff88085=
43b0910
> [    3.828000] RBP: ffff8808541e7d00 R08: 000000000000064d R09: 000000000=
000b7f9
> [    3.828000] R10: 0000000000000027 R11: 0000000000006bd9 R12: 000000000=
0000001
> [    3.828000] R13: 0000000000013000 R14: 0000000000000001 R15: 000000000=
0000001
> [    3.828000] FS:  0000000000000000(0000) GS:ffff88085f800000(0000) knlG=
S:0000000000000000
> [    3.828000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    3.828000] CR2: ffffffff00000058 CR3: 000000000220c000 CR4: 000000000=
01407f0
> [    3.828000] Stack:
> [    3.828000]  ffff8808543b0910 ffff88085f833000 ffff8808541e7d20 ffffff=
ff81105a04
> [    3.828000]  ffff8808543b0910 ffff88085f833000 ffff8808541e7d68 ffffff=
ff81108259
> [    3.828000]  0000000000000046 ffff8808543b0f24 ffff8808543b0910 ffff88=
085f838560
> [    3.828000] Call Trace:
> [    3.828000]  [<ffffffff81105a04>] ttwu_do_activate.constprop.88+0x4f/0=
x61
> [    3.828000]  [<ffffffff81108259>] try_to_wake_up+0x1f7/0x228
> [    3.828000]  [<ffffffff811082be>] wake_up_process+0x34/0x37
> [    3.828000]  [<ffffffff810f43c0>] wake_up_worker+0x24/0x26
> [    3.828000]  [<ffffffff810f4e4f>] pwq_adjust_max_active+0x7f/0xaa
> [    3.828000]  [<ffffffff810f4ea9>] link_pwq+0x2f/0x4a
> [    3.828000]  [<ffffffff810f7a4b>] __alloc_workqueue_key+0x29c/0x459
> [    3.828000]  [<ffffffff8236ece1>] ? pm_debugfs_init+0x24/0x24
> [    3.828000]  [<ffffffff8236ecff>] pm_init+0x1e/0x7b
> [    3.828000]  [<ffffffff810002d2>] do_one_initcall+0xa4/0x13a
> [    3.828000]  [<ffffffff810f9a0e>] ? parse_args+0x25f/0x33d
> [    3.828000]  [<ffffffff8234ff94>] kernel_init_freeable+0x1a9/0x22e
> [    3.828000]  [<ffffffff8234f78f>] ? do_early_param+0x88/0x88
> [    3.828000]  [<ffffffff81a31495>] ? rest_init+0x89/0x89
> [    3.828000]  [<ffffffff81a314a3>] kernel_init+0xe/0xdf
> [    3.828000]  [<ffffffff81a4e3bc>] ret_from_fork+0x7c/0xb0
> [    3.828000]  [<ffffffff81a31495>] ? rest_init+0x89/0x89
> [    3.828000] Code: 46 40 83 60 14 df 48 83 c4 28 31 c0 5b 41 5c 41 5d 4=
1 5e 41 5f 5d c3 0f 1f 44 00 00 55 48 89 e5 41 54 41 89 f4 53 e8 c6 53 00 0=
0 <f7> 40 58 c8 01 00 00 48 89 c3 75 36 48 8b 40 48 44 39 60 04 74 =

> [    3.828000] RIP  [<ffffffff810f6389>] wq_worker_waking_up+0x14/0x5b
> [    3.828000]  RSP <ffff8808541e7cf0>
> [    3.828000] CR2: ffffffff00000058
> [    3.828000] ---[ end trace 5d87af0bad79b4cd ]---


-- =

Thanks
    Alex

--===============3179922345505487630==--

