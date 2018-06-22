Content-Type: multipart/mixed; boundary="===============7716241726980557597=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 13:53:00 +0200
Message-ID: <20180622115300.GA14654@lst.de>
In-Reply-To: <20180622110117.GU30522@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7716241726980557597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 12:01:17PM +0100, Al Viro wrote:
> For fuck sake, if you want vfs_poll() inlined, *make* *it* *inlined*.

That is not going to help with de-virtualizing _qproc, which was
the whole idea of that change.  At least not without a compiler
way smarter than gcc.

But if you want it inline that is fine with me, it just seems little
large for inlining.

None that I plan to actually remove all calls except for poll and select
for vfs_poll in a pending series, at which point it would become static
anyway.

> Said that, you are not attacking the worst part of it - it's a static
> branch, not the considerably more costly indirect ones.  Remember when
> I asked you about the price of those?  Method calls are costly.

And back then it did not show up even in poll heavy workloads.  But
since then something new happened - spectre mitigations, which make
indirect calls exorbitantly more expensive.

> Now, ->sk_wq is modified only in sock_init_data() and sock_graft();
> the latter, IIRC, is ->accept() helper.  Do we ever call either of
> those on a sock of already opened file?  IOW, is there any real
> reason for socket ->get_poll_head() not to be constant, other
> than wanting to keep POLL_BUSY_LOOP handling out of ->poll_mask()?
> I agree that POLL_BUSY_LOOP is ugly as hell, but you *still* have
> sock_poll_mask() not free from it...

I'd have to defer to networking folks if busy looping after pollwait
is what they want, but I suspect the answer is no, by the time
we are already waiting for the queue busy waiting seems pointless.

--===============7716241726980557597==--

