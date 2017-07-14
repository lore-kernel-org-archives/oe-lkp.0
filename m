Content-Type: multipart/mixed; boundary="===============4037782244485735649=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 15:29:09 -0400
Message-ID: <20170714192909.zoxnlm32nrxguqao@thunk.org>
In-Reply-To: <1500058090.3583.28.camel@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4037782244485735649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 02:48:10PM -0400, Mimi Zohar wrote:
> =

> If I'm understanding the discussion correctly, this isn't an issue for
> layered copy on write filesystems, as each fs layer could have it's
> own set of xattrs. =C2=A0The underlying and layered xattrs should be able
> to co-exist. =C2=A0Use the layered xattr if it exists, but fall back to
> using the underlying xattr if it doesn't.

Note that this assumes that it is possible to "copy up" the xattrs
without necessarily "copying up" all of the data blocks.  This might
be true for some layers, but I don't believe it is currently true for
overlayfs, for example.

					- Ted

--===============4037782244485735649==--

