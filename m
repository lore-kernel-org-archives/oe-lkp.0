Content-Type: multipart/mixed; boundary="===============4219987168687400485=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [xfs] fbcc025613: -5.6% fsmark.files_per_sec
Date: Mon, 22 Feb 2016 09:54:09 +0100
Message-ID: <20160222085409.GA19493@lst.de>
In-Reply-To: <20160219064932.GX14668@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============4219987168687400485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2016 at 05:49:32PM +1100, Dave Chinner wrote:
> That doesn't really seem right. The writeback should be done as a
> single ioend, with a single completion, with a single setsize
> transaction, adn then all the pages are marked clean sequentially.
> The above behaviour implies we are ending up doing something like:
> =

> fsync proc		io completion
> wait on page 0
> 			end page 0 writeback
> 			wake up page 0
> wait on page 1
> 			end page 1 writeback
> 			wake up page 1
> wait on page 2
> 			end page 2 writeback
> 			wake up page 2
> =

> Though in slightly larger batches than a single page (10 wakeups a
> file, so batches of around 100 pages per wakeup?). i.e. the fsync
> IO wait appears to be racing with IO completion marking pages as
> done. I simply cannot see how the above change would cause that, as
> it was simply a change in the IO submission code that doesn't affect
> overall size or shape of the IOs being submitted.

Could this be the lack of blk plugs, which will cause us to complete
too early?

--===============4219987168687400485==--

