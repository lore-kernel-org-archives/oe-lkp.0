Content-Type: multipart/mixed; boundary="===============6386442209582305320=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Fri, 07 Dec 2018 15:15:37 -0800
Message-ID: <alpine.DEB.2.21.1812071512040.173448@chino.kir.corp.google.com>
In-Reply-To: <779efc07-cac0-5d36-72fc-11d99060cac7@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============6386442209582305320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Dec 2018, Vlastimil Babka wrote:

> >> But *that* in turn makes for other possible questions:
> >>
> >>  - if the reason we couldn't get a local hugepage is that we're simply
> >> out of local memory (huge *or* small), then maybe a remote hugepage is
> >> better.
> >>
> >>    Note that this now implies that the choice can be an issue of "did
> >> the hugepage allocation fail due to fragmentation, or due to the node
> >> being low of memory"
> > How exactly do you tell? Many systems are simply low on memory due to
> > caching. A clean pagecache is quite cheap to reclaim but it can be more
> > expensive to fault in. Do we consider it to be a viable target?
> =

> Compaction can report if it failed (more precisely: was skipped) due to
> low memory, or for other reasons. It doesn't distinguish how easily
> reclaimable is the memory, but I don't think we should reclaim anything
> (see below).
> =


Note that just reclaiming when the order-0 watermark in =

__compaction_suitable() fails is unfortunately not always sufficient: it =

needs to be accessible to isolate_freepages().  For order-9 memory, it's =

possible for isolate_migratepages_block() to skip over a top of free pages =

that were just reclaimed if there are unmovable pages preventing the =

entire pageblock from being freed.

--===============6386442209582305320==--

