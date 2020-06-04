Content-Type: multipart/mixed; boundary="===============8287017337337787320=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0b0695f2b3: phoronix-test-suite.compress-gzip.0.seconds 19.8% regression
Date: Thu, 04 Jun 2020 09:56:56 +0100
Message-ID: <20200604085656.GI3070@suse.de>
In-Reply-To: <CAKfTPtBLKUBF_p-LxfRce2nJQFqGj95KZ+yisAN_qrMq5VxW=w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8287017337337787320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2020 at 07:06:18PM +0200, Vincent Guittot wrote:
> > still exists, just the gap becomes smaller -
> > release         run1    run2
> > v5.4            4.32    4.3     <-- little change comparing to above
> > v5.5            5.04    5.06    <-- improves
> > v5.7-rc7        4.79    4.78
> > v5.7            4.77    4.77
> >
> > I also attached turbostat data as attached.
> =

> Thanks for the test results and the turbo stats figures.
> The outcomes are not as obvious as I would have expected. The
> performance difference for v5.5 and v5.7 when C6 and above are
> disabled tends to confirm that the idle state is impacting the
> performance but the difference still remain.
> Regarding turbostat output, the 1st main difference is the number of
> time the CPUs entered idle state:
> v5.4 run1 : 587252+905317+367732+859828+108+332436+110+217=3D3053000
> v5.7 run1 : 807623+639635+466723+1298557+108+283548+63+156=3D3496413
> which is +14% of entering idle.
> This is even more obvious on v5.5 run1:
> 761950+1320362+1681750+682042+91+304755+79+243=3D4751272 which is +55%
> of entering idle
> =

> We have a similar ratio without c6 and above c-state between v5.4 and
> v5.7 and the ratio has decreased to +22% between v5.4 and v5.5.
> =

> So this tends to confirm my assumption that tasks are more spread and
> this generates more enter/leave cpuidle. I still need to think about
> how to balance this
> =


I have not looked into the data in depth but it's worth noting that
cpuidle changed the time a CPU spent polling before entering a C state
within the same window.  See 36fcb4292473 ("cpuidle: use first valid target
residency as poll time") as an example where poll time went from hundreds
of nanoseconds to single digits depending on the machine. We used to poll
for up to a tick before entering idle. I'm not saying whether it's good
or bad but it certainly can have a big impact on how often a CPU enters
"true idle in a C state" as opposed to switching to the idle task (swapper)
for some house keeping.

Where things get fun is that the scheduler can make this more or less
obvious depending on its decisions. If tasks are bouncing like crazy around
a socket, the load balancer is shifting tasks like crazy or the scheduler
is stacking tasks when it should not then it can potentially perform
better in a benchmark if it prevents tasks entering a deep idle state.

-- =

Mel Gorman
SUSE Labs
--===============8287017337337787320==--

