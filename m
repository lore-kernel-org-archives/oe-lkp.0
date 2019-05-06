Content-Type: multipart/mixed; boundary="===============6955626367694229767=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH] fsnotify: fix unlink performance regression
Date: Mon, 06 May 2019 15:26:41 +0100
Message-ID: <20190506142641.GD23075@ZenIV.linux.org.uk>
In-Reply-To: <CAOQ4uxhY0WmA7bTHhBXJLery2NmLKb_kGxoQY-hae3CrBA2sXQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6955626367694229767==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 06, 2019 at 03:43:24PM +0300, Amir Goldstein wrote:
> OK. What do you have to say about this statement?
> =

>     Because fsnotify_nameremove() is called from d_delete() with negative
>     or unhashed dentry, d_move() is not expected on this dentry, so it is
>     safe to use d_parent/d_name without take_dentry_name_snapshot().
> =

> I assume it is not correct, but cannot figure out why.
> Under what circumstances is d_move() expected to move an unhashed
> dentry and hash it?

For starters, d_splice_alias() picking an exising alias for given directory
inode.

> My other thought is why is fsnotify_nameremove() in d_delete() and
> not in vfs_unlink()/vfs_rmdir() under parent inode lock like the rest
> of the fsnotify_create/fsnotify_move hooks?
> =

> In what case would we need the fsnotify event that is not coming
> from vfs_unlink()/vfs_rmdir()?

*snort*

You can thank those who whine about notifications on sysfs/devpts/whatnot.
Go talk to them if you wish, but don't ask me to translate what you'll get
into something coherent - I'd never been able to.

--===============6955626367694229767==--

