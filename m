Content-Type: multipart/mixed; boundary="===============6231329213810121122=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Mon, 10 Dec 2018 09:34:09 +0100
Message-ID: <20181210083409.GJ1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812071450270.173448@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6231329213810121122==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 07-12-18 15:05:28, David Rientjes wrote:
> On Fri, 7 Dec 2018, Michal Hocko wrote:
[...]
> > > Secondly, prior to 89c83fb539f9, alloc_pages_vma() implemented a some=
what =

> > > different policy for hugepage allocations, which were allocated throu=
gh =

> > > alloc_hugepage_vma().  For hugepage allocations, if the allocating =

> > > process's node is in the set of allowed nodes, allocate with =

> > > __GFP_THISNODE for that node (for MPOL_PREFERRED, use that node with =

> > > __GFP_THISNODE instead).
> > =

> > Why is it wrong to fallback to an explicitly configured mbind mask?
> > =

> =

> The new_page() case is similar to the shmem_alloc_hugepage() case.  Prior =

> to 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into =

> alloc_hugepage_direct_gfpmask"), shmem_alloc_hugepage() did =

> alloc_pages_vma() with hugepage =3D=3D true, which effected a different =

> allocation policy: if the node current is running on is allowed by the =

> policy, use __GFP_THISNODE (considering ac5b2c18911ff is reverted, which =

> it is in Linus's tree).
> =

> After 89c83fb539f9, we lose that and can fallback to remote memory.  Sinc=
e =

> the discussion is on-going wrt the NUMA aspects of hugepage allocations, =

> it's better to have a stable 4.20 tree while that is being worked out and =

> likely deserves separate patches for both new_page() and =

> shmem_alloc_hugepage().  For the latter specifically, I assume it would b=
e =

> nice to get an Acked-by by Kirill who implemented shmem_alloc_hugepage() =

> with hugepage =3D=3D true back in 4.8 that also had the __GFP_THISNODE =

> behavior before the allocation policy is suddenly changed.

This should be a part of the changelog.

-- =

Michal Hocko
SUSE Labs

--===============6231329213810121122==--

