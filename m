Content-Type: multipart/mixed; boundary="===============0603084826427695364=="
MIME-Version: 1.0
From: Yu Zhao <yuzhao@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Wed, 14 Apr 2021 01:58:56 -0600
Message-ID: <CAOUHufbk=TVOpEOvTNRBe0uoOWNZ=wf3umQ628ZFZ=QYhNqsHA@mail.gmail.com>
In-Reply-To: <87tuo9qtmd.fsf@yhuang6-desk1.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0603084826427695364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 12:15 AM Huang, Ying <ying.huang@intel.com> wrote:
>
> Yu Zhao <yuzhao@google.com> writes:
>
> > On Tue, Apr 13, 2021 at 8:30 PM Rik van Riel <riel@surriel.com> wrote:
> >>
> >> On Wed, 2021-04-14 at 09:14 +1000, Dave Chinner wrote:
> >> > On Tue, Apr 13, 2021 at 10:13:24AM -0600, Jens Axboe wrote:
> >> >
> >> > > The initial posting of this patchset did no better, in fact it did
> >> > > a bit
> >> > > worse. Performance dropped to the same levels and kswapd was using
> >> > > as
> >> > > much CPU as before, but on top of that we also got excessive
> >> > > swapping.
> >> > > Not at a high rate, but 5-10MB/sec continually.
> >> > >
> >> > > I had some back and forths with Yu Zhao and tested a few new
> >> > > revisions,
> >> > > and the current series does much better in this regard. Performance
> >> > > still dips a bit when page cache fills, but not nearly as much, and
> >> > > kswapd is using less CPU than before.
> >> >
> >> > Profiles would be interesting, because it sounds to me like reclaim
> >> > *might* be batching page cache removal better (e.g. fewer, larger
> >> > batches) and so spending less time contending on the mapping tree
> >> > lock...
> >> >
> >> > IOWs, I suspect this result might actually be a result of less lock
> >> > contention due to a change in batch processing characteristics of
> >> > the new algorithm rather than it being a "better" algorithm...
> >>
> >> That seems quite likely to me, given the issues we have
> >> had with virtual scan reclaim algorithms in the past.
> >
> > Hi Rik,
> >
> > Let paste the code so we can move beyond the "batching" hypothesis:
> >
> > static int __remove_mapping(struct address_space *mapping, struct page
> > *page,
> >                             bool reclaimed, struct mem_cgroup *target_m=
emcg)
> > {
> >         unsigned long flags;
> >         int refcount;
> >         void *shadow =3D NULL;
> >
> >         BUG_ON(!PageLocked(page));
> >         BUG_ON(mapping !=3D page_mapping(page));
> >
> >         xa_lock_irqsave(&mapping->i_pages, flags);
> >
> >> SeongJae, what is this algorithm supposed to do when faced
> >> with situations like this:
> >
> > I'll assume the questions were directed at me, not SeongJae.
> >
> >> 1) Running on a system with 8 NUMA nodes, and
> >> memory
> >>    pressure in one of those nodes.
> >> 2) Running PostgresQL or Oracle, with hundreds of
> >>    processes mapping the same (very large) shared
> >>    memory segment.
> >>
> >> How do you keep your algorithm from falling into the worst
> >> case virtual scanning scenarios that were crippling the
> >> 2.4 kernel 15+ years ago on systems with just a few GB of
> >> memory?
> >
> > There is a fundamental shift: that time we were scanning for cold pages,
> > and nowadays we are scanning for hot pages.
> >
> > I'd be surprised if scanning for cold pages didn't fall apart, because =
it'd
> > find most of the entries accessed, if they are present at all.
> >
> > Scanning for hot pages, on the other hand, is way better. Let me just
> > reiterate:
> > 1) It will not scan page tables from processes that have been sleeping
> >    since the last scan.
> > 2) It will not scan PTE tables under non-leaf PMD entries that do not
> >    have the accessed bit set, when
> >    CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG=3Dy.
> > 3) It will not zigzag between the PGD table and the same PMD or PTE
> >    table spanning multiple VMAs. In other words, it finishes all the
> >    VMAs with the range of the same PMD or PTE table before it returns
> >    to the PGD table. This optimizes workloads that have large numbers
> >    of tiny VMAs, especially when CONFIG_PGTABLE_LEVELS=3D5.
> >
> > So the cost is roughly proportional to the number of referenced pages it
> > discovers. If there is no memory pressure, no scanning at all. For a sy=
stem
> > under heavy memory pressure, most of the pages are referenced (otherwise
> > why would it be under memory pressure?), and if we use the rmap, we nee=
d to
> > scan a lot of pages anyway. Why not just scan them all?
>
> This may be not the case.  For rmap scanning, it's possible to scan only
> a small portion of memory.  But with the page table scanning, you need
> to scan almost all (I understand you have some optimization as above).

Hi Ying,

Let's take a step back.

For the sake of discussion, when does the scanning have to happen? Can
we agree that the simplest answer is when we have evicted all inactive
pages?

If so, my next question is who's filled in the memory space previously
occupied by those inactive pages? Newly faulted in pages, right? They
have the accessed bit set, and we can't evict them without scanning
them first, would you agree?

And there are also existing active pages, and they were protected from
eviction. But now we need to deactivate some of them. Do you think
whether they'd have been used or not since the last scan? (Remember
they were active.)

You mentioned "a small portion" and "almost all". How do you interpret
them in terms of these steps?

Intuitively, "a small portion" and "almost all" seem right. But our
observations from *millions* of machines say the ratio of
pgscan_kswapd to pgsteal_kswapd is well over 7 when anon percentage is
>90%. Unlikely streaming files, it doesn't make sense to "stream" anon
memory.

> As Rik shown in the test case above, there may be memory pressure on
> only one of 8 NUMA nodes (because of NUMA binding?).  Then ramp scanning
> only needs to scan pages in this node, while the page table scanning may
> need to scan pages in other nodes too.

Yes, and this is on my to-do list in the patchset:

To-do List
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
KVM Optimization
----------------
Support shadow page table scanning.

NUMA Optimization
-----------------
Support NUMA policies and per-node RSS counters.

We only can move forward one step at a time. Fair?
--===============0603084826427695364==--

