Content-Type: multipart/mixed; boundary="===============1767376092766299389=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [fs] 3deb642f0d: will-it-scale.per_process_ops -8.8% regression
Date: Fri, 22 Jun 2018 12:56:13 +0100
Message-ID: <20180622115613.GV30522@ZenIV.linux.org.uk>
In-Reply-To: <20180622115300.GA14654@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============1767376092766299389==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 22, 2018 at 01:53:00PM +0200, Christoph Hellwig wrote:

> > Now, ->sk_wq is modified only in sock_init_data() and sock_graft();
> > the latter, IIRC, is ->accept() helper.  Do we ever call either of
> > those on a sock of already opened file?  IOW, is there any real
> > reason for socket ->get_poll_head() not to be constant, other
> > than wanting to keep POLL_BUSY_LOOP handling out of ->poll_mask()?
> > I agree that POLL_BUSY_LOOP is ugly as hell, but you *still* have
> > sock_poll_mask() not free from it...
> =

> I'd have to defer to networking folks if busy looping after pollwait
> is what they want, but I suspect the answer is no, by the time
> we are already waiting for the queue busy waiting seems pointless.

	So mark that in ->f_mode - I strongly suspect that
sk_can_busy_loop(sock->sk) can't change while an opened file is there.
And lift that (conditional on new FMODE_BUSY_LOOP) into do_poll()
and do_select() - we *already* have bits of pieces of that logics in
there and that way they'd at least be gathered in one place.

	Then replace ->get_poll_head() with file->f_poll_head and
see what it gives.

--===============1767376092766299389==--

