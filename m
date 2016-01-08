Content-Type: multipart/mixed; boundary="===============6301892188493505276=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: [PATCH] vmstat: allocate vmstat_wq before it is used
Date: Fri, 08 Jan 2016 11:18:29 +0100
Message-ID: <1452248309-17930-1-git-send-email-mhocko@kernel.org>
In-Reply-To: <87r3hsg4io.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6301892188493505276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Michal Hocko <mhocko@suse.com>

kernel test robot has reported the following crash:
[    3.870718] BUG: unable to handle kernel NULL pointer dereferenceNULL po=
inter dereference at 00000100
 at 00000100
[    3.872615] IP: [<c1074df6>] __queue_work+0x26/0x390 [<c1074df6>] __queu=
e_work+0x26/0x390
[    3.873758] *pdpt =3D 0000000000000000 *pde =3D f000ff53f000ff53 *pde =
=3D f000ff53f000ff53
[    3.875096] Oops: 0000 [#1] PREEMPT PREEMPT SMP SMP
[    3.876130] CPU: 0 PID: 24 Comm: kworker/0:1 Not tainted 4.4.0-rc4-00139=
-g373ccbe #1
[    3.878135] Workqueue: events vmstat_shepherd
[    3.879207] task: cb684600 ti: cb7ba000 task.ti: cb7ba000
[    3.880445] EIP: 0060:[<c1074df6>] EFLAGS: 00010046 CPU: 0
[    3.881704] EIP is at __queue_work+0x26/0x390
[    3.882823] EAX: 00000046 EBX: cbb37800 ECX: cbb37800 EDX: 00000000
[    3.884457] ESI: 00000000 EDI: 00000000 EBP: cb7bbe68 ESP: cb7bbe38
[    3.886005]  DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
[    3.887229] CR0: 8005003b CR2: 00000100 CR3: 01fd5000 CR4: 000006b0
[    3.888663] Stack:
[    3.895204] Call Trace:
[    3.895854]  [<c1a381dd>] ? mutex_unlock+0xd/0x10
[    3.897120]  [<c1075221>] __queue_delayed_work+0xa1/0x160
[    3.898530]  [<c10764c6>] queue_delayed_work_on+0x36/0x60
[    3.899790]  [<c11494bd>] vmstat_shepherd+0xad/0xf0
[    3.900899]  [<c1075a7a>] process_one_work+0x1aa/0x4c0
[    3.902093]  [<c10759e2>] ? process_one_work+0x112/0x4c0
[    3.903520]  [<c10ac31e>] ? do_raw_spin_lock+0xe/0x150
[    3.904853]  [<c1075dd1>] worker_thread+0x41/0x440
[    3.906023]  [<c1075d90>] ? process_one_work+0x4c0/0x4c0
[    3.907242]  [<c107b7c0>] kthread+0xb0/0xd0
[    3.908188]  [<c1a3c651>] ret_from_kernel_thread+0x21/0x40
[    3.909601]  [<c107b710>] ? __kthread_parkme+0x80/0x80

The reason is that start_shepherd_timer schedules the shepherd work item
which uses vmstat_wq (vmstat_shepherd) before setup_vmstat allocates
that workqueue so if the further initialization takes more than HZ
we might end up scheduling on a NULL vmstat_wq. This is really unlikely
but not impossible.

Fixes: 373ccbe59270 ("mm, vmstat: allow WQ concurrency to discover memory r=
eclaim doesn't make any progress")
Reported-by: kernel test robot <ying.huang@linux.intel.com>
Signed-off-by: Michal Hocko <mhocko@suse.com>
---
Hi Linus,
I am not marking this for stable because I hope we can sneak it into 4.4.
The patch is trivial and obvious. I am sorry about the breakage. If you pre=
fer =

to postpone it to 4.5-rc1 because this is not really that critical and shou=
ldn't
happen most of the time then I will repost with stable tag added.

Thanks!

 mm/vmstat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmstat.c b/mm/vmstat.c
index 4ebc17d948cb..c54fd2924f25 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1483,6 +1483,7 @@ static void __init start_shepherd_timer(void)
 		BUG();
 	cpumask_copy(cpu_stat_off, cpu_online_mask);
 =

+	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 	schedule_delayed_work(&shepherd,
 		round_jiffies_relative(sysctl_stat_interval));
 }
@@ -1550,7 +1551,6 @@ static int __init setup_vmstat(void)
 =

 	start_shepherd_timer();
 	cpu_notifier_register_done();
-	vmstat_wq =3D alloc_workqueue("vmstat", WQ_FREEZABLE|WQ_MEM_RECLAIM, 0);
 #endif
 #ifdef CONFIG_PROC_FS
 	proc_create("buddyinfo", S_IRUGO, NULL, &fragmentation_file_operations);
-- =

2.6.4


--===============6301892188493505276==--

