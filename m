Content-Type: multipart/mixed; boundary="===============2205510142158854431=="
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] kernfs: fix xattr name handling in LSM helpers
Date: Mon, 01 Apr 2019 11:47:07 +0200
Message-ID: <CAFqZXNud0Q4ANgkGBjnzxJfbZ2+hP5iHyT8BGuvL8EaM7AQDxw@mail.gmail.com>
In-Reply-To: <CAHC9VhQsi-gf2BQOcNLzF=JDZ=0Noj3DQH3iA+7FC3ThwN4BAg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2205510142158854431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2019 at 2:31 PM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Mar 26, 2019 at 8:12 AM Ondrej Mosnacek <omosnace@redhat.com> w=
rote:
> > The implementation of kernfs_security_xattr_*() helpers reuses the
> > kernfs_node_xattr_*() functions, which take the suffix of the xattr name
> > and extract full xattr name from it using xattr_full_name(). However,
> > this function relies on the fact that the suffix passed to xattr
> > handlers from VFS is always constructed from the full name by just
> > incerementing the pointer. This doesn't necessarily hold for the callers
> > of kernfs_security_xattr_*(), so their usage will easily lead to
> > out-of-bounds access.
> >
> > Fix this by converting the helpers to take the full xattr name instead
> > of just the suffix and moving the reconstruction to the xattr handlers.
> > We now need to check if the prefix is correct in the helpers, but it
> > saves us the difficulty of reconstructing the full name from just the
> > plain suffix.
> >
> > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > Fixes: b230d5aba2d1 ("LSM: add new hook for kernfs node initialization")
> > Fixes: ec882da5cda9 ("selinux: implement the kernfs_init_security hook")
> > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > ---
> >
> > v2: Rebase on current selinux/next.
> >
> >  fs/kernfs/inode.c        | 38 ++++++++++++++++++--------------------
> >  include/linux/kernfs.h   |  8 ++++----
> >  security/selinux/hooks.c |  6 +++---
> >  3 files changed, 25 insertions(+), 27 deletions(-)
>
> Thanks for diagnosing this and providing a patch.  I haven't seen any
> objections, but I do have some questions (below).
>
> > diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> > index 673ef598d97d..1daa8aa9ec96 100644
> > --- a/fs/kernfs/inode.c
> > +++ b/fs/kernfs/inode.c
> > @@ -288,28 +288,20 @@ int kernfs_iop_permission(struct inode *inode, in=
t mask)
> >         return generic_permission(inode, mask);
> >  }
> >
> > -static int kernfs_node_xattr_get(const struct xattr_handler *handler,
> > -                                struct kernfs_node *kn, const char *su=
ffix,
> > +static int kernfs_node_xattr_get(struct kernfs_node *kn, const char *n=
ame,
> >                                  void *value, size_t size)
> >  {
> > -       const char *name =3D xattr_full_name(handler, suffix);
> > -       struct kernfs_iattrs *attrs;
> > -
> > -       attrs =3D kernfs_iattrs_noalloc(kn);
> > +       struct kernfs_iattrs *attrs =3D kernfs_iattrs_noalloc(kn);
> >         if (!attrs)
> >                 return -ENODATA;
> >
> >         return simple_xattr_get(&attrs->xattrs, name, value, size);
> >  }
> >
> > -static int kernfs_node_xattr_set(const struct xattr_handler *handler,
> > -                                struct kernfs_node *kn, const char *su=
ffix,
> > +static int kernfs_node_xattr_set(struct kernfs_node *kn, const char *n=
ame,
> >                                  const void *value, size_t size, int fl=
ags)
> >  {
> > -       const char *name =3D xattr_full_name(handler, suffix);
> > -       struct kernfs_iattrs *attrs;
> > -
> > -       attrs =3D kernfs_iattrs(kn);
> > +       struct kernfs_iattrs *attrs =3D kernfs_iattrs(kn);
> >         if (!attrs)
> >                 return -ENOMEM;
> >
>
> ...
>
> > -int kernfs_security_xattr_get(struct kernfs_node *kn, const char *suff=
ix,
> > +int kernfs_security_xattr_get(struct kernfs_node *kn, const char *name,
> >                               void *value, size_t size)
> >  {
> > -       return kernfs_node_xattr_get(&kernfs_security_xattr_handler,
> > -                                    kn, suffix, value, size);
> > +       if (WARN_ON_ONCE(!strstarts(name, XATTR_SECURITY_PREFIX)))
> > +               return -EINVAL;
> > +
> > +       return kernfs_node_xattr_get(kn, name, value, size);
> >  }
> >
> > -int kernfs_security_xattr_set(struct kernfs_node *kn, const char *suff=
ix,
> > +int kernfs_security_xattr_set(struct kernfs_node *kn, const char *name,
> >                               void *value, size_t size, int flags)
> >  {
> > -       return kernfs_node_xattr_set(&kernfs_security_xattr_handler,
> > -                                    kn, suffix, value, size, flags);
> > +       if (WARN_ON_ONCE(!strstarts(name, XATTR_SECURITY_PREFIX)))
> > +               return -EINVAL;
> > +
> > +       return kernfs_node_xattr_set(kn, name, value, size, flags);
> >  }
>
> I think it is reasonable to ask if we even need
> kernfs_security_xattr_{set|get}()?  Can we just call the respective
> kernfs_node_xattr*() functions instead?  I can't imagine the
> WARN_ON_ONCE check being that important.

Indeed, it is now much more natural to just expose all xattrs in those
helpers... I concur that the encapsulation doesn't seem to be worth it
any more. Let me do a simplified respin...


--
Ondrej Mosnacek <omosnace@redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

--===============2205510142158854431==--

