Content-Type: multipart/mixed; boundary="===============3387449669300812548=="
MIME-Version: 1.0
From: Mimi Zohar <zohar@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 15:43:46 -0400
Message-ID: <1500061426.3583.65.camel@linux.vnet.ibm.com>
In-Reply-To: <20170714192909.zoxnlm32nrxguqao@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3387449669300812548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-07-14 at 15:29 -0400, Theodore Ts'o wrote:
> On Fri, Jul 14, 2017 at 02:48:10PM -0400, Mimi Zohar wrote:
> > =

> > If I'm understanding the discussion correctly, this isn't an issue for
> > layered copy on write filesystems, as each fs layer could have it's
> > own set of xattrs. =C2=A0The underlying and layered xattrs should be ab=
le
> > to co-exist. =C2=A0Use the layered xattr if it exists, but fall back to
> > using the underlying xattr if it doesn't.
> =

> Note that this assumes that it is possible to "copy up" the xattrs
> without necessarily "copying up" all of the data blocks.  This might
> be true for some layers, but I don't believe it is currently true for
> overlayfs, for example.

Ok, so for the use case scneario where the container owner is willing
to use the public key distributed with the files, then only those
files that are new or modified in the overlay would need to be signed
with a key local to the overlay. =C2=A0In the worst case scenario, where
the container owner is only willing to trust their own public key, I
guess we can live with having to copy up the files.

Mimi


--===============3387449669300812548==--

