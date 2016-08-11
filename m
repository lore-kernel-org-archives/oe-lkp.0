Content-Type: multipart/mixed; boundary="===============3993109120930258363=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 13:35:00 -0700
Message-ID: <CA+55aFwPqsxBquvAdgvEgE+stgvMi4ecw26zP7Q1Xi3N6fCRwQ@mail.gmail.com>
In-Reply-To: <20160811200018.GA28271@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3993109120930258363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 1:00 PM, Christoph Hellwig <hch@lst.de> wrote:
>
> I can't really think of any reason why the pagefaul_disable() would
> s=D1=96gnificantly change performance.

No, you're right, we prefault the page anyway.

And quite frankly, looking at it, I think the pagefault_disable/enable
is actually *correct*.

The thing is, iov_iter_copy_from_user_atomic() doesn't itself enforce
non-blocking user accesses, it depends on the caller blocking page
faults.

And the reason we want to block page faults is to make sure we don't
deadlock on the page we just locked for writing.

So looking at it, I think the pagefault_disable/enable is actually
needed, and it may in fact be a bug that mm/filemap.c doesn't do that.

However, see commit 00a3d660cbac ("Revert "fs: do not prefault
sys_write() user buffer pages"") about why mm/filemap.c doesn't do the
pagefault_disable().

But depending on the prefaulting actually guaranteeing that we don't
deadlock sounds like a nasty race in theory (ie somebody does mmap
tricks in another thread in between the pre-faulting and the final
copying).

                   Linus

--===============3993109120930258363==--

