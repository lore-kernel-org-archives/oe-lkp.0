Content-Type: multipart/mixed; boundary="===============3657524886367158966=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Tue, 07 Dec 2021 14:38:34 +0100
Message-ID: <87bl1s357p.ffs@tglx>
In-Reply-To: <20211207012128.GA16074@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3657524886367158966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Dec 07 2021 at 09:21, kernel test robot wrote:

> (please be noted we made some further analysis before reporting out,
> and thought it's likely the regression is related with the extra spinlock
> introducded by enalbling DYNAMIC_SIGFRAME. below is the full report.)
>
> FYI, we noticed a -11.9% regression of will-it-scale.per_thread_ops due t=
o commit:

Does that use sigaltstack() ?

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.16.=
threads
>      47176 =C2=B1  2%     -11.9%      41541 =C2=B1  2%  will-it-scale.per=
_thread_ops
>     754824 =C2=B1  2%     -11.9%     664668 =C2=B1  2%  will-it-scale.wor=
kload
>    1422782 =C2=B1  8%  +3.3e+05     1751520 =C2=B1 12%  syscalls.sys_getp=
id.noise.5%

Somehow the printout got confused ...

>  1.583e+10            -2.1%   1.55e+10        perf-stat.i.instructions
>    6328594 =C2=B1  2%     +11.1%    7032338 =C2=B1  2%  perf-stat.overall=
.path-length
>  1.578e+10            -2.1%  1.545e+10        perf-stat.ps.instructions
>  4.774e+12            -2.2%  4.671e+12        perf-stat.total.instructions
>       0.00            +6.3        6.33 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.do_sigaltsta=
ck.restore_altstack.__x64_sys_rt_sigreturn
>       0.00            +6.5        6.51 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.do_sigaltstack.restore_altstack.__x64_sys_rt_=
sigreturn.do_syscall_64
>       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.do_sigaltstack.restore_altstack.__x64_sys_rt_sigreturn.do_syscal=
l_64.entry_SYSCALL_64_after_hwframe
>       0.00            +6.6        6.62 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.restore_altstack.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe.raise
>       0.00            +6.9        6.88 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__x64_sys_rt_sigreturn.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.raise
>       7.99 =C2=B1 12%      +6.0       14.00 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rt_sigreturn
>       0.05 =C2=B1 44%      +6.6        6.62 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.restore_altstack
>       0.00            +6.6        6.58 =C2=B1  8%  perf-profile.children.=
cycles-pp.do_sigaltstack

It looks like it does. The problem is that sighand->lock is process
wide.

Can you test whether the below cures it?

Not pretty, but that's what I came up with for now.

Thanks,

        tglx
---
--- a/arch/x86/kernel/fpu/core.c
+++ b/arch/x86/kernel/fpu/core.c
@@ -457,10 +457,10 @@ static inline void fpu_inherit_perms(str
 	if (fpu_state_size_dynamic()) {
 		struct fpu *src_fpu =3D &current->group_leader->thread.fpu;
 =

-		spin_lock_irq(&current->sighand->siglock);
+		read_lock(&current->sighand->sigaltstack_lock);
 		/* Fork also inherits the permissions of the parent */
 		dst_fpu->perm =3D src_fpu->perm;
-		spin_unlock_irq(&current->sighand->siglock);
+		read_unlock(&current->sighand->sigaltstack_lock);
 	}
 }
 =

--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -1582,17 +1582,22 @@ static int validate_sigaltstack(unsigned
 {
 	struct task_struct *thread, *leader =3D current->group_leader;
 	unsigned long framesize =3D get_sigframe_size();
+	int ret =3D 0;
 =

-	lockdep_assert_held(&current->sighand->siglock);
+	lockdep_assert_held_write(&current->sighand->sigaltstack_lock);
 =

 	/* get_sigframe_size() is based on fpu_user_cfg.max_size */
 	framesize -=3D fpu_user_cfg.max_size;
 	framesize +=3D usize;
+	read_lock(&tasklist_lock);
 	for_each_thread(leader, thread) {
-		if (thread->sas_ss_size && thread->sas_ss_size < framesize)
-			return -ENOSPC;
+		if (thread->sas_ss_size && thread->sas_ss_size < framesize) {
+			ret =3D -ENOSPC;
+			break;
+		}
 	}
-	return 0;
+	read_unlock(&tasklist_lock);
+	return ret;
 }
 =

 static int __xstate_request_perm(u64 permitted, u64 requested)
@@ -1627,7 +1632,7 @@ static int __xstate_request_perm(u64 per
 =

 	/* Pairs with the READ_ONCE() in xstate_get_group_perm() */
 	WRITE_ONCE(fpu->perm.__state_perm, requested);
-	/* Protected by sighand lock */
+	/* Protected by sighand::sigaltstack_lock */
 	fpu->perm.__state_size =3D ksize;
 	fpu->perm.__user_state_size =3D usize;
 	return ret;
@@ -1666,10 +1671,10 @@ static int xstate_request_perm(unsigned
 		return 0;
 =

 	/* Protect against concurrent modifications */
-	spin_lock_irq(&current->sighand->siglock);
+	write_lock(&current->sighand->sigaltstack_lock);
 	permitted =3D xstate_get_host_group_perm();
 	ret =3D __xstate_request_perm(permitted, requested);
-	spin_unlock_irq(&current->sighand->siglock);
+	write_unlock(&current->sighand->sigaltstack_lock);
 	return ret;
 }
 =

@@ -1685,11 +1690,11 @@ int xfd_enable_feature(u64 xfd_err)
 	}
 =

 	/* Protect against concurrent modifications */
-	spin_lock_irq(&current->sighand->siglock);
+	read_lock(&current->sighand->sigaltstack_lock);
 =

 	/* If not permitted let it die */
 	if ((xstate_get_host_group_perm() & xfd_event) !=3D xfd_event) {
-		spin_unlock_irq(&current->sighand->siglock);
+		read_unlock(&current->sighand->sigaltstack_lock);
 		return -EPERM;
 	}
 =

@@ -1702,7 +1707,7 @@ int xfd_enable_feature(u64 xfd_err)
 	 * another task, the retrieved buffer sizes are valid for the
 	 * currently requested feature(s).
 	 */
-	spin_unlock_irq(&current->sighand->siglock);
+	read_unlock(&current->sighand->sigaltstack_lock);
 =

 	/*
 	 * Try to allocate a new fpstate. If that fails there is no way
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -939,17 +939,19 @@ static int __init strict_sas_size(char *
  * the task has permissions to use dynamic features. Tasks which have no
  * permission are checked against the size of the non-dynamic feature set
  * if strict checking is enabled. This avoids forcing all tasks on the
- * system to allocate large sigaltstacks even if they are never going
- * to use a dynamic feature. As this is serialized via sighand::siglock
- * any permission request for a dynamic feature either happened already
- * or will see the newly install sigaltstack size in the permission checks.
+ * system to allocate large sigaltstacks even if they are never going to
+ * use a dynamic feature.
+ *
+ * As this is serialized via sighand::sigaltstack_lock any permission
+ * request for a dynamic feature either happened already or will see the
+ * newly install sigaltstack size in the permission checks.
  */
 bool sigaltstack_size_valid(size_t ss_size)
 {
 	unsigned long fsize =3D max_frame_size - fpu_default_state_size;
 	u64 mask;
 =

-	lockdep_assert_held(&current->sighand->siglock);
+	lockdep_assert_held_read(&current->sighand->sigaltstack_lock);
 =

 	if (!fpu_state_size_dynamic() && !strict_sigaltstack_size)
 		return true;
--- a/include/linux/sched/signal.h
+++ b/include/linux/sched/signal.h
@@ -19,6 +19,9 @@
 =

 struct sighand_struct {
 	spinlock_t		siglock;
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+	rwlock_t		sigaltstack_lock;
+#endif
 	refcount_t		count;
 	wait_queue_head_t	signalfd_wqh;
 	struct k_sigaction	action[_NSIG];
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -48,6 +48,9 @@ static struct sighand_struct init_sighan
 	.action		=3D { { { .sa_handler =3D SIG_DFL, } }, },
 	.siglock	=3D __SPIN_LOCK_UNLOCKED(init_sighand.siglock),
 	.signalfd_wqh	=3D __WAIT_QUEUE_HEAD_INITIALIZER(init_sighand.signalfd_wqh=
),
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+	.sigaltstack_lock	=3D __RW_LOCK_UNLOCKED(init_sighand.sigaltstack_lock),
+#endif
 };
 =

 #ifdef CONFIG_SHADOW_CALL_STACK
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2900,6 +2900,9 @@ static void sighand_ctor(void *data)
 =

 	spin_lock_init(&sighand->siglock);
 	init_waitqueue_head(&sighand->signalfd_wqh);
+#ifdef CONFIG_DYNAMIC_SIGFRAME
+	rwlock_init(&sighand->sigaltstack_lock);
+#endif
 }
 =

 void __init proc_caches_init(void)
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4141,15 +4141,15 @@ int do_sigaction(int sig, struct k_sigac
 =

 #ifdef CONFIG_DYNAMIC_SIGFRAME
 static inline void sigaltstack_lock(void)
-	__acquires(&current->sighand->siglock)
+	__acquires(&current->sighand->sigaltstack_lock)
 {
-	spin_lock_irq(&current->sighand->siglock);
+	read_lock(&current->sighand->sigaltstack_lock);
 }
 =

 static inline void sigaltstack_unlock(void)
-	__releases(&current->sighand->siglock)
+	__releases(&current->sighand->sigaltstack_lock)
 {
-	spin_unlock_irq(&current->sighand->siglock);
+	read_unlock(&current->sighand->sigaltstack_lock);
 }
 #else
 static inline void sigaltstack_lock(void) { }
--===============3657524886367158966==--

