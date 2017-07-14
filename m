Content-Type: multipart/mixed; boundary="===============8736630533751315969=="
MIME-Version: 1.0
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 19:29:44 -0400
Message-ID: <1500074984.3583.98.camel@linux.vnet.ibm.com>
In-Reply-To: <1500064799.2853.36.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8736630533751315969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-07-14 at 13:39 -0700, James Bottomley wrote:
> On Fri, 2017-07-14 at 16:03 -0400, Mimi Zohar wrote:
> > On Fri, 2017-07-14 at 11:52 -0700, James Bottomley wrote:
> > > =

> > > On Fri, 2017-07-14 at 14:48 -0400, Mimi Zohar wrote:
> > > > =

> > > > The concern is with a shared filesystems. =C2=A0In that case, for I=
MA
> > > > it would make sense to support a native and a namespace xattr.
> > > > =C2=A0If due to xattr space limitations we have to limit the number=
 of
> > > > xattrs, then we should limit it to two - a native and a namespace
> > > > version, with a "uid=3D" tag - first namespace gets permission to
> > > > write the namespace xattr. =C2=A0Again, like in the layered case, if
> > > > the namespace xattr doesn't exist, fall back to using the native
> > > > xattr.
> > > =

> > > Just on this point: if we're really concerned about the need on
> > > shared filesystems to have multiple IMA signatures per file, might
> > > it not make sense simply to support multiple signatures within the
> > > security.ima xattr? The rules for writing signature updates within
> > > user namespaces would be somewhat complex (say only able to replace
> > > a signature for which you demonstrate you possess the key) but it
> > > would lead to an implementation which would work for traditional
> > > shared filesystems (like NFS) as well as containerised bind mounts.
> > =

> > Writing security.ima requires being root with CAP_SYS_ADMIN
> > privileges. =C2=A0I wouldn't want to give root within the namespace
> > permission to over write or just extend the native security.ima.
> =

> but why? =C2=A0That's partly the point of all of this: some security.
> attributes can't be written by container root without some supervision
> (the capability ones are the hugely problematic ones from this point of
> view), but for some there's no reason they shouldn't be. =C2=A0What would=
 be
> the reason that root in a container shouldn't be able to write the ima
> xattr the same as host root could on its filesystem?

Let's describe the different scenarios of a shared filesystem (not
layered).
1. The kernel updating the file hash as the file changes, written as
the security.ima xattr.
2. Root vs root in the namespace explicitly writing the security.ima
xattr.=C2=A0
=C2=A0
In the first case, neither root nor root in the namespace calculates
and writes the file hash as security.ima. =C2=A0The kernel itself updates
the file hash. =C2=A0Since the file hash is the same value, it doesn't need
to be written out as two separate security.ima xattrs.

The second case is where root or root in the namespace explicitly
writes out a file signature as security.ima. =C2=A0Here different entities
might want to sign the file with different keys. =C2=A0Up to now, only root
with CAP_SYS_ADMIN can write out security.ima. =C2=A0That shouldn't change.
Nor should root in the namespace be allowed to change the native's
view, but should be only allowed to change its own view of the xattr.
Allowing root in the namespace to change the native's view isn't safe.

Remember writing security.ima also triggers security.evm to be
updated. =C2=A0Root in the namespace should never be permitted to cause the
native's security.evm to be updated, only the namespaces's version.

Mimi


--===============8736630533751315969==--

