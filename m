Content-Type: multipart/mixed; boundary="===============2997990666887530574=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [ramfs] 0858d7da8a: canonical_address#:#[##]
Date: Thu, 25 Nov 2021 10:03:33 -0800
Message-ID: <CAHk-=widXZyzRiEzmYuG-bLVtNsptxt4TqAhy75Tbio-V_9oNQ@mail.gmail.com>
In-Reply-To: <20211125140816.GC3109@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2997990666887530574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 25, 2021 at 6:08 AM kernel test robot <oliver.sang@intel.com>=
 wrote:
> FYI, we noticed the following commit (built with clang-14):
>
> commit: 0858d7da8a09e440fb192a0239d20249a2d16af8 ("ramfs: fix mount sourc=
e show for ramfs")

Funky. That commit seems to have nothing to do with the oops:

> [  806.257788][  T204] /dev/root: Can't open blockdev
> [  806.259101][  T204] general protection fault, probably for non-canonic=
al address 0xdffffc0000000003: 0000 [#1] SMP KASAN
> [  806.263082][  T204] KASAN: null-ptr-deref in range [0x0000000000000018=
-0x000000000000001f]

Not a very helpful error message,a nd the KASAN comment makes little sense,=
 but

> [ 806.267540][ T204] RIP: 0010:ntfs_update_mftmirr (kbuild/src/consumer/f=
s/ntfs3/fsntfs.c:834)

That's

        u32 blocksize =3D sb->s_blocksize;

and presumably with KASAN you end up getting hat odd 0xdffffc0000000003 thi=
ng.

Anyway, looks like sb is NULL, and the code is

  int ntfs_update_mftmirr(struct ntfs_sb_info *sbi, int wait)
  {
        int err;
        struct super_block *sb =3D sbi->sb;
        u32 blocksize =3D sb->s_blocksize;
        sector_t block1, block2;

although I have no idea how sbi->sb could be NULL.

Konstantin? See

    https://lore.kernel.org/lkml/20211125140816.GC3109(a)xsang-OptiPlex-902=
0/

for the full thing.

             Linus
--===============2997990666887530574==--

