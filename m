Content-Type: multipart/mixed; boundary="===============5747286586074424416=="
MIME-Version: 1.0
From: Kirill Tkhai <tkhai@yandex.ru>
To: lkp@lists.01.org
Subject: Re: [sched/deadline] kernel BUG at kernel/sched/deadline.c:805!
Date: Mon, 16 Feb 2015 15:38:34 +0300
Message-ID: <1374601424090314@web4j.yandex.ru>
In-Reply-To: <9846861424087552@web13j.yandex.ru>
List-Id: <oe-lkp.lists.linux.dev>

--===============5747286586074424416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

16.02.2015, 14:52, "Kirill Tkhai" <tkhai@yandex.ru>:
> 16.02.2015, 10:21, "Fengguang Wu" <fengguang.wu@intel.com>:
>> =C2=A0Hi Peter,
>>
>> =C2=A0We got the below dmesg and the first bad commit is
>>
>> =C2=A0git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git r=
evert-d347efeb16d3d5150cb7f8d50b05f388b572840e-1019a359d3dc4b64d0e1e5a5efcb=
725d5e83994d
>>
>> =C2=A0commit 1019a359d3dc4b64d0e1e5a5efcb725d5e83994d
>> =C2=A0Author: =C2=A0=C2=A0=C2=A0=C2=A0Peter Zijlstra <peterz@infradead=
.org>
>> =C2=A0AuthorDate: Wed Nov 26 08:44:03 2014 +0800
>> =C2=A0Commit: =C2=A0=C2=A0=C2=A0=C2=A0Ingo Molnar <mingo@kernel.org>
>> =C2=A0CommitDate: Wed Feb 4 07:52:26 2015 +0100
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sched/deadline: Fix stale yield state
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0When we fail to start the deadline timer i=
n update_curr_dl(), we
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0forget to clear ->dl_yielded, resulting in=
 wrecked time keeping.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Since the natural place to clear both ->dl=
_yielded and ->dl_throttled
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0is in replenish_dl_entity(); both are afte=
r all waiting for that event;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0make it so.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Luckily since 67dfa1b756f2 ("sched/deadlin=
e: Implement
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cancel_dl_timer() to use in switched_from_=
dl()") the
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0task_on_rq_queued() condition in dl_task_t=
imer() must be true, and can
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0therefore call enqueue_task_dl() unconditi=
onally.
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Reported-by: Wanpeng Li <wanpeng.li@linu=
x.intel.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Peter Zijlstra (Intel) <pet=
erz@infradead.org>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Cc: Kirill Tkhai <ktkhai@parallels.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Cc: Juri Lelli <juri.lelli@arm.com>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Cc: Linus Torvalds <torvalds@linux-found=
ation.org>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Link: http://lkml.kernel.org/r/1416962647-=
76792-4-git-send-email-wanpeng.li(a)linux.intel.com
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Signed-off-by: Ingo Molnar <mingo@kernel=
.org>
>>
>> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>> =C2=A0PARENT COMMIT NOT CLEAN. LOOK OUT FOR WRONG BISECT!
>> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>>
>> =C2=A0+------------------------------------------------+------------+---=
---------+------------+
>> =C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| a7be=
bf4887 | 1019a359d3 | 58e0e18cb8 |
>> =C2=A0+------------------------------------------------+------------+---=
---------+------------+
>> =C2=A0| boot_successes =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 886 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 54 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 10 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| boot_failures =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 314 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 246 =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| 4 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
>> =C2=A0| BUG:kernel_boot_crashed =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 48 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 20 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| BUG:kernel_test_crashed =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0| 16 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| BUG:kernel_boot_hang =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 213 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| 43 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| Kernel_panic-not_syncing:softlockup:hung_tasks | 37 =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:ring_buffer_consumer_thread =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_get_node_by_name =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 4 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:gcov_enable_events =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 17 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:gcov_fs_init =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 17 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:kernel_init_freeable =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 20 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 178 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_strcmp =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 7 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at__slab_alloc =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
>> =C2=A0| backtrace:__ring_buffer_alloc =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:ring_buffer_benchmark_init =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
>> =C2=A0| EIP_is_at_lock_release =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|
>> =C2=A0| backtrace:debug_mutex_init =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_strncmp =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_do_raw_spin_unlock =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at__do_softirq =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 6 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| 2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_gcov_info_filename =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_ring_buffer_consume =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 8 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_raw_spin_unlock_irqrestore =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|
>> =C2=A0| EIP_is_at_ftrace_ops_list_func =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:event_trace_self_tests =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:event_trace_self_tests_init =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 2 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|
>> =C2=A0| EIP_is_at_ftrace_likely_update =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_rb_reserve_next_event =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_raw_spin_unlock_irq =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| kernel_BUG_at_kernel/sched/deadline.c =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 178 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| invalid_opcode =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 0 =
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 178 =C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0|
>> =C2=A0| EIP_is_at_enqueue_task_dl =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
178 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| Kernel_panic-not_syncing:Fatal_exception =C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
178 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:register_tracer =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| =
178 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
>> =C2=A0| backtrace:init_wakeup_tracer =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 178 =C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 3 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|
>> =C2=A0+------------------------------------------------+------------+---=
---------+------------+
>>
>> =C2=A0[ =C2=A0=C2=A0=C2=A06.432010] Testing ftrace regs: PASSED
>> =C2=A0[ =C2=A0=C2=A0=C2=A06.530393] Testing tracer wakeup:
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.648615] ------------[ cut here ]------------
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] kernel BUG at kernel/sched/deadline.=
c:805!
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] invalid opcode: 0000 [#1] SMP
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] CPU: 0 PID: 1 Comm: swapper/0 Not ta=
inted 3.19.0-rc6-00041-g1019a35 #17
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] Hardware name: QEMU Standard PC (i44=
0FX + PIIX, 1996), BIOS 1.7.5-20140531_083030-gandalf 04/01/2014
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] task: d3348000 ti: d3344000 task.ti:=
 d3344000
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] EIP: 0060:[<c11969a1>] EFLAGS: 00010=
046 CPU: 0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] EIP is at enqueue_task_dl+0x341/0x18=
60
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] EAX: d2940101 EBX: 00000001 ECX: 000=
00000 EDX: 0085a491
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] ESI: d2940000 EDI: d2940101 EBP: d33=
45e08 ESP: d3345dc0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0DS: 007b ES: 007b FS: 00d8 GS:=
 00e0 SS: 0068
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] CR0: 8005003b CR2: ffffffff CR3: 04e=
8b000 CR4: 000006d0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] Stack:
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0c1170353 00000002 d3345de0 c11=
ab53c d391ec10 00000046 d33485c0 d3348000
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A000000002 d29401b8 d391ec00 d29=
401b8 00000046 00000005 00000000 d2940000
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0d391ec00 c36efc80 d3345e20 c11=
5991a 00000005 00000000 d391ec00 00000000
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] Call Trace:
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c1170353>] ? sched_clock_cpu=
+0x293/0x2e0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c11ab53c>] ? __lock_is_held+=
0x6c/0xa0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c115991a>] enqueue_task+0xba=
/0x220
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c115aa4c>] activate_task+0x4=
c/0x80
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c115aaa1>] ttwu_activate+0x2=
1/0x90
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c115bd84>] ttwu_do_activate+=
0x64/0x90
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c11689b6>] try_to_wake_up+0x=
366/0x8b0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c1169000>] wake_up_process+0=
xa0/0xe0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c114095b>] kthread_stop+0x21=
b/0xd90
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c12c0b27>] trace_selftest_st=
artup_wakeup+0x3b7/0x4b0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c36b1690>] ? wait_for_comple=
tion+0x1f0/0x290
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c12c1d04>] register_tracer+0=
x2d4/0x700
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c4bd11a4>] init_wakeup_trace=
r+0x1d/0xea
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c4b8f12e>] do_one_initcall+0=
x278/0x44c
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c4bd1187>] ? init_function_t=
race+0x1f8/0x1f8
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c4b8f565>] kernel_init_freea=
ble+0x263/0x424
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c3663b4c>] kernel_init+0x1c/=
0x2a0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c36c2181>] ret_from_kernel_t=
hread+0x21/0x30
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] =C2=A0[<c3663b30>] ? rest_init+0x330=
/0x330
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] Code: da e8 94 96 13 00 8b 04 9d 84 =
f6 77 c4 83 c0 01 89 04 9d 84 f6 77 c4 89 f8 84 c0 74 4d 83 05 c8 14 f2 c4 =
01 83 15 cc 14 f2 c4 00 <0f> 0b 83 05 d0 14 f2 c4 01 83 15 d4 14 f2 c4 00 8=
d b4 26 00 00
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] EIP: [<c11969a1>] enqueue_task_dl+0x=
341/0x1860 SS:ESP 0068:d3345dc0
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] ---[ end trace cb4bdebe33135894 ]---
>> =C2=A0[ =C2=A0=C2=A0=C2=A07.649000] Kernel panic - not syncing: Fatal ex=
ception
>>
>> =C2=A0git bisect start 58e0e18cb8b1c3351cb70b3cf78d4e3785a181fe bfa76d49=
576599a4b9f9b7a71f23d73d6dcff735 --
>> =C2=A0git bisect =C2=A0bad 30496a920e97b97e16d078c520eef323344ef997 =C2=
=A0# 23:32 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A067 =C2=
=A0Merge 'amirv/for-upstream' into devel-xian-smoke-201502152116
>> =C2=A0git bisect good d170f4905ee6f93eb12f87d018dd4b9acea18f2c =C2=A0# 0=
0:27 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0120 =C2=A00day base guard for=
 'devel-xian-smoke-201502152116'
>> =C2=A0git bisect =C2=A0bad c5ce28df0e7c01a1de23c36ebdefcd803f2b6cbb =C2=
=A0# 01:11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A072 =C2=
=A0Merge git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
>> =C2=A0git bisect good 57ee062e4baa9532e5a3835a2d185590a3fc8bd3 =C2=A0# 0=
1:51 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0=C2=A094 =C2=A0Merge branch '=
r8152'
>> =C2=A0git bisect =C2=A0bad c08f8467939e7d2eebcba7cf2330242c4f53f2f7 =C2=
=A0# 02:10 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0103 =C2=A0Mer=
ge tag 'pci-v3.20-changes' of git://git.kernel.org/pub/scm/linux/kernel/git=
/helgaas/pci
>> =C2=A0git bisect =C2=A0bad 5b9b28a63f2e47dac5ff3a2503bfe3ade8796aa0 =C2=
=A0# 02:24 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A05=
 =C2=A0Merge branch 'sched-core-for-linus' of git://git.kernel.org/pub/scm/=
linux/kernel/git/tip/tip
>> =C2=A0git bisect good 30d46827c2744f56bb31460007f2d16455f10720 =C2=A0# 0=
2:41 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0107 =C2=A0Merge tag 'regulato=
r-v3.20' of git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator
>> =C2=A0git bisect good 8308756f45a12e2ff4f7749c2694fc83cdef0be9 =C2=A0# 0=
3:11 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0101 =C2=A0Merge branch 'locki=
ng-core-for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>> =C2=A0git bisect good 4ac30cf74b308fb01338e660d3471cd490a7958a =C2=A0# 0=
3:36 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0=C2=A025 =C2=A0perf tools: Do=
 not use __perf_session__process_events() directly
>> =C2=A0git bisect =C2=A0bad 9659e1eeee28f7025b6545934d644d19e9c6e603 =C2=
=A0# 03:48 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A02=
 =C2=A0sched/deadline: Remove cpu_active_mask from cpudl_find()
>> =C2=A0git bisect good 3847b272248a3a4ed70d20392cc0454917f7713b =C2=A0# 0=
4:23 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0=C2=A089 =C2=A0Merge branch '=
sched/urgent' into sched/core
>> =C2=A0git bisect good 4c195c8a1967ff8bee13a811518a99db04618ab7 =C2=A0# 0=
4:59 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0118 =C2=A0Merge branch 'sched=
/urgent' into sched/core, to merge fixes before applying new patches
>> =C2=A0git bisect =C2=A0bad 1019a359d3dc4b64d0e1e5a5efcb725d5e83994d =C2=
=A0# 05:10 =C2=A0=C2=A0=C2=A0=C2=A039- =C2=A0=C2=A0=C2=A0193 =C2=A0sched/de=
adline: Fix stale yield state
>> =C2=A0git bisect good a7bebf488791aa1036f3e6629daf01d01f705dcb =C2=A0# 0=
5:34 =C2=A0=C2=A0=C2=A0300+ =C2=A0=C2=A0=C2=A0103 =C2=A0sched/deadline: Fix=
 hrtick for a non-leftmost task
>> =C2=A0# first bad commit: [1019a359d3dc4b64d0e1e5a5efcb725d5e83994d] sch=
ed/deadline: Fix stale yield state
>> =C2=A0git bisect good a7bebf488791aa1036f3e6629daf01d01f705dcb =C2=A0# 0=
5:55 =C2=A0=C2=A0=C2=A0900+ =C2=A0=C2=A0=C2=A0314 =C2=A0sched/deadline: Fix=
 hrtick for a non-leftmost task
>> =C2=A0# extra tests with DEBUG_INFO
>> =C2=A0git bisect good 1019a359d3dc4b64d0e1e5a5efcb725d5e83994d =C2=A0# 0=
6:11 =C2=A0=C2=A0=C2=A0900+ =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00 =C2=A0sched/dea=
dline: Fix stale yield state
>> =C2=A0# extra tests on HEAD of linux-devel/devel-xian-smoke-201502152116
>> =C2=A0git bisect =C2=A0bad 58e0e18cb8b1c3351cb70b3cf78d4e3785a181fe =C2=
=A0# 06:11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A04=
 =C2=A00day head guard for 'devel-xian-smoke-201502152116'
>> =C2=A0# extra tests on tree/branch linus/master
>> =C2=A0git bisect =C2=A0bad a9724125ad014decf008d782e60447c811391326 =C2=
=A0# 06:11 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01=
 =C2=A0Merge tag 'tty-3.20-rc1' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/tty
>> =C2=A0# extra tests with first bad commit reverted
>> =C2=A0# extra tests on tree/branch linus/master
>> =C2=A0git bisect =C2=A0bad a9724125ad014decf008d782e60447c811391326 =C2=
=A0# 06:16 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A0=C2=A01=
 =C2=A0Merge tag 'tty-3.20-rc1' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/gregkh/tty
>> =C2=A0# extra tests on tree/branch next/master
>> =C2=A0git bisect =C2=A0bad b8acf73194186a5cba86812eb4ba17b897f0e13e =C2=
=A0# 06:26 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A00- =C2=A0=C2=A0=C2=A0=C2=A035 =C2=
=A0Add linux-next specific files for 20150213
>>
>> =C2=A0This script may reproduce the error.
>>
>> =C2=A0------------------------------------------------------------------=
----------
>> =C2=A0#!/bin/bash
>>
>> =C2=A0kernel=3D$1
>>
>> =C2=A0kvm=3D(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0qemu-system-x86_64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-cpu kvm64
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-enable-kvm
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-kernel $kernel
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-m 320
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-smp 1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net nic,vlan=3D1,=
model=3De1000
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-net user,vlan=3D1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-boot order=3Dnc
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-no-reboot
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-watchdog i6300esb
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-rtc base=3Dlocalt=
ime
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-serial stdio
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-display none
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-monitor null
>> =C2=A0)
>>
>> =C2=A0append=3D(
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hung_task_panic=3D1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0earlyprintk=3DttyS=
0,115200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rd.udev.log-priori=
ty=3Derr
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0systemd.log_target=
=3Djournal
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0systemd.log_level=
=3Dwarning
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0debug
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0apic=3Ddebug
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sysrq_always_enabl=
ed
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rcupdate.rcu_cpu_s=
tall_timeout=3D100
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0panic=3D-1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0softlockup_panic=
=3D1
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0nmi_watchdog=3Dpan=
ic
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0oops=3Dpanic
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0load_ramdisk=3D2
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0prompt_ramdisk=3D0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0console=3DttyS0,11=
5200
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0console=3Dtty0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0vga=3Dnormal
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0root=3D/dev/ram0
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rw
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0drbd.minor_count=
=3D8
>> =C2=A0)
>>
>> =C2=A0"${kvm[@]}" --append "${append[*]}"
>> =C2=A0------------------------------------------------------------------=
----------
>
> Don't we have the following problem?
>
> current->state =3D TASK_INTERRUPTIBLE;
> schedule()
> =C2=A0=C2=A0=C2=A0=C2=A0deactivate_task()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dequeue_task_dl()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u=
pdate_curr_dl()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0start_dl_timer()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0_=
_dequeue_task_dl()
>
> ...timer fires...
>
> dl_task_timer()
> =C2=A0=C2=A0=C2=A0=C2=A0enqueue_task_dl() /* queues on dl_rq */
>
> ...try_to_wake_up()
>
> =C2=A0=C2=A0=C2=A0enqueue_dl_entity()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0BUG_ON(on_dl_rq())
>
> Compile-tested fix:
>
> =C2=A0kernel/sched/deadline.c | 4 ++++
> =C2=A01 file changed, 4 insertions(+)
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index a027799..1b78598 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -541,6 +541,10 @@ static enum hrtimer_restart dl_task_timer(struct hrt=
imer *timer)
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sched_clock_tick();
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0update_rq_clock(rq);
> + if (!p->on_rq) {
> + replenish_dl_entity(dl_se, dl_se);
> + goto unlock;
> + }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0enqueue_task_dl(rq,=
 p, ENQUEUE_REPLENISH);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (dl_task(rq->cur=
r))
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0check_preempt_curr_dl(rq, p, 0);

We shouldn't enqueue migrating tasks. Please, try this one instead ;)

[PATCH] sched/dl: Prevent enqueue of a sleeping task in dl_task_timer()

A deadline task may be throttled and dequeued at the same time.
This happens, when it becomes throttled in schedule(), which
is called to go to sleep:

current->state =3D TASK_INTERRUPTIBLE;
schedule()
    deactivate_task()
        dequeue_task_dl()
            update_curr_dl()
                start_dl_timer()
            __dequeue_task_dl()
    prev->on_rq =3D 0;
    =

Later the timer fires, but the task is still dequeued:
    =

dl_task_timer()
    enqueue_task_dl() /* queues on dl_rq; on_rq remains 0 */

Someone wakes it up:

try_to_wake_up()

    enqueue_dl_entity()
        BUG_ON(on_dl_rq())

Patch fixes this problem, it prevents queueing !on_rq tasks
on dl_rq.

Signed-off-by: Kirill Tkhai <ktkhai@parallels.com>

diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index a027799..784ba68 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -541,6 +541,10 @@ static enum hrtimer_restart dl_task_timer(struct hrtim=
er *timer)
 =

 	sched_clock_tick();
 	update_rq_clock(rq);
+	if (!task_on_rq_queued(p)) {
+		replenish_dl_entity(dl_se, dl_se);
+		goto unlock;
+	}
 	enqueue_task_dl(rq, p, ENQUEUE_REPLENISH);
 	if (dl_task(rq->curr))
 		check_preempt_curr_dl(rq, p, 0);

--===============5747286586074424416==--

