Content-Type: multipart/mixed; boundary="===============1613059314162814951=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] mm: memcontrol: don't batch updates of local VM stats and events
Date: Tue, 28 May 2019 16:32:18 -0400
Message-ID: <20190528203218.GA20452@cmpxchg.org>
In-Reply-To: <CAHk-=wgaLQjZ8AZj76_cwvk_wLPJjr+Dc=Qvac_vHY2RruuBww@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1613059314162814951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 10:37:15AM -0700, Linus Torvalds wrote:
> On Tue, May 28, 2019 at 9:00 AM Shakeel Butt <shakeelb@google.com> wrot=
e:
> >
> > I was suspecting the following for-loop+atomic-add for the regression.
> =

> If I read the kernel test robot reports correctly, Johannes' fix patch
> does fix the regression (well - mostly. The original reported
> regression was 26%, and with Johannes' fix patch it was 3% - so still
> a slight performance regression, but not nearly as bad).
> =

> > Why the above atomic-add is the culprit?
> =

> I think the problem with that one is that it's cross-cpu statistics,
> so you end up with lots of cacheline bounces on the local counts when
> you have lots of load.

In this case, that's true for both of them. The workload runs at the
root cgroup level, so per definition the local and the recursive
counters at that level are identical and written to at the same
rate. Adding the new counter obviously caused the regression, but
they're contributing equally to the cost, and we could
remove/per-cpuify either of them for the fix.

So why did I unshare the old counter instead of the new one? Well, the
old counter *used* to be unshared for the longest time, and was only
made into a shared one to make recursive aggregation cheaper - before
there was a dedicated recursive counter. But now that we have that
recursive counter, there isn't much reason to keep the local counter
shared and bounce it around on updates.

Essentially, this fix-up is a revert of a983b5ebee57 ("mm: memcontrol:
fix excessive complexity in memory.stat reporting") since the problem
described in that patch is now solved from the other end.

> But yes, the recursive updates still do show a small regression,
> probably because there's still some overhead from the looping up in
> the hierarchy. You still get *those* cacheline bounces, but now they
> are limited to the upper hierarchies that only get updated at batch
> time.

Right, I reduce the *shared* data back to how it was before the patch,
but it still adds a second (per-cpu) counter that needs to get bumped,
and the loop adds a branch as well.

But while I would expect that to show up in a case like will-it-scale,
I'd be surprised if the remaining difference would be noticeable for
real workloads that actually work with the memory they allocate.

--===============1613059314162814951==--

