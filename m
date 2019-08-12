Content-Type: multipart/mixed; boundary="===============0980392523399665515=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/mgag200] 90f479ae51: vm-scalability.median -18.8% regression
Date: Mon, 12 Aug 2019 15:25:45 +0800
Message-ID: <20190812072545.GA63191@shbuild999.sh.intel.com>
In-Reply-To: <c6e220fe-230c-265c-f2fc-b0948d1cb898@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0980392523399665515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Fri, Aug 09, 2019 at 04:12:29PM +0800, Rong Chen wrote:
> Hi,
> =

> >>Actually we run the benchmark as a background process, do we need to
> >>disable the cursor and test again?
> >There's a worker thread that updates the display from the shadow buffer.
> >The blinking cursor periodically triggers the worker thread, but the
> >actual update is just the size of one character.
> >
> >The point of the test without output is to see if the regression comes
> >from the buffer update (i.e., the memcpy from shadow buffer to VRAM), or
> >from the worker thread. If the regression goes away after disabling the
> >blinking cursor, then the worker thread is the problem. If it already
> >goes away if there's simply no output from the test, the screen update
> >is the problem. On my machine I have to disable the blinking cursor, so
> >I think the worker causes the performance drop.
> =

> We disabled redirecting stdout/stderr to /dev/kmsg,=C2=A0 and the regress=
ion is
> gone.
> =

> commit:
> =C2=A0 f1f8555dfb9 drm/bochs: Use shadow buffer for bochs framebuffer con=
sole
> =C2=A0 90f479ae51a drm/mgag200: Replace struct mga_fbdev with generic fra=
mebuffer
> emulation
> =

> f1f8555dfb9a70a2=C2=A0 90f479ae51afa45efab97afdde testcase/testparams/tes=
tbox
> ----------------=C2=A0 -------------------------- -----------------------=
----
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %std=
dev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 44481
> vm-scalability/300s-8T-anon-cow-seq-hugetlb/lkp-knm01
> =C2=A0=C2=A0=C2=A0=C2=A0 43785=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 44481=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GEO-MEAN vm=
-scalability.median

Till now, from Rong's tests:
1. Disabling cursor blinking doesn't cure the regression.
2. Disabling printint test results to console can workaround the
regression.

Also if we set the perfer_shadown to 0, the regression is also
gone.

--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -167,7 +167,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigne=
d long flags)
 		dev->mode_config.preferred_depth =3D 16;
 	else
 		dev->mode_config.preferred_depth =3D 32;
-	dev->mode_config.prefer_shadow =3D 1;
+	dev->mode_config.prefer_shadow =3D 0;

And from the perf data, one obvious difference is good case don't
call drm_fb_helper_dirty_work(), while bad case calls.

Thanks,
Feng

> Best Regards,
> Rong Chen

--===============0980392523399665515==--

