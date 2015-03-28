Content-Type: multipart/mixed; boundary="===============7366876633575641714=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: Move zone lock to a different cache line than order-0 free page lists
Date: Fri, 27 Mar 2015 18:28:53 -0700
Message-ID: <alpine.DEB.2.10.1503271828400.5628@chino.kir.corp.google.com>
In-Reply-To: <20150327095413.GO4701@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7366876633575641714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Mar 2015, Mel Gorman wrote:

> Huang Ying reported the following problem due to commit 3484b2de9499
> ("mm: rearrange zone fields into read-only, page alloc, statistics and
> page reclaim lines") from the Intel performance tests
> =

>     24b7e5819ad5cbef  3484b2de9499df23c4604a513b
>     ----------------  --------------------------
>              %stddev     %change         %stddev
>                  \          |                \
>         152288 \261  0%     -46.2%      81911 \261  0%  aim7.jobs-per-min
>            237 \261  0%     +85.6%        440 \261  0%  aim7.time.elapsed=
_time
>            237 \261  0%     +85.6%        440 \261  0%  aim7.time.elapsed=
_time.max
>          25026 \261  0%     +70.7%      42712 \261  0%  aim7.time.system_=
time
>        2186645 \261  5%     +32.0%    2885949 \261  4%  aim7.time.volunta=
ry_context_switches
>        4576561 \261  1%     +24.9%    5715773 \261  0%  aim7.time.involun=
tary_context_switches
> =

> The problem is specific to very large machines under stress. It was not
> reproducible with the machines I had used to justify the original patch
> because large numbers of CPUs are required. When pressure is high enough,
> the cache line is bouncing between CPUs trying to acquire the lock and
> the holder of the lock adjusting free lists. The intention was that the
> acquirer of the lock would automatically have the cache line holding the
> free lists but according to Huang, this is not a universal win.
> =

> One possibility is to move the zone lock to its own cache line but it
> increases the size of the zone. This patch moves the lock to the other
> end of the free lists where they do not contend under high pressure. It
> does mean the page allocator paths now require more cache lines but Huang
> reports that it restores performance to previous levels on large machines
> =

>              %stddev     %change         %stddev
>                  \          |                \
>          84568 \261  1%     +94.3%     164280 \261  1%  aim7.jobs-per-min
>        2881944 \261  2%     -35.1%    1870386 \261  8%  aim7.time.volunta=
ry_context_switches
>            681 \261  1%      -3.4%        658 \261  0%  aim7.time.user_ti=
me
>        5538139 \261  0%     -12.1%    4867884 \261  0%  aim7.time.involun=
tary_context_switches
>          44174 \261  1%     -46.0%      23848 \261  1%  aim7.time.system_=
time
>            426 \261  1%     -48.4%        219 \261  1%  aim7.time.elapsed=
_time
>            426 \261  1%     -48.4%        219 \261  1%  aim7.time.elapsed=
_time.max
>            468 \261  1%     -43.1%        266 \261  2%  uptime.boot
> =

> Reported-and-tested-by: Huang Ying <ying.huang@intel.com>
> Signed-off-by: Mel Gorman <mgorman@suse.de>

Acked-by: David Rientjes <rientjes@google.com>

--===============7366876633575641714==--

