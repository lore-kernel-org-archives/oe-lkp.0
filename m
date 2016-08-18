Content-Type: multipart/mixed; boundary="===============8092532299527763616=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 18 Aug 2016 14:24:14 +0100
Message-ID: <20160818132414.GK8119@techsingularity.net>
In-Reply-To: <20160818071111.GD22388@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============8092532299527763616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 05:11:11PM +1000, Dave Chinner wrote:
> On Thu, Aug 18, 2016 at 01:45:17AM +0100, Mel Gorman wrote:
> > On Wed, Aug 17, 2016 at 04:49:07PM +0100, Mel Gorman wrote:
> > > > Yes, we could try to batch the locking like DaveC already suggested
> > > > (ie we could move the locking to the caller, and then make
> > > > shrink_page_list() just try to keep the lock held for a few pages if
> > > > the mapping doesn't change), and that might result in fewer crazy
> > > > cacheline ping-pongs overall. But that feels like exactly the wrong
> > > > kind of workaround.
> > > > =

> > > =

> > > Even if such batching was implemented, it would be very specific to t=
he
> > > case of a single large file filling LRUs on multiple nodes.
> > > =

> > =

> > The latest Jason Bourne movie was sufficiently bad that I spent time
> > thinking how the tree_lock could be batched during reclaim. It's not
> > straight-forward but this prototype did not blow up on UMA and may be
> > worth considering if Dave can test either approach has a positive impac=
t.
> =

> SO, I just did a couple of tests. I'll call the two patches "sleepy"
> for the contention backoff patch and "bourney" for the Jason Bourne
> inspired batching patch. This is an average of 3 runs, overwriting
> a 47GB file on a machine with 16GB RAM:
> =

> 		IO throughput	wall time __pv_queued_spin_lock_slowpath
> vanilla		470MB/s		1m42s		25-30%
> sleepy		295MB/s		2m43s		<1%
> bourney		425MB/s		1m53s		25-30%
> =


Thanks. I updated the tests today and reran them trying to reproduce what
you saw but I'm simply not seeing it on bare metal with a spinning disk.

xfsio Throughput
                          4.8.0-rc2             4.8.0-rc2             4.8.0=
-rc2
                            vanilla                sleepy               bou=
rney
Min      tput    147.4450 (  0.00%)    147.2580 (  0.13%)    147.3900 (  0.=
04%)
Hmean    tput    147.5853 (  0.00%)    147.5101 (  0.05%)    147.6121 ( -0.=
02%)
Stddev   tput      0.1041 (  0.00%)      0.1785 (-71.47%)      0.2036 (-95.=
63%)
CoeffVar tput      0.0705 (  0.00%)      0.1210 (-71.56%)      0.1379 (-95.=
59%)
Max      tput    147.6940 (  0.00%)    147.6420 (  0.04%)    147.8820 ( -0.=
13%)

I'm currently setting up a KVM instance that may fare better. Due to
quirks of where machines are, I have to setup the KVM instance on real
NUMA hardware but maybe that'll make the problem even more obvious.

> The overall CPU usage of sleepy was much lower than the others, but
> it was also much slower. Too much sleeping and not enough reclaim
> work being done, I think.
> =


Looks like it. On my initial test, there was barely any sleeping.

> As for bourney, it's not immediately clear as to why it's nearly as
> bad as the movie. At worst I would have expected it to have not
> noticable impact, but maybe we are delaying freeing of pages too
> long and so stalling allocation of new pages? It also doesn't do
> much to reduce contention, especially considering the reduction in
> throughput.
> =

> On a hunch that the batch list isn't all one mapping, I sorted it.
> Patch is below if you're curious.
> =


The fact that sorting makes such a difference makes me think that it's
the wrong direction. It's far too specific to this test case and does
nothing to throttle a reclaimer. It's also fairly complex and I expected
that normal users of remove_mapping such as truncation would take a hit.

The hit of bouncing the lock around just hurts too much.

> FWIW, I just remembered about /proc/sys/vm/zone_reclaim_mode.
> =


That is a terrifying "fix" for this problem. It just happens to work
because there is no spillover to other nodes so only one kswapd instance
is potentially active.

> Anyway, I've burnt enough erase cycles on this SSD for today....
> =


I'll continue looking at getting KVM up and running and then consider
other possibilities for throttling.

-- =

Mel Gorman
SUSE Labs

--===============8092532299527763616==--

