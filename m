Content-Type: multipart/mixed; boundary="===============6094911437915349298=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: lkp@lists.01.org
Subject: Re: [printk] fbc14616f4: BUG:kernel_reboot-without-warning_in_test_stage
Date: Fri, 31 Mar 2017 13:04:38 +0900
Message-ID: <20170331040438.GA366@jagdpanzerIV.localdomain>
In-Reply-To: <20170331023506.GB3493@jagdpanzerIV.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============6094911437915349298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On (03/31/17 11:35), Sergey Senozhatsky wrote:
[..]
> > [   21.009531] VFS: Warning: trinity-c2 using old stat() call. Recompil=
e your binary.
> > [   21.148898] VFS: Warning: trinity-c0 using old stat() call. Recompil=
e your binary.
> > [   22.298208] warning: process `trinity-c2' used the deprecated sysctl=
 system call with =

> > =

> > Elapsed time: 310
> > BUG: kernel reboot-without-warning in test stage
> =

> so as far as I understand, this is the "missing kernel messages"
> type of bug report. a worst case scenario.

panic() should have called console_flush_on_panic(), which sould have
flushed the messages regardless the printk_kthread state. so it probably
was not panic() that rebooted the kernel. (probably).

kernel_restart() and kernel_halt() have pr_emerg() messages, printk switches
to printk_emergency mode the first time it sees EMERG level message. (may be
we switch to late).

on the other hand, there is a emergency_restart(), where we don't switch
to printk_emergency mode and don't flush the existing kernel messages.
there is a bunch of places that call emergency_restart(), including sysrq.

may I ask you, how do you usually restart the vm after the test?
`echo X > /proc/sysrq-trigger'?

does this patch make it any better?

---
 drivers/tty/sysrq.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index 817dfb69914d..069f5540be36 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -240,7 +240,6 @@ static DECLARE_WORK(sysrq_showallcpus, sysrq_showregs_o=
thercpus);
 =

 static void sysrq_handle_showallcpus(int key)
 {
-	printk_emergency_begin();
 	/*
 	 * Fall back to the workqueue based printing if the
 	 * backtrace printing did not succeed or the
@@ -255,7 +254,6 @@ static void sysrq_handle_showallcpus(int key)
 		}
 		schedule_work(&sysrq_showallcpus);
 	}
-	printk_emergency_end();
 }
 =

 static struct sysrq_key_op sysrq_showallcpus_op =3D {
@@ -282,10 +280,8 @@ static struct sysrq_key_op sysrq_showregs_op =3D {
 =

 static void sysrq_handle_showstate(int key)
 {
-	printk_emergency_begin();
 	show_state();
 	show_workqueue_state();
-	printk_emergency_end();
 }
 static struct sysrq_key_op sysrq_showstate_op =3D {
 	.handler	=3D sysrq_handle_showstate,
@@ -296,9 +292,7 @@ static struct sysrq_key_op sysrq_showstate_op =3D {
 =

 static void sysrq_handle_showstate_blocked(int key)
 {
-	printk_emergency_begin();
 	show_state_filter(TASK_UNINTERRUPTIBLE);
-	printk_emergency_end();
 }
 static struct sysrq_key_op sysrq_showstate_blocked_op =3D {
 	.handler	=3D sysrq_handle_showstate_blocked,
@@ -537,6 +531,7 @@ void __handle_sysrq(int key, bool check_mask)
 	int orig_log_level;
 	int i;
 =

+	printk_emergency_begin();
 	rcu_sysrq_start();
 	rcu_read_lock();
 	/*
@@ -582,6 +577,7 @@ void __handle_sysrq(int key, bool check_mask)
 	}
 	rcu_read_unlock();
 	rcu_sysrq_end();
+	printk_emergency_end();
 }
 =

 void handle_sysrq(int key)
-- =

2.12.2


--===============6094911437915349298==--

