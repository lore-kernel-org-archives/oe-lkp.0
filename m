Content-Type: multipart/mixed; boundary="===============4059906292965663437=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Wed, 11 Aug 2021 16:12:01 -0400
Message-ID: <YRQvEbMSUqIkuMnk@cmpxchg.org>
In-Reply-To: <CAHk-=wiSHHSuSQsCCLOxQA+cbcvjmEeMsTCMWPT1sFVngd9-ig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4059906292965663437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 07:59:53PM -1000, Linus Torvalds wrote:
> On Tue, Aug 10, 2021 at 4:59 PM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > FYI, we noticed a -36.4% regression of vm-scalability.throughput due to=
 commit:
> > 2d146aa3aa84 ("mm: memcontrol: switch to rstat")
> =

> Hmm. I guess some cost is to be expected, but that's a big regression.
> =

> I'm not sure what the code ends up doing, and how relevant this test
> is, but Johannes - could you please take a look?
> =

> I can't make heads nor tails of the profile. The profile kind of points a=
t this:
> =

> >       2.77 =C4=85 12%     +27.4       30.19 =C4=85  8%  perf-profile.ch=
ildren.cycles-pp.native_queued_spin_lock_slowpath
> >       2.86 =C4=85 12%     +27.4       30.29 =C4=85  8%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_irqsave
> >       2.77 =C4=85 12%     +27.4       30.21 =C4=85  8%  perf-profile.ch=
ildren.cycles-pp.lock_page_lruvec_irqsave
> >       4.26 =C4=85 10%     +28.1       32.32 =C4=85  7%  perf-profile.ch=
ildren.cycles-pp.lru_cache_add
> >       4.15 =C4=85 10%     +28.2       32.33 =C4=85  7%  perf-profile.ch=
ildren.cycles-pp.__pagevec_lru_add
> =

> and that seems to be from the chain __do_fault -> shmem_fault ->
> shmem_getpage_gfp -> lru_cache_add -> __pagevec_lru_add ->
> lock_page_lruvec_irqsave -> _raw_spin_lock_irqsave ->
> native_queued_spin_lock_slowpath.
> =

> That shmem_fault codepath being hot may make sense for sokme VM
> scalability test. But it seems to make little sense when I look at the
> commit that it bisected to.
> =

> We had another report of this commit causing a much more reasonable
> small slowdown (-2.8%) back in May.
> =

> I'm not sure what's up with this new report. Johannes, does this make
> sense to you?
> =

> Is it perhaps another "unlucky cache line placement" thing? Or has the
> statistics changes just changed the behavior of the test?

I'm at a loss as well.

The patch only changes how we aggregate the cgroup's memory.stat file,
it doesn't influence reclaim/LRU operations.

The test itself isn't interacting with memory.stat either - IIRC it
doesn't even run inside a dedicated cgroup in this test
environment. The patch should actually reduce accounting overhead here
because we switched from batched percpu flushing during updates to
only flushing when the stats are *read* - which doesn't happen here.

That would leave cachelines. But the cachelines the patch touched are
in struct mem_cgroup, whereas the lock this profile points out is in a
separately allocated per-node structure. The cache footprint on the
percpu data this test is hammering also didn't increase; it actually
decreased a bit, but not sure where this could cause conflicts.

I'll try to reproduce this on a smaller setup. But I have to say, I've
seen a few of these bisection reports now that didn't seem to make any
sense, which is why I've started to take these with a grain of salt.
--===============4059906292965663437==--

