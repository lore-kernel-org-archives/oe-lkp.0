Content-Type: multipart/mixed; boundary="===============2167472767473344352=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [ptrace] 63a745aa6a: inconsistent {HARDIRQ-ON-W} -> {IN-HARDIRQ-W} usage.
Date: Wed, 13 Jan 2016 14:27:39 +0100
Message-ID: <20160113132739.GC29964@linutronix.de>
In-Reply-To: <87y4cbquqe.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2167472767473344352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Subject: [PATCH RT] ptrace: don't open IRQs in ptrace_freeze_traced() too e=
arly

In the non-RT case the spin_lock_irq() here disables interrupts as well
as raw_spin_lock_irq(). So in the unlock case the interrupts are enabled
too early. =


Reported-by: kernel test robot <ying.huang@linux.intel.com>
Cc: stable-rt(a)vger.kernel.org
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 kernel/ptrace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index d1d158005ad0..2856b433d9d6 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -129,12 +129,14 @@ static bool ptrace_freeze_traced(struct task_struct *=
task)
 =

 	spin_lock_irq(&task->sighand->siglock);
 	if (task_is_traced(task) && !__fatal_signal_pending(task)) {
-		raw_spin_lock_irq(&task->pi_lock);
+		unsigned long flags;
+
+		raw_spin_lock_irqsave(&task->pi_lock, flags);
 		if (task->state & __TASK_TRACED)
 			task->state =3D __TASK_TRACED;
 		else
 			task->saved_state =3D __TASK_TRACED;
-		raw_spin_unlock_irq(&task->pi_lock);
+		raw_spin_unlock_irqrestore(&task->pi_lock, flags);
 		ret =3D true;
 	}
 	spin_unlock_irq(&task->sighand->siglock);
-- =

2.7.0.rc3


--===============2167472767473344352==--

