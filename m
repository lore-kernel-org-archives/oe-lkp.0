Content-Type: multipart/mixed; boundary="===============6523602475992596718=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [PATCH] fsnotify: fix unlink performance regression
Date: Sun, 05 May 2019 14:47:06 +0100
Message-ID: <20190505134706.GB23075@ZenIV.linux.org.uk>
In-Reply-To: <CAOQ4uxhEWLXQ+cb4UQcworPQoJpXvf59HJYi2dv5pumvbxpA9w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6523602475992596718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 05, 2019 at 04:19:02PM +0300, Amir Goldstein wrote:

> I have made an analysis of callers to d_delete() and found that all calle=
rs
> either hold parent inode lock or name is stable for another reason:
> https://lore.kernel.org/linux-fsdevel/20190104090357.GD22409(a)quack2.sus=
e.cz/
> =

> But Jan preferred to keep take_dentry_name_snapshot() to be safe.
> I think the right thing to do is assert that parent inode is locked or
> no rename op in d_delete() and take the lock in ceph/ocfs2 to conform
> to the standard.

Any messing with the locking in ceph_fill_trace() would have to come
with very detailed proof of correctness, convincingly stable wrt
future changes in ceph...

--===============6523602475992596718==--

