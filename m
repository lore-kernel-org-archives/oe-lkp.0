Content-Type: multipart/mixed; boundary="===============5001183803091037584=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [mm, vmstat] 373ccbe592: BUG: unable to handle kernel
Date: Fri, 08 Jan 2016 19:32:52 +0900
Message-ID: <201601081932.GCE21843.HFQOtOSLFJFOVM@I-love.SAKURA.ne.jp>
In-Reply-To: <87r3hsg4io.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5001183803091037584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ying Huang wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 373ccbe5927034b55bdc80b0f8b54d6e13fe8d12 ("mm, vmstat: allow WQ co=
ncurrency to discover memory reclaim doesn't make any progress")
> =

> =

> +------------------------------------------+------------+------------+
> |                                          | 475a2f905d | 373ccbe592 |
> +------------------------------------------+------------+------------+
> | boot_successes                           | 303        | 265        |
> | boot_failures                            | 0          | 39         |
> | BUG:unable_to_handle_kernel              | 0          | 39         |
> | Oops                                     | 0          | 39         |
> | EIP_is_at__queue_work                    | 0          | 39         |
> | Kernel_panic-not_syncing:Fatal_exception | 0          | 39         |
> | backtrace:vmstat_shepherd                | 0          | 39         |
> +------------------------------------------+------------+------------+
> =

Thank you. I think that start_shepherd_timer() started shepherd item
and vmstat_shepherd() is called before vmstat_wq =3D alloc_workqueue() is
called. We are sometimes too late to allocate vmstat_wq workqueue.
Please try below one.

----------
diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4ebc17d..6478929 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1545,12 +1545,12 @@ static struct notifier_block vmstat_notifier =3D
 static int __init setup_vmstat(void)
 {
 #ifdef CONFIG_SMP
+	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 	cpu_notifier_register_begin();
 	__register_cpu_notifier(&vmstat_notifier);
 =

 	start_shepherd_timer();
 	cpu_notifier_register_done();
-	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 #endif
 #ifdef CONFIG_PROC_FS
 	proc_create("buddyinfo", S_IRUGO, NULL, &fragmentation_file_operations);
----------

We need to backport this fix to stable since this commit already went to 3.=
2.75.

--===============5001183803091037584==--

