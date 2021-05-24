Content-Type: multipart/mixed; boundary="===============6714251735860712627=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 9cdbf239b5: vm-scalability.throughput -12.4% regression
Date: Sun, 23 May 2021 21:53:06 -0400
Message-ID: <YKsHAnDB5+ppOVVS@redhat.com>
In-Reply-To: <20210523150802.GB18821@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6714251735860712627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 23, 2021 at 11:08:02PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -12.4% regression of vm-scalability.throughput due to c=
ommit:
> =

> =

> commit: 9cdbf239b521b2d95a3d5e6ca461a105e8547254 ("mm: COW: restore full =
accuracy in page reuse")
> https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git mapcount_desha=
re

This is an artifact of how I ordered the patches.

The lost performance is completely restored in "mm: COW: skip the page
lock in the COW copy path".

776ac3f81e0b mm: COW: skip the page lock in the COW copy path
3b8f05426b5a mm: COW: restore full accuracy in page reuse

You should benchmark the effect of both commits applied at the same
time, that is meaningful.

I'll try to invert the order and see if there aren't too many rejects
in applying the optimization first, and the revert second.

In other words you should benchmark aa34a616511f vs 776ac3f81e0b, then
you won't measure any regression.

776ac3f81e0b mm: COW: skip the page lock in the COW copy path
3b8f05426b5a mm: COW: restore full accuracy in page reuse
aa34a616511f mm: gup: FOLL_UNSHARE: optimize mmu notifier

The good thing is after 776ac3f81e0b the same scalability boosts
applied to 4k pages is applied to 2M pages too, upstream 2M pages are
still slow.

Thanks,
Andrea

--===============6714251735860712627==--

