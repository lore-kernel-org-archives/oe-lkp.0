Content-Type: multipart/mixed; boundary="===============3433222094643006510=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Fri, 14 Jul 2017 18:22:26 -0500
Message-ID: <87lgnqtxhp.fsf@xmission.com>
In-Reply-To: <20170714213449.gtxtkqtxifk5j4wp@thunk.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3433222094643006510==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Theodore Ts'o <tytso@mit.edu> writes:

> On Fri, Jul 14, 2017 at 01:39:59PM -0700, James Bottomley wrote:
>> but why? =C2=A0That's partly the point of all of this: some security.
>> attributes can't be written by container root without some supervision
>> (the capability ones are the hugely problematic ones from this point of
>> view), but for some there's no reason they shouldn't be. =C2=A0What woul=
d be
>> the reason that root in a container shouldn't be able to write the ima
>> xattr the same as host root could on its filesystem?
>
> So I'm happy to say, "Ix-nay on nested containerization; that way lies
> insanity".  But my understanding is that there will be people who want
> to run containers in containers in containers in containers...  and
> this is what scares me.

I am happy to say we need to bound the space we take in an inode.
So a design that needs more space the more containers you have is
suspicious.

I am not fond of decisions that don't allow nesting of containers.  That
just paints us into a corner.  I am in favor of things that require
little or bounded space.

Generally I will frown at a decision that won't allow nesting, because
nesting of containers happens naturally

> What if someone in the Nth layer of containerization wants to allow
> the container root in the (N+1)th layer to set file capabilities that
> will not be honored in the Nth layer of containerization?

That works perfectly well with the design we have today.  And it only
needs a single security.capability attribute.  The actual design is
associated with the security.capability attribute (either in the
attribute or in the most recent iteration in the attribute name *scowl*)
is to have the uid (from the filesystems point of view) of the root user
of a user namespace.  Running that executable will give you those
capabilities if the uid matches the root user in your user namespace (or
a parent user namespace).

As anyone can who can modify a file can remove a security.capable
attribute just like anyone who can modify a file can remove the setuid
bit this works fine is is sufficient.  Though perhaps a little different.

> Again I think that this is insane, and I'm happy for the answer to be,
> "No, that's not supported".  That the "Host container" can have
> capabilities that it won't honor, but will be honored by all
> subcontainers, but that same thing can't be done between a
> subsubsub-container and its child subsubsubsub-container.
>
> Are we OK with that?  Because how we would encode this in the xattr
> seems to be to be hopelessly not scalable.

That really isn't an issue right now.

The real question right now is what to do with security.ima and
security.evm.  As it was proposed that we share a common code base for
them.  Right now it looks to me like the semantics are sufficiently
different that it doesn't make sense to share code between the two
implementations.  At which point all reason for storing any of this in
the xattr name goes away.  So we just have a single xattr.

Right now I am very much in favor of security xattrs continuing to have
well known names.  That easily limits how much space in the inode you
can have, and it makes thinking about things easier.  It doesn't
preclude having acls in your xattr.  That is exactly how posix
acls are implemented.   But I am not going to build generic support for
them, and I really don't expect they will be needed. =


Eric








--===============3433222094643006510==--

