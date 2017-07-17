Content-Type: multipart/mixed; boundary="===============2949057604547026751=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Mon, 17 Jul 2017 16:50:22 -0400
Message-ID: <7a39e8a6-a33b-f6a8-3fd5-6211c075ab91@linux.vnet.ibm.com>
In-Reply-To: <20170717185811.GC15794@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2949057604547026751==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/17/2017 02:58 PM, Vivek Goyal wrote:
> On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:
>
> [..]
>> +/*
>> + * xattr_list_userns_rewrite - Rewrite list of xattr names for user nam=
espaces
>> + *                             or determine needed size for attribute l=
ist
>> + *                             in case size =3D=3D 0
>> + *
>> + * In a user namespace we do not present all extended attributes to the
>> + * user. We filter out those that are in the list of userns supported x=
attr.
>> + * Besides that we filter out those with @uid=3D<uid> when there is no =
mapping
>> + * for that uid in the current user namespace.
>> + *
>> + * @list:        list of 0-byte separated xattr names
>> + * @size:        the size of the list; may be 0 to determine needed lis=
t size
>> + * @list_maxlen: allocated buffer size of list
>> + */
>> +static ssize_t
>> +xattr_list_userns_rewrite(char *list, ssize_t size, size_t list_maxlen)
>> +{
>> +	char *nlist =3D NULL;
>> +	size_t s_off, len, nlen;
>> +	ssize_t d_off;
>> +	char *name, *newname;
>> +
>> +	if (!list || size < 0 || current_user_ns() =3D=3D &init_user_ns)
> size will never be less than 0 here. Only caller calls this function only
> if size is >0. So can we remove this?

Correct.

>
> What about case of "!list". So if user space called listxattr(foo, NULL,
> 0), we want to return the size of buffer as if all the xattrs will be
> returned to user space. But in practice we probably will filter out some
> xattrs so actually returned string will be smaller than size reported
> previously.

This case of size=3D0 is a problem in userns. Depending on the mapping of =

the userid's the list can expand. A security.foo(a)uid=3D100 can become =

security.foo(a)uid=3D100000, if the mapping is set up so that uid 100 on th=
e =

host becomes uid 100000 inside the container. So for now we only have =

security.capability and the way I solved this is by allocating a 65k =

buffer when calling from a userns. In this buffer where we gather the =

xattr names and then walk them to determine the size that's needed for =

the buffer by simulating the rewriting. It's not nice but I don't know =

of any other solution.


>
> Looks like that's the intent of "!list" condition here. Just wanted to
> make sure, hence asking.

Thanks for asking. I thought I had this case covered, but obviously I =

did not.

>
> BTW, I am testing this with overlayfs and trying to figure out if
> switching of creds will create issues. Simple operations like listxattr
> and getxattr and setxattr so far worked for me. And reason seems to be
> that name transformation we are doing in top layer based on creds of
> caller (and not based on creds of mounter).
>
> Vivek
>

    Stefan


--===============2949057604547026751==--

