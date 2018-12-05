Content-Type: multipart/mixed; boundary="===============7176858295576066545=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 10:15:12 +0000
Message-ID: <20181205101512.GY23260@techsingularity.net>
In-Reply-To: <alpine.DEB.2.21.1812041415270.159770@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7176858295576066545==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 04, 2018 at 02:25:54PM -0800, David Rientjes wrote:
> On Tue, 4 Dec 2018, Michal Hocko wrote:
> =

> > > This fixes a 13.9% of remote memory access regression and 40% remote
> > > memory allocation regression on Haswell when the local node is fragme=
nted
> > > for hugepage sized pages and memory is being faulted with either the =
thp
> > > defrag setting of "always" or has been madvised with MADV_HUGEPAGE.
> > > =

> > > The usecase that initially identified this issue were binaries that m=
remap
> > > their .text segment to be backed by transparent hugepages on startup.
> > > They do mmap(), madvise(MADV_HUGEPAGE), memcpy(), and mremap().
> > =

> > Do you have something you can share with so that other people can play
> > and try to reproduce?
> > =

> =

> This is a single MADV_HUGEPAGE usecase, there is nothing special about it=
.  =

> It would be the same as if you did mmap(), madvise(MADV_HUGEPAGE), and =

> faulted the memory with a fragmented local node and then measured the =

> remote access latency to the remote hugepage that occurs without setting =

> __GFP_THISNODE.  You can also measure the remote allocation latency by =

> fragmenting the entire system and then faulting.
> =


I'll make the same point as before, the form the fragmentation takes
matters as well as the types of pages that are resident and whether
they are active or not. It affects the level of work the system does
as well as the overall success rate of operations (be it reclaim, THP
allocation, compaction, whatever). This is why a reproduction case that is
representative of the problem you're facing on the real workload matters
would have been helpful because then any alternative proposal could have
taken your workload into account during testing.

-- =

Mel Gorman
SUSE Labs

--===============7176858295576066545==--

