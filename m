Content-Type: multipart/mixed; boundary="===============1418374501707737790=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] fsnotify: fix unlink performance regression
Date: Mon, 13 May 2019 18:33:09 +0200
Message-ID: <20190513163309.GE13297@quack2.suse.cz>
In-Reply-To: <CAOQ4uxhkfnZ1pXJE9jxpuMpZmyJ0VOQwWDOM4e-=HJaHSathPA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1418374501707737790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri 10-05-19 18:24:42, Amir Goldstein wrote:
> On Thu, May 9, 2019 at 1:31 PM Jan Kara <jack@suse.cz> wrote:
> > On Wed 08-05-19 19:09:56, Amir Goldstein wrote:
> > > On Tue, May 7, 2019 at 10:12 PM Amir Goldstein <amir73il@gmail.com>=
 wrote:
> > > > Yes, I much prefer this solution myself and I will follow up with i=
t,
> > > > but it would not be honest to suggest said solution as a stable fix
> > > > to the performance regression that was introduced in v5.1.
> > > > I think is it better if you choose between lesser evil:
> > > > v1 with ifdef CONFIG_FSNOTIFY to fix build issue
> > > > v2 as subtle as it is
> > > > OR another obviously safe stable fix that you can think of
> > > >
> > > > The change of cleansing d_delete() from fsnotify_nameremove()
> > > > requires more research and is anyway not stable tree material -
> > > > if not for the level of complexity, then because all the users of
> > > > FS_DELETE from pseudo and clustered filesystems need more time
> > > > to find regressions (we do not have test coverage for those in LTP).
> > > >
> > >
> > > Something like this:
> > > https://github.com/amir73il/linux/commits/fsnotify_nameremove
> > >
> > > Only partially tested. Obviously haven't tested all callers.
> >
> > Not quite. I'd add the fsnotify_nameremove() call also to simple_rmdir()
> > and simple_unlink(). That takes care of:
> > arch/s390/hypfs/inode.c, drivers/infiniband/hw/qib/qib_fs.c,
> > fs/configfs/dir.c, fs/debugfs/inode.c, fs/tracefs/inode.c,
> > net/sunrpc/rpc_pipe.c
> >
> =

> simple_unlink() is used as i_op->unlink() implementation of simple
> filesystems, such as: fs/pstore/inode.c fs/ramfs/inode.c
> fs/ocfs2/dlmfs/dlmfs.c fs/hugetlbfs/inode.c kernel/bpf/inode.c
> =

> If we place fsnotify hook in the filesystem implementation and not
> in vfs_unlink(), what will cover normal fs? If we do place fsnotify hook
> in vfs_unlink(), then we have a double call to hook.
> =

> The places we add explicit fsnofity hooks should only be call sites that
> do not originate from vfs_unlink/vfs_rmdir.

Hum, right. I didn't realize simple_unlink() gets also called through
vfs_unlink() for some filesystems. But then I'd rather create variants
simple_unlink_notify() and simple_rmdir_notify() than messing with
d_delete(). As I just think that fsnotify call in d_delete() happens at a
wrong layer. d_delete() is about dcache management, not really about
filesystem name removal which is what we want to notify about.

> > So you're left only with:
> > drivers/usb/gadget/function/f_fs.c, fs/btrfs/ioctl.c, fs/devpts/inode.c,
> > fs/reiserfs/xattr.c
> >
> > Out of these drivers/usb/gadget/function/f_fs.c and fs/reiserfs/xattr.c
> > actually also don't want the notifications to be generated. They don't
> > generate events on file creation AFAICS and at least in case of reiserf=
s I
> > know that xattrs are handled in "hidden" system files so notification d=
oes
> > not make any sense. So we are left with exactly *two* places that need
> =

> OK. good to know.
> =

> > explicit fsnotify_nameremove() call. Since both these callers already t=
ake
> > care of calling fsnotify_create() I think that having explicit
> > fsnotify_nameremove() calls there is clearer than the current state.
> >
> =

> I though so too, but then I did not feel comfortable with "regressing"
> delete notifications on many filesystems that did seem plausible for
> having notification users like configfs, even though they do not have
> create notification, so I decided to do the safer option of converting all
> plausible callers of d_delete() that abide to the parent/name stable
> constrains to use the d_delete_and_notify() wrapper.

As I said above, I don't want to regress anyone either. But I just think
that d_delete() is a wrong function to call fsnotify hook from (as much as
it is convenient) and that's what's causing all these problems.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============1418374501707737790==--

