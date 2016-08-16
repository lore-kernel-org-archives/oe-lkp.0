Content-Type: multipart/mixed; boundary="===============1551484214599314436=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 20:20:30 +0800
Message-ID: <20160816122030.GA3400@wfg-t540p.sh.intel.com>
In-Reply-To: <20160815212240.GZ19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============1551484214599314436==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 07:22:40AM +1000, Dave Chinner wrote:
>On Mon, Aug 15, 2016 at 10:14:55PM +0800, Fengguang Wu wrote:
>> Hi Christoph,
>>
>> On Sun, Aug 14, 2016 at 06:17:24PM +0200, Christoph Hellwig wrote:
>> >Snipping the long contest:
>> >
>> >I think there are three observations here:
>> >
>> >(1) removing the mark_page_accessed (which is the only significant
>> >    change in the parent commit)  hurts the
>> >    aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44 test.
>> >    I'd still rather stick to the filemap version and let the
>> >    VM people sort it out.  How do the numbers for this test
>> >    look for XFS vs say ext4 and btrfs?
>> >(2) lots of additional spinlock contention in the new case.  A quick
>> >    check shows that I fat-fingered my rewrite so that we do
>> >    the xfs_inode_set_eofblocks_tag call now for the pure lookup
>> >    case, and pretty much all new cycles come from that.
>> >(3) Boy, are those xfs_inode_set_eofblocks_tag calls expensive, and
>> >    we're already doing way to many even without my little bug above.
>> >
>> >So I've force pushed a new version of the iomap-fixes branch with
>> >(2) fixed, and also a little patch to xfs_inode_set_eofblocks_tag a
>> >lot less expensive slotted in before that.  Would be good to see
>> >the numbers with that.
>>
>> The aim7 1BRD tests finished and there are ups and downs, with overall
>> performance remain flat.
>>
>> 99091700659f4df9  74a242ad94d13436a1644c0b45  bf4dc6e4ecc2a3d042029319bc=
  testcase/testparams/testbox
>> ----------------  --------------------------  --------------------------=
  ---------------------------
>
>What do these commits refer to, please? They mean nothing without
>the commit names....
>
>/me goes searching. Ok:
>
>99091700659 is the top of Linus' tree
>74a242ad94d is ????

That's the below one's parent commit, 74a242ad94d ("xfs: make
xfs_inode_set_eofblocks_tag cheaper for the common case").

Typically we'll compare a commit with its parent commit, and/or
the branch's base commit, which is normally on mainline kernel.

>bf4dc6e4ecc is the latest in Christoph's tree (because it's
>		mentioned below)
>
>>         %stddev     %change         %stddev     %change         %stddev
>>             \          |                \          |
>> \     159926                      157324                      158574
>> GEO-MEAN aim7.jobs-per-min
>>     70897               5%      74137               4%      73775       =
 aim7/1BRD_48G-xfs-creat-clo-1500-performance/ivb44
>>    485217 =C2=B1  3%                492431                      477533  =
      aim7/1BRD_48G-xfs-disk_rd-9000-performance/ivb44
>>    360451             -19%     292980             -17%     299377       =
 aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
>
>So, why does random read go backwards by 20%? The iomap IO path
>patches we are testing only affect the write path, so this
>doesn't make a whole lot of sense.
>
>>    338114                      338410               5%     354078       =
 aim7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44
>>     60130 =C2=B1  5%         4%      62438               5%      62923  =
      aim7/1BRD_48G-xfs-disk_src-3000-performance/ivb44
>>    403144                      397790                      410648       =
 aim7/1BRD_48G-xfs-disk_wrt-3000-performance/ivb44
>
>And this is the test the original regression was reported for:
>
>gcc-6/performance/profile/1BRD_48G/xfs/x86_64-rhel/3000/debian-x86_64-2015=
-02-07.cgz/ivb44/disk_wrt/aim7
>
>And that shows no improvement at all. The orginal regression was:
>
>	484435 =C2=B1  0%     -13.3%     420004 =C2=B1  0%  aim7.jobs-per-min
>
>So it's still 15% down on the orginal performance which, again,
>doesn't make a whole lot of sense given the improvement in so many
>other tests I've run....

Yes, same performance with 4.8-rc1 means the regression is still not
back comparing to the original reported first-bad-commit's parent
f0c6bcba74ac51cb ("xfs: reorder zeroing and flushing sequence in
truncate") which is on 4.7-rc1. =


>>     26327                       26534                       26128       =
 aim7/1BRD_48G-xfs-sync_disk_rw-600-performance/ivb44
>>
>> The new commit bf4dc6e ("xfs: rewrite and optimize the delalloc write
>> path") improves the aim7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44
>> case by 5%. Here are the detailed numbers:
>>
>> aim7/1BRD_48G-xfs-disk_rw-3000-performance/ivb44
>
>Not important at all. We need the results for the disk_wrt regression
>we are chasing (disk_wrt-3000) so we can see how the code change
>affected behaviour.

Yeah it may not relevant to this case study, however should help
evaluate the patch in a more complete way.

>> Here are the detailed numbers for the slowed down case:
>>
>> aim7/1BRD_48G-xfs-disk_rr-3000-performance/ivb44
>>
>> 99091700659f4df9  bf4dc6e4ecc2a3d042029319bc
>> ----------------  --------------------------
>>         %stddev      change         %stddev
>>             \          |                \
>>    360451             -17%     299377        aim7.jobs-per-min
>>     12806             481%      74447        aim7.time.involuntary_conte=
xt_switches
>.....
>>     19377             459%     108364        vmstat.system.cs
>.....
>>       487 =C2=B1 89%      3e+04      26448 =C2=B1 57%  latency_stats.max=
.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans=
_read_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_fr=
ee_extent_fix_freelist.xfs_free_extent.xfs_trans_free_extent
>>      1823 =C2=B1 82%      2e+06    1913796 =C2=B1 38%  latency_stats.sum=
.down.xfs_buf_lock._xfs_buf_find.xfs_buf_get_map.xfs_buf_read_map.xfs_trans=
_read_buf_map.xfs_read_agf.xfs_alloc_read_agf.xfs_alloc_fix_freelist.xfs_fr=
ee_extent_fix_freelist.xfs_free_extent.xfs_trans_free_extent
>>    208475 =C2=B1 43%      1e+06    1409494 =C2=B1  5%  latency_stats.sum=
.wait_on_page_bit.truncate_inode_pages_range.truncate_inode_pages_final.evi=
ct.iput.dentry_unlink_inode.__dentry_kill.dput.__fput.____fput.task_work_ru=
n.exit_to_usermode_loop
>>      6884 =C2=B1 73%      8e+04      90790 =C2=B1  9%  latency_stats.sum=
.call_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.xfs_tran=
s_commit.xfs_vn_update_time.file_update_time.xfs_file_aio_write_checks.xfs_=
file_buffered_aio_write.xfs_file_write_iter.__vfs_write.vfs_write.SyS_write
>>      1598 =C2=B1 20%      3e+04      35015 =C2=B1 27%  latency_stats.sum=
.call_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tr=
ans_roll.xfs_trans_roll.xfs_itruncate_extents.xfs_free_eofblocks.xfs_releas=
e.xfs_file_release.__fput.____fput.task_work_run
>>      2006 =C2=B1 25%      3e+04      31143 =C2=B1 35%  latency_stats.sum=
.call_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tr=
ans_roll.xfs_trans_roll.xfs_itruncate_extents.xfs_inactive_truncate.xfs_ina=
ctive.xfs_fs_destroy_inode.destroy_inode.evict.iput
>>        29 =C2=B1101%      1e+04      10214 =C2=B1 29%  latency_stats.sum=
.call_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.__xfs_tr=
ans_roll.xfs_trans_roll.xfs_defer_trans_roll.xfs_defer_finish.xfs_itruncate=
_extents.xfs_inactive_truncate.xfs_inactive.xfs_fs_destroy_inode.destroy_in=
ode
>>      1206 =C2=B1 51%      9e+03       9919 =C2=B1 25%  latency_stats.sum=
.call_rwsem_down_read_failed.xfs_log_commit_cil.__xfs_trans_commit.xfs_tran=
s_commit.xfs_vn_update_time.touch_atime.generic_file_read_iter.xfs_file_buf=
fered_aio_read.xfs_file_read_iter.__vfs_read.vfs_read.SyS_read
>
>Significant increase in blocking delays in the journal during atime
>updates. There's nothing in Christoph's tree that would affect that
>behaviour.  This smells like either a mount option change or
>individual tests not being 100% isolated and the previous test run
>is affecting this one?

We kexec reboot machines between tests to make sure zero influence
from previous test. The test jobs are queued in a batch and not
likely to change mount option etc. in between (just confirmed).

The kernels are build by a random build server and some builds will
reuse previous .o files (no distclean). To make sure I rebuilt the
kernels in the same build server with distclean. However new tests
still show the same numbers.

Thanks,
Fengguang

--===============1551484214599314436==--

