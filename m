Content-Type: multipart/mixed; boundary="===============2165150607060137853=="
MIME-Version: 1.0
From: David Rientjes <rientjes@google.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 21 Dec 2018 14:18:45 -0800
Message-ID: <alpine.DEB.2.21.1812211416020.219499@chino.kir.corp.google.com>
In-Reply-To: <0700f5c3-66a8-338a-0ba0-2231cc3bb637@suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2165150607060137853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 14 Dec 2018, Vlastimil Babka wrote:

> > It would be interesting to know if anybody has tried using the per-zone =

> > free_area's to determine migration targets and set a bit if it should b=
e =

> > considered a migration source or a migration target.  If all pages for =
a =

> > pageblock are not on free_areas, they are fully used.
> =

> Repurposing/adding a new pageblock bit was in my mind to help multiple
> compactors not undo each other's work in the scheme where there's no
> free page scanner, but I didn't implement it yet.
> =


It looks like Mel has a series posted that still is implemented with =

linear scans through memory, so I'm happy to move the discussion there; I =

think the goal for compaction with regard to this thread is determining =

whether reclaim in the page allocator would actually be useful and =

targeted reclaim to make memory available for isolate_freepages() could be =

expensive.  I'd hope that we could move in a direction where compaction =

doesn't care where the pageblock is and does the minimal amount of work =

possible to make a high-order page available, not sure if that's possible =

with a linear scan.  I'll take a look at Mel's series though.

--===============2165150607060137853==--

