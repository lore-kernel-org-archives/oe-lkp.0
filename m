Content-Type: multipart/mixed; boundary="===============5534627286725578420=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Tue, 16 Aug 2016 10:38:26 +1000
Message-ID: <20160816003826.GG16044@dastard>
In-Reply-To: <CA+55aFznUMMtRbhE40gXke2XAV2EqKUYBfFsfLoJ5TRw7UeZ-Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5534627286725578420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 05:15:47PM -0700, Linus Torvalds wrote:
> DaveC - does the spinlock contention go away if you just go back to
> 4.7? If so, I think it's the new zone thing. But it would be good to
> verify - maybe it's something entirely different and it goes back much
> further.

Same in 4.7 (flat profile numbers climbed higher after this
snapshot was taken, as can be seen by the callgraph numbers):

  29.47%  [kernel]  [k] __pv_queued_spin_lock_slowpath
  11.59%  [kernel]  [k] copy_user_generic_string
   3.13%  [kernel]  [k] __raw_callee_save___pv_queued_spin_unlock
   2.87%  [kernel]  [k] __block_commit_write.isra.29
   2.02%  [kernel]  [k] _raw_spin_lock_irqsave
   1.77%  [kernel]  [k] get_page_from_freelist
   1.36%  [kernel]  [k] __wake_up_bit     =

   1.31%  [kernel]  [k] __radix_tree_lookup
   1.22%  [kernel]  [k] radix_tree_tag_set
   1.16%  [kernel]  [k] clear_page_dirty_for_io
   1.14%  [kernel]  [k] __remove_mapping
   1.14%  [kernel]  [k] _raw_spin_lock
   1.00%  [kernel]  [k] zone_dirty_ok
   0.95%  [kernel]  [k] radix_tree_tag_clear
   0.90%  [kernel]  [k] generic_write_end
   0.89%  [kernel]  [k] __delete_from_page_cache
   0.87%  [kernel]  [k] unlock_page
   0.86%  [kernel]  [k] cancel_dirty_page
   0.81%  [kernel]  [k] up_write
   0.80%  [kernel]  [k] ___might_sleep
   0.77%  [kernel]  [k] _raw_spin_unlock_irqrestore
   0.75%  [kernel]  [k] generic_perform_write
   0.72%  [kernel]  [k] xfs_do_writepage  =

   0.69%  [kernel]  [k] down_write        =

   0.63%  [kernel]  [k] shrink_page_list  =

   0.63%  [kernel]  [k] __xfs_get_blocks  =

   0.61%  [kernel]  [k] __test_set_page_writeback
   0.59%  [kernel]  [k] free_hot_cold_page
   0.57%  [kernel]  [k] write_cache_pages
   0.56%  [kernel]  [k] __radix_tree_create
   0.55%  [kernel]  [k] __list_add
   0.53%  [kernel]  [k] page_mapping
   0.53%  [kernel]  [k] drop_buffers
   0.51%  [kernel]  [k] xfs_vm_releasepage
   0.51%  [kernel]  [k] free_pcppages_bulk
   0.50%  [kernel]  [k] __list_del_entry  =



   38.07%    38.07%  [kernel]            [k] __pv_queued_spin_lock_slowpath
   - 25.52% ret_from_fork
      - kthread
         - 24.36% kswapd
              shrink_zone
              shrink_zone_memcg.isra.73
              shrink_inactive_list
         - 3.21% worker_thread
              process_one_work
              wb_workfn
              wb_writeback
              __writeback_inodes_wb
              writeback_sb_inodes
              __writeback_single_inode
              do_writepages
              xfs_vm_writepages
              write_cache_pages
   - 10.06% __libc_pwrite
        entry_SYSCALL_64_fastpath
        sys_pwrite64
        vfs_write
        __vfs_write
        xfs_file_write_iter
        xfs_file_buffered_aio_write
      - generic_perform_write
         - 5.51% xfs_vm_write_begin
            - 4.94% grab_cache_page_write_begin
                 pagecache_get_page
              0.57% __block_write_begin
                 create_page_buffers
                 create_empty_buffers
                 _raw_spin_lock
                 __pv_queued_spin_lock_slowpath
         - 4.88% xfs_vm_write_end
              generic_write_end
              block_write_end
              __block_commit_write.isra.29
              mark_buffer_dirty
              __set_page_dirty

-Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============5534627286725578420==--

