Content-Type: multipart/mixed; boundary="===============0938300326629654249=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [patch 1/2 for-4.20] mm, thp: restore node-local hugepage allocations
Date: Wed, 05 Dec 2018 08:34:34 +0100
Message-ID: <20181205073434.GT1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812041355100.157466@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0938300326629654249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 04-12-18 13:56:30, David Rientjes wrote:
> On Tue, 4 Dec 2018, Michal Hocko wrote:
> =

> > > This is a full revert of ac5b2c18911f ("mm: thp: relax __GFP_THISNODE=
 for
> > > MADV_HUGEPAGE mappings") and a partial revert of 89c83fb539f9 ("mm, t=
hp:
> > > consolidate THP gfp handling into alloc_hugepage_direct_gfpmask").
> > > =

> > > By not setting __GFP_THISNODE, applications can allocate remote hugep=
ages
> > > when the local node is fragmented or low on memory when either the thp
> > > defrag setting is "always" or the vma has been madvised with
> > > MADV_HUGEPAGE.
> > > =

> > > Remote access to hugepages often has much higher latency than local p=
ages
> > > of the native page size.  On Haswell, ac5b2c18911f was shown to have a
> > > 13.9% access regression after this commit for binaries that remap the=
ir
> > > text segment to be backed by transparent hugepages.
> > > =

> > > The intent of ac5b2c18911f is to address an issue where a local node =
is
> > > low on memory or fragmented such that a hugepage cannot be allocated.=
  In
> > > every scenario where this was described as a fix, there is abundant a=
nd
> > > unfragmented remote memory available to allocate from, even with a gr=
eater
> > > access latency.
> > > =

> > > If remote memory is also low or fragmented, not setting __GFP_THISNOD=
E was
> > > also measured on Haswell to have a 40% regression in allocation laten=
cy.
> > > =

> > > Restore __GFP_THISNODE for thp allocations.
> > > =

> > > Fixes: ac5b2c18911f ("mm: thp: relax __GFP_THISNODE for MADV_HUGEPAGE=
 mappings")
> > > Fixes: 89c83fb539f9 ("mm, thp: consolidate THP gfp handling into allo=
c_hugepage_direct_gfpmask")
> > =

> > At minimum do not remove the cleanup part which consolidates the gfp
> > hadnling to a single place. There is no real reason to have the
> > __GFP_THISNODE ugliness outside of alloc_hugepage_direct_gfpmask.
> > =

> =

> The __GFP_THISNODE usage is still confined to =

> alloc_hugepage_direct_gfpmask() for the thp fault path, we no longer set =

> it in alloc_pages_vma() as done before the cleanup.

Why should be new_page any different?

-- =

Michal Hocko
SUSE Labs

--===============0938300326629654249==--

