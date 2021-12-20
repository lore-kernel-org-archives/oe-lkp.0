Content-Type: multipart/mixed; boundary="===============1246266880926778020=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: lkp@lists.01.org
Subject: Re: [loop] 322c4293ec: xfstests.xfs.049.fail
Date: Mon, 20 Dec 2021 23:57:40 +0900
Message-ID: <ee718d4e-7681-d09a-5d2a-4f9ac2172038@i-love.sakura.ne.jp>
In-Reply-To: <20211220115823.GB20005@quack2.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1246266880926778020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021/12/20 20:58, Jan Kara wrote:
> On Mon 20-12-21 00:45:46, Tetsuo Handa wrote:
>> On 2021/12/20 0:09, kernel test robot wrote:
>>>     @@ -13,3 +13,5 @@
>>>      --- clean
>>>      --- umount ext2 on xfs
>>>      --- umount xfs
>>>     +!!! umount xfs failed
>>>     +(see /lkp/benchmarks/xfstests/results//xfs/049.full for details)
>>>     ...
>>>     (Run 'diff -u /lkp/benchmarks/xfstests/tests/xfs/049.out /lkp/bench=
marks/xfstests/results//xfs/049.out.bad'  to see the entire diff)
>>
>> Yes, we know this race condition can happen.
>>
>> https://lkml.kernel.org/r/16c7d304-60ef-103f-1b2c-8592b48f47c6(a)i-love.=
sakura.ne.jp
>> https://lkml.kernel.org/r/YaYfu0H2k0PSQL6W(a)infradead.org
>>
>> Should we try to wait for autoclear operation to complete?
> =

> So I think we should try to fix this because as Dave writes in the
> changelog for a1ecac3b0656 ("loop: Make explicit loop device destruction
> lazy") which started all this, having random EBUSY failures (either from
> losetup or umount) is annoying and you need to work it around it lots of
> unexpected places.

OK. Let's wait for autoclear operation to complete.

> =

> We cannot easily wait for work completion in the loop device code without
> reintroducing the deadlock - whole lo_release() is called under
> disk->open_mutex which you also need to grab in __loop_clr_fd(). So to
> avoid holding backing file busy longer than expected, we could use
> task_work instead of ordinary work as I suggested - but you were right th=
at
> we need to be somewhat careful and in case we are running in a kthread, we
> would still need to offload to a normal work (but in that case we don't
> care about delaying file release anyway).

Like fput_many() shows, it is not easy to implement fallback correctly.
I worry that exporting task_work_add() to loadable kernel modules results in
random abuse of task_work which does not implement fallback.

Instead of exporting task_work_add(), I think we can apply below diff.
I chose not to rely on WQ context, for there is fput(filp) in __loop_clr_fd=
()
which we should make sure that __fput(filp) is processed by a thread which
triggered autoclear operation. If this __fput(filp) is scheduled by other t=
hread
because fput(filp) is called by a thread which did not trigger autoclear op=
eration,
I think it is possible that a thread which triggered autoclear operation fa=
ils to
wait for completion of __fput(filp), and results in the same problem.

---
 block/bdev.c           |  2 ++
 drivers/block/loop.c   | 42 ++++++++++++------------------------------
 drivers/block/loop.h   |  2 +-
 include/linux/blkdev.h |  5 +++++
 4 files changed, 20 insertions(+), 31 deletions(-)

diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index c80cfaefc0a8..b252b1d87471 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -1227,6 +1227,11 @@ struct block_device_operations {
 	 * driver.
 	 */
 	int (*alternative_gpt_sector)(struct gendisk *disk, sector_t *sector);
+	/*
+	 * Special callback for doing post-release callback without
+	 * disk->open_mutex held. Used by loop driver.
+	 */
+	void (*post_release)(struct gendisk *disk);
 };
 =

 #ifdef CONFIG_COMPAT
diff --git a/block/bdev.c b/block/bdev.c
index 8bf93a19041b..0cb638d81a27 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -948,6 +948,8 @@ void blkdev_put(struct block_device *bdev, fmode_t mode)
 	else
 		blkdev_put_whole(bdev, mode);
 	mutex_unlock(&disk->open_mutex);
+	if (bdev->bd_disk->fops->post_release)
+		bdev->bd_disk->fops->post_release(bdev->bd_disk);
 =

 	module_put(disk->fops->owner);
 	blkdev_put_no_open(bdev);
diff --git a/drivers/block/loop.h b/drivers/block/loop.h
index 918a7a2dc025..f2e9f38694dc 100644
--- a/drivers/block/loop.h
+++ b/drivers/block/loop.h
@@ -56,7 +56,7 @@ struct loop_device {
 	struct gendisk		*lo_disk;
 	struct mutex		lo_mutex;
 	bool			idr_visible;
-	struct work_struct      rundown_work;
+	struct task_struct	*rundown_owner; /* current or NULL */
 };
 =

 struct loop_cmd {
diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index b1b05c45c07c..faa3a3097b22 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1165,40 +1165,12 @@ static void __loop_clr_fd(struct loop_device *lo)
 		lo->lo_disk->flags |=3D GENHD_FL_NO_PART;
 =

 	fput(filp);
-}
-
-static void loop_rundown_completed(struct loop_device *lo)
-{
 	mutex_lock(&lo->lo_mutex);
 	lo->lo_state =3D Lo_unbound;
 	mutex_unlock(&lo->lo_mutex);
 	module_put(THIS_MODULE);
 }
 =

-static void loop_rundown_workfn(struct work_struct *work)
-{
-	struct loop_device *lo =3D container_of(work, struct loop_device,
-					      rundown_work);
-	struct block_device *bdev =3D lo->lo_device;
-	struct gendisk *disk =3D lo->lo_disk;
-
-	__loop_clr_fd(lo);
-	kobject_put(&bdev->bd_device.kobj);
-	module_put(disk->fops->owner);
-	loop_rundown_completed(lo);
-}
-
-static void loop_schedule_rundown(struct loop_device *lo)
-{
-	struct block_device *bdev =3D lo->lo_device;
-	struct gendisk *disk =3D lo->lo_disk;
-
-	__module_get(disk->fops->owner);
-	kobject_get(&bdev->bd_device.kobj);
-	INIT_WORK(&lo->rundown_work, loop_rundown_workfn);
-	queue_work(system_long_wq, &lo->rundown_work);
-}
-
 static int loop_clr_fd(struct loop_device *lo)
 {
 	int err;
@@ -1229,7 +1201,6 @@ static int loop_clr_fd(struct loop_device *lo)
 	mutex_unlock(&lo->lo_mutex);
 =

 	__loop_clr_fd(lo);
-	loop_rundown_completed(lo);
 	return 0;
 }
 =

@@ -1754,7 +1725,7 @@ static void lo_release(struct gendisk *disk, fmode_t =
mode)
 		 * In autoclear mode, stop the loop thread
 		 * and remove configuration after last close.
 		 */
-		loop_schedule_rundown(lo);
+		lo->rundown_owner =3D current;
 		return;
 	} else if (lo->lo_state =3D=3D Lo_bound) {
 		/*
@@ -1769,10 +1740,21 @@ static void lo_release(struct gendisk *disk, fmode_=
t mode)
 	mutex_unlock(&lo->lo_mutex);
 }
 =

+static void lo_post_release(struct gendisk *disk)
+{
+	struct loop_device *lo =3D disk->private_data;
+
+	if (lo->rundown_owner !=3D current)
+		return;
+	lo->rundown_owner =3D NULL;
+	__loop_clr_fd(lo);
+}
+
 static const struct block_device_operations lo_fops =3D {
 	.owner =3D	THIS_MODULE,
 	.open =3D		lo_open,
 	.release =3D	lo_release,
+	.post_release =3D lo_post_release,
 	.ioctl =3D	lo_ioctl,
 #ifdef CONFIG_COMPAT
 	.compat_ioctl =3D	lo_compat_ioctl,
-- =

2.32.0

--===============1246266880926778020==--

