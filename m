Content-Type: multipart/mixed; boundary="===============4057606592711647019=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 10:34:30 +0200
Message-ID: <20171004083430.kajx4yvppalb7lgz@hirez.programming.kicks-ass.net>
In-Reply-To: <20171003150538.57dq7xe6afikpzyp@treble>
List-Id: <oe-lkp.lists.linux.dev>

--===============4057606592711647019==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 10:05:38AM -0500, Josh Poimboeuf wrote:
> I don't know the lockdep code, but one more comment from the peanut
> gallery.  This code looks suspect to me:
> =

> =

> 			/*
> 			 * Stop saving stack_trace if save_trace() was
> 			 * called at least once:
> 			 */
> 			if (save && ret =3D=3D 2)
> 				save =3D NULL;
> =

> =

> From looking at check_prev_add(), a return value of 2 doesn't
> necessarily imply that save_trace() was called.  If the
> check_redundant() call returns 0, then check_prev_add() can return 2,
> and the trace will still be uninitialized, but save will be set to NULL
> even though save_trace() hasn't been called.  Then a subsequent call to
> check_prev_add() could add an uninitialized stack_trace struct to the
> dependency list.

Right, and print_circular_bug() uses @trace before it ever can be set,
although I suspect the intention is that that only ever gets called from
commit_xhlock() where we pass in an initialized @trace. A comment
would've been good :/

So the whole point of that trace wankery here is to not do save_trace()
when we'll not in fact use the stack trace.

It seems to me we can do that much saner by actually initializing our
@trace buffer and testing if it contains an actual stacktrace.

Also killed that verbose thing, because dropping that graph_lock thing
hurts my brain -- although I think it should work.

Does this make the corruption thing go away?

---
 kernel/locking/lockdep.c | 48 ++++++++++++++++++++------------------------=
----
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 44c8d0d17170..e36e652d996f 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -1873,10 +1873,10 @@ check_prev_add(struct task_struct *curr, struct hel=
d_lock *prev,
 	       struct held_lock *next, int distance, struct stack_trace *trace,
 	       int (*save)(struct stack_trace *trace))
 {
+	struct lock_list *uninitialized_var(target_entry);
 	struct lock_list *entry;
-	int ret;
 	struct lock_list this;
-	struct lock_list *uninitialized_var(target_entry);
+	int ret;
 =

 	/*
 	 * Prove that the new <prev> -> <next> dependency would not
@@ -1890,8 +1890,17 @@ check_prev_add(struct task_struct *curr, struct held=
_lock *prev,
 	this.class =3D hlock_class(next);
 	this.parent =3D NULL;
 	ret =3D check_noncircular(&this, hlock_class(prev), &target_entry);
-	if (unlikely(!ret))
+	if (unlikely(!ret)) {
+		if (!trace->entries) {
+			/*
+			 * If @save fails here, the printing might trigger
+			 * a WARN but because of the !nr_entries it should
+			 * not do bad things.
+			 */
+			save(trace);
+		}
 		return print_circular_bug(&this, target_entry, next, prev, trace);
+	}
 	else if (unlikely(ret < 0))
 		return print_bfs_bug(ret);
 =

@@ -1938,7 +1947,7 @@ check_prev_add(struct task_struct *curr, struct held_=
lock *prev,
 		return print_bfs_bug(ret);
 =

 =

-	if (save && !save(trace))
+	if (!trace->entries && !save(trace))
 		return 0;
 =

 	/*
@@ -1958,20 +1967,6 @@ check_prev_add(struct task_struct *curr, struct held=
_lock *prev,
 	if (!ret)
 		return 0;
 =

-	/*
-	 * Debugging printouts:
-	 */
-	if (verbose(hlock_class(prev)) || verbose(hlock_class(next))) {
-		graph_unlock();
-		printk("\n new dependency: ");
-		print_lock_name(hlock_class(prev));
-		printk(KERN_CONT " =3D> ");
-		print_lock_name(hlock_class(next));
-		printk(KERN_CONT "\n");
-		dump_stack();
-		if (!graph_lock())
-			return 0;
-	}
 	return 2;
 }
 =

@@ -1986,8 +1981,12 @@ check_prevs_add(struct task_struct *curr, struct hel=
d_lock *next)
 {
 	int depth =3D curr->lockdep_depth;
 	struct held_lock *hlock;
-	struct stack_trace trace;
-	int (*save)(struct stack_trace *trace) =3D save_trace;
+	struct stack_trace trace =3D {
+		.nr_entries =3D 0,
+		.max_entries =3D 0,
+		.entries =3D NULL,
+		.skip =3D 0,
+	};
 =

 	/*
 	 * Debugging checks.
@@ -2018,17 +2017,10 @@ check_prevs_add(struct task_struct *curr, struct he=
ld_lock *next)
 			 */
 			if (hlock->read !=3D 2 && hlock->check) {
 				int ret =3D check_prev_add(curr, hlock, next,
-							 distance, &trace, save);
+							 distance, &trace, save_trace);
 				if (!ret)
 					return 0;
 =

-				/*
-				 * Stop saving stack_trace if save_trace() was
-				 * called at least once:
-				 */
-				if (save && ret =3D=3D 2)
-					save =3D NULL;
-
 				/*
 				 * Stop after the first non-trylock entry,
 				 * as non-trylock entries have added their

--===============4057606592711647019==--

