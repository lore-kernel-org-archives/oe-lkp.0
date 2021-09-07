Content-Type: multipart/mixed; boundary="===============8521865529479999293=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 10:31:01 -0700
Message-ID: <YTeh1WkseQtyboM9@carbon.dhcp.thefacebook.com>
In-Reply-To: <YTeeBf64yUwj01Sf@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8521865529479999293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 07, 2021 at 07:14:45AM -1000, Tejun Heo wrote:
> Hello,
> =

> On Tue, Sep 07, 2021 at 10:11:21AM -0700, Roman Gushchin wrote:
> > There are two polar cases:
> > 1) a big number of relatively short-living allocations, which lifetime =
is well
> >    bounded (e.g. by a lifetime of a task),
> > 2) a relatively small number of long-living allocations, which lifetime
> >    is potentially indefinite (e.g. struct mount).
> > =

> > We can't use the same approach for both cases, otherwise we'll run into=
 either
> > performance or garbage collection problems (which also lead to performa=
nce
> > problems, but delayed).
> =

> Wouldn't a front cache which expires after some seconds catch both cases?

I'm not sure. For the second case we need to pack allocations from different
tasks/cgroups into a small number of shared pages. It means the front cache
should be really small/non-existing. For the first case we likely need a
substantial cache. Maybe we can do something really smart with scattering
the cache over multiple pages, but I really doubt.
--===============8521865529479999293==--

