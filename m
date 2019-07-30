Content-Type: multipart/mixed; boundary="===============2896798677841838638=="
MIME-Version: 1.0
From: Dave Airlie <airlied@gmail.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 31 Jul 2019 06:26:52 +1000
Message-ID: <CAPM=9txDY7ROKkoLsc1bEaTnEZ+y5p7=EFoibcuy9uoTvsE75g@mail.gmail.com>
In-Reply-To: <CAKMK7uGKH7uTZ1bjUi+cyxmJEfEgmsWgqnP9iNgUNSVsDsfVPg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2896798677841838638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Jul 2019 at 05:00, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Jul 30, 2019 at 8:50 PM Thomas Zimmermann <tzimmermann@suse.de>=
 wrote:
> >
> > Hi
> >
> > Am 30.07.19 um 20:12 schrieb Daniel Vetter:
> > > On Tue, Jul 30, 2019 at 7:50 PM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> > >> Am 29.07.19 um 11:51 schrieb kernel test robot:
> > >>> Greeting,
> > >>>
> > >>> FYI, we noticed a -18.8% regression of vm-scalability.median due to=
 commit:>
> > >>>
> > >>> commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag200: Rep=
lace struct mga_fbdev with generic framebuffer emulation")
> > >>> https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux=
-next.git master
> > >>
> > >> Daniel, Noralf, we may have to revert this patch.
> > >>
> > >> I expected some change in display performance, but not in VM. Since =
it's
> > >> a server chipset, probably no one cares much about display performan=
ce.
> > >> So that seemed like a good trade-off for re-using shared code.
> > >>
> > >> Part of the patch set is that the generic fb emulation now maps and
> > >> unmaps the fbdev BO when updating the screen. I guess that's the cau=
se
> > >> of the performance regression. And it should be visible with other
> > >> drivers as well if they use a shadow FB for fbdev emulation.
> > >
> > > For fbcon we should need to do any maps/unamps at all, this is for the
> > > fbdev mmap support only. If the testcase mentioned here tests fbdev
> > > mmap handling it's pretty badly misnamed :-) And as long as you don't
> > > have an fbdev mmap there shouldn't be any impact at all.
> >
> > The ast and mgag200 have only a few MiB of VRAM, so we have to get the
> > fbdev BO out if it's not being displayed. If not being mapped, it can be
> > evicted and make room for X, etc.
> >
> > To make this work, the BO's memory is mapped and unmapped in
> > drm_fb_helper_dirty_work() before being updated from the shadow FB. [1]
> > That fbdev mapping is established on each screen update, more or less.
> > From my (yet unverified) understanding, this causes the performance
> > regression in the VM code.
> >
> > The original code in mgag200 used to kmap the fbdev BO while it's being
> > displayed; [2] and the drawing code only mapped it when necessary (i.e.,
> > not being display). [3]
>
> Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed should
> cache this.
>
> > I think this could be added for VRAM helpers as well, but it's still a
> > workaround and non-VRAM drivers might also run into such a performance
> > regression if they use the fbdev's shadow fb.
>
> Yeah agreed, fbdev emulation should try to cache the vmap.
>
> > Noralf mentioned that there are plans for other DRM clients besides the
> > console. They would as well run into similar problems.
> >
> > >> The thing is that we'd need another generic fbdev emulation for ast =
and
> > >> mgag200 that handles this issue properly.
> > >
> > > Yeah I dont think we want to jump the gun here.  If you can try to
> > > repro locally and profile where we're wasting cpu time I hope that
> > > should sched a light what's going wrong here.
> >
> > I don't have much time ATM and I'm not even officially at work until
> > late Aug. I'd send you the revert and investigate later. I agree that
> > using generic fbdev emulation would be preferable.
>
> Still not sure that's the right thing to do really. Yes it's a
> regression, but vm testcases shouldn run a single line of fbcon or drm
> code. So why this is impacted so heavily by a silly drm change is very
> confusing to me. We might be papering over a deeper and much more
> serious issue ...

It's a regression, the right thing is to revert first and then work
out the right thing to do.

It's likely the test runs on the console and printfs stuff out while runnin=
g.

Dave.

--===============2896798677841838638==--

