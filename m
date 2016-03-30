Content-Type: multipart/mixed; boundary="===============7906861163211912080=="
MIME-Version: 1.0
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] [PATCH v3 0/7] Enhance PAT init to fix Xorg crashes
Date: Wed, 30 Mar 2016 16:29:20 -0400
Message-ID: <20160330202920.GB23916@char.us.oracle.com>
In-Reply-To: <CAB=NE6V2BOfkM5B8E+YULqrjqh_QaXOtBgyqpvBoku-73N4X-Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7906861163211912080==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 01:10:29PM -0700, Luis R. Rodriguez wrote:
> On Wed, Mar 30, 2016 at 11:58 AM, Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com> wrote:
> > On Wed, Mar 30, 2016 at 11:02:13AM -0700, Luis R. Rodriguez wrote:
> >> On Tue, Mar 29, 2016 at 8:49 AM, Toshi Kani <toshi.kani@hpe.com> wro=
te:
> >> > On Tue, 2016-03-29 at 10:46 -0400, Boris Ostrovsky wrote:
> >> >> On 03/29/2016 10:19 AM, Toshi Kani wrote:
> >> >> > On Tue, 2016-03-29 at 12:34 +0200, Ingo Molnar wrote:
> >> >> >
> >> >> > > > I'd appreciate if someone can test this patch-set on Xen to v=
erify
> >> >> > > > that there is no change in "x86/PAT: Configuration [0-7] .."
> >> >> > > > message in dmesg.
> >> >> > > So I don't have a Xen setup, but hopefully such testing will ha=
ppen
> >> >> > > once these changes show up in linux-next, tomorrow or so.
> >> >> > I will address if any issue is found in testing.
> >> >>
> >> >> I ran a subset of out nightly test. Nobody died.
> >> >>
> >> >> So this all looks good. (It actually may have also fixed another bug
> >> >> that was reported recently by Olaf, copied here)
> >> >
> >> > Cool! Thanks Boris!
> >>
> >> Hoping Boris or someone on the Xen front would test this prior to
> >> merging helps but it also slows us down, a while ago we discussed the
> >
> > Boris did test it _before_ it was merged.
> =

> Yes, my point being that we should not need Boris to test collateral
> Xen patches.

/me scratches his head.

Are you saying that you expect Xen maintainers to _NOT_ test Xen related
patches? Especially ones they have been involved with?

> =

> >> possibility of getting Linux Xen guests automatically tested as part
> >> of 0-day, this way then when a developer (in this case Toshi) pushes
> >> to his own tree, he'd be able to just sit and wait for the results,
> >> without having to hope Boris or someone goes out and tests.
> >
> > In Fedora you just need to do:
> >
> > #yum install xen
> > #reboot
> > And pick the Xen option.
> >
> > Probably the same thing with Debian and Ubuntu - just 'apt-get install =
xen'
> =

> We can't expect everyone to do that.
> =

> >> Its a major undertaking to get Linux Xen guests boot strapped into 0-d=
ay,
> >
> > It is?
> =

> If its really trivial then you give me the impression you can help
> with its integration. 0-day is open after all.

I have no clue on how the 0-day works - hence my question. I would be more =
than
happy to help once free time lines up.

--===============7906861163211912080==--

