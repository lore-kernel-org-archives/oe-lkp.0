Content-Type: multipart/mixed; boundary="===============0258817852581602303=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 12:36:46 -0500
Message-ID: <87pod22a4x.fsf@xmission.com>
In-Reply-To: <596f808b-e21d-8296-5fef-23c1ce7ab778@linux.vnet.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0258817852581602303==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Stefan Berger <stefanb@linux.vnet.ibm.com> writes:

> On 07/14/2017 09:34 AM, Serge E. Hallyn wrote:
>> Quoting Stefan Berger (stefanb(a)linux.vnet.ibm.com):
>>> On 07/13/2017 08:38 PM, Eric W. Biederman wrote:
>>>> Stefan Berger <stefanb@linux.vnet.ibm.com> writes:
>>>>
>>>>> On 07/13/2017 01:49 PM, Eric W. Biederman wrote:
>>>>>
>>>>>> My big question right now is can you implement Ted's suggested
>>>>>> restriction.  Only one security.foo or secuirty.foo(a)... attribute ?
>>>>> We need to raw-list the xattrs and do the check before writing them. =
I am fairly sure this can be done.
>>>>>
>>>>> So now you want to allow security.foo and one security.foo(a)uid=3D<>=
 or just a single one security.foo(@[[:print:]]*)?
>>>>>
>>>> The latter.
>>> That case would prevent a container user from overriding the xattr
>>> on the host. Is that what we want? For limiting the number of xattrs
>> Not really.  If the file is owned by a uid mapped into the container,
>> then the container root can chown the file which will clear the file
>> capability, after which he can set a new one.  If the file is not
>> owned by a uid mapped into the container, then container root could
>> not set a filecap anyway.
>
> Let's say I installed a container where all files are signed and thus have
> security.ima. Now for some reason I want to re-sign some or all files ins=
ide
> that container. How would I do that ? Would I need to get rid of security=
.ima
> first, possibly by copying each file, deleting the original file, and ren=
aming
> the copied file to the original name, or should I just be able to write o=
ut a
> new signature, thus creating security.ima(a)uid=3D1000 besides the securi=
ty.ima ?

This gets us into some interesting territory, where the semantics of
these attributes matters.

The implementation of security.capable implements the security killpriv
hooks.  Anyone merely by changing the file can cause the security
capability to go away.  So it makes sense from the security.capable side
that anyone who has the capable_wrt_inode_uidgid(CAP_SETFCAP) will be
able to clear and set security.capable.

The integrity xattrs do not.  Which results in very big semantic
difference between these two kinds of attributes.  I am insufficiently
familiar with the rules for security.ima and security.evm to understand
what those rules should be.

That may be enough that we can not share code between these two cases.

Eric

--===============0258817852581602303==--

