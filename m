Content-Type: multipart/mixed; boundary="===============4719341777753675661=="
MIME-Version: 1.0
From: Dave Chinner <david@fromorbit.com>
To: lkp@lists.01.org
Subject: Re: [xfs] fbcc025613: -5.6% fsmark.files_per_sec
Date: Mon, 22 Feb 2016 22:22:14 +1100
Message-ID: <20160222112214.GF25832@dastard>
In-Reply-To: <20160222085409.GA19493@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4719341777753675661==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 09:54:09AM +0100, Christoph Hellwig wrote:
> On Fri, Feb 19, 2016 at 05:49:32PM +1100, Dave Chinner wrote:
> > That doesn't really seem right. The writeback should be done as a
> > single ioend, with a single completion, with a single setsize
> > transaction, adn then all the pages are marked clean sequentially.
> > The above behaviour implies we are ending up doing something like:
> > =

> > fsync proc		io completion
> > wait on page 0
> > 			end page 0 writeback
> > 			wake up page 0
> > wait on page 1
> > 			end page 1 writeback
> > 			wake up page 1
> > wait on page 2
> > 			end page 2 writeback
> > 			wake up page 2
> > =

> > Though in slightly larger batches than a single page (10 wakeups a
> > file, so batches of around 100 pages per wakeup?). i.e. the fsync
> > IO wait appears to be racing with IO completion marking pages as
> > done. I simply cannot see how the above change would cause that, as
> > it was simply a change in the IO submission code that doesn't affect
> > overall size or shape of the IOs being submitted.
> =

> Could this be the lack of blk plugs, which will cause us to complete
> too early?

No, because block plugging is still in place on the patch that the
regression is reported on. The difference it makes is that we don't
do any IO submission while building the ioend chaing, and submit it
all in one hit at the end of the ->writepages call.

However, this is an intermediate patch in the series, and later
patches correct this and we end up 4 commits later with bios being
built directly and being submitted the moment they are full. With
the entire series in place, I can't reproduce any sort of bad
behaviour, nor do I see any repeatable performance differential.

So I really want to know if this regression is seen with the entire
patchset applied, and if I can't reproduce on a local ramdisk or
real storage then we need to decide how much we care about fsync
performance on a volatile ramdisk...

Cheers,

Dave.

-- =

Dave Chinner
david(a)fromorbit.com

--===============4719341777753675661==--

