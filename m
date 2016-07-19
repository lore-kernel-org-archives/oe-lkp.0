Content-Type: multipart/mixed; boundary="===============4757082721917781375=="
MIME-Version: 1.0
From: Minchan Kim <minchan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] fc80cee1c5: EIP is at show_free_areas+0x496/0xe69
Date: Tue, 19 Jul 2016 12:13:53 +0900
Message-ID: <20160719031353.GA17713@bbox>
In-Reply-To: <20160719022006.GC13203@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4757082721917781375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 10:20:06AM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/mel/linux.git mm-vmscan-n=
ode-lru-follow-up-v2r1
> commit fc80cee1c58837ff9c6e8aa4bbee480b337cb47a ("mm: show node_pages_sca=
nned per node, not zone")
> =

> in testcase: boot
> =

> on test machine: 1 threads qemu-system-i386 -enable-kvm with 192M memory
> =

> caused below changes:
> =

> =

> BUG: unable to handle kernel NULL pointer dereference at 00000020        =
       =

> IP: [<411da4cf>] show_free_areas+0x496/0xe69                             =
       =

> *pdpt =3D 000000000ba70001 *pde =3D 0000000000000000                     =
           =

> Oops: 0000 [#1] PREEMPT SMP                                              =
       =

> Modules linked in:                                                       =
       =

> CPU: 0 PID: 10415 Comm: trinity-c0 Not tainted 4.7.0-rc7-mm1-00362-gfc80c=
ee #1  =

> task: 4bb54140 ti: 4ba3e000 task.ti: 4ba3e000                            =
       =

> EIP: 0060:[<411da4cf>] EFLAGS: 00010216 CPU: 0                           =
       =

> EIP is at show_free_areas+0x496/0xe69                                    =
       =

> EAX: 41cfbb8f EBX: 4ad4e000 ECX: 410abdfe EDX: 00000007                  =
       =

> ESI: 00000000 EDI: 41cec5a9 EBP: 4ba3f9d4 ESP: 4ba3f944                  =
       =

>  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068                            =
       =

> CR0: 80050033 CR2: 00000020 CR3: 0a3b1740 CR4: 000006b0                  =
       =

> Stack:                                                                   =
       =

>  4ba3f954 00000027 00000001 00000000 000007b0 00000000 0000003e 00002932 =
       =

>  00002673 000005ee 00000fd2 00000000 00000000 00000000 0000514a 00000000 =
       =

>  4ba3f9a8 410ee219 00000000 00ab44b5 00000246 00000000 410ee34e 00000000 =
       =

> Call Trace:                                                              =
       =

>  [<410ee219>] ? vprintk_emit+0x4c0/0x4ca                                 =
       =

>  [<410ee34e>] ? devkmsg_write+0x113/0x113                                =
       =

>  [<410ee35f>] ? vprintk_default+0x11/0x13                                =
       =

>  [<4159aef8>] show_mem+0x1c/0x162                                        =
       =

>  [<41268e8c>] ? dump_header+0x8c/0x413                                   =
       =

>  [<41268ed5>] dump_header+0xd5/0x413                                     =
       =

>  [<410abdfe>] ? preempt_count_sub+0x84/0xa3                              =
       =

>  [<41ab3dac>] ? _raw_spin_unlock_irqrestore+0x4a/0x5d                    =
       =

>  [<41597fc6>] ? ___ratelimit+0x270/0x27a                                 =
       =

>  [<411d171e>] oom_kill_process+0x66/0x57f                                =
       =

>  [<411d06ba>] ? rcu_read_unlock+0x53/0x6a                                =
       =

>  [<411d2212>] out_of_memory+0x57c/0x5a5                                  =
       =

>  [<411d961f>] __alloc_pages_slowpath+0xca0/0xda1                         =
       =

>  [<411d98eb>] __alloc_pages_nodemask+0x1cb/0x3cf                         =
       =

>  [<4123f34e>] alloc_pages_vma+0xce/0xd7                                  =
       =

>  [<411f055e>] shmem_alloc_page+0x61/0x75                                 =
       =

>  [<410dddec>] ? mark_held_locks+0xd2/0xe5                                =
       =

>  [<411f05e5>] ? i_size_read+0x73/0xf4                                    =
       =

>  [<410de074>] ? trace_hardirqs_on_caller+0x275/0x2aa                     =
       =

>  [<411f46bc>] shmem_getpage_gfp+0x4f2/0xa16                              =
       =

>  [<411f4ecf>] shmem_fault+0x2ef/0x30d                                    =
                                                                           =
                                                                           =
                                                =

>  [<410e0719>] ? lock_release+0x282/0x735                                 =
       =

>  [<4120e588>] __do_fault+0xfe/0x159                                      =
       =

>  [<41215cc7>] handle_mm_fault+0xce0/0xfbb                                =
       =

>  [<41059ef8>] __do_page_fault+0x3ae/0x6ae                                =
       =

>  [<41056433>] ? kvm_async_pf_task_wake+0x16e/0x16e                       =
       =

>  [<4105a3be>] trace_do_page_fault+0x1a7/0x307                            =
       =

>  [<41056433>] ? kvm_async_pf_task_wake+0x16e/0x16e                       =
       =

>  [<41056433>] ? kvm_async_pf_task_wake+0x16e/0x16e                       =
       =

>  [<41056456>] do_async_page_fault+0x23/0x49                              =
       =

>  [<41ab51e2>] error_code+0x42/0x50                                       =
       =

>  [<4106007b>] ? pgd_alloc+0x27d/0x3cb                                    =
       =

>  [<415aef2b>] ? copy_page_to_iter+0x189/0x443                            =
       =

>  [<4122a296>] process_vm_rw_core+0x3d0/0x4e3                             =
       =

>  [<4126c11e>] ? copy_from_user+0x28/0x2d                                 =
       =

>  [<4126f324>] ? rw_copy_check_uvector+0x5b/0x189                         =
       =

>  [<4122a44c>] process_vm_rw+0xa3/0xce                                    =
       =

>  [<41184965>] ? trace_preempt_on+0xa/0x17                                =
       =

>  [<410abdfe>] ? preempt_count_sub+0x84/0xa3                              =
       =

>  [<410db8f1>] ? lock_is_held+0x9b/0xa2                                   =
       =

>  [<41190890>] ? ftrace_syscall_enter+0x1e2/0x1e2                         =
       =

>  [<41102bb8>] ? rcu_read_lock_sched_held+0x50/0x58                       =
       =

>  [<41001b48>] ? syscall_trace_enter+0x2c1/0x3d9                          =
       =

>  [<410e0719>] ? lock_release+0x282/0x735                                 =
       =

>  [<410e03d1>] ? lock_acquire+0x16e/0x234                                 =
       =

>  [<4122a477>] ? process_vm_rw+0xce/0xce                                  =
       =

>  [<4122a493>] SyS_process_vm_readv+0x1c/0x1e                             =
       =

>  [<41002689>] do_fast_syscall_32+0x17f/0x229                             =
       =

>  [<41ab4433>] sysenter_past_esp+0x4c/0x7f                                =
       =

> Code: 84 7c 01 00 00 89 d8 e8 40 f8 00 00 bf 8f c5 ce 41 84 c0 75 05 bf a=
9 c5 ce 41 31 d2 b8 34 11 ee 41 e8 aa 8f 3f 00 ba 07 00 00 00 <a1> 20 00 00=
 00 e8 20 1e 02 00 89 c6 ba 15 00 00 00 89 d8 e8 12
> EIP: [<411da4cf>] show_free_areas+0x496/0xe69 SS:ESP 0068:4ba3f944       =
       =

> CR2: 0000000000000020                                                    =
       =

> ---[ end trace 1dabbaed7530bfe7 ]---                                  =

> =

> =


It's known problem and Andrew already picked it to his tree.
Thanks.

https://lkml.org/lkml/2016/7/16/56


--===============4757082721917781375==--

