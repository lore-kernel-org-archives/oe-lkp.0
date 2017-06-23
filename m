Content-Type: multipart/mixed; boundary="===============1981905787862903445=="
MIME-Version: 1.0
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: lkp@lists.01.org
Subject: Re: [PATCH 0/3] Enable namespaced file capabilities
Date: Thu, 22 Jun 2017 17:13:07 -0700
Message-ID: <1498176787.7636.11.camel@HansenPartnership.com>
In-Reply-To: <20170622233619.GC2894@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1981905787862903445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-06-22 at 18:36 -0500, Serge E. Hallyn wrote:
> Quoting James Bottomley (James.Bottomley(a)HansenPartnership.com):
> > On Thu, 2017-06-22 at 14:59 -0400, Stefan Berger wrote:
> > > This series of patches primary goal is to enable file =

> > > capabilities in user namespaces without affecting the file =

> > > capabilities that are effective on the host. This is to prevent =

> > > that any unprivileged user on the host maps his own uid to root =

> > > in a private namespace, writes the xattr, and executes the file
> > > with privilege on the host.
> > > =

> > > We achieve this goal by writing extended attributes with a =

> > > different name when a user namespace is used. If for example the =

> > > root user in a user namespace writes the security.capability =

> > > xattr, the name of the xattr that is actually written is encoded =

> > > as security.capability(a)uid=3D1000 for root mapped to uid 1000 on =

> > > the host. When listing the xattrs on the host, the existing
> > > security.capability as well as the security.capability(a)uid=3D1000 =

> > > will be shown. Inside the namespace only 'security.capability', =

> > > with the value of security.capability(a)uid=3D1000, is visible.
> > =

> > I'm a bit bothered by the @uid=3D1000 suffix.  What if I want to use =

> > this capability but am dynamically mapping the namespaces (i.e. I =

> > know I want unprivileged root, but I'm going to dynamically select =

> > the range to map based on what's currently available on the =

> > orchestration system).  If we stick with the @uid=3DX suffix, then =

> > dynamic mapping won't work because X is potentially different each =

> > time and there'll be a name mismatch in my xattrs.  Why not just =

> > make the suffix @uid, which means if root is mapped to any =

> > unprivileged uid then we pick this up otherwise we go with the
> > unsuffixed property?
> > =

> > As far as I can see there's no real advantage to discriminating =

> > userns specific xattrs based on where root is mapped to, unless =

> > there's a use case I'm missing?
> =

> Yes, the use case is: to allow root in the container to set the
> privilege itself, without endangering any resources not owned by
> that root.

OK, so you envisage the same filesystem being mounted in different user
namespaces and being able to see their own value for the xattr.  It
still seems a bit weird that they'd be able to change file contents and
have that seen by the other userns but not xattrs.

>   If you're going to have a root owned host-wide
> orchestration system setting up the rootfs, then you don't
> necessary need this at all.

I wasn't thinking it would be root owned, just that it would have a
predefined range of allowed uids and be able to map multiple containers
to subsets of these.

> As you say a @uid to say "any unprivileged userns" might be useful.
> The implication is that root on the host doesn't trust the image
> enough to write a real global file capability, but trusts it enough
> to 'endanger' all containers on the host.  If that's the case, I have
> no objection to adding this as a feature.

Yes, precisely.  The filesystem is certified as permitted to override
the xattr whatever unprivileged mapping for root is in place.

How would we effect the switch?  I suppose some global flag because I
can't see we'd be mixing use cases in a physical system.

James


--===============1981905787862903445==--

