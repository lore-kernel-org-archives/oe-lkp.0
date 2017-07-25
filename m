Content-Type: multipart/mixed; boundary="===============2884294591255601884=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH wq/for-4.13-fixes] workqueue: implicit ordered attribute should be overridable
Date: Tue, 25 Jul 2017 13:29:40 -0400
Message-ID: <20170725172940.GF3216015@devbig577.frc2.facebook.com>
In-Reply-To: <20170723123615.GD1498614@devbig577.frc2.facebook.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2884294591255601884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 23, 2017 at 08:36:15AM -0400, Tejun Heo wrote:
> 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active=3D=3D1 to be
> ordered") automatically enabled ordered attribute for unbound
> workqueues w/ max_active =3D=3D 1.  Because ordered workqueues reject
> max_active and some attribute changes, this implicit ordered mode
> broke cases where the user creates an unbound workqueue w/ max_active
> =3D=3D 1 and later explicitly changes the related attributes.
> =

> This patch distinguishes explicit and implicit ordered setting and
> overrides from attribute changes if implict.
> =

> Signed-off-by: Tejun Heo <tj@kernel.org>
> Fixes: 5c0338c68706 ("workqueue: restore WQ_UNBOUND/max_active=3D=3D1 to =
be ordered")

Applied to wq/for-4.13-fixes.

Thanks.

-- =

tejun

--===============2884294591255601884==--

