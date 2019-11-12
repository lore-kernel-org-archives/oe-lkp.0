Content-Type: multipart/mixed; boundary="===============5310086525662293926=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [LTP] [xfs] 73e5fff98b: kmsg.dev/zero:Can't_open_blockdev
Date: Tue, 12 Nov 2019 13:08:18 +0100
Message-ID: <20191112120818.GA8858@lst.de>
In-Reply-To: <1108442397.11662343.1573560143066.JavaMail.zimbra@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5310086525662293926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 12, 2019 at 07:02:23AM -0500, Jan Stancek wrote:
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/fs=
/fs_fill/fs_fill.c
> =

> Setup of that test is trying different file system types, and it looks
> at errno code of "mount -t $fs /dev/zero /mnt/$fs".
> =

> Test still PASSes. This report appears to be only about extra message in =
dmesg,
> which wasn't there before:
> =

> # mount -t xfs /dev/zero /mnt/xfs
> # dmesg -c
> [  897.177168] /dev/zero: Can't open blockdev

That message comes from fs/super.c:get_tree_bdev(), a common library
used by all block device based file systems using the new mount API.

It doesn't seem all that useful to me, but it is something we'll
need to discuss with David and Al, not the XFS maintainers.
--===============5310086525662293926==--

