Content-Type: multipart/mixed; boundary="===============7306140193626605628=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 10:11:21 -0700
Message-ID: <YTedOVCV3s6Z210f@carbon.dhcp.thefacebook.com>
In-Reply-To: <774dee70-69bd-9f95-d197-4cff83e4e633@kernel.dk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7306140193626605628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 10:43:46AM -0600, Jens Axboe wrote:
> On 9/7/21 10:39 AM, Linus Torvalds wrote:
> > On Tue, Sep 7, 2021 at 8:46 AM Jens Axboe <axboe@kernel.dk> wrote:
> >>
> >> Are we at all worried about these? There's been a number of them
> >> reported, basically for all the accounting enablements that have been
> >> done in this merge window.
> > =

> > We are worried about them. I'm considering reverting several of them
> > because I think the problems are
> > =

> >  (a) big
> > =

> >  (b) nontrivial
> > =

> > and the patches clearly weren't ready and people weren't aware of this =
issue.
> =

> I think that is prudent. When I first enabled it for io_uring it was a
> bit of a shit show in terms of performance degradations, and some work
> had to be done before it could get enabled in a sane fashion.
> =

> The accounting needs to be more efficient if we're seeing 30-50%
> slowdowns simply by enabling it on a kmem cache.

There are two polar cases:
1) a big number of relatively short-living allocations, which lifetime is w=
ell
   bounded (e.g. by a lifetime of a task),
2) a relatively small number of long-living allocations, which lifetime
   is potentially indefinite (e.g. struct mount).

We can't use the same approach for both cases, otherwise we'll run into eit=
her
performance or garbage collection problems (which also lead to performance
problems, but delayed).

I think of maybe building a generic cache layer for accounted allocations,
which can be used in cases like io_uring. Shakeel, what's your plan here?

As now, I agree that reverting patches causing a significant regression is =
best
way forward.
--===============7306140193626605628==--

