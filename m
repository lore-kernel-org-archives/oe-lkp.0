Content-Type: multipart/mixed; boundary="===============0816361406966781989=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Sat, 20 Aug 2016 13:16:43 +0100
Message-ID: <20160820121643.GR8119@techsingularity.net>
In-Reply-To: <20160819234839.GG22388@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============0816361406966781989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 20, 2016 at 09:48:39AM +1000, Dave Chinner wrote:
> On Fri, Aug 19, 2016 at 11:49:46AM +0100, Mel Gorman wrote:
> > On Thu, Aug 18, 2016 at 03:25:40PM -0700, Linus Torvalds wrote:
> > > It *could* be as simple/stupid as just saying "let's allocate the page
> > > cache for new pages from the current node" - and if the process that
> > > dirties pages just stays around on one single node, that might already
> > > be sufficient.
> > > =

> > > So just for testing purposes, you could try changing that
> > > =

> > >         return alloc_pages(gfp, 0);
> > > =

> > > in __page_cache_alloc() into something like
> > > =

> > >         return alloc_pages_node(cpu_to_node(raw_smp_processor_id())),=
 gfp, 0);
> > > =

> > > or something.
> > > =

> > =

> > The test would be interesting but I believe that keeping heavy writers
> > on one node will force them to stall early on dirty balancing even if
> > there is plenty of free memory on other nodes.
> =

> Well, it depends on the speed of the storage. The higher the speed
> of the storage, the less we care about stalling on dirty pages
> during reclaim. i.e. faster storage =3D=3D shorter stalls. We really
> should stop thinking we need to optimise reclaim purely for the
> benefit of slow disks.  500MB/s write speed with latencies of a
> under a couple of milliseconds is common hardware these days. pcie
> based storage (e.g. m2, nvme) is rapidly becoming commonplace and
> they can easily do 1-2GB/s write speeds.
> =


I partially agree. I've been of the opinion for a long time that dirty_time
would be desirable and limit the amount of dirty data by microseconds
required to sync the data and pick a default like 5 seconds. It's
non-trivial as the write speed of all BDIs would have to be estimated
and on rotary storage the estimate would be unreliable.

A short-term practical idea would be to distribute pages for writing
only when the dirty limit is almost reached on a given node. For fast
storage, the distribution may never happen.

Neither idea would actually impact the current problem though unless it
was combined with discarding clean cache agressively if the underlying
storage is fast. Hence, it would still be nice if the contention problem
could be mitigated. Did that last patch help any?

-- =

Mel Gorman
SUSE Labs

--===============0816361406966781989==--

