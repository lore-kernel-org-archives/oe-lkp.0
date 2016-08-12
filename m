Content-Type: multipart/mixed; boundary="===============2847052384689151576=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 12:23:29 +1000
Message-ID: <20160812022329.GP19025@dastard>
In-Reply-To: <20160812005442.GN19025@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============2847052384689151576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 12, 2016 at 10:54:42AM +1000, Dave Chinner wrote:
> I'm now going to test Christoph's theory that this is an "overwrite
> doing lots of block mapping" issue. More on that to follow.

Ok, so going back to the profiles, I can say it's not an overwrite
issue, because there is delayed allocation showing up in the
profile. Lots of it. Which lead me to think "maybe the benchmark is
just completely *dumb*".

And, as usual, that's the answer. Here's the reproducer:

# sudo mkfs.xfs -f -m crc=3D0 /dev/pmem1
# sudo mount -o noatime /dev/pmem1 /mnt/scratch
# sudo xfs_io -f -c "pwrite 0 512m -b 1" /mnt/scratch/fooey

And here's the profile:

   4.50%  [kernel]  [k] xfs_bmapi_read
   3.64%  [kernel]  [k] __block_commit_write.isra.30
   3.55%  [kernel]  [k] __radix_tree_lookup
   3.46%  [kernel]  [k] up_write
   3.43%  [kernel]  [k] ___might_sleep
   3.09%  [kernel]  [k] entry_SYSCALL_64_fastpath
   3.01%  [kernel]  [k] xfs_iext_bno_to_ext
   3.01%  [kernel]  [k] find_get_entry
   2.98%  [kernel]  [k] down_write
   2.71%  [kernel]  [k] mark_buffer_dirty
   2.52%  [kernel]  [k] __mark_inode_dirty
   2.38%  [kernel]  [k] unlock_page
   2.14%  [kernel]  [k] xfs_break_layouts
   2.07%  [kernel]  [k] xfs_bmapi_update_map
   2.06%  [kernel]  [k] xfs_bmap_search_extents
   2.04%  [kernel]  [k] xfs_iomap_write_delay
   2.00%  [kernel]  [k] generic_write_checks
   1.96%  [kernel]  [k] xfs_bmap_search_multi_extents
   1.90%  [kernel]  [k] __xfs_bmbt_get_all
   1.89%  [kernel]  [k] balance_dirty_pages_ratelimited
   1.82%  [kernel]  [k] wait_for_stable_page
   1.76%  [kernel]  [k] xfs_file_write_iter
   1.68%  [kernel]  [k] xfs_iomap_eof_want_preallocate
   1.68%  [kernel]  [k] xfs_bmapi_delay
   1.67%  [kernel]  [k] iomap_write_actor
   1.60%  [kernel]  [k] xfs_file_buffered_aio_write
   1.56%  [kernel]  [k] __might_sleep
   1.48%  [kernel]  [k] do_raw_spin_lock
   1.44%  [kernel]  [k] generic_write_end
   1.41%  [kernel]  [k] pagecache_get_page
   1.38%  [kernel]  [k] xfs_bmapi_trim_map
   1.21%  [kernel]  [k] __block_write_begin_int
   1.17%  [kernel]  [k] vfs_write
   1.17%  [kernel]  [k] xfs_file_iomap_begin
   1.17%  [kernel]  [k] xfs_bmbt_get_startoff
   1.14%  [kernel]  [k] iomap_apply
   1.08%  [kernel]  [k] xfs_iunlock
   1.08%  [kernel]  [k] iov_iter_copy_from_user_atomic
   0.97%  [kernel]  [k] xfs_file_aio_write_checks
   0.96%  [kernel]  [k] xfs_ilock
.....

Yeah, I'm doing a sequential write in *1 byte pwrite() calls*.

Ok, so the benchmark isn't /quite/ that abysmally stupid. It's
still, ah, extremely challenged:

        if (NBUFSIZE !=3D 1024) { /* enforce known block size */
                fprintf(stderr, "NBUFSIZE changed to %d\n", NBUFSIZE);
                exit(1);
        }

i.e. it's hard coded to do all it's "disk" IO in 1k block sizes.
Every read, every write, every file copy, etc are all done with a
1024 byte buffer. There are lots of loops that look like:

	while (--n) {
		write(fd, nbuf, sizeof nbuf)
	}

where n is the file size specified in the job file. Those loops are
what is generating the profile we see: repeated partial page writes
that extend the file.

IOWs, the benchmark is doing exactly what we document in the fstat()
man page *not to do* as it is will cause inefficient IO patterns:

       The st_blksize field gives the "preferred" blocksize for
       efficient filesystem I/O.  (Writing to a file in smaller
       chunks may cause an inefficient  read-modify-rewrite.)

The smallest we ever set st_blksize to is PAGE_SIZE, so the
benchmark is running well known and documented (at least 10 years
ago) slow paths through the IO stack.  I'm very tempted now simply
to say that the aim7 disk benchmark is showing it's age and as such
the results are not actually reflective of what typical applications
will see.

Christoph, maybe there's something we can do to only trigger
speculative prealloc growth checks if the new file size crosses the end of
the currently allocated block at the EOF. That would chop out a fair
chunk of the xfs_bmapi_read calls being done in this workload. I'm
not sure how much effort we should spend optimising this slow path,
though....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============2847052384689151576==--

