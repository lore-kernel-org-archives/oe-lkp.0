Content-Type: multipart/mixed; boundary="===============2626098269897836862=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 17:57:21 +0200
Message-ID: <20160811155721.GA23015@lst.de>
In-Reply-To: <CA+55aFy=xeEKgfHWisfxsZNqrgMJxvKvhrWrPmdpMxu0pnOXig@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2626098269897836862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 10, 2016 at 06:00:24PM -0700, Linus Torvalds wrote:
> The biggest difference is that we have "mark_page_accessed()" show up
> after, and not before. There was also a lot of LRU noise in the
> non-profile data. I wonder if that is the reason here: the old model
> of using generic_perform_write/block_page_mkwrite didn't mark the
> pages accessed, and now with iomap_file_buffered_write() they get
> marked as active and that screws up the LRU list, and makes us not
> flush out the dirty pages well (because they are seen as active and
> not good for writeback), and then you get bad memory use.

And that's actually a "bug" in the new code - mostly because I failed
to pick up changes to the core code happening after we 'forked' it,
in this case commit 2457ae ("mm: non-atomically mark page accessed during p=
age
cache allocation where possible").

The one liner below (not tested yet) to simply remove it should fix that
up.  I also noticed we have a spurious pagefault_disable/enable, I
need to dig into the history of that first, though.

diff --git a/fs/iomap.c b/fs/iomap.c
index 48141b8..f39c318 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -199,7 +199,6 @@ again:
 		pagefault_enable();
 =

 		flush_dcache_page(page);
-		mark_page_accessed(page);
 =

 		status =3D iomap_write_end(inode, pos, bytes, copied, page);
 		if (unlikely(status < 0))

--===============2626098269897836862==--

