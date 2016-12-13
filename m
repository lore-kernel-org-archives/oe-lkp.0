Content-Type: multipart/mixed; boundary="===============1684382330198984554=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm-add-vfree_atomic-fix
Date: Tue, 13 Dec 2016 11:12:54 +0100
Message-ID: <20161213101254.GC10498@dhcp22.suse.cz>
In-Reply-To: <1481553981-3856-1-git-send-email-aryabinin@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1684382330198984554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[CC Andy]

I've noticed the same
http://lkml.kernel.org/r/20161209142820.GA4334(a)dhcp22.suse.cz
and also concluded same as you

On Mon 12-12-16 17:46:21, Andrey Ryabinin wrote:
> DEBUG_PREEMPT complains about using this_cpu_ptr() in preemptible:
> 	BUG: using smp_processor_id() in preemptible [00000000] code: iperf-300s=
-cs-l/277
> 	caller is debug_smp_processor_id+0x17/0x19
> 	CPU: 1 PID: 277 Comm: iperf-300s-cs-l Not tainted 4.9.0-rc8-00140-gcc639=
db #2
> 	 ffffc900003f3cf0 ffffffff8123ae6f 0000000000000001 ffffffff818181da
> 	 ffffc900003f3d20 ffffffff81252f41 0000000000012de0 00000000fffffdff
> 	 ffff880009328f40 ffff88000592c400 ffffc900003f3d30 ffffffff81252f6a
> 	Call Trace:
> 	 [<ffffffff8123ae6f>] dump_stack+0x9a/0xd0
> 	 [<ffffffff81252f41>] check_preemption_disabled+0xdd/0xef
> 	 [<ffffffff81252f6a>] debug_smp_processor_id+0x17/0x19
> 	 [<ffffffff811796df>] __vfree_deferred+0x16/0x4c
> 	 [<ffffffff8117b584>] vfree_atomic+0x22/0x24
> 	 [<ffffffff81094f5d>] free_thread_stack+0xc2/0x106
> 	 [<ffffffff810951be>] put_task_stack+0x4c/0x62
> 	 [<ffffffff81095f81>] copy_process+0x7e0/0x16e8
> 	 [<ffffffff8109702d>] _do_fork+0xbb/0x2d3
> 	 [<ffffffff810465e8>] ? __do_page_fault+0x2e1/0x384
> 	 [<ffffffff8112633f>] ? trace_hardirqs_off_caller+0x12/0x24
> 	 [<ffffffff810972cb>] SyS_clone+0x19/0x1b
> 	 [<ffffffff81003800>] do_syscall_64+0x143/0x173
> 	 [<ffffffff81507289>] entry_SYSCALL64_slow_path+0x25/0x25
> =

> Use raw_cpu_ptr() instead of this_cpu_ptr() to hide this warning.
> It's fine because llist_add() implementation is lock-less, so it works ev=
en
> if we adding to the list of some other cpu. schedule_work() is also preem=
pt-safe.
> =

> Reported-by: kernel test robot <ying.huang@linux.intel.com>
> Signed-off-by: Andrey Ryabinin <aryabinin@virtuozzo.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  mm/vmalloc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 43f0608..d8813963 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -1498,7 +1498,14 @@ static void __vunmap(const void *addr, int dealloc=
ate_pages)
>  =

>  static inline void __vfree_deferred(const void *addr)
>  {
> -	struct vfree_deferred *p =3D this_cpu_ptr(&vfree_deferred);
> +	/*
> +	 * Use raw_cpu_ptr() because this can be called from preemptible
> +	 * context. Preemption is absolutely fine here, because llist_add()
> +	 * implementation is lockless, so it works even if we adding to list
> +	 * of the other cpu.
> +	 * schedule_work() should be fine with this too.
> +	 */
> +	struct vfree_deferred *p =3D raw_cpu_ptr(&vfree_deferred);
>  =

>  	if (llist_add((struct llist_node *)addr, &p->list))
>  		schedule_work(&p->wq);
> -- =

> 2.7.3

-- =

Michal Hocko
SUSE Labs

--===============1684382330198984554==--

