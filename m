Content-Type: multipart/mixed; boundary="===============1395954148181248542=="
MIME-Version: 1.0
From: Claudio Suarez <cssk@net-c.es>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] drm: fix error found in some cases after the patch d1af5cd86997
Date: Tue, 21 Dec 2021 23:55:26 +0100
Message-ID: <YcJbXva93zJJBGbE@gineta.localdomain>
In-Reply-To: <YcC5Qxnj8PvqnS6f@phenom.ffwll.local>
List-Id: <oe-lkp.lists.linux.dev>

--===============1395954148181248542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 06:11:31PM +0100, Daniel Vetter wrote:
> On Mon, Dec 20, 2021 at 10:18:38AM +0100, Daniel Vetter wrote:
> > On Thu, Dec 02, 2021 at 10:51:12AM +0100, Claudio Suarez wrote:
> > > The patch d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log
> > > calls in drm core, files drm_a*.c") fails when the drm_device
> > > cannot be found in the parameter plane_state->crtc.
> > > Fix it using plane_state->plane.
> > > =

> > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > Fixes: d1af5cd86997 ("drm: get rid of DRM_DEBUG_* log calls in drm co=
re, files drm_a*.c")
> =

> My scrip complained about the fixes line, so I fixed it. I guess you've
> used the sha1 from your tree, not from upstream?

Yes, my bad, sorry. Thanks for the advice.

> Please always use
> upstream sha1 when referencing commits.
> =

> Anyway patches are now pushed.

Thank you!

Best regards.
Claudio Suarez.



--===============1395954148181248542==--

