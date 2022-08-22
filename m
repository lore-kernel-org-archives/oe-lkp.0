Content-Type: multipart/mixed; boundary="===============1313278622316751901=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 1/3] mm: page_counter: remove unneeded atomic ops for low/min
Date: Mon, 22 Aug 2022 12:18:34 +0200
Message-ID: <YwNX+vq9svMynVgW@dhcp22.suse.cz>
In-Reply-To: <YwNSlZFPMgclrSCz@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1313278622316751901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon 22-08-22 11:55:33, Michal Hocko wrote:
> On Mon 22-08-22 00:17:35, Shakeel Butt wrote:
[...]
> > diff --git a/mm/page_counter.c b/mm/page_counter.c
> > index eb156ff5d603..47711aa28161 100644
> > --- a/mm/page_counter.c
> > +++ b/mm/page_counter.c
> > @@ -17,24 +17,23 @@ static void propagate_protected_usage(struct page_c=
ounter *c,
> >  				      unsigned long usage)
> >  {
> >  	unsigned long protected, old_protected;
> > -	unsigned long low, min;
> >  	long delta;
> >  =

> >  	if (!c->parent)
> >  		return;
> >  =

> > -	min =3D READ_ONCE(c->min);
> > -	if (min || atomic_long_read(&c->min_usage)) {
> > -		protected =3D min(usage, min);
> > +	protected =3D min(usage, READ_ONCE(c->min));
> > +	old_protected =3D atomic_long_read(&c->min_usage);
> > +	if (protected !=3D old_protected) {
> =

> I have to cache that code back into brain. It is really subtle thing and
> it is not really obvious why this is still correct. I will think about
> that some more but the changelog could help with that a lot.

OK, so the this patch will be most useful when the min > 0 && min <
usage because then the protection doesn't really change since the last
call. In other words when the usage grows above the protection and your
workload benefits from this change because that happens a lot as only a
part of the workload is protected. Correct?

Unless I have missed anything this shouldn't break the correctness but I
still have to think about the proportional distribution of the
protection because that adds to the complexity here.
-- =

Michal Hocko
SUSE Labs
--===============1313278622316751901==--

