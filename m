Content-Type: multipart/mixed; boundary="===============6929856703569014301=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] WARNING: CPU: 0 PID: 13608 at kernel/sched/core.c:7323 __might_sleep+0xbd/0xd0()
Date: Tue, 16 Dec 2014 16:28:38 +0100
Message-ID: <20141216152838.GZ3337@twins.programming.kicks-ass.net>
In-Reply-To: <20141203024001.GD10048@yliu-dev.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6929856703569014301==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2014 at 10:40:01AM +0800, Yuanhan Liu wrote:
> <4>[  839.494114] ------------[ cut here ]------------
> <4>[  839.494131] WARNING: CPU: 0 PID: 13608 at /kbuild/src/lkp/kernel/sc=
hed/core.c:7323 __might_sleep+0xbd/0xd0()
> <4>[  839.494137] do not call blocking ops when !TASK_RUNNING; state=3D1 =
set at [<ffffffff810b3fff>] prepare_to_wait+0x2f/0x90
> <4>[  839.494256] Modules linked in: tun ipmi_watchdog loop btrfs xor rai=
d6_pq sg sd_mod ast snd_pcm syscopyarea sysfillrect snd_timer sysimgblt snd=
 ie6xx_wdt ttm i2c_isch drm_kms_helper soundcore drm ahci libahci pcspkr i2=
c_ismt lpc_sch ipmi_si libata shpchp ipmi_msghandler acpi_cpufreq
> <4>[  839.494264] CPU: 0 PID: 13608 Comm: fanotify01 Not tainted 3.18.0-r=
c4-next-20141117 #1
> <4>[  839.494266] Hardware name: To be filled by O.E.M. To be filled by O=
.E.M./Double Cove , BIOS BWDEXT.86B.000.012.D127 10/08/2012
> <4>[  839.494273]  ffffffff81b5ebb8 ffff88023cf37d18 ffffffff81892f54 000=
0000064026402
> <4>[  839.494277]  ffff88023cf37d68 ffff88023cf37d58 ffffffff8107047a fff=
f88023cf37db8
> <4>[  839.494281]  ffffffff81b5f5e8 0000000000000061 0000000000000000 000=
0000000006000
> <4>[  839.494285] Call Trace:
> <4>[  839.494315]  [<ffffffff81892f54>] dump_stack+0x4c/0x65
> <4>[  839.494323]  [<ffffffff8107047a>] warn_slowpath_common+0x8a/0xc0
> <4>[  839.494327]  [<ffffffff810704f6>] warn_slowpath_fmt+0x46/0x50
> <4>[  839.494333]  [<ffffffff810b3fff>] ? prepare_to_wait+0x2f/0x90
> <4>[  839.494337]  [<ffffffff810b3fff>] ? prepare_to_wait+0x2f/0x90
> <4>[  839.494341]  [<ffffffff810961fd>] __might_sleep+0xbd/0xd0
> <4>[  839.494348]  [<ffffffff81898974>] mutex_lock+0x24/0x50
> <4>[  839.494354]  [<ffffffff812250f5>] fanotify_read+0xd5/0x620
> <4>[  839.494370]  [<ffffffff8139c906>] ? selinux_file_permission+0xa6/0x=
120
> <4>[  839.494374]  [<ffffffff810b43e0>] ? wait_woken+0xc0/0xc0
> <4>[  839.494381]  [<ffffffff811e14c8>] __vfs_read+0x18/0x50
> <4>[  839.494385]  [<ffffffff811e158a>] vfs_read+0x8a/0x140
> <4>[  839.494390]  [<ffffffff811e1686>] SyS_read+0x46/0xb0
> <4>[  839.494403]  [<ffffffff8189b629>] system_call_fastpath+0x12/0x17
> <4>[  839.494409] ---[ end trace 5a2207521429f889 ]---
> =


As per e23738a7300a ("sched, inotify: Deal with nested sleeps").

Does this fix things?

---
 fs/notify/fanotify/fanotify_user.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/notify/fanotify/fanotify_user.c b/fs/notify/fanotify/fanoti=
fy_user.c
index c991616acca9..bff8567aa42d 100644
--- a/fs/notify/fanotify/fanotify_user.c
+++ b/fs/notify/fanotify/fanotify_user.c
@@ -259,16 +259,15 @@ static ssize_t fanotify_read(struct file *file, char =
__user *buf,
 	struct fsnotify_event *kevent;
 	char __user *start;
 	int ret;
-	DEFINE_WAIT(wait);
+	DEFINE_WAIT_FUNC(wait, woken_wake_function);
 =

 	start =3D buf;
 	group =3D file->private_data;
 =

 	pr_debug("%s: group=3D%p\n", __func__, group);
 =

+	add_wait_queue(&group->notification_waitq, &wait);
 	while (1) {
-		prepare_to_wait(&group->notification_waitq, &wait, TASK_INTERRUPTIBLE);
-
 		mutex_lock(&group->notification_mutex);
 		kevent =3D get_one_event(group, count);
 		mutex_unlock(&group->notification_mutex);
@@ -289,7 +288,8 @@ static ssize_t fanotify_read(struct file *file, char __=
user *buf,
 =

 			if (start !=3D buf)
 				break;
-			schedule();
+
+			wait_woken(&wait, TASK_INTERRUPTIBLE, MAX_SCHEDULE_TIMEOUT);
 			continue;
 		}
 =

@@ -318,8 +318,8 @@ static ssize_t fanotify_read(struct file *file, char __=
user *buf,
 		buf +=3D ret;
 		count -=3D ret;
 	}
+	remove_wait_queue(&group->notification_waitq, &wait);
 =

-	finish_wait(&group->notification_waitq, &wait);
 	if (start !=3D buf && ret !=3D -EFAULT)
 		ret =3D buf - start;
 	return ret;

--===============6929856703569014301==--

