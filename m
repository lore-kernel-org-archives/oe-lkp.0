Content-Type: multipart/mixed; boundary="===============4617949988733929712=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 18:00:24 -0700
Message-ID: <CA+55aFy=xeEKgfHWisfxsZNqrgMJxvKvhrWrPmdpMxu0pnOXig@mail.gmail.com>
In-Reply-To: <8760r816wf.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4617949988733929712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 5:33 PM, Huang, Ying <ying.huang@intel.com> wrote:
>
> Here it is,

Thanks.

Appended is a munged "after" list, with the "before" values in
parenthesis. It actually looks fairly similar.

The biggest difference is that we have "mark_page_accessed()" show up
after, and not before. There was also a lot of LRU noise in the
non-profile data. I wonder if that is the reason here: the old model
of using generic_perform_write/block_page_mkwrite didn't mark the
pages accessed, and now with iomap_file_buffered_write() they get
marked as active and that screws up the LRU list, and makes us not
flush out the dirty pages well (because they are seen as active and
not good for writeback), and then you get bad memory use.

I'm not seeing anything that looks like locking-related.

And I may well have screwed up that list munging. I should have
automated it more than I did.

Dave, Christoph?

                Linus

---

   intel_idle                                   16.82   (16.88)
   copy_user_enhanced_fast_string                3.27    (3.94)
   memset_erms                                   2.6     (3.26)
   xfs_bmapi_read                                2.24
   ___might_sleep                                2.04    (2.33)
   mark_page_accessed                            1.93
   __block_write_begin_int                       1.78    (1.56)
   up_write                                      1.72    (1.61)
   xfs_iext_bno_to_ext                           1.7
   __block_commit_write.isra.24                  1.65    (2.47)
   down_write                                    1.51    (1.55)
   __mark_inode_dirty                            1.51    (1.88)
   unlock_page                                   1.43    (1.69)
   xfs_bmap_search_multi_extents                 1.25
   xfs_bmap_search_extents                       1.23
   mark_buffer_dirty                             1.21    (1.53)
   xfs_iomap_write_delay                         1.19
   xfs_iomap_eof_want_preallocate.constprop.8    1.15
   iomap_write_actor                             1.14
   __might_sleep                                 1.12    (1.26)
   __radix_tree_lookup                           1.08    (1.32)
   entry_SYSCALL_64_fastpath                     1.07    (1.47)
   pagecache_get_page                            0.95    (1.03)
   _raw_spin_lock                                0.95    (1.17)
   xfs_bmapi_delay                               0.93
   vfs_write                                     0.92    (1.14)
   xfs_file_write_iter                           0.86

--===============4617949988733929712==--

