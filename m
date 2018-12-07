Content-Type: multipart/mixed; boundary="===============4472753991493073621=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [patch for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Fri, 07 Dec 2018 15:41:49 +0100
Message-ID: <296d9813-1dfe-f27c-8d2c-6f140d8a5b0d@suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812061343240.144733@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4472753991493073621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/6/18 11:00 PM, David Rientjes wrote:
> This reverts commit 89c83fb539f95491be80cdd5158e6f0ce329e317.
> =

> There are a couple of issues with 89c83fb539f9 independent of its partial =

> revert in 2f0799a0ffc0 ("mm, thp: restore node-local hugepage =

> allocations"):
> =

> Firstly, the interaction between alloc_hugepage_direct_gfpmask() and =

> alloc_pages_vma() is racy wrt __GFP_THISNODE and MPOL_BIND.  =

> alloc_hugepage_direct_gfpmask() makes sure not to set __GFP_THISNODE for =

> an MPOL_BIND policy but the policy used in alloc_pages_vma() may not be =

> the same for shared vma policies, triggering the WARN_ON_ONCE() in =

> policy_node().

AFAICS 2f0799a0ffc0 removed the policy check in
alloc_hugepage_direct_gfpmask() comlpetely, so it's not racy and the
warning will always trigger for a MPOL_BIND policy right now?

--===============4472753991493073621==--

