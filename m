Content-Type: multipart/mixed; boundary="===============5151861115082463853=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Wed, 10 Aug 2016 17:33:20 -0700
Message-ID: <8760r816wf.fsf@yhuang-mobile.sh.intel.com>
In-Reply-To: <CA+55aFyQ6cjKOQZKEuQV9ch+aerW1Q6uGdv+pCS81rX0yjyR6w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5151861115082463853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Wed, Aug 10, 2016 at 5:11 PM, Huang, Ying <ying.huang@intel.com> wro=
te:
>>
>> Here is the comparison result with perf-profile data.
>
> Heh. The diff is actually harder to read than just showing A/B
> state.The fact that the call chain shows up as part of the symbol
> makes it even more so.
>
> For example:
>
>>       0.00 =C2=B1 -1%      +Inf%       1.68 =C2=B1  1%  perf-profile.cyc=
les-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.=
grab_cache_page_write_begin.iomap_write_begin
>>       1.80 =C2=B1  1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cyc=
les-pp.__add_to_page_cache_locked.add_to_page_cache_lru.pagecache_get_page.=
grab_cache_page_write_begin.xfs_vm_write_begin
>
> Ok, so it went from 1.8% to 1.68%, and isn't actually that big of a
> change, but it shows up as a big change because the caller changed
> from xfs_vm_write_begin to iomap_write_begin.
>
> There's a few other cases of that too.
>
> So I think it would actually be easier to just see "what 20 functions
> were the hottest" (or maybe 50) before and after separately (just
> sorted by cycles), without the diff part. Because the diff is really
> hard to read.

Here it is,

Before:

  "perf-profile.func.cycles-pp.intel_idle": 16.88,
  "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.94,
  "perf-profile.func.cycles-pp.memset_erms": 3.26,
  "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 2.47,
  "perf-profile.func.cycles-pp.___might_sleep": 2.33,
  "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.88,
  "perf-profile.func.cycles-pp.unlock_page": 1.69,
  "perf-profile.func.cycles-pp.up_write": 1.61,
  "perf-profile.func.cycles-pp.__block_write_begin_int": 1.56,
  "perf-profile.func.cycles-pp.down_write": 1.55,
  "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.53,
  "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 1.47,
  "perf-profile.func.cycles-pp.generic_write_end": 1.36,
  "perf-profile.func.cycles-pp.generic_perform_write": 1.33,
  "perf-profile.func.cycles-pp.__radix_tree_lookup": 1.32,
  "perf-profile.func.cycles-pp.__might_sleep": 1.26,
  "perf-profile.func.cycles-pp._raw_spin_lock": 1.17,
  "perf-profile.func.cycles-pp.vfs_write": 1.14,
  "perf-profile.func.cycles-pp.__xfs_get_blocks": 1.07,
  "perf-profile.func.cycles-pp.xfs_file_write_iter": 1.03,
  "perf-profile.func.cycles-pp.pagecache_get_page": 1.03,
  "perf-profile.func.cycles-pp.native_queued_spin_lock_slowpath": 0.98,
  "perf-profile.func.cycles-pp.get_page_from_freelist": 0.94,
  "perf-profile.func.cycles-pp.rwsem_spin_on_owner": 0.94,
  "perf-profile.func.cycles-pp.__vfs_write": 0.87,
  "perf-profile.func.cycles-pp.iov_iter_copy_from_user_atomic": 0.87,
  "perf-profile.func.cycles-pp.xfs_file_buffered_aio_write": 0.84,
  "perf-profile.func.cycles-pp.find_get_entry": 0.79,
  "perf-profile.func.cycles-pp._raw_spin_lock_irqsave": 0.78,


After:

  "perf-profile.func.cycles-pp.intel_idle": 16.82,
  "perf-profile.func.cycles-pp.copy_user_enhanced_fast_string": 3.27,
  "perf-profile.func.cycles-pp.memset_erms": 2.6,
  "perf-profile.func.cycles-pp.xfs_bmapi_read": 2.24,
  "perf-profile.func.cycles-pp.___might_sleep": 2.04,
  "perf-profile.func.cycles-pp.mark_page_accessed": 1.93,
  "perf-profile.func.cycles-pp.__block_write_begin_int": 1.78,
  "perf-profile.func.cycles-pp.up_write": 1.72,
  "perf-profile.func.cycles-pp.xfs_iext_bno_to_ext": 1.7,
  "perf-profile.func.cycles-pp.__block_commit_write.isra.24": 1.65,
  "perf-profile.func.cycles-pp.down_write": 1.51,
  "perf-profile.func.cycles-pp.__mark_inode_dirty": 1.51,
  "perf-profile.func.cycles-pp.unlock_page": 1.43,
  "perf-profile.func.cycles-pp.xfs_bmap_search_multi_extents": 1.25,
  "perf-profile.func.cycles-pp.xfs_bmap_search_extents": 1.23,
  "perf-profile.func.cycles-pp.mark_buffer_dirty": 1.21,
  "perf-profile.func.cycles-pp.xfs_iomap_write_delay": 1.19,
  "perf-profile.func.cycles-pp.xfs_iomap_eof_want_preallocate.constprop.8":=
 1.15,
  "perf-profile.func.cycles-pp.iomap_write_actor": 1.14,
  "perf-profile.func.cycles-pp.__might_sleep": 1.12,
  "perf-profile.func.cycles-pp.__radix_tree_lookup": 1.08,
  "perf-profile.func.cycles-pp.entry_SYSCALL_64_fastpath": 1.07,
  "perf-profile.func.cycles-pp.pagecache_get_page": 0.95,
  "perf-profile.func.cycles-pp._raw_spin_lock": 0.95,
  "perf-profile.func.cycles-pp.xfs_bmapi_delay": 0.93,
  "perf-profile.func.cycles-pp.vfs_write": 0.92,
  "perf-profile.func.cycles-pp.xfs_file_write_iter": 0.86,

Best Regards,
Huang, Ying

--===============5151861115082463853==--

