Content-Type: multipart/mixed; boundary="===============7700942180316560473=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [genirq] cbe16f35be: will-it-scale.per_thread_ops -5.2% regression
Date: Wed, 28 Apr 2021 23:23:39 +0800
Message-ID: <20210428152339.GA2282261@pl-dbox>
In-Reply-To: <87o8dyn5xr.ffs@nanos.tec.linutronix.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7700942180316560473==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 10:56:16AM +0200, Thomas Gleixner wrote:
> On Wed, Apr 28 2021 at 16:08, Feng Tang wrote:
> > On Wed, Apr 28, 2021 at 07:01:35AM +0000, Song Bao Hua (Barry Song) wro=
te:
> >
> >> But it is still an irrelevant problem.
> > Yes, the commit itself has no problem. And my personal thought
> > is no further action is needed. =

> =

> The commit does not need any further action, but this testing stuff
Sorry Thomas for confusion and trouble caused by this. We will take it
seriously to refine the report process for this category (alignment or
cache behavior) of performance change, to avoid meaningless ones.

Thanks

> really needs further action because we can't differentiate between real
> regressions and these bogus reports anymore.
> =

> Thanks,
> =

>         tglx
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
--===============7700942180316560473==--

