Content-Type: multipart/mixed; boundary="===============5892315317728969452=="
MIME-Version: 1.0
From: SeongJae Park <sj38.park@gmail.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Tue, 13 Apr 2021 07:51:55 +0000
Message-ID: <20210413075155.32652-1-sjpark@amazon.de>
In-Reply-To: <20210413065633.2782273-1-yuzhao@google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5892315317728969452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: SeongJae Park <sjpark@amazon.de>

Hello,


Very interesting work, thank you for sharing this :)

On Tue, 13 Apr 2021 00:56:17 -0600 Yu Zhao <yuzhao@google.com> wrote:

> What's new in v2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Special thanks to Jens Axboe for reporting a regression in buffered
> I/O and helping test the fix.

Is the discussion open?  If so, could you please give me a link?

> =

> This version includes the support of tiers, which represent levels of
> usage from file descriptors only. Pages accessed N times via file
> descriptors belong to tier order_base_2(N). Each generation contains
> at most MAX_NR_TIERS tiers, and they require additional MAX_NR_TIERS-2
> bits in page->flags. In contrast to moving across generations which
> requires the lru lock, moving across tiers only involves an atomic
> operation on page->flags and therefore has a negligible cost. A
> feedback loop modeled after the well-known PID controller monitors the
> refault rates across all tiers and decides when to activate pages from
> which tiers, on the reclaim path.
> =

> This feedback model has a few advantages over the current feedforward
> model:
> 1) It has a negligible overhead in the buffered I/O access path
>    because activations are done in the reclaim path.
> 2) It takes mapped pages into account and avoids overprotecting pages
>    accessed multiple times via file descriptors.
> 3) More tiers offer better protection to pages accessed more than
>    twice when buffered-I/O-intensive workloads are under memory
>    pressure.
> =

> The fio/io_uring benchmark shows 14% improvement in IOPS when randomly
> accessing Samsung PM981a in the buffered I/O mode.

Improvement under memory pressure, right?  How much pressure?

[...]
> =

> Differential scans via page tables
> ----------------------------------
> Each differential scan discovers all pages that have been referenced
> since the last scan. Specifically, it walks the mm_struct list
> associated with an lruvec to scan page tables of processes that have
> been scheduled since the last scan.

Does this means it scans only virtual address spaces of processes and there=
fore
pages in the page cache that are not mmap()-ed will not be scanned?

> The cost of each differential scan
> is roughly proportional to the number of referenced pages it
> discovers. Unless address spaces are extremely sparse, page tables
> usually have better memory locality than the rmap. The end result is
> generally a significant reduction in CPU usage, for workloads using a
> large amount of anon memory.

When and how frequently it scans?


Thanks,
SeongJae Park

[...]
--===============5892315317728969452==--

