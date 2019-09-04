Content-Type: multipart/mixed; boundary="===============2598492470924433099=="
MIME-Version: 1.0
From: Daniel Vetter <daniel@ffwll.ch>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Wed, 04 Sep 2019 10:11:11 +0200
Message-ID: <CAKMK7uGdOtyDHZMSzY8J45bX57EFKo=DWNUi+WL+GVOzoBpUhw@mail.gmail.com>
In-Reply-To: <72c33bf1-9184-e24a-c084-26d9c8b6f9b7@suse.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============2598492470924433099==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 4, 2019 at 8:53 AM Thomas Zimmermann <tzimmermann@suse.de> wr=
ote:
>
> Hi
>
> Am 04.09.19 um 08:27 schrieb Feng Tang:
> >> Thank you for testing. But don't get too excited, because the patch
> >> simulates a bug that was present in the original mgag200 code. A
> >> significant number of frames are simply skipped. That is apparently the
> >> reason why it's faster.
> >
> > Thanks for the detailed info, so the original code skips time-consuming
> > work inside atomic context on purpose. Is there any space to optmise it?
> > If 2 scheduled update worker are handled at almost same time, can one be
> > skipped?
>
> To my knowledge, there's only one instance of the worker. Re-scheduling
> the worker before a previous instance started, will not create a second
> instance. The worker's instance will complete all pending updates. So in
> some way, skipping workers already happens.

So I think that the most often fbcon update from atomic context is the
blinking cursor. If you disable that one you should be back to the old
performance level I think, since just writing to dmesg is from process
context, so shouldn't change.

https://unix.stackexchange.com/questions/3759/how-to-stop-cursor-from-blink=
ing

Bunch of tricks, but tbh I haven't tested them.

In any case, I still strongly advice you don't print anything to dmesg
or fbcon while benchmarking, because dmesg/printf are anything but
fast, especially if a gpu driver is involved. There's some efforts to
make the dmesg/printk side less painful (untangling the console_lock
from printk), but fundamentally printing to the gpu from the kernel
through dmesg/fbcon won't be cheap. It's just not something we
optimize beyond "make sure it works for emergencies".
-Daniel

>
> Best regards
> Thomas
>
> >
> > Thanks,
> > Feng
> >
> >>
> >> Best regards
> >> Thomas
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel(a)lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
> HRB 21284 (AG N=C3=BCrnberg)
>
> _______________________________________________
> dri-devel mailing list
> dri-devel(a)lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- =

Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

--===============2598492470924433099==--

