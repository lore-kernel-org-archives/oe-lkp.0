Content-Type: multipart/mixed; boundary="===============0177680622157428969=="
MIME-Version: 1.0
From: Dmitry Vyukov <dvyukov@google.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm/kasan] d17a1d97dc: WARNING:at_lib/stackdepot.c:#depot_save_stack
Date: Mon, 27 Nov 2017 15:38:04 +0100
Message-ID: <CACT4Y+bt=A0Aj7evzNWaJHFoubJwEdH4Sh1iACKe5mvJTyq4ew@mail.gmail.com>
In-Reply-To: <3eec267c-4475-ac78-0c74-d82d42d9ea7a@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0177680622157428969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 27, 2017 at 3:27 PM, Andrey Ryabinin
<aryabinin@virtuozzo.com> wrote:
> On 11/26/2017 10:58 AM, kernel test robot wrote:
>>
>> FYI, we noticed the following commit (built with gcc-7):
>>
>> commit: d17a1d97dc208d664c91cc387ffb752c7f85dc61 ("x86/mm/kasan: don't u=
se vmemmap_populate() to initialize shadow")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>
> That commit isn't related to the bug. Bisection pointed to this commit on=
ly because .config has a
> SPARSEMEM_VMEMMAP=3Dn and KASAN=3Dy. That combination wasn't possible bef=
ore d17a1d97dc208.
>
> I think, the real problem is that stackdepot doesn't work very well with =
CONFIG_UNWINDER_GUESS=3Dy.
> The 'guess' unwinder seems generate awfully large and inaccurate stacktra=
ces, so stackdepot
> can't deduplicate stacktraces well and reaches the capacity limit very fa=
st.
>
> Maybe we should just forbid setting CONFIG_UNWINDER_GUESS if we have CONF=
IG_STACKDEPOT=3Dy ?

Sounds good to me.


>> [  177.837316] WARNING: CPU: 0 PID: 545 at lib/stackdepot.c:119 depot_sa=
ve_stack+0x28e/0x550
>> [  177.837987] CPU: 0 PID: 545 Comm: trinity-main Not tainted 4.14.0-043=
19-gd17a1d9 #30
>> [  177.838518] task: ffff88000cd80000 task.stack: ffff88000b4f8000
>> [  177.838933] RIP: 0010:depot_save_stack+0x28e/0x550
>> [  177.839268] RSP: 0018:ffff88000b4fec18 EFLAGS: 00010086
>> [  177.839632] RAX: 0000000000000022 RBX: 000000006bdd725e RCX: ffffffff=
a014cf41
>> [  177.840127] RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 00000000=
00000000
>> [  177.840619] RBP: 0000000000000000 R08: 0000000000000001 R09: 00000000=
00000001
>> [  177.841117] R10: 0000000032ae8775 R11: 6f706564206b6361 R12: 00000000=
00000040
>> [  177.841609] R13: 0000000000000040 R14: 00000000000d725e R15: 00000000=
00000220
>> [  177.842104] FS:  000000000104a880(0000) GS:ffffffffa2ca4000(0000) knl=
GS:0000000000000000
>> [  177.842663] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  177.843061] CR2: 00007f3301646000 CR3: 000000000b1c2000 CR4: 00000000=
000006b0
>> [  177.843553] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000=
00000000
>> [  177.844046] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 00000000=
00000400
>> [  177.844535] Call Trace:
>> [  177.844721]  ? kasan_kmalloc+0x144/0x160
>> [  177.844999]  ? depot_save_stack+0x1f5/0x550
>> [  177.845295]  ? do_raw_spin_unlock+0xda/0xf0
>> [  177.845590]  ? preempt_count_sub+0x13/0xc0
>> [  177.845887]  ? _raw_spin_unlock_irqrestore+0x52/0x70
>> [  177.846236]  ? depot_save_stack+0x3b8/0x550
>> [  177.846533]  ? kasan_kmalloc+0x144/0x160
>> [  177.846816]  ? do_raw_spin_unlock+0xda/0xf0
>> [  177.847113]  ? preempt_count_sub+0x13/0xc0
>> [  177.847404]  ? _raw_spin_unlock+0x29/0x40
>> [  177.847693]  ? get_partial_node+0x2ca/0x300
>> [  177.848031]  ? preempt_count_sub+0x13/0xc0
>> [  177.848321]  ? __might_sleep+0x2e/0xd0
>> [  177.848591]  ? perf_output_begin_backward+0x840/0x840
>> [  177.848952]  ? __vm_enough_memory+0x333/0x390
>> [  177.849260]  ? preempt_count_sub+0x13/0xc0
>> [  177.849551]  ? in_sched_functions+0x30/0x30
>> [  177.849851]  ? preempt_count_sub+0x13/0xc0
>> [  177.850142]  ? __vm_enough_memory+0x333/0x390
>> [  177.850453]  ? debug_lockdep_rcu_enabled+0x27/0x60
>> [  177.850794]  ? in_sched_functions+0x30/0x30
>> [  177.851090]  ? debug_lockdep_rcu_enabled+0x27/0x60
>> [  177.851425]  ? in_sched_functions+0x30/0x30
>> [  177.851724]  ? fs_reclaim_acquire+0xd/0x30
>> [  177.852013]  ? debug_lockdep_rcu_enabled+0x27/0x60
>> [  177.852348]  ? in_sched_functions+0x30/0x30
>> [  177.852642]  ? fs_reclaim_acquire+0xd/0x30
>> [  177.852936]  ? ___slab_alloc+0x2f9/0x330
>> [  177.853334]  ? debug_lockdep_rcu_enabled+0x27/0x60
>> [  177.853673]  ? ___slab_alloc+0x2f9/0x330
>> [  177.854070]  ? preempt_count_add+0xa6/0xc0
>> [  177.854358]  ? preempt_count_sub+0x13/0xc0
>> [  177.854647]  ? __vm_enough_memory+0x333/0x390
>> [  177.854956]  ? vm_memory_committed+0x10/0x10
>> [  177.855257]  ? __cleanup_sighand+0x30/0x30
>> [  177.855545]  ? rb_erase_cached+0x43a/0x1230
>> [  177.855845]  ? debug_show_all_locks+0x2c0/0x2c0
>> [  177.856176]  ? rb_next+0x80/0x80
>> [  177.856409]  ? __need_fs_reclaim+0x2d/0x80
>> [  177.856704]  ? kmem_cache_alloc+0xd4/0xf0
>> [  177.856991]  ? anon_vma_clone+0x6e/0x280
>> [  177.857271]  ? anon_vma_fork+0xb9/0x2f0
>> [  177.857545]  ? rcu_segcblist_enqueue+0xe7/0x130
>> [  177.857868]  ? rcu_segcblist_first_pend_cb+0x40/0x40
>> [  177.858217]  ? anon_vma_clone+0x280/0x280
>> [  177.858503]  ? __rcu_read_lock+0x20/0x20
>> [  177.858787]  ? trace_hardirqs_on_caller+0x11/0x260
>> [  177.859125]  ? lock_downgrade+0x300/0x300
>> [  177.859409]  ? lock_acquire+0x99/0xd0
>> [  177.859674]  ? perf_event_task_disable+0xe0/0xe0
>> [  177.860000]  ? copy_process+0x209c/0x3b60
>> [  177.860285]  ? __cleanup_sighand+0x30/0x30
>> [  177.860576]  ? perf_output_begin_backward+0x840/0x840
>> [  177.860932]  ? rb_erase_cached+0x43a/0x1230
>> [  177.861228]  ? debug_show_all_locks+0x2c0/0x2c0
>> [  177.861545]  ? rb_next+0x80/0x80
>> [  177.861780]  ? lock_downgrade+0x300/0x300
>> [  177.862066]  ? debug_object_active_state+0xdb/0x280
>> [  177.862409]  ? do_raw_spin_unlock+0xda/0xf0
>> [  177.862708]  ? preempt_count_sub+0x13/0xc0
>> [  177.862998]  ? _raw_spin_unlock_irqrestore+0x52/0x70
>> [  177.863345]  ? debug_object_active_state+0x23a/0x280
>> [  177.863695]  ? debug_object_assert_init+0x290/0x290
>> [  177.864037]  ? path_check_mount+0x130/0x130
>> [  177.864332]  ? rcu_segcblist_enqueue+0xe7/0x130
>> [  177.864651]  ? kmem_cache_alloc+0xd4/0xf0
>> [  177.864940]  ? anon_vma_clone+0x6e/0x280
>> [  177.865217]  ? anon_vma_fork+0xb9/0x2f0
>> [  177.865489]  ? rcu_segcblist_enqueue+0xe7/0x130
>> [  177.865812]  ? rcu_segcblist_first_pend_cb+0x40/0x40
>> [  177.866159]  ? anon_vma_clone+0x280/0x280
>> [  177.866442]  ? __rcu_read_lock+0x20/0x20
>> [  177.866725]  ? trace_hardirqs_on_caller+0x11/0x260
>> [  177.867060]  ? lock_downgrade+0x300/0x300
>> [  177.867343]  ? lock_acquire+0x99/0xd0
>> [  177.867602]  ? perf_event_task_disable+0xe0/0xe0
>> [  177.867932]  ? copy_process+0x209c/0x3b60
>> [  177.868218]  ? __cleanup_sighand+0x30/0x30
>> [  177.868509]  ? perf_output_begin_backward+0x840/0x840
>> [  177.868868]  ? rb_erase_cached+0x43a/0x1230
>> [  177.869165]  ? debug_show_all_locks+0x2c0/0x2c0
>> [  177.869484]  ? rb_next+0x80/0x80
>> [  177.869720]  ? lock_downgrade+0x300/0x300
>> [  177.870003]  ? debug_object_active_state+0xdb/0x280
>> [  177.870350]  ? do_raw_spin_unlock+0xda/0xf0
>>
>>
>> To reproduce:
>>
>>         git clone https://github.com/intel/lkp-tests.git
>>         cd lkp-tests
>>         bin/lkp qemu -k <bzImage> job-script  # job-script is attached i=
n this email
>>
>>
>>
>> Thanks,
>> Xiaolong
>>

--===============0177680622157428969==--

