Content-Type: multipart/mixed; boundary="===============1226077856221582753=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Wed, 12 Jul 2017 08:25:29 -0500
Message-ID: <87mv89iy7q.fsf@xmission.com>
In-Reply-To: <1499785511-17192-2-git-send-email-stefanb@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1226077856221582753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stefan Berger <"Stefan Bergerstefanb"@linux.vnet.ibm.com> writes:

> From: Stefan Berger <stefanb@linux.vnet.ibm.com>
>
> This patch enables security.capability in user namespaces but also
> takes a more general approach to enabling extended attributes in user
> namespaces.
>
> The following rules describe the approach using security.foo as a
> 'user namespace enabled' extended attribute:
>
> Reading of extended attributes:
>
> 1a) Reading security.foo from a user namespace will read
>     security.foo(a)uid=3D<uid> of the parent user namespace instead with =
uid
>     being the mapping of root in that parent user namespace. An
>     exception is if root is mapped to uid 0 on the host, and in this case
>     we will read security.foo directly.
>     --> reading security.foo will read security.foo(a)uid=3D1000 for uid
>         mapping of root to 1000.
>
> 1b) If security.foo(a)uid=3D<uid> is not available, the security.foo of t=
he
>     parent namespace is tried to be read. This procedure is repeated up to
>     the init user namespace. This step only applies for reading of extend=
ed
>     attributes and provides the same behavior as older system where the
>     host's extended attributes applied to user namespaces.
>
> 2) All security.foo(a)uid=3D<uid> with valid uid mapping in the user name=
space
>    can be read. The uid within the user namespace will be mapped to the
>    corresponding uid on the host and that uid will be used in the name of
>    the extended attribute.
>    -> reading security.foo(a)uid=3D1 will read security.foo(a)uid=3D1001 =
for uid
>       mapping of root to 1000, size of at least 2.
>
>    All security.foo(a)uid=3D<uid> can be read (by root) on the host with =
values
>    of <uid> also being subject to checking for valid mappings.
>
> 3) No other security.foo* can be read.
>
> The same rules for reading apply to writing and removing of user
> namespace enabled extended attributes.
>
> When listing extended attributes of a file, only those are presented
> to the user namespace that have a valid mapping. Besides that, names
> of the extended attributes are adjusted to represent the mapping.
> This means that if root is mapped to uid 1000 on the host, the
> security.foo(a)uid=3D1000 will be listed as security.foo in the user
> namespace, security.foo(a)uid=3D1001 becomes security.foo(a)uid=3D1 and s=
o on.
>
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Serge Hallyn <serge@hallyn.com>
> Reviewed-by: Serge Hallyn <serge@hallyn.com>

It doesn't look like this is coming through Serge so I don't see how
the Signed-off-by tag is legtimate.

>From the replies to this it doesn't look like Serge has reviewed this
version either.

I am disappointed that all of my concerns about technical feasibility
remain unaddressed.

I hope my reading and review of the code goes better than my reading of
it's introduction.

Eric


> ---
>  fs/xattr.c               | 509 +++++++++++++++++++++++++++++++++++++++++=
++++--
>  security/commoncap.c     |  36 +++-
>  security/selinux/hooks.c |   9 +-
>  3 files changed, 523 insertions(+), 31 deletions(-)
>
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 464c94b..eacad9e 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
> @@ -133,20 +133,440 @@ xattr_permission(struct inode *inode, const char *=
name, int mask)
>  	return inode_permission(inode, mask);
>  }
>  =

> +/*
> + * A list of extended attributes that are supported in user namespaces
> + */
> +static const char *const userns_xattrs[] =3D {
> +	XATTR_NAME_CAPS,
> +	NULL
> +};
> +
> +/*
> + * xattrs_is_userns_supported - Check whether an xattr is supported in u=
serns
> + *
> + * @name:   full name of the extended attribute
> + * @prefix: do a prefix match (true) or a full match (false)
> + *
> + * This function returns < 0 if not supported, an index into userns_xatt=
rs[]
> + * otherwise.
> + */
> +static int
> +xattr_is_userns_supported(const char *name, int prefix)
> +{
> +	int i;
> +
> +	if (!name)
> +		return -1;
> +
> +	for (i =3D 0; userns_xattrs[i]; i++) {
> +		if (prefix) {
> +			if (!strncmp(userns_xattrs[i], name,
> +				     strlen(userns_xattrs[i])))
> +				return i;
> +		} else {
> +			if (!strcmp(userns_xattrs[i], name))
> +				return i;
> +		}
> +	}
> +	return -1;
> +}
> +
> +/*
> + * xattr_write_uid - print a string in the format of "%s(a)uid=3D%u", wh=
ich
> + *                   includes a prefix string
> + *
> + * @uid:     the uid
> + * @prefix:  prefix string; may be NULL
> + *
> + * This function returns a buffer with the string, or a NULL pointer in
> + * case of out-of-memory error.
> + */
> +static char *
> +xattr_write_uid(uid_t uid, const char *prefix)
> +{
> +	size_t buflen;
> +	char *buffer;
> +
> +	buflen =3D sizeof("@uid=3D") - 1 + sizeof("4294967295") - 1 + 1;
> +	if (prefix)
> +		buflen +=3D strlen(prefix);
> +
> +	buffer =3D kmalloc(buflen, GFP_KERNEL);
> +	if (!buffer)
> +		return NULL;
> +
> +	if (uid =3D=3D 0)
> +		*buffer =3D 0;
> +	else
> +		sprintf(buffer, "%s(a)uid=3D%u",
> +			(prefix) ? prefix : "",
> +			uid);
> +
> +	return buffer;
> +}
> +
> +/*
> + * xattr_parse_uid_from_kuid - parse string in the format @uid=3D<uid>; =
consider
> + *                             user namespaces and check mappings
> + *
> + * @uidstr   : string in the format "@uid=3D<uid>"
> + * @userns   : the user namespace to consult for uid mappings
> + * @n_uidstr : returned pointer holding the rewritten @uid=3D<uid> strin=
g with
> + *             the uid remapped
> + *
> + * This function returns an error code or 0 in case of success. In case
> + * of success, 'n_uidstr' will hold a valid string.
> + */
> +static int
> +xattr_parse_uid_from_kuid(const char *uidstr, struct user_namespace *use=
rns,
> +			  char **n_uidstr)
> +{
> +	int n;
> +	uid_t muid, p_uid;
> +	char d;
> +	kuid_t tuid;
> +
> +	*n_uidstr =3D NULL;
> +
> +	n =3D sscanf(uidstr, "@uid=3D%u%c", &p_uid, &d);
> +	if (n !=3D 1)
> +		return -EINVAL;
> +
> +	/* do we have a mapping of the uid? */
> +	tuid =3D KUIDT_INIT(p_uid);
> +	muid =3D from_kuid(userns, tuid);
> +	if (muid =3D=3D -1)
> +		return -ENOENT;
> +
> +	*n_uidstr =3D xattr_write_uid(muid, NULL);
> +	if (!*n_uidstr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/*
> + * xattr_parse_uid_make_kuid - parse string in the format @uid=3D<uid>; =
consider
> + *                             user namespaces and check mappings
> + *
> + * @uidstr   : string in the format "@uid=3D<uid>"
> + * @userns   : the user namespace to consult for uid mappings
> + * @N_uidstr : returned pointer holding the rewritten @uid=3D<uid> strin=
g with
> + *             the uid remapped
> + *
> + * This function returns an error code or 0 in case of success. In case
> + * of success, 'n_uidstr' will hold a valid string.
> + */
> +static int
> +xattr_parse_uid_make_kuid(const char *uidstr, struct user_namespace *use=
rns,
> +			  char **n_uidstr)
> +{
> +	int n;
> +	uid_t p_uid;
> +	char d;
> +	kuid_t tuid;
> +
> +	*n_uidstr =3D NULL;
> +
> +	n =3D sscanf(uidstr, "@uid=3D%u%c", &p_uid, &d);
> +	if (n !=3D 1)
> +		return -EINVAL;
> +
> +	tuid =3D make_kuid(userns, p_uid);
> +	if (!uid_valid(tuid))
> +		return -ENOENT;
> +
> +	*n_uidstr =3D xattr_write_uid(__kuid_val(tuid), NULL);
> +	if (!*n_uidstr)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +/*
> + * xattr_rewrite_userns_xattr - Rewrite and filter an extended attribute
> + *                              considering user namespace uid mappings =
and
> + *                              user namespace support extended attribut=
es
> + *
> + * @name: full name of the extended attribute
> + *
> + * This function returns NULL if the name is to be filtered. Otherwise i=
t can
> + * return the input buffer or a new buffer that the caller needs to free=
. The
> + * new buffer contains a rewritten extended attribute whose string lengt=
h may
> + * exceed that of the given name.
> + */
> +static char *
> +xattr_rewrite_userns_xattr(char *name)
> +{
> +	int idx, error;
> +	size_t len =3D 0, buflen;
> +	char *buffer, *n_uidstr;
> +
> +	/* prefix-match name against supported attributes */
> +	idx =3D xattr_is_userns_supported(name, true);
> +	if (idx < 0) {
> +		/* only rewrite those in userns_xattr[*] */
> +		return name;
> +	}
> +
> +	/* exact match ? */
> +	len =3D strlen(userns_xattrs[idx]);
> +	if (name[len] =3D=3D 0)
> +		return NULL;
> +
> +	/*
> +	 * We must have a name[len] =3D=3D '@'.
> +	 */
> +	error =3D xattr_parse_uid_from_kuid(&name[len], current_user_ns(),
> +					  &n_uidstr);
> +	if (error)
> +		return NULL;
> +
> +	buflen =3D len + strlen(n_uidstr) + 1;
> +	buffer =3D kmalloc(buflen, GFP_KERNEL);
> +	if (!buffer) {
> +		kfree(n_uidstr);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	name[len] =3D 0;
> +
> +	snprintf(buffer, buflen, "%s%s", name, n_uidstr);
> +
> +	name[len] =3D '@';
> +
> +	kfree(n_uidstr);
> +
> +	return buffer;
> +}
> +
> +/*
> + * xattr_list_contains - check whether an xattr list already contains a =
needle
> + *
> + * @list    : 0-byte separated strings
> + * @listlen : length of the list
> + * @needle  : the needle to search for
> + */
> +static int
> +xattr_list_contains(const char *list, size_t listlen, const char *needle)
> +{
> +	size_t o =3D 0;
> +
> +	while (o < listlen) {
> +		if (!strcmp(&list[o], needle))
> +			return true;
> +		o +=3D strlen(&list[o]) + 1;
> +	}
> +	return false;
> +}
> +
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
> +		return size;
> +
> +	if (size) {
> +		nlist =3D kmalloc(list_maxlen, GFP_KERNEL);
> +		if (!nlist)
> +			return -ENOMEM;
> +	}
> +
> +	s_off =3D d_off =3D 0;
> +	while (s_off < size || size =3D=3D 0) {
> +		name =3D &list[s_off];
> +
> +		len =3D strlen(name);
> +		if (!len)
> +			break;
> +
> +		if (xattr_is_userns_supported(name, false) >=3D 0)
> +			newname =3D name;
> +		else {
> +			newname =3D xattr_rewrite_userns_xattr(name);
> +			if (IS_ERR(newname)) {
> +				d_off =3D PTR_ERR(newname);
> +				goto out_free;
> +			}
> +		}
> +		if (newname && !xattr_list_contains(nlist, d_off, newname)) {
> +			nlen =3D strlen(newname);
> +
> +			if (nlist) {
> +				if (nlen + 1 > list_maxlen)
> +					break;
> +				strcpy(&nlist[d_off], newname);
> +			}
> +
> +			d_off +=3D nlen + 1;
> +			if (newname !=3D name)
> +				kfree(newname);
> +		}
> +		s_off +=3D len + 1;
> +	}
> +	if (nlist)
> +		memcpy(list, nlist, d_off);
> +out_free:
> +	kfree(nlist);
> +
> +	return d_off;
> +}
> +
> +/*
> + * xattr_userns_name - modify the name of a user namespace supported
> + *                     extended attribute
> + *
> + * In a user namespace we prevent read/write accesses to the host's
> + * security.foo to protect these extended attributes.
> + *
> + * Reading:
> + * 1a) Reading security.foo from a user namespace will read
> + *     security.foo(a)uid=3D<uid> of the parent user namespace instead w=
ith uid
> + *     being the mapping of root in that parent user namespace. An
> + *     exception is if root is mapped to uid 0 on the host, and in this =
case
> + *     we will read security.foo directly.
> + *     -> reading security.foo will read security.foo(a)uid=3D1000 for a=
 uid
> + *        mapping of root to 1000.
> + *
> + * 1b) If security.foo(a)uid=3D<uid> is not available, the security.foo =
of the
> + *     parent namespace is tried to be read. This procedure is repeated =
up to
> + *     the init user namespace. This step only applies for reading of ex=
tended
> + *     attributes and provides the same behavior as older systems where =
the
> + *     host's extended attributes applied to user namespaces.
> + *
> + * 2) All security.foo(a)uid=3D<uid> with valid uid mappings in the user=
 namespace
> + *    an be read. The uid within the user namespace will be mapped to the
> + *    corresponding uid on the host and that uid will be used in the nam=
e of
> + *    the extended attribute.
> + *    -> reading security.foo(a)uid=3D1 will read security.foo(a)uid=3D1=
001 for a uid
> + *       mapping of root to 1000, size of at least 2.
> + *
> + *    All security.foo(a)uid=3D<uid> can be read (by root) on the host w=
ith values
> + *    of <uid> also being subject to checking for valid mappings.
> + *
> + * 3) No other security.foo* can be read.
> + *
> + * Writing and removing:
> + * The same rules for reading apply to writing and removing, except for =
1b).
> + *
> + * This function returns a buffer with either the original name or the
> + * user namespace adjusted name of the extended attribute.
> + *
> + * @name:     the full name of the extended attribute, e.g. security.foo
> + */
> +char *
> +xattr_userns_name(const char *name, struct user_namespace *userns)
> +{
> +	size_t buflen;
> +	char *buffer, *n_uidstr;
> +	kuid_t root_uid =3D make_kuid(userns, 0);
> +	int idx, error;
> +	size_t len;
> +
> +	/* only security.foo will be changed here - prefix match here */
> +	idx =3D xattr_is_userns_supported(name, true);
> +	if (idx < 0)
> +		goto out_copy;
> +
> +	/* read security.foo? --> read security.foo(a)uid=3D<uid> instead */
> +	len =3D strlen(userns_xattrs[idx]);
> +	if (name[len] =3D=3D 0) {
> +		/*
> +		 * init_user_ns or userns with root mapped to uid 0
> +		 * may read security.foo directly
> +		 */
> +		if (userns =3D=3D &init_user_ns ||
> +		    __kuid_val(root_uid) =3D=3D 0)
> +			goto out_copy;
> +
> +		if (!uid_valid(root_uid))
> +			return ERR_PTR(-EINVAL);
> +
> +		buffer =3D xattr_write_uid(__kuid_val(root_uid), name);
> +		if (!buffer)
> +			return ERR_PTR(-ENOMEM);
> +
> +		return buffer;
> +	}
> +
> +	/*
> +	 * We must have name[len] =3D=3D '@'.
> +	 */
> +	error =3D xattr_parse_uid_make_kuid(&name[len],
> +					  userns,
> +					  &n_uidstr);
> +	if (error)
> +		return ERR_PTR(error);
> +
> +	/* name[len] =3D=3D '@' */
> +	buflen =3D len + strlen(n_uidstr) + 1;
> +	buffer =3D kmalloc(buflen, GFP_KERNEL);
> +	if (!buffer) {
> +		kfree(n_uidstr);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	snprintf(buffer, len + 1, "%s", name);
> +	snprintf(&buffer[len], buflen - len, "%s", n_uidstr);
> +	kfree(n_uidstr);
> +
> +	return buffer;
> +
> +out_copy:
> +	buffer =3D kstrdup(name, GFP_KERNEL);
> +	if (!buffer)
> +		return ERR_PTR(-ENOMEM);
> +
> +	return buffer;
> +}
> +
>  int
>  __vfs_setxattr(struct dentry *dentry, struct inode *inode, const char *n=
ame,
>  	       const void *value, size_t size, int flags)
>  {
>  	const struct xattr_handler *handler;
> +	char *newname;
> +	int ret;
>  =

> +	newname =3D xattr_userns_name(name, current_user_ns());
> +	if (IS_ERR(newname))
> +		return PTR_ERR(newname);
> +	name =3D newname;
>  	handler =3D xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->set)
> -		return -EOPNOTSUPP;
> +	if (IS_ERR(handler)) {
> +		ret =3D PTR_ERR(handler);
> +		goto out;
> +	}
> +	if (!handler->set) {
> +		ret =3D -EOPNOTSUPP;
> +		goto out;
> +	}
>  	if (size =3D=3D 0)
>  		value =3D "";  /* empty EA, do not remove */
> -	return handler->set(handler, dentry, inode, name, value, size, flags);
> +	ret =3D handler->set(handler, dentry, inode, name, value, size, flags);
> +
> +out:
> +	kfree(newname);
> +	return ret;
>  }
>  EXPORT_SYMBOL(__vfs_setxattr);
>  =

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
> +	do {
> +		kfree(newname);
> +
> +		newname =3D xattr_userns_name(name, userns);
> +		if (IS_ERR(newname))
> +			return PTR_ERR(newname);
> +
> +		if (!handler) {
> +			name =3D newname;
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

> @@ -328,8 +773,16 @@ vfs_getxattr(struct dentry *dentry, const char *name=
, void *value, size_t size)
>  =

>  	if (!strncmp(name, XATTR_SECURITY_PREFIX,
>  				XATTR_SECURITY_PREFIX_LEN)) {
> -		const char *suffix =3D name + XATTR_SECURITY_PREFIX_LEN;
> -		int ret =3D xattr_getsecurity(inode, suffix, value, size);
> +		int ret;
> +		const char *suffix;
> +		char *newname =3D xattr_userns_name(name, current_user_ns());
> +		if (IS_ERR(newname))
> +			return PTR_ERR(newname);
> +
> +		suffix =3D newname + XATTR_SECURITY_PREFIX_LEN;
> +
> +		ret =3D xattr_getsecurity(inode, suffix, value, size);
> +		kfree(newname);
>  		/*
>  		 * Only overwrite the return value if a security module
>  		 * is actually active.
> @@ -360,6 +813,9 @@ vfs_listxattr(struct dentry *dentry, char *list, size=
_t size)
>  		if (size && error > size)
>  			error =3D -ERANGE;
>  	}
> +	if (error > 0)
> +		error =3D xattr_list_userns_rewrite(list, error, size);
> +
>  	return error;
>  }
>  EXPORT_SYMBOL_GPL(vfs_listxattr);
> @@ -369,13 +825,28 @@ __vfs_removexattr(struct dentry *dentry, const char=
 *name)
>  {
>  	struct inode *inode =3D d_inode(dentry);
>  	const struct xattr_handler *handler;
> +	char *newname;
> +	int ret;
>  =

> +	newname =3D xattr_userns_name(name, current_user_ns());
> +	if (IS_ERR(newname))
> +		return PTR_ERR(newname);
> +	name =3D newname;
>  	handler =3D xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->set)
> -		return -EOPNOTSUPP;
> -	return handler->set(handler, dentry, inode, name, NULL, 0, XATTR_REPLAC=
E);
> +	if (IS_ERR(handler)) {
> +		ret =3D PTR_ERR(handler);
> +		goto out;
> +	}
> +	if (!handler->set) {
> +		ret =3D -EOPNOTSUPP;
> +		goto out;
> +	}
> +	ret =3D handler->set(handler, dentry, inode, name, NULL, 0, XATTR_REPLA=
CE);
> +
> +out:
> +	kfree(newname);
> +
> +	return ret;
>  }
>  EXPORT_SYMBOL(__vfs_removexattr);
>  =

> diff --git a/security/commoncap.c b/security/commoncap.c
> index 7abebd7..c842690 100644
> --- a/security/commoncap.c
> +++ b/security/commoncap.c
> @@ -660,15 +660,23 @@ int cap_bprm_secureexec(struct linux_binprm *bprm)
>  int cap_inode_setxattr(struct dentry *dentry, const char *name,
>  		       const void *value, size_t size, int flags)
>  {
> -	if (!strcmp(name, XATTR_NAME_CAPS)) {
> -		if (!capable(CAP_SETFCAP))
> +	if (strncmp(name, XATTR_SECURITY_PREFIX,
> +		    sizeof(XATTR_SECURITY_PREFIX) - 1) !=3D 0)
> +		return 0;
> +
> +	if (strncmp(name, XATTR_NAME_CAPS,
> +		    sizeof(XATTR_NAME_CAPS) - 1) =3D=3D 0) {
> +		struct inode *inode =3D d_backing_inode(dentry);
> +
> +		if (!inode)
> +			return -EINVAL;
> +		if (!capable_wrt_inode_uidgid(inode, CAP_SETFCAP))
>  			return -EPERM;
> +
>  		return 0;
>  	}
>  =

> -	if (!strncmp(name, XATTR_SECURITY_PREFIX,
> -		     sizeof(XATTR_SECURITY_PREFIX) - 1) &&
> -	    !capable(CAP_SYS_ADMIN))
> +	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  	return 0;
>  }
> @@ -686,15 +694,23 @@ int cap_inode_setxattr(struct dentry *dentry, const=
 char *name,
>   */
>  int cap_inode_removexattr(struct dentry *dentry, const char *name)
>  {
> -	if (!strcmp(name, XATTR_NAME_CAPS)) {
> -		if (!capable(CAP_SETFCAP))
> +	if (strncmp(name, XATTR_SECURITY_PREFIX,
> +		    sizeof(XATTR_SECURITY_PREFIX) - 1) !=3D 0)
> +		return 0;
> +
> +	if (strncmp(name, XATTR_NAME_CAPS,
> +		    sizeof(XATTR_NAME_CAPS) - 1) =3D=3D 0) {
> +		struct inode *inode =3D d_backing_inode(dentry);
> +
> +		if (!inode)
> +			return -EINVAL;
> +		if (!capable_wrt_inode_uidgid(inode, CAP_SETFCAP))
>  			return -EPERM;
> +
>  		return 0;
>  	}
>  =

> -	if (!strncmp(name, XATTR_SECURITY_PREFIX,
> -		     sizeof(XATTR_SECURITY_PREFIX) - 1) &&
> -	    !capable(CAP_SYS_ADMIN))
> +	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  	return 0;
>  }
> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index 819fd68..702c225 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -3091,8 +3091,13 @@ static int selinux_inode_setotherxattr(struct dent=
ry *dentry, const char *name)
>  =

>  	if (!strncmp(name, XATTR_SECURITY_PREFIX,
>  		     sizeof XATTR_SECURITY_PREFIX - 1)) {
> -		if (!strcmp(name, XATTR_NAME_CAPS)) {
> -			if (!capable(CAP_SETFCAP))
> +		if (!strncmp(name, XATTR_NAME_CAPS,
> +			     sizeof(XATTR_NAME_CAPS) - 1)) {
> +			struct inode *inode =3D d_backing_inode(dentry);
> +
> +			if (!inode)
> +				return -EINVAL;
> +			if (!capable_wrt_inode_uidgid(inode, CAP_SETFCAP))
>  				return -EPERM;
>  		} else if (!capable(CAP_SYS_ADMIN)) {
>  			/* A different attribute in the security namespace.

--===============1226077856221582753==--

