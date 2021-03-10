Content-Type: multipart/mixed; boundary="===============1471987026310538465=="
MIME-Version: 1.0
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lkp@lists.01.org
Subject: Re: [LTP] [f2fs] 02eb84b96b: ltp.swapon03.fail
Date: Wed, 10 Mar 2021 12:49:20 -0800
Message-ID: <YEkw0J9VEg66AgIt@google.com>
In-Reply-To: <c84bf5c9-501e-6c25-1728-a7c6281093fd@oppo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1471987026310538465==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 03/10, Huang Jianan wrote:
> Hi Richard,
> =

> On 2021/3/9 12:01, Matthew Wilcox wrote:
> > On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
> > > Hi Richard,
> > > =

> > > On 2021/3/8 19:53, Richard Palethorpe wrote:
> > > > Hello,
> > > > =

> > > > > kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not a=
lign to section
> > > > > commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> > > > > Author: huangjianan(a)oppo.com <huangjianan@oppo.com>
> > > > > Date:   Mon Mar 1 12:58:44 2021 +0800
> > > > >       f2fs: check if swapfile is section-alligned
> > > > >       If the swapfile isn't created by pin and fallocate, it can'=
t be
> > > > >       guaranteed section-aligned, so it may be selected by f2fs g=
c. When
> > > > >       gc_pin_file_threshold is reached, the address of swapfile m=
ay change,
> > > > >       but won't be synchronized to swap_extent, so swap will writ=
e to wrong
> > > > >       address, which will cause data corruption.
> > > > >       Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > > > >       Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > > > >       Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > > > >       Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > The test uses fallocate to preallocate the swap file and writes zer=
os to
> > > > it. I'm not sure what pin refers to?
> > > 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block Ad=
dress)
> > > of a file is fixed after pinned. Without this operation before falloc=
ate,
> > > the LBA may not align with section(F2FS GC unit), some LBA of the fil=
e may
> > > be changed by F2FS GC in some extreme cases.
> > > =

> > > For this test case, how about pin the swap file before fallocate for =
F2FS as
> > > following:
> > > =

> > > ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);
> > No special ioctl should be needed.  f2fs_swap_activate() should pin the
> > file, just like it converts inline inodes and disables compression.
> =

> Now f2fs_swap_activate() will pin the file. The problem is that when
> f2fs_swap_activate()
> =

> is executed, the file has been created and may not be section-aligned.
> =

> So I think it would be better to consider aligning the swapfile during
> f2fs_swap_activate()?

Does it make sense to reallocate blocks like
in f2fs_swap_activate(),
	set_inode_flag(inode, FI_PIN_FILE);
	truncate_pagecache(inode, 0);
	f2fs_truncate_blocks(inode, 0, true);
	expand_inode_data();
--===============1471987026310538465==--

