Content-Type: multipart/mixed; boundary="===============8120007286174586875=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f3344adf38: fxmark.hdd_btrfs_DWAL_63_bufferedio.works/sec -52.4% regression
Date: Thu, 25 Mar 2021 14:51:42 +0800
Message-ID: <20210325065142.GA10158@shbuild999.sh.intel.com>
In-Reply-To: <20210319032144.GA69344@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8120007286174586875==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

Some updates on this, we found the regression is related with the
percpu stuff change and BTRFS, though the exact relation is unknown yet. =


Some details below.

+ Michal who helped providing useful links for checking it.
+ Josef Bacik, for this is BTRFS related =


On Fri, Mar 19, 2021 at 11:21:44AM +0800, Feng Tang wrote:
> Hi Linus,
> =

> On Mon, Mar 15, 2021 at 01:42:50PM -0700, Linus Torvalds wrote:
> > On Sun, Mar 14, 2021 at 11:30 PM kernel test robot
> > <oliver.sang@intel.com> wrote:

> > > in testcase: fxmark
> > > on test machine: 288 threads Intel(R) Xeon Phi(TM) CPU 7295 @ 1.50GHz=
 with 80G memory
> > =

> > I think this must be some really random memory layout issue that
> > causes some false sharing or similar.
> > =

> > And it's not even that some fundamental data structure gets a
> > different layout, it literally is just either:
> > =

> >  (a) the (now smaller) array is allocated from a differently chunk,
> > and that then causes random cache effects with something else
> > =

> >  (b) the (old, and bigger) array was more spread out, and as a result
> > had different fields in different cachelines and less false sharing
> > =

> > Normally I'd say that (b) is the obvious case, except for the fact
> > that this is a __percpu array.
> > =

> > So in the common case there shouldn't be any cache contention _within_
> > the array itself. Any cache contention should be with something else
> > very hot that the change now randomly makes be in the same cache way
> > or whatever.
> > =

> > Afaik, only the flushing of the vmstats batches does access the percpu
> > arrays from other CPUs, so (b) is not _entirely_ impossible if
> > memcg_flush_percpu_vmstats() were to be very very very hot.
> > =

> > But the profile data doesn't show anything remotely like that.
> > =

> > In fact, the actual report seems to show things improving, ie things
> > like elapsed time going down:
> > =

> > >       1361            -9.5%       1232        fxmark.time.elapsed_time
> > >       1361            -9.5%       1232        fxmark.time.elapsed_tim=
e.max
> > >      25.67            +9.1%      28.00        fxmark.time.percent_of_=
cpu_this_job_got
> > >     343.68            -2.0%     336.76        fxmark.time.system_time
> > >      23.66            +2.5       26.12        mpstat.cpu.all.sys%
> > =

> > but I don't know what the benchmark actually does, so maybe it just
> > repeats things until it hits a certain confidence interval, and thus
> > "elapsed time" is immaterial.
> =

> I just checked the benchmark, seems it benchmarks the filesystem's
> scalability by doing file/inode opertions with different task numbers
> (from 1 to nr_cpus).
> =

> The benchmark has preparation and cleanup steps before/after every
> run, and for the 100 less seconds of 'fxmark.time.elapsed_time' you
> found, it is due to the newer kernel spends 100 seconds more in the
> cleanup step after run ( a point worth checking) =


Yes, the longer running time is because the cleanup ('umount' specifically)
of older kernel takes longer time, as it complets more FS operations. =


And perf-profile info in the original report was not accurate, as the
test tried 72/63/54/45/36/27/18/9/1 tasks, and perf data recorded may
not reflect the "63 tasks" subcase.

> > Honestly, normally if I were to get a report about "52% regression"
> > for a commit that is supposed to optimize something, I'd just revert
> > the commit as a case of "ok, that optimization clearly didn't work".
> > =

> > But there is absolutely no sign that this commit is actually the
> > culprit, or explanation for why that should be, and what could be
> > going on.
> > =

> > So I'm going to treat this as a "bisection failure, possibly due to
> > random code or data layout changes". Particularly since this seems to
> > be a 4-socket Xeon Phi machine, which I think is likely a very very
> > fragile system if there is some odd cache layout issue.
> =

> Oliver retested it and made it run 12 times in total, and the data
> is consistent. We tried some other test:
> * run other sub cases of this 'fxmark' which sees no regression
> * change 'btrfs' to 'ext4' of this case, and no regression
> * test  on Cascadelake platform, no regression
> =

> So the bitsection seems to be stable, though can't be explained yet. =

> =

> We checked the System map of the 2 kernels, and didn't find obvious
> code/data alignment change, which is expected, as the commit changes
> data structure which is usually dynamically allocated. =


We found with the commit some percpu related ops do have some change,
as shown in perf

old kernel
----------
  1.06%     0.69%  [kernel.kallsyms]         [k] __percpu_counter_sum      =
                          -      -
  1.06% __percpu_counter_sum;need_preemptive_reclaim.part.0;__reserve_bytes=
;btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffere=
d_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscal=
l_64;entry_SYSCALL_64_after_hwframe;write

  89.85%    88.17%  [kernel.kallsyms]         [k] native_queued_spin_lock_s=
lowpath                    -      -
  45.27% native_queued_spin_lock_slowpath;_raw_spin_lock;btrfs_block_rsv_re=
lease;btrfs_inode_rsv_release;btrfs_buffered_write;btrfs_file_write_iter;ne=
w_sync_write;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwfr=
ame;write
  44.51% native_queued_spin_lock_slowpath;_raw_spin_lock;__reserve_bytes;bt=
rfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffered_w=
rite;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscall_6=
4;entry_SYSCALL_64_after_hwframe;write


new kernel
----------
  1.33%     1.14%  [kernel.kallsyms]         [k] __percpu_counter_sum      =
                              -      -
  1.33% __percpu_counter_sum;need_preemptive_reclaim.part.0;__reserve_bytes=
;btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffere=
d_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscal=
l_64;entry_SYSCALL_64_after_hwframe

  95.95%    95.31%  [kernel.kallsyms]         [k] native_queued_spin_lock_s=
lowpath                        -      -
  48.56% native_queued_spin_lock_slowpath;_raw_spin_lock;btrfs_block_rsv_re=
lease;btrfs_inode_rsv_release;btrfs_buffered_write;btrfs_file_write_iter;ne=
w_sync_write;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hwfr=
ame
  47.33% native_queued_spin_lock_slowpath;_raw_spin_lock;__reserve_bytes;bt=
rfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffered_w=
rite;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscall_6=
4;entry_SYSCALL_64_after_hwframe

__percpu_counter_sum is usually costy for platform with many CPUs and
it does rise much. It is called in fs/btrfs/space-info.c
	need_preemptive_reclaim
		ordered =3D percpu_counter_sum_positive(&fs_info->ordered_bytes);
	        delalloc =3D percpu_counter_sum_positive(&fs_info->delalloc_bytes);

And we did 2 experiments:
1. Change the percpu_counter_sum_positive() to percpu_counter_read_positive=
()
   which skips looping online CPUs to get the sum, inside need_preemptive_r=
eclaim(),
   the regression is gone, and even better

2. We add some padding to restore the percpu stuff size, the regression
   is also gone.

 struct batched_lruvec_stat {
 	s32 count[NR_VM_NODE_STAT_ITEMS];
+	s32 pad[NR_VM_NODE_STAT_ITEMS];
 };

So we think the regression is related with Muchun's patch and BTRFS.

And another thing I tried is changing the test tasks number from '63' to
'65', and the regression is also gone, and this is something mysterious!

This is only reproduced on a Xeon Phi, which lacks some perf events, so
tool like perf c2c can't be run to pin-point some data or text. =


Thanks,
Feng
--===============8120007286174586875==--

