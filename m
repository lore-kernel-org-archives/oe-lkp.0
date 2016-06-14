Content-Type: multipart/mixed; boundary="===============3693206968792833810=="
MIME-Version: 1.0
From: Kirill A. Shutemov <kirill@shutemov.name>
To: lkp@lists.01.org
Subject: Re: [mm] 5c0a85fad9: unixbench.score -6.3% regression
Date: Tue, 14 Jun 2016 11:26:13 +0300
Message-ID: <20160614082613.GA1066@node.shutemov.name>
In-Reply-To: <CA+55aFx2TdqHW5VvirF-fAe4rRtSKK6BH06LyN4Ma3Q7ifJkxA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3693206968792833810==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 13, 2016 at 11:11:05PM -0700, Linus Torvalds wrote:
> On Mon, Jun 13, 2016 at 5:52 AM, Kirill A. Shutemov
> <kirill.shutemov@linux.intel.com> wrote:
> > On Sat, Jun 11, 2016 at 06:02:57PM -0700, Linus Torvalds wrote:
> >>
> >> I've timed it at over a thousand cycles on at least some CPU's, but
> >> that's still peanuts compared to a real page fault. It shouldn't be
> >> *that* noticeable, ie no way it's a 6% regression on its own.
> >
> > Looks like setting accessed bit is the problem.
> =

> Ok. I've definitely seen it as an issue, but never to the point of
> several percent on a real benchmark that wasn't explicitly testing
> that cost.
> =

> I reported the excessive dirty/accessed bit cost to Intel back in the
> P4 days, but it's apparently not been high enough for anybody to care.
> =

> > We spend 36% more time in page walk only, about 1% of total userspace t=
ime.
> > Combining this with page walk footprint on caches, I guess we can get to
> > this 3.5% score difference I see.
> >
> > I'm not sure if there's anything we can do to solve the issue without
> > screwing relacim logic again. :(
> =

> I think we should say "screw the reclaim logic" for now, and revert
> commit 5c0a85fad949 for now.

Okay. I'll prepare the patch.

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
> =

> What do you think?

Well, we cannot do this for anonymous memory. No swap -- no swap cache, if
I read code correctly.

I guess it's doable for file mappings. Although I would expect regressions
in other benchmarks. IIUC, it would require page unmapping to propogate
page to active list, which is suboptimal.

And implications for page_idle is not clear to me.

Rik, Mel, any comments?

-- =

 Kirill A. Shutemov

--===============3693206968792833810==--

