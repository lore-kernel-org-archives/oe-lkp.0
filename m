Content-Type: multipart/mixed; boundary="===============2354621020656578320=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 18:53:16 -0500
Message-ID: <87379yshhv.fsf@xmission.com>
In-Reply-To: <1500064799.2853.36.camel@HansenPartnership.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2354621020656578320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

James Bottomley <James.Bottomley@HansenPartnership.com> writes:

> On Fri, 2017-07-14 at 16:03 -0400, Mimi Zohar wrote:
>> On Fri, 2017-07-14 at 11:52 -0700, James Bottomley wrote:
>> > =

>> > On Fri, 2017-07-14 at 14:48 -0400, Mimi Zohar wrote:
>> > > =

>> > > The concern is with a shared filesystems. =C2=A0In that case, for IMA
>> > > it would make sense to support a native and a namespace xattr.
>> > > =C2=A0If due to xattr space limitations we have to limit the number =
of
>> > > xattrs, then we should limit it to two - a native and a namespace
>> > > version, with a "uid=3D" tag - first namespace gets permission to
>> > > write the namespace xattr. =C2=A0Again, like in the layered case, if
>> > > the namespace xattr doesn't exist, fall back to using the native
>> > > xattr.
>> > =

>> > Just on this point: if we're really concerned about the need on
>> > shared filesystems to have multiple IMA signatures per file, might
>> > it not make sense simply to support multiple signatures within the
>> > security.ima xattr? The rules for writing signature updates within
>> > user namespaces would be somewhat complex (say only able to replace
>> > a signature for which you demonstrate you possess the key) but it
>> > would lead to an implementation which would work for traditional
>> > shared filesystems (like NFS) as well as containerised bind mounts.
>> =

>> Writing security.ima requires being root with CAP_SYS_ADMIN
>> privileges. =C2=A0I wouldn't want to give root within the namespace
>> permission to over write or just extend the native security.ima.
>
> but why? =C2=A0That's partly the point of all of this: some security.
> attributes can't be written by container root without some supervision
> (the capability ones are the hugely problematic ones from this point of
> view), but for some there's no reason they shouldn't be. =C2=A0What would=
 be
> the reason that root in a container shouldn't be able to write the ima
> xattr the same as host root could on its filesystem?

Mimi said she ``native''.  It competely makes sense for the things that
the container doesn't ``own'' to not be allowed to be written/updated by
the container.

James you are making the case here for root in the container to write
to the ima and evm attributes that are for the container.

So I don't actually see any disagreement here except perhaps for
terminology.

Eric


--===============2354621020656578320==--

