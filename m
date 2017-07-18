Content-Type: multipart/mixed; boundary="===============6510618024021933752=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 08:05:18 -0400
Message-ID: <55971eea-fde2-439a-2fe5-d0ae5e80bc22@linux.vnet.ibm.com>
In-Reply-To: <20170718114849.GA8233@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6510618024021933752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 07/18/2017 07:48 AM, Vivek Goyal wrote:
> On Mon, Jul 17, 2017 at 04:50:22PM -0400, Stefan Berger wrote:
>> On 07/17/2017 02:58 PM, Vivek Goyal wrote:
>>> On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:
>>>
>>> [..]
>>>> +/*
>>>> + * xattr_list_userns_rewrite - Rewrite list of xattr names for user n=
amespaces
>>>> + *                             or determine needed size for attribute=
 list
>>>> + *                             in case size =3D=3D 0
>>>> + *
>>>> + * In a user namespace we do not present all extended attributes to t=
he
>>>> + * user. We filter out those that are in the list of userns supported=
 xattr.
>>>> + * Besides that we filter out those with @uid=3D<uid> when there is n=
o mapping
>>>> + * for that uid in the current user namespace.
>>>> + *
>>>> + * @list:        list of 0-byte separated xattr names
>>>> + * @size:        the size of the list; may be 0 to determine needed l=
ist size
>>>> + * @list_maxlen: allocated buffer size of list
>>>> + */
>>>> +static ssize_t
>>>> +xattr_list_userns_rewrite(char *list, ssize_t size, size_t list_maxle=
n)
>>>> +{
>>>> +	char *nlist =3D NULL;
>>>> +	size_t s_off, len, nlen;
>>>> +	ssize_t d_off;
>>>> +	char *name, *newname;
>>>> +
>>>> +	if (!list || size < 0 || current_user_ns() =3D=3D &init_user_ns)
>>> size will never be less than 0 here. Only caller calls this function on=
ly
>>> if size is >0. So can we remove this?
>> Correct.
>>
>>> What about case of "!list". So if user space called listxattr(foo, NULL,
>>> 0), we want to return the size of buffer as if all the xattrs will be
>>> returned to user space. But in practice we probably will filter out some
>>> xattrs so actually returned string will be smaller than size reported
>>> previously.
>> This case of size=3D0 is a problem in userns. Depending on the mapping o=
f the
>> userid's the list can expand. A security.foo(a)uid=3D100 can become
>> security.foo(a)uid=3D100000, if the mapping is set up so that uid 100 on=
 the
>> host becomes uid 100000 inside the container. So for now we only have
>> security.capability and the way I solved this is by allocating a 65k buf=
fer
>> when calling from a userns. In this buffer where we gather the xattr nam=
es
>> and then walk them to determine the size that's needed for the buffer by
>> simulating the rewriting. It's not nice but I don't know of any other
>> solution.
> Hi Stefan,
>
> For the case of size=3D=3D0, why don't we iterate through all the xattr,
> filter them, remap them and then return the size to process in user
> namespace. That should fix this? I thought that's what


For the size=3D=3D0 we need a temp. buffer where the raw xattr names are =

written to so that the xattr_list_userns_rewrite() can actually rewrite =

what the filesystem drivers returned. Not knowing exactly how big that =

buffer should be, I allocate 65k for it. From what I read there is a 64k =

limit on the vfs layer for xattrs, probably including xattr values. So =

65k would for sure be enough also if each one of the xattr names becomes =

bigger.

@@ -922,10 +947,20 @@ vfs_listxattr(struct dentry *dentry, char *list, =

size_t size, bool rewrite)
  {
      struct inode *inode =3D d_inode(dentry);
      ssize_t error;
+    bool getsize =3D false;

      error =3D security_inode_listxattr(dentry);
      if (error)
          return error;
+
+    if (!size) {
+        if (current_user_ns() !=3D &init_user_ns) {
+            size =3D 65 * 1024;
+            list =3D kmalloc(size, GFP_KERNEL);
+        }
+        getsize =3D true;
+    }
+
      if (inode->i_op->listxattr && (inode->i_opflags & IOP_XATTR)) {
          error =3D -EOPNOTSUPP;
          error =3D inode->i_op->listxattr(dentry, list, size);
@@ -937,6 +972,9 @@ vfs_listxattr(struct dentry *dentry, char *list, =

size_t size, bool rewrite)
      if (error > 0 && rewrite)
          error =3D xattr_list_userns_rewrite(list, error, size);

+    if (getsize)
+        kfree(list);
+
      return error;
  }
  EXPORT_SYMBOL_GPL(vfs_listxattr);


     Stefan

> xattr_list_userns_rewrite() was doing. But looks like this logic will not
> kick in for the case of size=3D=3D0 due to "!list" condition.
>
> Also we could probably replace "!list" with "!size" wheverever required.
> Its little easy to read and understand.
>
> For the other case where some xattrs can get filtered out and we report
> a buffer size bigger than actually needed, I am hoping that its acceptable
> and none of the existing users are broken.
>
> Thanks
> Vivek
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-=
module" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--===============6510618024021933752==--

