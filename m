Content-Type: multipart/mixed; boundary="===============5456560399821209442=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 15 Apr 2019 13:48:32 +0200
Message-ID: <20190415114832.GK3366@dhcp22.suse.cz>
In-Reply-To: <alpine.DEB.2.21.1812061505010.162675@chino.kir.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5456560399821209442==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 06-12-18 15:43:26, David Rientjes wrote:
> On Wed, 5 Dec 2018, Linus Torvalds wrote:
> =

> > > Ok, I've applied David's latest patch.
> > >
> > > I'm not at all objecting to tweaking this further, I just didn't want
> > > to have this regression stand.
> > =

> > Hmm. Can somebody (David?) also perhaps try to state what the
> > different latency impacts end up being? I suspect it's been mentioned
> > several times during the argument, but it would be nice to have a
> > "going forward, this is what I care about" kind of setup for good
> > default behavior.
> > =

> =

> I'm in the process of writing a more complete test case for this but I =

> benchmarked a few platforms based solely on remote hugepages vs local =

> small pages vs remote hugepages.  My previous numbers were based on data =

> from actual workloads.

Has this materialized into anything we can use? We plan to discuss this
particular topic at the LSFMM this year and it would be great to have
something to play with.

I am quite nervious that we have left quite a common case with a
bad performance based on a complain that we cannot really reproduce
so it is really hard to move on.
-- =

Michal Hocko
SUSE Labs

--===============5456560399821209442==--

