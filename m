Content-Type: multipart/mixed; boundary="===============1433437053913936151=="
MIME-Version: 1.0
From: Al Viro <viro@zeniv.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: c774ef18d3 ("new helpers: vfs_create_mount(), fc_mount()"): BUG: unable to handle kernel NULL pointer dereference at 00000000000000c0
Date: Sat, 22 Dec 2018 15:38:33 +0000
Message-ID: <20181222153833.GB2217@ZenIV.linux.org.uk>
In-Reply-To: <5c1e02d8.rYm2nATLgWPqW+bw%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1433437053913936151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 22, 2018 at 05:24:40PM +0800, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git Q33
> =

> commit c774ef18d367b033d99817a994552d2d63873395
> Author:     Al Viro <viro@zeniv.linux.org.uk>
> AuthorDate: Sun Nov 4 06:48:34 2018 -0500
> Commit:     Al Viro <viro@zeniv.linux.org.uk>
> CommitDate: Thu Dec 20 13:17:59 2018 -0500
> =

>     new helpers: vfs_create_mount(), fc_mount()

Somewhat similar to bisect hazards, only between the branches...
FWIW, the changelog on branch level would've been along the lines of

#Q33: most of the calls of vfs_get_tree() are directly followed by
vfs_create_mount().  Introduce a helper doing the usual combination,
switch to it reducing the amount of vfs_get_tree() call sites.
Reducing the amount of boilerplate also doesn't hurt.

#Q34: now that the callers of vfs_get_tree() are few, we can massage
the calling conventions.  First of all, let's move unlocking the
resulting superblock into the callers.

#Q35: a part of LSM checks in vfs_get_tree() is done to all mounts.
Then there are extra checks done only to non-SB_KERNMOUNT/non-SB_SUBMOUNT
ones.  Now that we return with superblock locked, those extra checks
can be safely moved out to callers; better yet, there they either
become unconditional (for real userland mount/fsconfig) or
unconditionally vanish.

#Q36: FS_CONTEXT_FOR_ROOT_MOUNT is never actually stored anywhere -
it only gets passed to vfs_dup_fs_mount() as the 'purpose' argument
and that argument is ignored there - the ->purpose of cloned fc
is inherited from the original, as it bloody well ought to.
Get rid of the second argument of vfs_dup_fs_mount(), remove
FS_CONTEXT_FOR_ROOT_MOUNT.   Also in that branch: fold a smack leak
fix.

#Q37: vfs_new_fs_context() is not a constructor - it's 3 constructors
squeshed into one.  Unfortunately, the arguments' lists are different
for all 3 and "merging" them (with enum selector added) leads to
rather confusing mess for callers to deal with.  Unsquash those;
they are much happier as
	fs_config_for_mount(type, flags)
	fs_config_for_remount(dentry, flags, flags_mask)
	fs_config_for_fsmount(type, mountpoint)
and so are the callers...


Q33 introduces the bug, Q34 fixes it.

in Q33:
struct vfsmount *fc_mount(struct fs_context *fc)
{
	int err =3D vfs_get_tree(fc);
	return err ? vfs_create_mount(fc) : ERR_PTR(err);
}

in Q34:
struct vfsmount *fc_mount(struct fs_context *fc)
{
	int err =3D vfs_get_tree(fc);
	if (!err) {
		up_write(&fc->root->d_sb->s_umount);
		return vfs_create_mount(fc);
	}
	return ERR_PTR(err);
}

Note the inverted condition in Q33 variant.  Mea culpa - it was
basically "I know where I want to get with that transformation,
let's do the introduction of helper first, ripple it into the
branch, then do the calling conventions' massage on remaining
callers", with intermediate (introduce the helper, switch to
it) getting only compile testing ;-/

--===============1433437053913936151==--

