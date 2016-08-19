Content-Type: multipart/mixed; boundary="===============7026427198831599278=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sat, 20 Aug 2016 09:48:39 +1000
Message-ID: <20160819234839.GG22388@dastard>
In-Reply-To: <20160819104946.GL8119@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============7026427198831599278==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2016 at 11:49:46AM +0100, Mel Gorman wrote:
> On Thu, Aug 18, 2016 at 03:25:40PM -0700, Linus Torvalds wrote:
> > It *could* be as simple/stupid as just saying "let's allocate the page
> > cache for new pages from the current node" - and if the process that
> > dirties pages just stays around on one single node, that might already
> > be sufficient.
> > =

> > So just for testing purposes, you could try changing that
> > =

> >         return alloc_pages(gfp, 0);
> > =

> > in __page_cache_alloc() into something like
> > =

> >         return alloc_pages_node(cpu_to_node(raw_smp_processor_id())), g=
fp, 0);
> > =

> > or something.
> > =

> =

> The test would be interesting but I believe that keeping heavy writers
> on one node will force them to stall early on dirty balancing even if
> there is plenty of free memory on other nodes.

Well, it depends on the speed of the storage. The higher the speed
of the storage, the less we care about stalling on dirty pages
during reclaim. i.e. faster storage =3D=3D shorter stalls. We really
should stop thinking we need to optimise reclaim purely for the
benefit of slow disks.  500MB/s write speed with latencies of a
under a couple of milliseconds is common hardware these days. pcie
based storage (e.g. m2, nvme) is rapidly becoming commonplace and
they can easily do 1-2GB/s write speeds.

The fast storage devices that are arriving need to be treated
more like a fast network device (e.g. a pci-e 4x nvme SSD has the
throughput of 2x10GbE devices). We have to consider if buffering
streaming data in the page cache for any longer than it takes to get
the data to userspace or to disk is worth the cost of reclaiming it
from the page cache.

Really, the question that needs to be answered is this: if we can
pull data from the storage at similar speeds and latencies as we can
from the page cache, then *why are we caching that data*?

We've already made that "don't cache for fast storage" decision in
the case of pmem - the DAX IO path is slowly moving towards making
full use of the mapping infrastructure for all it's tracking
requirements. pcie based storage is a bit slower than pmem, but
the principle is the same - the storage is sufficiently fast that
caching only really makes sense for data that is really hot...

I think the underlying principle here is that the faster the backing
device, the less we should cache and buffer the device in the OS. I
suspect a good initial approximation of "stickiness" for the page
cache would the speed of writeback as measured by the BDI underlying
the mapping....

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com

--===============7026427198831599278==--

