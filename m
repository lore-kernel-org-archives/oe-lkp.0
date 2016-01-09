Content-Type: multipart/mixed; boundary="===============3537075008228437405=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [PATCH] vmstat: allocate vmstat_wq before it is used
Date: Sat, 09 Jan 2016 15:53:56 +0900
Message-ID: <201601091553.JJC73408.MLFVFJSOOtQHOF@I-love.SAKURA.ne.jp>
In-Reply-To: <CA+55aFySZnN0B1rO4iOnFBfAHStzBZS1v8dans1wTn1Uv6Qmtw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3537075008228437405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds wrote:
> On Fri, Jan 8, 2016 at 4:13 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Was there confirmation this fixed the issue? Just verifying..

I confirmed that

----------
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4ebc17d..0486d3d 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -27,6 +27,7 @@
 #include <linux/mm_inline.h>
 #include <linux/page_ext.h>
 #include <linux/page_owner.h>
+#include <linux/delay.h>
 =

 #include "internal.h"
 =

@@ -1550,6 +1551,7 @@ static int __init setup_vmstat(void)
 =

 	start_shepherd_timer();
 	cpu_notifier_register_done();
+	ssleep(3);
 	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 #endif
 #ifdef CONFIG_PROC_FS
----------

always reproduces this bug and

----------
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4ebc17d..358c1b7 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -27,6 +27,7 @@
 #include <linux/mm_inline.h>
 #include <linux/page_ext.h>
 #include <linux/page_owner.h>
+#include <linux/delay.h>
 =

 #include "internal.h"
 =

@@ -1483,6 +1484,8 @@ static void __init start_shepherd_timer(void)
 		BUG();
 	cpumask_copy(cpu_stat_off, cpu_online_mask);
 =

+	ssleep(3);
+	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 	schedule_delayed_work(&shepherd,
 		round_jiffies_relative(sysctl_stat_interval));
 }
@@ -1550,7 +1553,6 @@ static int __init setup_vmstat(void)
 =

 	start_shepherd_timer();
 	cpu_notifier_register_done();
-	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 #endif
 #ifdef CONFIG_PROC_FS
 	proc_create("buddyinfo", S_IRUGO, NULL, &fragmentation_file_operations);
----------

never reproduces this bug. Thus, I think it is OK to sneak it into 4.4.

> =

> Oh, and Tetsuo claims that it needs a cc stable regardless, because
> the commit that caused this to appear was marked for stable and
> already got backported. Yes?
> =

>                    Linus
> =


Yes, please.

--===============3537075008228437405==--

