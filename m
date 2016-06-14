Content-Type: multipart/mixed; boundary="===============6871141519329263479=="
MIME-Version: 1.0
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Tue, 14 Jun 2016 16:03:23 +0200
Message-ID: <57600EAB.9030000@de.ibm.com>
In-Reply-To: <CA+55aFx2TdqHW5VvirF-fAe4rRtSKK6BH06LyN4Ma3Q7ifJkxA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6871141519329263479==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/14/2016 08:11 AM, Linus Torvalds wrote:
> On Mon, Jun 13, 2016 at 5:52 AM, Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
>> On Sat, Jun 11, 2016 at 06:02:57PM -0700, Linus Torvalds wrote:
>>>
>>> I've timed it at over a thousand cycles on at least some CPU's, but
>>> that's still peanuts compared to a real page fault. It shouldn't be
>>> *that* noticeable, ie no way it's a 6% regression on its own.
>>
>> Looks like setting accessed bit is the problem.
> =

> Ok. I've definitely seen it as an issue, but never to the point of
> several percent on a real benchmark that wasn't explicitly testing
> that cost.
> =

> I reported the excessive dirty/accessed bit cost to Intel back in the
> P4 days, but it's apparently not been high enough for anybody to care.
> =

>> We spend 36% more time in page walk only, about 1% of total userspace ti=
me.
>> Combining this with page walk footprint on caches, I guess we can get to
>> this 3.5% score difference I see.
>>
>> I'm not sure if there's anything we can do to solve the issue without
>> screwing relacim logic again. :(
> =

> I think we should say "screw the reclaim logic" for now, and revert
> commit 5c0a85fad949 for now.
> =

> Considering how much trouble the accessed bit is on some other
> architectures too, I wonder if we should strive to simply not care
> about it, and always leaving it set. And then rely entirely on just
> unmapping the pages and making the "we took a page fault after
> unmapping" be the real activity tester.
> =

> So get rid of the "if the page is young, mark it old but leave it in
> the page tables" logic entirely. When we unmap a page, it will always
> either be in the swap cache or the page cache anyway, so faulting it
> in again should be just a minor fault with no actual IO happening.
> =

> That might be less of an impact in the end - yes, the unmap and
> re-fault is much more expensive, but it presumably happens to much
> fewer pages.

FWIW, something like that is what Martin did for s390 3 years ago.
We now use invalidation and page faults to implement the *young =

functions in  pgtable.h (basically using a SW young bit). This
helped us to get rid of the storage keys (which contain the HW =

reference bit). The performance did not seem to suffer.

See commit 0944fe3f4a323f436180d39402cae7f9c46ead17
s390/mm: implement software referenced bits

> =

> What do you think?

Your proposal would be to do the software tracking via
invalidation/fault part of the generic mm code and not to hide it
in the architecture backend. Correct?

> =

>              Linus
> =



--===============6871141519329263479==--

