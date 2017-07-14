Content-Type: multipart/mixed; boundary="===============4933491019028647262=="
MIME-Version: 1.0
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 16:03:39 -0400
Message-ID: <1500062619.3583.71.camel@linux.vnet.ibm.com>
In-Reply-To: <1500058362.2853.28.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4933491019028647262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-07-14 at 11:52 -0700, James Bottomley wrote:
> On Fri, 2017-07-14 at 14:48 -0400, Mimi Zohar wrote:
> > The concern is with a shared filesystems. =C2=A0In that case, for IMA it
> > would make sense to support a native and a namespace xattr. =C2=A0If due
> > to xattr space limitations we have to limit the number of xattrs,
> > then we should limit it to two - a native and a namespace version,
> > with a "uid=3D" tag - first namespace gets permission to write the
> > namespace xattr. =C2=A0Again, like in the layered case, if the namespace
> > xattr doesn't exist, fall back to using the native xattr.
> =

> Just on this point: if we're really concerned about the need on shared
> filesystems to have multiple IMA signatures per file, might it not make
> sense simply to support multiple signatures within the security.ima
> xattr? The rules for writing signature updates within user namespaces
> would be somewhat complex (say only able to replace a signature for
> which you demonstrate you possess the key) but it would lead to an
> implementation which would work for traditional shared filesystems
> (like NFS) as well as containerised bind mounts.

Writing security.ima requires being root with CAP_SYS_ADMIN
privileges. =C2=A0I wouldn't want to give root within the namespace
permission to over write or just extend the native security.ima.

Mimi


--===============4933491019028647262==--

