Content-Type: multipart/mixed; boundary="===============5090654981818889571=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [locking/ww_mutex] 2a0c112828 WARNING: CPU: 0 PID: 18 at kernel/locking/mutex.c:305 __ww_mutex_wakeup_for_backoff
Date: Wed, 01 Mar 2017 16:18:45 +0100
Message-ID: <20170301151845.GK6515@twins.programming.kicks-ass.net>
In-Reply-To: <20170301150138.hdixnmafzfsox7nn@tardis.cn.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5090654981818889571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 01, 2017 at 11:01:38PM +0800, Boqun Feng wrote:
> =

> In test-ww_mutex, the stress will use 4096 locks to do the test, and
> given held_lock::references only have 12 bits, so I think this is the
> reason? I made a patch to reduce the lock number of stress test, and it
> seems the problem is resolved.
> =

> Thoughts?

Aaaahhh!! YES. I completely overlooked (and forgot) ww_mutex used that.

Let me also do a lockdep patch that complains on overflow there.

 ------------[ cut here ]------------
 WARNING: CPU: 0 PID: 5 at ../kernel/locking/lockdep.c:3269 __lock_acquire.=
isra.7+0xf8/0x703
 DEBUG_LOCKS_WARN_ON(hlock->references =3D=3D (1 << 12)-1)
 CPU: 0 PID: 5 Comm: kworker/u2:0 Not tainted 4.10.0-01418-gfba4873-dirty #=
29
 Workqueue: test-ww_mutex stress_inorder_work
 Call Trace:
  dump_stack+0x16/0x18
  __warn+0xa0/0xb7
  ? __lock_acquire.isra.7+0xf8/0x703
  warn_slowpath_fmt+0x28/0x2d
  __lock_acquire.isra.7+0xf8/0x703
  lock_acquire+0x6c/0x95
  ? stress_inorder_work+0xbf/0x218
  __ww_mutex_lock.constprop.0+0x5c/0x848
  ? stress_inorder_work+0xbf/0x218
  ? __might_sleep+0x6c/0x73
  ww_mutex_lock+0x34/0x3b
  ? stress_inorder_work+0xbf/0x218
  stress_inorder_work+0xbf/0x218
  process_one_work+0x1c0/0x33a
  ? process_one_work+0x168/0x33a
  worker_thread+0x22f/0x315
  kthread+0xed/0xf2
  ? process_scheduled_works+0x24/0x24
  ? __kthread_create_on_node+0x11f/0x11f
  ret_from_fork+0x21/0x30
 ---[ end trace 326b6bfcd7100ae8 ]---

---
 kernel/locking/lockdep.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 9812e5dd409e..c0ee8607c11e 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3260,10 +3260,17 @@ static int __lock_acquire(struct lockdep_map *lock,=
 unsigned int subclass,
 	if (depth) {
 		hlock =3D curr->held_locks + depth - 1;
 		if (hlock->class_idx =3D=3D class_idx && nest_lock) {
-			if (hlock->references)
+			if (hlock->references) {
+				/*
+				 * Check: unsigned int references:12, overflow.
+				 */
+				if (DEBUG_LOCKS_WARN_ON(hlock->references =3D=3D (1 << 12)-1))
+					return 0;
+
 				hlock->references++;
-			else
+			} else {
 				hlock->references =3D 2;
+			}
 =

 			return 1;
 		}

--===============5090654981818889571==--

