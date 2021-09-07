Content-Type: multipart/mixed; boundary="===============7062873557941065834=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 12:42:01 -0700
Message-ID: <YTfAiaIbxM0CqEnj@carbon.dhcp.thefacebook.com>
In-Reply-To: <CALvZod4=uY=5Zp_GCzjjMzCbs16856dR85SBWv-dpNc4kBrO+Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7062873557941065834==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 10:48:06AM -0700, Shakeel Butt wrote:
> On Tue, Sep 7, 2021 at 10:31 AM Roman Gushchin <guro@fb.com> wrote:
> >
> > On Tue, Sep 07, 2021 at 07:14:45AM -1000, Tejun Heo wrote:
> > > Hello,
> > >
> > > On Tue, Sep 07, 2021 at 10:11:21AM -0700, Roman Gushchin wrote:
> > > > There are two polar cases:
> > > > 1) a big number of relatively short-living allocations, which lifet=
ime is well
> > > >    bounded (e.g. by a lifetime of a task),
> > > > 2) a relatively small number of long-living allocations, which life=
time
> > > >    is potentially indefinite (e.g. struct mount).
> > > >
> > > > We can't use the same approach for both cases, otherwise we'll run =
into either
> > > > performance or garbage collection problems (which also lead to perf=
ormance
> > > > problems, but delayed).
> > >
> > > Wouldn't a front cache which expires after some seconds catch both ca=
ses?
> >
> > I'm not sure. For the second case we need to pack allocations from diff=
erent
> > tasks/cgroups into a small number of shared pages. It means the front c=
ache
> > should be really small/non-existing. For the first case we likely need a
> > substantial cache. Maybe we can do something really smart with scatteri=
ng
> > the cache over multiple pages, but I really doubt.
> =

> I think we need to prototype this to sensibly evaluate. Let me know if
> you want to take a stab at this otherwise I can try.

If you have time and are ready to jump in, please, go on. Otherwise I can s=
tart
working on it in few weeks. In any case, I'm happy to help with discussions=
, code
reviews & whatever else I can do.

Thanks!
--===============7062873557941065834==--

