Content-Type: multipart/mixed; boundary="===============5153054558479837610=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Sun, 09 Dec 2018 16:29:13 -0800
Message-ID: <alpine.DEB.2.21.1812091538310.215735@chino.kir.corp.google.com>
In-Reply-To: <CAHk-=wjVuLjZ1Wr52W=hNqh=_8gbzuKA+YpsVb4NBHCJsE6cyA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5153054558479837610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Dec 2018, Linus Torvalds wrote:

> > On Broadwell, the access latency to local small pages was +5.6%, remote
> > hugepages +16.4%, and remote small pages +19.9%.
> >
> > On Naples, the access latency to local small pages was +4.9%, intrasock=
et
> > hugepages +10.5%, intrasocket small pages +19.6%, intersocket small pag=
es
> > +26.6%, and intersocket hugepages +29.2%
> =

> Are those two last numbers transposed?
> =

> Or why would small page accesses be *faster* than hugepages for the
> intersocket case?
> =

> Of course, depending on testing, maybe the page itself was remote, but
> the page tables were random, and you happened to get a remote page
> table for the hugepage case?
> =


Yes, looks like that was the case, if the page tables were from the same =

node as the intersocket remote hugepage it looks like a ~0.1% increase =

accessing small pages, so basically unchanged.  So this complicates the =

allocation strategy somewhat; on this platform, at least, hugepages are =

preferred on the same socket but there isn't a significant benefit from =

getting a cross socket hugepage over small page.

The typical way this is resolved is based on the SLIT and how the kernel =

defines RECLAIM_DISTANCE.  I'm not sure that we can expect the distances =

between proximity domains to be defined according to this value for a =

one-size-fits-all solution.  I've always thought that RECLAIM_DISTANCE =

should be configurable so that initscripts can actually determine its =

ideal value when using vm.zone_reclaim_mode.

> > So it *appears* from the x86 platforms that NUMA matters much more
> > significantly than hugeness, but remote hugepages are a slight win over
> > remote small pages.  PPC appeared the same wrt the local node but then
> > prefers hugeness over affinity when it comes to remote pages.
> =

> I do think POWER at least historically has much weaker TLB fills, but
> also very costly page table creation/teardown. Constant-time O(1)
> arguments about hash lookups are only worth so much when the constant
> time is pretty big. They've been working on it.
> =

> So at least on POWER, afaik one issue is literally that hugepages made
> the hash setup and teardown situation much better.
> =


I'm still working on the more elaborate test case that will generate these =

results because I think I can use it at boot to determine an ideal =

RECLAIM_DISTANCE.  I can also get numbers for hash vs radix MMU if you're =

interested.

> One thing that might be worth looking at is whether the process itself
> is all that node-local. Maybe we could aim for a policy that says
> "prefer local memory, but if we notice that the accesses to this vma
> aren't all that local, then who cares?".
> =

> IOW, the default could be something more dynamic than just "always use
> __GFP_THISNODE". It could be more along the lines of "start off using
> __GFP_THISNODE, but for longer-lived processes that bounce around
> across nodes, maybe relax it?"
> =


It would allow the use of MPOL_PREFERRED for an exact preference if they =

are known to not be bounced around.  This would be required for processes =

that are bound to the cpus of a single node through cpuset or =

sched_setaffinity() but unconstrained as far as memory is concerned.

The goal of __GFP_THISNODE being the default for thp, however, is that we =

*know* we're going to be accessing it locally at least in the short term, =

perhaps forever.  Any other default would assume the remotely allocated =

hugepage would eventually be accessed locally, otherwise we would have =

been much better off just failing the hugepage allocation and accessing =

small pages.  You could make an assumption that's the case iff the process =

does not fit in its local node, and I think that would be the minority of =

applications.

I guess there could be some heuristic that could determine this based on =

MM_ANONPAGES of Andrea's qemu and zone->zone_pgdat->node_present_pages.  =

It feels like something that should be more exactly defined, though, for =

the application to say that it prefers remote hugepages over local =

small pages because it can't access either locally forever anyway.

This was where I suggested a new prctl() mode so that an application can =

prefer remote hugepages because it knows it's larger than the single node =

and that requires no change to the binary itself because it is inherited =

across fork.

The sane default, though, seems to always prefer local allocation, whether =

hugepages or small pages, for the majority of workloads since that's where =

the lowest access latency is.

> Honestly, I think things like vm_policy etc should not be the solution
> - yes, some people may know *exactly* what access patterns they want,
> but for most situations, I think the policy should be that defaults
> "just work".
> =

> In fact, I wish even MADV_HUGEPAGE itself were to approach being a
> no-op with THP.
> =


Besides the NUMA locality of the allocations, we still have the allocation =

latency concern that MADV_HUGEPAGE changes.  The madvise mode has taken on =

two meanings: (1) prefer to fault hugepages when the thp enabled setting =

is "madvise" so other applications don't blow up their rss unexpectedly, =

and (2) try synchronous compaction/reclaim at fault for thp defrag =

settings of "madvise" or "defer+madvise".

 [ It was intended to take on an additional meaning through the =

   now-reverted patch, which was (3) relax the NUMA locality preference. ]

My binaries that remap their text segment to be backed by transparent =

hugepages and qemu both share the same preference to try hard to fault =

hugepages through compaction because we don't necessarily care about =

allocation latency, we care about access latency later.  Smaller binaries, =

those that do not have strict NUMA locality requirements, and short-lived =

allocations are not going to want to incur the performance penalty of =

synchronous compaction.

So I think today's semantics for MADV_HUGEPAGE make sense, but I'd like to =

explore other areas that could improve this, both for the default case and =

the specialized cases:

 - prctl() mode to readily allow remote allocations rather than reclaiming
   or compacting memory locally (affects more than just hugepages if the
   system has a non-zero vm.zone_reclaim_mode),

 - better feedback loop after the first compaction attempt in the page =

   allocator slowpath to determine if reclaim is actually worthwhile for
   high-order allocations, and

 - configurable vm.reclaim_distance (use RECLAIM_DISTANCE as the default)
   which can be defined since there is not a one-size-fits-all strategy
   for allocations (there's no benefit to allocating hugepages cross =

   socket on Naples, for example),

--===============5153054558479837610==--

