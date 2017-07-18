Content-Type: multipart/mixed; boundary="===============6742068158481241637=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Tue, 18 Jul 2017 08:29:28 -0500
Message-ID: <87shhtho07.fsf@xmission.com>
In-Reply-To: <20170718123603.GC8233@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6742068158481241637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Vivek Goyal <vgoyal@redhat.com> writes:

> On Tue, Jul 18, 2017 at 08:30:09AM -0400, Vivek Goyal wrote:
>> On Tue, Jul 18, 2017 at 08:05:18AM -0400, Stefan Berger wrote:
>> > On 07/18/2017 07:48 AM, Vivek Goyal wrote:
>> > > On Mon, Jul 17, 2017 at 04:50:22PM -0400, Stefan Berger wrote:
>> > > > On 07/17/2017 02:58 PM, Vivek Goyal wrote:
>> > > > > On Tue, Jul 11, 2017 at 11:05:11AM -0400, Stefan Berger wrote:
>> > > > > =

>> > > > > [..]
>> > > > > > +/*
>> > > > > > + * xattr_list_userns_rewrite - Rewrite list of xattr names fo=
r user namespaces
>> > > > > > + *                             or determine needed size for a=
ttribute list
>> > > > > > + *                             in case size =3D=3D 0
>> > > > > > + *
>> > > > > > + * In a user namespace we do not present all extended attribu=
tes to the
>> > > > > > + * user. We filter out those that are in the list of userns s=
upported xattr.
>> > > > > > + * Besides that we filter out those with @uid=3D<uid> when th=
ere is no mapping
>> > > > > > + * for that uid in the current user namespace.
>> > > > > > + *
>> > > > > > + * @list:        list of 0-byte separated xattr names
>> > > > > > + * @size:        the size of the list; may be 0 to determine =
needed list size
>> > > > > > + * @list_maxlen: allocated buffer size of list
>> > > > > > + */
>> > > > > > +static ssize_t
>> > > > > > +xattr_list_userns_rewrite(char *list, ssize_t size, size_t li=
st_maxlen)
>> > > > > > +{
>> > > > > > +	char *nlist =3D NULL;
>> > > > > > +	size_t s_off, len, nlen;
>> > > > > > +	ssize_t d_off;
>> > > > > > +	char *name, *newname;
>> > > > > > +
>> > > > > > +	if (!list || size < 0 || current_user_ns() =3D=3D &init_user=
_ns)
>> > > > > size will never be less than 0 here. Only caller calls this func=
tion only
>> > > > > if size is >0. So can we remove this?
>> > > > Correct.
>> > > > =

>> > > > > What about case of "!list". So if user space called listxattr(fo=
o, NULL,
>> > > > > 0), we want to return the size of buffer as if all the xattrs wi=
ll be
>> > > > > returned to user space. But in practice we probably will filter =
out some
>> > > > > xattrs so actually returned string will be smaller than size rep=
orted
>> > > > > previously.
>> > > > This case of size=3D0 is a problem in userns. Depending on the map=
ping of the
>> > > > userid's the list can expand. A security.foo(a)uid=3D100 can become
>> > > > security.foo(a)uid=3D100000, if the mapping is set up so that uid =
100 on the
>> > > > host becomes uid 100000 inside the container. So for now we only h=
ave
>> > > > security.capability and the way I solved this is by allocating a 6=
5k buffer
>> > > > when calling from a userns. In this buffer where we gather the xat=
tr names
>> > > > and then walk them to determine the size that's needed for the buf=
fer by
>> > > > simulating the rewriting. It's not nice but I don't know of any ot=
her
>> > > > solution.
>> > > Hi Stefan,
>> > > =

>> > > For the case of size=3D=3D0, why don't we iterate through all the xa=
ttr,
>> > > filter them, remap them and then return the size to process in user
>> > > namespace. That should fix this? I thought that's what
>> > =

>> > =

>> > For the size=3D=3D0 we need a temp. buffer where the raw xattr names a=
re written
>> > to so that the xattr_list_userns_rewrite() can actually rewrite what t=
he
>> > filesystem drivers returned.
>> =

>> I am probably missing something, but for the case of size=3D=3D0, we don=
't
>> have to copy all xattrs. We just need to determine size. So we can walk
>> through each xattr, remap it and add to the size. I mean there should not
>> be a need to allocate this 65K buffer. Just enough space needed to be
>> able to store remapped xattr.
>> =

>> You are already doing it in xattr_parse_uid_from_kuid(). It returns the
>> buffer containing remapped xattr. So we should be able to just determine
>> the size and free the buffer. And do it for all the xattrs returned by
>> filesystem.
>> =

>> What am I missing?
>
> Oh, I think I get it. If I don't pass a buffer to underlying driver, then
> it will just return the size (and not actual list). So that's why you are
> allocating that big buffer and getting the whole list internally, doing
> mapping and returning size to user space. Hmm...

A valid reason to be leary of storing attributs in the xattrs.

Eric


--===============6742068158481241637==--

