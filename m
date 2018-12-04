Content-Type: multipart/mixed; boundary="===============4134857401645425698=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Tue, 04 Dec 2018 13:56:30 -0800
Message-ID: <alpine.DEB.2.21.1812041355100.157466@chino.kir.corp.google.com>
In-Reply-To: <20181204073535.GV31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4134857401645425698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 4 Dec 2018, Michal Hocko wrote:

> > This is a full revert of ac5b2c18911f ("mm: thp: relax __GFP_THISNODE f=
or
> > MADV_HUGEPAGE mappings") and a partial revert of 89c83fb539f9 ("mm, thp:
> > consolidate THP gfp handling into alloc_hugepage_direct_gfpmask").
> > =

> > By not setting __GFP_THISNODE, applications can allocate remote hugepag=
es
> > when the local node is fragmented or low on memory when either the thp
> > defrag setting is "always" or the vma has been madvised with
> > MADV_HUGEPAGE.
> > =

> > Remote access to hugepages often has much higher latency than local pag=
es
> > of the native page size.  On Haswell, ac5b2c18911f was shown to have a
> > 13.9% access regression after this commit for binaries that remap their
> > text segment to be backed by transparent hugepages.
> > =

> > The intent of ac5b2c18911f is to address an issue where a local node is
> > low on memory or fragmented such that a hugepage cannot be allocated.  =
In
> > every scenario where this was described as a fix, there is abundant and
> > unfragmented remote memory available to allocate from, even with a grea=
ter
> > access latency.
> > =

> > If remote memory is also low or fragmented, not setting __GFP_THISNODE =
was
> > also measured on Haswell to have a 40% regression in allocation latency.
> > =

> > Restore __GFP_THISNODE for thp allocations.
> > =

> > Fixes: ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE m=
appings")
> > Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into alloc_=
hugepage_direct_gfpmask")
> =

> At minimum do not remove the cleanup part which consolidates the gfp
> hadnling to a single place. There is no real reason to have the
> __GFP_THISNODE ugliness outside of alloc_hugepage_direct_gfpmask.
> =


The __GFP_THISNODE usage is still confined to =

alloc_hugepage_direct_gfpmask() for the thp fault path, we no longer set =

it in alloc_pages_vma() as done before the cleanup.

--===============4134857401645425698==--

