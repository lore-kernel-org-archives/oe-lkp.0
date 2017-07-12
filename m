Content-Type: multipart/mixed; boundary="===============3156842511288067813=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 07:35:49 -0400
Message-ID: <8c3e8c6f-52c5-5b04-8cad-1aeae25f0ec6@linux.vnet.ibm.com>
In-Reply-To: <20170712034503.GA8270@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3156842511288067813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/11/2017 11:45 PM, Serge E. Hallyn wrote:
> Quoting Stefan Berger (Stefan Bergerstefanb(a)linux.vnet.ibm.com):
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
>> +		return size;
>> +
>> +	if (size) {
>> +		nlist =3D kmalloc(list_maxlen, GFP_KERNEL);
>> +		if (!nlist)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	s_off =3D d_off =3D 0;
>> +	while (s_off < size || size =3D=3D 0) {
>> +		name =3D &list[s_off];
>> +
>> +		len =3D strlen(name);
>> +		if (!len)
>> +			break;
>> +
>> +		if (xattr_is_userns_supported(name, false) >=3D 0)
>> +			newname =3D name;
>> +		else {
>> +			newname =3D xattr_rewrite_userns_xattr(name);
> Why are you doing this here?  If we get here it means that
> xattr_is_userns_supported() returned < 0, meaning name is
> not userns-supported.  So xattr_rewrite_userns_xattr() will
> just return name.  Am I missing something?

xattr_is_userns_support(name, false) does a _full string match_ rather =

than a prefix match and will only return >=3D 0 for security.capability. =

This case handles the hosts's security.capability which  'shines =

through' for read and needs to be listed. Only in this case we set =

newname=3Dname.

In the else branch we handle security.capability(a)uid=3D1000 and rewrite =

that to security.capability for root mapping to uid=3D1000.

>
>> +			if (IS_ERR(newname)) {
>> +				d_off =3D PTR_ERR(newname);
>> +				goto out_free;
>> +			}
>> +		}
>> +		if (newname && !xattr_list_contains(nlist, d_off, newname)) {
> Now here, if name was recalculated to @newname, and @newname is
> found in the nlist, that should raise an error right?  Something
> fishy is going on?

If security.capability is set on a file but the container doesn't have =

security.capability(a)uid=3D1000, we still need to list the former here. =

However, we end up with duplicates if security.capability is there and =

security.capability(a)uid=3D1000 is also there and root is mapped to =

uid=3D1000. Both would be shown as security.capability inside the =

container. In this case we need to filter.

I think the code is correct. More problematic is a memory leak in the =

error case. Will fix that.

>
>> +			nlen =3D strlen(newname);
>> +
>> +			if (nlist) {
>> +				if (nlen + 1 > list_maxlen)
> d_off needs to be set to -ERANGE here.

Fixed.

>
>> +					break;
>> +				strcpy(&nlist[d_off], newname);
>> +			}
>> +
>> +			d_off +=3D nlen + 1;
>> +			if (newname !=3D name)
>> +				kfree(newname);
>> +		}
>> +		s_off +=3D len + 1;
>> +	}
>> +	if (nlist)
>> +		memcpy(list, nlist, d_off);
>> +out_free:
>> +	kfree(nlist);
>> +
>> +	return d_off;
>> +}



--===============3156842511288067813==--

