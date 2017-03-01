Content-Type: multipart/mixed; boundary="===============5165040369049780606=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Wed, 01 Mar 2017 16:54:14 +0100
Message-ID: <20170301155414.GN6515@twins.programming.kicks-ass.net>
In-Reply-To: <20170301154043.hcsbpgooc3kqt45j@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5165040369049780606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 11:40:43PM +0800, Fengguang Wu wrote:
> Thanks for the patch! I applied the patch on top of "locking/ww_mutex:
> Add kselftests for ww_mutex stress", and find no "bad unlock balance
> detected" but this warning. Attached is the new dmesg which is a bit
> large due to lots of repeated errors.

So with all the various patches it works for me.

I also have the following on top; which I did when I was looking through
this code trying to figure out wth was happening.

Chris, does this make sense to you?

It makes each loop a fully new 'instance', otherwise we'll never update
the ww_class->stamp and the threads will aways have the same order.

---

diff --git a/kernel/locking/test-ww_mutex.c b/kernel/locking/test-ww_mutex.c
index da6c9a34f62f..d0fd06429c9d 100644
--- a/kernel/locking/test-ww_mutex.c
+++ b/kernel/locking/test-ww_mutex.c
@@ -398,12 +398,11 @@ static void stress_inorder_work(struct work_struct *w=
ork)
 	if (!order)
 		return;
 =

-	ww_acquire_init(&ctx, &ww_class);
-
 	do {
 		int contended =3D -1;
 		int n, err;
 =

+		ww_acquire_init(&ctx, &ww_class);
 retry:
 		err =3D 0;
 		for (n =3D 0; n < nlocks; n++) {
@@ -433,9 +432,9 @@ static void stress_inorder_work(struct work_struct *wor=
k)
 				    __func__, err);
 			break;
 		}
-	} while (--stress->nloops);
 =

-	ww_acquire_fini(&ctx);
+		ww_acquire_fini(&ctx);
+	} while (--stress->nloops);
 =

 	kfree(order);
 	kfree(stress);
@@ -470,9 +469,9 @@ static void stress_reorder_work(struct work_struct *wor=
k)
 	kfree(order);
 	order =3D NULL;
 =

-	ww_acquire_init(&ctx, &ww_class);
-
 	do {
+		ww_acquire_init(&ctx, &ww_class);
+
 		list_for_each_entry(ll, &locks, link) {
 			err =3D ww_mutex_lock(ll->lock, &ctx);
 			if (!err)
@@ -495,9 +494,9 @@ static void stress_reorder_work(struct work_struct *wor=
k)
 		dummy_load(stress);
 		list_for_each_entry(ll, &locks, link)
 			ww_mutex_unlock(ll->lock);
-	} while (--stress->nloops);
 =

-	ww_acquire_fini(&ctx);
+		ww_acquire_fini(&ctx);
+	} while (--stress->nloops);
 =

 out:
 	list_for_each_entry_safe(ll, ln, &locks, link)

--===============5165040369049780606==--

