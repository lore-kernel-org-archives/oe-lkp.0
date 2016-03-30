Content-Type: multipart/mixed; boundary="===============1491665130874939154=="
MIME-Version: 1.0
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: lkp@lists.01.org
Subject: Re: [Xen-devel] [PATCH v3 0/7] Enhance PAT init to fix Xorg crashes
Date: Wed, 30 Mar 2016 14:58:33 -0400
Message-ID: <20160330185833.GA3323@char.us.oracle.com>
In-Reply-To: <CAB=NE6VZD3gJicAzm3068APmVeKmFdF-gavNjEoVCz51hV262g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1491665130874939154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2016 at 11:02:13AM -0700, Luis R. Rodriguez wrote:
> On Tue, Mar 29, 2016 at 8:49 AM, Toshi Kani <toshi.kani@hpe.com> wrote:
> > On Tue, 2016-03-29 at 10:46 -0400, Boris Ostrovsky wrote:
> >> On 03/29/2016 10:19 AM, Toshi Kani wrote:
> >> > On Tue, 2016-03-29 at 12:34 +0200, Ingo Molnar wrote:
> >> >
> >> > > > I'd appreciate if someone can test this patch-set on Xen to veri=
fy
> >> > > > that there is no change in "x86/PAT: Configuration [0-7] .."
> >> > > > message in dmesg.
> >> > > So I don't have a Xen setup, but hopefully such testing will happen
> >> > > once these changes show up in linux-next, tomorrow or so.
> >> > I will address if any issue is found in testing.
> >>
> >> I ran a subset of out nightly test. Nobody died.
> >>
> >> So this all looks good. (It actually may have also fixed another bug
> >> that was reported recently by Olaf, copied here)
> >
> > Cool! Thanks Boris!
> =

> Hoping Boris or someone on the Xen front would test this prior to
> merging helps but it also slows us down, a while ago we discussed the

Boris did test it _before_ it was merged.

> possibility of getting Linux Xen guests automatically tested as part
> of 0-day, this way then when a developer (in this case Toshi) pushes
> to his own tree, he'd be able to just sit and wait for the results,
> without having to hope Boris or someone goes out and tests.

In Fedora you just need to do:

#yum install xen
#reboot
And pick the Xen option. =


Probably the same thing with Debian and Ubuntu - just 'apt-get install xen'

> =

> Its a major undertaking to get Linux Xen guests boot strapped into

It is?

> 0-day, however such prospects were raised a while ago and it seems we
> may be able to get there. Just wanted to send a reminder about this
> possibility, and highlight this patch set as an ideal candidate where
> a proactive test could have helped as well. I proactively caught the
> original Xen issue, but git logs shows we are not doing so great in
> this area, so any help on the Xen side as well to help with 0-day
> integration would be appreciated.
> =

> I'll follow up on another thread on that.

Sure. It never hurts to have more coverage.
> =

>  Luis
> =

> _______________________________________________
> Xen-devel mailing list
> Xen-devel(a)lists.xen.org
> http://lists.xen.org/xen-devel

--===============1491665130874939154==--

