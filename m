Content-Type: multipart/mixed; boundary="===============6506912667849549438=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [xfs] 8353a814f2: kmsg.XFS(dm-#):writeback_error_on_sector
Date: Thu, 04 Jan 2018 10:55:50 +0100
Message-ID: <20180104095550.GA4396@lst.de>
In-Reply-To: <20180104055242.GD23834@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6506912667849549438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 04, 2018 at 01:52:42PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit (built with gcc-6):
> =

> commit: 8353a814f2518dcfa79a5bb77afd0e7dfa391bb1 ("xfs: open code end_buf=
fer_async_write in xfs_finish_page_writeback")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This just changed the warning from the generic buffer.c to a sligtly
different one.  Maybe we need to add it to some white list?

--===============6506912667849549438==--

