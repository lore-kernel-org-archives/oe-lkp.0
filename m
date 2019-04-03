Content-Type: multipart/mixed; boundary="===============5597659281336009290=="
MIME-Version: 1.0
From: Ondrej Mosnacek <omosnace@redhat.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] kernfs: fix xattr name handling in LSM helpers
Date: Wed, 03 Apr 2019 09:25:46 +0200
Message-ID: <CAFqZXNt7yBF-4XiQ5AtgudjDj1sLLXQ=TSZphkqAAon9SVGbmw@mail.gmail.com>
In-Reply-To: <CAHC9VhQX31rnFet-V4E24AktrW6d7OqsTPtDOOoeNxVrCXCTmQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5597659281336009290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2019 at 3:24 AM Paul Moore <paul@paul-moore.com> wrote:
> On Tue, Apr 2, 2019 at 7:10 PM Paul Moore <paul@paul-moore.com> wrote:
> > On Mon, Apr 1, 2019 at 6:34 AM Ondrej Mosnacek <omosnace@redhat.com> =
wrote:
> > > The implementation of kernfs_security_xattr_*() helpers reuses the
> > > kernfs_node_xattr_*() functions, which take the suffix of the xattr n=
ame
> > > and extract full xattr name from it using xattr_full_name(). However,
> > > this function relies on the fact that the suffix passed to xattr
> > > handlers from VFS is always constructed from the full name by just
> > > incerementing the pointer. This doesn't necessarily hold for the call=
ers
> > > of kernfs_security_xattr_*(), so their usage will easily lead to
> > > out-of-bounds access.
> > >
> > > Fix this by moving the xattr name reconstruction to the VFS xattr
> > > handlers and replacing the kernfs_security_xattr_*() helpers with more
> > > general kernfs_xattr_*() helpers that take full xattr name and allow
> > > accessing all kernfs node's xattrs.
> > >
> > > Reported-by: kernel test robot <rong.a.chen@intel.com>
> > > Fixes: b230d5aba2d1 ("LSM: add new hook for kernfs node initializatio=
n")
> > > Fixes: ec882da5cda9 ("selinux: implement the kernfs_init_security hoo=
k")
> > > Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
> > > ---
> > >
> > > v3: simplify kernfs xattr helpers as per Paul's suggestion
> > > v2: just rebase to update diff context
> > >
> > >  fs/kernfs/inode.c        | 62 ++++++++++++++------------------------=
--
> > >  include/linux/kernfs.h   | 18 ++++++------
> > >  security/selinux/hooks.c |  9 +++---
> > >  3 files changed, 33 insertions(+), 56 deletions(-)
> >
> > This is better, thanks.  Merged into selinux/next.
>
> ... and I've just popped it off selinux/next.  It looks like you need
> to export the kernfs functions.
>
> ld: security/selinux/hooks.o: in function `selinux_kernfs_init_security':
> /pjob.data/scratch/t/server-build.lan-2100-uHT0/BUILD/kernel-5.0.fc31/lin=
ux-5.1.
> 0-0.rc3.git1.1.2.secnext.fc31.x86_64/security/selinux/hooks.c:3397: undef=
ined re
> ference to `kernfs_xattr_get'
> ld: /pjob.data/scratch/t/server-build.lan-2100-uHT0/BUILD/kernel-5.0.fc31=
/linux-
> 5.1.0-0.rc3.git1.1.2.secnext.fc31.x86_64/security/selinux/hooks.c:3408: u=
ndefine
> d reference to `kernfs_xattr_get'
> ld: /pjob.data/scratch/t/server-build.lan-2100-uHT0/BUILD/kernel-5.0.fc31=
/linux-
> 5.1.0-0.rc3.git1.1.2.secnext.fc31.x86_64/security/selinux/hooks.c:3441: u=
ndefine
> d reference to `kernfs_xattr_set'
> make: *** [Makefile:1033: vmlinux] Error 1

Hm, I *thought* I ran the build before posting... The problem is that
the function names in kernfs.h and inode.c didn't match.
EXPORT_SYMBOL_GPL() shouldn't be needed since both kernfs and SELinux
are always built-in and there seems to be an existing trend in kernfs
to not export functions unless necessary.

I should have a fixed patch ready soon.

-- =

Ondrej Mosnacek <omosnace@redhat dot com>
Software Engineer, Security Technologies
Red Hat, Inc.

--===============5597659281336009290==--

