Content-Type: multipart/mixed; boundary="===============4415940671913254390=="
MIME-Version: 1.0
From: Xiong Zhou <jencce.kernel@gmail.com>
To: lkp@lists.01.org
Subject: Re: [vfs] WARNING: CPU: 3 PID: 2339 at mm/truncate.c:758 pagecache_isize_extended+0xdd/0x120()
Date: Tue, 28 Oct 2014 09:14:27 +0800
Message-ID: <CADJHv_uQgNYiQWZ5pRPk6t+x4yTPHbWnX7J6cJ5YFE-bofFFpg@mail.gmail.com>
In-Reply-To: <20141027210523.GD6880@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============4415940671913254390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

still in rc2
------------[ cut here ]------------
WARNING: CPU: 0 PID: 18152 at mm/truncate.c:758
pagecache_isize_extended+0xfd/0x110()
Modules linked in: btrfs xor zlib_deflate raid6_pq ntfs fuse
x86_pkg_temp_thermal wmi radeon e1000e ttm
CPU: 0 PID: 18152 Comm: Cache I/O Tainted: G        W      3.18.0-rc2 #1
Hardware name: Hewlett-Packard HP Compaq Elite 8300 MT/3397, BIOS K01
v02.05 05/07/2012
 0000000000000009 ffff8800d1b3bd38 ffffffff81863216 0000000000000000
 0000000000000000 ffff8800d1b3bd78 ffffffff8105046c ffffea0002e0b600
 0000000000001000 ffff8800bb9a49a8 0000000000000000 0000000000031ada
Call Trace:
 [<ffffffff81863216>] dump_stack+0x46/0x58
 [<ffffffff8105046c>] warn_slowpath_common+0x7c/0xa0
 [<ffffffff81050535>] warn_slowpath_null+0x15/0x20
 [<ffffffff8111ebbd>] pagecache_isize_extended+0xfd/0x110
 [<ffffffff812ca780>] ? __xfs_get_blocks+0x4d0/0x4d0
 [<ffffffff8111f8a2>] truncate_setsize+0x22/0x40
 [<ffffffff812df5db>] xfs_setattr_size+0x10b/0x3c0
 [<ffffffff812ecb3e>] ? xfs_trans_commit+0x13e/0x220
 [<ffffffff812d4c57>] xfs_file_fallocate+0x2e7/0x300
 [<ffffffff81167374>] ? __sb_start_write+0x44/0xd0
 [<ffffffff811630da>] do_fallocate+0x12a/0x1d0
 [<ffffffff811631c3>] SyS_fallocate+0x43/0x70
 [<ffffffff8186ce29>] system_call_fastpath+0x12/0x17
---[ end trace abf71ba1f4096942 ]---

2014-10-28 5:05 GMT+08:00 Dave Chinner <david@fromorbit.com>:
> On Mon, Oct 27, 2014 at 10:58:12AM +0100, Jan Kara wrote:
>> On Mon 27-10-14 12:04:22, Dave Chinner wrote:
>> > On Thu, Oct 16, 2014 at 01:01:27PM +0200, Jan Kara wrote:
>> > > From de3426d6495f4b44b14c09b7c7202e9a86d864b9 Mon Sep 17 00:00:00 20=
01
>> > > From: Jan Kara <jack@suse.cz>
>> > > Date: Thu, 16 Oct 2014 12:58:42 +0200
>> > > Subject: [PATCH] mm: Remove false WARN_ON from pagecache_isize_exten=
ded()
>> > >
>> > > The WARN_ON checking whether i_mutex is held in
>> > > pagecache_isize_extended() was wrong because some filesystems (e.g.
>> > > XFS) use different locks for serialization of truncates / writes. So
>> > > just remove the check.
>> > >
>> > > Signed-off-by: Jan Kara <jack@suse.cz>
>> > > ---
>> > >  mm/truncate.c | 1 -
>> > >  1 file changed, 1 deletion(-)
>> > >
>> > > diff --git a/mm/truncate.c b/mm/truncate.c
>> > > index 261eaf6e5a19..c646084e5eec 100644
>> > > --- a/mm/truncate.c
>> > > +++ b/mm/truncate.c
>> > > @@ -755,7 +755,6 @@ void pagecache_isize_extended(struct inode *inod=
e, loff_t from, loff_t to)
>> > >   struct page *page;
>> > >   pgoff_t index;
>> > >
>> > > - WARN_ON(!mutex_is_locked(&inode->i_mutex));
>> > >   WARN_ON(to > inode->i_size);
>> > >
>> > >   if (from >=3D to || bsize =3D=3D PAGE_CACHE_SIZE)
>> >
>> > Jan, Have you sent this patch upstream yet? I'm seeing it fire in
>> > my testing in 3.18-rc1 kernels, so I was wondering what your plans
>> > are for this...
>>   I did send it but it got lost somewhere. I'll resend it.
>
> If it comes to it, I can push it through the XFS tree - I've got a
> few patches I need to send for -rc3...
>
> Cheers,
>
> Dave.
> --
> Dave Chinner
> david(a)fromorbit.com
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo(a)vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

--===============4415940671913254390==--

