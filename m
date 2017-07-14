Content-Type: multipart/mixed; boundary="===============7671678331897773428=="
MIME-Version: 1.0
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 11:52:42 -0700
Message-ID: <1500058362.2853.28.camel@HansenPartnership.com>
In-Reply-To: <1500058090.3583.28.camel@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7671678331897773428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-07-14 at 14:48 -0400, Mimi Zohar wrote:
> The concern is with a shared filesystems. =C2=A0In that case, for IMA it
> would make sense to support a native and a namespace xattr. =C2=A0If due
> to xattr space limitations we have to limit the number of xattrs,
> then we should limit it to two - a native and a namespace version,
> with a "uid=3D" tag - first namespace gets permission to write the
> namespace xattr. =C2=A0Again, like in the layered case, if the namespace
> xattr doesn't exist, fall back to using the native xattr.

Just on this point: if we're really concerned about the need on shared
filesystems to have multiple IMA signatures per file, might it not make
sense simply to support multiple signatures within the security.ima
xattr? The rules for writing signature updates within user namespaces
would be somewhat complex (say only able to replace a signature for
which you demonstrate you possess the key) but it would lead to an
implementation which would work for traditional shared filesystems
(like NFS) as well as containerised bind mounts.

James


--===============7671678331897773428==--

