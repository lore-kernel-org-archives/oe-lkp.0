Content-Type: multipart/mixed; boundary="===============7732562786249679421=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 11:16:12 +1000
Message-ID: <20160811011612.GT16044@dastard>
In-Reply-To: <8760r816wf.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7732562786249679421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 05:33:20PM -0700, Huang, Ying wrote:
> Linus Torvalds <torvalds@linux-foundation.org> writes:
> =

> > On Wed, Aug 10, 2016 at 5:11 PM, Huang, Ying <ying.huang@intel.com> w=
rote:
> >>
> >> Here is the comparison result with perf-profile data.
> >
> > Heh. The diff is actually harder to read than just showing A/B
> > state.The fact that the call chain shows up as part of the symbol
> > makes it even more so.
> >
> > For example:
> >
> >>       0.00 =C2=B1 -1%      +Inf%       1.68 =C2=B1  1%  perf-profile.c=
ycles-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_pag=
e.grab_cache_page_write_begin.iomap_write_begin
> >>       1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.c=
ycles-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_pag=
e.grab_cache_page_write_begin.xfs_vm_write_begin
> >
> > Ok, so it went from 1.8% to 1.68%, and isn't actually that big of a
> > change, but it shows up as a big change because the caller changed
> > from xfs_vm_write_begin to iomap_write_begin.
> >
> > There's a few other cases of that too.
> >
> > So I think it would actually be easier to just see "what 20 functions
> > were the hottest" (or maybe 50) before and after separately (just
> > sorted by cycles), without the diff part. Because the diff is really
> > hard to read.
> =

> Here it is,
> =

> Before:
> =

>   "perf-profile.func.cycles-pp.intel_idle": 16.88,
>   "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.94,
>   "perf-profile.func.cycles-pp.memset_erms": 3.26,
>   "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 2.47,
>   "perf-profile.func.cycles-pp.___might_sleep": 2.33,
>   "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.88,
>   "perf-profile.func.cycles-pp.unlock_page": 1.69,
>   "perf-profile.func.cycles-pp.up_write": 1.61,
>   "perf-profile.func.cycles-pp.__block_write_begin_int": 1.56,
>   "perf-profile.func.cycles-pp.down_write": 1.55,
>   "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.53,
>   "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 1.47,
>   "perf-profile.func.cycles-pp.generic_write_end": 1.36,
>   "perf-profile.func.cycles-pp.generic_perform_write": 1.33,
>   "perf-profile.func.cycles-pp.__radix_tree_lookup": 1.32,
>   "perf-profile.func.cycles-pp.__might_sleep": 1.26,
>   "perf-profile.func.cycles-pp._raw_spin_lock": 1.17,
>   "perf-profile.func.cycles-pp.vfs_write": 1.14,
>   "perf-profile.func.cycles-pp.__xfs_get_blocks": 1.07,

Ok, so that is the old block mapping call in the buffered IO path.
I don't see any of the functions it calls in the profile;
specifically xfs_bmapi_read(), and xfs_iomap_write_delay(), so it
appears the extent mapping and allocation overhead on the old code
totals somewhere under 2-3% of the entire CPU usage.

>   "perf-profile.func.cycles-pp.xfs_file_write_iter": 1.03,
>   "perf-profile.func.cycles-pp.pagecache_get_page": 1.03,
>   "perf-profile.func.cycles-pp.native_queued_spin_lock_slowpath": 0.98,
>   "perf-profile.func.cycles-pp.get_page_from_freelist": 0.94,
>   "perf-profile.func.cycles-pp.rwsem_spin_on_owner": 0.94,
>   "perf-profile.func.cycles-pp.__vfs_write": 0.87,
>   "perf-profile.func.cycles-pp.iov_iter_copy_from_user_atomic": 0.87,
>   "perf-profile.func.cycles-pp.xfs_file_buffered_aio_write": 0.84,
>   "perf-profile.func.cycles-pp.find_get_entry": 0.79,
>   "perf-profile.func.cycles-pp._raw_spin_lock_irqsave": 0.78,
> =

> =

> After:
> =

>   "perf-profile.func.cycles-pp.intel_idle": 16.82,
>   "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.27,
>   "perf-profile.func.cycles-pp.memset_erms": 2.6,
>   "perf-profile.func.cycles-pp.xfs_bmapi_read": 2.24,

Straight away - thats' at least 3x more overhead block mapping lookups
with the iomap code.

>   "perf-profile.func.cycles-pp.___might_sleep": 2.04,
>   "perf-profile.func.cycles-pp.mark_page_accessed": 1.93,
>   "perf-profile.func.cycles-pp.__block_write_begin_int": 1.78,
>   "perf-profile.func.cycles-pp.up_write": 1.72,
>   "perf-profile.func.cycles-pp.xfs_iext_bno_to_ext": 1.7,

Plus this child.

>   "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 1.65,
>   "perf-profile.func.cycles-pp.down_write": 1.51,
>   "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.51,
>   "perf-profile.func.cycles-pp.unlock_page": 1.43,
>   "perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents": 1.25,
>   "perf-profile.func.cycles-pp.xfs_bmap_search_extents": 1.23,

And these two.

>   "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.21,
>   "perf-profile.func.cycles-pp.xfs_iomap_write_delay": 1.19,
>   "perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.constprop.8=
": 1.15,

And these two.

So, essentially the old code had maybe 2-3% cpu usage overhead in
the block mapping path on this workload, but the new code is, for
some reason, showing at least 8-9% CPU usage overhead. That, right
now, makes no sense at all to me as we should be doing - at worst -
exactly the same number of block mapping calls as the old code.

We need to know what is happening that is different - there's a good
chance the mapping trace events will tell us. Huang, can you get
a raw event trace from the test?

I need to see these events:

	xfs_file*
	xfs_iomap*
	xfs_get_block*

For both kernels. An example trace from 4.8-rc1 running the command
`xfs_io -f -c 'pwrite 0 512k -b 128k' /mnt/scratch/fooey doing an
overwrite and extend of the existing file ends up looking like:

$ sudo trace-cmd start -e xfs_iomap\* -e xfs_file\* -e xfs_get_blocks\*
$ sudo cat /sys/kernel/tracing/trace_pipe
           <...>-2946  [001] .... 253971.750304: xfs_file_ioctl: dev 253:32=
 ino 0x84
          xfs_io-2946  [001] .... 253971.750938: xfs_file_buffered_write: d=
ev 253:32 ino 0x84 size 0x40000 offset 0x0 count 0x20000
          xfs_io-2946  [001] .... 253971.750961: xfs_iomap_found: dev 253:3=
2 ino 0x84 size 0x40000 offset 0x0 count 131072 type invalid startoff 0x0 s=
tartblock 24 blockcount 0x60
          xfs_io-2946  [001] .... 253971.751114: xfs_file_buffered_write: d=
ev 253:32 ino 0x84 size 0x40000 offset 0x20000 count 0x20000
          xfs_io-2946  [001] .... 253971.751128: xfs_iomap_found: dev 253:3=
2 ino 0x84 size 0x40000 offset 0x20000 count 131072 type invalid startoff 0=
x0 startblock 24 blockcount 0x60
          xfs_io-2946  [001] .... 253971.751234: xfs_file_buffered_write: d=
ev 253:32 ino 0x84 size 0x40000 offset 0x40000 count 0x20000
          xfs_io-2946  [001] .... 253971.751236: xfs_iomap_found: dev 253:3=
2 ino 0x84 size 0x40000 offset 0x40000 count 131072 type invalid startoff 0=
x0 startblock 24 blockcount 0x60
          xfs_io-2946  [001] .... 253971.751381: xfs_file_buffered_write: d=
ev 253:32 ino 0x84 size 0x40000 offset 0x60000 count 0x20000
          xfs_io-2946  [001] .... 253971.751415: xfs_iomap_prealloc_size: d=
ev 253:32 ino 0x84 prealloc blocks 128 shift 0 m_writeio_blocks 16
          xfs_io-2946  [001] .... 253971.751425: xfs_iomap_alloc: dev 253:3=
2 ino 0x84 size 0x40000 offset 0x60000 count 131072 type invalid startoff 0=
x60 startblock -1 blockcount 0x90

That's the output I need for the complete test - you'll need to use
a better recording mechanism that this (e.g. trace-cmd record,
trace-cmd report) because it will generate a lot of events. Compress
the two report files (they'll be large) and send them to me offlist.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============7732562786249679421==--

