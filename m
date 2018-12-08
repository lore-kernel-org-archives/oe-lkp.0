Content-Type: multipart/mixed; boundary="===============7927661949221463947=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [patch v2 for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Sat, 08 Dec 2018 11:02:36 +0100
Message-ID: <4ffce3ba-2a80-4d57-876e-32a6b7eae57f@suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812071449500.173448@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7927661949221463947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/7/18 11:50 PM, David Rientjes wrote:
> This reverts commit 89c83fb539f95491be80cdd5158e6f0ce329e317.
> =

> This should have been done as part of 2f0799a0ffc0 ("mm, thp: restore
> node-local hugepage allocations").  The movement of the thp allocation
> policy from alloc_pages_vma() to alloc_hugepage_direct_gfpmask() was
> intended to only set __GFP_THISNODE for mempolicies that are not
> MPOL_BIND whereas the revert could set this regardless of mempolicy.
> =

> While the check for MPOL_BIND between alloc_hugepage_direct_gfpmask()
> and alloc_pages_vma() was racy, that has since been removed since the

I would have expected mmap_sem to prevent the race, as faults have it
locked for read and updating mempolicies for write, IIRC? But didn't
check in detail.

> revert.  What is left is the possibility to use __GFP_THISNODE in
> policy_node() when it is unexpected because the special handling for
> hugepages in alloc_pages_vma()  was removed as part of the consolidation.

Yeah that was a bug.

> Secondly, prior to 89c83fb539f9, alloc_pages_vma() implemented a somewhat =

> different policy for hugepage allocations, which were allocated through =

> alloc_hugepage_vma().  For hugepage allocations, if the allocating =

> process's node is in the set of allowed nodes, allocate with =

> __GFP_THISNODE for that node (for MPOL_PREFERRED, use that node with =

> __GFP_THISNODE instead).  This was changed for shmem_alloc_hugepage() to =

> allow fallback to other nodes in 89c83fb539f9 as it did for new_page() in =

> mm/mempolicy.c which is functionally different behavior and removes the =

> requirement to only allocate hugepages locally.

TBH this slight difference was known and stated in the changelog of
89c83fb539f9 so you could have objected.

> So this commit does a full revert of 89c83fb539f9 instead of the partial
> revert that was done in 2f0799a0ffc0.  The result is the same thp
> allocation policy for 4.20 that was in 4.19.
> =

> Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into alloc_hu=
gepage_direct_gfpmask")
> Fixes: 2f0799a0ffc0 ("mm, thp: restore node-local hugepage allocations")
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  This indeed restores the thp allocation policy fully to what it was in
>  4.19 since there is obivously more discussion to be had about how the
>  NUMA aspects of thp allocations should be addressed.  We can do this
>  with a stable 4.20 tree in the background that has the same allocation
>  policy that was in 4.0.

I agree that this is probably the safest option for now so that the next
rc doesn't contain the warning introduced in 2f0799a0ffc0.


--===============7927661949221463947==--

