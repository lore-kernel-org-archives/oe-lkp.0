Content-Type: multipart/mixed; boundary="===============6668961620186012201=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@suse.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 3a8b36f3780: -62.6% fileio.requests_per_sec
Date: Tue, 31 Mar 2015 15:59:48 +0100
Message-ID: <551AB664.4080303@suse.com>
In-Reply-To: <1427790767.17170.95.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6668961620186012201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 03/31/2015 09:32 AM, Huang Ying wrote:
> Hi, Filipe,
> =

> On Wed, 2015-03-18 at 10:05 +0000, Filipe Manana wrote:
> [snip]
> =

>> Hi, thanks for this.
>>
>> However this doesn't make sense to me.
>> This commit only touches btrfs' fsync handler and the test uses sysbench
>> without passing --file-fsync-freq to it, which means sysbench will never
>> do fsyncs according to its man page (default for fsync frequency is 0).
>>
>> Or maybe I missed something?
> =

> Sorry for late.
> =

> I checked source code of sysbench and found that the actual default
> value of --file-fsync-freq is 100 instead of 0 in man page, as in the
> following lines.
> =

>   {"file-fsync-freq", "do fsync() after this number of requests (0 - don'=
t use fsync())",
>    SB_ARG_TYPE_INT, "100"},
> =

> I double checked that via a debug patch to sysbench too.

Ok, thanks for checking that.
What the 100 means is that an fsync is done after every 100 requests
(both writes and reads I assume).

The patch removed an optimization where we would not do any IO if no new
data was written to the file between 2 consecutive fsync requests and if
a btrfs transaction was committed between the 2 fsync requests as well
(by default it happens about every 30 seconds, changeable with -o
commit=3Dxx). Which I think it's a rare/uncommon scenario.

With that optimization removed, the inode's metadata data is always
synced to disk

I've just tested on kvm guest with a debug kernel and got similar
decrease of file io requests as you reported.

The following brought back the performance for me (without reverting the
data loss fix from 3a8b36f37806 of course). Can you give it a try? =

Thanks.


From: Filipe Manana <fdmanana@suse.com>
Date: Tue, 31 Mar 2015 14:16:52 +0100
Subject: [PATCH] Btrfs: avoid syncing log in the fast fsync path when not
 necessary

Commit 3a8b36f37806 ("Btrfs: fix data loss in the fast fsync path") added
a performance regression for that causes an unnecessary sync of the log
trees (fs/subvol and root log trees) when 2 consecutive fsyncs are done
against a file, without no writes or any metadata updates to the inode in
between them and if a transaction is committed before the second fsync is
called.

Huang Ying reported this to lkml after a test sysbench test that measured
a -62% decrease of file io requests for that tests' workload.

The test is:

  echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
  echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
  echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
  echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
  mkfs -t btrfs /dev/sda2
  mount -t btrfs /dev/sda2 /fs/sda2
  cd /fs/sda2
  for ((i =3D 0; i < 1024; i++)); do fallocate -l 67108864 testfile.$i; done
  sysbench --test=3Dfileio --max-requests=3D0 --num-threads=3D4 --max-time=
=3D600 \
    --file-test-mode=3Drndwr --file-total-size=3D68719476736 --file-io-mode=
=3Dsync \
    --file-num=3D1024 run

A test on kvm guest, running a debug kernel gave me the following results:

Without 3a8b36f378060d:             16.01 reqs/sec
With 3a8b36f378060d:                 3.39 reqs/sec
With 3a8b36f378060d and this patch: 16.04 reqs/sec

Reported-by: Huang Ying <ying.huang@intel.com>
Signed-off-by: Filipe Manana <fdmanana@suse.com>
---
 fs/btrfs/file.c         |  9 ++++++---
 fs/btrfs/ordered-data.c | 14 ++++++++++++++
 fs/btrfs/ordered-data.h |  3 +++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index 309dd57..379275c 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -1878,6 +1878,7 @@ int btrfs_sync_file(struct file *file, loff_t start, =
loff_t end, int datasync)
 	struct btrfs_log_ctx ctx;
 	int ret =3D 0;
 	bool full_sync =3D 0;
+	const u64 len =3D end - start + 1;
 =

 	trace_btrfs_sync_file(file, datasync);
 =

@@ -1906,7 +1907,7 @@ int btrfs_sync_file(struct file *file, loff_t start, =
loff_t end, int datasync)
 		 * all extents are persisted and the respective file extent
 		 * items are in the fs/subvol btree.
 		 */
-		ret =3D btrfs_wait_ordered_range(inode, start, end - start + 1);
+		ret =3D btrfs_wait_ordered_range(inode, start, len);
 	} else {
 		/*
 		 * Start any new ordered operations before starting to log the
@@ -1978,8 +1979,10 @@ int btrfs_sync_file(struct file *file, loff_t start,=
 loff_t end, int datasync)
 	 */
 	smp_mb();
 	if (btrfs_inode_in_log(inode, root->fs_info->generation) ||
-	    (full_sync && BTRFS_I(inode)->last_trans <=3D
-	     root->fs_info->last_trans_committed)) {
+	    (BTRFS_I(inode)->last_trans <=3D
+	     root->fs_info->last_trans_committed &&
+	     (full_sync ||
+	      !btrfs_have_ordered_extents_in_range(inode, start, len)))) {
 		/*
 		 * We'v had everything committed since the last time we were
 		 * modified so clear this flag in case it was set for whatever
diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
index 157cc54..72b6f0d 100644
--- a/fs/btrfs/ordered-data.c
+++ b/fs/btrfs/ordered-data.c
@@ -838,6 +838,20 @@ out:
 	return entry;
 }
 =

+bool btrfs_have_ordered_extents_in_range(struct inode *inode,
+					 u64 file_offset,
+					 u64 len)
+{
+	struct btrfs_ordered_extent *oe;
+
+	oe =3D btrfs_lookup_ordered_range(inode, file_offset, len);
+	if (oe) {
+		btrfs_put_ordered_extent(oe);
+		return true;
+	}
+	return false;
+}
+
 /*
  * lookup and return any extent before 'file_offset'.  NULL is returned
  * if none is found
diff --git a/fs/btrfs/ordered-data.h b/fs/btrfs/ordered-data.h
index e96cd4c..9ba7209 100644
--- a/fs/btrfs/ordered-data.h
+++ b/fs/btrfs/ordered-data.h
@@ -191,6 +191,9 @@ btrfs_lookup_first_ordered_extent(struct inode * inode,=
 u64 file_offset);
 struct btrfs_ordered_extent *btrfs_lookup_ordered_range(struct inode *inod=
e,
 							u64 file_offset,
 							u64 len);
+bool btrfs_have_ordered_extents_in_range(struct inode *inode,
+					 u64 file_offset,
+					 u64 len);
 int btrfs_ordered_update_i_size(struct inode *inode, u64 offset,
 				struct btrfs_ordered_extent *ordered);
 int btrfs_find_ordered_sum(struct inode *inode, u64 offset, u64 disk_byten=
r,
-- =

2.1.3





--===============6668961620186012201==--

