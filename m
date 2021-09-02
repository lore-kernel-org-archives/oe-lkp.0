Content-Type: multipart/mixed; boundary="===============5311200495523172369=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Thu, 02 Sep 2021 21:39:24 +0800
Message-ID: <20210902133924.GA72811@shbuild999.sh.intel.com>
In-Reply-To: <20210902105306.GC17119@blackbody.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============5311200495523172369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 02, 2021 at 12:53:06PM +0200, Michal Koutn?? wrote:
> Hi.
> =

> On Thu, Sep 02, 2021 at 11:46:28AM +0800, Feng Tang <feng.tang@intel.co=
m> wrote:
> > > Narrowing it down to a single prefetcher seems good enough to me. The
> > > behavior of the prefetchers is fairly complicated and hard to predict=
, so I
> > > doubt you'll ever get a 100% step by step explanation.
>  =

> My layman explanation with the available information is that the
> prefetcher somehow behaves as if it marked the offending cacheline as
> modified (even though reading only) therefore slowing down the remote rea=
der.

But this can't explain the test that adding 128 bytes before css->cgroup
can restore/improve the performance.
 =

> On Thu, Sep 02, 2021 at 09:35:58AM +0800, Feng Tang <feng.tang@intel.co=
m> wrote:
> > @@ -139,10 +139,21 @@ struct cgroup_subsys_state {
> >       /* PI: the cgroup that this css is attached to */
> >       struct cgroup *cgroup;
> >
> > +     struct cgroup_subsys_state *parent;
> > +
> >       /* PI: the cgroup subsystem that this css is attached to */
> >       struct cgroup_subsys *ss;
> =

> Hm, an interesting move; be mindful of commit b8b1a2e5eca6 ("cgroup:
> move cgroup_subsys_state parent field for cache locality"). It might be
> a regression for systems with cpuacct root css present. (That is likely
> a big amount nowadays, that may be the reason why you don't see full
> recovery?  For future, we may at least guard cpuacct_charge() with
> cgroup_subsys_enabled() static branch.)

Goot catch! =


Acutally I also tested only moving 'destroy_work' and 'destroy_rwork'
('parent' is not touched with the cost of 8 bytes more padding), which
has simliar effect that restore to about 15% regression. =


> > [snip]
> > Yes, I'm afriad so, given that the policy/algorithm used by perfetcher
> > keeps changing from generation to generation.
> =

> Exactly. I'm afraid of relayouting the structure with each new
> generation. A robust solution is putting all frequently accessed members
> into individual cache-lines + separating them with one more cache line? :=
-/

Yes, this is hard. Even for my debug patch, we can only say it works
as restoring the regression partly, but not knowing the exact reason.

Thansk,
Feng

> =

> Michal
--===============5311200495523172369==--

