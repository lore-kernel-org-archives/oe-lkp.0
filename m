Content-Type: multipart/mixed; boundary="===============7328737411678651870=="
MIME-Version: 1.0
From: Roman Gushchin <roman.gushchin@linux.dev>
To: lkp@lists.01.org
Subject: Re: [PATCH 3/3] memcg: increase MEMCG_CHARGE_BATCH to 64
Date: Mon, 22 Aug 2022 11:37:30 -0700
Message-ID: <YwPM6o1+pZ2kRyy3@P9FQF9L96D>
In-Reply-To: <20220822001737.4120417-4-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7328737411678651870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2022 at 12:17:37AM +0000, Shakeel Butt wrote:
> For several years, MEMCG_CHARGE_BATCH was kept at 32 but with bigger
> machines and the network intensive workloads requiring througput in
> Gbps, 32 is too small and makes the memcg charging path a bottleneck.
> For now, increase it to 64 for easy acceptance to 6.0. We will need to
> revisit this in future for ever increasing demand of higher performance.
> =

> Please note that the memcg charge path drain the per-cpu memcg charge
> stock, so there should not be any oom behavior change.
> =

> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy with top
> level having min and low setup appropriately. More specifically
> memory.min equal to size of netperf binary and memory.low double of
> that.
> =

>  $ netserver -6
>  # 36 instances of netperf with following params
>  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> =

> Results (average throughput of netperf):
> Without (6.0-rc1)       10482.7 Mbps
> With patch              17064.7 Mbps (62.7% improvement)
> =

> With the patch, the throughput improved by 62.7%.

This is pretty significant!

Acked-by: Roman Gushchin <roman.gushchin@linux.dev>

I wonder only if we want to make it configurable (Idk a sysctl or maybe
a config option) and close the topic.

Thanks!
--===============7328737411678651870==--

