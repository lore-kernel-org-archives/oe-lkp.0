Content-Type: multipart/mixed; boundary="===============5129842081440866776=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Tue, 09 May 2017 11:55:19 -0500
Message-ID: <87a86mvuko.fsf@xmission.com>
In-Reply-To: <20170508181156.GA23112@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5129842081440866776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Serge E. Hallyn" <serge@hallyn.com> writes:
> Changelog:
[snip]
>    May 8, 2017:
>       . fix leaking dentry refcount in cap_inode_getsecurity
>
[snip]
> +/*
> + * getsecurity: We are called for security.* before any attempt to read =
the
> + * xattr from the inode itself.
> + *
> + * This gives us a chance to read the on-disk value and convert it.  If =
we
> + * return -EOPNOTSUPP, then vfs_getxattr() will call the i_op handler.
> + *
> + * Note we are not called by vfs_getxattr_alloc(), but that is only call=
ed
> + * by the integrity subsystem, which really wants the unconverted values=
 -
> + * so that's good.
> + */
> +int cap_inode_getsecurity(struct inode *inode, const char *name, void **=
buffer,
> +			  bool alloc)
> +{
> +	int size, ret;
> +	kuid_t kroot;
> +	uid_t root, mappedroot;
> +	char *tmpbuf =3D NULL;
> +	struct vfs_cap_data *cap;
> +	struct vfs_ns_cap_data *nscap;
> +	struct dentry *dentry;
> +	struct user_namespace *fs_ns;
> +
> +	if (strcmp(name, "capability") !=3D 0)
> +		return -EOPNOTSUPP;
> +
> +	dentry =3D d_find_alias(inode);
> +	if (!dentry)
> +		return -EINVAL;
> +
> +	size =3D sizeof(struct vfs_ns_cap_data);
> +	ret =3D (int) vfs_getxattr_alloc(dentry, XATTR_NAME_CAPS,
> +				 &tmpbuf, size, GFP_NOFS);
> +	dput(dentry);

This looks like a good fix but ouch! That interface is wrong.

The dentry is needed because vfs_getxattr_alloc does:
	error =3D handler->get(handler, dentry, inode, name, NULL, 0);

Which is has no business taking a dentry as xattrs are inode concepts.

I have no issue with your patch but it looks like that handler issue
is going to need to be fixed with xattrs.

Eric

--===============5129842081440866776==--

