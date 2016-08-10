Content-Type: multipart/mixed; boundary="===============1841049480888194945=="
MIME-Version: 1.0
From: Jeff Layton <jlayton@redhat.com>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Wed, 10 Aug 2016 15:06:23 -0400
Message-ID: <1470855983.2694.5.camel@redhat.com>
In-Reply-To: <e6fb50d4-2a27-13cd-02c8-5b8439a16b3f@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1841049480888194945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-08-10 at 14:46 -0400, Josef Bacik wrote:
> On 08/10/2016 02:25 PM, Linus Torvalds wrote:
> > =

> > > > On Wed, Aug 10, 2016 at 11:22 AM, Josef Bacik <jbacik@fb.com> wro=
te:
> > > =

> > > On 08/10/2016 02:06 PM, Linus Torvalds wrote:
> > > > =

> > > > =

> > > > More information in the original email on lkml.
> > > =

> > > I'm not subscribed to lkml and for some reason I can't find the origi=
nal
> > > email in any of the lkml/linux-nfs archives.=C2=A0=C2=A0Could you for=
ward more of the
> > > details?
> > =

> > Done.
> > =

> =

> So my naive fix would be something like this
> =

> =

> > From: Josef Bacik <jbacik@fb.com>
> Date: Wed, 10 Aug 2016 14:43:08 -0400
> Subject: [PATCH] nfsd: fix dentry refcounting problem
> =

> b44061d0b9 introduced a dentry ref counting bug, previously we were grabb=
ing one
> ref to dchild in nfsd_create(), but with the creation of nfsd_create_lock=
ed() we
> have a ref for dchild from the lookup in nfsd_create(), and then another =
ref in
> nfsd_create_locked().=C2=A0=C2=A0The ref from the lookup in nfsd_create()=
 is never dropped
> and results in dentries still in use at unmount.
> =

> > Signed-off-by: Josef Bacik <jbacik@fb.com>
> ---
> =C2=A0 fs/nfsd/vfs.c | 9 ++++++---
> =C2=A0 1 file changed, 6 insertions(+), 3 deletions(-)
> =

> diff --git a/fs/nfsd/vfs.c b/fs/nfsd/vfs.c
> index ba944123..ff476e6 100644
> --- a/fs/nfsd/vfs.c
> +++ b/fs/nfsd/vfs.c
> @@ -1252,10 +1252,13 @@ nfsd_create(struct svc_rqst *rqstp, struct svc_fh=
 *fhp,
> > =C2=A0=C2=A0	if (IS_ERR(dchild))
> > =C2=A0=C2=A0		return nfserrno(host_err);
> > =C2=A0=C2=A0	err =3D fh_compose(resfhp, fhp->fh_export, dchild, fhp);
> > -	if (err) {
> > -		dput(dchild);
> > +	/*
> > +	=C2=A0* We unconditionally drop our ref to dchild as fh_compose will =
have
> > +	=C2=A0* already grabbed its own ref for it.
> > +	=C2=A0*/
> > +	dput(dchild);
> > +	if (err)
> > =C2=A0=C2=A0		return err;
> > -	}
> > =C2=A0=C2=A0	return nfsd_create_locked(rqstp, fhp, fname, flen, iap, ty=
pe,
> > =C2=A0=C2=A0					rdev, resfhp);
> =C2=A0 }

Looks correct to me:

Reviewed-by: Jeff Layton <jlayton@redhat.com>

--===============1841049480888194945==--

