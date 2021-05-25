Content-Type: multipart/mixed; boundary="===============6037029372854718053=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9cdbf239b5: vm-scalability.throughput -12.4% regression
Date: Tue, 25 May 2021 17:20:01 -0400
Message-ID: <YK1qAV2/Lo/cFqkA@redhat.com>
In-Reply-To: <YKsHAnDB5+ppOVVS@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6037029372854718053==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I swapped the order of the two patches.

Old order (as in git log, default reversed):

776ac3f81e0b mm: COW: skip the page lock in the COW copy path              =
                                                                           =
                     =

3b8f05426b5a mm: COW: restore full accuracy in page reuse                  =
                                                                           =
                     =


New order (as in git log, default reversed):

6e42c5351f2f mm: COW: restore full accuracy in page reuse
b2d2eb4f4712 mm: COW: skip the page lock in the COW copy path

Now the lockless mapcount check (and added to THP too) is added in the
patch "mm: COW: skip the page lock in the COW copy path"  before
reverting the FOLL_LONGTERM breaking page_count check.

So if you repeat the below benchmark against the patch "mm: COW:
restore full accuracy in page" you should measure an improvement or
no change now.

This order is nicer, the approaches are orthgonal, so it is possible
to add the "new replacement design that retains the optimization and
adds it to THP too" before reverting the broken code that achieved
a partial optimization for non-THP only.

Thanks,
Andrea

On Sun, May 23, 2021 at 09:53:06PM -0400, Andrea Arcangeli wrote:
> On Sun, May 23, 2021 at 11:08:02PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -12.4% regression of vm-scalability.throughput due to=
 commit:
> > =

> > =

> > commit: 9cdbf239b521b2d95a3d5e6ca461a105e8547254 ("mm: COW: restore ful=
l accuracy in page reuse")
> > https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git mapcount_des=
hare
> =

> This is an artifact of how I ordered the patches.
> =

> The lost performance is completely restored in "mm: COW: skip the page
> lock in the COW copy path".
> =

> 776ac3f81e0b mm: COW: skip the page lock in the COW copy path
> 3b8f05426b5a mm: COW: restore full accuracy in page reuse
> =

> You should benchmark the effect of both commits applied at the same
> time, that is meaningful.
> =

> I'll try to invert the order and see if there aren't too many rejects
> in applying the optimization first, and the revert second.
> =

> In other words you should benchmark aa34a616511f vs 776ac3f81e0b, then
> you won't measure any regression.
> =

> 776ac3f81e0b mm: COW: skip the page lock in the COW copy path
> 3b8f05426b5a mm: COW: restore full accuracy in page reuse
> aa34a616511f mm: gup: FOLL_UNSHARE: optimize mmu notifier
> =

> The good thing is after 776ac3f81e0b the same scalability boosts
> applied to 4k pages is applied to 2M pages too, upstream 2M pages are
> still slow.
> =

> Thanks,
> Andrea

--===============6037029372854718053==--

