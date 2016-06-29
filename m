Content-Type: multipart/mixed; boundary="===============2333854835801058409=="
MIME-Version: 1.0
From: Oleg Nesterov <oleg@redhat.com>
To: lkp@lists.01.org
Subject: [PATCH] kthread: to_live_kthread() needs try_get_task_stack()
Date: Wed, 29 Jun 2016 20:03:58 +0200
Message-ID: <20160629180357.GA7178@redhat.com>
In-Reply-To: <CALCETrUng61Fe2+RSp5r6fsOkcUKDqnf-u39TUrgO76pHMqFsA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2333854835801058409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/29, Andy Lutomirski wrote:
>
> I pushed that change to my tree (seems to work well enough to boot
> without warnings as long as I don't unmount XFS, but not particularly
> well tested).  Want to refresh your patch on top?

Please see the trivial fix below. Compile tested, but looks obvious.

Btw, why free_thread_stack() calls vfree() with irqs disabled? Doesn't
look good and perhaps even wrong; at least vmap_debug_free_range() does
flush_tlb_kernel_range() and smp_call_function() can deadlock?

---------------------------------------------------------------------------=
----
Subject: [PATCH] kthread: to_live_kthread() needs try_get_task_stack()

get_task_struct(tsk) no longer pins tsk->stack so all users of
to_live_kthread() should do try_get_task_stack/put_task_stack to protect
"struct kthread" which lives on kthread's stack.

TODO: Kill to_live_kthread(), perhaps we can even kill "struct kthread" too,
and rework kthread_stop(), it can use task_work_add() to sync with the exit=
ing
kernel thread.

Signed-off-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/kthread.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/kernel/kthread.c b/kernel/kthread.c
index 9ff173d..4ab4c37 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -64,7 +64,7 @@ static inline struct kthread *to_kthread(struct task_stru=
ct *k)
 static struct kthread *to_live_kthread(struct task_struct *k)
 {
 	struct completion *vfork =3D ACCESS_ONCE(k->vfork_done);
-	if (likely(vfork))
+	if (likely(vfork) && try_get_task_stack(k))
 		return __to_kthread(vfork);
 	return NULL;
 }
@@ -425,8 +425,10 @@ void kthread_unpark(struct task_struct *k)
 {
 	struct kthread *kthread =3D to_live_kthread(k);
 =

-	if (kthread)
+	if (kthread) {
 		__kthread_unpark(k, kthread);
+		put_task_stack(k);
+	}
 }
 EXPORT_SYMBOL_GPL(kthread_unpark);
 =

@@ -455,6 +457,7 @@ int kthread_park(struct task_struct *k)
 				wait_for_completion(&kthread->parked);
 			}
 		}
+		put_task_stack(k);
 		ret =3D 0;
 	}
 	return ret;
@@ -490,6 +493,7 @@ int kthread_stop(struct task_struct *k)
 		__kthread_unpark(k, kthread);
 		wake_up_process(k);
 		wait_for_completion(&kthread->exited);
+		put_task_stack(k);
 	}
 	ret =3D k->exit_code;
 	put_task_struct(k);
-- =

2.5.0



--===============2333854835801058409==--

