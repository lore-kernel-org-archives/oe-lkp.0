Content-Type: multipart/mixed; boundary="===============3536742280980652924=="
MIME-Version: 1.0
From: Jason Gunthorpe <jgg@nvidia.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: relocate 'write_protect_seq' in struct mm_struct
Date: Fri, 11 Jun 2021 14:09:17 -0300
Message-ID: <20210611170917.GW1002214@nvidia.com>
In-Reply-To: <1623376482-92265-1-git-send-email-feng.tang@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3536742280980652924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 11, 2021 at 09:54:42AM +0800, Feng Tang wrote:
> 0day robot reported a 9.2% regression for will-it-scale mmap1 test
> case[1], caused by commit 57efa1fe5957 ("mm/gup: prevent gup_fast
> from racing with COW during fork").
> =

> Further debug shows the regression is due to that commit changes
> the offset of hot fields 'mmap_lock' inside structure 'mm_struct',
> thus some cache alignment changes.
> =

> From the perf data, the contention for 'mmap_lock' is very severe
> and takes around 95% cpu cycles, and it is a rw_semaphore
> =

>         struct rw_semaphore {
>                 atomic_long_t count;	/* 8 bytes */
>                 atomic_long_t owner;	/* 8 bytes */
>                 struct optimistic_spin_queue osq; /* spinner MCS lock */
>                 ...
> =

> Before commit 57efa1fe5957 adds the 'write_protect_seq', it
> happens to have a very optimal cache alignment layout, as
> Linus explained:
> =

>  "and before the addition of the 'write_protect_seq' field, the
>   mmap_sem was at offset 120 in 'struct mm_struct'.
> =

>   Which meant that count and owner were in two different cachelines,
>   and then when you have contention and spend time in
>   rwsem_down_write_slowpath(), this is probably *exactly* the kind
>   of layout you want.
> =

>   Because first the rwsem_write_trylock() will do a cmpxchg on the
>   first cacheline (for the optimistic fast-path), and then in the
>   case of contention, rwsem_down_write_slowpath() will just access
>   the second cacheline.
> =

>   Which is probably just optimal for a load that spends a lot of
>   time contended - new waiters touch that first cacheline, and then
>   they queue themselves up on the second cacheline."
> =

> After the commit, the rw_semaphore is at offset 128, which means
> the 'count' and 'owner' fields are now in the same cacheline,
> and causes more cache bouncing.
> =

> Currently there are 3 "#ifdef CONFIG_XXX" before 'mmap_lock' which
> will affect its offset:
> =

>   CONFIG_MMU
>   CONFIG_MEMBARRIER
>   CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES
> =

> The layout above is on 64 bits system with 0day's default kernel
> config (similar to RHEL-8.3's config), in which all these 3 options
> are 'y'. And the layout can vary with different kernel configs.
> =

> Relayouting a structure is usually a double-edged sword, as sometimes
> it can helps one case, but hurt other cases. For this case, one
> solution is, as the newly added 'write_protect_seq' is a 4 bytes long
> seqcount_t (when CONFIG_DEBUG_LOCK_ALLOC=3Dn), placing it into an
> existing 4 bytes hole in 'mm_struct' will not change other fields'
> alignment, while restoring the regression. =

> =

> [1]. https://lore.kernel.org/lkml/20210525031636.GB7744(a)xsang-OptiPlex-=
9020/
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Feng Tang <feng.tang@intel.com>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Peter Xu <peterx@redhat.com>
> ---
>  include/linux/mm_types.h | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)

It seems Ok to me, but didn't we earlier add the has_pinned which
would have changed the layout too? Are we chasing performance delta's
nobody cares about?

Still it is mechanically fine, so:

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
--===============3536742280980652924==--

