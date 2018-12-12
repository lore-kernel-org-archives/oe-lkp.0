Content-Type: multipart/mixed; boundary="===============8658105922276973876=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 12 Dec 2018 11:14:05 +0100
Message-ID: <0bbf4202-6187-28fb-37b7-da6885b89cce@suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812111609060.255489@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8658105922276973876==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/12/18 1:37 AM, David Rientjes wrote:
> =

> Regarding the role of direct reclaim in the allocator, I think we need =

> work on the feedback from compaction to determine whether it's worthwhile=
.  =

> That's difficult because of the point I continue to bring up: =

> isolate_freepages() is not necessarily always able to access this freed =

> memory.

That's one of the *many* reasons why having free base pages doesn't
guarantee compaction success. We can and will improve on that. But I
don't think it would be e.g. practical to check the pfns of free pages
wrt compaction scanner positions and decide based on that. Also when you
invoke reclaim, you can't tell in advance those pfns, so I'm not sure
how the better feedback from compaction to reclaim for this specific
aspect would be supposed to work?

> But for cases where we get COMPACT_SKIPPED because the order-0 =

> watermarks are failing, reclaim *is* likely to have an impact in the =

> success of compaction,

Yes that's the heuristic we rely on.

> otherwise we fail and defer because it wasn't able =

> to make a hugepage available.

Note that THP fault compaction doesn't actually defer itself, which I
think is a weakness of the current implementation and hope that patch 3
in my series from yesterday [1] can address that. Because defering is
the general feedback mechanism that we have for suppressing compaction
(and thus associated reclaim) in cases it fails for any reason, not just
the one you mention. Instead of inspecting failure conditions in detail,
which would be costly, it's a simple statistical approach. And when
compaction is improved to fail less, defering automatically also happens
less.

>  [ If we run compaction regardless of the order-0 watermark check and find
>    a pageblock where we can likely free a hugepage because it is =

>    fragmented movable pages, this is a pretty good indication that reclaim
>    is worthwhile iff the reclaimed memory is beyond the migration scanner=
. ]

I don't think that would be a good direction to pursue, to let scanning
happen even without having the free pages. Also as I've mentioned above,
LRU-based reclaim cannot satisfy your 'iff' condition, unless it
inspected the pfn's it freed, and continued reclaiming until enough of
those beyond migration scanner were freed. Instead IMHO we should look
again into replacing the free scanner with direct allocation from freelists.

[1] https://lkml.kernel.org/r/20181211142941.20500-1-vbabka(a)suse.cz

--===============8658105922276973876==--

