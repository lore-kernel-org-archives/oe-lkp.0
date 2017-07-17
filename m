Content-Type: multipart/mixed; boundary="===============6568785546537166732=="
MIME-Version: 1.0
From: Vivek Goyal <vgoyal@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Mon, 17 Jul 2017 14:58:11 -0400
Message-ID: <20170717185811.GC15794@redhat.com>
In-Reply-To: <1499785511-17192-2-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6568785546537166732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:

[..]
> +/*
> + * xattr_list_userns_rewrite - Rewrite list of xattr names for user name=
spaces
> + *                             or determine needed size for attribute li=
st
> + *                             in case size =3D=3D 0
> + *
> + * In a user namespace we do not present all extended attributes to the
> + * user. We filter out those that are in the list of userns supported xa=
ttr.
> + * Besides that we filter out those with @uid=3D<uid> when there is no m=
apping
> + * for that uid in the current user namespace.
> + *
> + * @list:        list of 0-byte separated xattr names
> + * @size:        the size of the list; may be 0 to determine needed list=
 size
> + * @list_maxlen: allocated buffer size of list
> + */
> +static ssize_t
> +xattr_list_userns_rewrite(char *list, ssize_t size, size_t list_maxlen)
> +{
> +	char *nlist =3D NULL;
> +	size_t s_off, len, nlen;
> +	ssize_t d_off;
> +	char *name, *newname;
> +
> +	if (!list || size < 0 || current_user_ns() =3D=3D &init_user_ns)

size will never be less than 0 here. Only caller calls this function only
if size is >0. So can we remove this?

What about case of "!list". So if user space called listxattr(foo, NULL,
0), we want to return the size of buffer as if all the xattrs will be
returned to user space. But in practice we probably will filter out some
xattrs so actually returned string will be smaller than size reported
previously.

Looks like that's the intent of "!list" condition here. Just wanted to
make sure, hence asking.

BTW, I am testing this with overlayfs and trying to figure out if
switching of creds will create issues. Simple operations like listxattr
and getxattr and setxattr so far worked for me. And reason seems to be
that name transformation we are doing in top layer based on creds of
caller (and not based on creds of mounter). =


Vivek

--===============6568785546537166732==--

