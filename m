Content-Type: multipart/mixed; boundary="===============7949701077387115575=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Fri, 23 Apr 2021 20:33:17 -0600
Message-ID: <CAOUHufZY62nDZiPvFH_SuMLN-4Nxhr0HeOo06RWdTcE9QbhhXg@mail.gmail.com>
In-Reply-To: <20210415095708.GA6874@lespinasse.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============7949701077387115575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 18, 2021 at 12:48 AM Michel Lespinasse
<michel@lespinasse.org> wrote:
> On Thu, Apr 15, 2021 at 01:13:13AM -0600, Yu Zhao wrote:
> > Page table scanning doesn't replace the existing rmap walk. It is
> > complementary and only happens when it is likely that most of the
> > pages on a system under pressure have been referenced, i.e., out of
> > *inactive* pages, by definition of the existing implementation. Under
> > such a condition, scanning *active* pages one by one with the rmap is
> > likely to cost more than scanning them all at once via page tables.
> > When we evict *inactive* pages, we still use the rmap and share a
> > common path with the existing code.
> >
> > Page table scanning falls back to the rmap walk if the page tables of
> > a process are apparently sparse, i.e., rss < size of the page tables.
>
> Could you expand a bit more as to how page table scanning and rmap
> scanning coexist ? Say, there is some memory pressure and you want to
> identify good candidate pages to recaim. You could scan processes with
> the page table scanning method, or you could scan the lru list through
> the rmap method. How do you mix the two - when you use the lru/rmap
> method, won't you encounter both pages that are mapped in "dense"
> processes where scanning page tables would have been better, and pages
> that are mapped in "sparse" processes where you are happy to be using
> rmap, and even pges that are mapped into both types of processes at
> once ?  Or, can you change the lru/rmap scan so that it will efficiently
> skip over all dense processes when you use it ?

Hi Michel,

Sorry for the late reply. I was out of town and am still catching up on ema=
ils.

That's a great question. Currently the page table scanning isn't smart
enough to know where dense regions are. My plan was to improve it
gradually but it seems it couldn't wait because people have major
concerns over this.

At the moment, the page table scanning decides if a process is worthy
by checking its RSS against the size of its page tables. This can only
avoid extremely sparse regions, meaning the page table scanning will
scan regions that ideally should be covered by the rmap, for some
worse case scenarios. My next step is to add a bloom filter so it can
quickly determine dense regions and target them only.

Given what I just said, the rmap is unlikely to encounter dense
regions, and that's why the perf profile shows its cpu usage drops
from ~30% to ~5%.

Now the question is how we build the bloom filter. A simple answer is
to let the rmap do the legwork, i.e., when it encounters dense
regions, add them to the filter. Of course this means we'll have to
use the rmap more than we do now, which is not ideal for some
workloads but necessary to avoid worst case scenarios.

Does it make sense?
--===============7949701077387115575==--

