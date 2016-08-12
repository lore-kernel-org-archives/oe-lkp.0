Content-Type: multipart/mixed; boundary="===============2091303548049310329=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Fri, 12 Aug 2016 10:54:42 +1000
Message-ID: <20160812005442.GN19025@dastard>
In-Reply-To: <CA+55aFyVqdk0p6pmEx_gOs_AiH0TJ23ZEUDZHc9kiFbqEk8UOw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2091303548049310329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 09:55:33AM -0700, Linus Torvalds wrote:
> On Thu, Aug 11, 2016 at 8:57 AM, Christoph Hellwig <hch@lst.de> wrote:
> >
> > The one liner below (not tested yet) to simply remove it should fix that
> > up.  I also noticed we have a spurious pagefault_disable/enable, I
> > need to dig into the history of that first, though.
> =

> Hopefully the pagefault_disable/enable doesn't matter for this case.
> =

> Can we get this one-liner tested with the kernel robot for comparison?
> I really think a messed-up LRU list could cause bad IO patterns, and
> end up keeping dirty pages around that should be streaming out to disk
> and re-used, so causing memory pressure etc for no good reason.
> =

> I think the mapping->tree_lock issue that Dave sees is interesting
> too, but the kswapd activity (and the extra locking it causes) could
> also be a symptom of the same thing - memory pressure due to just
> putting pages in the active file that simply shouldn't be there.

So, removing mark_page_accessed() made the spinlock contention
*worse*.

  36.51%  [kernel]  [k] _raw_spin_unlock_irqrestore
   6.27%  [kernel]  [k] copy_user_generic_string
   3.73%  [kernel]  [k] _raw_spin_unlock_irq
   3.55%  [kernel]  [k] get_page_from_freelist
   1.97%  [kernel]  [k] do_raw_spin_lock  =

   1.72%  [kernel]  [k] __block_commit_write.isra.30
   1.44%  [kernel]  [k] __wake_up_bit
   1.41%  [kernel]  [k] shrink_page_list  =

   1.24%  [kernel]  [k] __radix_tree_lookup
   1.03%  [kernel]  [k] xfs_log_commit_cil
   0.99%  [kernel]  [k] free_hot_cold_page
   0.96%  [kernel]  [k] end_buffer_async_write
   0.95%  [kernel]  [k] delay_tsc
   0.94%  [kernel]  [k] ___might_sleep
   0.93%  [kernel]  [k] kmem_cache_alloc
   0.90%  [kernel]  [k] unlock_page
   0.82%  [kernel]  [k] kmem_cache_free
   0.74%  [kernel]  [k] up_write
   0.72%  [kernel]  [k] node_dirty_ok
   0.66%  [kernel]  [k] clear_page_dirty_for_io
   0.65%  [kernel]  [k] __mark_inode_dirty
   0.64%  [kernel]  [k] __block_write_begin_int
   0.58%  [kernel]  [k] xfs_inode_item_format
   0.57%  [kernel]  [k] __memset
   0.57%  [kernel]  [k] cancel_dirty_page
   0.56%  [kernel]  [k] down_write
   0.54%  [kernel]  [k] page_evictable
   0.53%  [kernel]  [k] page_mapping
   0.52%  [kernel]  [k] __slab_free
   0.49%  [kernel]  [k] xfs_do_writepage
   0.49%  [kernel]  [k] drop_buffers

-   41.82%    41.82%  [kernel]            [k] _raw_spin_unlock_irqrestore
   - 35.93% ret_from_fork
      - kthread
         - 29.76% kswapd
              shrink_node
              shrink_node_memcg.isra.75
              shrink_inactive_list
              shrink_page_list
              __remove_mapping
              _raw_spin_unlock_irqrestore
         - 7.13% worker_thread
            - process_one_work
               - 4.40% wb_workfn
                    wb_writeback
                    __writeback_inodes_wb
                    writeback_sb_inodes
                    __writeback_single_inode
                    do_writepages
                    xfs_vm_writepages
                    write_cache_pages
                    xfs_do_writepage
               - 2.71% xfs_end_io
                    xfs_destroy_ioend
                    end_buffer_async_write
                    end_page_writeback
                    test_clear_page_writeback
                    _raw_spin_unlock_irqrestore
   + 4.88% __libc_pwrite

The kswapd contention has jumped from 20% to 30% of the CPU time
in the profiles. I can't see how changing what LRU the page is on
will improve the contention problem - at it's sources it's a N:1
problem where the writing process and N kswapd worker threads are
all trying to access the same lock concurrently....

This is not the AIM7 problem we are looking for - what this test
demonstrates is a fundamental page cache scalability issue at the
design level - the mapping->tree_lock is a global serialisation
point....

I'm now going to test Christoph's theory that this is an "overwrite
doing lots of block mapping" issue. More on that to follow.

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============2091303548049310329==--

