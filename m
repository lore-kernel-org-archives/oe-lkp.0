Content-Type: multipart/mixed; boundary="===============8117300324708059584=="
MIME-Version: 1.0
From: Jan Kara <jack@suse.cz>
To: lkp@lists.01.org
Subject: Re: [PATCH v2] fsnotify: fix unlink performance regression
Date: Thu, 09 May 2019 12:31:47 +0200
Message-ID: <20190509103147.GC23589@quack2.suse.cz>
In-Reply-To: <CAOQ4uxhAyfhf2rzYxcQG_kLtiLPzihvnZymSOuzfJcY9L=QsNA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8117300324708059584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 08-05-19 19:09:56, Amir Goldstein wrote:
> On Tue, May 7, 2019 at 10:12 PM Amir Goldstein <amir73il@gmail.com> wro=
te:
> > Yes, I much prefer this solution myself and I will follow up with it,
> > but it would not be honest to suggest said solution as a stable fix
> > to the performance regression that was introduced in v5.1.
> > I think is it better if you choose between lesser evil:
> > v1 with ifdef CONFIG_FSNOTIFY to fix build issue
> > v2 as subtle as it is
> > OR another obviously safe stable fix that you can think of
> >
> > The change of cleansing d_delete() from fsnotify_nameremove()
> > requires more research and is anyway not stable tree material -
> > if not for the level of complexity, then because all the users of
> > FS_DELETE from pseudo and clustered filesystems need more time
> > to find regressions (we do not have test coverage for those in LTP).
> >
> =

> Something like this:
> https://github.com/amir73il/linux/commits/fsnotify_nameremove
> =

> Only partially tested. Obviously haven't tested all callers.

Not quite. I'd add the fsnotify_nameremove() call also to simple_rmdir()
and simple_unlink(). That takes care of:
arch/s390/hypfs/inode.c, drivers/infiniband/hw/qib/qib_fs.c,
fs/configfs/dir.c, fs/debugfs/inode.c, fs/tracefs/inode.c,
net/sunrpc/rpc_pipe.c

So you're left only with:
drivers/usb/gadget/function/f_fs.c, fs/btrfs/ioctl.c, fs/devpts/inode.c,
fs/reiserfs/xattr.c

Out of these drivers/usb/gadget/function/f_fs.c and fs/reiserfs/xattr.c
actually also don't want the notifications to be generated. They don't
generate events on file creation AFAICS and at least in case of reiserfs I
know that xattrs are handled in "hidden" system files so notification does
not make any sense. So we are left with exactly *two* places that need
explicit fsnotify_nameremove() call. Since both these callers already take
care of calling fsnotify_create() I think that having explicit
fsnotify_nameremove() calls there is clearer than the current state.

								Honza
-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR

--===============8117300324708059584==--

