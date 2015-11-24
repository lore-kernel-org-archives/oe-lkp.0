Content-Type: multipart/mixed; boundary="===============6507599928692071677=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Tue, 24 Nov 2015 11:45:47 +0900
Message-ID: <20151124024547.GA2529@js1304-P5Q-DELUXE>
In-Reply-To: <564EF0B6.10508@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6507599928692071677==
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

Today, I revisit this issue and yes, I think that your theory is
right. isolate_freepages() will not update cached pfn until call
isolate_freepages_block(). So, if there are many holes or many
unmovable pageblocks or !isolation_suitable() pageblocks, cached pfn
will not updated if compaction aborts due to need_resched(). zoneinfo
shows that there is not much holes so I guess that this problem is caused
by latter two cases.

It is better to update cached pfn in these cases. Although I don't see
your solution yet, I guess it will help here.

Thanks.

--===============6507599928692071677==--

