Content-Type: multipart/mixed; boundary="===============1127244196663207717=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Wed, 27 Apr 2022 12:59:20 +0800
Message-ID: <1971eb3a-d689-8b35-e500-8a60f41765db@intel.com>
In-Reply-To: <CAJD7tkaDWtgy3Ckhgo+vcbM7oYA8saPCVRvXLDKYHvRGYkKvoQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1127244196663207717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Yosry,

On 4/27/2022 12:34 PM, Yosry Ahmed wrote:
> I am not sure why this specific callsite causes regression, there are
> many callsites that modify stats similarly (whether through
> mod_memcg_state() directly or through other variants like
> mod_lruvec_state()). Maybe the kmem call path is exercised more
> heavily in this benchmark than other call paths that update stats.
perf data didn't show the function commented out either. No idea how
it impact the hackbench.

> =

> The only seemingly expensive operation in the mod_memcg_state() path
> is the call to cgroup_rstat_updated() (through memcg_rstat_updated()).
> One idea off the top of my head is to batch calls to
> cgroup_rstat_updated(), similar to what 11192d9c124d ("memcg: flush
> stats only if updated") did on the flush side. I am interested to see
> what memcg maintainers think about this problem (and the proposed
> solution).
OK. Let's wait.


Regards
Yin, Fengwei
--===============1127244196663207717==--

