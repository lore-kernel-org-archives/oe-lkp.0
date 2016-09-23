Content-Type: multipart/mixed; boundary="===============3516068577649315300=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: [PATCH] blk-mq: fixup "Convert to new hotplug state machine"
Date: Fri, 23 Sep 2016 15:02:38 +0200
Message-ID: <20160923130238.fcfwesvebbzfygde@linutronix.de>
In-Reply-To: <57e4af86.DjcswKxMIcEW/4+i%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3516068577649315300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The "blk_mq_queue_reinit_dead()" just cleared the cpumask instead doing
a copy. Since we might never had an online callback we could end up with
a ZERO mask which in turn leads to crash as test robot demonstarted.

Fixes: 65d5291eee66 ("blk-mq: Convert to new hotplug state machine")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 block/blk-mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 65347cb7d7e1..8c0f80198e52 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -2158,7 +2158,7 @@ static void blk_mq_queue_reinit_work(void)
 =

 static int blk_mq_queue_reinit_dead(unsigned int cpu)
 {
-	cpumask_clear_cpu(cpu, &cpuhp_online_new);
+	cpumask_copy(&cpuhp_online_new, cpu_online_mask);
 	blk_mq_queue_reinit_work();
 	return 0;
 }
-- =

2.9.3


--===============3516068577649315300==--

