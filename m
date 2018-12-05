Content-Type: multipart/mixed; boundary="===============6640650448576567406=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 10:08:56 +0100
Message-ID: <20181205090856.GY1286@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812041609160.213718@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6640650448576567406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue 04-12-18 16:47:23, David Rientjes wrote:
> On Tue, 4 Dec 2018, Mel Gorman wrote:
> =

> > What should also be kept in mind is that we should avoid conflating
> > locality preferences with THP preferences which is separate from THP
> > allocation latencies. The whole __GFP_THISNODE approach is pushing too
> > hard on locality versus huge pages when MADV_HUGEPAGE or always-defrag
> > are used which is very unfortunate given that MADV_HUGEPAGE in itself s=
ays
> > nothing about locality -- that is the business of other madvise flags or
> > a specific policy.
> =

> We currently lack those other madvise modes or mempolicies: mbind() is no=
t =

> a viable alternative because we do not want to oom kill when local memory =

> is depleted, we want to fallback to remote memory.

Yes, there was a clear agreement that there is no suitable mempolicy
right now and there were proposals to introduce MPOL_NODE_RECLAIM to
introduce that behavior. This would be an improvement regardless of THP
because global node-reclaim policy was simply a disaster we had to turn
off by default and the global semantic was a reason people just gave up
using it completely.

[...]

> Sure, but not at the cost of regressing real-world workloads; what is =

> being asked for here is legitimate and worthy of an extension, but since =

> the long-standing behavior has been to use __GFP_THISNODE and people =

> depend on that for NUMA locality,

Well, your patch has altered the semantic and has introduced a subtle
and _undocumented_ NUMA policy into MADV_HUGEPAGE. All that without any
workload numbers. It would be preferable to have a simulator of those
real world workloads of course but even getting some more detailed
metric - e.g. without the patch we have X THP utilization and the
runtime characteristics Y but without X1 and Y1).

> can we not fix the swap storm and look =

> to extending the API to include workloads that span multiple nodes?

Yes, we definitely want to address swap storms. No question about that.
But our established approach for NUMA policy has been to fallback to
other nodes and everybody focused on NUMA latency should use NUMA API to
achive that. Not vice versa.

As I've said in other thread, I am OK with restoring __GFP_THISNODE for
now but we should really have a very good plan for further steps. And
that involves an agreed NUMA behavior. I haven't seen any widespread
agreement on that yet though.

[...]
> > I would also re-emphasise that a major problem with addressing this
> > problem is that we do not have a general reproducible test case for
> > David's scenario where as we do have reproduction cases for the others.
> > They're not related to KVM but that doesn't matter because it's enough
> > to have a memory hog try allocating more memory than fits on a single n=
ode.
> > =

> =

> It's trivial to reproduce this issue: fragment all local memory that =

> compaction cannot resolve, do posix_memalign() for hugepage aligned =

> memory, and measure the access latency.  To fragment all local memory, yo=
u =

> can simply insert a kernel module and allocate high-order memory (just do =

> kmem_cache_alloc_node() or get_page() to pin it so compaction fails or =

> punch holes in the file as you did above).  You can do this for all memor=
y =

> rather than the local node to measure the even more severe allocation =

> latency regression that not setting __GFP_THISNODE introduces.

Sure, but can we get some numbers from a real workload rather than an
artificial worst case? The utilization issue Mel pointed out before and
here again is a real concern IMHO. We we definitely need a better
picture to make an educated decision.
-- =

Michal Hocko
SUSE Labs

--===============6640650448576567406==--

