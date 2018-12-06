Content-Type: multipart/mixed; boundary="===============8327676860329846296=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Thu, 06 Dec 2018 15:43:26 -0800
Message-ID: <alpine.DEB.2.21.1812061505010.162675@chino.kir.corp.google.com>
In-Reply-To: <CAHk-=wjm9V843eg0uesMrxKnCCq7UfWn8VJ+z-cNztb_0fVW6A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8327676860329846296==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Linus Torvalds wrote:

> > Ok, I've applied David's latest patch.
> >
> > I'm not at all objecting to tweaking this further, I just didn't want
> > to have this regression stand.
> =

> Hmm. Can somebody (David?) also perhaps try to state what the
> different latency impacts end up being? I suspect it's been mentioned
> several times during the argument, but it would be nice to have a
> "going forward, this is what I care about" kind of setup for good
> default behavior.
> =


I'm in the process of writing a more complete test case for this but I =

benchmarked a few platforms based solely on remote hugepages vs local =

small pages vs remote hugepages.  My previous numbers were based on data =

from actual workloads.

For all platforms, local hugepages are the premium, of course.

On Broadwell, the access latency to local small pages was +5.6%, remote =

hugepages +16.4%, and remote small pages +19.9%.

On Naples, the access latency to local small pages was +4.9%, intrasocket =

hugepages +10.5%, intrasocket small pages +19.6%, intersocket small pages =

+26.6%, and intersocket hugepages +29.2%

The results on Murano were similar, which is why I suspect Aneesh =

introduced the __GFP_THISNODE requirement for thp in 4.0, which preferred, =

in order, local small pages, remote 1-hop hugepages, remote 2-hop =

hugepages, remote 1-hop small pages, remote 2-hop small pages.

So it *appears* from the x86 platforms that NUMA matters much more =

significantly than hugeness, but remote hugepages are a slight win over =

remote small pages.  PPC appeared the same wrt the local node but then =

prefers hugeness over affinity when it comes to remote pages.

Of course this could be much different on platforms I have not tested.  I =

can look at POWER9 but I suspect it will be similar to Murano.

> How much of the problem ends up being about the cost of compaction vs
> the cost of getting a remote node bigpage?
> =

> That would seem to be a fairly major issue, but __GFP_THISNODE affects
> both. It limits compaction to just this now, in addition to obviously
> limiting the allocation result.
> =

> I realize that we probably do want to just have explicit policies that
> do not exist right now, but what are (a) sane defaults, and (b) sane
> policies?
> =


The common case is that local node allocation, whether huge or small, is =

*always* better.  After that, I assume than some actual measurement of =

access latency at boot would be better than hardcoding a single policy in =

the page allocator for everybody.  On my x86 platforms, it's always a =

simple preference of "try huge, try small, go to the next nearest node, =

repeat".  On my PPC platforms, it's "try local huge, try local small, try =

huge from remaining nodes, try small from remaining nodes."

> For example, if we cannot get a hugepage on this node, but we *do* get
> a node-local small page, is the local memory advantage simply better
> than the possible TLB advantage?
> =

> Because if that's the case (at least commonly), then that in itself is
> a fairly good argument for "hugepage allocations should always be
> THISNODE".
> =

> But David also did mention the actual allocation overhead itself in
> the commit, and maybe the math is more "try to get a local hugepage,
> but if no such thing exists, see if you can get a remote hugepage
> _cheaply_".
> =

> So another model can be "do local-only compaction, but allow non-local
> allocation if the local node doesn't have anything". IOW, if other
> nodes have hugepages available, pick them up, but don't try to compact
> other nodes to do so?
> =


It would be nice if there was a specific policy that was optimal on all =

platforms; since that's not the case, introducing a sane default policy is =

going to require some complexity.

It would likely always make sense to allocate huge over small pages =

remotely when local allocation is not possible both for MADV_HUGEPAGE =

users and non-MADV_HUGEPAGE users.  That would require a restructuring of =

how thp fallback is done which, today, is try to allocate huge locally and =

fail so handle_pte_fault() can take it from there and would obviously =

touch more than just the page allocator.  I *suspect* that's not all that =

common because it's easier to reclaim some pages and fault local small =

pages instead, which always has better access latency.

What's different in this discussion thus far is workloads that do not fit =

into a single node so allocating remote hugepages is actually better than =

constantly reclaiming and compacting locally.  Mempolicies are =

interesting, but I worry about the interaction it would have with small =

page policies because you can only define one mode: we may have a =

combination of default, interleave, bind, and preferred policies for huge =

and small memory and that may become overly complex.

Since these workloads are in the minority and it seems, to me at least, =

that it's a property of the size of the workload rather than a general =

desire for remote hugepages over small pages for specific ranges of =

memory.

We already have prctl(PR_SET_THP_DISABLE) which was introduced by SGI and =

is inherited by child processes so that it's possible to disable hugepages =

for a process where you cannot modify the binary or rebuild it.  For this =

particular usecase, I'd suggest adding a new prctl() mode rather than any =

new madvise mode or mempolicy to prefer allocating remote hugepages as =

well because the workload cannot fit into a single node.

The implementation would be quite simple, add a new per-process =

PF_REMOTE_HUGEPAGE flag that is inherited across fork, and does not set =

__GFP_THISNODE in alloc_pages_vma() when faulting hugepages.  This would =

require no change to qemu or any other binary if the execing process sets =

it because it already *knows* the special requirements of that specific =

workload.  Andrea, would this work for you?

It also seems more extensible because prctl() modes can take arguments so =

you could specify the exact allocation policy for the workload to define =

whether it is willing to reclaim or compact from remote memory, for =

example, during fault to get a hugepage or whether it should truly be best =

effort.

--===============8327676860329846296==--

