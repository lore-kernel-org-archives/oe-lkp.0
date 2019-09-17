Content-Type: multipart/mixed; boundary="===============2305642855798087474=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: 266a9a8b41: WARNING:possible_recursive_locking_detected
Date: Tue, 17 Sep 2019 13:01:17 +0100
Message-ID: <20190917120117.GG1131@ZenIV.linux.org.uk>
In-Reply-To: <bd707e64-9650-e9ed-a820-e2cabd02eaf8@huawei.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2305642855798087474==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 03:03:33PM +0800, zhengbin (A) wrote:
> =

> On 2019/9/17 1:16, Al Viro wrote:
> > On Sun, Sep 15, 2019 at 08:44:05PM -0700, Linus Torvalds wrote:
> >> On Sun, Sep 15, 2019 at 8:04 PM Al Viro <viro@zeniv.linux.org.uk> wr=
ote:
> >>> Perhaps lockref_get_nested(struct lockref *lockref, unsigned int subc=
lass)?
> >>> With s/spin_lock/spin_lock_nested/ in the body...
> >> Sure. Under the usual CONFIG_DEBUG_LOCK_ALLOC, with the non-debug case
> >> just turning into a regular lockref_get().
> >>
> >> Sounds fine to me.
> > Done and force-pushed into vfs.git#fixes
> + if (file->f_pos > 2) {
> + p =3D scan_positives(cursor, &dentry->d_subdirs,
> + file->f_pos - 2, &to);
> + spin_lock(&dentry->d_lock);
> + list_move(&cursor->d_child, p);
> + spin_unlock(&dentry->d_lock);
> + } else {
> + spin_lock(&dentry->d_lock);
> + list_del_init(&cursor->d_child);
> + spin_unlock(&dentry->d_lock);
> }
> +
> + dput(to);
> dput(to) should be in if if (file->f_pos > 2)? cause we dget(to) in scan_=
positives

dput(NULL) is a no-op

--===============2305642855798087474==--

