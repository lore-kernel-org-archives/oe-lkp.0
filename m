Content-Type: multipart/mixed; boundary="===============4735867977381204996=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 56498cfb04: netperf.Throughput_tps -5.4% regression
Date: Wed, 22 Sep 2021 14:42:47 +0100
Message-ID: <20210922134247.GY3959@techsingularity.net>
In-Reply-To: <20210922124400.GQ4323@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============4735867977381204996==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 02:44:00PM +0200, Peter Zijlstra wrote:
> On Sun, Sep 12, 2021 at 11:34:47PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -5.4% regression of netperf.Throughput_tps due to com=
mit:
> > =

> > =

> > commit: 56498cfb045d7147cdcba33795d19429afcd1d00 ("sched/fair: Avoid a =
second scan of target in select_idle_cpu")
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git mast=
er
> =

> Mel, was this in line with your own benchmarks?

UDP-RR was not run but I could add it for future reference as a
socket-based-ping-pong test. However, it would not be equivalent to lkp
as I only run one client/server.

For UDP_STREAM with single client the significant differences reported
were;

machine1:	+1.07% to +1.54% depending on packet size
machine2:	-1.4%  to +0.9%
machine3:	+1.5%  to -2.46%
machine4:	+1.16% to +1.64%
machine5:	-1.59% to +1.23%
machine6:	-2.10% to +1.83%

So it was a mix of small gains and some regressions with more gains than
losses. As netperf is running localhost, it can be a bit unreliable and
other workloads showed more gains than losses. On machine 2, total system
CPU usage went from 1195.21 seconds to 1197.52 seconds but activities like
context switches and interrupt deliveries were broadly similar. There
were differences in the total number of slab pages used but roughly
similar trends to probably reflect the system starting state more than
anything else.

On balance, I concluded that rescanning target is wasteful and that while
there might be slight variances, they would be difficult to consistent
reproduce. The largest concern is that skipping target means that one
additional new rq is potentially examined. That would incur a small
penalty if it was a wasteful search.

For the LKP test, the nr_threads are 50% so I expect with two sockets,
the machine is fully loaded and would be vulnerable to load-balancing
artifacts as client and server threads move around. Hence, I ended up
thinking that this result was likely a false positive.

-- =

Mel Gorman
SUSE Labs
--===============4735867977381204996==--

