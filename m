Content-Type: multipart/mixed; boundary="===============2566372340460420934=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Mon, 24 Aug 2020 17:56:53 +0100
Message-ID: <20200824165653.GQ2976@suse.com>
In-Reply-To: <20200824161238.GI4794@zn.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============2566372340460420934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2020 at 06:12:38PM +0200, Borislav Petkov wrote:
> =

> > :)  Right, this is what I'm doing right now. Some test job is queued on
> > the test box, and it may needs some iterations of new patch. Hopefully =
we
> > can isolate some specific variable given some luck.
> =

> ... yes, exactly, you need to identify the contention where this
> happens,
> causing a cacheline to bounce or a variable straddles across a
> cacheline boundary, causing the read to fetch two cachelines and thus
> causes that slowdown. And then align that var to the beginning of a
> cacheline.
> =


Given the test is malloc1, it *may* be struct per_cpu_pages embedded within
per_cpu_pageset. The cache characteristics of per_cpu_pageset are terrible
because of how it mixes up zone counters and per-cpu lists. However, if
the first per_cpu_pageset is cache-aligned then every second per_cpu_pages
will be cache-aligned and half of the lists will fit in one cache line. If
the whole structure gets pushed out of alignment then all per_cpu_pages
straddle cache lines, increase the overall cache footprint and potentially
cause problems if the cache is not large enough to hold hot structures.

The misses could potentially be inferred without c2c from looking at
perf -e cache-misses on a good and bad kernel and seeing if there is a
noticable increase in misses in mm/page_alloc.c with a focus on anything
using per-cpu lists.

Whether the problem is per_cpu_pages or some other structure, it's not
struct mce's fault in all likelihood -- it's just the messenger.

-- =

Mel Gorman
SUSE Labs
--===============2566372340460420934==--

