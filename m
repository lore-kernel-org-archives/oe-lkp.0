Content-Type: multipart/mixed; boundary="===============5993379657023486385=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 10:43:43 +0000
Message-ID: <20181205104343.GZ23260@techsingularity.net>
In-Reply-To: <20181205090856.GY1286@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5993379657023486385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 10:08:56AM +0100, Michal Hocko wrote:
> On Tue 04-12-18 16:47:23, David Rientjes wrote:
> > On Tue, 4 Dec 2018, Mel Gorman wrote:
> > =

> > > What should also be kept in mind is that we should avoid conflating
> > > locality preferences with THP preferences which is separate from THP
> > > allocation latencies. The whole __GFP_THISNODE approach is pushing too
> > > hard on locality versus huge pages when MADV_HUGEPAGE or always-defrag
> > > are used which is very unfortunate given that MADV_HUGEPAGE in itself=
 says
> > > nothing about locality -- that is the business of other madvise flags=
 or
> > > a specific policy.
> > =

> > We currently lack those other madvise modes or mempolicies: mbind() is =
not =

> > a viable alternative because we do not want to oom kill when local memo=
ry =

> > is depleted, we want to fallback to remote memory.
> =

> Yes, there was a clear agreement that there is no suitable mempolicy
> right now and there were proposals to introduce MPOL_NODE_RECLAIM to
> introduce that behavior. This would be an improvement regardless of THP
> because global node-reclaim policy was simply a disaster we had to turn
> off by default and the global semantic was a reason people just gave up
> using it completely.
> =


The alternative is to define a clear semantic for THP allocation
requests that are considered "light" regardless of whether that needs a
GFP flag or not. A sensible default might be

o Allocate THP local if the amount of work is light or non-existant.
o Allocate THP remote if one is freely available with no additional work
  (maybe kick remote kcompactd)
o Allocate base page local if the amount of work is light or non-existant
o Allocate base page remote if the amount of work is light or non-existant
o Do heavy work in zonelist order until a base page is allocated somewhere

It's not something could be clearly expressed with either NORETRY or
THISNODE but longer-term might be saner than chopping and changing on
which flags are more important and which workload is most relevant. That
runs the risk of a revert-loop where each person targetting one workload
reverts one patch to insert another until someone throws up their hands
in frustration and just carries patches out-of-tree long-term.

I'm not going to prototype something along these lines for now as
fundamentally a better compaction could cut out part of the root cause
of pain.

-- =

Mel Gorman
SUSE Labs

--===============5993379657023486385==--

