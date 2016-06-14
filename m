Content-Type: multipart/mixed; boundary="===============4313192995927440848=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Tue, 14 Jun 2016 12:07:29 -0400
Message-ID: <1465920449.2756.12.camel@redhat.com>
In-Reply-To: <20160614082613.GA1066@node.shutemov.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============4313192995927440848==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2016-06-14 at 11:26 +0300, Kirill A. Shutemov wrote:
> On Mon, Jun 13, 2016 at 11:11:05PM -0700, Linus Torvalds wrote:
> > =

> > On Mon, Jun 13, 2016 at 5:52 AM, Kirill A. Shutemov
> > <kirill.shutemov@linux.intel.com> wrote:
> > > =

> > > On Sat, Jun 11, 2016 at 06:02:57PM -0700, Linus Torvalds wrote:
> > > > =

> > > > =

> > > > I've timed it at over a thousand cycles on at least some CPU's,
> > > > but
> > > > that's still peanuts compared to a real page fault. It
> > > > shouldn't be
> > > > *that* noticeable, ie no way it's a 6% regression on its own.
> > > Looks like setting accessed bit is the problem.
> > Ok. I've definitely seen it as an issue, but never to the point of
> > several percent on a real benchmark that wasn't explicitly testing
> > that cost.
> > =

> > I reported the excessive dirty/accessed bit cost to Intel back in
> > the
> > P4 days, but it's apparently not been high enough for anybody to
> > care.
> > =

> > > =

> > > We spend 36% more time in page walk only, about 1% of total
> > > userspace time.
> > > Combining this with page walk footprint on caches, I guess we can
> > > get to
> > > this 3.5% score difference I see.
> > > =

> > > I'm not sure if there's anything we can do to solve the issue
> > > without
> > > screwing relacim logic again. :(
> > I think we should say "screw the reclaim logic" for now, and revert
> > commit 5c0a85fad949 for now.
> Okay. I'll prepare the patch.
> =

> > =

> > Considering how much trouble the accessed bit is on some other
> > architectures too, I wonder if we should strive to simply not care
> > about it, and always leaving it set. And then rely entirely on just
> > unmapping the pages and making the "we took a page fault after
> > unmapping" be the real activity tester.
> > =

> > So get rid of the "if the page is young, mark it old but leave it
> > in
> > the page tables" logic entirely. When we unmap a page, it will
> > always
> > either be in the swap cache or the page cache anyway, so faulting
> > it
> > in again should be just a minor fault with no actual IO happening.
> > =

> > That might be less of an impact in the end - yes, the unmap and
> > re-fault is much more expensive, but it presumably happens to much
> > fewer pages.
> > =

> > What do you think?
> Well, we cannot do this for anonymous memory. No swap -- no swap
> cache, if
> I read code correctly.
> =

> I guess it's doable for file mappings. Although I would expect
> regressions
> in other benchmarks. IIUC, it would require page unmapping to
> propogate
> page to active list, which is suboptimal.
> =

> And implications for page_idle is not clear to me.
> =

> Rik, Mel, any comments?

We can clear the accessed/young bit when anon pages are moved
from the active to the inactive list.

Reclaim does not care about the young bit on active anon pages
at all. For anon pages it uses a two hand clock algorithm, with
only pages on the inactive list being cared about.

For file pages, I believe we do look at the young bit on mapped
pages when they reach the end of the inactive list. Again, we
only care about the young bit on inactive pages.

One option may be to count on actively used file pages actually
being on the active list, and always set the young bit on ptes
when the page is already active.

Then we can let reclaim do its thing with the smaller number of
pages that are on the inactive list, while doing the faster thing
for pages that are on the active list.

Does that make sense?

-- =

All Rights Reversed.


--===============4313192995927440848==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjIKCmlRRWNCQUFC
Q0FBR0JRSlhZQ3ZCQUFvSkVNNTUzcEtFeE42RDk0MElBTHdueDRpckZRd2d0UU54UXMxN0l4amUK
cXJra2E1ZWo0RVhWRzVBMFBtTk82OE5ORGhxVE9la2hpT3gweUd0Rjg5eGtYS0ZoVUxtbDhHa1BN
ZldlZ2I3VgpCcXlIeXlTNHUwbVcvU0FnZFhEbitUVjZuTGpjQXAxTDkzSzRhNVNwZWZja1lYekZs
ZmJYT2RwUCsxZnZOQTRJCmlOaWRxdEx3WVR3NmJLMTM4bDNhOWhtQmYxNWdOV05RZmUwT283UXQ2
SFR2Y2c5RWI5YlVvYUYweDVKYUl3djgKRlNwNGF5VU9aSWdMa3RzbVpJZGRMUlNLVXZrVzQ0bmRC
N09CNVZkTDUwaDIrTzM4Z0E3Q0N6NnFSajQ1T05CRgovVXhCNlZsVkUyeVdBNGI0RmZmbmdXd0Jr
WmRvMlFGUzloZ01NN2JERTRYazRVWTBCaGtCQ1hyYUhFTmI5bms9Cj1SQWs4Ci0tLS0tRU5EIFBH
UCBTSUdOQVRVUkUtLS0tLQo=

--===============4313192995927440848==--

