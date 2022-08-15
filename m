Content-Type: multipart/mixed; boundary="===============0938247637997205321=="
MIME-Version: 1.0
From: Christian Brauner <brauner@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs] faf99b5635: will-it-scale.per_thread_ops -9.0% regression
Date: Mon, 15 Aug 2022 12:00:44 +0200
Message-ID: <20220815100044.7j2u2yjlkanhkrfg@wittgenstein>
In-Reply-To: <YvnMWbRDhM0fH4E/@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0938247637997205321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2022 at 12:32:25PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -9.0% regression of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: faf99b563558f74188b7ca34faae1c1da49a7261 ("fs: add __remove_file_=
privs() with flags parameter")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This seems overall pretty odd tbh at least it's not immediately obvious
how that specific commit would've caused this. But fwiw, I think there's
one issue in this change which we originally overlooked which might
explain this.

Before faf99b563558 ("fs: add __remove_file_privs() with flags
parameter") inode_has_no_xattr() was called when
dentry_needs_remove_privs() returned 0.

	int error =3D 0
	[...]
	kill =3D dentry_needs_remove_privs(dentry);
	if (kill < 0)
		return kill;
	if (kill)
		error =3D __remove_privs(file_mnt_user_ns(file), dentry, kill);
	if (!error)
		inode_has_no_xattr(inode);

but now we do:

	kill =3D dentry_needs_remove_privs(dentry);
	if (kill <=3D 0)
		return kill;

which means we don't call inode_has_no_xattr(). I don't think that we
did this intentionally. inode_has_no_xattr() just sets S_NOSEC which
means next time we call into __file_remove_privs() we can return earlier
instead of hitting dentry_needs_remove_privs() again:

if (IS_NOSEC(inode) || !S_ISREG(inode->i_mode))
	return 0;

So I think that needs to be fixed?

Christian
--===============0938247637997205321==--

