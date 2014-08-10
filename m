Content-Type: multipart/mixed; boundary="===============6582454282692695421=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: [sched] 143e1e28cb4: +17.9% aim7.jobs-per-min, -9.7% hackbench.throughput
Date: Sun, 10 Aug 2014 17:16:36 +0200
Message-ID: <20140810151636.GA25121@gmail.com>
In-Reply-To: <20140810150503.GV9918@twins.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============6582454282692695421==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Sun, Aug 10, 2014 at 06:54:13PM +0800, Fengguang Wu wrote:
> > The "brickland1/aim7/6000-page_test" is the test case part.
> > =

> > The "TOTAL XXX" is the metric part. One test run may generate lots of
> > metrics, reflecting different aspect of the system dynamics.
> > =

> > This view may be easier to read, by grouping the metrics by test case.
> =

> Right, at least that makes more sense.
> =

> > test case: brickland1/aim7/6000-page_test
> =

> Ok, so next question, what is a brickland? I suspect its a machine of
> sorts, seeing how some others had wsm in that part of the test. Now I
> know what a westmere is, but I've never heard of a brickland.
> =

> Please describe the machine, this is a topology patch, so we need to
> know the topology of the affected machines.

Wikipedia says:

http://en.wikipedia.org/wiki/List_of_Intel_codenames

Brickland 	Platform 	High-end server platform based on the Ivy Bridge-EX pr=
ocessor.[6] 	Reference unknown. 	2010

Thanks,

	Ingo

--===============6582454282692695421==--

