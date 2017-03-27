Content-Type: multipart/mixed; boundary="===============4833646984949967019=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [x86/mm/gup] 2947ba054a [ 71.329069] kernel BUG at include/linux/pagemap.h:151!
Date: Mon, 27 Mar 2017 18:30:50 +0300
Message-ID: <20170327153050.43xobvj3ycbueaof@node.shutemov.name>
In-Reply-To: <20170324114709.pcytvyb3d6ajux33@black.fi.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4833646984949967019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2017 at 02:47:09PM +0300, Kirill A. Shutemov wrote:
> =

> From d2f416a3ee3e5dbb10e59d0b374d382fdc4ba082 Mon Sep 17 00:00:00 2001
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Date: Fri, 24 Mar 2017 14:13:05 +0300
> Subject: [PATCH] mm: Fix false-positive VM_BUG_ON() in
>  page_cache_{get,add}_speculative
> =

> 0day triggered this:
> =

>   kernel BUG at include/linux/pagemap.h:151!
>   invalid opcode: 0000 [#1]
>   CPU: 0 PID: 458 Comm: trinity-c0 Not tainted 4.11.0-rc2-00251-g2947ba0 =
#1
>   task: ffff88001f19ab00 task.stack: ffff88001f084000
>   RIP: 0010:gup_pud_range+0x56f/0x63d
>   RSP: 0018:ffff88001f087ba8 EFLAGS: 00010046
>   RAX: 0000000080000000 RBX: 000000000164e000 RCX: ffff88001e0badc0
>   RDX: dead000000000100 RSI: 0000000000000001 RDI: ffff88001e0badc0
>   RBP: ffff88001f087c38 R08: ffff88001f087cf8 R09: ffff88001f087c6c
>   R10: 0000000000000000 R11: ffff88001f19b0f0 R12: ffff88001f087c6c
>   R13: ffff88001e0badc0 R14: 800000001e7b7867 R15: 0000000000000000
>   FS:  00007f7ea7b60700(0000) GS:ffffffffae02f000(0000) knlGS:00000000000=
00000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 00000000013eb130 CR3: 0000000017ddb000 CR4: 00000000000006f0
>   DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>   DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 00000000000d0602
>   Call Trace:
>    __get_user_pages_fast+0x107/0x136
>    get_user_pages_fast+0x78/0x89
>    get_futex_key+0xfd/0x350
>    ? simple_write_end+0x83/0xbe
>    futex_requeue+0x1a3/0x585
>    do_futex+0x834/0x86f
>    ? kvm_clock_read+0x16/0x1e
>    ? paravirt_sched_clock+0x9/0xd
>    ? lock_release+0x11e/0x328
>    SyS_futex+0x125/0x135
>    ? write_seqcount_end+0x1a/0x1f
>    ? vtime_account_user+0x4b/0x50
>    do_syscall_64+0x61/0x74
>    entry_SYSCALL64_slow_path+0x25/0x25
> =

> It' VM_BUG_ON() due to false-negative in_atomic(). We call
> page_cache_get_speculative() with disabled local interrupts.
> It should be atomic enough.
> =

> Let's check for disabled interrupts in the VM_BUG_ON() too.
> =

> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>

Ingo, could you get it applied along x86-gup transition?

Or do you see any problem with the patch?

> ---
>  include/linux/pagemap.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> index f84cf5f76366..e7bbd9d4dc6c 100644
> --- a/include/linux/pagemap.h
> +++ b/include/linux/pagemap.h
> @@ -148,7 +148,7 @@ static inline int page_cache_get_speculative(struct p=
age *page)
>  =

>  #ifdef CONFIG_TINY_RCU
>  # ifdef CONFIG_PREEMPT_COUNT
> -	VM_BUG_ON(!in_atomic());
> +	VM_BUG_ON(!in_atomic() && !irqs_disabled());
>  # endif
>  	/*
>  	 * Preempt must be disabled here - we rely on rcu_read_lock doing
> @@ -186,7 +186,7 @@ static inline int page_cache_add_speculative(struct p=
age *page, int count)
>  =

>  #if !defined(CONFIG_SMP) && defined(CONFIG_TREE_RCU)
>  # ifdef CONFIG_PREEMPT_COUNT
> -	VM_BUG_ON(!in_atomic());
> +	VM_BUG_ON(!in_atomic() && !irqs_disabled());
>  # endif
>  	VM_BUG_ON_PAGE(page_count(page) =3D=3D 0, page);
>  	page_ref_add(page, count);
-- =

 Kirill A. Shutemov

--===============4833646984949967019==--

