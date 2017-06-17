Content-Type: multipart/mixed; boundary="===============6539448470963563049=="
MIME-Version: 1.0
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v4] Introduce v3 namespaced file capabilities
Date: Sat, 17 Jun 2017 16:56:32 -0400
Message-ID: <f0df1914-bca2-31a0-cdba-df30d85d70b3@linux.vnet.ibm.com>
In-Reply-To: <20170615030543.GA8979@mail.hallyn.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6539448470963563049==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/14/2017 11:05 PM, Serge E. Hallyn wrote:
> On Wed, Jun 14, 2017 at 08:27:40AM -0400, Stefan Berger wrote:
>> On 06/13/2017 07:55 PM, Serge E. Hallyn wrote:
>>> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>>>>   If all extended
>>>> attributes were to support this model, maybe the 'uid' could be
>>>> associated with the 'name' of the xattr rather than its 'value' (not
>>>> sure whether that's possible).
>>> Right, I missed that in your original email when I saw it this morning.
>>> It's not what my patch does, but it's an interesting idea.  Do you have
>>> a patch to that effect?  We might even be able to generalize that to
>> No, I don't have a patch. It may not be possible to implement it.
>> The xattr_handler's  take the name of the xattr as input to get().
> That may be ok though.  Assume the host created a container with
> 100000 as the uid for root, which created a container with 130000 as
> uid for root.  If root in the nested container tries to read the
> xattr, the kernel can check for security.foo[130000] first, then
> security.foo[100000], then security.foo.  Or, it can do a listxattr
> and look for those.  Am I overlooking one?
>
>> So one could try to encode the mapped uid in the name. However, that
> I thought that's exactly what you were suggesting in your original
> email?  "security.capability[uid=3D2000]"
>
>> could lead to problems with stale xattrs in a shared filesystem over
>> time unless one could limit the number of xattrs with the same
>> prefix, e.g., security.capability*. So I doubt that it would work.
> Hm.  Yeah.  But really how many setups are there like that?  I.e. if
> you launch a regular docker or lxd container, the image doesn't do a
> bind mount of a shared image, it layers something above it or does a
> copy.  What setups do you know of where multiple containers in different
> user namespaces mount the same filesystem shared and writeable?

I think I have something now that accomodates userns access to =

security.capability:

https://github.com/stefanberger/linux/commits/xattr_for_userns

Encoding of uid is in the attribute name now as follows: =

security.foo(a)uid=3D<uid>

1) The 'plain' security.capability is only r/w accessible from the host =

(init_user_ns).
2) When userns reads/writes 'security.capability' it will read/write =

security.capability(a)uid=3D<uid> instead, with uid being the uid of root , =

e.g. 1000.
3) When listing xattrs for userns the host's security.capability is =

filtered out to avoid read failures iof 'security.capability' if =

security.capability(a)uid=3D<uid> is read but not there. (see 1) and 2))
4) security.capability* may all be read from anywhere
5) security.capability(a)uid=3D<uid> may be read or written directly from a =

userns if <uid> matches the uid of root (current_uid())
6) security.capability@* are 'reserved' and may be read but not written =

to unless 5) applies.


Similat, from the text of one of the functions in the code:

+ * In a user namespace we prevent read/write accesses to the _host's_
+ * security.foo to protect these extended attributes.
+ *
+ * Reading: Reading security.foo from a user namespace will read
+ * security.foo(a)uid=3D<uid> instead. Reading security.foo(a)uid=3D<uid> =
directly
+ * also works. In general, all security.foo*, except for security.foo =

of the
+ * host, can be read from a user namespace.
+ *
+ * Writing: Writing security.foo from a user namespace will write
+ * security.foo(a)uid=3D<uid> instead. Writing security.foo(a)uid=3D<uid> =
directly
+ * also work.s No other security.foo* attributes, including the =

security.foo
+ * offthe host, can be written to. All security.foo@* are 'reserved'.
+ *
+ * Removing: The same rules for writing apply to removing of extended
+ * attributes from a user namespace.



    Stefan


--===============6539448470963563049==--

