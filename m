Content-Type: multipart/mixed; boundary="===============8834490113451624165=="
MIME-Version: 1.0
From: yangerkun <yangerkun@huawei.com>
To: lkp@lists.01.org
Subject: Re: [ramfs] 0858d7da8a: canonical_address#:#[##]
Date: Fri, 26 Nov 2021 09:54:56 +0800
Message-ID: <68587446-fb74-b411-ba19-dd52395567c9@huawei.com>
In-Reply-To: <CAHk-=widXZyzRiEzmYuG-bLVtNsptxt4TqAhy75Tbio-V_9oNQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8834490113451624165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Cc ntfs3:

Maybe it's a problem like this:

do_new_mount
   fs_context_for_mount
     alloc_fs_context
       ntfs_init_fs_context
         sbi =3D kzalloc(sizeof(struct ntfs_sb_info), GFP_NOFS);
         fc->s_fs_info =3D sbi;
   vfs_get_tree
     ntfs_fs_get_tree
       get_tree_bdev
         blkdev_get_by_path  // return error and sbi->sb will be NULL
   put_fs_context
     ntfs_fs_free
       put_ntfs
         ntfs_update_mftmirr
           struct super_block *sb =3D sbi->sb; // NULL
           u32 blocksize =3D sb->s_blocksize; // BOOM

It's actually a ntfs3 bug which may be introduced by:

610f8f5a7baf fs/ntfs3: Use new api for mounting


On 2021/11/26 2:03, Linus Torvalds wrote:
> On Thu, Nov 25, 2021 at 6:08 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
>> FYI, we noticed the following commit (built with clang-14):
>>
>> commit: 0858d7da8a09e440fb192a0239d20249a2d16af8 ("ramfs: fix mount sour=
ce show for ramfs")
> =

> Funky. That commit seems to have nothing to do with the oops:
> =

>> [  806.257788][  T204] /dev/root: Can't open blockdev
>> [  806.259101][  T204] general protection fault, probably for non-canoni=
cal address 0xdffffc0000000003: 0000 [#1] SMP KASAN
>> [  806.263082][  T204] KASAN: null-ptr-deref in range [0x000000000000001=
8-0x000000000000001f]
> =

> Not a very helpful error message,a nd the KASAN comment makes little sens=
e, but
> =

>> [ 806.267540][ T204] RIP: 0010:ntfs_update_mftmirr (kbuild/src/consumer/=
fs/ntfs3/fsntfs.c:834)
> =

> That's
> =

>          u32 blocksize =3D sb->s_blocksize;
> =

> and presumably with KASAN you end up getting hat odd 0xdffffc0000000003 t=
hing.
> =

> Anyway, looks like sb is NULL, and the code is
> =

>    int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
>    {
>          int err;
>          struct super_block *sb =3D sbi->sb;
>          u32 blocksize =3D sb->s_blocksize;
>          sector_t block1, block2;
> =

> although I have no idea how sbi->sb could be NULL.
> =

> Konstantin? See
> =

>      https://lore.kernel.org/lkml/20211125140816.GC3109(a)xsang-OptiPlex-=
9020/
> =

> for the full thing.
> =

>               Linus
> .
>=20
--===============8834490113451624165==--

