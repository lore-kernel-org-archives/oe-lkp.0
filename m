Content-Type: multipart/mixed; boundary="===============5482376772005174200=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH] printk: clear console_may_schedule on panic flushing
Date: Mon, 11 Jan 2016 13:43:48 -0500
Message-ID: <20160111184348.GF1898@mtj.duckdns.org>
In-Reply-To: <878u3w95ke.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5482376772005174200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Commit "printk: do cond_resched() between lines while outputting to
consoles" made console flushing perform cond_resched() after each line
if the context allows as determined by whether the console lock was
acquired with console_lock().  The condition is carried in
console_may_schedule.

During panic, console lock status is ignored and the messages are
forcifully flushed which is implemented by performing
console_trylock(); console_unlock(); sequence ignoring whether trylock
succeeds or fails.  This means that the emergency flushing, after
trylock failure, may enter flushing path with console_may_schedule set
from the actual holder.

As a system may panic from any context, this can lead to
cond_resched() being invoked from a non-sleepable context triggering
an extra warning dump while panicking which is noisy and can be
confusing.  Besides, even when panicking from a sleepable context, we
don't want to be yielding during emergency message dumping.

Currently, the emergency dumping is opencoded in panic().  This patch
replaces the open coded implementation with a new function,
console_flush_on_panic() and makes it explicitly clear
console_may_schedule before starting the emergency flushing.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: kernel test robot <ying.huang@linux.intel.com>
Link: http://lkml.kernel.org/g/878u3w95ke.fsf(a)yhuang-dev.intel.com
---
 include/linux/console.h |    1 +
 kernel/panic.c          |    3 +--
 kernel/printk/printk.c  |   19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/linux/console.h b/include/linux/console.h
index bd19434..ea731af 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -150,6 +150,7 @@ extern int console_trylock(void);
 extern void console_unlock(void);
 extern void console_conditional_schedule(void);
 extern void console_unblank(void);
+extern void console_flush_on_panic(void);
 extern struct tty_driver *console_device(int *);
 extern void console_stop(struct console *);
 extern void console_start(struct console *);
diff --git a/kernel/panic.c b/kernel/panic.c
index b333380..d96469d 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -180,8 +180,7 @@ void panic(const char *fmt, ...)
 	 * panic() is not being callled from OOPS.
 	 */
 	debug_locks_off();
-	console_trylock();
-	console_unlock();
+	console_flush_on_panic();
 =

 	if (!panic_blink)
 		panic_blink =3D no_blink;
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index d0b8697..7ebcfea 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2386,6 +2386,25 @@ void console_unblank(void)
 	console_unlock();
 }
 =

+/**
+ * console_flush_on_panic - flush console content on panic
+ *
+ * Immediately output all pending messages no matter what.
+ */
+void console_flush_on_panic(void)
+{
+	/*
+	 * If someone else is holding the console lock, trylock will fail
+	 * and may_schedule may be set.  Ignore and proceed to unlock so
+	 * that messages are flushed out.  As this can be called from any
+	 * context and we don't want to get preempted while flushing,
+	 * ensure may_schedule is cleared.
+	 */
+	console_trylock();
+	console_may_schedule =3D 0;
+	console_unlock();
+}
+
 /*
  * Return the console tty driver structure and its associated index
  */

--===============5482376772005174200==--

