Content-Type: multipart/mixed; boundary="===============5637649323839422125=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: MADV_HUGEPAGE vs. NUMA semantic (was: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression)
Date: Fri, 07 Dec 2018 08:49:54 +0100
Message-ID: <20181207074954.GR1286@dhcp22.suse.cz>
In-Reply-To: <CAHk-=whCnERJt8bterD5yXABvoSmoJAx004Y76c82bBHCWbgDg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5637649323839422125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 06-12-18 20:31:46, Linus Torvalds wrote:
> [ Oops. different thread for me due to edited subject, so I saw this
> after replying to the earlier email by David ]

Sorry about that but I really wanted to make the actual discussion about
semantic clearly distinguished because the thread just grown too large
with back and forth that didn't lead to anywhere.

> On Thu, Dec 6, 2018 at 1:14 AM Michal Hocko <mhocko@kernel.org> wrote:
> >
> > MADV_HUGEPAGE changes the picture because the caller expressed a need
> > for THP and is willing to go extra mile to get it.
> =

> Actually, I think MADV_HUGEPAGE should just be
> "TRANSPARENT_HUGEPAGE_ALWAYS but only for this vma".

Yes, that is the case and I didn't want to make the description more
complicated than necessary so I've focused only on the current default.
But historically we have treated defrag=3Dalways and MADV_HUGEPAGE the
same.

[...]
> >I believe that something like the below would be sensible
> >         1) THP on a local node with compaction not giving up too early
> >         2) THP on a remote node in NOWAIT mode - so no direct
> >            compaction/reclaim (trigger kswapd/kcompactd only for
> >            defrag=3Ddefer+madvise)
> >         3) fallback to the base page allocation
> =

> That doesn't sound insane to me. That said, the numbers David quoted
> do fairly strongly imply that local small-pages are actually preferred
> to any remote THP pages.

As I and others pointed out elsewhere remote penalty is just a part of
the picture and on its own might be quite misleading. There are other
aspects (TLB pressure, page tables overhead etc) that might amortize the
access latency.

> But *that* in turn makes for other possible questions:
> =

>  - if the reason we couldn't get a local hugepage is that we're simply
> out of local memory (huge *or* small), then maybe a remote hugepage is
> better.
> =

>    Note that this now implies that the choice can be an issue of "did
> the hugepage allocation fail due to fragmentation, or due to the node
> being low of memory"

How exactly do you tell? Many systems are simply low on memory due to
caching. A clean pagecache is quite cheap to reclaim but it can be more
expensive to fault in. Do we consider it to be a viable target?

> =

> and there is the other question that I asked in the other thread
> (before subject edit):
> =

>  - how local is the load to begin with?
> =

>    Relatively shortlived processes - or processes that are explicitly
> bound to a node - might have different preferences than some
> long-lived process where the CPU bounces around, and might have
> different trade-offs for the local vs remote question too.

Agreed

> So just based on David's numbers, and some wild handwaving on my part,
> a slightly more complex, but still very sensible default might be
> something like
> =

>  1) try to do a cheap local node hugepage allocation
> =

>     Rationale: everybody agrees this is the best case.
> =

>     But if that fails:
> =

>  2) look at compacting and the local node, but not very hard.
> =

>     If there's lots of memory on the local node, but synchronous
> compaction doesn't do anything easily, just fall back to small pages.

Do we reclaim at this stage or this is mostly GFP_NOWAIT attempt?

>     Rationale: local memory is generally more important than THP.
> =

>     If that fails (ie local node is simply low on memory):
> =

>  3) Try to do remote THP allocation
> =

>      Rationale: Ok, we simply didn't have a lot of local memory, so
> it's not just a question of fragmentation. If it *had* been
> fragmentation, lots of small local pages would have been better than a
> remote THP page.
> =

>      Oops, remote THP allocation failed (possibly after synchronous
> remote compaction, but maybe this is where we do kcompactd).
> =

>  4) Just do any small page, and do reclaim etc. THP isn't happening,
> and it's not a priority when you're starting to feel memory pressure.

If 2) doesn't reclaim heavily (e.g. only try to reclaim clean page
cache) or even do NOWAIT (which would be even better) then I _think_
this sounds sane.

> In general, I really would want to avoid magic kernel command lines
> (or sysfs settings, or whatever) making a huge difference in behavior.
> So I really wish people would see the whole
> 'transparent_hugepage_flags' thing as a way for kernel developers to
> try different settings, not as a way for users to tune their loads.
> =

> Our default should work as sane defaults, we shouldn't have a "ok,
> let's have this sysfs tunable and let people make their own
> decisions". That's a cop-out.

Agreed. I cannot say I am happy with all the ways THP can be tuned. It
is quite confusing to say the least.

-- =

Michal Hocko
SUSE Labs

--===============5637649323839422125==--

