Content-Type: multipart/mixed; boundary="===============3714472749377976757=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Mon, 23 Mar 2015 16:46:21 +0800
Message-ID: <1427100381.17170.2.camel@intel.com>
In-Reply-To: <20150305102609.GS3087@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3714472749377976757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-03-05 at 10:26 +0000, Mel Gorman wrote:
> On Thu, Mar 05, 2015 at 01:34:59PM +0800, Huang Ying wrote:
> > Hi, Mel,
> > =

> > On Sat, 2015-02-28 at 15:30 +0800, Huang Ying wrote:
> > > On Sat, 2015-02-28 at 01:46 +0000, Mel Gorman wrote:
> > > > On Fri, Feb 27, 2015 at 03:21:36PM +0800, Huang Ying wrote:
> > > > > FYI, we noticed the below changes on
> > > > > =

> > > > > git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
> > > > > commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange z=
one fields into read-only, page alloc, statistics and page reclaim lines")
> > > > > =

> > > > > The perf cpu-cycles for spinlock (zone->lock) increased a lot.  I=
 suspect there are some cache ping-pong or false sharing.
> > > > > =

> > > > =

> > > > Are you sure about this result? I ran similar tests here and found =
that
> > > > there was a major regression introduced near there but it was commit
> > > > 05b843012335 ("mm: memcontrol: use root_mem_cgroup res_counter") th=
at
> > > > cause the problem and it was later reverted.  On local tests on a 4=
-node
> > > > machine, commit 3484b2de9499df23c4604a513b36f96326ae81ad was within=
 1%
> > > > of the previous commit and well within the noise.
> > > =

> > > After applying the below debug patch, the performance regression
> > > restored.  So I think we can root cause this regression to be cache l=
ine
> > > alignment related issue?
> > > =

> > > If my understanding were correct, after the 3484b2de94, lock and low
> > > address area free_area are in the same cache line, so that the cache
> > > line of the lock and the low address area of free_area will be switch=
ed
> > > between MESI "E" and "S" state because it is written in one CPU (page
> > > allocating with free_area) and frequently read (spinning on lock) in
> > > another CPU.
> > =

> > What do you think about this?
> > =

> =

> My attention is occupied by the automatic NUMA regression at the moment
> but I haven't forgotten this. Even with the high client count, I was not
> able to reproduce this so it appears to depend on the number of CPUs
> available to stress the allocator enough to bypass the per-cpu allocator
> enough to contend heavily on the zone lock. I'm hoping to think of a
> better alternative than adding more padding and increasing the cache
> footprint of the allocator but so far I haven't thought of a good
> alternative. Moving the lock to the end of the freelists would probably
> address the problem but still increases the footprint for order-0
> allocations by a cache line.

Any update on this?  Do you have some better idea?  I guess this may be
fixed via putting some fields that are only read during order-0
allocation with the same cache line of lock, if there are any.

Best Regards,
Huang, Ying



--===============3714472749377976757==--

