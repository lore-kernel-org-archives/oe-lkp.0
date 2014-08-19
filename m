Content-Type: multipart/mixed; boundary="===============2476336267625940720=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -56.2% vm-scalability.throughput, +9.3% turbostat.Pkg_W
Date: Tue, 19 Aug 2014 18:13:58 +0100
Message-ID: <20140819171358.GE10146@suse.de>
In-Reply-To: <20140819155125.GB2697@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2476336267625940720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2014 at 11:51:25PM +0800, Fengguang Wu wrote:
> On Tue, Aug 19, 2014 at 03:29:25PM +0100, Mel Gorman wrote:
> > On Tue, Aug 19, 2014 at 12:32:52PM +0800, Fengguang Wu wrote:
> > > Hi Mel,
> > > =

> > > We noticed the below vm-scalability performance/power regressions on
> > > commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange zone
> > > fields into read-only, page alloc, statistics and page reclaim lines"=
).
> > > =

> > > 24b7e5819ad5cbe  3484b2de9499df23c4604a513  testbox/testcase/testpara=
ms
> > > ---------------  -------------------------  -------------------------=
--
> > >      %stddev        %change               %stddev
> > >             \          |                 /
> > >       9.95 =C2=B1 2%     +69.1%      16.83 =C2=B1 5%  brickland3/vm-s=
calability/300s-lru-file-mmap-read
> > >       2.32 =C2=B1 6%    +229.4%       7.63 =C2=B1 5%  brickland3/vm-s=
calability/300s-lru-file-readonce
> > >      12.27 =C2=B1 3%     +99.4%      24.46 =C2=B1 5%  TOTAL vm-scalab=
ility.stddev
> > > =

> > > 24b7e5819ad5cbe  3484b2de9499df23c4604a513  =

> > > ---------------  -------------------------  =

> > >   13882598 =C2=B1 0%     -35.8%    8915310 =C2=B1 1%  brickland3/vm-s=
calability/300s-lru-file-mmap-read
> > >   36379953 =C2=B1 1%     -64.0%   13093373 =C2=B1 0%  brickland3/vm-s=
calability/300s-lru-file-readonce
> > >   50262551 =C2=B1 0%     -56.2%   22008683 =C2=B1 0%  TOTAL vm-scalab=
ility.throughput
> > > =

> > =

> > =

> > What units are these? It's completely unclear what is good and bad from=
 the
> > figures. 300s-lru-file-mmap-read appears multiple times in this report,
> > each with different numbers beside them but little clue as to what they
> > mean or what I'm meant to be looking for :(
> =

> Sorry the output format is a bit obscure: the stats names are after
> the "TOTAL" word, such as TOTAL vm-scalability.stddev, TOTAL
> vm-scalability.throughput, ...
> =

> > This is the same patch that was reported as having a performance gain in
> > another set of tests from lkp so am a little confused.
> =

> That can happen some times -- we've seen some commits to benefit some
> workloads while hurting some others. I'm now running more complete
> test set for the commit, hopefully can get some results tomorrow.
> =

> > More importantly, as this patch is primary abougt cache misses it should
> > be very unlikely that it makes a noticable difference to IO as the
> > relative cost of a cache miss is so low. Similarly any difference it
> > makes to reclaim activity is likely to be a coincidence or due to test
> > variance.
> =

> The test case creates tmpfs files and read them fast to exercise the LRU.
> So it's VM test and do not involve disk IO.
> =


Ok. How reliable is this? I was reading down through some of the figures and
some of them are extremely different in areas that this patch should have
no impact on -- it's just rearranging a struct after all. I note for example
that automatic NUMA balancing was enabled and there was activity from it so
pages are getting migrated.  There is a large amount of reclaim activity on
different nodes so where the test case gets scheduled and how nodes it runs
on during the test matters. What I'm wondering is if the performance of the
test tends to vary quite a lot naturally. Can you check if the performance
is consistently lower after this patch or if it tends to vary please?

Thanks

-- =

Mel Gorman
SUSE Labs

--===============2476336267625940720==--

