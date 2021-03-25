Content-Type: multipart/mixed; boundary="===============0377316510141987302=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] f3344adf38: fxmark.hdd_btrfs_DWAL_63_bufferedio.works/sec -52.4% regression
Date: Thu, 25 Mar 2021 15:34:13 +0800
Message-ID: <20210325073413.GB10158@shbuild999.sh.intel.com>
In-Reply-To: <20210325065142.GA10158@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0377316510141987302==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 25, 2021 at 02:51:42PM +0800, Feng Tang wrote:
> > > Honestly, normally if I were to get a report about "52% regression"
> > > for a commit that is supposed to optimize something, I'd just revert
> > > the commit as a case of "ok, that optimization clearly didn't work".
> > > =

> > > But there is absolutely no sign that this commit is actually the
> > > culprit, or explanation for why that should be, and what could be
> > > going on.
> > > =

> > > So I'm going to treat this as a "bisection failure, possibly due to
> > > random code or data layout changes". Particularly since this seems to
> > > be a 4-socket Xeon Phi machine, which I think is likely a very very
> > > fragile system if there is some odd cache layout issue.
> > =

> > Oliver retested it and made it run 12 times in total, and the data
> > is consistent. We tried some other test:
> > * run other sub cases of this 'fxmark' which sees no regression
> > * change 'btrfs' to 'ext4' of this case, and no regression
> > * test  on Cascadelake platform, no regression
> > =

> > So the bitsection seems to be stable, though can't be explained yet. =

> > =

> > We checked the System map of the 2 kernels, and didn't find obvious
> > code/data alignment change, which is expected, as the commit changes
> > data structure which is usually dynamically allocated. =

> =

> We found with the commit some percpu related ops do have some change,
> as shown in perf
> =

> old kernel
> ----------
>   1.06%     0.69%  [kernel.kallsyms]         [k] __percpu_counter_sum    =
                            -      -
>   1.06% __percpu_counter_sum;need_preemptive_reclaim.part.0;__reserve_byt=
es;btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffe=
red_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_sysc=
all_64;entry_SYSCALL_64_after_hwframe;write
> =

>   89.85%    88.17%  [kernel.kallsyms]         [k] native_queued_spin_lock=
_slowpath                    -      -
>   45.27% native_queued_spin_lock_slowpath;_raw_spin_lock;btrfs_block_rsv_=
release;btrfs_inode_rsv_release;btrfs_buffered_write;btrfs_file_write_iter;=
new_sync_write;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hw=
frame;write
>   44.51% native_queued_spin_lock_slowpath;_raw_spin_lock;__reserve_bytes;=
btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffered=
_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscall=
_64;entry_SYSCALL_64_after_hwframe;write
> =

> =

> new kernel
> ----------
>   1.33%     1.14%  [kernel.kallsyms]         [k] __percpu_counter_sum    =
                                -      -
>   1.33% __percpu_counter_sum;need_preemptive_reclaim.part.0;__reserve_byt=
es;btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffe=
red_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_sysc=
all_64;entry_SYSCALL_64_after_hwframe
> =

>   95.95%    95.31%  [kernel.kallsyms]         [k] native_queued_spin_lock=
_slowpath                        -      -
>   48.56% native_queued_spin_lock_slowpath;_raw_spin_lock;btrfs_block_rsv_=
release;btrfs_inode_rsv_release;btrfs_buffered_write;btrfs_file_write_iter;=
new_sync_write;vfs_write;ksys_write;do_syscall_64;entry_SYSCALL_64_after_hw=
frame
>   47.33% native_queued_spin_lock_slowpath;_raw_spin_lock;__reserve_bytes;=
btrfs_reserve_metadata_bytes;btrfs_delalloc_reserve_metadata;btrfs_buffered=
_write;btrfs_file_write_iter;new_sync_write;vfs_write;ksys_write;do_syscall=
_64;entry_SYSCALL_64_after_hwframe
> =

> __percpu_counter_sum is usually costy for platform with many CPUs and
> it does rise much. It is called in fs/btrfs/space-info.c
> 	need_preemptive_reclaim
> 		ordered =3D percpu_counter_sum_positive(&fs_info->ordered_bytes);
> 	        delalloc =3D percpu_counter_sum_positive(&fs_info->delalloc_byte=
s);
> =

> And we did 2 experiments:
> 1. Change the percpu_counter_sum_positive() to percpu_counter_read_positi=
ve()
>    which skips looping online CPUs to get the sum, inside need_preemptive=
_reclaim(),
>    the regression is gone, and even better

Interestingly, We just got mail from Oliver about btrfs perf's 81.3%
improvement:
https://lore.kernel.org/lkml/20210325055609.GA13061(a)xsang-OptiPlex-9020/

which is from Josef's patch which does the same conversion of functions
of getting percpu counter.

I guess with the patch, this regression will be gone, and several other
old regressions will be gone too (Thanks Josef):
https://lore.kernel.org/lkml/20201104061657.GB15746(a)xsang-OptiPlex-9020/
https://lore.kernel.org/lkml/20210305083757.GF31481(a)xsang-OptiPlex-9020/

Thanks,
Feng

--===============0377316510141987302==--

