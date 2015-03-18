Content-Type: multipart/mixed; boundary="===============3448852454958538562=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] ef9db2383c7: WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3538 check_flags+0x22d/0x240()
Date: Wed, 18 Mar 2015 10:12:36 +0100
Message-ID: <20150318091236.GL23123@twins.programming.kicks-ass.net>
In-Reply-To: <1426666507.5570.32.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3448852454958538562==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 04:15:07PM +0800, Huang Ying wrote:
> [    0.043211] ------------[ cut here ]------------
> [    0.043778] WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:3538 ch=
eck_flags+0x22d/0x240()
> [    0.044000] DEBUG_LOCKS_WARN_ON(current->hardirqs_enabled)

> [    0.044000]  [<ffffffff8111659d>] check_flags+0x22d/0x240
> [    0.044000]  [<ffffffff81117636>] lock_is_held+0x36/0x90
> [    0.044000]  [<ffffffff81129ce5>] rcu_read_lock_held+0x65/0x70
> [    0.044000]  [<ffffffff81117d16>] lockdep_init_map+0x336/0x6f0

I'm not entirely sure how we get from lockdep_init_map() into
rcu_read_lock_held() without going through another call like
is_module_address().

But the error is clear enough; I added the below on top of this patch.

Thanks!

---
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -2996,8 +2996,13 @@ void lockdep_init_map(struct lockdep_map
 	if (subclass) {
 		unsigned long flags;
 =

+		if (DEBUG_LOCKS_WARN_ON(current->lockdep_recursion))
+			return;
+
 		raw_local_irq_save(flags);
+		current->lockdep_recursion =3D 1;
 		register_lock_class(lock, subclass, 1);
+		current->lockdep_recursion =3D 0;
 		raw_local_irq_restore(flags);
 	}
 }

--===============3448852454958538562==--

