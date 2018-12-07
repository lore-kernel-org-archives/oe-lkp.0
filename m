Content-Type: multipart/mixed; boundary="===============3625957049633403695=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch for-4.20] Revert "mm, thp: consolidate THP gfp handling into alloc_hugepage_direct_gfpmask"
Date: Fri, 07 Dec 2018 14:27:22 -0800
Message-ID: <alpine.DEB.2.21.1812071421030.148470@chino.kir.corp.google.com>
In-Reply-To: <296d9813-1dfe-f27c-8d2c-6f140d8a5b0d@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============3625957049633403695==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Dec 2018, Vlastimil Babka wrote:

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

> AFAICS 2f0799a0ffc0 removed the policy check in
> alloc_hugepage_direct_gfpmask() comlpetely, so it's not racy and the
> warning will always trigger for a MPOL_BIND policy right now?
> =


Yup, looks like you hit it on the head.  This revert should have been done =

alongside 2f0799a0ffc0 ("mm, thp: restore node-local hugepage =

allocations"), I didn't appreciate how invasive the consolidation patch =

was.

I noticed the race in 89c83fb539f9 ("mm, thp: consolidate THP gfp handling =

into alloc_hugepage_direct_gfpmask") that is fixed by the revert, but as =

you noted it didn't cleanup the second part which is the balancing act for =

gfp flags between alloc_hugepage_direct_gfpmask() and alloc_pages_vma().  =

Syzbot found this to trigger the WARN_ON_ONCE() you mention.

So we certainly need this patch for 4.20 as a follow-up to 2f0799a0ffc0.  =

It's likely better to regroup and discuss NUMA aspects of all thp =

allocations separately with a stable 4.20.

--===============3625957049633403695==--

