Content-Type: multipart/mixed; boundary="===============7348657357070294313=="
MIME-Version: 1.0
From: Theodore Ts'o <tytso@mit.edu>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] xattr: Enable security.capability in user namespaces
Date: Thu, 13 Jul 2017 15:14:29 -0400
Message-ID: <20170713191429.vfaetqscxd7hniwq@thunk.org>
In-Reply-To: <8760ew9qyp.fsf@xmission.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7348657357070294313==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2017 at 12:39:10PM -0500, Eric W. Biederman wrote:
> > Can you define what 'scalable' means for you in this context?
> > From what I can see sharing a filesystem between multiple containers
> > doesn't 'scale well' for virtualizing the xattrs primarily because of
> > size limitations of xattrs per file.
> =

> Worse than that I believe you will find that filesystems are built on
> the assumption that there will be a small number of xattrs per file.
> So even if the vfs limitations were lifted the filesystem performance
> would suffer.

That's why I've been pushing here.  If people try to do

   security.capable(a)uid=3D1000
   security.capable(a)uid=3D2000
   security.capable(a)uid=3D3000
   security.capable(a)uid=3D4000
   security.capable(a)uid=3D5000
   security.capable(a)uid=3D6000
   security.capable(a)uid=3D7000
   security.capable(a)uid=3D8000
   security.capable(a)uid=3D9000
         .
	 .
	 .

... where the values of all of these will be the same, this is going
to be *awful* even if the file system can support it.

So maybe we are better off if we define an xattr

   security.capable(a)guest-container

... so the property is that it is ignored by the host ("real")
container, and in all of the subcontainers, it will be used if the
local container root is trying to execute the file.

Now, this doesn't support the solution of the "turtles all the way
down" insane containers configuraiton.

E.g., where in one container we boot a RHEL distro, which then
launches another container running another RHEL distro, and repeat
this 1000 times, for a very deeply nested subsubsubsubsub...container.

I think this is insane and we shouldn't support this, but I know there
are people who think this is a perfectly sane thing to do.


The other thing this doesn't support is someone who wants to use IMA,
and where the every single IMA is using a different signed HMAC:

   security.ima(a)uid=3D1000
   security.ima(a)uid=3D2000
   security.ima(a)uid=3D3000
   security.ima(a)uid=3D4000
   security.ima(a)uid=3D5000
   security.ima(a)uid=3D6000
   security.ima(a)uid=3D7000
   security.ima(a)uid=3D8000
   security.ima(a)uid=3D9000
	.
	.
	.

Where each security IMA could either be a 32 byte HMAC, or worse, a
256 byte RSA signed signature.  Now let's assume there are 10,000
containers, each of which needs a separate RSA signature.  This sounds
insane.... but I've seen things that I've thought were more insane
coming out of containerland, so it would be nice if we can get
something signed in blood promisng that no, we would *never* do
something that insane, or better yet, make it impossible to do from an
architectural standpoint.

					- Ted

--===============7348657357070294313==--

