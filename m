Content-Type: multipart/mixed; boundary="===============1654254354639897008=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Fri, 14 Dec 2018 22:33:42 +0100
Message-ID: <0700f5c3-66a8-338a-0ba0-2231cc3bb637@suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812141244450.186427@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1654254354639897008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/14/18 10:04 PM, David Rientjes wrote:
> On Wed, 12 Dec 2018, Vlastimil Babka wrote:

...

> Reclaim likely could be deterministically useful if we consider a redesig=
n =

> of how migration sources and targets are determined in compaction.
> =

> Has anybody tried a migration scanner that isn't linearly based, rather =

> finding the highest-order free page of the same migratetype, iterating th=
e =

> pages of its pageblock, and using this to determine whether the actual =

> migration will be worthwhile or not?

Not exactly that AFAIK, but a year ago in my series [1] patch 6 made
migration scanner 'prescan' the block of requested order before actually
trying to isolate anything for migration.

> I could imagine pageblock_skip being =

> repurposed for this as the heuristic.
> =

> Finding migration targets would be more tricky, but if we iterate the =

> pages of the pageblock for low-order free pages and find them to be mostl=
y =

> used, that seems more appropriate than just pushing all memory to the end =

> of the zone?

Agree. That was patch 8/8 of the same series [1].

> It would be interesting to know if anybody has tried using the per-zone =

> free_area's to determine migration targets and set a bit if it should be =

> considered a migration source or a migration target.  If all pages for a =

> pageblock are not on free_areas, they are fully used.

Repurposing/adding a new pageblock bit was in my mind to help multiple
compactors not undo each other's work in the scheme where there's no
free page scanner, but I didn't implement it yet.

>>> otherwise we fail and defer because it wasn't able =

>>> to make a hugepage available.
>>
>> Note that THP fault compaction doesn't actually defer itself, which I
>> think is a weakness of the current implementation and hope that patch 3
>> in my series from yesterday [1] can address that. Because defering is
>> the general feedback mechanism that we have for suppressing compaction
>> (and thus associated reclaim) in cases it fails for any reason, not just
>> the one you mention. Instead of inspecting failure conditions in detail,
>> which would be costly, it's a simple statistical approach. And when
>> compaction is improved to fail less, defering automatically also happens
>> less.
>>
> =

> I couldn't get the link to work, unfortunately, I don't think the patch =

> series made it to LKML :/  I do see it archived for linux-mm, though, so =

> I'll take a look, thanks!

Yeah I forgot to Cc: LKML, but you were also in direct To: so you should
have received them directly. Also the abovementioned series, but that's
year ago. My fault for not returning to it after being done with the
Meltdown fun. I hope to do that soon.

[1] https://marc.info/?l=3Dlinux-mm&m=3D151315560308753

>> [1] https://lkml.kernel.org/r/20181211142941.20500-1-vbabka(a)suse.cz
>>


--===============1654254354639897008==--

