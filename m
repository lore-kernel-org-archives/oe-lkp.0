Content-Type: multipart/mixed; boundary="===============2916041202046665418=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 15:19:46 -0400
Message-ID: <3368afe9-1e0c-6f6a-aba6-9ce26d2e45e4@linux.vnet.ibm.com>
In-Reply-To: <20170712175357.GA32609@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2916041202046665418==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/12/2017 01:53 PM, Vivek Goyal wrote:
> On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:
>
> [..]
>> @@ -301,14 +721,39 @@ ssize_t
>>   __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char =
*name,
>>   	       void *value, size_t size)
>>   {
>> -	const struct xattr_handler *handler;
>> +	const struct xattr_handler *handler =3D NULL;
>> +	char *newname =3D  NULL;
>> +	int ret, userns_supt_xattr;
>> +	struct user_namespace *userns =3D current_user_ns();
>> +
>> +	userns_supt_xattr =3D (xattr_is_userns_supported(name, false) >=3D 0);
>> +
> Hi Stephan,
>
>> +	do {
>> +		kfree(newname);
>> +
>> +		newname =3D xattr_userns_name(name, userns);
> 					    ^^^
> Will name be pointing to a freed string in second iteration of loop.

Fixing for v3.

>
>> +		if (IS_ERR(newname))
>> +			return PTR_ERR(newname);
>> +
>> +		if (!handler) {
>> +			name =3D newname;
> Here we assign name and at the beginning of second iteration we free
> newname.
>
> Also I am not sure why do we do this assignment only if handler is NULL.

The handler shouldn't change but this optimization isn't helpful. Fixed =

through this patch:

https://github.com/stefanberger/linux/commit/10828401b29a13f8c56f8fad0c0fb2=
690e4af878


>
> BTW, I set cap_sys_admin on a file outside usernamespace and then launched
> user namespace (mapping 1000 to 0). And then tried to do getcap on file
> and I am not seeing security.capability set by host. Not sure what am I
> doing wrong. getxattr() seems to return -ENODATA. Still debugging it.

This was a regression due to the bug in the loop. I didn't have a test =

case (with runc) for it, now I do.

>
> Also, have we resovled the question of stacked filesystem like overlayfs.
> There we are switching creds to mounter's creds when doing operations on
> underlying filesystem. I am concenrned does that mean, we will get and
> return security.capability to caller in usernamespace instead of
> security.capability(a)uid=3D1000.

I would have to test this, otherwise I don't know. I'll try it out with =

Docker.

    Stefan

>
> Vivek
>
>> +			handler =3D xattr_resolve_name(inode, &name);
>> +			if (IS_ERR(handler)) {
>> +				ret =3D PTR_ERR(handler);
>> +				goto out;
>> +			}
>> +			if (!handler->get) {
>> +				ret =3D -EOPNOTSUPP;
>> +				goto out;
>> +			}
>> +		}
>> +		ret =3D handler->get(handler, dentry, inode, name, value, size);
>> +		userns =3D userns->parent;
>> +	} while ((ret =3D=3D -ENODATA) && userns && userns_supt_xattr);
>>   =

>> -	handler =3D xattr_resolve_name(inode, &name);
>> -	if (IS_ERR(handler))
>> -		return PTR_ERR(handler);
>> -	if (!handler->get)
>> -		return -EOPNOTSUPP;
>> -	return handler->get(handler, dentry, inode, name, value, size);
>> +out:
>> +	kfree(newname);
>> +	return ret;
>>   }
>>   EXPORT_SYMBOL(__vfs_getxattr);
>>   =

> Thanks
> Vivek
>


--===============2916041202046665418==--

