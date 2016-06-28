Content-Type: multipart/mixed; boundary="===============1759337338450684891=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: kthread_stop insanity (Re: [[DEBUG] force] 2642458962: BUG: unable to handle kernel paging request at ffffc90000997f18)
Date: Wed, 29 Jun 2016 00:47:49 +0200
Message-ID: <20160628224748.GA8591@redhat.com>
In-Reply-To: <CA+55aFwiVYfFfTjN5j-C6cwA1z3hkCaq7A+hqaW4dG4Yon4Saw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1759337338450684891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/28, Linus Torvalds wrote:
>
> Then try_get_task_stack(tsk) becomes
>
>      void *try_get_task_stack(struct task_struct *tsk)
>      {
>           void *stack =3D tsk->stack;
>           if (!atomic_inc_not_zero(&tsk->stackref))
>                stack =3D NULL;
>           return stack;
>      }

Yes, and then we can trivilly fix the users of to_live_kthread().
So I'll wait for this change and send the simple fix on top of it.

Otherwise I'll send another ugly hack (see below).

Oleg.
---

diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index e691b6a..7667bc62 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -37,6 +37,7 @@ struct task_struct *kthread_create_on_cpu(int (*threadfn)=
(void *data),
 	__k;								   \
 })
 =

+void set_kthread_struct(void *kthread);
 void kthread_bind(struct task_struct *k, unsigned int cpu);
 void kthread_bind_mask(struct task_struct *k, const struct cpumask *mask);
 int kthread_stop(struct task_struct *k);
diff --git a/kernel/fork.c b/kernel/fork.c
index 97122f9..8643248 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -326,6 +326,23 @@ void release_task_stack(struct task_struct *tsk)
 #endif
 }
 =

+void set_kthread_struct(void *kthread)
+{
+	/*
+	 * This is the ugly but simple hack we will hopefully remove soon.
+	 * We abuse ->set_child_tid to avoid the new member and because it
+	 * can't be wrongly copied by copy_process(). We also rely on fact
+	 * that the caller can't exec, so PF_KTHREAD can't be cleared.
+	 */
+	current->set_child_tid =3D (__force void __user *)kthread;
+}
+
+static void free_kthread_struct(struct task_struct *tsk)
+{
+	if (tsk->flags & PF_KTHREAD)
+		kfree((__force void *)tsk->set_child_tid); /* can be NULL */
+}
+
 void free_task(struct task_struct *tsk)
 {
 #ifndef CONFIG_THREAD_INFO_IN_TASK
@@ -345,6 +362,7 @@ void free_task(struct task_struct *tsk)
 	ftrace_graph_exit_task(tsk);
 	put_seccomp_filter(tsk);
 	arch_release_task_struct(tsk);
+	free_kthread_struct(tsk);
 	free_task_struct(tsk);
 }
 EXPORT_SYMBOL(free_task);
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 9ff173d..3a4921f 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -181,14 +181,11 @@ static int kthread(void *_create)
 	int (*threadfn)(void *data) =3D create->threadfn;
 	void *data =3D create->data;
 	struct completion *done;
-	struct kthread self;
+	struct kthread *self;
 	int ret;
 =

-	self.flags =3D 0;
-	self.data =3D data;
-	init_completion(&self.exited);
-	init_completion(&self.parked);
-	current->vfork_done =3D &self.exited;
+	self =3D kmalloc(sizeof(*self), GFP_KERNEL);
+	set_kthread_struct(self);
 =

 	/* If user was SIGKILLed, I release the structure. */
 	done =3D xchg(&create->done, NULL);
@@ -196,6 +193,19 @@ static int kthread(void *_create)
 		kfree(create);
 		do_exit(-EINTR);
 	}
+
+	if (!self) {
+		create->result =3D ERR_PTR(-ENOMEM);
+		complete(done);
+		do_exit(-ENOMEM);
+	}
+
+	self->flags =3D 0;
+	self->data =3D data;
+	init_completion(&self->exited);
+	init_completion(&self->parked);
+	current->vfork_done =3D &self->exited;
+
 	/* OK, tell user we're spawned, wait for stop or wakeup */
 	__set_current_state(TASK_UNINTERRUPTIBLE);
 	create->result =3D current;
@@ -203,12 +213,10 @@ static int kthread(void *_create)
 	schedule();
 =

 	ret =3D -EINTR;
-
-	if (!test_bit(KTHREAD_SHOULD_STOP, &self.flags)) {
-		__kthread_parkme(&self);
+	if (!test_bit(KTHREAD_SHOULD_STOP, &self->flags)) {
+		__kthread_parkme(self);
 		ret =3D threadfn(data);
 	}
-	/* we can't just return, we must preserve "self" on stack */
 	do_exit(ret);
 }
 =



--===============1759337338450684891==--

