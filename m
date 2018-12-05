Content-Type: multipart/mixed; boundary="===============2666944792975715911=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [patch 0/2 for-4.20] mm, thp: fix remote access and allocation regressions
Date: Wed, 05 Dec 2018 11:41:31 -0800
Message-ID: <alpine.DEB.2.21.1812051126250.240991@chino.kir.corp.google.com>
In-Reply-To: <20181205101512.GY23260@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============2666944792975715911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Dec 2018, Mel Gorman wrote:

> > This is a single MADV_HUGEPAGE usecase, there is nothing special about =
it.  =

> > It would be the same as if you did mmap(), madvise(MADV_HUGEPAGE), and =

> > faulted the memory with a fragmented local node and then measured the =

> > remote access latency to the remote hugepage that occurs without settin=
g =

> > __GFP_THISNODE.  You can also measure the remote allocation latency by =

> > fragmenting the entire system and then faulting.
> > =

> =

> I'll make the same point as before, the form the fragmentation takes
> matters as well as the types of pages that are resident and whether
> they are active or not. It affects the level of work the system does
> as well as the overall success rate of operations (be it reclaim, THP
> allocation, compaction, whatever). This is why a reproduction case that is
> representative of the problem you're facing on the real workload matters
> would have been helpful because then any alternative proposal could have
> taken your workload into account during testing.
> =


We know from Andrea's report that compaction is failing, and repeatedly =

failing because otherwise we would not need excessive swapping to make it =

work.  That can mean one of two things: (1) a general low-on-memory =

situation that causes us repeatedly to be under watermarks to deem =

compaction suitable (isolate_freepages() will be too painful) or (2) =

compaction has the memory that it needs but is failing to make a hugepage =

available because all pages from a pageblock cannot be migrated.

If (1), perhaps in the presence of an antagonist that is quickly =

allocating the memory before compaction can pass watermark checks, further =

reclaim is not beneficial: the allocation is becoming too expensive and =

there is no guarantee that compaction can find this reclaimed memory in =

isolate_freepages().

I chose to duplicate (2) by synthetically introducing fragmentation =

(high-order slab, free every other one) locally to test the patch that =

does not set __GFP_THISNODE.  The result is a remote transparent hugepage, =

but we do not even need to get to the point of local compaction for that =

fallback to happen.  And this is where I measure the 13.9% access latency =

regression for the lifetime of the binary as a result of this patch.

If local compaction works the first time, great!  But that is not what is =

happening in Andrea's report and as a result of not setting __GFP_THISNODE =

we are *guaranteed* worse access latency and may encounter even worse =

allocation latency if the remote memory is fragmented as well.

So while I'm only testing the functional behavior of the patch itself, I =

cannot speak to the nature of the local fragmentation on Andrea's systems.

--===============2666944792975715911==--

