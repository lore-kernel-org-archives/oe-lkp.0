Content-Type: multipart/mixed; boundary="===============9155299679382833290=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 00/16] Multigenerational LRU Framework
Date: Thu, 15 Apr 2021 11:36:17 +1000
Message-ID: <20210415013617.GU1990290@dread.disaster.area>
In-Reply-To: <CAOUHufa5id9mmjud-UQd4agLCtmDypdNDStkxgoQxsUoh8Qcsg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============9155299679382833290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 14, 2021 at 01:16:52AM -0600, Yu Zhao wrote:
> On Tue, Apr 13, 2021 at 10:50 PM Dave Chinner <david@fromorbit.com> wro=
te:
> > On Tue, Apr 13, 2021 at 09:40:12PM -0600, Yu Zhao wrote:
> > > On Tue, Apr 13, 2021 at 5:14 PM Dave Chinner <david@fromorbit.com> =
wrote:
> > > > Profiles would be interesting, because it sounds to me like reclaim
> > > > *might* be batching page cache removal better (e.g. fewer, larger
> > > > batches) and so spending less time contending on the mapping tree
> > > > lock...
> > > >
> > > > IOWs, I suspect this result might actually be a result of less lock
> > > > contention due to a change in batch processing characteristics of
> > > > the new algorithm rather than it being a "better" algorithm...
> > >
> > > I appreciate the profile. But there is no batching in
> > > __remove_mapping() -- it locks the mapping for each page, and
> > > therefore the lock contention penalizes the mainline and this patchset
> > > equally. It looks worse on your system because the four kswapd threads
> > > from different nodes were working on the same file.
> >
> > I think you misunderstand exactly what I mean by "batching" here.
> > I'm not talking about doing multiple pieces of work under a single
> > lock. What I mean is that the overall amount of work done in a
> > single reclaim scan (i.e a "reclaim batch") is packaged differently.
> >
> > We already batch up page reclaim via building a page list and then
> > passing it to shrink_page_list() to process the batch of pages in a
> > single pass. Each page in this page list batch then calls
> > remove_mapping() to pull the page form the LRU, we have a run of
> > contention between the foreground read() thread and the background
> > kswapd.
> >
> > If the size or nature of the pages in the batch passed to
> > shrink_page_list() changes, then the amount of time a reclaim batch
> > is going to put pressure on the mapping tree lock will also change.
> > That's the "change in batching behaviour" I'm referring to here. I
> > haven't read through the patchset to determine if you change the
> > shrink_page_list() algorithm, but it likely changes what is passed
> > to be reclaimed and that in turn changes the locking patterns that
> > fall out of shrink_page_list...
> =

> Ok, if we are talking about the size of the batch passed to
> shrink_page_list(), both the mainline and this patchset cap it at
> SWAP_CLUSTER_MAX, which is 32. There are corner cases, but when
> running fio/io_uring, it's safe to say both use 32.

You're still looking at micro-scale behaviour, not the larger-scale
batching effects. Are we passing SWAP_CLUSTER_MAX groups of pages to
shrinker_page_list() at a different rate?

When I say "batch of work" when talking about the page cache cycling
*500 thousand pages a second* through the cache, I'm not talking
about batches of 32 pages. I'm talking about the entire batch of
work kswapd does in an invocation cycle.

Is it scanning 100k pages 10 times a second? or 10k pages a hundred
times a second? How long does a batch take to run? how long does is
sleep between processing batches? Is there any change in these
metrics as a result of the multi-gen LRU patches?

Basically, we're looking at how access to the mapping lock is
changing the contention profile, and whether that is signficant or
not. I suspect it is, because when you have highly contended locks
and you do something external that reduces unrelated lock
contention, it's because that external thing is taking more time to
do and so there's less time to spend hitting locks hard...

As such, I don't think this test is a good measure of the multi-gen
LRU patches at all - performance is dominated by the severity of
lock contention external to the LRU scanning algorithm, and it's
hard to infer anything through suck lock contention....

> I don't want to paste everything here -- they'd clutter. Please see
> all the detailed profiles in the attachment. Let me know if their
> formats are no to your liking. I still have the raw perf.data.

Which makes the discussion thread just about impossible to follow or
comment on. Please just post the relevant excerpt of the stack
profile that you are commenting on.

> > > And I plan to reach out to other communities, e.g., PostgreSQL, to
> > > benchmark the patchset. I heard they have been complaining about the
> > > buffered io performance under memory pressure. Any other benchmarks
> > > you'd suggest?
> > >
> > > BTW, you might find another surprise in how less frequently slab
> > > shrinkers are called under memory pressure, because this patchset is a
> > > lot better at finding pages to reclaim and therefore doesn't overkill
> > > slabs.
> >
> > That's actually very likely to be a Bad Thing and cause unexpected
> > perofrmance and OOM based regressions. When the machine finally runs
> > out of page cache it can easily reclaim, it's going to get stuck
> > with long tail latencies reclaiming huge slab caches as they've had
> > no substantial ongoing pressure put on them to keep them in balance
> > with the overall memory pressure the system is under...
> =

> Well. It does use the existing equation. That is if it scans X% of
> pages, then it scans X% of slab objects. But 1) it often finds pages
> to reclaim at a lower X% 2) the pages it reclaims are less likely to
> refault. So the side effect is the overall slab objects it scans also
> reduce. I do see your point but don't see any options, at the moment.

You'll have to rebalance the memory reclaim algorithms to either:

a) make the shrinkers more aggressive so they do more reclaim when
called less often, or

b) lower the threshold at which shrinkers are called.

Keeping the slab caches in balance with page cache memory pressure
is fairly important for the performance of workloads that generate
inode and dentry cache load, especially those that don't actually
generate page cache pressure. This is the hardest part about making
fundamental changes to memory reclaim behaviour: ensuring that the
system remains balanced over a wide range of differing workloads and
reacts sanely to sudden step changes in workload behaviour...

Cheers,

Dave.
-- =

Dave Chinner
david(a)fromorbit.com
--===============9155299679382833290==--

