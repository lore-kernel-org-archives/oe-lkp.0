Content-Type: multipart/mixed; boundary="===============0749762988591058169=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [proc/sysctl] 1dd38979b2: BUG:kernel_NULL_pointer_dereference, address
Date: Mon, 25 Apr 2022 21:24:56 -0700
Message-ID: <Ymd0GIf3Ieh3DRcg@bombadil.infradead.org>
In-Reply-To: <Ymc1Zn8BbQMbjb58@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0749762988591058169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 25, 2022 at 04:57:26PM -0700, Luis Chamberlain wrote:
> On Mon, Apr 25, 2022 at 04:34:34PM -0700, Andrew Morton wrote:
> > On Mon, 25 Apr 2022 16:08:57 -0700 Luis Chamberlain <mcgrof@kernel.or=
g> wrote:
> > =

> > > On Mon, Apr 25, 2022 at 02:46:07PM -0700, Andrew Morton wrote:
> > > > On Mon, 25 Apr 2022 12:00:21 -0700 Luis Chamberlain <mcgrof@kerne=
l.org> wrote:
> > > > =

> > > > > Andrew, can we drop this patch for now?
> > > > =

> > > > I've been sitting on (ie, forgotten about) this patch
> > > > (https://lore.kernel.org/all/20200709235115.56954-1-jpitti(a)cisco.=
com/T/#u)
> > > =

> > > Jesh, yeah I see.
> > > =

> > > > for two years.  Evidently waiting for you/Kees/Ingo to provide
> > > > guidance.  So sure, the need seems very unurgent so I can drop it.
> > > =

> > > Well Keew as OK with it, but I yeah I can't decipher the issue at this
> > > point in time.
> > > =

> > > > However I fail to see how that patch could have caused this crash. =
 I'm
> > > > suspecting a bisection error?
> > > > =

> > > > Maybe something is unwell in drivers/vdpa/vdpa_user/vduse_dev.c.
> > > =

> > > At a quick glance, yes it could very well by vduse_init() is messy and
> > > races somehow with init, but if a race does lurk here my instincts te=
ll
> > > me this can't be the only place.
> > > =

> > > Not sure if leaving a patch in place more time to see how else things
> > > can explode is worth it.
> > =

> > Confused.  Are you thinking that the above-linked patch was somehow
> > involved in this crash?  If so, but how?  All it does it to permit
> > unprivileged reads to four ints via proc_dointvec_minmax()?
> =

> If the priv allows for it access to dereferencing a pointer is allowed.
> How that race happens though, indeed is beyond the patch's fault.

Even so, I am 99.99% sure this is a driver bug then. And so if enabling
this patch just enables more driver bugs so be it.

So driver maintainers: please take a look, I tried to check but
the driver bug is not obvious to me yet.

  Luis
--===============0749762988591058169==--

