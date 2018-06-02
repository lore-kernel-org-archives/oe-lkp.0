Content-Type: multipart/mixed; boundary="===============1929473624237167389=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: 8d35f08793 ("vfs: Allow cloning of a mount tree with .."): kernel BUG at include/linux/fs.h:2806!
Date: Sat, 02 Jun 2018 21:25:13 +0100
Message-ID: <28332.1527971113@warthog.procyon.org.uk>
In-Reply-To: <20180602175501.GY30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1929473624237167389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Al Viro <viro@ZenIV.linux.org.uk> wrote:

> IMA shite triggered on close, which would imply FMODE_READ in
> file->f_mode...  Aha.  It's
> =

> -               f->f_mode =3D FMODE_PATH;
> +               f->f_mode |=3D FMODE_PATH;
> =

> in do_dentry_open() in that commit.  Braino, AFAICS...

Not so much that - more that I missed a bit when removing some of the stuff
you wanted changing.

David

--===============1929473624237167389==--

