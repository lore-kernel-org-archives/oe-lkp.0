Content-Type: multipart/mixed; boundary="===============7165832464590717381=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Fri, 21 Feb 2020 11:58:00 +0100
Message-ID: <20200221105800.GF18400@hirez.programming.kicks-ass.net>
In-Reply-To: <20200221080325.GA67807@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7165832464590717381==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 04:03:25PM +0800, Feng Tang wrote:

> We checked more on this. We run 14 times test for it, and the
> results are consistent about the 5.5% degradation, and we
> run the same test on several other platforms, whose test results
> are also consistent, though there are no such -5.5% seen.

> So likely, this commit changes the layout of the kernel text
> and data, which may trigger some cacheline level change. From
> the system map of the 2 kernels, a big trunk of symbol's address
> changes which follow the global "pmu",
> =

> 5.0-rc6-systemap:
> =

> ffffffff8221d000 d pmu
> ffffffff8221d100 d pmc_reserve_mutex
> ffffffff8221d120 d amd_f15_PMC53
> ffffffff8221d160 d amd_f15_PMC50
> =

> 5.0-rc6+pmu-change-systemap:
> =

> ffffffff8221d000 d pmu
> ffffffff8221d120 d pmc_reserve_mutex
> ffffffff8221d140 d amd_f15_PMC53
> ffffffff8221d180 d amd_f15_PMC50
> =

> But we can hardly identify which exact symbol is responsible
> for the change, as too many symbols are offseted. =


*groan*, that's horrible.

Thanks for digging into this.
--===============7165832464590717381==--

