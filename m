Content-Type: multipart/mixed; boundary="===============1643781810811295902=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [LTP] [f2fs] 02eb84b96b: ltp.swapon03.fail
Date: Tue, 09 Mar 2021 04:01:44 +0000
Message-ID: <20210309040144.GH3479805@casper.infradead.org>
In-Reply-To: <c75229cc-e325-1c8b-0afa-fd236db8319c@oppo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1643781810811295902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 09, 2021 at 10:23:35AM +0800, Weichao Guo wrote:
> Hi Richard,
> =

> On 2021/3/8 19:53, Richard Palethorpe wrote:
> > Hello,
> > =

> > > kern  :err   : [  187.461914] F2FS-fs (sda1): Swapfile does not align=
 to section
> > > commit 02eb84b96bc1b382dd138bf60724edbefe77b025
> > > Author: huangjianan(a)oppo.com <huangjianan@oppo.com>
> > > Date:   Mon Mar 1 12:58:44 2021 +0800
> > >      f2fs: check if swapfile is section-alligned
> > >      If the swapfile isn't created by pin and fallocate, it can't be
> > >      guaranteed section-aligned, so it may be selected by f2fs gc. Wh=
en
> > >      gc_pin_file_threshold is reached, the address of swapfile may ch=
ange,
> > >      but won't be synchronized to swap_extent, so swap will write to =
wrong
> > >      address, which will cause data corruption.
> > >      Signed-off-by: Huang Jianan <huangjianan@oppo.com>
> > >      Signed-off-by: Guo Weichao <guoweichao@oppo.com>
> > >      Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > >      Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > The test uses fallocate to preallocate the swap file and writes zeros to
> > it. I'm not sure what pin refers to?
> =

> 'pin' refers to pinned file feature in F2FS, the LBA(Logical Block Addres=
s)
> of a file is fixed after pinned. Without this operation before fallocate,
> the LBA may not align with section(F2FS GC unit), some LBA of the file may
> be changed by F2FS GC in some extreme cases.
> =

> For this test case, how about pin the swap file before fallocate for F2FS=
 as
> following:
> =

> ioctl(fd, F2FS_IOC_SET_PIN_FILE, true);

No special ioctl should be needed.  f2fs_swap_activate() should pin the
file, just like it converts inline inodes and disables compression.
--===============1643781810811295902==--

