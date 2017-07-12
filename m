Content-Type: multipart/mixed; boundary="===============7188031180612052394=="
MIME-Version: 1.0
From: Vivek Goyal <vgoyal@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 13:53:57 -0400
Message-ID: <20170712175357.GA32609@redhat.com>
In-Reply-To: <1499785511-17192-2-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7188031180612052394==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:

[..]
> @@ -301,14 +721,39 @@ ssize_t
>  __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *n=
ame,
>  	       void *value, size_t size)
>  {
> -	const struct xattr_handler *handler;
> +	const struct xattr_handler *handler =3D NULL;
> +	char *newname =3D  NULL;
> +	int ret, userns_supt_xattr;
> +	struct user_namespace *userns =3D current_user_ns();
> +
> +	userns_supt_xattr =3D (xattr_is_userns_supported(name, false) >=3D 0);
> +

Hi Stephan,

> +	do {
> +		kfree(newname);
> +
> +		newname =3D xattr_userns_name(name, userns);
					    ^^^
Will name be pointing to a freed string in second iteration of loop. =


> +		if (IS_ERR(newname))
> +			return PTR_ERR(newname);
> +
> +		if (!handler) {
> +			name =3D newname;

Here we assign name and at the beginning of second iteration we free =

newname.

Also I am not sure why do we do this assignment only if handler is NULL.

BTW, I set cap_sys_admin on a file outside usernamespace and then launched
user namespace (mapping 1000 to 0). And then tried to do getcap on file
and I am not seeing security.capability set by host. Not sure what am I =

doing wrong. getxattr() seems to return -ENODATA. Still debugging it.

Also, have we resovled the question of stacked filesystem like overlayfs.
There we are switching creds to mounter's creds when doing operations on
underlying filesystem. I am concenrned does that mean, we will get and
return security.capability to caller in usernamespace instead of
security.capability(a)uid=3D1000. =


Vivek

> +			handler =3D xattr_resolve_name(inode, &name);
> +			if (IS_ERR(handler)) {
> +				ret =3D PTR_ERR(handler);
> +				goto out;
> +			}
> +			if (!handler->get) {
> +				ret =3D -EOPNOTSUPP;
> +				goto out;
> +			}
> +		}
> +		ret =3D handler->get(handler, dentry, inode, name, value, size);
> +		userns =3D userns->parent;
> +	} while ((ret =3D=3D -ENODATA) && userns && userns_supt_xattr);
>  =

> -	handler =3D xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->get)
> -		return -EOPNOTSUPP;
> -	return handler->get(handler, dentry, inode, name, value, size);
> +out:
> +	kfree(newname);
> +	return ret;
>  }
>  EXPORT_SYMBOL(__vfs_getxattr);
>  =


Thanks
Vivek

--===============7188031180612052394==--

