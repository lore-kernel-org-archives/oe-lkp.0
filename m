Content-Type: multipart/mixed; boundary="===============5015127810337008018=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 12:50:55 +0200
Message-ID: <20171009105055.7vfk2ncolyouzunb@hirez.programming.kicks-ass.net>
In-Reply-To: <20171005145414.4bbcr3jornabes7c@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============5015127810337008018==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Fengguang, if you're still listening, could you please rerun the tests
> on top of ce07a9415f26, with the attached patches also applied?

Ping!? it would be very good to get feedback on this asap.

> From e7840ad76515f0b5061fcdd098b57b7c01b61482 Mon Sep 17 00:00:00 2001
> Message-Id: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.git.jpoi=
mboe@redhat.com>
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Date: Thu, 5 Oct 2017 09:43:59 -0500
> Subject: [PATCH 1/2] unwinder fixes
> =

> ---
>  arch/x86/kernel/unwind_frame.c | 33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/x86/kernel/unwind_frame.c b/arch/x86/kernel/unwind_fram=
e.c
> index b9389d72b2f7..0ecc42e34cc4 100644
> --- a/arch/x86/kernel/unwind_frame.c
> +++ b/arch/x86/kernel/unwind_frame.c
> @@ -33,7 +33,7 @@ static void unwind_dump(struct unwind_state *state)
>  	struct stack_info stack_info =3D {0};
>  	unsigned long visit_mask =3D 0;
>  =

> -	if (dumped_before)
> +	if (IS_ENABLED(CONFIG_X86_32) || dumped_before)
>  		return;
>  =

>  	dumped_before =3D true;
> @@ -42,7 +42,8 @@ static void unwind_dump(struct unwind_state *state)
>  			state->stack_info.type, state->stack_info.next_sp,
>  			state->stack_mask, state->graph_idx);
>  =

> -	for (sp =3D state->orig_sp; sp; sp =3D PTR_ALIGN(stack_info.next_sp, si=
zeof(long))) {
> +	for (sp =3D PTR_ALIGN(state->orig_sp, sizeof(long)); sp;
> +	     sp =3D PTR_ALIGN(stack_info.next_sp, sizeof(long))) {
>  		if (get_stack_info(sp, state->task, &stack_info, &visit_mask))
>  			break;
>  =

> @@ -84,6 +85,12 @@ static size_t regs_size(struct pt_regs *regs)
>  	return sizeof(*regs);
>  }
>  =

> +#ifdef CONFIG_X86_32
> +#define KERNEL_REGS_SIZE (sizeof(struct pt_regs) - 2*sizeof(long))
> +#else
> +#define KERNEL_REGS_SIZE (sizeof(struct pt_regs))
> +#endif
> +
>  static bool in_entry_code(unsigned long ip)
>  {
>  	char *addr =3D (char *)ip;
> @@ -183,6 +190,7 @@ static bool is_last_task_frame(struct unwind_state *s=
tate)
>   * This determines if the frame pointer actually contains an encoded poi=
nter to
>   * pt_regs on the stack.  See ENCODE_FRAME_POINTER.
>   */
> +#ifdef CONFIG_X86_64
>  static struct pt_regs *decode_frame_pointer(unsigned long *bp)
>  {
>  	unsigned long regs =3D (unsigned long)bp;
> @@ -192,6 +200,17 @@ static struct pt_regs *decode_frame_pointer(unsigned=
 long *bp)
>  =

>  	return (struct pt_regs *)(regs & ~0x1);
>  }
> +#else
> +static struct pt_regs *decode_frame_pointer(unsigned long *bp)
> +{
> +	unsigned long regs =3D (unsigned long)bp;
> +
> +	if (regs & 0x80000000)
> +		return NULL;
> +
> +	return (struct pt_regs *)(regs | 0x80000000);
> +}
> +#endif
>  =

>  static bool update_stack_state(struct unwind_state *state,
>  			       unsigned long *next_bp)
> @@ -211,7 +230,7 @@ static bool update_stack_state(struct unwind_state *s=
tate,
>  	regs =3D decode_frame_pointer(next_bp);
>  	if (regs) {
>  		frame =3D (unsigned long *)regs;
> -		len =3D regs_size(regs);
> +		len =3D KERNEL_REGS_SIZE;
>  		state->got_irq =3D true;
>  	} else {
>  		frame =3D next_bp;
> @@ -235,6 +254,14 @@ static bool update_stack_state(struct unwind_state *=
state,
>  	    frame < prev_frame_end)
>  		return false;
>  =

> +	/*
> +	 * On 32-bit with user mode regs, make sure the last two regs are safe
> +	 * to access:
> +	 */
> +	if (IS_ENABLED(CONFIG_X86_32) && regs && user_mode(regs) &&
> +	    !on_stack(info, frame, len + 2*sizeof(long)))
> +		return false;
> +
>  	/* Move state to the next frame: */
>  	if (regs) {
>  		state->regs =3D regs;
> -- =

> 2.13.6
> =


> From 62105550632bfbd2e5e2f3768a37958a6872ec1e Mon Sep 17 00:00:00 2001
> Message-Id: <62105550632bfbd2e5e2f3768a37958a6872ec1e.1507215196.git.jpoi=
mboe@redhat.com>
> In-Reply-To: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.git.jpo=
imboe@redhat.com>
> References: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.git.jpoi=
mboe@redhat.com>
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Thu, 5 Oct 2017 09:44:33 -0500
> Subject: [PATCH 2/2] lockdep fixes
> =

> ---
>  kernel/locking/lockdep.c | 48 ++++++++++++++++++++----------------------=
------
>  1 file changed, 20 insertions(+), 28 deletions(-)
> =

> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 841828ba35b9..6d540bdb24b3 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -1827,10 +1827,10 @@ check_prev_add(struct task_struct *curr, struct h=
eld_lock *prev,
>  	       struct held_lock *next, int distance, struct stack_trace *trace,
>  	       int (*save)(struct stack_trace *trace))
>  {
> +	struct lock_list *uninitialized_var(target_entry);
>  	struct lock_list *entry;
> -	int ret;
>  	struct lock_list this;
> -	struct lock_list *uninitialized_var(target_entry);
> +	int ret;
>  =

>  	/*
>  	 * Prove that the new <prev> -> <next> dependency would not
> @@ -1844,8 +1844,17 @@ check_prev_add(struct task_struct *curr, struct he=
ld_lock *prev,
>  	this.class =3D hlock_class(next);
>  	this.parent =3D NULL;
>  	ret =3D check_noncircular(&this, hlock_class(prev), &target_entry);
> -	if (unlikely(!ret))
> +	if (unlikely(!ret)) {
> +		if (!trace->entries) {
> +			/*
> +			 * If @save fails here, the printing might trigger
> +			 * a WARN but because of the !nr_entries it should
> +			 * not do bad things.
> +			 */
> +			save(trace);
> +		}
>  		return print_circular_bug(&this, target_entry, next, prev);
> +	}
>  	else if (unlikely(ret < 0))
>  		return print_bfs_bug(ret);
>  =

> @@ -1892,7 +1901,7 @@ check_prev_add(struct task_struct *curr, struct hel=
d_lock *prev,
>  		return print_bfs_bug(ret);
>  =

>  =

> -	if (save && !save(trace))
> +	if (!trace->entries && !save(trace))
>  		return 0;
>  =

>  	/*
> @@ -1912,20 +1921,6 @@ check_prev_add(struct task_struct *curr, struct he=
ld_lock *prev,
>  	if (!ret)
>  		return 0;
>  =

> -	/*
> -	 * Debugging printouts:
> -	 */
> -	if (verbose(hlock_class(prev)) || verbose(hlock_class(next))) {
> -		graph_unlock();
> -		printk("\n new dependency: ");
> -		print_lock_name(hlock_class(prev));
> -		printk(KERN_CONT " =3D> ");
> -		print_lock_name(hlock_class(next));
> -		printk(KERN_CONT "\n");
> -		dump_stack();
> -		if (!graph_lock())
> -			return 0;
> -	}
>  	return 2;
>  }
>  =

> @@ -1940,8 +1935,12 @@ check_prevs_add(struct task_struct *curr, struct h=
eld_lock *next)
>  {
>  	int depth =3D curr->lockdep_depth;
>  	struct held_lock *hlock;
> -	struct stack_trace trace;
> -	int (*save)(struct stack_trace *trace) =3D save_trace;
> +	struct stack_trace trace =3D {
> +		.nr_entries =3D 0,
> +		.max_entries =3D 0,
> +		.entries =3D NULL,
> +		.skip =3D 0,
> +	};
>  =

>  	/*
>  	 * Debugging checks.
> @@ -1967,18 +1966,11 @@ check_prevs_add(struct task_struct *curr, struct =
held_lock *next)
>  		 */
>  		if (hlock->read !=3D 2 && hlock->check) {
>  			int ret =3D check_prev_add(curr, hlock, next,
> -						distance, &trace, save);
> +						distance, &trace, save_trace);
>  			if (!ret)
>  				return 0;
>  =

>  			/*
> -			 * Stop saving stack_trace if save_trace() was
> -			 * called at least once:
> -			 */
> -			if (save && ret =3D=3D 2)
> -				save =3D NULL;
> -
> -			/*
>  			 * Stop after the first non-trylock entry,
>  			 * as non-trylock entries have added their
>  			 * own direct dependencies already, so this
> -- =

> 2.13.6
> =



--===============5015127810337008018==--

