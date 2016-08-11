Content-Type: multipart/mixed; boundary="===============2853516152045817517=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 14:40:59 -0700
Message-ID: <CA+55aFx=mbAd0hEnji-TWZH_NReLLk+SbJHK1s+=r1_USV0KXw@mail.gmail.com>
In-Reply-To: <87ziojxazw.fsf@yhuang-mobile.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2853516152045817517==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 2:16 PM, Huang, Ying <ying.huang@intel.com> wrote:
>
> Test result is as follow,

Thanks. No change.

> raw perf data:

I redid my munging, with the old (good) percentages in parenthesis:

  intel_idle:                                   17.66   (16.88)
  copy_user_enhanced_fast_string:                3.25    (3.94)
  memset_erms:                                   2.56    (3.26)
  xfs_bmapi_read:                                2.28
  ___might_sleep:                                2.09    (2.33)
  __block_commit_write.isra.24:                  2.07    (2.47)
  xfs_iext_bno_to_ext:                           1.79
  __block_write_begin_int:                       1.74    (1.56)
  up_write:                                      1.72    (1.61)
  unlock_page:                                   1.69    (1.69)
  down_write:                                    1.59    (1.55)
  __mark_inode_dirty:                            1.54    (1.88)
  xfs_bmap_search_extents:                       1.33
  xfs_iomap_write_delay:                         1.23
  mark_buffer_dirty:                             1.21    (1.53)
  __radix_tree_lookup:                           1.2     (1.32)
  xfs_bmap_search_multi_extents:                 1.18
  xfs_iomap_eof_want_preallocate.constprop.8:    1.17
  entry_SYSCALL_64_fastpath:                     1.15    (1.47)
  __might_sleep:                                 1.14    (1.26)
  _raw_spin_lock:                                0.97    (1.17)
  vfs_write:                                     0.94    (1.14)
  xfs_bmapi_delay:                               0.93
  iomap_write_actor:                             0.9
  pagecache_get_page:                            0.89    (1.03)
  xfs_file_write_iter:                           0.86    (1.03)
  xfs_file_iomap_begin:                          0.81
  iov_iter_copy_from_user_atomic:                0.78    (0.87)
  iomap_apply:                                   0.77
  generic_write_end:                             0.74    (1.36)
  xfs_file_buffered_aio_write:                   0.72    (0.84)
  find_get_entry:                                0.69    (0.79)
  __vfs_write:                                   0.67    (0.87)

and it's worth noting a few things:

 - most of the old percentages are bigger, but that's natural: the
load used to take longer, and the more efficient (old) case thus has
higher percent values. That doesn't mean it was slower, quite the
reverse.

 - the main exception is intel_idle, so we do have more idle time.

But the *big* difference is all the functions that didn't use to show
up at all, and have no previous percent values:

  xfs_bmapi_read: 2.28
  xfs_iext_bno_to_ext: 1.79
  xfs_bmap_search_extents: 1.33
  xfs_iomap_write_delay: 1.23
  xfs_bmap_search_multi_extents: 1.18
  xfs_iomap_eof_want_preallocate.constprop.8: 1.17
  xfs_bmapi_delay: 0.93
  iomap_write_actor: 0.9
  xfs_file_iomap_begin: 0.81
  iomap_apply: 0.77

and I think this really can explain the regression. That all adds up
to 12% or so of "new overhead". Which is fairly close to the
regression.

(Ok, that is playing fast and loose with percentages, but I think it
migth be "close enough" in practice).

So for some reason the new code doesn't do a lot more per-page
operations (the unlock_page() etc costs are fairly similar), but it
has a *much* m ore expensive footprint in the xfs_bmap/iomap
functions.

The old code had almost no XFS footprint at all, and didn't need to
look up block mappings etc, and worked almost entirely with the vfs
caches (so used the block numbers in the buffers etc).

And I know that DaveC often complains about vfs overhead, but the fact
is, the VFS layer is optimized to hell and back and does really really
well. Having to call down to filesystem routines (for block mappings
etc) is when performance goes down. I think this is an example of
that.

And hey, maybe I'm just misreading things, or reading too much into
those profiles. But it does look like that commit
68a9f5e7007c1afa2cf6830b690a90d0187c0684 ends up causing more xfs bmap
activity.

                     Linus

--===============2853516152045817517==--

