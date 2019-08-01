Content-Type: multipart/mixed; boundary="===============6495450206270275659=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Thu, 01 Aug 2019 16:37:21 +0800
Message-ID: <20190801083721.GA3141@shbuild999.sh.intel.com>
In-Reply-To: <c1944c76-c07c-411b-7929-00df387c6369@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6495450206270275659==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 01, 2019 at 02:19:53PM +0800, Rong Chen wrote:
> >>>>>>>>>
> >>>>>>>>>commit: 90f479ae51afa45efab97afdde9b94b9660dd3e4 ("drm/mgag200: =
Replace struct mga_fbdev with generic framebuffer emulation")
> >>>>>>>>>https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/li=
nux-next.git master
> >>>>>>>>Daniel, Noralf, we may have to revert this patch.
> >>>>>>>>
> >>>>>>>>I expected some change in display performance, but not in VM. Sin=
ce it's
> >>>>>>>>a server chipset, probably no one cares much about display perfor=
mance.
> >>>>>>>>So that seemed like a good trade-off for re-using shared code.
> >>>>>>>>
> >>>>>>>>Part of the patch set is that the generic fb emulation now maps a=
nd
> >>>>>>>>unmaps the fbdev BO when updating the screen. I guess that's the =
cause
> >>>>>>>>of the performance regression. And it should be visible with other
> >>>>>>>>drivers as well if they use a shadow FB for fbdev emulation.
> >>>>>>>For fbcon we should need to do any maps/unamps at all, this is for=
 the
> >>>>>>>fbdev mmap support only. If the testcase mentioned here tests fbdev
> >>>>>>>mmap handling it's pretty badly misnamed :-) And as long as you do=
n't
> >>>>>>>have an fbdev mmap there shouldn't be any impact at all.
> >>>>>>The ast and mgag200 have only a few MiB of VRAM, so we have to get =
the
> >>>>>>fbdev BO out if it's not being displayed. If not being mapped, it c=
an be
> >>>>>>evicted and make room for X, etc.
> >>>>>>
> >>>>>>To make this work, the BO's memory is mapped and unmapped in
> >>>>>>drm_fb_helper_dirty_work() before being updated from the shadow FB.=
 [1]
> >>>>>>That fbdev mapping is established on each screen update, more or le=
ss.
> >>>>>> From my (yet unverified) understanding, this causes the performance
> >>>>>>regression in the VM code.
> >>>>>>
> >>>>>>The original code in mgag200 used to kmap the fbdev BO while it's b=
eing
> >>>>>>displayed; [2] and the drawing code only mapped it when necessary (=
i.e.,
> >>>>>>not being display). [3]
> >>>>>Hm yeah, this vmap/vunmap is going to be pretty bad. We indeed should
> >>>>>cache this.
> >>>>>
> >>>>>>I think this could be added for VRAM helpers as well, but it's stil=
l a
> >>>>>>workaround and non-VRAM drivers might also run into such a performa=
nce
> >>>>>>regression if they use the fbdev's shadow fb.
> >>>>>Yeah agreed, fbdev emulation should try to cache the vmap.
> >>>>>
> >>>>>>Noralf mentioned that there are plans for other DRM clients besides=
 the
> >>>>>>console. They would as well run into similar problems.
> >>>>>>
> >>>>>>>>The thing is that we'd need another generic fbdev emulation for a=
st and
> >>>>>>>>mgag200 that handles this issue properly.
> >>>>>>>Yeah I dont think we want to jump the gun here.  If you can try to
> >>>>>>>repro locally and profile where we're wasting cpu time I hope that
> >>>>>>>should sched a light what's going wrong here.
> >>>>>>I don't have much time ATM and I'm not even officially at work until
> >>>>>>late Aug. I'd send you the revert and investigate later. I agree th=
at
> >>>>>>using generic fbdev emulation would be preferable.
> >>>>>Still not sure that's the right thing to do really. Yes it's a
> >>>>>regression, but vm testcases shouldn run a single line of fbcon or d=
rm
> >>>>>code. So why this is impacted so heavily by a silly drm change is ve=
ry
> >>>>>confusing to me. We might be papering over a deeper and much more
> >>>>>serious issue ...
> >>>>It's a regression, the right thing is to revert first and then work
> >>>>out the right thing to do.
> >>>Sure, but I have no idea whether the testcase is doing something
> >>>reasonable. If it's accidentally testing vm scalability of fbdev and
> >>>there's no one else doing something this pointless, then it's not a
> >>>real bug. Plus I think we're shooting the messenger here.
> >>>
> >>>>It's likely the test runs on the console and printfs stuff out while =
running.
> >>>But why did we not regress the world if a few prints on the console
> >>>have such a huge impact? We didn't get an entire stream of mails about
> >>>breaking stuff ...
> >>The regression seems not related to the commit.  But we have retested
> >>and confirmed the regression.  Hard to understand what happens.
> >Does the regressed test cause any output on console while it's
> >measuring? If so, it's probably accidentally measuring fbcon/DRM code in
> >addition to the workload it's trying to measure.
> >
> =

> Sorry, I'm not familiar with DRM, we enabled the console to output logs, =
and
> attached please find the log file.
> =

> "Command line: ... console=3Dtty0 earlyprintk=3DttyS0,115200
> console=3DttyS0,115200 vga=3Dnormal rw"

We did more check, and found this test machine does use the
mgag200 driver. =


And we are suspecting the regression is caused by =


commit cf1ca9aeb930df074bb5bbcde55f935fec04e529
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jul 3 09:58:24 2019 +0200

    drm/fb-helper: Map DRM client buffer only when required
    =

    This patch changes DRM clients to not map the buffer by default. The
    buffer, like any buffer object, should be mapped and unmapped when
    needed.
    =

    An unmapped buffer object can be evicted to system memory and does
    not consume video ram until displayed. This allows to use generic fbdev
    emulation with drivers for low-memory devices, such as ast and mgag200.
    =

    This change affects the generic framebuffer console. HW-based consoles
    map their console buffer once and keep it mapped. Userspace can mmap th=
is
    buffer into its address space. The shadow-buffered framebuffer console
    only needs the buffer object to be mapped during updates. While not bei=
ng
    updated from the shadow buffer, the buffer object can remain unmapped.
    Userspace will always mmap the shadow buffer.
 =

which may add more load when fbcon is busy printing out messages.

We are doing more test inside 0day to confirm.

Thanks,
Feng

--===============6495450206270275659==--

