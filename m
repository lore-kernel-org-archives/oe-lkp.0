Content-Type: multipart/mixed; boundary="===============0657848364987373047=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 22:00:18 +0200
Message-ID: <20160811200018.GA28271@lst.de>
In-Reply-To: <CA+55aFzdnCDcf8nVtMTX7XiEoZVUqFahVA7kdns5aGKBWFqn3Q@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0657848364987373047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 12:51:31PM -0700, Linus Torvalds wrote:
> Ok. It does seem to also reset the active file page counts back, so
> that part did seem to be related, but yeah, from a performance
> standpoint that was clearly not a major issue.
> =

> Let's hope Dave can figure out something based on his numbers, because
> I'm out of ideas. Or maybe it's the pagefault-atomic thing that
> Christoph was looking at.

I can't really think of any reason why the pagefaul_disable() would
s=D1=96gnificantly change performance.  Anyway, the patch for the is below
(on top of the previous mark_page_accessed() one), so feel free to
re-run the test with it.  It would also be nice to see the profiles
with the two patches applied.

commit 43106eea246074acc4bb7d12fdb91f58002f52ed
Author: Christoph Hellwig <hch@lst.de>
Date:   Thu Aug 11 10:41:40 2016 -0700

    fs: remove superflous pagefault_disable from iomap_write_actor
    =

    No idea where this really came from, generic_perform_write only briefly
    did a pagefaul_disable when trying a different prefault scheme.
    =

    Signed-off-by: Christoph Hellwig <hch@lst.de>

diff --git a/fs/iomap.c b/fs/iomap.c
index f39c318..74712e2 100644
--- a/fs/iomap.c
+++ b/fs/iomap.c
@@ -194,9 +194,7 @@ again:
 		if (mapping_writably_mapped(inode->i_mapping))
 			flush_dcache_page(page);
 =

-		pagefault_disable();
 		copied =3D iov_iter_copy_from_user_atomic(page, i, offset, bytes);
-		pagefault_enable();
 =

 		flush_dcache_page(page);
=20

--===============0657848364987373047==--

