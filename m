Content-Type: multipart/mixed; boundary="===============2756315228370652704=="
MIME-Version: 1.0
From: Yongji Xie <xieyongji@bytedance.com>
To: lkp@lists.01.org
Subject: Re: [proc/sysctl] 1dd38979b2: BUG:kernel_NULL_pointer_dereference, address
Date: Tue, 26 Apr 2022 12:49:49 +0800
Message-ID: <CACycT3vXkS3vbF2vduUg0XgLv-B=LdvyS1sVA0W=9+Se4AaVXA@mail.gmail.com>
In-Reply-To: <Ymd0GIf3Ieh3DRcg@bombadil.infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============2756315228370652704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 12:25 PM Luis Chamberlain <mcgrof@kernel.org> wro=
te:
>
> On Mon, Apr 25, 2022 at 04:57:26PM -0700, Luis Chamberlain wrote:
> > On Mon, Apr 25, 2022 at 04:34:34PM -0700, Andrew Morton wrote:
> > > On Mon, 25 Apr 2022 16:08:57 -0700 Luis Chamberlain <mcgrof@kernel.=
org> wrote:
> > >
> > > > On Mon, Apr 25, 2022 at 02:46:07PM -0700, Andrew Morton wrote:
> > > > > On Mon, 25 Apr 2022 12:00:21 -0700 Luis Chamberlain <mcgrof@ker=
nel.org> wrote:
> > > > >
> > > > > > Andrew, can we drop this patch for now?
> > > > >
> > > > > I've been sitting on (ie, forgotten about) this patch
> > > > > (https://lore.kernel.org/all/20200709235115.56954-1-jpitti(a)cisc=
o.com/T/#u)
> > > >
> > > > Jesh, yeah I see.
> > > >
> > > > > for two years.  Evidently waiting for you/Kees/Ingo to provide
> > > > > guidance.  So sure, the need seems very unurgent so I can drop it.
> > > >
> > > > Well Keew as OK with it, but I yeah I can't decipher the issue at t=
his
> > > > point in time.
> > > >
> > > > > However I fail to see how that patch could have caused this crash=
.  I'm
> > > > > suspecting a bisection error?
> > > > >
> > > > > Maybe something is unwell in drivers/vdpa/vdpa_user/vduse_dev.c.
> > > >
> > > > At a quick glance, yes it could very well by vduse_init() is messy =
and
> > > > races somehow with init, but if a race does lurk here my instincts =
tell
> > > > me this can't be the only place.
> > > >
> > > > Not sure if leaving a patch in place more time to see how else thin=
gs
> > > > can explode is worth it.
> > >
> > > Confused.  Are you thinking that the above-linked patch was somehow
> > > involved in this crash?  If so, but how?  All it does it to permit
> > > unprivileged reads to four ints via proc_dointvec_minmax()?
> >
> > If the priv allows for it access to dereferencing a pointer is allowed.
> > How that race happens though, indeed is beyond the patch's fault.
>
> Even so, I am 99.99% sure this is a driver bug then. And so if enabling
> this patch just enables more driver bugs so be it.
>
> So driver maintainers: please take a look, I tried to check but
> the driver bug is not obvious to me yet.
>

Yes, I think it's a driver bug. I'll send a patch soon.

Thanks,
Yongji
--===============2756315228370652704==--

