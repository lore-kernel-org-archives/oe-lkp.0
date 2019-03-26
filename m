Content-Type: multipart/mixed; boundary="===============7053612882888217444=="
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
To: lkp@lists.01.org
Subject: Re: [kernfs] e19dfdc83b: BUG:KASAN:global-out-of-bounds_in_s
Date: Tue, 26 Mar 2019 13:33:54 +0100
Message-ID: <CAFqZXNtazgAzoFDMiQWOdaVNcpAH3PEEXwwJ8D+njGoEX4+DvA@mail.gmail.com>
In-Reply-To: <CAFqZXNuJMJTjGL5qGoemy4O--Y3kGGwGb2TfwJ5xxFAz03uPqg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7053612882888217444==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 6:06 PM Ondrej Mosnacek <omosnace@redhat.com> wro=
te:
> On Mon, Mar 25, 2019 at 4:17 PM Paul Moore <paul@paul-moore.com> wrote:
> > Ondrej, please look into this.
> >
> > You've looked at this code more recently than I have, but it looks
> > like there might be an issue with __kernfs_iattrs() returning a
> > pointer to a kernfs_iattrs object without taking a kernfs reference
> > (kernfs_get(kn)).  Although I would be a little surprised if this was
> > the problem as I think it would cause a number of issues beyond just
> > this one ... ?
>
> I think this is actually because of how xattr_full_name() reconstructs
> the full name from the xattr suffix. It assumes that the suffix was
> obtained from the full name by just taking a pointer inside it, but in
> kernfs_security_xattr_get/set() I pass the suffix directly... I'm
> surprised that this didn't fail spectacularly earlier during testing.
> Maybe the newer GCC does some clever merging of the string constants,
> so that XATTR_SELINUX_SUFFIX actually ends up as a substring of
> XATTR_NAME_SELINUX? (That would be one hell of a "lucky" coincidence
> :)
>
> I'll post a patch that converts kernfs_security_xattr_get/set() to
> take the full name and hopefully that will fix the problem. I'll see
> if I can run the reproducer locally tomorrow...

I managed to reproduce the KASAN warning in my kernel testing
environment by simply enabling CONFIG_KASAN and running the cgroupfs
issue reproducer from the original patchset. With the patch I posted I
no longer get the warning, so I believe it really fixes the problem.

--
Ondrej Mosnacek <omosnace@redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

--===============7053612882888217444==--

