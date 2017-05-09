Content-Type: multipart/mixed; boundary="===============7294464547543548389=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Tue, 09 May 2017 17:27:03 -0500
Message-ID: <87mvalu0nc.fsf@xmission.com>
In-Reply-To: <20170509203736.GB14900@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7294464547543548389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Serge E. Hallyn" <serge@hallyn.com> writes:

> Quoting Eric W. Biederman (ebiederm(a)xmission.com):
>> "Serge E. Hallyn" <serge@hallyn.com> writes:
>> > Changelog:
>> [snip]
>> >    May 8, 2017:
>> >       . fix leaking dentry refcount in cap_inode_getsecurity
>> >
>> [snip]
>> > +/*
>> > + * getsecurity: We are called for security.* before any attempt to re=
ad the
>> > + * xattr from the inode itself.
>> > + *
>> > + * This gives us a chance to read the on-disk value and convert it.  =
If we
>> > + * return -EOPNOTSUPP, then vfs_getxattr() will call the i_op handler.
>> > + *
>> > + * Note we are not called by vfs_getxattr_alloc(), but that is only c=
alled
>> > + * by the integrity subsystem, which really wants the unconverted val=
ues -
>> > + * so that's good.
>> > + */
>> > +int cap_inode_getsecurity(struct inode *inode, const char *name, void=
 **buffer,
>> > +			  bool alloc)
>> > +{
>> > +	int size, ret;
>> > +	kuid_t kroot;
>> > +	uid_t root, mappedroot;
>> > +	char *tmpbuf =3D NULL;
>> > +	struct vfs_cap_data *cap;
>> > +	struct vfs_ns_cap_data *nscap;
>> > +	struct dentry *dentry;
>> > +	struct user_namespace *fs_ns;
>> > +
>> > +	if (strcmp(name, "capability") !=3D 0)
>> > +		return -EOPNOTSUPP;
>> > +
>> > +	dentry =3D d_find_alias(inode);
>> > +	if (!dentry)
>> > +		return -EINVAL;
>> > +
>> > +	size =3D sizeof(struct vfs_ns_cap_data);
>> > +	ret =3D (int) vfs_getxattr_alloc(dentry, XATTR_NAME_CAPS,
>> > +				 &tmpbuf, size, GFP_NOFS);
>> > +	dput(dentry);
>> =

>> This looks like a good fix but ouch! That interface is wrong.
>> =

>> The dentry is needed because vfs_getxattr_alloc does:
>> 	error =3D handler->get(handler, dentry, inode, name, NULL, 0);
>> =

>> Which is has no business taking a dentry as xattrs are inode concepts.
>> =

>> I have no issue with your patch but it looks like that handler issue
>> is going to need to be fixed with xattrs.
>
> True, it's a bit clunky.
>
> Any reason not to just have the current vfs_getxattr_alloc() become a
> lightweight wrapper calling inode_getxattr_alloc(dentry->d_inode)?

My deep issue is that handler is functions like posix_acl_xattr_get.
And all of those functions that vfs_getxattr_alloc calls should not
take a dentry.

So I feel like I have just spotted the tip of an iceberg that needs
sorting out.

Eric


--===============7294464547543548389==--

