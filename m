Content-Type: multipart/mixed; boundary="===============6934159290230781713=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Mon, 23 Nov 2015 17:16:01 +0900
Message-ID: <20151123081601.GA29397@js1304-P5Q-DELUXE>
In-Reply-To: <564EF0B6.10508@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6934159290230781713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2015 at 11:06:46AM +0100, Vlastimil Babka wrote:
> On 11/20/2015 10:33 AM, Aaron Lu wrote:
> >On 11/20/2015 04:55 PM, Aaron Lu wrote:
> >>On 11/19/2015 09:29 PM, Vlastimil Babka wrote:
> >>>+CC Andrea, David, Joonsoo
> >>>
> >>>On 11/19/2015 10:29 AM, Aaron Lu wrote:
> >>>>The vmstat and perf-profile are also attached, please let me know if =
you
> >>>>need any more information, thanks.
> >>>
> >>>Output from vmstat (the tool) isn't much useful here, a periodic "cat
> >>>/proc/vmstat" would be much better.
> >>
> >>No problem.
> >>
> >>>The perf profiles are somewhat weirdly sorted by children cost (?), but
> >>>I noticed a very high cost (46%) in pageblock_pfn_to_page(). This could
> >>>be due to a very large but sparsely populated zone. Could you provide
> >>>/proc/zoneinfo?
> >>
> >>Is a one time /proc/zoneinfo enough or also a periodic one?
> >
> >Please see attached, note that this is a new run so the perf profile is
> >a little different.
> >
> >Thanks,
> >Aaron
> =

> Thanks.
> =

> DMA32 is a bit sparse:
> =

> Node 0, zone    DMA32
>   pages free     62829
>         min      327
>         low      408
>         high     490
>         scanned  0
>         spanned  1044480
>         present  495951
>         managed  479559
> =

> Since the other zones are much larger, probably this is not the
> culprit. But tracepoints should tell us more. I have a theory that
> updating free scanner's cached pfn doesn't happen if it aborts due
> to need_resched() during isolate_freepages(), before hitting a valid
> pageblock, if the zone has a large hole in it. But zoneinfo doesn't
> tell us if the large difference between "spanned" and
> "present"/"managed" is due to a large hole, or many smaller holes...
> =

> compact_migrate_scanned 1982396
> compact_free_scanned 40576943
> compact_isolated 2096602
> compact_stall 9070
> compact_fail 6025
> compact_success 3045
> =

> So it's struggling to find free pages, no wonder about that. I'm

Numbers looks fine to me. I guess this performance degradation is
caused by COMPACT_CLUSTER_MAX change (from 32 to 256). THP allocation
is async so should be aborted quickly. But, after isolating 256
migratable pages, it can't be aborted and will finish 256 pages
migration (at least, current implementation).

Aaron, please test again with setting COMPACT_CLUSTER_MAX to 32
(in swap.h)?

And, please attach always-always's vmstat numbers, too.

Thanks.


--===============6934159290230781713==--

