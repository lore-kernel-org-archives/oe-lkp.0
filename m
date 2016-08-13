Content-Type: multipart/mixed; boundary="===============0614041871470698319=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sat, 13 Aug 2016 23:48:25 +0200
Message-ID: <20160813214825.GA31667@lst.de>
In-Reply-To: <20160813003054.GA3101@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============0614041871470698319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 13, 2016 at 02:30:54AM +0200, Christoph Hellwig wrote:
> Below is a patch I hacked up this morning to do just that.  It passes
> xfstests, but I've not done any real benchmarking with it.  If the
> reduced lookup overhead in it doesn't help enough we'll need to some
> sort of look aside cache for the information, but I hope that we
> can avoid that.  And yes, it's a rather large patch - but the old
> path was so entangled that I couldn't come up with something lighter.

Hi Fengguang or Xiaolong,

any chance to add this thread to a lkp run?  I've played around with
Dave's simplied xfs_io run, and while the end result for 1k block
size looks pretty similar in terms of execution time and throughput
the profiles look much better.  For 512 byte or 1 byte tests the
tests completes a lot faster too.

Here is the perf report output for a 1k block size run, the first
item directly related to the block mapping shows up is
xfs_file_iomap_begin_delay at .75%.  Although I'm a bit worried
up up_/down_read showing up so much.  While we take a ilock and
iolock a lot they should be mostly uncontended for such a single
threaded write, so the overhead seems a bit worrisome.

(FYI, the tree this was tested on also has the mark_page_accessed
and pagefault_disable fixes applied)

# To display the perf.data header info, please use --header/--header-only o=
ptions.
#
# Samples: 7K of event 'cpu-clock'
# Event count (approx.): 1909250000
#
# Overhead       Command      Shared Object                                =
 Symbol
# ........  ............  .................  ..............................=
.......
#
    37.71%       swapper  [kernel.kallsyms]  [k] native_safe_halt          =
       =

     9.85%  kworker/u8:5  [kernel.kallsyms]  [k] __copy_user_nocache       =
       =

     2.83%        xfs_io  [kernel.kallsyms]  [k] copy_user_generic_string  =
       =

     2.33%        xfs_io  [kernel.kallsyms]  [k] __memset                  =
       =

     2.23%        xfs_io  [kernel.kallsyms]  [k] __block_commit_write.isra.=
34     =

     1.73%        xfs_io  [kernel.kallsyms]  [k] down_write                =
       =

     1.64%        xfs_io  [kernel.kallsyms]  [k] up_write                  =
       =

     1.39%        xfs_io  [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestor=
e      =

     1.23%        xfs_io  [kernel.kallsyms]  [k] entry_SYSCALL_64_fastpath =
       =

     1.18%        xfs_io  [kernel.kallsyms]  [k] __mark_inode_dirty        =
       =

     1.18%        xfs_io  [kernel.kallsyms]  [k] _raw_spin_lock            =
       =

     1.15%  kworker/u8:5  [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestor=
e      =

     1.13%        xfs_io  [kernel.kallsyms]  [k] __block_write_begin_int   =
       =

     1.10%        xfs_io  [kernel.kallsyms]  [k] mark_buffer_dirty         =
       =

     1.07%        xfs_io  [kernel.kallsyms]  [k] __radix_tree_lookup       =
       =

     1.01%   kworker/0:2  [kernel.kallsyms]  [k] end_buffer_async_write    =
       =

     0.97%        xfs_io  [kernel.kallsyms]  [k] unlock_page               =
       =

     0.92%   kworker/0:2  [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestor=
e      =

     0.89%        xfs_io  [kernel.kallsyms]  [k] iov_iter_copy_from_user_at=
omic   =

     0.84%        xfs_io  [kernel.kallsyms]  [k] generic_write_end         =
       =

     0.80%        xfs_io  [kernel.kallsyms]  [k] get_page_from_freelist    =
       =

     0.80%        xfs_io  [kernel.kallsyms]  [k] xfs_perag_put             =
       =

     0.79%        xfs_io  [kernel.kallsyms]  [k] __add_to_page_cache_locked=
       =

     0.75%        xfs_io  libc-2.19.so       [.] __libc_pwrite             =
       =

     0.72%        xfs_io  [kernel.kallsyms]  [k] xfs_file_iomap_begin_delay=
.isra.5
     0.71%        xfs_io  [kernel.kallsyms]  [k] iomap_write_actor         =
       =

     0.67%        xfs_io  [kernel.kallsyms]  [k] pagecache_get_page        =
       =

     0.64%        xfs_io  [kernel.kallsyms]  [k] balance_dirty_pages_rateli=
mited  =

     0.64%        xfs_io  [kernel.kallsyms]  [k] vfs_write                 =
       =

     0.63%  kworker/u8:5  [kernel.kallsyms]  [k] clear_page_dirty_for_io   =
       =

     0.62%        xfs_io  [kernel.kallsyms]  [k] xfs_file_write_iter       =
       =

     0.60%        xfs_io  [kernel.kallsyms]  [k] __vfs_write               =
       =

     0.55%        xfs_io  [kernel.kallsyms]  [k] page_waitqueue            =
       =

     0.54%        xfs_io  [kernel.kallsyms]  [k] xfs_perag_get             =
       =

     0.52%        xfs_io  [kernel.kallsyms]  [k] __wake_up_bit             =
       =

     0.52%        xfs_io  [kernel.kallsyms]  [k] radix_tree_tag_set        =
       =

     0.50%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_do_writepage          =
       =

     0.50%        xfs_io  [kernel.kallsyms]  [k] iov_iter_advance          =
       =

     0.47%        xfs_io  [kernel.kallsyms]  [k] kmem_cache_alloc          =
       =

     0.46%        xfs_io  [kernel.kallsyms]  [k] xfs_file_buffered_aio_writ=
e      =

     0.46%        xfs_io  [kernel.kallsyms]  [k] xfs_iunlock               =
       =

     0.45%  kworker/u8:5  [kernel.kallsyms]  [k] __wake_up_bit             =
       =

     0.45%        xfs_io  [kernel.kallsyms]  [k] find_get_entry            =
       =

     0.45%        xfs_io  [kernel.kallsyms]  [k] xfs_bmap_search_multi_exte=
nts    =

     0.41%        xfs_io  [kernel.kallsyms]  [k] xfs_iext_bno_to_ext       =
       =

     0.39%        xfs_io  [kernel.kallsyms]  [k] iomap_apply               =
       =

     0.39%        xfs_io  [kernel.kallsyms]  [k] xfs_file_aio_write_checks =
       =

     0.38%        xfs_io  [kernel.kallsyms]  [k] xfs_ilock                 =
       =

     0.38%        xfs_io  [kernel.kallsyms]  [k] xfs_inode_set_eofblocks_ta=
g      =

     0.37%        xfs_io  [kernel.kallsyms]  [k] xfs_bmap_search_extents   =
       =

     0.30%        xfs_io  [kernel.kallsyms]  [k] file_update_time          =
       =

     0.29%        xfs_io  [kernel.kallsyms]  [k] __fget_light              =
       =

     0.27%        xfs_io  [kernel.kallsyms]  [k] rw_verify_area            =
       =

     0.26%  kworker/u8:5  [kernel.kallsyms]  [k] unlock_page               =
       =

     0.26%        xfs_io  xfs_io             [.] pwrite_f                  =
       =

     0.25%        xfs_io  [kernel.kallsyms]  [k] iomap_file_buffered_write =
       =

     0.25%        xfs_io  [kernel.kallsyms]  [k] node_dirty_ok             =
       =

     0.25%        xfs_io  [kernel.kallsyms]  [k] xfs_bmbt_to_iomap         =
       =

     0.24%   kworker/0:2  [kernel.kallsyms]  [k] xfs_destroy_ioend         =
       =

     0.24%        xfs_io  [kernel.kallsyms]  [k] __xfs_bmbt_get_all        =
       =

     0.24%        xfs_io  [kernel.kallsyms]  [k] iov_iter_fault_in_readable=
       =

     0.22%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_start_buffer_writeback=
       =

     0.22%        xfs_io  [kernel.kallsyms]  [k] fsnotify                  =
       =

     0.22%        xfs_io  [kernel.kallsyms]  [k] sys_pwrite64              =
       =

     0.22%        xfs_io  [kernel.kallsyms]  [k] xfs_file_iomap_begin      =
       =

     0.21%  kworker/u8:5  [kernel.kallsyms]  [k] pmem_do_bvec              =
       =

     0.21%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_map_at_offset         =
       =

     0.18%  kworker/u8:5  [kernel.kallsyms]  [k] write_cache_pages         =
       =

     0.18%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_map_buffer            =
       =

     0.17%  kworker/u8:5  [kernel.kallsyms]  [k] __test_set_page_writeback =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] __alloc_pages_nodemask    =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] __fsnotify_parent         =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] block_write_end           =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] iomap_write_begin         =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] iov_iter_init             =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] percpu_up_read            =
       =

     0.17%        xfs_io  [kernel.kallsyms]  [k] radix_tree_lookup_slot    =
       =

     0.16%        xfs_io  [kernel.kallsyms]  [k] create_empty_buffers      =
       =

     0.16%        xfs_io  [kernel.kallsyms]  [k] timespec_trunc            =
       =

     0.16%        xfs_io  [kernel.kallsyms]  [k] wait_for_stable_page      =
       =

     0.16%        xfs_io  [kernel.kallsyms]  [k] xfs_get_extsz_hint        =
       =

     0.14%   kworker/0:2  [kernel.kallsyms]  [k] test_clear_page_writeback =
       =

     0.14%  kworker/u8:5  [kernel.kallsyms]  [k] release_pages             =
       =

     0.13%        xfs_io  [kernel.kallsyms]  [k] iomap_write_end           =
       =

     0.13%        xfs_io  [kernel.kallsyms]  [k] xfs_bmbt_get_startoff     =
       =

     0.12%  kworker/u8:5  [kernel.kallsyms]  [k] dec_zone_page_state       =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] alloc_page_buffers        =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] generic_write_checks      =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] percpu_down_read          =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] release_pages             =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] set_bh_page               =
       =

     0.12%        xfs_io  [kernel.kallsyms]  [k] xfs_find_bdev_for_inode   =
       =

     0.12%        xfs_io  xfs_io             [.] do_pwrite                 =
       =

     0.10%  kworker/u8:5  [kernel.kallsyms]  [k] mark_buffer_async_write   =
       =

     0.10%  kworker/u8:5  [kernel.kallsyms]  [k] page_waitqueue            =
       =

     0.10%        xfs_io  [kernel.kallsyms]  [k] PageHuge                  =
       =

     0.10%        xfs_io  [kernel.kallsyms]  [k] add_to_page_cache_lru     =
       =

     0.09%   kworker/0:2  [kernel.kallsyms]  [k] end_page_writeback        =
       =

     0.09%  kworker/u8:5  [kernel.kallsyms]  [k] find_get_pages_tag        =
       =

     0.09%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_start_page_writeback  =
       =

     0.09%        xfs_io  [kernel.kallsyms]  [k] create_page_buffers       =
       =

     0.09%        xfs_io  [kernel.kallsyms]  [k] page_mapping              =
       =

     0.09%        xfs_io  [kernel.kallsyms]  [k] xfs_bmbt_get_all          =
       =

     0.09%        xfs_io  [kernel.kallsyms]  [k] xfs_file_iomap_end        =
       =

     0.08%  kworker/u8:5  [kernel.kallsyms]  [k] inc_node_page_state       =
       =

     0.08%  kworker/u8:5  [kernel.kallsyms]  [k] inc_zone_page_state       =
       =

     0.08%  kworker/u8:5  [kernel.kallsyms]  [k] page_mapping              =
       =

     0.08%  kworker/u8:5  [kernel.kallsyms]  [k] page_mkclean              =
       =

     0.08%        xfs_io  [kernel.kallsyms]  [k] __sb_start_write          =
       =

     0.08%        xfs_io  [kernel.kallsyms]  [k] current_kernel_time64     =
       =

     0.07%   kworker/0:2  [kernel.kallsyms]  [k] __wake_up_bit             =
       =

     0.07%  kworker/u8:5  [kernel.kallsyms]  [k] page_mapped               =
       =

     0.07%        xfs_io  [kernel.kallsyms]  [k] __lru_cache_add           =
       =

     0.07%        xfs_io  [kernel.kallsyms]  [k] current_fs_time           =
       =

     0.07%        xfs_io  [kernel.kallsyms]  [k] grab_cache_page_write_begi=
n      =

     0.07%        xfs_io  [kernel.kallsyms]  [k] xfs_iext_get_ext          =
       =

     0.05%  kworker/u8:5  [kernel.kallsyms]  [k] pmem_make_request         =
       =

     0.05%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_add_to_ioend          =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] __fdget                   =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] __find_get_block_slow     =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] __set_page_dirty          =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] alloc_buffer_head         =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] radix_tree_lookup         =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] radix_tree_tagged         =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] xfs_bmbt_get_blockcount   =
       =

     0.05%        xfs_io  [kernel.kallsyms]  [k] xfs_fsb_to_db             =
       =

     0.04%   kworker/0:2  [kernel.kallsyms]  [k] dec_zone_page_state       =
       =

     0.04%  kworker/u8:5  [kernel.kallsyms]  [k] dec_node_page_state       =
       =

     0.04%        xfs_io  [kernel.kallsyms]  [k] __radix_tree_preload      =
       =

     0.04%        xfs_io  [kernel.kallsyms]  [k] __sb_end_write            =
       =

     0.03%   kworker/0:2  [kernel.kallsyms]  [k] dec_node_page_state       =
       =

     0.03%   kworker/0:2  [kernel.kallsyms]  [k] inc_node_page_state       =
       =

     0.03%   kworker/0:2  [kernel.kallsyms]  [k] page_mapping              =
       =

     0.03%  kworker/u8:5  [kernel.kallsyms]  [k] radix_tree_next_chunk     =
       =

     0.03%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_fsb_to_db             =
       =

     0.03%        xfs_io  [kernel.kallsyms]  [k] _raw_spin_lock_irqsave    =
       =

     0.03%        xfs_io  [kernel.kallsyms]  [k] cache_alloc_refill        =
       =

     0.03%        xfs_io  [kernel.kallsyms]  [k] lru_cache_add             =
       =

     0.01%   kworker/0:2  [kernel.kallsyms]  [k] cache_reap                =
       =

     0.01%   kworker/0:2  [kernel.kallsyms]  [k] mempool_free              =
       =

     0.01%   kworker/0:2  [kernel.kallsyms]  [k] page_waitqueue            =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] bio_add_page              =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] kmem_cache_alloc          =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] lru_add_drain_cpu         =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] mempool_alloc             =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] pagevec_lookup_tag        =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] queue_delayed_work_on     =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] queue_work_on             =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] run_timer_softirq         =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] update_group_capacity     =
       =

     0.01%  kworker/u8:5  [kernel.kallsyms]  [k] xfs_trans_reserve         =
       =

     0.01%       swapper  [kernel.kallsyms]  [k] _raw_spin_unlock_irqrestor=
e      =

     0.01%        xfs_io  [kernel.kallsyms]  [k] _cond_resched             =
       =

     0.01%        xfs_io  [kernel.kallsyms]  [k] mod_zone_page_state       =
       =

     0.01%        xfs_io  [kernel.kallsyms]  [k] pagevec_lru_move_fn       =
       =

     0.01%        xfs_io  [kernel.kallsyms]  [k] radix_tree_maybe_preload  =
       =

     0.01%        xfs_io  [kernel.kallsyms]  [k] unmap_underlying_metadata =
       =

     0.01%        xfs_io  [kernel.kallsyms]  [k] xfs_bmap_worst_indlen     =
       =

     0.01%        xfs_io  ld-2.19.so         [.] 0x000000000000d866        =
       =

     0.01%        xfs_io  libc-2.19.so       [.] 0x000000000008a8da        =
       =

     0.01%        xfs_io  xfs_io             [.] pwrite64(a)plt            =
         =




--===============0614041871470698319==--

