Content-Type: multipart/mixed; boundary="===============1990840311729065940=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 16:04:33 +1000
Message-ID: <20160812060433.GS19025@dastard>
In-Reply-To: <CA+55aFyed_pvUwCXSgyqvOa6VCkuE-qgFPi0CRqcnOWuXiAECQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1990840311729065940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 10:02:39PM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2016 at 9:16 PM, Dave Chinner <david@fromorbit.com> wro=
te:
> >
> > That's why running aim7 as your "does the filesystem scale"
> > benchmark is somewhat irrelevant to scaling applications on high
> > performance systems these days
> =

> Yes, don't get me wrong - I'm not at all trying to say that AIM7 is a
> good benchmark. It's just that I think what it happens to test is
> still meaningful, even if it's not necessarily in any way some kind of
> "high performance IO" thing.
> =

> There are probably lots of other more important loads, I just reacted
> to Christoph seeming to argue that the AIM7 behavior was _so_ broken
> that we shouldn't even care. It's not _that_ broken, it's just not
> about high-performance IO streaming, it happens to test something else
> entirely.

Right - I admit that my first reaction once I worked out what the
problem was is exactly what Christoph said. But after looking at it
further, regardless of how crappy the benchmark it, it is a
regression....

> We've actually had AIM7 occasionally find other issues just because
> some of the things it does is so odd.

*nod*

> And let's face it, user programs doing odd and not very efficient
> things should be considered par for the course. We're never going to
> get rid of insane user programs, so we might as well fix the
> performance problems even when we say "that's just stupid".

Yup, that's what I'm doing :/

It looks like the underlying cause is that the old block mapping
code only fed filesystem block size lengths into
xfs_iomap_write_delay(), whereas the iomap code is feeding the
(capped) write() length into it. Hence xfs_iomap_write_delay() is
not detecting the need for speculative preallocation correctly on
these sub-block writes. The profile looks better for the 1 byte
write - I've combined the old and new for comparison below:

	4.22%		__block_commit_write.isra.30
	3.80%		up_write
	3.74%		xfs_bmapi_read
	3.65%		___might_sleep
	3.55%		down_write
	3.20%		entry_SYSCALL_64_fastpath
	3.02%		mark_buffer_dirty
	2.78%		__mark_inode_dirty
	2.78%		unlock_page
	2.59%		xfs_break_layouts
	2.47%		xfs_iext_bno_to_ext
	2.38%		__block_write_begin_int
	2.22%		find_get_entry
	2.17%		xfs_file_write_iter
	2.16%		__radix_tree_lookup
	2.13%		iomap_write_actor
	2.04%		xfs_bmap_search_extents
	1.98%		__might_sleep
	1.84%		xfs_file_buffered_aio_write
	1.76%		iomap_apply
	1.71%		generic_write_end
	1.68%		vfs_write
	1.66%		iov_iter_copy_from_user_atomic
	1.56%		xfs_bmap_search_multi_extents
	1.55%		__vfs_write
	1.52%		pagecache_get_page
	1.46%		xfs_bmapi_update_map
	1.33%		xfs_iunlock
	1.32%		xfs_iomap_write_delay
	1.29%		xfs_file_iomap_begin
	1.29%		do_raw_spin_lock
	1.29%		__xfs_bmbt_get_all
	1.21%		iov_iter_advance
	1.20%		xfs_file_aio_write_checks
	1.14%		xfs_ilock
	1.11%		balance_dirty_pages_ratelimited
	1.10%		xfs_bmapi_trim_map
	1.06%		xfs_iomap_eof_want_preallocate
	1.00%		xfs_bmapi_delay

Comparison of common functions:

Old	New		function
4.50%	3.74%		xfs_bmapi_read
3.64%	4.22%		__block_commit_write.isra.30
3.55%	2.16%		__radix_tree_lookup
3.46%	3.80%		up_write
3.43%	3.65%		___might_sleep
3.09%	3.20%		entry_SYSCALL_64_fastpath
3.01%	2.47%		xfs_iext_bno_to_ext
3.01%	2.22%		find_get_entry
2.98%	3.55%		down_write
2.71%	3.02%		mark_buffer_dirty
2.52%	2.78%		__mark_inode_dirty
2.38%	2.78%		unlock_page
2.14%	2.59%		xfs_break_layouts
2.07%	1.46%		xfs_bmapi_update_map
2.06%	2.04%		xfs_bmap_search_extents
2.04%	1.32%		xfs_iomap_write_delay
2.00%	0.38%		generic_write_checks
1.96%	1.56%		xfs_bmap_search_multi_extents
1.90%	1.29%		__xfs_bmbt_get_all
1.89%	1.11%		balance_dirty_pages_ratelimited
1.82%	0.28%		wait_for_stable_page
1.76%	2.17%		xfs_file_write_iter
1.68%	1.06%		xfs_iomap_eof_want_preallocate
1.68%	1.00%		xfs_bmapi_delay
1.67%	2.13%		iomap_write_actor
1.60%	1.84%		xfs_file_buffered_aio_write
1.56%	1.98%		__might_sleep
1.48%	1.29%		do_raw_spin_lock
1.44%	1.71%		generic_write_end
1.41%	1.52%		pagecache_get_page
1.38%	1.10%		xfs_bmapi_trim_map
1.21%	2.38%		__block_write_begin_int
1.17%	1.68%		vfs_write
1.17%	1.29%		xfs_file_iomap_begin

This shows more time spent in functions above xfs_file_iomap_begin
(which does the block mapping and allocation) and less time spent
below it. i.e. the generic functions as showing higher CPU usage
and the xfs* functions are showing signficantly reduced CPU usage.
This implies that we're doing a lot less block mapping work....

lkp-folk: the patch I've just tested it attached below - can you
feed that through your test and see if it fixes the regression?

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

xfs: correct speculative prealloc on extending subpage writes

From: Dave Chinner <dchinner@redhat.com>

When a write occurs that extends the file, we check to see if we
need to preallocate more delalloc space.  When we do sub-page
writes, the new iomap write path passes a sub-block write length to
the block mapping code.  xfs_iomap_write_delay does not expect to be
pased byte counts smaller than one filesystem block, so it ends up
checking the BMBT on for blocks beyond EOF on every write,
regardless of whether we need to or not. This causes a regression in
aim7 benchmarks as it is full of sub-page writes.

To fix this, clamp the minimum length of a mapping request coming
through xfs_file_iomap_begin() to one filesystem block. This ensures
we are passing the same length to xfs_iomap_write_delay() as we did
when calling through the get_blocks path. This substantially reduces
the amount of lookup load being placed on the BMBT during sub-block
write loads.

Signed-off-by: Dave Chinner <dchinner@redhat.com>
---
 fs/xfs/xfs_iomap.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
index cf697eb..486b75b 100644
--- a/fs/xfs/xfs_iomap.c
+++ b/fs/xfs/xfs_iomap.c
@@ -1036,10 +1036,15 @@ xfs_file_iomap_begin(
 		 * number pulled out of thin air as a best guess for initial
 		 * testing.
 		 *
+		 * xfs_iomap_write_delay() only works if the length passed in is
+		 * >=3D one filesystem block. Hence we need to clamp the minimum
+		 * length we map, too.
+		 *
 		 * Note that the values needs to be less than 32-bits wide until
 		 * the lower level functions are updated.
 		 */
 		length =3D min_t(loff_t, length, 1024 * PAGE_SIZE);
+		length =3D max_t(loff_t, length, (1 << inode->i_blkbits));
 		if (xfs_get_extsz_hint(ip)) {
 			/*
 			 * xfs_iomap_write_direct() expects the shared lock. It

--===============1990840311729065940==--

