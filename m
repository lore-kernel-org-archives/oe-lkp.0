Content-Type: multipart/mixed; boundary="===============3241051529598865369=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 14:57:01 +0900
Message-ID: <20171010055701.GE3323@X58A-UD3R>
In-Reply-To: <20171004083430.kajx4yvppalb7lgz@hirez.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3241051529598865369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2017 at 10:34:30AM +0200, Peter Zijlstra wrote:
> Right, and print_circular_bug() uses @trace before it ever can be set,
> although I suspect the intention is that that only ever gets called from
> commit_xhlock() where we pass in an initialized @trace. A comment
> would've been good :/
> =

> So the whole point of that trace wankery here is to not do save_trace()
> when we'll not in fact use the stack trace.
> =

> It seems to me we can do that much saner by actually initializing our
> @trace buffer and testing if it contains an actual stacktrace.
> =

> Also killed that verbose thing, because dropping that graph_lock thing
> hurts my brain -- although I think it should work.
> =

> Does this make the corruption thing go away?

The commit ae813308f(locking/lockdep: Avoid creating redundant links)
seems to introduce the bug.

But as you may think, another commit ce07a9415(locking/lockdep: Make
check_prev_add() able to handle external stack_trace) is also fragile.

So I like your following patch which makes code robust.

Acked-by: byungchul.park(a)lge.com

> ---
>  kernel/locking/lockdep.c | 48 ++++++++++++++++++++----------------------=
------
>  1 file changed, 20 insertions(+), 28 deletions(-)
> =

> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 44c8d0d17170..e36e652d996f 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -1873,10 +1873,10 @@ check_prev_add(struct task_struct *curr, struct h=
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
> @@ -1890,8 +1890,17 @@ check_prev_add(struct task_struct *curr, struct he=
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
>  		return print_circular_bug(&this, target_entry, next, prev, trace);
> +	}
>  	else if (unlikely(ret < 0))
>  		return print_bfs_bug(ret);
>  =

> @@ -1938,7 +1947,7 @@ check_prev_add(struct task_struct *curr, struct hel=
d_lock *prev,
>  		return print_bfs_bug(ret);
>  =

>  =

> -	if (save && !save(trace))
> +	if (!trace->entries && !save(trace))
>  		return 0;
>  =

>  	/*
> @@ -1958,20 +1967,6 @@ check_prev_add(struct task_struct *curr, struct he=
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

> @@ -1986,8 +1981,12 @@ check_prevs_add(struct task_struct *curr, struct h=
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
> @@ -2018,17 +2017,10 @@ check_prevs_add(struct task_struct *curr, struct =
held_lock *next)
>  			 */
>  			if (hlock->read !=3D 2 && hlock->check) {
>  				int ret =3D check_prev_add(curr, hlock, next,
> -							 distance, &trace, save);
> +							 distance, &trace, save_trace);
>  				if (!ret)
>  					return 0;
>  =

> -				/*
> -				 * Stop saving stack_trace if save_trace() was
> -				 * called at least once:
> -				 */
> -				if (save && ret =3D=3D 2)
> -					save =3D NULL;
> -
>  				/*
>  				 * Stop after the first non-trylock entry,
>  				 * as non-trylock entries have added their

--===============3241051529598865369==--

