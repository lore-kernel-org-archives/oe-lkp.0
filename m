Content-Type: multipart/mixed; boundary="===============0272189376700479407=="
MIME-Version: 1.0
From: Vlastimil Babka <vbabka@suse.cz>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Thu, 06 Dec 2018 10:23:15 +0100
Message-ID: <a55a4fe9-6abe-ccb8-befd-afdacac2829d@suse.cz>
In-Reply-To: <20181206005425.GB21159@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0272189376700479407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/6/18 1:54 AM, Andrea Arcangeli wrote:
> On Wed, Dec 05, 2018 at 04:18:14PM -0800, David Rientjes wrote:
>> On Wed, 5 Dec 2018, Andrea Arcangeli wrote:
>>
>> Note that in addition to COMPACT_SKIPPED that you mention, compaction ca=
n =

>> fail with COMPACT_COMPLETE, meaning the full scan has finished without =

>> freeing a hugepage, or COMPACT_DEFERRED, meaning that doing another scan =

>> is unlikely to produce a different result.  COMPACT_SKIPPED makes sense =
to =

>> do reclaim if it can become accessible to isolate_freepages() and =

>> hopefully another allocator does not allocate from these newly freed pag=
es =

>> before compaction can scan the zone again.  For COMPACT_COMPLETE and =

>> COMPACT_DEFERRED, reclaim is unlikely to ever help.
> =

> The COMPACT_COMPLETE and (COMPACT_PARTIAL_SKIPPED for that matter)
> seems just a mistake in the max() evaluation try_to_compact_pages()
> that let it return COMPACT_COMPLETE and COMPACT_PARTIAL_SKIPPED. I
> think it should just return COMPACT_DEFERRED in those two cases and it
> should be enforced forced for all prio.
> =

> There are really only 3 cases that matter for the caller:
> =

> 1) succeed -> we got the page
> 2) defer -> we failed (caller won't care about why)
> 3) skipped -> failed because not enough 4k freed -> reclaim must be invok=
ed then
>    compaction can be retried
> =

> PARTIAL_SKIPPED/COMPLETE both fall into 2) above so for the caller
> they should be treated the same way. It doesn't seem very concerning
> that it may try like if it succeeded and do a spurious single reclaim
> invocation, but it's good to fix this and take the COMPACT_DEFERRED
> nopage path in the __GFP_NORETRY case.

Yeah good point. I wouldn't change the general logic of
try_to_compact_pages() though, but the condition for __GFP_NORETRY can
simply change to:

if (compact_result !=3D COMPACT_SKIPPED)
     goto nopage;

I can make a patch ASAP together with a few others I think are needed,
that should hopefully avoid the need for __GFP_COMPACT_ONLY or checks
based on order. What's probably unavoidable though is adding back
__GFP_NORETRY for madvised allocations (i.e. partially reverting
2516035499b95), but David was fine with that and your __GFP_ONLY_COMPACT
approach effectively did it too.


--===============0272189376700479407==--

