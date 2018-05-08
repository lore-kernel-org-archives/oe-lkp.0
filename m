Content-Type: multipart/mixed; boundary="===============4497818530929472348=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [rcu] eef6430cc5: WARNING:at_lib/debugobjects.c:#__debug_object_init
Date: Tue, 08 May 2018 17:57:15 +0900
Message-ID: <133dec3d-f0b0-f9c7-2fb7-9e119e785144@lge.com>
In-Reply-To: <e9ceec21-f8f2-42a3-14d9-576f7e7b8c3a@lge.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4497818530929472348==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2018-05-08 =EC=98=A4=ED=9B=84 5:15, Byungchul Park wrote:
> =

> =

> On 2018-05-08 =EC=98=A4=ED=9B=84 4:31, Ye Xiaolong wrote:
>> On 05/08, Byungchul Park wrote:
>>>
>>>
>>> On 2018-05-04 =EC=98=A4=EC=A0=84 11:33, kernel test robot wrote:
>>>>
>>>>
>>>> FYI, we noticed the following commit (built with gcc-7):
>>>>
>>>> commit: eef6430cc57075ee58259ecad500ba7cae031040 ("rcu: Remove =

>>>> deprecated RCU debugfs tracing code")
>>>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>>>
>>>> in testcase: netpipe
>>>> with following parameters:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0test: tcp
>>>> =C2=A0=C2=A0=C2=A0=C2=A0cluster: cs-localhost
>>>>
>>>> test-description: NetPIPE is a protocol independent performance tool =

>>>> that encapsulates the best of ttcp and netperf and visually =

>>>> represents the network performance under a variety of conditions.
>>>> test-url: http://bitspjoule.org/netpipe/
>>>>
>>>>
>>>> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 2 -m 4G
>>>>
>>>> caused below changes (please refer to attached dmesg/kmsg for entire =

>>>> log/backtrace):
>>>>
>>>>
>>>> +--------------------------------------------------------------------+=
------------+------------+ =

>>>>
>>>> |                                                                    =

>>>> | 5f499c03af | eef6430cc5 |
>>>> +--------------------------------------------------------------------+=
------------+------------+ =

>>>>
>>>> | boot_successes                                                     =

>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | boot_failures                                                      =

>>>> | 24=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | invoked_oom-killer:gfp_mask=3D0x                                     =

>>>> | 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | Mem-Info                                                           =

>>>> | 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes   =

>>>> | 4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | WARNING:suspicious_RCU_usage                                       =

>>>> | 20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | lib/test_rhashtable.c:#suspicious_rcu_dereference_protected()usage =

>>>> | 20=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | WARNING:at_lib/debugobjects.c:#__debug_object_init                 =

>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | RIP:__debug_object_init                                            =

>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> | BUG:kernel_hang_in_test_stage                                      =

>>>> | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +--------------------------------------------------------------------+=
------------+------------+ =

>>>>
>>>
>>> Hello,
>>>
>>> I wanna check this warning.
>>>
>>> Could you provide me ELF vmlinux? It would be helpful and appreciated
>>> if you do.
>>
>> Sure, my current email account doesn't support large mail attachment, =

>> I'll send you
>> with another email.
> =

> Thank you very much. I got your vmlinux and checked it.
> =

> As I suspected, the code calling test_insert_dup() with stack variables
> in test_insert_duplicates_run() but initializing struct rhashtable's
> run_work using INIT_WORK() than INIT_WORK_ONSTACK() in rhashtable_init()
> was the problem.
> =

> It seems to be introduced by the commit 499ac3b6 (test_rhashtable: add
> test case for rhltable with duplicate objects).
> =

> By the way, I don't understand why it rose to the surface at the commit
> eef6430cc5 instead of the commit 499ac3b6. Could you check it why?

I meant "Could you check if the test was done correctly?" ;)

Or it would be helpful if we check the dmsg of the commit 5f499c03af.

Or if checking with the commit 499ac3b6 and 499ac3b6~.

>> Thanks,
>> Xiaolong
>>
>>>
>>> Honestly I guess there seems to be another problem than the eef6430cc5
>>> commit tho.
>>>
>>> Thanks in advance.
>>> Byungchul
>>>
>>>> [=C2=A0=C2=A0 41.762662] WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:=
366 =

>>>> __debug_object_init+0x7ab/0x8ea
>>>> [=C2=A0=C2=A0 41.766378] Modules linked in:
>>>> [=C2=A0=C2=A0 41.767681] CPU: 0 PID: 1 Comm: swapper/0 Not tainted =

>>>> 4.17.0-rc1-00004-geef6430 #1
>>>> [=C2=A0=C2=A0 41.769534] Hardware name: QEMU Standard PC (i440FX + PII=
X, =

>>>> 1996), BIOS 1.10.2-1 04/01/2014
>>>> [=C2=A0=C2=A0 41.770591] RIP: 0010:__debug_object_init+0x7ab/0x8ea
>>>> [=C2=A0=C2=A0 41.770591] RSP: 0000:ffff88011a12f940 EFLAGS: 00010082
>>>> [=C2=A0=C2=A0 41.770591] RAX: dffffc0000000000 RBX: ffff88007eef8310 R=
CX: =

>>>> 0000000000000001
>>>> [=C2=A0=C2=A0 41.770591] RDX: 1ffffffff08ab7dd RSI: 0000000000000001 R=
DI: =

>>>> ffffffff8455bee8
>>>> [=C2=A0=C2=A0 41.770591] RBP: 0000000000000001 R08: fffffbfff07a7905 R=
09: =

>>>> 0000000000000001
>>>> [=C2=A0=C2=A0 41.770591] R10: fffffbfff07fde35 R11: fffffbfff07a7904 R=
12: =

>>>> ffff88011a120000
>>>> [=C2=A0=C2=A0 41.770591] R13: ffff88011a12fb68 R14: ffff88008a83b3f0 R=
15: =

>>>> ffffffff83d0ec40
>>>> [=C2=A0=C2=A0 41.770591] FS:=C2=A0 0000000000000000(0000) GS:ffff88011=
aa00000(0000) =

>>>> knlGS:0000000000000000
>>>> [=C2=A0=C2=A0 41.770591] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000=
080050033
>>>> [=C2=A0=C2=A0 41.770591] CR2: 0000000000000000 CR3: 0000000003c80000 C=
R4: =

>>>> 00000000000006f0
>>>> [=C2=A0=C2=A0 41.770591] Call Trace:
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? debug_object_free+0x25c/0x25c
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? get_random_u32+0x142/0x155
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? bucket_table_alloc+0x242/0x2f6
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 rhashtable_init+0x536/0x5fa
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 rhltable_init+0x45/0x77
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 test_insert_dup+0xec/0x150f
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? print_ht+0x7ef/0x7ef
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? config_num_requests_show+0x70/0x70
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? jhash+0x474/0x474
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? my_hashfn+0x36/0x36
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? kfree+0x30a/0x441
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 test_rht_init+0x522/0xbc1
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? test_rhashtable+0x1791/0x1791
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? test_rhashtable+0x1791/0x1791
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 do_one_initcall+0x29e/0x5db
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? initcall_blacklisted+0x15d/0x15d
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 kernel_init_freeable+0xe50/0xf6c
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? rest_init+0x24a/0x24a
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 kernel_init+0x7/0xfe
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ? rest_init+0x24a/0x24a
>>>> [=C2=A0=C2=A0 41.770591]=C2=A0 ret_from_fork+0x24/0x30
>>>> [=C2=A0=C2=A0 41.770591] Code: c5 48 c7 c7 c0 80 4e 83 89 2d 9a d5 f3 =
03 e8 39 =

>>>> 39 43 ff b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 d0 be 55 84 e8 =

>>>> 99 e3 54 ff <0f> 0b b9 01 00 00 00 31 d2 be 01 00 00 00 48 c7 c7 a0 =

>>>> be 55 84
>>>> [=C2=A0=C2=A0 41.770591] irq event stamp: 6584434
>>>> [=C2=A0=C2=A0 41.770591] hardirqs last=C2=A0 enabled at (6584433): =

>>>> [<ffffffff82decfcf>] _raw_read_unlock_irqrestore+0x3f/0x53
>>>> [=C2=A0=C2=A0 41.770591] hardirqs last disabled at (6584434): =

>>>> [<ffffffff82dec9f3>] _raw_spin_lock_irqsave+0x1d/0x7a
>>>> [=C2=A0=C2=A0 41.770591] softirqs last=C2=A0 enabled at (6584286): =

>>>> [<ffffffff8300088a>] __do_softirq+0x88a/0x95a
>>>> [=C2=A0=C2=A0 41.770591] softirqs last disabled at (6584279): =

>>>> [<ffffffff81113852>] irq_exit+0x8c/0x171
>>>> [=C2=A0=C2=A0 41.770591] ---[ end trace c7a565a44a68a5cb ]---
>>>>
>>>>
>>>> To reproduce:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://git=
hub.com/intel/lkp-tests.git
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzIm=
age> job-script # job-script is =

>>>> attached in this email
>>>>
>>>>
>>>>
>>>> Thanks,
>>>> Xiaolong
>>>>
>>>
>>> -- =

>>> Thanks,
>>> Byungchul
>>
> =


-- =

Thanks,
Byungchul

--===============4497818530929472348==--

