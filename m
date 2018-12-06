Content-Type: multipart/mixed; boundary="===============4875096082186004955=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch v2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Thu, 06 Dec 2018 13:42:05 -0800
Message-ID: <alpine.DEB.2.21.1812061341130.144733@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.21.1812051445390.35948@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4875096082186004955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, David Rientjes wrote:

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
> Signed-off-by: David Rientjes <rientjes@google.com>

We've identified a couple more regressions wrt 89c83fb539f9 ("mm, thp: =

consolidate THP gfp handling into alloc_hugepage_direct_gfpmask") in =

automated testing so I'm going to be proposing a full revert of that =

commit for 4.20 as a follow-up to this.

--===============4875096082186004955==--

