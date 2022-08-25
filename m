Content-Type: multipart/mixed; boundary="===============5165515171512245976=="
MIME-Version: 1.0
From: Muchun Song <muchun.song@linux.dev>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Thu, 25 Aug 2022 16:30:48 +0800
Message-ID: <4A0F7B38-2701-486D-A847-DCC4B49F8EAF@linux.dev>
In-Reply-To: <20220825000506.239406-4-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5165515171512245976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



> On Aug 25, 2022, at 08:05, Shakeel Butt <shakeelb@google.com> wrote:
> =

> For several years, MEMCG_CHARGE_BATCH was kept at 32 but with bigger
> machines and the network intensive workloads requiring througput in
> Gbps, 32 is too small and makes the memcg charging path a bottleneck.
> For now, increase it to 64 for easy acceptance to 6.0. We will need to
> revisit this in future for ever increasing demand of higher performance.
> =

> Please note that the memcg charge path drain the per-cpu memcg charge
> stock, so there should not be any oom behavior change. Though it does
> have impact on rstat flushing and high limit reclaim backoff.
> =

> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy.
> =

> $ netserver -6
> # 36 instances of netperf with following params
> $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> =

> Results (average throughput of netperf):
> Without (6.0-rc1)       10482.7 Mbps
> With patch              17064.7 Mbps (62.7% improvement)
> =

> With the patch, the throughput improved by 62.7%.

This is very impressive.

> =

> Signed-off-by: Shakeel Butt <shakeelb@google.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Acked-by: Soheil Hassas Yeganeh <soheil@google.com>
> Reviewed-by: Feng Tang <feng.tang@intel.com>
> Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

Acked-by: Muchun Song <songmuchun@bytedance.com>

Thanks.
--===============5165515171512245976==--

