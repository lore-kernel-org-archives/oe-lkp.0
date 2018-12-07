Content-Type: multipart/mixed; boundary="===============0734527806123795887=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Fri, 07 Dec 2018 15:05:28 -0800
Message-ID: <alpine.DEB.2.21.1812071450270.173448@chino.kir.corp.google.com>
In-Reply-To: <20181207080515.GT1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============0734527806123795887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Dec 2018, Michal Hocko wrote:

> > This reverts commit 89c83fb539f95491be80cdd5158e6f0ce329e317.
> > =

> > There are a couple of issues with 89c83fb539f9 independent of its parti=
al =

> > revert in 2f0799a0ffc0 ("mm, thp: restore node-local hugepage =

> > allocations"):
> > =

> > Firstly, the interaction between alloc_hugepage_direct_gfpmask() and =

> > alloc_pages_vma() is racy wrt __GFP_THISNODE and MPOL_BIND.  =

> > alloc_hugepage_direct_gfpmask() makes sure not to set __GFP_THISNODE fo=
r =

> > an MPOL_BIND policy but the policy used in alloc_pages_vma() may not be =

> > the same for shared vma policies, triggering the WARN_ON_ONCE() in =

> > policy_node().
> =

> Could you share a test case?
> =


Sorry, as Vlastimil pointed out this race does not exist anymore since =

commit 2f0799a0ffc0 ("mm, thp: restore node-local hugepage allocations") =

since it removed the restructuring of alloc_hugepage_direct_gfpmask().  It =

existed prior to this commit for shared vma policies that could modify the =

policy between alloc_hugepage_direct_gfpmask() and alloc_pages_vma() if =

the policy switches to MPOL_BIND in that window.

> > Secondly, prior to 89c83fb539f9, alloc_pages_vma() implemented a somewh=
at =

> > different policy for hugepage allocations, which were allocated through =

> > alloc_hugepage_vma().  For hugepage allocations, if the allocating =

> > process's node is in the set of allowed nodes, allocate with =

> > __GFP_THISNODE for that node (for MPOL_PREFERRED, use that node with =

> > __GFP_THISNODE instead).
> =

> Why is it wrong to fallback to an explicitly configured mbind mask?
> =


The new_page() case is similar to the shmem_alloc_hugepage() case.  Prior =

to 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into =

alloc_hugepage_direct_gfpmask"), shmem_alloc_hugepage() did =

alloc_pages_vma() with hugepage =3D=3D true, which effected a different =

allocation policy: if the node current is running on is allowed by the =

policy, use __GFP_THISNODE (considering ac5b2c18911ff is reverted, which =

it is in Linus's tree).

After 89c83fb539f9, we lose that and can fallback to remote memory.  Since =

the discussion is on-going wrt the NUMA aspects of hugepage allocations, =

it's better to have a stable 4.20 tree while that is being worked out and =

likely deserves separate patches for both new_page() and =

shmem_alloc_hugepage().  For the latter specifically, I assume it would be =

nice to get an Acked-by by Kirill who implemented shmem_alloc_hugepage() =

with hugepage =3D=3D true back in 4.8 that also had the __GFP_THISNODE =

behavior before the allocation policy is suddenly changed.

--===============0734527806123795887==--

