Content-Type: multipart/mixed; boundary="===============1244582060765112624=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 12:26:28 -0800
Message-ID: <alpine.DEB.2.21.1812031210490.192288@chino.kir.corp.google.com>
In-Reply-To: <20181203192344.GA2986@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1244582060765112624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 3 Dec 2018, Andrea Arcangeli wrote:

> It's trivial to reproduce the badness by running a memhog process that
> allocates more than the RAM of 1 NUMA node, under defrag=3Dalways
> setting (or by changing memhog to use MADV_HUGEPAGE) and it'll create
> swap storms despite 75% of the RAM is completely free in a 4 node NUMA
> (or 50% of RAM free in a 2 node NUMA) etc..
> =

> How can it be ok to push the system into gigabytes of swap by default
> without any special capability despite 50% - 75% or more of the RAM is
> free? That's the downside of the __GFP_THISNODE optimizaton.
> =


The swap storm is the issue that is being addressed.  If your remote =

memory is as low as local memory, the patch to clear __GFP_THISNODE has =

done nothing to fix it: you still get swap storms and memory compaction =

can still fail if the per-zone freeing scanner cannot utilize the =

reclaimed memory.  Recall that this patch to clear __GFP_THISNODE was =

measured by me to have a 40% increase in allocation latency for fragmented =

remote memory on Haswell.  It makes the problem much, much worse.

> __GFP_THISNODE helps increasing NUMA locality if your app can fit in a
> single node which is the common David's workload. But if his workload
> would more often than not fit in a single node, he would also run into
> an unacceptable slowdown because of the __GFP_THISNODE.
> =


Which is why I have suggested that we do not do direct reclaim, as the =

page allocator implementation expects all thp page fault allocations to =

have __GFP_NORETRY set, because no amount of reclaim can be shown to be =

useful to the memory compaction freeing scanner if it is iterated over by =

the migration scanner.

> I think there's lots of room for improvement for the future, but in my
> view that __GFP_THISNODE as it was implemented was an incomplete hack,
> that opened the door for bad VM corner cases that should not happen.
> =


__GFP_THISNODE is intended specifically because of the remote access =

latency increase that is encountered if you fault remote hugepages over =

local pages of the native page size.

--===============1244582060765112624==--

