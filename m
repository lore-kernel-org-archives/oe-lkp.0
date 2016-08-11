Content-Type: multipart/mixed; boundary="===============6298546911964457398=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 14:46:09 +1000
Message-ID: <20160811044609.GW16044@dastard>
In-Reply-To: <CA+55aFy=xeEKgfHWisfxsZNqrgMJxvKvhrWrPmdpMxu0pnOXig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6298546911964457398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 06:00:24PM -0700, Linus Torvalds wrote:
> On Wed, Aug 10, 2016 at 5:33 PM, Huang, Ying <ying.huang@intel.com> wro=
te:
> >
> > Here it is,
> =

> Thanks.
> =

> Appended is a munged "after" list, with the "before" values in
> parenthesis. It actually looks fairly similar.
> =

> The biggest difference is that we have "mark_page_accessed()" show up
> after, and not before. There was also a lot of LRU noise in the
> non-profile data. I wonder if that is the reason here: the old model
> of using generic_perform_write/block_page_mkwrite didn't mark the
> pages accessed, and now with iomap_file_buffered_write() they get
> marked as active and that screws up the LRU list, and makes us not
> flush out the dirty pages well (because they are seen as active and
> not good for writeback), and then you get bad memory use.
> =

> I'm not seeing anything that looks like locking-related.

Not in that profile. I've been doing some local testing inside a
4-node fake-numa 16p/16GB RAM VM to see what I can find.
I'm yet to work out how I can trigger a profile like the one that
was reported (I really need to see the event traces), but in the
mean time I found this....

Doing a large sequential single threaded buffered write using a 4k
buffer (so single page per syscall to make the XFS IO path allocator
behave the same way as in 4.7), I'm seeing a CPU profile that
indicates we have a potential mapping->tree_lock issue:

# xfs_io -f -c "truncate 0" -c "pwrite 0 47g" /mnt/scratch/fooey
wrote 50465865728/50465865728 bytes at offset 0
47.000 GiB, 12320768 ops; 0:01:36.00 (499.418 MiB/sec and 127850.9132 ops/s=
ec)

....

  24.15%  [kernel]  [k] _raw_spin_unlock_irqrestore
   9.67%  [kernel]  [k] copy_user_generic_string
   5.64%  [kernel]  [k] _raw_spin_unlock_irq
   3.34%  [kernel]  [k] get_page_from_freelist
   2.57%  [kernel]  [k] mark_page_accessed
   2.45%  [kernel]  [k] do_raw_spin_lock
   1.83%  [kernel]  [k] shrink_page_list
   1.70%  [kernel]  [k] free_hot_cold_page
   1.26%  [kernel]  [k] xfs_do_writepage
   1.21%  [kernel]  [k] __radix_tree_lookup
   1.20%  [kernel]  [k] __wake_up_bit
   0.99%  [kernel]  [k] __block_write_begin_int
   0.95%  [kernel]  [k] find_get_pages_tag
   0.92%  [kernel]  [k] cancel_dirty_page
   0.89%  [kernel]  [k] unlock_page
   0.87%  [kernel]  [k] clear_page_dirty_for_io
   0.85%  [kernel]  [k] xfs_bmap_worst_indlen
   0.84%  [kernel]  [k] xfs_file_buffered_aio_write
   0.81%  [kernel]  [k] delay_tsc
   0.78%  [kernel]  [k] node_dirty_ok
   0.77%  [kernel]  [k] up_write
   0.74%  [kernel]  [k] ___might_sleep
   0.73%  [kernel]  [k] xfs_bmap_add_extent_hole_delay
   0.72%  [kernel]  [k] __fget_light
   0.67%  [kernel]  [k] add_to_page_cache_lru
   0.67%  [kernel]  [k] __slab_free
   0.63%  [kernel]  [k] drop_buffers
   0.59%  [kernel]  [k] down_write
   0.59%  [kernel]  [k] kmem_cache_alloc
   0.58%  [kernel]  [k] iomap_write_actor
   0.53%  [kernel]  [k] page_mapping
   0.52%  [kernel]  [k] entry_SYSCALL_64_fastpath
   0.52%  [kernel]  [k] __mark_inode_dirty
   0.51%  [kernel]  [k] __block_commit_write.isra.30
   0.51%  [kernel]  [k] xfs_file_write_iter
   0.49%  [kernel]  [k] mark_buffer_async_write
   0.47%  [kernel]  [k] balance_dirty_pages_ratelimited
   0.47%  [kernel]  [k] xfs_count_page_state
   0.47%  [kernel]  [k] page_evictable
   0.46%  [kernel]  [k] xfs_vm_releasepage
   0.46%  [kernel]  [k] xfs_iomap_write_delay
   0.46%  [kernel]  [k] do_raw_spin_unlock
   0.44%  [kernel]  [k] xfs_file_iomap_begin
   0.44%  [kernel]  [k] xfs_map_at_offset
   0.42%  [kernel]  [k] xfs_iext_bno_to_ext

There's very little XFS showing up near the top of the profile;
it's all page cache, writeback and spin lock traffic. This is a
dead give-away as to the lock being contended:

-   33.30%     0.01%  [kernel]            [k] kswapd
   - 4.67% kswapd
      - 4.69% shrink_node
         - 4.77% shrink_node_memcg.isra.75
            - 7.38% shrink_inactive_list
               - 6.70% shrink_page_list
                  - 20.02% __remove_mapping
                       19.90% _raw_spin_unlock_irqrestore

I don't think that this is the same as what aim7 is triggering as
there's no XFS write() path allocation functions near the top of the
profile to speak of. Still, I don't recall seeing this before...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============6298546911964457398==--

