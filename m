Content-Type: multipart/mixed; boundary="===============7645798786389383468=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 11:18:36 +0100
Message-ID: <20181205101836.GF1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812041551170.213718@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7645798786389383468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 04-12-18 16:07:27, David Rientjes wrote:
> On Tue, 4 Dec 2018, Michal Hocko wrote:
> =

> > The thing I am really up to here is that reintroduction of
> > __GFP_THISNODE, which you are pushing for, will conflate madvise mode
> > resp. defrag=3Dalways with a numa placement policy because the allocati=
on
> > doesn't fallback to a remote node.
> > =

> =

> It isn't specific to MADV_HUGEPAGE, it is the policy for all transparent =

> hugepage allocations, including defrag=3Dalways.  We agree that =

> MADV_HUGEPAGE is not exactly defined: does it mean try harder to allocate =

> a hugepage locally, try compaction synchronous to the fault, allow remote =

> fallback?  It's undefined.

Yeah, it is certainly underdefined. One thing is clear though. Using
MADV_HUGEPAGE implies that the specific mapping benefits from THPs and
is willing to pay associated init cost. This doesn't imply anything
regarding NUMA locality and as we have NUMA API it shouldn't even
attempt to do so because it would be conflating two things.
[...]

> > And that is a fundamental problem and the antipattern I am talking
> > about. Look at it this way. All normal allocations are utilizing all the
> > available memory even though they might hit a remote latency penalty. If
> > you do care about NUMA placement you have an API to enforce a specific
> > placement.  What is so different about THP to behave differently. Do
> > we really want to later invent an API to actually allow to utilize all
> > the memory? There are certainly usecases (that triggered the discussion
> > previously) that do not mind the remote latency because all other
> > benefits simply outweight it?
> > =

> =

> What is different about THP is that on every platform I have measured, =

> NUMA matters more than hugepages.  Obviously if on Broadwell, Haswell, an=
d =

> Rome, remote hugepages were a performance win over local pages, this =

> discussion would not be happening.  Faulting local pages rather than =

> local hugepages, if possible, is easy and doesn't require reclaim.  =

> Faulting remote pages rather than reclaiming local pages is easy in your =

> scenario, it's non-disruptive.

You keep ignoring all other usecases mentioned before and that is not
really helpful. Access cost can be amortized by other savings. Not to
mention NUMA balancing moving around hot THPs with remote accesses.

> So to answer "what is so different about THP?", it's the performance data=
.  =

> The NUMA locality matters more than whether the pages are huge or not.  W=
e =

> also have the added benefit of khugepaged being able to collapse pages =

> locally if fragmentation improves rather than being stuck accessing a =

> remote hugepage forever.

Please back your claims by a variety of workloads. Including mentioned
KVMs one. You keep hand waving about access latency completely ignoring
all other aspects and that makes my suspicious that you do not really
appreciate all the complexity here even stronger.

If there was a general consensus we want to make THP very special wrt.
numa locality, I could live with that. It would be inconsistency in the
API and as such something that will kick us sooner or later. But it
seems that _you_ are the only one to push that direction and you keep
ignoring all other usecases consistently throughout all the discussions
we have had so far. Several people keeps pointing out that this is a
wrong direction but that seems to be completely ignored.

I believe that the only way forward is back your claims by numbers
covering a larger set of THP users and prove that remote THP is
a wrong default behavior. But you cannot really push that through based
on a single usecase of yours which you refuse to describe beyond a
simple access latency metric.
-- =

Michal Hocko
SUSE Labs

--===============7645798786389383468==--

