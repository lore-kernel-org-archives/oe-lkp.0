Content-Type: multipart/mixed; boundary="===============3797582844006760224=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 16:35:58 +0800
Message-ID: <20190904083558.GD5541@shbuild999.sh.intel.com>
In-Reply-To: <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3797582844006760224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Wed, Sep 04, 2019 at 10:11:11AM +0200, Daniel Vetter wrote:
> On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
> >
> > Hi
> >
> > Am 04.09.19 um 08:27 schrieb Feng Tang:
> > >> Thank you for testing. But don't get too excited, because the patch
> > >> simulates a bug that was present in the original mgag200 code. A
> > >> significant number of frames are simply skipped. That is apparently =
the
> > >> reason why it's faster.
> > >
> > > Thanks for the detailed info, so the original code skips time-consumi=
ng
> > > work inside atomic context on purpose. Is there any space to optmise =
it?
> > > If 2 scheduled update worker are handled at almost same time, can one=
 be
> > > skipped?
> >
> > To my knowledge, there's only one instance of the worker. Re-scheduling
> > the worker before a previous instance started, will not create a second
> > instance. The worker's instance will complete all pending updates. So in
> > some way, skipping workers already happens.
> =

> So I think that the most often fbcon update from atomic context is the
> blinking cursor. If you disable that one you should be back to the old
> performance level I think, since just writing to dmesg is from process
> context, so shouldn't change.

Hmm, then for the old driver, it should also do the most update in
non-atomic context? =


One other thing is, I profiled that updating a 3MB shadow buffer needs
20 ms, which transfer to 150 MB/s bandwidth. Could it be related with
the cache setting of DRM shadow buffer? say the orginal code use a
cachable buffer?


> =

> https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-bli=
nking
> =

> Bunch of tricks, but tbh I haven't tested them.

Thomas has suggested to disable curson by
	echo 0 > /sys/devices/virtual/graphics/fbcon/cursor_blink

We tried that way, and no change for the performance data.

Thanks,
Feng

> =

> In any case, I still strongly advice you don't print anything to dmesg
> or fbcon while benchmarking, because dmesg/printf are anything but
> fast, especially if a gpu driver is involved. There's some efforts to
> make the dmesg/printk side less painful (untangling the console_lock
> from printk), but fundamentally printing to the gpu from the kernel
> through dmesg/fbcon won't be cheap. It's just not something we
> optimize beyond "make sure it works for emergencies".
> -Daniel
> =

> >
> > Best regards
> > Thomas
> >
> > >
> > > Thanks,
> > > Feng
> > >
> > >>
> > >> Best regards
> > >> Thomas
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel(a)lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> >
> > --
> > Thomas Zimmermann
> > Graphics Driver Developer
> > SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
> > GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
> > HRB 21284 (AG N=C3=BCrnberg)
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel(a)lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =

> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch

--===============3797582844006760224==--

