Content-Type: multipart/mixed; boundary="===============5384501627956984973=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [nfsd] b44061d0b9: BUG: Dentry ffff880027d7c540{i=1846f, n=0a} still in use (1) [unmount of btrfs vda]
Date: Thu, 11 Aug 2016 03:19:09 +0100
Message-ID: <20160811021909.GR2356@ZenIV.linux.org.uk>
In-Reply-To: <e6fb50d4-2a27-13cd-02c8-5b8439a16b3f@fb.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5384501627956984973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 02:46:27PM -0400, Josef Bacik wrote:
> On 08/10/2016 02:25 PM, Linus Torvalds wrote:
> > On Wed, Aug 10, 2016 at 11:22 AM, Josef Bacik <jbacik@fb.com> wrote:
> > > On 08/10/2016 02:06 PM, Linus Torvalds wrote:
> > > > =

> > > > More information in the original email on lkml.
> > > =

> > > I'm not subscribed to lkml and for some reason I can't find the origi=
nal
> > > email in any of the lkml/linux-nfs archives.  Could you forward more =
of the
> > > details?
> > =

> > Done.
> > =

> =

> So my naive fix would be something like this
> =

> =

> From: Josef Bacik <jbacik@fb.com>
> Date: Wed, 10 Aug 2016 14:43:08 -0400
> Subject: [PATCH] nfsd: fix dentry refcounting problem
> =

> b44061d0b9 introduced a dentry ref counting bug, previously we were grabb=
ing one
> ref to dchild in nfsd_create(), but with the creation of nfsd_create_lock=
ed() we
> have a ref for dchild from the lookup in nfsd_create(), and then another =
ref in
> nfsd_create_locked().  The ref from the lookup in nfsd_create() is never =
dropped
> and results in dentries still in use at unmount.
> =

> Signed-off-by: Josef Bacik <jbacik@fb.com>

[sorry, had been off-line since yesterday]

Patch looks sane; feel free to slap Acked-by: Al Viro <viro@zeniv.linux.o=
rg.uk>
on it.  I think it should go through nfsd tree.

--===============5384501627956984973==--

