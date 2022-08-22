Content-Type: multipart/mixed; boundary="===============7423327197058841424=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Mon, 22 Aug 2022 17:20:01 +0200
Message-ID: <YwOeocdkF/lacpKn@dhcp22.suse.cz>
In-Reply-To: <CALvZod720nwfP68OM2QtyyWJpOV5aO8xF6iuN0U2hpX9Pzj8PA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7423327197058841424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 07:55:58, Shakeel Butt wrote:
> On Mon, Aug 22, 2022 at 3:18 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 22-08-22 11:55:33, Michal Hocko wrote:
> > > On Mon 22-08-22 00:17:35, Shakeel Butt wrote:
> > [...]
> > > > diff --git a/mm/page_counter.c b/mm/page_counter.c
> > > > index eb156ff5d603..47711aa28161 100644
> > > > --- a/mm/page_counter.c
> > > > +++ b/mm/page_counter.c
> > > > @@ -17,24 +17,23 @@ static void propagate_protected_usage(struct pa=
ge_counter *c,
> > > >                                   unsigned long usage)
> > > >  {
> > > >     unsigned long protected, old_protected;
> > > > -   unsigned long low, min;
> > > >     long delta;
> > > >
> > > >     if (!c->parent)
> > > >             return;
> > > >
> > > > -   min =3D READ_ONCE(c->min);
> > > > -   if (min || atomic_long_read(&c->min_usage)) {
> > > > -           protected =3D min(usage, min);
> > > > +   protected =3D min(usage, READ_ONCE(c->min));
> > > > +   old_protected =3D atomic_long_read(&c->min_usage);
> > > > +   if (protected !=3D old_protected) {
> > >
> > > I have to cache that code back into brain. It is really subtle thing =
and
> > > it is not really obvious why this is still correct. I will think about
> > > that some more but the changelog could help with that a lot.
> >
> > OK, so the this patch will be most useful when the min > 0 && min <
> > usage because then the protection doesn't really change since the last
> > call. In other words when the usage grows above the protection and your
> > workload benefits from this change because that happens a lot as only a
> > part of the workload is protected. Correct?
> =

> Yes, that is correct. I hope the experiment setup is clear now.

Maybe it is just me that it took a bit to grasp but maybe we want to
save our future selfs from going through that mental process again. So
please just be explicit about that in the changelog. It is really the
part that workloads excessing the protection will benefit the most that
would help to understand this patch.

> > Unless I have missed anything this shouldn't break the correctness but I
> > still have to think about the proportional distribution of the
> > protection because that adds to the complexity here.
> =

> The patch is not changing any semantics. It is just removing an
> unnecessary atomic xchg() for a specific scenario (min > 0 && min <
> usage). I don't think there will be any change related to proportional
> distribution of the protection.

Yes, I suspect you are right. I just remembered previous fixes
like 503970e42325 ("mm: memcontrol: fix memory.low proportional
distribution") which just made me nervous that this is a tricky area.

I will have another look tomorrow with a fresh brain and send an ack.
-- =

Michal Hocko
SUSE Labs
--===============7423327197058841424==--

