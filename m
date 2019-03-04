Content-Type: multipart/mixed; boundary="===============1601122103879724219=="
MIME-Version: 1.0
From: Jann Horn <jannh@google.com>
To: lkp@lists.01.org
Subject: Re: [uaccess] 780464aed0: WARNING:at_arch/x86/include/asm/uaccess.h:#strnlen_user/0x
Date: Mon, 04 Mar 2019 16:58:05 +0100
Message-ID: <CAG48ez2a_dcLFpuEL3M-_KbTEmLq6dn+bXtGmL2MhQrYuj6tLA@mail.gmail.com>
In-Reply-To: <20190305001609.10f950fd4f8089e1ae07c9f1@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============1601122103879724219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 4, 2019 at 4:16 PM Masami Hiramatsu <mhiramat@kernel.org> wro=
te:
>
> Hello,
>
> On Mon, 4 Mar 2019 18:06:10 +0900
> Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> > On Sun, 3 Mar 2019 18:37:59 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >
> > > On Sun, Mar 3, 2019 at 5:14 PM Masami Hiramatsu <mhiramat@kernel.or=
g> wrote:
> > > >
> > > > I think it comes from WARN_ON_ONCE(!segment_eq(get_fs(), USER_DS)) =
in
> > > > user_access_ok(). The call trace shows that strndup_user might be c=
alled
> > > > from kernel daemon context.
> > >
> > > Ahh, yes.
> > >
> > > We've had this before. We've gotten rid of the actual "use system
> > > calls", but we still have some of the init sequence in particular just
> > > calling the wrappers instead.
> >
> > Are those safe if we are in init sequence?
> >
> > >
> > > And yes, ksys_mount() takes __user pointers.
> > >
> > > It would be a lot better to use "do_mount()", which is the interface
> > > that takes actual "char *" pointers.
> >
> > Unfortunately, it still takes a __user pointer.
> >
> > long do_mount(const char *dev_name, const char __user *dir_name,
> >                 const char *type_page, unsigned long flags, void *data_=
page)
> >
> > So what we need is
> >
> > long do_mount(const char *dev_name, struct path *dir_path,
> >                 const char *type_page, unsigned long flags, void *data_=
page)
> >
> > or introduce kern_do_mount()?
>
> Would this work?
>
> ( BTW, what is this code for? It seems totally insane termination.
>   at least this should be done in copy_mount_options().
>         if (data_page)
>                 ((char *)data_page)[PAGE_SIZE - 1] =3D 0;
> )
>
> =3D=3D=3D=3D=3D=3D=3D
> devtmpfs: Avoid passing kernel memory to __user parameter
>
> From: Masami Hiramatsu <mhiramat@kernel.org>
>
> Since ksys_mount(), ksys_chdir() and ksys_chroot() takes
> __user parameters, devtmpfsd must not pass the kernel memory
> to them. On some arch, it is not possible to pass th kernel
> memory to them, since the memory address spaces can be
> different.

strncpy_from_user() also uses user_access_begin(), and that thing's
used from all the VFS syscalls via getname(). And those are used all
over the place in init/ - for example:
init/do_mounts.c uses ksys_open() and ksys_chroot()
init/do_mounts_initrd.c uses ksys_open(), ksys_chdir(), ksys_mount(),
ksys_mkdir() and ksys_unlink()
init/do_mounts_md.c uses ksys_open()
and so on.
(identify_ramdisk_image() even uses ksys_lseek() and ksys_read()
instead of just using kernel_read()...)

--===============1601122103879724219==--

