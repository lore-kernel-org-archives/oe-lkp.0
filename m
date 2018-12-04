Content-Type: multipart/mixed; boundary="===============3503325571712305642=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Tue, 04 Dec 2018 08:35:35 +0100
Message-ID: <20181204073535.GV31738@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812031545560.161134@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3503325571712305642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 15:50:24, David Rientjes wrote:
> This is a full revert of ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for
> MADV_HUGEPAGE mappings") and a partial revert of 89c83fb539f9 ("mm, thp:
> consolidate THP gfp handling into alloc_hugepage_direct_gfpmask").
> =

> By not setting __GFP_THISNODE, applications can allocate remote hugepages
> when the local node is fragmented or low on memory when either the thp
> defrag setting is "always" or the vma has been madvised with
> MADV_HUGEPAGE.
> =

> Remote access to hugepages often has much higher latency than local pages
> of the native page size.  On Haswell, ac5b2c18911f was shown to have a
> 13.9% access regression after this commit for binaries that remap their
> text segment to be backed by transparent hugepages.
> =

> The intent of ac5b2c18911f is to address an issue where a local node is
> low on memory or fragmented such that a hugepage cannot be allocated.  In
> every scenario where this was described as a fix, there is abundant and
> unfragmented remote memory available to allocate from, even with a greater
> access latency.
> =

> If remote memory is also low or fragmented, not setting __GFP_THISNODE was
> also measured on Haswell to have a 40% regression in allocation latency.
> =

> Restore __GFP_THISNODE for thp allocations.
> =

> Fixes: ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE map=
pings")
> Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into alloc_hu=
gepage_direct_gfpmask")

At minimum do not remove the cleanup part which consolidates the gfp
hadnling to a single place. There is no real reason to have the
__GFP_THISNODE ugliness outside of alloc_hugepage_direct_gfpmask.

I still hate the __GFP_THISNODE part as mentioned before. It is an ugly
hack but I can learn to live with it if this is indeed the only option
for the short term workaround until we find a proper solution.

> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  include/linux/mempolicy.h |  2 --
>  mm/huge_memory.c          | 42 +++++++++++++++------------------------
>  mm/mempolicy.c            |  7 ++++---
>  3 files changed, 20 insertions(+), 31 deletions(-)
> =

> diff --git a/include/linux/mempolicy.h b/include/linux/mempolicy.h
> --- a/include/linux/mempolicy.h
> +++ b/include/linux/mempolicy.h
> @@ -139,8 +139,6 @@ struct mempolicy *mpol_shared_policy_lookup(struct sh=
ared_policy *sp,
>  struct mempolicy *get_task_policy(struct task_struct *p);
>  struct mempolicy *__get_vma_policy(struct vm_area_struct *vma,
>  		unsigned long addr);
> -struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
> -						unsigned long addr);
>  bool vma_policy_mof(struct vm_area_struct *vma);
>  =

>  extern void numa_default_policy(void);
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -632,37 +632,27 @@ static vm_fault_t __do_huge_pmd_anonymous_page(stru=
ct vm_fault *vmf,
>  static inline gfp_t alloc_hugepage_direct_gfpmask(struct vm_area_struct =
*vma, unsigned long addr)
>  {
>  	const bool vma_madvised =3D !!(vma->vm_flags & VM_HUGEPAGE);
> -	gfp_t this_node =3D 0;
> -
> -#ifdef CONFIG_NUMA
> -	struct mempolicy *pol;
> -	/*
> -	 * __GFP_THISNODE is used only when __GFP_DIRECT_RECLAIM is not
> -	 * specified, to express a general desire to stay on the current
> -	 * node for optimistic allocation attempts. If the defrag mode
> -	 * and/or madvise hint requires the direct reclaim then we prefer
> -	 * to fallback to other node rather than node reclaim because that
> -	 * can lead to excessive reclaim even though there is free memory
> -	 * on other nodes. We expect that NUMA preferences are specified
> -	 * by memory policies.
> -	 */
> -	pol =3D get_vma_policy(vma, addr);
> -	if (pol->mode !=3D MPOL_BIND)
> -		this_node =3D __GFP_THISNODE;
> -	mpol_cond_put(pol);
> -#endif
> +	const gfp_t gfp_mask =3D GFP_TRANSHUGE_LIGHT | __GFP_THISNODE;
>  =

> +	/* Always do synchronous compaction */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_DIRECT_FLAG, &transparent_huge=
page_flags))
> -		return GFP_TRANSHUGE | (vma_madvised ? 0 : __GFP_NORETRY);
> +		return GFP_TRANSHUGE | __GFP_THISNODE |
> +		       (vma_madvised ? 0 : __GFP_NORETRY);
> +
> +	/* Kick kcompactd and fail quickly */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_FLAG, &transparent_huge=
page_flags))
> -		return GFP_TRANSHUGE_LIGHT | __GFP_KSWAPD_RECLAIM | this_node;
> +		return gfp_mask | __GFP_KSWAPD_RECLAIM;
> +
> +	/* Synchronous compaction if madvised, otherwise kick kcompactd */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_KSWAPD_OR_MADV_FLAG, &transpar=
ent_hugepage_flags))
> -		return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> -							     __GFP_KSWAPD_RECLAIM | this_node);
> +		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> +						  __GFP_KSWAPD_RECLAIM);
> +
> +	/* Only do synchronous compaction if madvised */
>  	if (test_bit(TRANSPARENT_HUGEPAGE_DEFRAG_REQ_MADV_FLAG, &transparent_hu=
gepage_flags))
> -		return GFP_TRANSHUGE_LIGHT | (vma_madvised ? __GFP_DIRECT_RECLAIM :
> -							     this_node);
> -	return GFP_TRANSHUGE_LIGHT | this_node;
> +		return gfp_mask | (vma_madvised ? __GFP_DIRECT_RECLAIM : 0);
> +
> +	return gfp_mask;
>  }
>  =

>  /* Caller must hold page table lock. */
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -1116,8 +1116,9 @@ static struct page *new_page(struct page *page, uns=
igned long start)
>  	} else if (PageTransHuge(page)) {
>  		struct page *thp;
>  =

> -		thp =3D alloc_pages_vma(GFP_TRANSHUGE, HPAGE_PMD_ORDER, vma,
> -				address, numa_node_id());
> +		thp =3D alloc_pages_vma(GFP_TRANSHUGE | __GFP_THISNODE,
> +				      HPAGE_PMD_ORDER, vma, address,
> +				      numa_node_id());
>  		if (!thp)
>  			return NULL;
>  		prep_transhuge_page(thp);
> @@ -1662,7 +1663,7 @@ struct mempolicy *__get_vma_policy(struct vm_area_s=
truct *vma,
>   * freeing by another task.  It is the caller's responsibility to free t=
he
>   * extra reference for shared policies.
>   */
> -struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
> +static struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>  						unsigned long addr)
>  {
>  	struct mempolicy *pol =3D __get_vma_policy(vma, addr);

-- =

Michal Hocko
SUSE Labs

--===============3503325571712305642==--

