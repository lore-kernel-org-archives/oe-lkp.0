Content-Type: multipart/mixed; boundary="===============2323079804989484215=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 56498cfb04: netperf.Throughput_tps -5.4% regression
Date: Wed, 22 Sep 2021 14:44:00 +0200
Message-ID: <20210922124400.GQ4323@worktop.programming.kicks-ass.net>
In-Reply-To: <20210912153447.GG25450@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2323079804989484215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 12, 2021 at 11:34:47PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -5.4% regression of netperf.Throughput_tps due to commi=
t:
> =

> =

> commit: 56498cfb045d7147cdcba33795d19429afcd1d00 ("sched/fair: Avoid a se=
cond scan of target in select_idle_cpu")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

Mel, was this in line with your own benchmarks?
--===============2323079804989484215==--

