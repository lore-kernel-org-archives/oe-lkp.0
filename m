Content-Type: multipart/mixed; boundary="===============2936485990718369008=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcu] eef6430cc5: WARNING:at_lib/debugobjects.c:#__debug_object_init
Date: Tue, 08 May 2018 17:15:43 +0900
Message-ID: <e9ceec21-f8f2-42a3-14d9-576f7e7b8c3a@lge.com>
In-Reply-To: <20180508073139.GG30203@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2936485990718369008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2018-05-08 =EC=98=A4=ED=9B=84 4:31, Ye Xiaolong wrote:
> On 05/08, Byungchul Park wrote:
>>
>>
>> On 2018-05-04 =EC=98=A4=EC=A0=84 11:33, kernel test robot wrote:
>>>
>>>
>>> FYI, we noticed the following commit (built with gcc-7):
>>>
>>> commit: eef6430cc57075ee58259ecad500ba7cae031040 ("rcu: Remove deprecat=
ed RCU debugfs tracing code")
>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>
>>> in testcase: netpipe
>>> with following parameters:
>>>
>>> 	test: tcp
>>> 	cluster: cs-localhost
>>>
>>> test-description: NetPIPE is a protocol independent performance tool th=
at encapsulates the best of ttcp and netperf and visually represents the ne=
twork performance under a variety of conditions.
>>> test-url: http://bitspjoule.org/netpipe/
>>>
>>>
>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>> +--------------------------------------------------------------------+-=
-----------+------------+
>>> |                                                                    | =
5f499c03af | eef6430cc5 |
>>> +--------------------------------------------------------------------+-=
-----------+------------+
>>> | boot_successes                                                     | =
0          | 0          |
>>> | boot_failures                                                      | =
24         | 24         |
>>> | invoked_oom-killer:gfp_mask=3D0x                                     =
| 4          | 4          |
>>> | Mem-Info                                                           | =
4          | 4          |
>>> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes   | =
4          | 4          |
>>> | WARNING:suspicious_RCU_usage                                       | =
20         | 20         |
>>> | lib/test_rhashtable.c:#suspicious_rcu_dereference_protected()usage | =
20         | 20         |
>>> | WARNING:at_lib/debugobjects.c:#__debug_object_init                 | =
0          | 20         |
>>> | RIP:__debug_object_init                                            | =
0          | 20         |
>>> | BUG:kernel_hang_in_test_stage                                      | =
0          | 19         |
>>> +--------------------------------------------------------------------+-=
-----------+------------+
>>
>> Hello,
>>
>> I wanna check this warning.
>>
>> Could you provide me ELF vmlinux? It would be helpful and appreciated
>> if you do.
> =

> Sure, my current email account doesn't support large mail attachment, I'l=
l send you
> with another email.

Thank you very much. I got your vmlinux and checked it.

As I suspected, the code calling test_insert_dup() with stack variables
in test_insert_duplicates_run() but initializing struct rhashtable's
run_work using INIT_WORK() than INIT_WORK_ONSTACK() in rhashtable_init()
was the problem.

It seems to be introduced by the commit 499ac3b6 (test_rhashtable: add
test case for rhltable with duplicate objects).

By the way, I don't understand why it rose to the surface at the commit
eef6430cc5 instead of the commit 499ac3b6. Could you check it why?

> Thanks,
> Xiaolong
> =

>>
>> Honestly I guess there seems to be another problem than the eef6430cc5
>> commit tho.
>>
>> Thanks in advance.
>> Byungchul
>>
>>> [   41.762662] WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:366 __debug=
_object_init+0x7ab/0x8ea
>>> [   41.766378] Modules linked in:
>>> [   41.767681] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.17.0-rc1-000=
04-geef6430 #1
>>> [   41.769534] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS 1.10.2-1 04/01/2014
>>> [   41.770591] RIP: 0010:__debug_object_init+0x7ab/0x8ea
>>> [   41.770591] RSP: 0000:ffff88011a12f940 EFLAGS: 00010082
>>> [   41.770591] RAX: dffffc0000000000 RBX: ffff88007eef8310 RCX: 0000000=
000000001
>>> [   41.770591] RDX: 1ffffffff08ab7dd RSI: 0000000000000001 RDI: fffffff=
f8455bee8
>>> [   41.770591] RBP: 0000000000000001 R08: fffffbfff07a7905 R09: 0000000=
000000001
>>> [   41.770591] R10: fffffbfff07fde35 R11: fffffbfff07a7904 R12: ffff880=
11a120000
>>> [   41.770591] R13: ffff88011a12fb68 R14: ffff88008a83b3f0 R15: fffffff=
f83d0ec40
>>> [   41.770591] FS:  0000000000000000(0000) GS:ffff88011aa00000(0000) kn=
lGS:0000000000000000
>>> [   41.770591] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [   41.770591] CR2: 0000000000000000 CR3: 0000000003c80000 CR4: 0000000=
0000006f0
>>> [   41.770591] Call Trace:
>>> [   41.770591]  ? debug_object_free+0x25c/0x25c
>>> [   41.770591]  ? get_random_u32+0x142/0x155
>>> [   41.770591]  ? bucket_table_alloc+0x242/0x2f6
>>> [   41.770591]  rhashtable_init+0x536/0x5fa
>>> [   41.770591]  rhltable_init+0x45/0x77
>>> [   41.770591]  test_insert_dup+0xec/0x150f
>>> [   41.770591]  ? print_ht+0x7ef/0x7ef
>>> [   41.770591]  ? config_num_requests_show+0x70/0x70
>>> [   41.770591]  ? jhash+0x474/0x474
>>> [   41.770591]  ? my_hashfn+0x36/0x36
>>> [   41.770591]  ? kfree+0x30a/0x441
>>> [   41.770591]  test_rht_init+0x522/0xbc1
>>> [   41.770591]  ? test_rhashtable+0x1791/0x1791
>>> [   41.770591]  ? test_rhashtable+0x1791/0x1791
>>> [   41.770591]  do_one_initcall+0x29e/0x5db
>>> [   41.770591]  ? initcall_blacklisted+0x15d/0x15d
>>> [   41.770591]  kernel_init_freeable+0xe50/0xf6c
>>> [   41.770591]  ? rest_init+0x24a/0x24a
>>> [   41.770591]  kernel_init+0x7/0xfe
>>> [   41.770591]  ? rest_init+0x24a/0x24a
>>> [   41.770591]  ret_from_fork+0x24/0x30
>>> [   41.770591] Code: c5 48 c7 c7 c0 80 4e 83 89 2d 9a d5 f3 03 e8 39 39=
 43 ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 d0 be 55 84 e8 99 e3 54=
 ff <0f> 0b b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 a0 be 55 84
>>> [   41.770591] irq event stamp: 6584434
>>> [   41.770591] hardirqs last  enabled at (6584433): [<ffffffff82decfcf>=
] _raw_read_unlock_irqrestore+0x3f/0x53
>>> [   41.770591] hardirqs last disabled at (6584434): [<ffffffff82dec9f3>=
] _raw_spin_lock_irqsave+0x1d/0x7a
>>> [   41.770591] softirqs last  enabled at (6584286): [<ffffffff8300088a>=
] __do_softirq+0x88a/0x95a
>>> [   41.770591] softirqs last disabled at (6584279): [<ffffffff81113852>=
] irq_exit+0x8c/0x171
>>> [   41.770591] ---[ end trace c7a565a44a68a5cb ]---
>>>
>>>
>>> To reproduce:
>>>
>>>          git clone https://github.com/intel/lkp-tests.git
>>>          cd lkp-tests
>>>          bin/lkp qemu -k <bzImage> job-script # job-script is attached =
in this email
>>>
>>>
>>>
>>> Thanks,
>>> Xiaolong
>>>
>>
>> -- =

>> Thanks,
>> Byungchul
> =


-- =

Thanks,
Byungchul

--===============2936485990718369008==--

