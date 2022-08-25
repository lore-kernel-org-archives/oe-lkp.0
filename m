Content-Type: multipart/mixed; boundary="===============8768173091982419276=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Wed, 24 Aug 2022 17:33:30 -0700
Message-ID: <20220824173330.2a15bcda24d2c3c248bc43c7@linux-foundation.org>
In-Reply-To: <20220825000506.239406-3-shakeelb@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8768173091982419276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Aug 2022 00:05:05 +0000 Shakeel Butt <shakeelb@google.com> wro=
te:

> With memcg v2 enabled, memcg->memory.usage is a very hot member for
> the workloads doing memcg charging on multiple CPUs concurrently.
> Particularly the network intensive workloads. In addition, there is a
> false cache sharing between memory.usage and memory.high on the charge
> path. This patch moves the usage into a separate cacheline and move all
> the read most fields into separate cacheline.
> =

> To evaluate the impact of this optimization, on a 72 CPUs machine, we
> ran the following workload in a three level of cgroup hierarchy.
> =

>  $ netserver -6
>  # 36 instances of netperf with following params
>  $ netperf -6 -H ::1 -l 60 -t TCP_SENDFILE -- -m 10K
> =

> Results (average throughput of netperf):
> Without (6.0-rc1)	10482.7 Mbps
> With patch		12413.7 Mbps (18.4% improvement)
> =

> With the patch, the throughput improved by 18.4%.
> =

> One side-effect of this patch is the increase in the size of struct
> mem_cgroup. For example with this patch on 64 bit build, the size of
> struct mem_cgroup increased from 4032 bytes to 4416 bytes. However for
> the performance improvement, this additional size is worth it. In
> addition there are opportunities to reduce the size of struct
> mem_cgroup like deprecation of kmem and tcpmem page counters and
> better packing.

Did you evaluate the effects of using a per-cpu counter of some form?
--===============8768173091982419276==--

