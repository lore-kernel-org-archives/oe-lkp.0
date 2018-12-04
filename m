Content-Type: multipart/mixed; boundary="===============7980800978108089823=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 04 Dec 2018 09:48:21 +0100
Message-ID: <20181204084821.GB1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812031345180.224765@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7980800978108089823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 03-12-18 13:53:21, David Rientjes wrote:
> On Mon, 3 Dec 2018, Michal Hocko wrote:
> =

> > > I think extending functionality so thp can be allocated remotely if t=
ruly =

> > > desired is worthwhile
> > =

> > This is a complete NUMA policy antipatern that we have for all other
> > user memory allocations. So far you have to be explicit for your numa
> > requirements. You are trying to conflate NUMA api with MADV and that is
> > just conflating two orthogonal things and that is just wrong.
> > =

> =

> No, the page allocator change for both my patch and __GFP_COMPACT_ONLY ha=
s =

> nothing to do with any madvise() mode.  It has to do with where thp =

> allocations are preferred.  Yes, this is different than other memory =

> allocations where it doesn't cause a 13.9% access latency regression for =

> the lifetime of a binary for users who back their text with hugepages.  =

> MADV_HUGEPAGE still has its purpose to try synchronous memory compaction =

> at fault time under all thp defrag modes other than "never".  The specifi=
c =

> problem being reported here, and that both my patch and __GFP_COMPACT_ONL=
Y =

> address, is the pointless reclaim activity that does not assist in making =

> compaction more successful.

You do not address my concern though. Sure there are reclaim related
issues. Nobody is questioning that. But that is only half of the
problem.

The thing I am really up to here is that reintroduction of
__GFP_THISNODE, which you are pushing for, will conflate madvise mode
resp. defrag=3Dalways with a numa placement policy because the allocation
doesn't fallback to a remote node.

And that is a fundamental problem and the antipattern I am talking
about. Look at it this way. All normal allocations are utilizing all the
available memory even though they might hit a remote latency penalty. If
you do care about NUMA placement you have an API to enforce a specific
placement.  What is so different about THP to behave differently. Do
we really want to later invent an API to actually allow to utilize all
the memory? There are certainly usecases (that triggered the discussion
previously) that do not mind the remote latency because all other
benefits simply outweight it?

That being said what should users who want to use all the memory do to
use as many THPs as possible?
-- =

Michal Hocko
SUSE Labs

--===============7980800978108089823==--

