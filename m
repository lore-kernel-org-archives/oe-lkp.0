Content-Type: multipart/mixed; boundary="===============9197833327623295271=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 56498cfb04: netperf.Throughput_tps -5.4% regression
Date: Wed, 22 Sep 2021 16:31:37 +0200
Message-ID: <20210922143137.GT4323@worktop.programming.kicks-ass.net>
In-Reply-To: <20210922134247.GY3959@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============9197833327623295271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 02:42:47PM +0100, Mel Gorman wrote:
> For the LKP test, the nr_threads are 50% so I expect with two sockets,
> the machine is fully loaded and would be vulnerable to load-balancing
> artifacts as client and server threads move around. Hence, I ended up
> thinking that this result was likely a false positive.

Fair enough, lets ignore it for now then :-)
--===============9197833327623295271==--

