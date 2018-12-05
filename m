Content-Type: multipart/mixed; boundary="===============6861833626046549179=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 11:16:05 -0800
Message-ID: <alpine.DEB.2.21.1812051103560.240991@chino.kir.corp.google.com>
In-Reply-To: <20181205101836.GF1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6861833626046549179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Michal Hocko wrote:

> > It isn't specific to MADV_HUGEPAGE, it is the policy for all transparen=
t =

> > hugepage allocations, including defrag=3Dalways.  We agree that =

> > MADV_HUGEPAGE is not exactly defined: does it mean try harder to alloca=
te =

> > a hugepage locally, try compaction synchronous to the fault, allow remo=
te =

> > fallback?  It's undefined.
> =

> Yeah, it is certainly underdefined. One thing is clear though. Using
> MADV_HUGEPAGE implies that the specific mapping benefits from THPs and
> is willing to pay associated init cost. This doesn't imply anything
> regarding NUMA locality and as we have NUMA API it shouldn't even
> attempt to do so because it would be conflating two things.

This is exactly why we use MADV_HUGEPAGE when remapping our text segment =

to be backed by transparent hugepages, we want to pay the cost at startup =

to fault thp and that involves synchronous memory compaction rather than =

quickly falling back to remote memory.  This is making the case for me.

> > So to answer "what is so different about THP?", it's the performance da=
ta.  =

> > The NUMA locality matters more than whether the pages are huge or not. =
 We =

> > also have the added benefit of khugepaged being able to collapse pages =

> > locally if fragmentation improves rather than being stuck accessing a =

> > remote hugepage forever.
> =

> Please back your claims by a variety of workloads. Including mentioned
> KVMs one. You keep hand waving about access latency completely ignoring
> all other aspects and that makes my suspicious that you do not really
> appreciate all the complexity here even stronger.
> =


I discussed the tradeoff of local hugepages vs local pages vs remote =

hugepages in https://marc.info/?l=3Dlinux-kernel&m=3D154077010828940 on =

Broadwell, Haswell, and Rome.  When a single application does not fit on a =

single node, we obviously need to extend the API to allow it to fault =

remotely.  We can do that without changing long-standing behavior that =

prefers to only fault locally and causing real-world users to regress.  =

Your suggestions about how we can extend the API are all very logical.

 [ Note that is not the regression being addressed here, however, which is =

   massive swap storms due to a fragmented local node, which is why the
   __GFP_COMPACT_ONLY patch was also proposed by Andrea.  The ability to
   prefer faulting remotely is a worthwhile extension but it does no
   good whatsoever if we can encounter massive swap storms because we
   didn't set __GFP_NORETRY appropriately (which both of our patches do)
   both locally and now remotely. ]

--===============6861833626046549179==--

