Content-Type: multipart/mixed; boundary="===============3616762532263299669=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: Re: [rfcomm_run] WARNING: CPU: 1 PID: 79 at kernel/sched/core.c:7156 __might_sleep()
Date: Fri, 03 Oct 2014 21:30:29 +0200
Message-ID: <20141003193029.GA24399@redhat.com>
In-Reply-To: <20141003175654.GA14952@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3616762532263299669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/03, Oleg Nesterov wrote:
>
> OK, this is fixable.  rfcomm_run() can do
>
> 	add_wait_queue(&rfcomm_wq, &wait);
> 	while (!kthread_should_stop()) {
> 		rfcomm_process_sessions();
>
> 		set_kthread_wants_signal(true);
> 		wait_woken(TASK_INTERRUPTIBLE);
> 		set_kthread_wants_signal(false);
> 	}
> 	remove_wait_queue(&rfcomm_wq, &wait);

And in this case set_kthread_wants_signal(true) needs to avoid the races
with kthread_stop() too. See the hopefully complete patch at the end.

However,

> Or. perhaps we can change wait_woken
>
> 	-	set_current_state(mode);
> 	+	if (mode)
> 	+		set_current_state(mode);
>
>
> then rfcomm_run() can do
>
> 	for (;;) {
> 		rfcomm_process_sessions();
>
> 		set_current_state(TASK_INTERRUPTIBLE);
> 		if (kthread_should_stop())
> 			break;
> 		wait_woken(0);
> 	}
>
> Or perhaps we can split wait_woken() into 2 helpers,
>
> 	static inline long wait_woken(wq, mode, timeout)
> 	{
> 		set_current_state(mode);
> 		schedule_woken(wq, timeout); // does the rest
> 	}
>
> to avoid "mode =3D=3D 0" hack; rfcomm_run() should use schedule_woken().

probably this makes more sense in this particular case...

Oleg.
---

--- x/kernel/kthread.c
+++ x/kernel/kthread.c
@@ -48,6 +48,7 @@ struct kthread {
 =

 enum KTHREAD_BITS {
 	KTHREAD_IS_PER_CPU =3D 0,
+	KTHREAD_WANTS_SIGNAL,
 	KTHREAD_SHOULD_STOP,
 	KTHREAD_SHOULD_PARK,
 	KTHREAD_IS_PARKED,
@@ -442,6 +443,45 @@ int kthread_park(struct task_struct *k)
 	return ret;
 }
 =

+void set_kthread_wants_signal(bool on)
+{
+	struct kthread *kthread =3D to_kthread(current);
+	unsigned long flags;
+
+	spin_lock_irqsave(&current->sighand->siglock, flags);
+	if (on) {
+		set_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);
+		smp_mb__after_atomic();
+		if (kthread_should_stop())
+			set_thread_flag(TIF_SIGPENDING);
+	} else {
+		clear_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);
+		recalc_sigpending();
+	}
+	spin_unlock_irqrestore(&current->sighand->siglock, flags);
+}
+
+static void kthread_kill(struct task_struct *k, struct kthread *kthread)
+{
+	smp_mb__before_atomic();
+	if (test_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags)) {
+		unsigned long flags;
+		bool kill =3D true;
+
+		if (lock_task_sighand(k, &flags)) {
+			kill =3D test_bit(KTHREAD_WANTS_SIGNAL, &kthread->flags);
+			if (kill)
+				signal_wake_up(k, 0);
+			unlock_task_sighand(k, &flags);
+		}
+
+		if (kill)
+			return;
+	}
+
+	wake_up_process(k);
+}
+
 /**
  * kthread_stop - stop a thread created by kthread_create().
  * @k: thread created by kthread_create().
@@ -469,7 +509,7 @@ int kthread_stop(struct task_struct *k)
 	if (kthread) {
 		set_bit(KTHREAD_SHOULD_STOP, &kthread->flags);
 		__kthread_unpark(k, kthread);
-		wake_up_process(k);
+		kthread_kill(k, kthread);
 		wait_for_completion(&kthread->exited);
 	}
 	ret =3D k->exit_code;


--===============3616762532263299669==--

